Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AC2CEB2CB
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 22:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D707A6079D;
	Mon, 30 Sep 2024 22:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AfYY9NXbQmPj; Mon, 30 Sep 2024 22:31:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A76E6607A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A76E6607A9;
	Mon, 30 Sep 2024 22:31:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48FBD1BF294
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 22:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37CA3402DB
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 22:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jt-qgq8DVT42 for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 22:31:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B0F6402D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B0F6402D6
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B0F6402D6
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 22:31:40 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-82aa8c36eefso302618739f.3
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 15:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727735499; x=1728340299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pmWLqIH1EAKWy79QJ0unPXPZwEwqBcUU2IzM25VH2q8=;
 b=We2qen7iYgIiBQn7mbjFD6tPWHYOaZnxjDZdv25KG4jJiEO9RsYgn0h4ywI9e/MXp5
 5KVP/GKz3MqO12bAKWDI6fMCscN7xJaajtEliwEPY0HxpwQBwYwtAm6rSv2oRfrZI8MP
 8hMoEBe3+pdCkSKMT2HpGy3dVom+O/LEWf8ESduZiK9fJkLvBEFtejQnzJIPGJofqViT
 0haCNvm9F6IBYICMlMjmNxmA8r8JBqjfpoOpSlDibiF76rB/f2KxK0Tst/AtvuVUHTYR
 wt2Sjuijlk88IWnYAXFOumkdk2zDpvjpHFFO166+c+6Y6Ovs6AHKttxN9BdsfWSac8OU
 5XNQ==
X-Gm-Message-State: AOJu0YztlZtY/UCHkPrnk5ztskJ1ZiWIPmBCrrCZKoPfcPBLDmj5vkHh
 POu74bsonBBoOj1QHOX2eJJPdIkmQ5xb02NSox8sRxTfYM76mfMbu80bNg==
X-Google-Smtp-Source: AGHT+IHPY4yP7b82G96D0m4YR7oIc/1dwLC2JnlzndRmNAYI5bU+KrpClrDw8lDuweRS+2E2U/V9JQ==
X-Received: by 2002:a05:6e02:20c5:b0:3a0:9b0c:6b2c with SMTP id
 e9e14a558f8ab-3a3451aadcfmr111978635ab.18.1727735498905; 
 Mon, 30 Sep 2024 15:31:38 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d8888d94eesm2327929173.129.2024.09.30.15.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 15:31:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Sep 2024 16:31:33 -0600
Message-Id: <20240930223133.1202389-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930223133.1202389-1-james.hilliard1@gmail.com>
References: <20240930223133.1202389-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727735499; x=1728340299; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pmWLqIH1EAKWy79QJ0unPXPZwEwqBcUU2IzM25VH2q8=;
 b=X8xicO7odyHWNODJby8pBFlbQt4RcwrY0RvEP8/NrOATchQfklxLBpFxyP1a7aNePI
 SVmjlzWMzybQFGCcCmUCzlhMKouHqtDrMU+V+JcWjtF8iyMxq1DfsRhuYIGlfx4P9Ui6
 AkLPBYW6GHj5BoIGlHqPKHD3od1W90aaChR7svM7GaIvvCkv1NgawzBkMnoHPxLRlOKc
 Jl6HO1WvcJYkZ5bo5S4FatHXTU1r7BGmcW+BrlOKevmTmKkqRy+YpqALPzwWW98riVfp
 tnnAreJipZ4dZz47mP+JR+K4/xScgM9/+ey9BrJ0KsGj+Wlr6zuc6l/TYxNdvNPlJy70
 PLyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=X8xicO7o
Subject: [Buildroot] [PATCH 4/4] package/cups-filters: bump to version 2.0.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is now upstream.

Project relicensed to Apache-2.0 with GPL-2.0/LGPL-2.0 exception:
https://github.com/OpenPrinting/cups-filters/commit/14f11135d8aa25050e8627354b2c1f9984f7e3a3

Add new libcupsfilters dependency.

Add new libppd dependency.

Drop no longer required libglib2 dependency.

Drop no longer required lcms2 dependency.

Drop no longer required qpdf dependency.

Drop no longer required fontconfig dependency.

Drop no longer required freetype dependency.

Drop no longer required jpeg dependency.

Add new --enable-pstops config option.

Add new --enable-rastertopwg config option.

Add new --with-shell=/bin/sh config option.

