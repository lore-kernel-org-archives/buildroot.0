From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 Dec 2010 23:45:26 +0100
Subject: [Buildroot] [PATCH 08/15] toolchain: rework thread options
In-Reply-To: <99d8d624018cee0c619bc147ed4ab8eaeaf50828.1291541115.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 5 Dec 2010 10:25:35 +0100")
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<99d8d624018cee0c619bc147ed4ab8eaeaf50828.1291541115.git.thomas.petazzoni@free-electrons.com>
Message-ID: <874oaklyih.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The selection of linuxthreads, linuxthreads old or NPTL doesn't make a
 Thomas> lot of sense for external toolchains. So, instead, we :

 Thomas>  * Introduce an hidden BR2_TOOLCHAIN_HAS_THREADS option, which must be
 Thomas>    selected by toolchain specific options when thread support is
 Thomas>    available. Package needing to test thread support should use this
 Thomas>    option.

 Thomas>  * Move the none/linuxthreads/linuxthreads old/NPTL selection to
 Thomas>    Buildroot internal toolchain configuration.

 Thomas>  * Add an option in external toolchain to tell if thread support is
 Thomas>    available or not in the external toolchain.

 Thomas> ffmpeg, dmalloc and openvpn are fixed to use the new
 Thomas> BR2_TOOLCHAIN_HAS_THREADS option. For openvpn, --enable-threads=posix
 Thomas> is no longer used, as the configure script doesn't even understand
 Thomas> this option.

 Thomas> +++ b/toolchain/toolchain-buildroot/Config.in.2
 Thomas> @@ -76,6 +76,32 @@ config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 Thomas>  	  See http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
 Thomas>  	  for details.
 
 Thomas> +choice
 Thomas> +	prompt "Thread library implementation"
 Thomas> +	default BR2_PTHREADS_OLD
 Thomas> +	help
 Thomas> +	  If you are building your own toolchain then select the type

This is now only shown if we're building a toolchain, so this part of
the help text could go.


 Thomas> +	  of libpthreads you want to use. Not all thread variants work
 Thomas> +	  with all versions of uClibc, the "linuxthreads (stable/old)"
 Thomas> +	  may be a working fallback if you need threading at all.


 Thomas> +++ b/toolchain/toolchain-external/Config.in
 Thomas> @@ -144,6 +144,7 @@ config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 Thomas>  	select BR2_ENABLE_LOCALE
 Thomas>  	select BR2_PROGRAM_INVOCATION
 Thomas>  	select BR2_INSTALL_LIBSTDCPP
 Thomas> +	select BR2_TOOLCHAIN_HAS_THREADS
 
 Thomas>  config BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 Thomas>  	bool
 Thomas> @@ -223,6 +224,14 @@ config BR2_TOOLCHAIN_EXTERNAL_C_PLUS_PLUS
 Thomas>  	  support for C++. If you don't know, leave the default value,
 Thomas>  	  Buildroot will tell you if it's correct or not.
 
 Thomas> +config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
 Thomas> +	bool "Toolchain has threads support ?"

No space before '?'

 Thomas> +	select BR2_TOOLCHAIN_HAS_THREADS
 Thomas> +	help
 Thomas> +	  Enable this option if you want your external toolchain has
 Thomas> +	  support for C++. If you don't know, leave the default value,
 Thomas> +	  Buildroot will tell you if it's correct or not.

Cut'n'paste? ;) It shouldn't be about C++ and reworded.

-- 
Bye, Peter Korsgaard
