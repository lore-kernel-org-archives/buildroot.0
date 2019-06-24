From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Jun 2019 23:35:51 +0200
Subject: [Buildroot] [PATCH 04/19] autobuild-run: move sysinfo from
 kwargs to Builder class
In-Reply-To: <20190621084730.16411-4-itsatharva@gmail.com>
References: <20190621084730.16411-1-itsatharva@gmail.com>
 <20190621084730.16411-4-itsatharva@gmail.com>
Message-ID: <37c48663-5a67-deca-f3c2-1b90fa367acf@mind.be>
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
>  scripts/autobuild-run | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 82b8f45..22452cf 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -271,9 +271,10 @@ class SystemInfo:
>          return not missing_requirements
>  
>  class Builder:
> -    def __init__(self, instance, njobs):
> +    def __init__(self, instance, njobs, sysinfo):
>          self.instance = instance
>          self.njobs = njobs
> +        self.sysinfo = sysinfo
>  
>      def prepare_build(self, **kwargs):
>          """Prepare for the next build of the specified instance
> @@ -416,7 +417,7 @@ class Builder:
>          build_2_image = os.path.join(outputdir, "images", "rootfs.tar")
>  
>          with open(reproducible_results, 'w') as diff:
> -            if kwargs['sysinfo'].has("diffoscope"):
> +            if self.sysinfo.has("diffoscope"):
>                  # Prefix to point diffoscope towards cross-tools
>                  prefix = subprocess.check_output(["make", "O=%s" % outputdir, "-C", srcdir, "printvars", "VARS=TARGET_CROSS"])
>                  # Remove TARGET_CROSS= and \n from the string
> @@ -844,9 +845,8 @@ def main():
>      buildpid = multiprocessing.Array('i', int(args['--ninstances']))
>      processes = []
>      for i in range(0, int(args['--ninstances'])):
> -        builder = Builder(i, args['--njobs'])
> +        builder = Builder(i, args['--njobs'], sysinfo)
>          p = multiprocessing.Process(target=builder.run_instance, kwargs=dict(
> -                sysinfo = sysinfo,
>                  http_url = args['--http-url'],
>                  http_login = args['--http-login'],
>                  http_password = args['--http-password'],
> 
