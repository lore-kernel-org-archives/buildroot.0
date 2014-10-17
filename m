From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Date: Fri, 17 Oct 2014 12:46:53 +0200
Subject: [Buildroot] [PATCH buildroot-test 5/8] autobuild-run: add
 option --make-opts for custom Buildroot options
In-Reply-To: <1413486964-5183-5-git-send-email-patrickdepinguin@gmail.com>
References: <1413486964-5183-1-git-send-email-patrickdepinguin@gmail.com>
 <1413486964-5183-5-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <CAAXf6LXRZxsdTOj=AjAxkoLdc1YL_TX3h=iVwnKwX4+Cr-2u4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 16, 2014 at 9:16 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> In some environments, the Buildroot configuration may need minor
> tweaking. For example, in corporate environments behind a firewall,
> direct git access (as required by some packages) may not be possible. A
> git wrapper may be needed, which is normally configured through the
> BR2_GIT configuration option.
>
> Since these tweaks are very environment-specific, they should not be
> part of the configuration file itself. Otherwise, other people trying to
> reproduce the build in another environment will see builds failing due
> to other reasons, for example the git wrapper not being found.
>
> This commit provides a new configuration option 'make-opts', passable as
> argument or in the config file, that accepts a string of make options to
> pass to the Buildroot make command. For example:
>     --make-opts="BR2_GIT=git-wrapper BR2_svn=svn-wrapper"
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  scripts/autobuild-run | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 170cfe3..57654de 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -72,6 +72,8 @@ Options:
>                                   reasons it is recommended to define this in the
>                                   config file instead, with user-read permissions
>                                   only)
> +  --make-opts OPTSTRING          string of extra options to pass to Buildroot
> +                                 make, such as specific command wrappers
>    -c, --config CONFIG            path to configuration file
>
>  Format of the configuration file:
> @@ -406,7 +408,7 @@ def gen_config(instance, log, sysinfo):
>
>      return 0
>
> -def do_build(instance, njobs, log):
> +def do_build(instance, njobs, log, make_opts):
>      """Run the build itself"""
>
>      idir = "instance-%d" % instance
> @@ -419,8 +421,10 @@ def do_build(instance, njobs, log):
>      srcdir = os.path.join(idir, "buildroot")
>      f = open(os.path.join(outputdir, "logfile"), "w+")
>      log_write(log, "INFO: build started")
> -    ret = subprocess.call(["timeout", str(MAX_DURATION), "make", "O=%s" % outputdir, "-C", srcdir,
> -                           "BR2_DL_DIR=%s" % dldir, "BR2_JLEVEL=%s" % njobs], stdout=f, stderr=f)
> +    cmd = ["timeout", str(MAX_DURATION), "make", "O=%s" % outputdir,
> +            "-C", srcdir, "BR2_DL_DIR=%s" % dldir, "BR2_JLEVEL=%s" % njobs] \
> +          + make_opts.split()

This line currently fails if no make opts are provided, will fix.

Best regards,
Thomas
