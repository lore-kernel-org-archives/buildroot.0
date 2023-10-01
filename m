Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03883E78480
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 19:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFB0781467;
	Sun,  1 Oct 2023 19:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFB0781467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e2v405UQ-bFD; Sun,  1 Oct 2023 19:16:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B997481F0D;
	Sun,  1 Oct 2023 19:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B997481F0D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8D7A1BF588
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 19:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCF598145D
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 19:15:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCF598145D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5wjf6IDcsuIJ for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 19:15:49 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A7FB8143A
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 19:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A7FB8143A
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-406618d080eso18492565e9.2
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 12:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696187746; x=1696792546;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pU4Q1tDn/dr7382BHg4+5nqjVzmwAF/owW5V28bPBhg=;
 b=v//4QFS7MShjwZJKaUgVumW0+rHNAqTXc2/T8+IftsAR8QhNDY9hQ0wypU1eZPIo/0
 y9lFj8u17d66fVmlsDwBERxNX+m2Yturv29RnwWsy1xf4wU/P8tiB3K3HyAOVno3GNeZ
 8wTxKRA8yfo1IsckV/biCHUqvVsqvGgoMFUimUV6aSWPny9pZ5xfPPq4OZr+yrYar9SL
 Z0wHkT09uUFUtH/nUBeF+Pgc5rqVWrKBT5YYkD7uK42RdvHiRealkr9pLjQ3UIHKaU+v
 XiC2rHAkuepsN8zvAYiUOxYLmBo1IqHCMwjiGrDwuMwkBaBlSSB0wboMbo7cE1VmB8gf
 E/sA==
X-Gm-Message-State: AOJu0Yww8rFXWxibQ8541zfuHcQ7Em61FTszDCGsmn6Jw63sSktAqpM5
 PGIC7r0KkbXhncXofl/l7FG3J0V8UiM=
X-Google-Smtp-Source: AGHT+IEC23TOtixLJ0E9xM2LtAOGpvT9sJ/ZRxLgt6lNnc2aMsNI/hKg8oHJdx9QZPq4Y6G/91JppA==
X-Received: by 2002:a05:600c:2283:b0:3fc:7eb:1119 with SMTP id
 3-20020a05600c228300b003fc07eb1119mr7758452wmf.15.1696187745995; 
 Sun, 01 Oct 2023 12:15:45 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s16-20020a05600c045000b0040536dcec17sm5777696wmb.27.2023.10.01.12.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 12:15:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 21:15:22 +0200
Message-Id: <20231001191522.1799946-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696187746; x=1696792546; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pU4Q1tDn/dr7382BHg4+5nqjVzmwAF/owW5V28bPBhg=;
 b=HWyoY7VBBNymNWR3z9cUyfH+Rb/x6/xnoZ8k49MLVi6YbAEA5iZ4wv+PMnN8wn2sFI
 WNblvBFN35o7FOX1XMDrmhtVSLVOY2CHyCmSfhfdrmw6/sbp5RojUbr+DrzDRl1loTrr
 XngZcW2gfnGSh++C87xz6COfLp+RSngYgA2T7jVxgIk0hIgSaZQ+opQakTAN0ycw5YVO
 g0uzqwudK+TtTl64RI9ReIs3POE/GQdqHxuZQXUlUsKnZ+gRpYtmp9HhJ7Y06/tlYPvo
 JZYBgSqE3yN7W1JQYV2pDyNcTEAQanEKtR85xMCL7AFYxZj5xQZGap1HbvSFgb4Zk6y7
 FtbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HWyoY7VB
Subject: [Buildroot] [PATCH 1/1] package/cups-filters: fix CVE-2023-24805
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-24805: cups-filters contains backends, filters, and other
software required to get the cups printing service working on operating
systems other than macos. If you use the Backend Error Handler (beh) to
create an accessible network printer, this security vulnerability can
cause remote code execution. `beh.c` contains the line `retval =
system(cmdline) >> 8;` which calls the `system` command with the operand
`cmdline`. `cmdline` contains multiple user controlled, unsanitized
values. As a result an attacker with network access to the hosted print
server can exploit this vulnerability to inject system commands which
are executed in the context of the running server. This issue has been
addressed in commit `8f2740357` and is expected to be bundled in the
next release. Users are advised to upgrade when possible and to restrict
access to network printers in the meantime.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ecv-instead-of-system-CVE-2023-24805.patch | 208 ++++++++++++++++++
 package/cups-filters/cups-filters.mk          |   3 +
 2 files changed, 211 insertions(+)
 create mode 100644 package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch

