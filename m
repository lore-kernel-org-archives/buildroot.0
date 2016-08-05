From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 22:43:42 +0200
Subject: [Buildroot] [RFC][PATCH] bfin: fix two issues with internal
 toolchain
In-Reply-To: <20160805195247.GA11252@waldemar-brodkorb.de>
References: <20160805195247.GA11252@waldemar-brodkorb.de>
Message-ID: <20160805224342.1972c673@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 5 Aug 2016 21:52:47 +0200, Waldemar Brodkorb wrote:

> And libgcc_s.so.1 provides it:
> ./output/host/usr/bin/bfin-buildroot-linux-uclibc-nm
> ./output/host/usr/bfin-buildroot-linux-uclibc/sysroot/lib/libgcc_s.so.1|grep
> _Unwind_GetRegionStart                         
> 00005d0c t __Unwind_GetRegionStart

We are currently discussing it on IRC, but I believe the problem is
that "t" indicates that the symbol is not visible. It should be a "T".

> diff --git a/package/gcc/6.1.0/892-fix-dwarf-fdpic.patch b/package/gcc/6.1.0/892-fix-dwarf-fdpic.patch
> new file mode 100644
> index 0000000..315b406
> --- /dev/null
> +++ b/package/gcc/6.1.0/892-fix-dwarf-fdpic.patch
> @@ -0,0 +1,37 @@
> +Fix DWARF compilation for FDPIC targets
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +
> +diff -Nur gcc-6.1.0.orig/libgcc/unwind-dw2-fde-dip.c gcc-6.1.0/libgcc/unwind-dw2-fde-dip.c
> +--- gcc-6.1.0.orig/libgcc/unwind-dw2-fde-dip.c	2016-01-04 15:30:50.000000000 +0100
> ++++ gcc-6.1.0/libgcc/unwind-dw2-fde-dip.c	2016-08-05 02:17:40.424195128 +0200
> +@@ -124,7 +124,11 @@
> + {
> +   _Unwind_Ptr pc_low;
> +   _Unwind_Ptr pc_high;
> ++#if defined __FRV_FDPIC__ || defined __BFIN_FDPIC__
> ++  struct elf32_fdpic_loadaddr load_base;
> ++#else

I'm surprised by this part of the patch, since you are changing the
behavior for __FRV_FDPIC__ as well. It wasn't working before?

In all other chunks you simply add __BFIN_FDPIC__ as behaving the same
as __FRV_FDPIC__ but you're not doing the same here. Is this expected?

> ++#if defined __FRV_FDPIC__ || defined __BFIN_FDPIC__

Obvious question: is there a symbol that says "I'm using FDPIC" and
which would make such conditions simpler?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
