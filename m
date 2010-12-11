From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 Dec 2010 23:38:38 +0100
Subject: [Buildroot] [PATCH 05/15] toolchain: rework C++ options
In-Reply-To: <e24f28446cde0a4d1dad1bfb5e55c070c9345770.1291541115.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 5 Dec 2010 10:25:32 +0100")
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<e24f28446cde0a4d1dad1bfb5e55c070c9345770.1291541115.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87fwu4lytt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Instead of having BR2_GCC_CROSS_CXX and BR2_INSTALL_LIBSTDCPP, with
 Thomas> BR2_GCC_CROSS_CXX not being visible (and therefore being useless),
 Thomas> let's just keep BR2_INSTALL_LIBSTDCPP to enable C++ in the toolchain
 Thomas> and install C++ libraries on the target.

 Thomas> We also take that opportunity to make BR2_INSTALL_LIBSTDCPP an hidden
 Thomas> option, which is selected by an option in Buildroot toolchain support
 Thomas> or an option in External toolchain support, just as we did for other
 Thomas> toolchain features.

 Thomas> Some work definitely remains to be done :

 Thomas>  - The name BR2_INSTALL_LIBSTDCPP is ugly, but we keep it for the
 Thomas>    moment in order to avoid changing all packages.

 Thomas>  - We could have two independent options: one to tell whether the
 Thomas>    toolchain has C++ support (on which packages would depend on) and
 Thomas>    another to tell whether the C++ library should be installed (that
 Thomas>    packages would select). This would allow to have a C++-free target
 Thomas>    filesystem even if the toolchain used actually supports C++.

Is that really important? I would expect people who really care about
such stuff to build a custom toolchain for their project.

If there's interest, perhaps it would make more sense to generalize this
library-cleanup step for all libs and do something like the mklibs
stuff.

Thomas> +++ b/toolchain/toolchain-crosstool-ng/Config.in
Thomas> @@ -98,4 +98,12 @@ config BR2_TOOLCHAIN_CTNG_uClibc_PROGRAM_INVOCATION
 
Thomas>  endif # BR2_TOOLCHAIN_CTNG_uClibc
 
Thomas> +config BR2_TOOLCHAIN_CTNG_C_PLUS_PLUS
Thomas> +	bool "Enable C++ support"
Thomas> +	select BR2_INSTALL_LIBSTDCPP
Thomas> +	help
Thomas> +	  Enable this option if you want your toolchain to support the
Thomas> +	  C++ language and you want C++ libraries to be installed on
Thomas> +	  your target system.
Thomas> +

Here we add an option to build a ctng toolchain (glibc/uclibc)
with/without C++ support.


 Thomas> +++ b/toolchain/toolchain-external/Config.in
 Thomas> @@ -143,6 +143,7 @@ config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 Thomas>  	select BR2_USE_WCHAR
 Thomas>  	select BR2_ENABLE_LOCALE
 Thomas>  	select BR2_PROGRAM_INVOCATION
 Thomas> +	select BR2_INSTALL_LIBSTDCPP

.. But here we say that all external glibc toolchains have C++
support. That doesn't seem to be always true.

 
 Thomas>  config BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 Thomas>  	bool
 Thomas> @@ -214,6 +215,14 @@ config BR2_TOOLCHAIN_EXTERNAL_PROGRAM_INVOCATION
 Thomas>  	  invocation support. If you don't know, leave the default
 Thomas>  	  value, Buildroot will tell you if it's correct or not.
 
 Thomas> +config BR2_TOOLCHAIN_EXTERNAL_C_PLUS_PLUS
 Thomas> +	bool "Toolchain has C++ support ?"

No space before '?'


 Thomas> +	select BR2_INSTALL_LIBSTDCPP
 Thomas> +	help
 Thomas> +	  Enable this option if you want your external toolchain has

'Enable this option if your external toolchain has'


 Thomas> +	  support for C++. If you don't know, leave the default value,
 Thomas> +	  Buildroot will tell you if it's correct or not.


-- 
Bye, Peter Korsgaard
