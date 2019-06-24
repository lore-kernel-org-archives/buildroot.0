From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Jun 2019 23:36:47 +0200
Subject: [Buildroot] [PATCH 05/19] autobuild-run: move http variables
 from kwargs to Builder class
In-Reply-To: <20190621084730.16411-5-itsatharva@gmail.com>
References: <20190621084730.16411-1-itsatharva@gmail.com>
 <20190621084730.16411-5-itsatharva@gmail.com>
Message-ID: <0d7ca9dc-6f3e-35e5-017a-51f39eeea50e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/06/2019 10:47, Atharva Lele wrote:
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  scripts/autobuild-run | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 22452cf..03c54a9 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -271,10 +271,14 @@ class SystemInfo:
>          return not missing_requirements
>  
>  class Builder:
> -    def __init__(self, instance, njobs, sysinfo):
> +    def __init__(self, instance, njobs, sysinfo,
> +                 http_url, http_login, http_password):
>          self.instance = instance
>          self.njobs = njobs
>          self.sysinfo = sysinfo
> +        self.http_url = http_url
> +        self.http_login = http_login
> +        self.http_password = http_password
>  
>      def prepare_build(self, **kwargs):
>          """Prepare for the next build of the specified instance
> @@ -681,11 +685,11 @@ class Builder:
>              # none of the ones that are part of the standard library can
>              # upload a file without writing dozens of lines of code.
>              ret = subprocess.call(["curl", "-u",
> -                                "%s:%s" % (kwargs['http_login'], kwargs['http_password']),
> +                                "%s:%s" % (self.http_login, self.http_password),
>                                  "-H", "Expect:",
>                                  "-F", "uploadedfile=@%s" % os.path.join(outputdir, "results.tar.bz2"),
>                                  "-F", "uploadsubmit=1",
> -                                kwargs['http_url']],
> +                                self.http_url],
>                                  stdout=log, stderr=log)
>              if ret != 0:
>                  log_write(log, "INFO: results could not be submitted, %d" % ret)
> @@ -845,11 +849,9 @@ def main():
>      buildpid = multiprocessing.Array('i', int(args['--ninstances']))
>      processes = []
>      for i in range(0, int(args['--ninstances'])):
> -        builder = Builder(i, args['--njobs'], sysinfo)
> +        builder = Builder(i, args['--njobs'], sysinfo, args['--http-url'],
> +                          args['--http-login'], args['--http-password'])
>          p = multiprocessing.Process(target=builder.run_instance, kwargs=dict(
> -                http_url = args['--http-url'],
> -                http_login = args['--http-login'],
> -                http_password = args['--http-password'],
>                  submitter = args['--submitter'],
>                  make_opts = (args['--make-opts'] or ''),
>                  nice = (args['--nice'] or 0),
> 
