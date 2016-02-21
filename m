From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 15:37:09 +0100
Subject: [Buildroot] [PATCH v3] Update libaio to 0.3.110
In-Reply-To: <1455824391-23524-1-git-send-email-alistair.francis@xilinx.com>
References: <1455824391-23524-1-git-send-email-alistair.francis@xilinx.com>
Message-ID: <20160221153709.1bfa1230@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alistair,

Thanks for the patch!

On Thu, 18 Feb 2016 11:39:51 -0800, Alistair Francis wrote:
> Update libaio from 0.3.108 to 0.3.110. This adds AArch64 support.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>  package/libaio/0001-arches.patch | 454 ++-------------------------------------
>  package/libaio/Config.in         |   2 +-
>  package/libaio/libaio.hash       |   4 +-
>  package/libaio/libaio.mk         |   2 +-
>  4 files changed, 20 insertions(+), 442 deletions(-)

It took me a bit of time to understand why we can reduce the patch to
just MIPS definitions. Indeed, in the patch, there are some m68k and
PA-RISC definitions which we don't really care about since we don't
support those architectures. However, the SPARC definitions we do care
about. But in fact, they have been merged upstream. It would have been
good to add such explanations in the commit log, to ease review. I've
adjusted the commit log to make this explicit.

Another comment is that the title should always be:

	<package>: <what happens>

i.e something like:

	libaio: bump to version 0.3.110


> +The patch adds MIPS specific definitions (syscall number and macros).

Vicente, can you work with libaio upstream to get the MIPS specific
definitions merged? Maybe this should also be enabled on
mips64/mips64el.

> diff --git a/package/libaio/Config.in b/package/libaio/Config.in
> index cc44cb6..63db829 100644
> --- a/package/libaio/Config.in
> +++ b/package/libaio/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
>  	bool
>  	default y if BR2_arm || BR2_armeb || BR2_i386 || \
>  		BR2_m68k || BR2_mips || BR2_mipsel || BR2_powerpc || \
> -		BR2_sparc || BR2_x86_64
> +		BR2_sparc || BR2_x86_64 || BR2_aarch64

I've changed this to keep the alphabetic ordering, and applied your
patch to our next branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
