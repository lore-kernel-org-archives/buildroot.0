From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 May 2013 15:29:42 +0200
Subject: [Buildroot] [PATCH] lttng-babeltrace: fix build failure on gcc14
In-Reply-To: <1369747369-21243-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 28 May 2013 15:22:49 +0200")
References: <1369747369-21243-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87sj179qrd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The gcc14 machine has a moderately old host gcc, which was causing a
 Thomas> recurrent build failure of host-lttng-babeltrace:

 Thomas>  http://autobuild.buildroot.org/results/492/49216052c161874f41738e41e6e0c89a6dd04000/build-end.log

 Thomas> This commit adds a patch to fix this build failure, related to the
 Thomas> access of the ULLONG_MAX define on compilers that did not default to
 Thomas> the C99 variant of the C language.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  ...beltrace-01-no-posix-fallocate-in-uclibc.patch} |    0
 Thomas>  ...tng-babeltrace-02-fix-build-old-compilers.patch |   27 ++++++++++++++++++++
 Thomas>  package/lttng-babeltrace/lttng-babeltrace.mk       |    4 +++
 Thomas>  3 files changed, 31 insertions(+)
 Thomas>  rename package/lttng-babeltrace/{lttng-babeltrace-no-posix-fallocate-in-uclibc.patch => lttng-babeltrace-01-no-posix-fallocate-in-uclibc.patch} (100%)
 Thomas>  create mode 100644 package/lttng-babeltrace/lttng-babeltrace-02-fix-build-old-compilers.patch

 Thomas> +++ b/package/lttng-babeltrace/lttng-babeltrace.mk
 Thomas> @@ -4,5 +4,9 @@ LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 
 Thomas>  LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
 
 Thomas> +# We patch configure.ac to fix a problem that appears
 Thomas> +# only with some old host gcc
 Thomas> +HOST_LTTNG_BABELTRACE_AUTORECONF = YES

The patch also gets applied for target builds. Don't we need to
autoreconf there as well?


-- 
Bye, Peter Korsgaard
