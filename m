From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Nov 2015 18:08:33 +0100
Subject: [Buildroot] [PATCH] [autobuild] autobuild: add config option to
	set niceness
In-Reply-To: <1448403978-22104-1-git-send-email-yann.morin.1998@free.fr>
References: <1448403978-22104-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151125170833.GA3987@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-11-24 23:26 +0100, Yann E. MORIN spake thusly:
> When the machine running the autobuilder is shared, it is important
> that the autobuilder instances do not hog all of the CPU.
> 
> Add an option to the configuration, so that the user can set the
> niceness to run the instances with. By default, the niceness is 0,
> which means the current niceness.
> 
> Properly doing so would require setting up a container with proper
> CPU cgroup, but it's a bit complicated.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Forget about that one, I'll submit an updated version later tonight,
with the docopt help fixed with the real default value, like isdone for
the other default values.

Regards,
Yann E. MORIN.

> ---
>  scripts/autobuild-run | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 76b7201..fb48950 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -64,6 +64,7 @@ defaults = {
>      '--njobs': '1',
>      '--submitter': 'N/A',
>      '--make-opts': '',
> +    '--nice': 0,
>  }
>  
>  doc = """autobuild-run - run Buildroot autobuilder
> @@ -77,6 +78,8 @@ Options:
>                                   Defaults to %(--ninstances)s.
>    -j, --njobs NJOBS              number of parallel jobs
>                                   Defaults to %(--njobs)s.
> +  --nice N                       Niceness, positive number
> +                                 No default.
>    -s, --submitter SUBMITTER      name/machine of submitter
>                                   Defaults to %(--submitter)s.
>    --http-login LOGIN             username to send results with
> @@ -101,6 +104,7 @@ Format of the configuration file:
>     [main]
>     ninstances = <value>
>     njobs = <value>
> +   nice = <value>
>     http-login = <value>
>     http-password = <value>
>     submitter = <value>
> @@ -540,6 +544,7 @@ def do_build(**kwargs):
>  
>      idir = "instance-%d" % kwargs['instance']
>      log = kwargs['log']
> +    nice = kwargs['nice']
>  
>      # We need the absolute path to use with O=, because the relative
>      # path to the output directory here is not relative to the
> @@ -551,7 +556,9 @@ def do_build(**kwargs):
>      f = open(os.path.join(outputdir, "logfile"), "w+")
>      log_write(log, "INFO: build started")
>  
> -    cmd = ["timeout", str(MAX_DURATION), "make", "O=%s" % outputdir,
> +    cmd = ["timeout", str(MAX_DURATION),
> +            "nice", "-n", nice,
> +            "make", "O=%s" % outputdir,
>              "-C", srcdir, "BR2_DL_DIR=%s" % dldir,
>              "BR2_JLEVEL=%s" % kwargs['njobs']] \
>            + kwargs['make_opts'].split()
> @@ -851,6 +858,7 @@ def main():
>                  http_password = args['--http-password'],
>                  submitter = args['--submitter'],
>                  make_opts = (args['--make-opts'] or ''),
> +                nice = (args['--nice'] or 0),
>                  upload = upload,
>                  buildpid = buildpid
>              ))
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
