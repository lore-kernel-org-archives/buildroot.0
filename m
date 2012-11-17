From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Nov 2012 23:46:41 +0100
Subject: [Buildroot] [PATCH 07/10] libffi: make thread support optional
In-Reply-To: <1952f1984c0a2fae4cd5eabc15f9b7eb37623224.1353191025.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 17 Nov 2012 23:24:05 +0100")
References: <cover.1353191025.git.thomas.petazzoni@free-electrons.com>
 <cover.1353191025.git.thomas.petazzoni@free-electrons.com>
 <1952f1984c0a2fae4cd5eabc15f9b7eb37623224.1353191025.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87pq3brgoe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Fixes:
 Thomas>   http://autobuild.buildroot.org/results/7ee57d01917ea72d1811469e482513dda2ceb1ea/build-end.log

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  ...ffi-0003-Make-thread-support-conditionnal.patch |   73 ++++++++++++++++++++
 Thomas>  1 file changed, 73 insertions(+)
 Thomas>  create mode 100644 package/libffi/libffi-0003-Make-thread-support-conditionnal.patch

 Thomas> diff --git a/package/libffi/libffi-0003-Make-thread-support-conditionnal.patch b/package/libffi/libffi-0003-Make-thread-support-conditionnal.patch
 Thomas> new file mode 100644
 Thomas> index 0000000..90d98d6
 Thomas> --- /dev/null
 Thomas> +++ b/package/libffi/libffi-0003-Make-thread-support-conditionnal.patch
 Thomas> @@ -0,0 +1,73 @@
 Thomas> +From a7f6342120060564a829704cceb843e53e0b34a9 Mon Sep 17 00:00:00 2001
 Thomas> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> +Date: Sat, 17 Nov 2012 18:44:16 +0100
 Thomas> +Subject: [PATCH 3/3] Make thread support conditionnal
 Thomas> +
 Thomas> +When libffi is linked against a C library that does not have thread
 Thomas> +support, it is not necessary to use a mutex to protect global
 Thomas> +variables, since the application calling libffi cannot be
 Thomas> +multi-threaded.
 Thomas> +
 Thomas> +Therefore, make the libffi thread support conditionnal: when we're
 Thomas> +building against uClibc with no thread support, don't use the
 Thomas> +pthread_mutex.
 Thomas> +
 Thomas> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> +---
 Thomas> + src/closures.c |   12 ++++++++++++
 Thomas> + 1 file changed, 12 insertions(+)
 Thomas> +
 Thomas> +diff --git a/src/closures.c b/src/closures.c
 Thomas> +index 1b37827..3d151f6 100644
 Thomas> +--- a/src/closures.c
 Thomas> ++++ b/src/closures.c
 Thomas> +@@ -70,7 +70,10 @@
 Thomas> + 
 Thomas> + # elif FFI_MMAP_EXEC_WRIT /* !FFI_EXEC_TRAMPOLINE_TABLE */
 Thomas> + 
 Thomas> ++#if defined(__UCLIBC__) && !defined(__HAS_NO_THREADS__)
 Thomas> + #define USE_LOCKS 1
 Thomas> ++#endif

Ehh, what about glibc?

Shouldn't it be !__UCLIBC__ || !__HAS_NO_THREADS__ ?

-- 
Bye, Peter Korsgaard