Remove no longer supported --disable-braille config option.

Remove no longer supported --with-pdftops config option.

Remove no longer supported --with-jpeg config option.

Remove no longer supported --with-test-font-path config option.

Remove no longer supported --without-rcdir config option.

Remove no longer supported --with-png config option and dependency.

Remove no longer supported --with-tiff config option and dependency.

Remove no longer supported --enable-dbus config option and dependency.

Remove no longer supported --enable-avahi config option and
dependency.

Remove no longer supported --enable-ijs config option and dependency.

Remove no longer supported --enable-exif config option and dependency.

Remove cups-browsed service installation as cups-browsed is no longer
part of cups-filters.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...ecv-instead-of-system-CVE-2023-24805.patch | 208 ------------------
 package/cups-filters/Config.in                |  23 +-
 package/cups-filters/S82cups-browsed          |  48 ----
 package/cups-filters/cups-filters.hash        |   5 +-
 package/cups-filters/cups-filters.mk          |  74 +------
 5 files changed, 20 insertions(+), 338 deletions(-)
 delete mode 100644 package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
 delete mode 100644 package/cups-filters/S82cups-browsed

diff --git a/package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch b/package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
deleted file mode 100644
index e527b20f91..0000000000
--- a/package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
+++ /dev/null
@@ -1,208 +0,0 @@
-From 93e60d3df358c0ae6f3dba79e1c9684657683d89 Mon Sep 17 00:00:00 2001
-From: Till Kamppeter <till.kamppeter@gmail.com>
-Date: Wed, 17 May 2023 11:11:29 +0200
-Subject: [PATCH] beh backend: Use execv() instead of system() - CVE-2023-24805
-
-With execv() command line arguments are passed as separate strings and
-not the full command line in a single string. This prevents arbitrary
-command execution by escaping the quoting of the arguments in a job
-with a forged job title.
-
-In addition, done the following fixes and improvements:
-
-- Do not allow '/' in the scheme of the URI (= backend executable
-  name), to assure that only backends inside /usr/lib/cups/backend/
-  are used.
-
-- URI must have ':', to split off scheme, otherwise error out.
-
-- Check return value of snprintf() to create call path for backend, to
-  error out on truncation of a too long scheme or on complete failure
-  due to a completely odd scheme.
-
-- Use strncat() instead of strncpy() for getting scheme from URI, the latter
-  does not require setting terminating zero byte in case of truncation.
-
-- Also exclude "." or ".." as scheme, as directories are not valid CUPS
-  backends.
-
-- Do not use fprintf() in sigterm_handler(), to not interfere with a
-  fprintf() which could be running in the main process when
-  sigterm_handler() is triggered.
-
-- Use "static volatile int" for global variable job_canceled.
-
-Upstream: https://github.com/OpenPrinting/cups-filters/commit/93e60d3df358c0ae6f3dba79e1c9684657683d89
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- backend/beh.c | 107 +++++++++++++++++++++++++++++++++++++++-----------
- 1 file changed, 84 insertions(+), 23 deletions(-)
-
-diff --git a/backend/beh.c b/backend/beh.c
-index 225fd27d5..8d51235b1 100644
---- a/backend/beh.c
-+++ b/backend/beh.c
-@@ -22,12 +22,13 @@
- #include "backend-private.h"
- #include <cups/array.h>
- #include <ctype.h>
-+#include <sys/wait.h>
- 
- /*
-  * Local globals...
-  */
- 
--static int		job_canceled = 0; /* Set to 1 on SIGTERM */
-+static volatile int	job_canceled = 0; /* Set to 1 on SIGTERM */
- 
- /*
-  * Local functions...
-@@ -213,21 +214,40 @@ call_backend(char *uri,                 /* I - URI of final destination */
- 	     char **argv,		/* I - Command-line arguments */
- 	     char *filename) {          /* I - File name of input data */
-   const char	*cups_serverbin;	/* Location of programs */
-+  char          *backend_argv[8];	/* Arguments for backend */
-   char		scheme[1024],           /* Scheme from URI */
-                 *ptr,			/* Pointer into scheme */
--		cmdline[65536];		/* Backend command line */
--  int           retval;
-+		backend_path[2048];	/* Backend path */
-+  int           pid = 0, 		/* Process ID of backend */
-+                wait_pid,		/* Process ID from wait() */
-+                wait_status, 		/* Status from child */
-+                retval = 0;
-+  int           bytes;
- 
-  /*
-   * Build the backend command line...
-   */
- 
--  strncpy(scheme, uri, sizeof(scheme) - 1);
--  if (strlen(uri) > 1023)
--    scheme[1023] = '\0';
-+  scheme[0] = '\0';
-+  strncat(scheme, uri, sizeof(scheme) - 1);
-   if ((ptr = strchr(scheme, ':')) != NULL)
-     *ptr = '\0';
--
-+  else {
-+    fprintf(stderr,
-+	    "ERROR: beh: Invalid URI, no colon (':') to mark end of scheme part.\n");
-+    exit (CUPS_BACKEND_FAILED);
-+  }
-+  if (strchr(scheme, '/')) {
-+    fprintf(stderr,
-+	    "ERROR: beh: Invalid URI, scheme contains a slash ('/').\n");
-+    exit (CUPS_BACKEND_FAILED);
-+  }
-+  if (!strcmp(scheme, ".") || !strcmp(scheme, "..")) {
-+    fprintf(stderr,
-+	    "ERROR: beh: Invalid URI, scheme (\"%s\") is a directory.\n",
-+	    scheme);
-+    exit (CUPS_BACKEND_FAILED);
-+  }
-   if ((cups_serverbin = getenv("CUPS_SERVERBIN")) == NULL)
-     cups_serverbin = CUPS_SERVERBIN;
- 
-@@ -235,16 +255,29 @@ call_backend(char *uri,                 /* I - URI of final destination */
-     fprintf(stderr,
- 	    "ERROR: beh: Direct output into a file not supported.\n");
-     exit (CUPS_BACKEND_FAILED);
--  } else
--    snprintf(cmdline, sizeof(cmdline),
--	     "%s/backend/%s '%s' '%s' '%s' '%s' '%s' %s",
--	     cups_serverbin, scheme, argv[1], argv[2], argv[3],
--	     /* Apply number of copies only if beh was called with a
--		file name and not with the print data in stdin, as
--	        backends should handle copies only if they are called
--	        with a file name */
--	     (argc == 6 ? "1" : argv[4]),
--	     argv[5], filename);
-+  }
-+
-+  backend_argv[0] = uri;
-+  backend_argv[1] = argv[1];
-+  backend_argv[2] = argv[2];
-+  backend_argv[3] = argv[3];
-+  /* Apply number of copies only if beh was called with a file name
-+     and not with the print data in stdin, as backends should handle
-+     copies only if they are called with a file name */
-+  backend_argv[4] = (argc == 6 ? "1" : argv[4]);
-+  backend_argv[5] = argv[5];
-+  backend_argv[6] = filename;
-+  backend_argv[7] = NULL;
-+
-+  bytes = snprintf(backend_path, sizeof(backend_path),
-+		   "%s/backend/%s", cups_serverbin, scheme);
-+  if (bytes < 0 || bytes >= sizeof(backend_path))
-+  {
-+    fprintf(stderr,
-+	    "ERROR: beh: Invalid scheme (\"%s\"), could not determing backend path.\n",
-+	    scheme);
-+    return (CUPS_BACKEND_FAILED);
-+  }
- 
-  /*
-   * Overwrite the device URI and run the actual backend...
-@@ -253,18 +286,44 @@ call_backend(char *uri,                 /* I - URI of final destination */
-   setenv("DEVICE_URI", uri, 1);
- 
-   fprintf(stderr,
--	  "DEBUG: beh: Executing backend command line \"%s\"...\n",
--	  cmdline);
-+	  "DEBUG: beh: Executing backend command line \"%s '%s' '%s' '%s' '%s' '%s' %s\"...\n",
-+	  backend_path, backend_argv[1], backend_argv[2], backend_argv[3],
-+	  backend_argv[4], backend_argv[5], backend_argv[6]);
-   fprintf(stderr,
- 	  "DEBUG: beh: Using device URI: %s\n",
- 	  uri);
- 
--  retval = system(cmdline) >> 8;
-+  if ((pid = fork()) == 0) {
-+   /*
-+    * Child comes here...
-+    */
-+
-+    /* Run the backend */
-+    execv(backend_path, backend_argv);
- 
--  if (retval == -1)
-     fprintf(stderr, "ERROR: Unable to execute backend command line: %s\n",
- 	    strerror(errno));
- 
-+    exit(1);
-+  } else if (pid < 0) {
-+   /*
-+    * Unable to fork!
-+    */
-+
-+    return (CUPS_BACKEND_FAILED);
-+  }
-+
-+  while ((wait_pid = wait(&wait_status)) < 0 && errno == EINTR);
-+
-+  if (wait_pid >= 0 && wait_status) {
-+    if (WIFEXITED(wait_status))
-+      retval = WEXITSTATUS(wait_status);
-+    else if (WTERMSIG(wait_status) != SIGTERM)
-+      retval = WTERMSIG(wait_status);
-+    else
-+      retval = 0;
-+  }
-+
-   return (retval);
- }
- 
-@@ -277,8 +336,10 @@ static void
- sigterm_handler(int sig) {		/* I - Signal number (unused) */
-   (void)sig;
- 
--  fprintf(stderr,
--	  "DEBUG: beh: Job canceled.\n");
-+  const char * const msg = "DEBUG: beh: Job canceled.\n";
-+  /* The if() is to eliminate the return value and silence the warning
-+     about an unused return value. */
-+  if (write(2, msg, strlen(msg)));
- 
-   if (job_canceled)
-     _exit(CUPS_BACKEND_OK);
diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
index ded99a4774..c65265b0d8 100644
--- a/package/cups-filters/Config.in
+++ b/package/cups-filters/Config.in
@@ -2,19 +2,13 @@ config BR2_PACKAGE_CUPS_FILTERS
 	bool "cups-filters"
 	# needs fork()
 	depends on BR2_USE_MMU
-	depends on BR2_INSTALL_LIBSTDCPP # qpdf
+	depends on BR2_INSTALL_LIBSTDCPP # libcupsfilters -> qpdf
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_PACKAGE_CUPS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # qpdf
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC # qpdf
-	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_FONTCONFIG
-	select BR2_PACKAGE_FREETYPE
-	select BR2_PACKAGE_LCMS2
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_QPDF
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libcupsfilters -> qpdf
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # libcupsfilters -> qpdf
+	select BR2_PACKAGE_LIBCUPSFILTERS
+	select BR2_PACKAGE_LIBPPD
 	help
 	  This project provides backends, filters, and other software
 	  that was once part of the core CUPS distribution but is no
@@ -32,9 +26,8 @@ config BR2_PACKAGE_CUPS_FILTERS
 
 	  http://www.linuxfoundation.org/collaborate/workgroups/openprinting/cups-filters
 
-comment "cups-filters needs a toolchain w/ wchar, C++, threads and dynamic library, gcc >= 5"
+comment "cups-filters needs a toolchain w/ C++ and dynamic library, gcc >= 5"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/cups-filters/S82cups-browsed b/package/cups-filters/S82cups-browsed
deleted file mode 100644
index f17bbe7465..0000000000
--- a/package/cups-filters/S82cups-browsed
+++ /dev/null
@@ -1,48 +0,0 @@
-#!/bin/sh
-
-DAEMON="cups-browsed"
-PIDFILE="/var/run/$DAEMON.pid"
-
-start() {
-	printf 'Starting %s: ' "$DAEMON"
-	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
-		-- -c /etc/cups/cups-browsed.conf
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-stop() {
-	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p "$PIDFILE"
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		rm -f "$PIDFILE"
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-restart() {
-	stop
-	sleep 1
-	start
-}
-
-case "$1" in
-	start|stop|restart)
-		"$1";;
-	reload)
-		# Restart, since there is no true "reload" feature.
-		restart;;
-	*)
-		echo "Usage: $0 {start|stop|restart|reload}"
-		exit 1
-esac
diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
index 7fb3badf46..f4bd4126a4 100644
--- a/package/cups-filters/cups-filters.hash
+++ b/package/cups-filters/cups-filters.hash
@@ -1,3 +1,4 @@
 # Locally computed:
