From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 Dec 2010 23:50:55 +0100
Subject: [Buildroot] [PATCH 13/15] toolchain: expose thread options in
	the Crosstool-NG backend
In-Reply-To: <ebd285ae70fb69572d98ea560e2180aecf57ffd7.1291541115.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 5 Dec 2010 10:25:40 +0100")
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<ebd285ae70fb69572d98ea560e2180aecf57ffd7.1291541115.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87zksbly9c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  toolchain/toolchain-crosstool-ng/Config.in       |   32 ++++++++++++++++++++++
 Thomas>  toolchain/toolchain-crosstool-ng/crosstool-ng.mk |   21 ++++++++++++++
 Thomas>  2 files changed, 53 insertions(+), 0 deletions(-)

 Thomas> diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
 Thomas> index b345297..9d8cb24 100644
 Thomas> --- a/toolchain/toolchain-crosstool-ng/Config.in
 Thomas> +++ b/toolchain/toolchain-crosstool-ng/Config.in
 Thomas> @@ -106,4 +106,36 @@ config BR2_TOOLCHAIN_CTNG_C_PLUS_PLUS
 Thomas>  	  C++ language and you want C++ libraries to be installed on
 Thomas>  	  your target system.
 
 Thomas> +choice
 Thomas> +	prompt "Thread library implementation"
 Thomas> +	default BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS_OLD \
 Thomas> +		if BR2_TOOLCHAIN_CTNG_uClibc
 Thomas> +	default BR2_TOOLCHAIN_CTNG_THREADS_NPTL		\
 Thomas> +		if BR2_TOOLCHAIN_CTNG_eglibc ||		\
 Thomas> +		   BR2_TOOLCHAIN_CTNG_glibc
 Thomas> +	help
 Thomas> +	  Enable thread support and select thread implementation. Not
 Thomas> +	  all thread variants work with all versions of uClibc, the
 Thomas> +	  "linuxthreads (stable/old)" may be a working fallback if you
 Thomas> +	  need threading at all.
 Thomas> +
 Thomas> +	config BR2_TOOLCHAIN_CTNG_THREADS_NONE
 Thomas> +		bool "none"

So you can build a glibc/eglibc ctng toolchain without threading
support? Then we shouldn't unconditionally enable thread support for
external glibc toolchains (in patch 8).


-- 
Bye, Peter Korsgaard
