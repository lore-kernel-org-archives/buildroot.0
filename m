From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Oct 2014 00:30:23 +0200
Subject: [Buildroot] [PATCH buildroot-test 8/8] autobuild-run: add
 support for custom git wrapper
In-Reply-To: <1413486964-5183-8-git-send-email-patrickdepinguin@gmail.com>
References: <1413486964-5183-1-git-send-email-patrickdepinguin@gmail.com>
 <1413486964-5183-8-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20141017223023.GA7944@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-16 21:16 +0200, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> In corporate environments, there may be no direct git access, and a
> wrapper program that sets a proxy may be needed. See [1] for an example
> solution.
> 
> This patch to autobuild-run provides a --git argument that can be used
> to set the path to such a git wrapper. By default, the argument is plain
> 'git'.
> 
> [1] http://gitolite.com/git-over-proxy.html

You know you can make this stick, right?

    git config --global --add core.gitproxy /path/to/git-proxy-command

And then you're done once and for all. ;-)

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  scripts/autobuild-run | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index ceed0ae..42441d0 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -74,6 +74,9 @@ Options:
>                                   only)
>    --make-opts OPTSTRING          string of extra options to pass to Buildroot
>                                   make, such as specific command wrappers
> +  --git GITCMD                   path to git program (possibly a wrapper) used
> +                                 to clone the Buildroot repository
> +                                 [default: git]
>    -c, --config CONFIG            path to configuration file
>  
>  Format of the configuration file:
> @@ -224,7 +227,7 @@ def prepare_build(**kwargs):
>      # didn't exist already.
>      srcdir = os.path.join(idir, "buildroot")
>      if not os.path.exists(srcdir):
> -        ret = subprocess.call(["git", "clone", "git://git.busybox.net/buildroot", srcdir],
> +        ret = subprocess.call([kwargs['git'], "clone", "git://git.busybox.net/buildroot", srcdir],
>                                stdout=log, stderr=log)
>          if ret != 0:
>              log_write(log, "ERROR: could not clone Buildroot sources")
> @@ -232,7 +235,7 @@ def prepare_build(**kwargs):
>  
>      # Update the Buildroot sources.
>      abssrcdir = os.path.abspath(srcdir)
> -    ret = subprocess.call(["git", "pull"], cwd=srcdir, stdout=log, stderr=log)
> +    ret = subprocess.call([kwargs['git'], "pull"], cwd=srcdir, stdout=log, stderr=log)
>      if ret != 0:
>          log_write(log, "ERROR: could not pull Buildroot sources")
>          return -1
> @@ -475,8 +478,8 @@ def send_results(result, **kwargs):
>          shutil.copyfile(os.path.join(outputdir, "legal-info", "manifest.csv"),
>                          os.path.join(resultdir, "licenses-manifest.csv"))
>  
> -    subprocess.call(["git log master -n 1 --pretty=format:%%H > %s" % \
> -                     os.path.join(resultdir, "gitid")],
> +    subprocess.call(["%s log master -n 1 --pretty=format:%%H > %s" % \
> +                     (kwargs['git'], os.path.join(resultdir, "gitid"))],
>                      shell=True, cwd=srcdir)
>      subprocess.call(["tail -500 %s > %s" % \
>                       (os.path.join(outputdir, "logfile"), os.path.join(resultdir, "build-end.log"))],
> @@ -610,7 +613,7 @@ def main():
>          p = Process(target=run_instance, kwargs={
>              'instance': i, 'njobs': args['--njobs'], 'sysinfo': sysinfo,
>              'http_login': args['--http-login'],
> -            'http_password': args['--http-password'],
> +            'http_password': args['--http-password'], 'git': args['--git'],
>              'submitter': args['--submitter'], 'make_opts': args['--make-opts']})
>          p.start()
>          processes.append(p)
> -- 
> 1.8.5.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