-sha256  01a2acbd6bb78f09638047e4e9ce305d7e5ef4cb9ed6949672b5d901b7321dd4  cups-filters-1.28.17.tar.gz
-sha256  38192ffdaca98b718f78b2d4abc38bb087f0bbcc9a16d212c98b903b985f900f  COPYING
+sha256  39e71de3ce06762b342749f1dc7cba6817738f7bf4d322c1bb9ab10b8569ab80  cups-filters-2.0.1.tar.xz
+sha256  944512aa3c095722752ea2eb1aa6c32ee9ffc3e7f9fb6aab5ea56f6b64ec42ec  COPYING
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index dcfb2e9500..9cee2b44ba 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -4,56 +4,24 @@
 #
 ################################################################################
 
-CUPS_FILTERS_VERSION = 1.28.17
+CUPS_FILTERS_VERSION = 2.0.1
+CUPS_FILTERS_SOURCE = cups-filters-$(CUPS_FILTERS_VERSION).tar.xz
 CUPS_FILTERS_SITE = https://github.com/OpenPrinting/cups-filters/releases/download/$(CUPS_FILTERS_VERSION)
-CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
-CUPS_FILTERS_LICENSE_FILES = COPYING
+CUPS_FILTERS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
+CUPS_FILTERS_LICENSE_FILES = COPYING LICENSE
 CUPS_FILTERS_CPE_ID_VENDOR = linuxfoundation
 
