From: Andreas Kuehn <Andreas.Kuehn@gin.de>
Date: Wed, 11 Jun 2008 17:08:24 +0200
Subject: [Buildroot] kernel image size depends on toolchain? -Solved-
In-Reply-To: <87fxrkjcp8.fsf@macbook.be.48ers.dk>
References: <484F8157.2050902@gin.de>
	<87hcc0pfrr.fsf@macbook.be.48ers.dk>	<484F8F05.2040105@gin.de>
	<87lk1cmi7d.fsf@macbook.be.48ers.dk>	<484FA6F4.5010408@gin.de>
	<87k5gwkz31.fsf@macbook.be.48ers.dk>	<484FCC7B.4090704@gin.de>
	<87fxrkjcp8.fsf@macbook.be.48ers.dk>
Message-ID: <484FEA68.2060507@gin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter!

	Strike!

Created:      Wed Jun 11 16:51:42 2008
Image Type:   ARM Linux Kernel Image (uncompressed)
Data Size:    1402212 Bytes = 1369.35 kB = 1.34 MB  <--<< Groovy !

You were right, that patch was missing.
Really great support.
Thank you
	akuehn  :-)




Peter Korsgaard wrote:
>>>>>> "Andreas" == Andreas Kuehn <Andreas.Kuehn@gin.de> writes:
> 
> Hi,
> 
>  Andreas> Right from the .config file....
>  Andreas> BR2_BINUTILS_VERSION="2.18"
>  Andreas> BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
> 
>  Andreas> I suppose version 2.18 is the "old" version?  Meanwhile, I
>  Andreas> changed to version 2.18.50.0.1 and did a complete rebuild
>  Andreas> with a well known result:
> 
>  Andreas> Image Type:   ARM Linux Kernel Image (uncompressed)
>  Andreas> Data Size:    4528100 Bytes = 4421.97 kB = 4.32 MB
> 
>  Andreas> I don't know where that commit you mentioned has gone to
>  Andreas> (where does that 1e621a8e3752367d4aae78a8ab00a18fb2793f34
>  Andreas> belong to). Is it the kernel tree or the binutils and
>  Andreas> finally which version?
> 
> It's from the kernel git tree. It's a simple oneliner, you could maybe
> patch it by hand in your Linux checkout:
> 
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index fa4ea9f..6c2d539 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -12,7 +12,7 @@
>  
>  LDFLAGS_vmlinux        :=-p --no-undefined -X
>  CPPFLAGS_vmlinux.lds = -DTEXT_OFFSET=$(TEXT_OFFSET)
> -OBJCOPYFLAGS   :=-O binary -R .note -R .comment -S
> +OBJCOPYFLAGS   :=-O binary -R .note -R .note.gnu.build-id -R .comment -S
>  GZFLAGS                :=-9
>  #CFLAGS                +=-pipe
>  # Explicitly specifiy 32-bit ARM ISA since toolchain default can be -mthumb:
> 
