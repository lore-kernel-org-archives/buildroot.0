Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1144FC2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 12:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0A5C60ED6;
	Wed,  3 Jul 2024 12:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HwcMgiRQS1rp; Wed,  3 Jul 2024 12:52:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B536C60EDA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B536C60EDA;
	Wed,  3 Jul 2024 12:52:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 245661BF2CE
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 12:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11B5460EDA
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 12:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ysRRKsS9qAr for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 12:52:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D497660ED6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D497660ED6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D497660ED6
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 12:52:16 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a729d9d7086so113358166b.0
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 05:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720011134; x=1720615934;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RnxpwKc5ypWdjKfqxMNN1RbDU8PmpknfaZWcFc6NVmI=;
 b=GjFkWbaIDZW2VYiWHmx4UTVPLMdWI4y8NZYvwO4nJohcPFGvPSEeC1m+e7DNUqCZ8C
 d/FvTci0Z6ylH93AmMnK0eNjaHGlw8qqX24OG4dkSah0t30yG92/U4yjuNSn1V2z1jCF
 StPH7zscsV3kTf3JgMjS2JtBMwFFaRZD5MxxoBq3Nprtmhoa/qIazR/X7JbSENUv8vhH
 MaYL+rDYN0O7HL1x03eZs8W3CpVmUy6iDAyvypYeGoJwixxhwY1guFycnwb06VuFs7yq
 60FuyA8C9OWD0xUDcGHDXjNZAF4yyBrsYJm4GZ/iKQDmKvupRA0IcyIdCdn7I/8O2lMM
 0dQA==
X-Gm-Message-State: AOJu0YwMDCt59+FRXU5ZbvNyTTRLwz1MdkrVoS7oL6uKBAUDu8xyak23
 ZsXYs6rMySqWeeo5YP0iLlZ4frNrx9d1GcsN74L51d7HfXu3K8u8oN2v7or4/fuTaApsdktgY/S
 rF4s=
X-Google-Smtp-Source: AGHT+IGDgDdldNifbBDwM7YWxOzkVikv7KcMB6mYfJPCqn51Rs0LqTSItqv3i0j9mnDKflVYlC3m0A==
X-Received: by 2002:a17:906:2a91:b0:a75:3c1d:f9d1 with SMTP id
 a640c23a62f3a-a77a242b8c6mr113808966b.16.1720011134418; 
 Wed, 03 Jul 2024 05:52:14 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:1a37:2bf3:7cf8:1941])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab0b341fsm507035766b.196.2024.07.03.05.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 05:52:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 14:52:11 +0200
Message-ID: <20240703125211.2711735-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720011134; x=1720615934;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RnxpwKc5ypWdjKfqxMNN1RbDU8PmpknfaZWcFc6NVmI=;
 b=EPdKKsIfUlBPkF3MyfD6f7pY0FrnNi5x8VdbRlhYYTQbYwD2xyWMub321Os+6/6WVi
 HwR0HIjugOf78K9eLepk2RfCW9wRb6/obxwEeK614UIP1WXvwsMjJhASnG5DLrYH/oax
 Sczi983afvl2zAkeFc6C1ua5hMZ/S8Tm/NB+c=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EPdKKsIf
Subject: [Buildroot] [PATCH 1/1] package/libfcgi: update the patches to be
 applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, libfcgi fails to build with output:

    Applying 0001-link-against-math.patch using patch:
    patching file libfcgi/Makefile.am
    Hunk #1 FAILED at 18.
    1 out of 1 hunk FAILED -- saving rejects to file libfcgi/Makefile.am.rej

    Applying 0002-disable-examples.patch using patch:
    patching file Makefile.am
    Hunk #1 FAILED at 4.
    1 out of 1 hunk FAILED -- saving rejects to file Makefile.am.rej

This commit refreshes the package patches on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                          | 2 +-
 package/libfcgi/0001-link-against-math.patch | 4 +++-
 package/libfcgi/0002-disable-examples.patch  | 8 +++++---
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index dca725345353..ca94fb56b092 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -809,7 +809,7 @@ package/libeXosip2/0001-src-eXtl_dtls.c-fix-build-with-libressl-3.4.1.patch lib_
 package/libedit/0001-check-bsd-functions-in-libbsd.patch lib_patch.Upstream
 package/libevent/0001-Don-t-define-BIO_get_init-for-LibreSSL-3-5.patch lib_patch.Upstream
 package/libfcgi/0001-link-against-math.patch lib_patch.Upstream
-package/libfcgi/0002-disable-examples.patch lib_patch.Sob lib_patch.Upstream
+package/libfcgi/0002-disable-examples.patch lib_patch.Upstream
 package/libffi/0001-Fix-use-of-compact-eh-frames-on-MIPS.patch lib_patch.Upstream
 package/libfm/0001-modules-fix-cross-compilation.patch lib_patch.Upstream
 package/libfreeimage/0001-no-root-install.patch lib_patch.Upstream
diff --git a/package/libfcgi/0001-link-against-math.patch b/package/libfcgi/0001-link-against-math.patch
index efba67123e21..909a295bd617 100644
--- a/package/libfcgi/0001-link-against-math.patch
+++ b/package/libfcgi/0001-link-against-math.patch
@@ -3,12 +3,14 @@ Link libfcgi against the math library.
 Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
 [Louis: rebase on top of 2.4.2]
 Signed-off-by: Louis Rannou <louis.rannou@smile.fr>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 Index: b/libfcgi/Makefile.am
 ===================================================================
 --- a/libfcgi/Makefile.am
 +++ b/libfcgi/Makefile.am
-@@ -18,4 +18,5 @@
+@@ -19,6 +19,7 @@
                       os_@SYSTEM@.c
  libfcgi_la_CC      = @PTHREAD_CC@
  libfcgi_la_CFLAGS  = @PTHREAD_CFLAGS@
diff --git a/package/libfcgi/0002-disable-examples.patch b/package/libfcgi/0002-disable-examples.patch
index 4a9916f02af8..ccd01c0ce03c 100644
--- a/package/libfcgi/0002-disable-examples.patch
+++ b/package/libfcgi/0002-disable-examples.patch
@@ -1,3 +1,5 @@
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 Common subdirectories: libfcgi-2.4.0.orig/cgi-fcgi and libfcgi-2.4.0/cgi-fcgi
 Common subdirectories: libfcgi-2.4.0.orig/doc and libfcgi-2.4.0/doc
 Common subdirectories: libfcgi-2.4.0.orig/examples and libfcgi-2.4.0/examples
@@ -8,9 +10,9 @@ Common subdirectories: libfcgi-2.4.0.orig/libfcgi and libfcgi-2.4.0/libfcgi
 diff -du libfcgi-2.4.0.orig/Makefile.am libfcgi-2.4.0/Makefile.am
 --- libfcgi-2.4.0.orig/Makefile.am	2001-12-22 14:05:39.000000000 +0100
 +++ libfcgi-2.4.0/Makefile.am	2014-07-19 16:56:21.935216540 +0200
-@@ -4,7 +4,7 @@
- #  $Id: Makefile.am,v 1.7 2001/12/22 13:05:39 robs Exp $
- #
+@@ -10,7 +10,7 @@
+ 		aclocal.m4 m4/libtool.m4 m4/lt*.m4 Makefile.in install-sh missing ltmain.sh \
+ 		COPYING INSTALL
  
 -SUBDIRS = libfcgi cgi-fcgi examples include
 +SUBDIRS = libfcgi cgi-fcgi include
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
