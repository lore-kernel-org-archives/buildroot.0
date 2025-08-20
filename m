Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B079CA0EE4
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 16:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E637F80F9E;
	Wed, 20 Aug 2025 16:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VaFIDB3m42yQ; Wed, 20 Aug 2025 16:39:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B481A80EAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B481A80EAB;
	Wed, 20 Aug 2025 16:39:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 42977DE6
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28FF7405F2
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2fXXm9jjVN-m for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 16:39:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA19440621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA19440621
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA19440621
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:39:30 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45a1b004954so587985e9.0
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 09:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755707969; x=1756312769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DjhHfH3VlPBRxPSYyQh4gZn3wqzcc7Rr2J60ySkuF+U=;
 b=TUmc7Fir7eptLtd7lxVARutWMzCVRSpC9Ulmo+iadUDrv6wPpSXZrM5Aa0QdRpUFO+
 Gf1PEkvZ0LF/yutQoiLeUxEw17WKhGSp2dtDlkqlbs7WQkZIJogyYx1f2bi84dvwixxY
 jZDoEULcboVirS/vYqw0x3MsC9eFaYXr0FY7SwpJraU92iQ9ERCaNfUGRdwDYOnD0I1o
 qrZ4Ubr5WOj9AY3yjgDrK278QVhwly0JuoGGlPnyLZFkfgk1sIBKJePFQfXYGe20tWo0
 Fvu+WvgoDKjaIDValEPymhFbHiI1yhT7RG6Bd1LJOwW71yiyFLy7binmpsW3t4vpPBLG
 YG8A==
X-Gm-Message-State: AOJu0YxB0cLY17Vjz2Z8pnBBG/zp00Sq/xCG+ruKIcGu8Jr8rKqWjVZ8
 IE1/IbAiH/vcVMY/ijUUujzTJQc/1Tfv0ur8xP9X4eHdKVLYxX9eiJ3lf8Av4jXM
X-Gm-Gg: ASbGncutBsSqlY/dy8DCHXZoCC+I/N3HkzuN2bCuw+dp8e9EAJDXjOB54ZzfbE1yON+
 FdCO2piQ0idoCo+BIuoGBscKZYi9JSPnVwkfHJBEcthtxvhggyuessDtowl92GjZZP6TfuaBI7W
 8dnlKghqtdg/0waTaxY2x6Q9mrRP53lT55WBNKiHlPpUGc7FWnZteQm/tU3xGFtOFSO51lWupxK
 VMLcCeLVGLi51kH8rT/9jprhBNnSaR+6OECaeL5K3n17ku3BGf5lmcLsR68hOoFGUiIziBday92
 t665P/jiGvi85z0zBIWXQmvy5MTlXw1+aCSxODEyaA5oRJX5K/dMWTafyktDBj5SkmZIVKqRGjV
 RBMQXUoDyfRUUTdvChZc7qYZk+C3lkOylJZqVjGx6wq2cEqEy+6BvCaK2
X-Google-Smtp-Source: AGHT+IGH7hMX0/RoxLRw61EAC7CrG2bmhmagVuET4tScIepVpjoitm7ce4oKAWEcI6GoekmHbBZtaQ==
X-Received: by 2002:a05:600c:6085:b0:456:1156:e5f5 with SMTP id
 5b1f17b1804b1-45b47ce4f56mr33082065e9.31.1755707968494; 
 Wed, 20 Aug 2025 09:39:28 -0700 (PDT)