-# 0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
-CUPS_FILTERS_IGNORE_CVES += CVE-2023-24805
-
-CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
+CUPS_FILTERS_DEPENDENCIES = cups libcupsfilters libppd
 
 CUPS_FILTERS_CONF_OPTS = \
 	--disable-mutool \
 	--disable-foomatic \
-	--disable-braille \
+	--enable-pstops \
+	--enable-rastertopwg \
 	--enable-imagefilters \
+	--with-shell=/bin/sh \
 	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
-	--with-sysroot=$(STAGING_DIR) \
-	--with-pdftops=pdftops \
-	--with-jpeg \
-	--with-test-font-path=/dev/null \
-	--without-rcdir
-
-ifeq ($(BR2_PACKAGE_LIBPNG),y)
-CUPS_FILTERS_CONF_OPTS += --with-png
-CUPS_FILTERS_DEPENDENCIES += libpng
-else
-CUPS_FILTERS_CONF_OPTS += --without-png
-endif
-
-ifeq ($(BR2_PACKAGE_TIFF),y)
-CUPS_FILTERS_CONF_OPTS += --with-tiff
-CUPS_FILTERS_DEPENDENCIES += tiff
-else
-CUPS_FILTERS_CONF_OPTS += --without-tiff
-endif
-
-ifeq ($(BR2_PACKAGE_DBUS),y)
-CUPS_FILTERS_CONF_OPTS += --enable-dbus
-CUPS_FILTERS_DEPENDENCIES += dbus
-else
-CUPS_FILTERS_CONF_OPTS += --disable-dbus
-endif
-
-ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
-CUPS_FILTERS_DEPENDENCIES += avahi
-CUPS_FILTERS_CONF_OPTS += --enable-avahi
-else
-CUPS_FILTERS_CONF_OPTS += --disable-avahi
-endif
+	--with-sysroot=$(STAGING_DIR)
 
 ifeq ($(BR2_PACKAGE_GHOSTSCRIPT),y)
 CUPS_FILTERS_DEPENDENCIES += ghostscript
