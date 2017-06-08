From: Guy Benyei <guybe@mellanox.com>
Date: Thu, 8 Jun 2017 11:43:57 +0000
Subject: [Buildroot] [PATCH]Libssp support
In-Reply-To: <20170607201316.jkzcuamoovnbkcla@tarshish>
References: <AM3PR05MB433972636565D3B639BB0BAC9C80@AM3PR05MB433.eurprd05.prod.outlook.com>
 <20170607201316.jkzcuamoovnbkcla@tarshish>
Message-ID: <AM3PR05MB433D9ACAA63A9ED51BBFF7EC9C90@AM3PR05MB433.eurprd05.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,
The code I'm trying to build is not part of the buildroot package - it's a sample program I tried to compile to test the availability of the SSP feature in the GCC built by buildroot (arc/nps400 target). This feature is supported by GCC, pretty simple and useful, and apparently just needs the related libssp to be available.
I understand, that also uClibc can support SSP, but I'd prefer not to add anything to uClibc if I don't have to. Having libssp available seems to do a reasonable job for this case, without changing anything else.

Thanks
         Guy


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

unsigned int __stack_chk_guard = 0xDEADBEEF;

__attribute__((noreturn))
void __stack_chk_fail(void)
{
	printf("The canary died!\n");
	exit(0);
}

__attribute__((noinline)) void foo(const char* str)
{
	char buffer[16];
	strcpy(buffer, str);
}

int main(int argc, char *argv[]) {
	if (argc!=2) {
		printf("Expected single command line option string to copy!\n");
		return -1;
	}

	/* if argv[1] is at least 16 character long (17 including the trailing \0)
	   a buffer overrun will occur, and the __stack_chk_fail handler will be called */
	foo(argv[1]);

	return -1;
}



-----Original Message-----
From: Baruch Siach [mailto:baruch at tkos.co.il] 
Sent: Wednesday, June 7, 2017 11:13 PM
To: Guy Benyei <guybe@mellanox.com>
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] [PATCH]Libssp support

Hi Guy,

On Wed, Jun 07, 2017 at 10:41:51AM +0000, Guy Benyei wrote:
> I tried to activate gcc's -fstack-protector flag, but the compiler was 
> looking for libssp:
> 
> .../toolchain/bin/arceb-linux-gcc  -O2 -o stack_overrun 
> stack_overrun.c -fstack-protector
> .../arceb-ezchip-linux-uclibc/bin/ld: cannot find -lssp_nonshared
> .../arceb-ezchip-linux-uclibc/bin/ld: cannot find -lssp
> collect2: error: ld returned 1 exit status

What code are you trying to build? Is this part of a Buildroot package?

A sane build system must check whether the compiler supports -fstack-protector before attempting to use it.

> Building libssp seems to be disabled with no option to enable it in 
> package/gcc.mk by using the --disable-libssp flag for configuring gcc.
> Applying the patch below enables the usage of libssp. Of course, it 
> could be conditional with some configuration symbol, to save place 
> when libssp is not needed.
> Any thoughts on it?

The internal toolchain that package/gcc/gcc.mk builds relies on ssp support from the C library. In your case this is seems to be uClibc. You need to enable BR2_TOOLCHAIN_BUILDROOT_USE_SSP (under "uClibc Options") for stack smashing protection support.

> It seems to be related to this bug:
> https://bugs.busybox.net/show_bug.cgi?id=4039

This bug is about external toolchains. Unrelated to gcc.mk that only deals with the internal toolchain.

baruch

> diff --git a/package/gcc/gcc-final/gcc-final.mk 
> b/package/gcc/gcc-final/gcc-final.mk
> index e8d2e18..d0f23c9 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -147,6 +147,15 @@ endef
>  
>  HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBATOMIC
>  
> +define HOST_GCC_FINAL_INSTALL_LIBSSP
> +       -cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/libssp* \
> +               $(STAGING_DIR)/lib/
> +       -cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/libssp* \
> +               $(TARGET_DIR)/lib/
> +endef
> +
> +HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBSSP
> +
>  # Handle the installation of libraries in /usr/lib  
> HOST_GCC_FINAL_USR_LIBS =
>  
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk index 
> b52f945..cca3847 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -90,7 +90,6 @@ HOST_GCC_COMMON_CONF_OPTS = \
>         --with-sysroot=$(STAGING_DIR) \
>         --disable-__cxa_atexit \
>         --with-gnu-ld \
> -       --disable-libssp \
>         --disable-multilib \
>         --with-gmp=$(HOST_DIR)/usr \
>         --with-mpc=$(HOST_DIR)/usr \

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