Received: from localhost.localdomain ([212.22.141.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b47c6d857sm37412195e9.26.2025.08.20.09.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 09:39:27 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 20 Aug 2025 18:39:21 +0200
Message-Id: <20250820163921.1968030-5-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820163921.1968030-1-angelo.compagnucci@gmail.com>
References: <20250820163921.1968030-1-angelo.compagnucci@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755707969; x=1756312769; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DjhHfH3VlPBRxPSYyQh4gZn3wqzcc7Rr2J60ySkuF+U=;
 b=j4nef6amteA0VEYSXPkKUM6MkIdHlOEprKXUzbSoEo8iFiFotbe5NZzdgxcX4h+D0W
 v4FeRTlI3dyqiWnDaqJ/PeB4nquqbzoBDBvFOUZKEbedWy7nQuJCaUOedzr8UDWO7S9F
 VSBdAQhM/u8j7p2pGdR2ib+8K3nH0LNqi4BVo8XOTTm3+AilgkGWlCOoNjtqpujLGjmo
 5DAKmeAfSU5GvI5CzdB6+T0RnvR/VK9bChPaHDCQ3VIq8LqqCk9L4OepnxevRxXXA/iK
 +7Pjlol25pa5D0fcHWmaZcDjTBQEfVQLNtrGXp93cXOa74JNl+fwrXvZFHhkeNsZUK8R
 H0AA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j4nef6am
Subject: [Buildroot] [PATCH 4/4 v2] package/cups-filters: bump to version
 2.0.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/OpenPrinting/cups-filters/releases/tag/2.0.1

This version makes use of two ancillary libraries split from the main code.
Those libraries are:
* libcupsfilters
* libppd

This required a major rework of the package because most of the dependencies
were moved those new libraries.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 ...ecv-instead-of-system-CVE-2023-24805.patch | 208 ------------------
 package/cups-filters/Config.in                |  16 +-
 package/cups-filters/cups-filters.hash        |   2 +-
 package/cups-filters/cups-filters.mk          |  70 +-----
 4 files changed, 10 insertions(+), 286 deletions(-)
 delete mode 100644 package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch

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
index ded99a4774..89f4b4d08d 100644
--- a/package/cups-filters/Config.in
+++ b/package/cups-filters/Config.in
@@ -2,19 +2,15 @@ config BR2_PACKAGE_CUPS_FILTERS
 	bool "cups-filters"
 	# needs fork()
 	depends on BR2_USE_MMU
-	depends on BR2_INSTALL_LIBSTDCPP # qpdf
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_PACKAGE_CUPS
+	depends on BR2_PACKAGE_LIBCUPSFILTERS
+	depends on BR2_PACKAGE_LIBPPD
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # qpdf
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC # qpdf
-	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_FONTCONFIG
-	select BR2_PACKAGE_FREETYPE
-	select BR2_PACKAGE_LCMS2
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_QPDF
 	help
 	  This project provides backends, filters, and other software
 	  that was once part of the core CUPS distribution but is no
diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
index 7fb3badf46..24c7b463f7 100644
--- a/package/cups-filters/cups-filters.hash
+++ b/package/cups-filters/cups-filters.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  01a2acbd6bb78f09638047e4e9ce305d7e5ef4cb9ed6949672b5d901b7321dd4  cups-filters-1.28.17.tar.gz
+sha256  3de1cbb889d06e5a6a945dcb921292544477ab89da95ca89f1eec2de29937afb  cups-filters-2.0.1.tar.gz
 sha256  38192ffdaca98b718f78b2d4abc38bb087f0bbcc9a16d212c98b903b985f900f  COPYING
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index dcfb2e9500..328b6693e9 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_FILTERS_VERSION = 1.28.17
+CUPS_FILTERS_VERSION = 2.0.1
 CUPS_FILTERS_SITE = https://github.com/OpenPrinting/cups-filters/releases/download/$(CUPS_FILTERS_VERSION)
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
@@ -13,75 +13,11 @@ CUPS_FILTERS_CPE_ID_VENDOR = linuxfoundation
 # 0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
 CUPS_FILTERS_IGNORE_CVES += CVE-2023-24805
 
-CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
+CUPS_FILTERS_DEPENDENCIES = cups libcupsfilters libppd
 
 CUPS_FILTERS_CONF_OPTS = \
-	--disable-mutool \
-	--disable-foomatic \
-	--disable-braille \
-	--enable-imagefilters \
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
-
-ifeq ($(BR2_PACKAGE_GHOSTSCRIPT),y)
-CUPS_FILTERS_DEPENDENCIES += ghostscript
-CUPS_FILTERS_CONF_OPTS += --enable-ghostscript
-else
-CUPS_FILTERS_CONF_OPTS += --disable-ghostscript
-endif
-
-ifeq ($(BR2_PACKAGE_IJS),y)
-CUPS_FILTERS_DEPENDENCIES += ijs
-CUPS_FILTERS_CONF_OPTS += --enable-ijs
-else
-CUPS_FILTERS_CONF_OPTS += --disable-ijs
-endif
-
-ifeq ($(BR2_PACKAGE_POPPLER),y)
-CUPS_FILTERS_DEPENDENCIES += poppler
-CUPS_FILTERS_CONF_OPTS += --enable-poppler
-else
-CUPS_FILTERS_CONF_OPTS += --disable-poppler
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEXIF),y)
-CUPS_FILTERS_CONF_OPTS += --enable-exif
-CUPS_FILTERS_DEPENDENCIES += libexif
-else
-CUPS_FILTERS_CONF_OPTS += --disable-exif
-endif
+	CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
 
 define CUPS_FILTERS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/cups-filters/S82cups-browsed \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
