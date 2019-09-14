From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 14 Sep 2019 19:05:47 +0200
Subject: [Buildroot] [PATCH buildroot-test] scripts/autobuild-run:
 calculate dldir as an absolute path
In-Reply-To: <20190914133518.19604-1-thomas.petazzoni@bootlin.com>
References: <20190914133518.19604-1-thomas.petazzoni@bootlin.com>
Message-ID: <3d5cabd8-e401-458e-8973-f63966106786@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/09/2019 15:35, Thomas Petazzoni wrote:
> Right now, self.dldir is a relative path, equal to
> "instance-X/dl". Then, the Buildroot build is executed with
> BR2_DL_DIR=self.dldir, which means that self.dldir is interpreted
> relatively to the Buildroot source directory.
> 
> Due to this, we get the following directory organization:
> 
>  instance-0
>   + buildroot
>     + instance-0
>       + dl
>   + instance.log
>   + output
> 
> Instead of the excepted organization:
> 
>  instance-0
>  + buildroot
>  + dl
>  + instance.log
>  + output
> 
> We fix this issue (which was introduced when the Builder class was
> created) by making self.dldir an absolute path.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  scripts/autobuild-run | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index ead81a0..7e3c7a0 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -270,7 +270,7 @@ class Builder:
>          # frequently needed directories
>          self.idir = "instance-%d" % self.instance
>          self.srcdir = os.path.join(self.idir, "buildroot")
> -        self.dldir = os.path.join(self.idir, "dl")
> +        self.dldir = os.path.abspath(os.path.join(self.idir, "dl"))
>          # We need the absolute path to use with O=, because the relative
>          # path to the output directory here is not relative to the
>          # Buildroot sources, but to the location of the autobuilder
> 
