From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 May 2016 16:02:17 +0200
Subject: [Buildroot] [PATCH 2/4] toolchain: add bfin support
In-Reply-To: <20160508090242.GA32305@waldemar-brodkorb.de>
References: <20160508090242.GA32305@waldemar-brodkorb.de>
Message-ID: <20160508160217.77aceed3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 8 May 2016 11:02:42 +0200, Waldemar Brodkorb wrote:

> diff --git a/package/gcc/6.1.0/892-disable-dwarf-bfin.patch.conditional b/package/gcc/6.1.0/892-disable-dwarf-bfin.patch.conditional
> new file mode 100644
> index 0000000..f63ec24
> --- /dev/null
> +++ b/package/gcc/6.1.0/892-disable-dwarf-bfin.patch.conditional
> @@ -0,0 +1,19 @@
> +Dwarf support does not compile
> +
> +Reported upstream:
> +https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68468
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +
> +diff -Nur gcc-6.1.0.orig/libgcc/config.host gcc-6.1.0/libgcc/config.host
> +--- gcc-6.1.0.orig/libgcc/config.host	2016-02-26 21:02:28.000000000 +0100
> ++++ gcc-6.1.0/libgcc/config.host	2016-04-30 20:49:06.542101273 +0200
> +@@ -231,7 +231,7 @@
> +   esac
> +   ;;
> + *-*-linux* | frv-*-*linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu | *-*-gnu* | *-*-kopensolaris*-gnu)
> +-  tmake_file="$tmake_file t-crtstuff-pic t-libgcc-pic t-eh-dw2-dip t-slibgcc t-slibgcc-gld t-slibgcc-elf-ver t-linux"
> ++  tmake_file="$tmake_file t-crtstuff-pic t-libgcc-pic t-slibgcc t-slibgcc-gld t-slibgcc-elf-ver t-linux"

I hate conditional patches. Could we make this patch non-conditional by
doing instead something like:

bfin-*-linux*)
tmake_file="$tmake_file t-crtstuff-pic t-libgcc-pic t-slibgcc t-slibgcc-gld t-slibgcc-elf-ver t-linux"
;;

or something along those lines?


> +# for Blackfin you can't use --with-cpu
> +ifeq ($BR2_bfin),)
>  ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
>  ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
>  HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
> @@ -196,6 +206,7 @@ else
>  HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU))
>  endif
>  endif
> +endif

This will break Blackfin external toolchains, since
BR2_GCC_TARGET_CPU_REVISION was added specifically for Blackfin! It is
the only architecture that specifies a value for this variable.

See commit 66d41890ec2b76189bcd427a0cc3966ff56f9712.

If you don't want any --with-cpu option to be passed, then
BR2_GCC_TARGET_CPU should be empty. But again, how will this play with
Blackfin external toolchains?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
