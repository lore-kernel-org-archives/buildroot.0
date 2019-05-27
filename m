From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 May 2019 00:27:55 +0200
Subject: [Buildroot] [PATCH 1/3] package/suricata: fix build on m68k
In-Reply-To: <20190424202118.14795-1-fontaine.fabrice@gmail.com>
References: <20190424202118.14795-1-fontaine.fabrice@gmail.com>
Message-ID: <19d03bfc-93d6-e36e-9f82-c8055c0a8990@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24/04/2019 22:21, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/ed923bcc1454ce90444b8dac7c064b5f4ea4a0a5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-fix-build-on-m68k-with-uclibc.patch  | 48 +++++++++++++++++++
>  package/suricata/suricata.mk                  |  2 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 package/suricata/0001-fix-build-on-m68k-with-uclibc.patch
> 
> diff --git a/package/suricata/0001-fix-build-on-m68k-with-uclibc.patch b/package/suricata/0001-fix-build-on-m68k-with-uclibc.patch
> new file mode 100644
> index 0000000000..09b4b70588
> --- /dev/null
> +++ b/package/suricata/0001-fix-build-on-m68k-with-uclibc.patch
> @@ -0,0 +1,48 @@
> +From 58750008dd562c08642bed1bb3194cb87e301570 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Wed, 24 Apr 2019 19:14:29 +0200
> +Subject: [PATCH] fix build on m68k with uclibc
> +
> +uclibc on m68k defines _POSIX_SPIN_LOCKS but does not define
> +pthread_spin_unlock so check for this function before using
> +pthread_spin_xxx functions

 This makes no sense... If pthread_spin_lock is defined but pthread_spin_unlock
is not, then there are no spinlocks. So this clearly is a uClibc bug.

 Since NPTL support for m68k seems to be pretty incomplete in uClibc, I think we
should just disable it.

 And for this specific package, I'd just disable it for m68k.

 Regards,
 Arnout

> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/ed923bcc1454ce90444b8dac7c064b5f4ea4a0a5
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/OISF/suricata/pull/3816]
> +---
> + configure.ac  | 2 ++
> + src/threads.h | 2 +-
> + 2 files changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index a6669ec47..ee59c9d8e 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -889,6 +889,8 @@
> +         exit 1
> +     fi
> + 
> ++    AC_CHECK_FUNCS([pthread_spin_unlock])
> ++
> +   # libjansson
> +     AC_ARG_WITH(libjansson_includes,
> +             [  --with-libjansson-includes=DIR  libjansson include directory],
> +diff --git a/src/threads.h b/src/threads.h
> +index 4e6f61134..4eb1a7360 100644
> +--- a/src/threads.h
> ++++ b/src/threads.h
> +@@ -155,7 +155,7 @@ enum {
> + #define SCCtrlCondDestroy pthread_cond_destroy
> + 
> + /* spinlocks */
> +-#if ((_POSIX_SPIN_LOCKS - 200112L) < 0L) || defined HELGRIND
> ++#if ((_POSIX_SPIN_LOCKS - 200112L) < 0L) || defined HELGRIND || !defined(HAVE_PTHREAD_SPIN_UNLOCK)
> + #define SCSpinlock                              SCMutex
> + #define SCSpinLock(spin)                        SCMutexLock((spin))
> + #define SCSpinTrylock(spin)                     SCMutexTrylock((spin))
> +-- 
> +2.20.1
> +
> diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
> index e5884cdfe4..0491fad6d5 100644
> --- a/package/suricata/suricata.mk
> +++ b/package/suricata/suricata.mk
> @@ -8,6 +8,8 @@ SURICATA_VERSION = 4.1.3
>  SURICATA_SITE = https://www.openinfosecfoundation.org/download
>  SURICATA_LICENSE = GPL-2.0
>  SURICATA_LICENSE_FILES = COPYING LICENSE
> +# We're patching configure.ac
> +SURICATA_AUTORECONF = YES
>  
>  SURICATA_DEPENDENCIES = \
>  	host-pkgconf \
> 