diff --git a/package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch b/package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
new file mode 100644
index 0000000000..e527b20f91
--- /dev/null
+++ b/package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
@@ -0,0 +1,208 @@
+From 93e60d3df358c0ae6f3dba79e1c9684657683d89 Mon Sep 17 00:00:00 2001
+From: Till Kamppeter <till.kamppeter@gmail.com>
+Date: Wed, 17 May 2023 11:11:29 +0200
+Subject: [PATCH] beh backend: Use execv() instead of system() - CVE-2023-24805
+
+With execv() command line arguments are passed as separate strings and
+not the full command line in a single string. This prevents arbitrary
+command execution by escaping the quoting of the arguments in a job
+with a forged job title.
+
+In addition, done the following fixes and improvements:
+
+- Do not allow '/' in the scheme of the URI (= backend executable
+  name), to assure that only backends inside /usr/lib/cups/backend/
+  are used.
+
+- URI must have ':', to split off scheme, otherwise error out.
+
+- Check return value of snprintf() to create call path for backend, to
+  error out on truncation of a too long scheme or on complete failure
+  due to a completely odd scheme.
+
+- Use strncat() instead of strncpy() for getting scheme from URI, the latter
+  does not require setting terminating zero byte in case of truncation.
+
+- Also exclude "." or ".." as scheme, as directories are not valid CUPS
+  backends.
+
+- Do not use fprintf() in sigterm_handler(), to not interfere with a
+  fprintf() which could be running in the main process when
+  sigterm_handler() is triggered.
+
+- Use "static volatile int" for global variable job_canceled.
+
+Upstream: https://github.com/OpenPrinting/cups-filters/commit/93e60d3df358c0ae6f3dba79e1c9684657683d89
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ backend/beh.c | 107 +++++++++++++++++++++++++++++++++++++++-----------
+ 1 file changed, 84 insertions(+), 23 deletions(-)
+
+diff --git a/backend/beh.c b/backend/beh.c
+index 225fd27d5..8d51235b1 100644
+--- a/backend/beh.c
++++ b/backend/beh.c
+@@ -22,12 +22,13 @@
+ #include "backend-private.h"
+ #include <cups/array.h>
+ #include <ctype.h>
++#include <sys/wait.h>
+ 
+ /*
+  * Local globals...
+  */
+ 
+-static int		job_canceled = 0; /* Set to 1 on SIGTERM */
++static volatile int	job_canceled = 0; /* Set to 1 on SIGTERM */
+ 
+ /*
+  * Local functions...
+@@ -213,21 +214,40 @@ call_backend(char *uri,                 /* I - URI of final destination */
+ 	     char **argv,		/* I - Command-line arguments */
+ 	     char *filename) {          /* I - File name of input data */
+   const char	*cups_serverbin;	/* Location of programs */
++  char          *backend_argv[8];	/* Arguments for backend */
+   char		scheme[1024],           /* Scheme from URI */
+                 *ptr,			/* Pointer into scheme */
+-		cmdline[65536];		/* Backend command line */
+-  int           retval;
++		backend_path[2048];	/* Backend path */
++  int           pid = 0, 		/* Process ID of backend */
++                wait_pid,		/* Process ID from wait() */
++                wait_status, 		/* Status from child */
++                retval = 0;
++  int           bytes;
+ 
+  /*
+   * Build the backend command line...
+   */
+ 
+-  strncpy(scheme, uri, sizeof(scheme) - 1);
+-  if (strlen(uri) > 1023)
+-    scheme[1023] = '\0';
++  scheme[0] = '\0';
++  strncat(scheme, uri, sizeof(scheme) - 1);
+   if ((ptr = strchr(scheme, ':')) != NULL)
+     *ptr = '\0';
+-
++  else {
++    fprintf(stderr,
++	    "ERROR: beh: Invalid URI, no colon (':') to mark end of scheme part.\n");
++    exit (CUPS_BACKEND_FAILED);
++  }
++  if (strchr(scheme, '/')) {
++    fprintf(stderr,
++	    "ERROR: beh: Invalid URI, scheme contains a slash ('/').\n");
++    exit (CUPS_BACKEND_FAILED);
++  }
++  if (!strcmp(scheme, ".") || !strcmp(scheme, "..")) {
++    fprintf(stderr,
++	    "ERROR: beh: Invalid URI, scheme (\"%s\") is a directory.\n",
++	    scheme);
++    exit (CUPS_BACKEND_FAILED);
++  }
+   if ((cups_serverbin = getenv("CUPS_SERVERBIN")) == NULL)
+     cups_serverbin = CUPS_SERVERBIN;
+ 
+@@ -235,16 +255,29 @@ call_backend(char *uri,                 /* I - URI of final destination */
+     fprintf(stderr,
+ 	    "ERROR: beh: Direct output into a file not supported.\n");
+     exit (CUPS_BACKEND_FAILED);
+-  } else
+-    snprintf(cmdline, sizeof(cmdline),
+-	     "%s/backend/%s '%s' '%s' '%s' '%s' '%s' %s",
+-	     cups_serverbin, scheme, argv[1], argv[2], argv[3],
+-	     /* Apply number of copies only if beh was called with a
+-		file name and not with the print data in stdin, as
+-	        backends should handle copies only if they are called
+-	        with a file name */
+-	     (argc == 6 ? "1" : argv[4]),
+-	     argv[5], filename);
++  }
++
++  backend_argv[0] = uri;
++  backend_argv[1] = argv[1];
++  backend_argv[2] = argv[2];
++  backend_argv[3] = argv[3];
++  /* Apply number of copies only if beh was called with a file name
++     and not with the print data in stdin, as backends should handle
++     copies only if they are called with a file name */
++  backend_argv[4] = (argc == 6 ? "1" : argv[4]);
++  backend_argv[5] = argv[5];
++  backend_argv[6] = filename;
++  backend_argv[7] = NULL;
++
++  bytes = snprintf(backend_path, sizeof(backend_path),
++		   "%s/backend/%s", cups_serverbin, scheme);
++  if (bytes < 0 || bytes >= sizeof(backend_path))
++  {
++    fprintf(stderr,
++	    "ERROR: beh: Invalid scheme (\"%s\"), could not determing backend path.\n",
++	    scheme);
++    return (CUPS_BACKEND_FAILED);
++  }
+ 
+  /*
+   * Overwrite the device URI and run the actual backend...
+@@ -253,18 +286,44 @@ call_backend(char *uri,                 /* I - URI of final destination */
+   setenv("DEVICE_URI", uri, 1);
+ 
+   fprintf(stderr,
+-	  "DEBUG: beh: Executing backend command line \"%s\"...\n",
+-	  cmdline);
++	  "DEBUG: beh: Executing backend command line \"%s '%s' '%s' '%s' '%s' '%s' %s\"...\n",
++	  backend_path, backend_argv[1], backend_argv[2], backend_argv[3],
++	  backend_argv[4], backend_argv[5], backend_argv[6]);
+   fprintf(stderr,
+ 	  "DEBUG: beh: Using device URI: %s\n",
+ 	  uri);
+ 
+-  retval = system(cmdline) >> 8;
++  if ((pid = fork()) == 0) {
++   /*
++    * Child comes here...
++    */
++
++    /* Run the backend */
++    execv(backend_path, backend_argv);
+ 
+-  if (retval == -1)
+     fprintf(stderr, "ERROR: Unable to execute backend command line: %s\n",
+ 	    strerror(errno));
+ 
++    exit(1);
++  } else if (pid < 0) {
++   /*
++    * Unable to fork!
++    */
++
++    return (CUPS_BACKEND_FAILED);
++  }
++
++  while ((wait_pid = wait(&wait_status)) < 0 && errno == EINTR);
++
++  if (wait_pid >= 0 && wait_status) {
++    if (WIFEXITED(wait_status))
++      retval = WEXITSTATUS(wait_status);
++    else if (WTERMSIG(wait_status) != SIGTERM)
++      retval = WTERMSIG(wait_status);
++    else
++      retval = 0;
++  }
++
+   return (retval);
+ }
+ 
+@@ -277,8 +336,10 @@ static void
+ sigterm_handler(int sig) {		/* I - Signal number (unused) */
+   (void)sig;
+ 
+-  fprintf(stderr,
+-	  "DEBUG: beh: Job canceled.\n");
++  const char * const msg = "DEBUG: beh: Job canceled.\n";
++  /* The if() is to eliminate the return value and silence the warning
++     about an unused return value. */
++  if (write(2, msg, strlen(msg)));
+ 
+   if (job_canceled)
+     _exit(CUPS_BACKEND_OK);
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 19c859e602..dcfb2e9500 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -10,6 +10,9 @@ CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+,
 CUPS_FILTERS_LICENSE_FILES = COPYING
 CUPS_FILTERS_CPE_ID_VENDOR = linuxfoundation
 
+# 0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
+CUPS_FILTERS_IGNORE_CVES += CVE-2023-24805
+
 CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
 
 CUPS_FILTERS_CONF_OPTS = \
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
