From: Markos Chandras <markos.chandras@gmail.com>
Date: Wed, 5 Dec 2012 12:01:20 +0000
Subject: [Buildroot] [PATCH] libevent: Add Gentoo patch for C libraries
 without the sysctl syscall
In-Reply-To: <1353495389-20179-1-git-send-email-markos.chandras@gmail.com>
References: <1353495389-20179-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <CAG2jQ8ga3RoFPshV5x7Fad4rVCnp_aiq9My_HpqPqU1w1Ri-Cg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21 November 2012 10:56, Markos Chandras <markos.chandras@gmail.com> wrote:
> From: Markos Chandras <markos.chandras@imgtec.com>
>
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
>  package/libevent/libevent-sysctl.patch |   46 ++++++++++++++++++++++++++++++++
>  package/libevent/libevent.mk           |    1 +
>  2 files changed, 47 insertions(+), 0 deletions(-)
>  create mode 100644 package/libevent/libevent-sysctl.patch
>
> diff --git a/package/libevent/libevent-sysctl.patch b/package/libevent/libevent-sysctl.patch
> new file mode 100644
> index 0000000..8c72377
> --- /dev/null
> +++ b/package/libevent/libevent-sysctl.patch
> @@ -0,0 +1,46 @@
> +Add Gentoo fix for C libraries that lack the sysctl system call
> +http://sources2.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/libevent/files/libevent-2.0.16-sysctl.patch?revision=1.1
> +This patch has already been commited upstream
> +
> +Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> +
> +From 358c745e5432f7648b6f8b3188f32b5551cbf9d6 Mon Sep 17 00:00:00 2001
> +From: Mike Frysinger <vapier@gentoo.org>
> +Date: Thu, 8 Dec 2011 11:39:48 -0500
> +Subject: [PATCH] check for sysctl before we use it
> +
> +Not all C libraries under Linux support the sysctl() func.
> +---
> + arc4random.c |    2 +-
> + configure.in |    2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/arc4random.c b/arc4random.c
> +index 4833169..ef10fa8 100644
> +--- a/arc4random.c
> ++++ b/arc4random.c
> +@@ -166,7 +166,7 @@ arc4_seed_win32(void)
> + }
> + #endif
> +
> +-#if defined(_EVENT_HAVE_SYS_SYSCTL_H)
> ++#if defined(_EVENT_HAVE_SYS_SYSCTL_H) && defined(_EVENT_HAVE_SYSCTL)
> + #if _EVENT_HAVE_DECL_CTL_KERN && _EVENT_HAVE_DECL_KERN_RANDOM && _EVENT_HAVE_DECL_RANDOM_UUID
> + #define TRY_SEED_SYSCTL_LINUX
> + static int
> +diff --git a/configure.in b/configure.in
> +index da08cf4..4e24444 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -267,7 +267,7 @@ AC_HEADER_TIME
> +
> + dnl Checks for library functions.
> + AC_CHECK_FUNCS([gettimeofday vasprintf fcntl clock_gettime strtok_r strsep])
> +-AC_CHECK_FUNCS([getnameinfo strlcpy inet_ntop inet_pton signal sigaction strtoll inet_aton pipe eventfd sendfile mmap splice arc4random arc4random_buf issetugid geteuid getegid getprotobynumber setenv unsetenv putenv])
> ++AC_CHECK_FUNCS([getnameinfo strlcpy inet_ntop inet_pton signal sigaction strtoll inet_aton pipe eventfd sendfile mmap splice arc4random arc4random_buf issetugid geteuid getegid getprotobynumber setenv unsetenv putenv sysctl])
> +
> + AC_CACHE_CHECK(
> +     [for getaddrinfo],
> +--
> +1.7.6.1
> +
> diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
> index 5ce511f..3f2dfb0 100644
> --- a/package/libevent/libevent.mk
> +++ b/package/libevent/libevent.mk
> @@ -6,6 +6,7 @@
>  LIBEVENT_VERSION = 2.0.14
>  LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
>  LIBEVENT_SITE = https://github.com/downloads/libevent/libevent
> +LIBEVENT_AUTORECONF = YES
>  LIBEVENT_INSTALL_STAGING = YES
>
>  define LIBEVENT_REMOVE_PYSCRIPT
> --
> 1.7.1
>

Ping? :-)

-- 
Regards,
Markos