@@ -62,13 +30,6 @@ else
 CUPS_FILTERS_CONF_OPTS += --disable-ghostscript
 endif
 
-ifeq ($(BR2_PACKAGE_IJS),y)
-CUPS_FILTERS_DEPENDENCIES += ijs
-CUPS_FILTERS_CONF_OPTS += --enable-ijs
-else
-CUPS_FILTERS_CONF_OPTS += --disable-ijs
-endif
-
 ifeq ($(BR2_PACKAGE_POPPLER),y)
 CUPS_FILTERS_DEPENDENCIES += poppler
 CUPS_FILTERS_CONF_OPTS += --enable-poppler
@@ -76,21 +37,4 @@ else
 CUPS_FILTERS_CONF_OPTS += --disable-poppler
 endif
 
-ifeq ($(BR2_PACKAGE_LIBEXIF),y)
-CUPS_FILTERS_CONF_OPTS += --enable-exif
-CUPS_FILTERS_DEPENDENCIES += libexif
-else
-CUPS_FILTERS_CONF_OPTS += --disable-exif
-endif
-
-define CUPS_FILTERS_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/cups-filters/S82cups-browsed \
-		$(TARGET_DIR)/etc/init.d/S82cups-browsed
-endef
-
-define CUPS_FILTERS_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0755 $(@D)/utils/cups-browsed.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/cups-browsed.service
-endef
-
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
