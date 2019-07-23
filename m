From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 23 Jul 2019 11:55:55 -0500
Subject: [Buildroot] [PATCH v2 2/5] support/scripts/pkg-stats: retrieve
 packages latest version using processes
In-Reply-To: <20190719143556.14907-3-victor.huesca@bootlin.com>
References: <20190719143556.14907-1-victor.huesca@bootlin.com>
 <20190719143556.14907-3-victor.huesca@bootlin.com>
Message-ID: <CANQCQpbr_PyT7X4KbBcKQ7EZVqbarD-aScH346+qVUCHpor0qA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Victor,

On Fri, Jul 19, 2019 at 9:36 AM Victor Huesca <victor.huesca@bootlin.com> wrote:
>
> The major bottleneck in pkg-stats is the time spent waiting for answer
> from distant servers. Two functions involve such communications with
> remote servers are:
> - 'check_package_urls' which check that package website are up, it
>   is efficient do to the use of process-pools thanks to Matt Weber.
> - 'check_package_latest_version' which fetch the latest package version
>   from release-monitoring, it uses a http-pool but run sequentially.
>
> This patch extends the use of process-pools to 'check_latest_version'.
> This implementation rely on the apply_async's callback to allow
> per-package progress feedback. To simplify this feedback creation, this
> patch introduce the following functions:
> - 'apply_async': this function simply wrap the Pool's method of the same
> in order to pass additional arguments to the callback. In particular it
> is used to print the package name in the feedback message.
> - 'progress_callback': this function ease the definition of "progress
> feedback function": it create a callable that will keep track of how
> many time it has been called and print a custom message.
>
> Also change the behaviour of print for python 2 to be a function instead
> of a statement, allowing to use it in lambdas.
>
> Runtimes for this function are ~3m vs ~25m for the linear version.
> Tested on an i7 7500U (2/4 cores/threads @3.5GHz) with 15ms ping.
>
> Note: There have already been work trying to parallelize this function
> using threads but there were a failure on some configurations [1].
> This implementation rely on a dedicated module already in use on this
> script, so it's unlikely to see failure with this version.
>
> [1] http://lists.busybox.net/pipermail/buildroot/2018-March/215368.html
>
> Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

> ---
>  support/scripts/pkg-stats | 64 +++++++++++++++++++++++++++++++--------
>  1 file changed, 52 insertions(+), 12 deletions(-)
>
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 77819c4804..08730b8d43 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -16,6 +16,7 @@
>  # along with this program; if not, write to the Free Software
>  # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
>
> +from __future__ import print_function
>  import argparse
>  import datetime
>  import fnmatch
> @@ -159,6 +160,37 @@ class Package:
>              (self.name, self.path, self.has_license, self.has_license_files, self.has_hash, self.patch_count)
>
>
> +class progress_callback:
> +    def __init__(self, progress_fn, start=0, end=100):
> +        '''
> +        Create a callback 'function' which purpose is to display a progress message.
> +
> +        :param progress_fn: must take at least 2 arguments representing the current step
> +        and the 'end' step.
> +        :param start: First step.
> +        :param end: Last step.
> +        '''
> +        self._progress_fn = progress_fn
> +        self._cpt = start
> +        self._end = end
> +
> +    def __call__(self, *args):
> +        '''
> +        Calls progress_fn.
> +        '''
> +        self._progress_fn(self._cpt, self._end, *args)
> +        self._cpt += 1
> +
> +
> +def apply_async(pool, func, args=(), kwds={}, callback=None, cb_args=(), cb_kwds={}):
> +    '''
> +    Wrapper around `pool.apply_async()` to allow passing arguments to the callback
> +    '''
> +    _func = lambda: func(*args, **kwds)
> +    _cb = lambda res: callback(res, *cb_args, **cb_kwds)
> +    return pool.apply_async(_func, callback=_cb)
> +
> +
>  def get_pkglist(npackages, package_list):
>      """
>      Builds the list of Buildroot packages, returning a list of Package
> @@ -345,6 +377,14 @@ def release_monitoring_get_latest_version_by_guess(pool, name):
>      return (RM_API_STATUS_NOT_FOUND, None, None)
>
>
> +def check_package_latest_version_worker(pool, name):
> +    """Wrapper to try both by name then by guess"""
> +    res = release_monitoring_get_latest_version_by_distro(pool, name)
> +    if res[0] == RM_API_STATUS_NOT_FOUND:
> +        res = release_monitoring_get_latest_version_by_guess(pool, name)
> +    return res
> +
> +
>  def check_package_latest_version(packages):
>      """
>      Fills in the .latest_version field of all Package objects
> @@ -360,18 +400,18 @@ def check_package_latest_version(packages):
>      - id: string containing the id of the project corresponding to this
>        package, as known by release-monitoring.org
>      """
> -    pool = HTTPSConnectionPool('release-monitoring.org', port=443,
> -                               cert_reqs='CERT_REQUIRED', ca_certs=certifi.where(),
> -                               timeout=30)
> -    count = 0
> -    for pkg in packages:
> -        v = release_monitoring_get_latest_version_by_distro(pool, pkg.name)
> -        if v[0] == RM_API_STATUS_NOT_FOUND:
> -            v = release_monitoring_get_latest_version_by_guess(pool, pkg.name)
> -
> -        pkg.latest_version = v
> -        print("[%d/%d] Package %s" % (count, len(packages), pkg.name))
> -        count += 1
> +    http_pool = HTTPSConnectionPool('release-monitoring.org', port=443,
> +                                    cert_reqs='CERT_REQUIRED', ca_certs=certifi.where(),
> +                                    timeout=30)

I had originally set the timeout above 5sec because of my network
architecture (proxy's, etc).  Hopefully we never hit the 30sec because
of the standard protocol timeouts :-)

> +    worker_pool = Pool(processes=64)
> +    cb = progress_callback(
> +        lambda i, n, (status, ver, id), name:
> +            print("[%d/%d] (version) Package %s: %s" % (i, n, name, id)),
> +        1, len(packages))
> +    results = [apply_async(worker_pool, check_package_latest_version_worker, (http_pool, pkg.name),
> +                           callback=cb, cb_args=(pkg.name,)) for pkg in packages]
> +    for pkg, r in zip(packages, results):
> +        pkg.latest_version = r.get()
>
>
>  def calculate_stats(packages):
> --
> 2.21.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
