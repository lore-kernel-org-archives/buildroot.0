From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 17 Jul 2017 21:45:37 -0500
Subject: [Buildroot] [PATCH] autobuild-run: add --repo option
In-Reply-To: <20170717212859.12581-1-arnout@mind.be>
References: <20170717212859.12581-1-arnout@mind.be>
Message-ID: <CANQCQpYxLkzMU_GA_-YV90F9R06pkQb30zOLjf1UdwaJQ4GpuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Mon, Jul 17, 2017 at 4:28 PM, Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
> This option allows to specify which Buildroot git repository to clone.
> This can be useful in several situations:
> - to use a different mirror in case you don't have a good connection to
>   github;
> - for debugging this script;
> - to point to a local, patched repository you want to test.
>
> Note that the clone/pull will use the currently checked out branch of
> the repository if it is non-bare, which is ideal for testing.
>
> Since switching repositories may also switch branches, we use a git
> fetch/checkout sequence instead of doing a git pull. With git pull, the
> branches would be merged instead of switched. To avoid polluting the
> log with the long git message about a detached head, while still
> getting some useful output from git, pass the --detach option to
> git checkout.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I carry some local changes for tailoring the repo for similar reasons
(I while back I submitted something similar before the input parsing
was cleaned up).  What do you think about also making it a config file
option?

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

> ---
> Ideally the contents of this commit message would be put somewhere as
> documentation, but I couldn't find a good spot for it.
> ---
>  scripts/autobuild-run | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index a7d7d4f..523e382 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -68,6 +68,7 @@ defaults = {
>      '--pid-file': '/tmp/buildroot-autobuild.pid',
>      '--http-url': 'http://autobuild.buildroot.org/submit/',
>      '--toolchains-url': 'http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv',
> +    '--repo': 'https://github.com/buildroot/buildroot.git',
>  }
>
>  doc = """autobuild-run - run Buildroot autobuilder
> @@ -103,6 +104,8 @@ Options:
>                                   Not set by default.
>    -d, --debug                    Send log output to stdout instead of log file
>    --toolchains-url URL           URL of toolchain configuration file
> +  -r, --repo URL                 URL of Buildroot repository to clone
> +                                 Defaults to %(--repo)s
>
>  Format of the configuration file:
>
> @@ -329,7 +332,7 @@ def prepare_build(**kwargs):
>      # didn't exist already.
>      srcdir = os.path.join(idir, "buildroot")
>      if not os.path.exists(srcdir):
> -        ret = subprocess.call(["git", "clone", "https://github.com/buildroot/buildroot.git", srcdir],
> +        ret = subprocess.call(["git", "clone", kwargs['repo'], srcdir],
>                                stdout=log, stderr=log)
>          if ret != 0:
>              log_write(log, "ERROR: could not clone Buildroot sources")
> @@ -337,9 +340,14 @@ def prepare_build(**kwargs):
>
>      # Update the Buildroot sources.
>      abssrcdir = os.path.abspath(srcdir)
> -    ret = subprocess.call(["git", "pull"], cwd=abssrcdir, stdout=log, stderr=log)
> +    ret = subprocess.call(["git", "fetch", kwargs['repo']], cwd=abssrcdir, stdout=log, stderr=log)
>      if ret != 0:
> -        log_write(log, "ERROR: could not pull Buildroot sources")
> +        log_write(log, "ERROR: could not fetch Buildroot sources")
> +        return -1
> +
> +    ret = subprocess.call(["git", "checkout", "--detach", "FETCH_HEAD"], cwd=abssrcdir, stdout=log, stderr=log)
> +    if ret != 0:
> +        log_write(log, "ERROR: could not check out Buildroot sources")
>          return -1
>
>      # Create an empty output directory. We remove it first, in case a previous build was aborted.
> @@ -948,6 +956,7 @@ def main():
>                  make_opts = (args['--make-opts'] or ''),
>                  nice = (args['--nice'] or 0),
>                  toolchains_url = args['--toolchains-url'],
> +                repo = args['--repo'],
>                  upload = upload,
>                  buildpid = buildpid,
>                  debug = args['--debug']
> --
> 2.13.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
