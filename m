From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 Dec 2010 23:42:03 +0100
Subject: [Buildroot] [PATCH 07/15] ltp-testsuite: bump version and use
	autotargets
In-Reply-To: <c3f16255f702a6cdd4936c2c91d13ac61db35c82.1291541115.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 5 Dec 2010 10:25:34 +0100")
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<c3f16255f702a6cdd4936c2c91d13ac61db35c82.1291541115.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87bp4slyo4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Reworking ltp-testsuite is needed in order to get rid of some
 Thomas> thread-specific options that will be cleaned-up in the next commit.

 Thomas> +++ b/package/ltp-testsuite/Config.in
 Thomas> @@ -1,7 +1,18 @@
 Thomas> -config BR2_PACKAGE_LTP-TESTSUITE
 Thomas> +config BR2_PACKAGE_LTP_TESTSUITE
 Thomas>  	bool "ltp-testsuite"
 Thomas> -	depends on BROKEN
 Thomas> +	depends on !BR2_PTHREADS_NONE
 Thomas> +	# Several tests of LTP use legacy functions that are usually
 Thomas> +	# not available in uClibc.
 Thomas> +	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
 Thomas> +		   BR2_TOOLCHAIN_CTNG_glibc	|| \
 Thomas> +		   BR2_TOOLCHAIN_CTNG_eglibc
 Thomas>  	help
 Thomas>  	  The Linux Test Project provides a huge testsuite for Linux.
 
 Thomas>  	  http://ltp.sourceforge.net/
 Thomas> +
 Thomas> +comment "ltp-testsuite requires a glibc toolchain with thread support"
 Thomas> +	depends on (!BR2_TOOLCHAIN_EXTERNAL_GLIBC && \
 Thomas> +		    !BR2_TOOLCHAIN_CTNG_glibc	  && \
 Thomas> +		    !BR2_TOOLCHAIN_CTNG_eglibc)   || \
 Thomas> +                    BR2_PTHREADS_NONE

Does it really not work on uClibc? This is afaik the first package we
have that is glibc only.

-- 
Bye, Peter Korsgaard
