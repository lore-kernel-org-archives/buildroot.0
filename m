From: JennyM <jenny.murphy@episensor.com>
Date: Thu, 1 Mar 2012 00:47:05 -0800 (PST)
Subject: [Buildroot] Added package for RxTx Library
Message-ID: <33414226.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,
 I am new to buildroot and am using it to develop a cross compilation
toochain and filesystem for an embedded ARM9/Linux platform.
I have jamvm already running some java applications on the embedded
platform. However I would like to use SerialRxTx from my java code. I tried
some of the already prepared .so files from the RXTX download site and they
are not working so I am coming to the conclusion that it necessary for me to
compile my own.
So from your message below it seems like you may have made this step easier
for me. What is the current status of the patch? Can I use it and what is
the process for patching my current version of buildroot?

Thanks


PauloCosta wrote:
> 
> I've created a package for RxTx, a library that supports acessing serial
> ports from Java (http://users.frii.com/jarvi/rxtx/)
> 
> I would appreciate any comments/suggestions on this patch
> 
> Thanks
> 
> diff -urpN ../buildroot-snapshot/package/java/Config.in
> buildroot-snapshot/package/java/Config.in
> --- ../buildroot-snapshot/package/java/Config.in	2009-11-10
> 05:37:36.000000000 -0200
> +++ buildroot-snapshot/package/java/Config.in	2010-01-11
> 19:23:37.233768118 -0200
> @@ -2,4 +2,5 @@ menu "Java"
>  source "package/java/classpath/Config.in"
>  source "package/java/jamvm/Config.in"
>  source "package/java/concierge/Config.in"
> +source "package/java/rxtx/Config.in"
>  endmenu
> diff -urpN ../buildroot-snapshot/package/java/rxtx/Config.in
> buildroot-snapshot/package/java/rxtx/Config.in
> --- ../buildroot-snapshot/package/java/rxtx/Config.in	1969-12-31
> 21:00:00.000000000 -0300
> +++ buildroot-snapshot/package/java/rxtx/Config.in	2010-01-11
> 19:24:42.000000000 -0200
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_RXTX
> +	bool "rxtx"
> +        depends on BR2_PACKAGE_CLASSPATH
> +	help
> +	  RXTX is a native lib providing serial and parallel communication for
> the Java Development Toolkit (JDK).
> +
> +	  http://rxtx.qbang.org/pub/rxtx
> diff -urpN ../buildroot-snapshot/package/java/rxtx/rxtx-2.1-7r2-UTS.patch
> buildroot-snapshot/package/java/rxtx/rxtx-2.1-7r2-UTS.patch
> --- ../buildroot-snapshot/package/java/rxtx/rxtx-2.1-7r2-UTS.patch
> 1969-12-31 21:00:00.000000000 -0300
> +++ buildroot-snapshot/package/java/rxtx/rxtx-2.1-7r2-UTS.patch	2010-01-12
> 14:51:25.000000000 -0200
> @@ -0,0 +1,110 @@
> +--- a/configure.in.orig	2004-10-17 16:23:02.000000000 +0200
> ++++ b/configure.in	2006-10-26 21:25:32.000000000 +0200
> +@@ -466,1 +466,1 @@
> +-	1.2*|1.3*|1.4*|1.5*) 
> ++	1.2*|1.3*|1.4*|1.5*|1.6*)
> +@@ -536,1 +536,1 @@
> +-	1.2*|1.3*|1.4*|1.5*) 
> ++	1.2*|1.3*|1.4*|1.5*|1.6*)
> +@@ -672,1 +672,1 @@
> +-	1.2*|1.3*|1.4*|1.5*)
> ++	1.2*|1.3*|1.4*|1.5*|1.6*)
> +@@ -7241 +724,1 @@
> +-	1.2*|1.3*|1.4*|1.5*)
> ++	1.2*|1.3*|1.4*|1.5*|1.6*)
> +--- a/src/SerialImp.h.orgi	2004-10-17 16:23:02.000000000 +0200
> ++++ b/src/SerialImp.h	2006-10-26 21:25:32.000000000 +0200
> +@@ -466,1 +466,1 @@
> +-int printj(JNIEnv *env, wchar_t *fmt, ...);
> ++//int printj(JNIEnv *env, wchar_t *fmt, ...);
> +
> +--- a/src/I2CImp.c.orig	2004-10-17 16:23:02.000000000 +0200
> ++++ b/src/I2CImp.c	2006-10-26 21:25:32.000000000 +0200
> +@@ -87,6 +87,7 @@
> + 	if( !handler.sa_handler ) signal( SIGIO, SIG_IGN );
> + #endif /* !__FreeBSD__ */
> + #if defined(__linux__) 
> ++#if 0
> + 	/* Lets let people who upgraded kernels know they may have problems */
> + 	if (uname (&name) == -1)
> + 	{
> +@@ -98,6 +99,7 @@
> + 		fprintf(stderr, "\n\n\nRXTX WARNING:  This library was compiled to run
> with OS release %s and you are currently running OS release %s.  In some
> cases this can be a problem.  Try recompiling RXTX if you notice strange
> behavior.  If you just compiled RXTX make sure /usr/include/linux is a
> symbolic link to the include files that came with the kernel source and
> not an older copy.\n\n\npress enter to
> continue\n",UTS_RELEASE,name.release);
> + 		getchar();
> + 	}
> ++#endif
> + #endif /* __linux__ */
> + #endif /* WIN32 */
> + }
> +--- a/src/RawImp.c.orig	2004-10-16 18:20:35.000000000 +0200
> ++++ b/src/RawImp.c	2006-10-26 21:25:59.000000000 +0200
> +@@ -231,6 +231,7 @@
> + 	if( !handler.sa_handler ) signal( SIGIO, SIG_IGN );
> + #endif /* !__FreeBSD__ */
> + #if defined(__linux__) 
> ++#if 0
> + 	/* Lets let people who upgraded kernels know they may have problems */
> + 	if (uname (&name) == -1)
> + 	{
> +@@ -242,6 +243,7 @@
> + 		fprintf(stderr, "\n\n\nRXTX WARNING:  This library was compiled to run
> with OS release %s and you are currently running OS release %s.  In some
> cases this can be a problem.  Try recompiling RXTX if you notice strange
> behavior.  If you just compiled RXTX make sure /usr/include/linux is a
> symbolic link to the include files that came with the kernel source and
> not an older copy.\n\n\npress enter to
> continue\n",UTS_RELEASE,name.release);
> + 		getchar();
> + 	}
> ++#endif
> + #endif /* __linux__ */
> + #endif /* WIN32 */
> + }
> +--- a/src/RS485Imp.c.orig	2004-10-16 18:20:35.000000000 +0200
> ++++ b/src/RS485Imp.c	2006-10-26 21:26:23.000000000 +0200
> +@@ -87,6 +87,7 @@
> + 	if( !handler.sa_handler ) signal( SIGIO, SIG_IGN );
> + #endif /* !__FreeBSD__ */
> + #if defined(__linux__) 
> ++#if 0
> + 	/* Lets let people who upgraded kernels know they may have problems */
> + 	if (uname (&name) == -1)
> + 	{
> +@@ -98,6 +99,7 @@
> + 		fprintf(stderr, "\n\n\nRXTX WARNING:  This library was compiled to run
> with OS release %s and you are currently running OS release %s.  In some
> cases this can be a problem.  Try recompiling RXTX if you notice strange
> behavior.  If you just compiled RXTX make sure /usr/include/linux is a
> symbolic link to the include files that came with the kernel source and
> not an older copy.\n\n\npress enter to
> continue\n",UTS_RELEASE,name.release);
> + 		getchar();
> + 	}
> ++#endif
> + #endif /* __linux__ */
> + #endif /* WIN32 */
> + }
> +--- a/src/SerialImp.c.orig	2006-01-29 23:19:04.000000000 +0100
> ++++ b/src/SerialImp.c	2006-10-26 21:26:59.000000000 +0200
> +@@ -280,6 +280,7 @@
> + 	gettimeofday(&seloop, NULL);
> + #endif /* DEBUG_TIMING */
> + #if defined(DEBUG) && defined(__linux__)
> ++#if 0
> + 	/* Lets let people who upgraded kernels know they may have problems */
> + 	if (uname (&name) == -1)
> + 	{
> +@@ -295,6 +296,7 @@
> + 		getchar();
> + 	}
> + 	LEAVE( "RXTXPort:Initialize" );
> ++#endif
> + #endif /* DEBUG && __linux__ */
> + }
> + 
> +--- a/src/SerialImp.cpp.orig	2004-10-12 10:59:27.000000000 +0200
> ++++ b/src/SerialImp.cpp	2006-10-26 21:27:44.000000000 +0200
> +@@ -102,6 +102,7 @@
> + 	if( !handler.sa_handler ) signal( SIGIO, SIG_IGN );
> + #endif /* !__FreeBSD__ */
> + #ifdef DEBUG
> ++#if 0
> + 	/* Lets let people who upgraded kernels know they may have problems */
> + 	if (uname (&name) == -1)
> + 	{
> +@@ -114,6 +115,7 @@
> + 			name.release);
> + 		getchar();
> + 	}
> ++#endif
> + #endif /* DEBUG */
> + #endif /* __BEOS__ */
> + #endif /* WIN32 */
> diff -urpN ../buildroot-snapshot/package/java/rxtx/rxtx.mk
> buildroot-snapshot/package/java/rxtx/rxtx.mk
> --- ../buildroot-snapshot/package/java/rxtx/rxtx.mk	1969-12-31
> 21:00:00.000000000 -0300
> +++ buildroot-snapshot/package/java/rxtx/rxtx.mk	2010-01-12
> 15:01:16.000000000 -0200
> @@ -0,0 +1,16 @@
> +#############################################################
> +#
> +# rxtx
> +#
> +#############################################################
> +RXTX_VERSION = 2.1-7r2
> +RXTX_SOURCE = rxtx-$(RXTX_VERSION).tgz
> +RXTX_SITE = http://rxtx.qbang.org/pub/rxtx
> +RXTX_AUTORECONF = YES
> +RXTX_INSTALL_STAGING = NO
> +RXTX_INSTALL_TARGET = YES
> +RXTX_INSTALL_TARGET_OPT = RXTX_PATH=$(TARGET_DIR)/usr/lib/classpath
> JHOME=$(TARGET_DIR)/usr/lib install
> +
> +RXTX_DEPENDENCIES = uclibc classpath
> +
> +$(eval $(call AUTOTARGETS,package/java,rxtx))
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
View this message in context: http://old.nabble.com/Added-package-for-RxTx-Library-tp27131856p33414226.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
