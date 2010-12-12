From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 12 Dec 2010 11:25:24 +0100
Subject: [Buildroot] [PATCH 05/15] toolchain: rework C++ options
In-Reply-To: <e24f28446cde0a4d1dad1bfb5e55c070c9345770.1291541115.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<e24f28446cde0a4d1dad1bfb5e55c070c9345770.1291541115.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201012121125.24507.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 05 December 2010 10:25:32 Thomas Petazzoni wrote:
> Instead of having BR2_GCC_CROSS_CXX and BR2_INSTALL_LIBSTDCPP, with
> BR2_GCC_CROSS_CXX not being visible (and therefore being useless),
> let's just keep BR2_INSTALL_LIBSTDCPP to enable C++ in the toolchain
> and install C++ libraries on the target.
[--SNIP--]
> diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
> index 5ba1071..b345297 100644
> --- a/toolchain/toolchain-crosstool-ng/Config.in
> +++ b/toolchain/toolchain-crosstool-ng/Config.in
> @@ -98,4 +98,12 @@ config BR2_TOOLCHAIN_CTNG_uClibc_PROGRAM_INVOCATION
>  
>  endif # BR2_TOOLCHAIN_CTNG_uClibc
>  
> +config BR2_TOOLCHAIN_CTNG_C_PLUS_PLUS

C_PLUS_PLUS --> CXX

'CXX' is a common, and well understood, variable name for 'C++'.
Besides, it is much shorter to write. :-)

> +	bool "Enable C++ support"
> +	select BR2_INSTALL_LIBSTDCPP
> +	help
> +	  Enable this option if you want your toolchain to support the
> +	  C++ language and you want C++ libraries to be installed on
> +	  your target system.

I think this option should be used in the .mk (yes, I know, I should have
run a real git send-email). Could you add this hunk:

--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -207,7 +207,7 @@ CTNG_FIX_DOT_CONFIG_SED += s:^(CT_CC_PKGVERSION)="(.*)":\1="crosstool-NG $(CTNG_
 ifneq ($(call qstrip,$(BR2_PACKAGE_GDB_SERVER))$(call qstrip,$(BR2_PACKAGE_GDB_HOST)),)
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_DEBUG_gdb)=.*:\# \1 is not set:;
 endif
-ifneq ($(call qstrip,$(BR2_INSTALL_LIBSTDCPP)),)
+ifeq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_C_PLUS_PLUS)),y)
 CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_CC_LANG_CXX) is not set:\1=y:;
 else
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_CC_LANG_CXX)=.*:\# \1 is not set:;

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
