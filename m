Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF3CC433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 16:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10E81840F3;
	Fri,  1 Apr 2022 16:59:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AyMYpS1WjEEt; Fri,  1 Apr 2022 16:59:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D2F5840C4;
	Fri,  1 Apr 2022 16:59:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84F021BF20B
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 16:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B0AF408C1
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 16:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N5TVIEYn3N6K for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 16:59:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 636B240133
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 16:59:34 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id u16so5137223wru.4
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 09:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tiBUbUBvDvR4p3zaS4QBOYenC3h+ab2EieeFGakMZ/s=;
 b=nvADISxmiW+vMuqQ8pmW6m7BL6ztPlp+5iWhvoEjRVEAKWJlhgVDUFj4VvYPVTYb+Q
 ACeGdzWUfl/E5Y9o7fO8yGVztpk2DsGzWIwwMW6AgGLqyrKB4iwe+26OmrjrDf3IRMKt
 LxcUrSv9YHzoEHKT70CsN/wlgcqE+ANQZZE0e+ppKp2bluQF0JtWCDf0E3AW3c50tiPL
 oQPlR3brGgZXUy7JoSGOyVnoPo/tQIbRVsg6skT5GTBlciEa9r5BLz3oKEr26xqstO02
 zdGiVIiMXgILhDp1GPFl5V8LkepctqihjiD8d8U3kovFIfK528tQnJDV/ePuS/QHAZ7B
 B/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tiBUbUBvDvR4p3zaS4QBOYenC3h+ab2EieeFGakMZ/s=;
 b=OtTOfUlpANCJvNGddtfbMpq5V2dAHJoA4ppLtN6POJseuHR7V2MMvehzp0leXLR8Oy
 sA6Jw1h03UhkP6kUjgMchkFM+/Ky+Y1bQ0Kxhnj/NoNUg5emYRHGMJ3uf8TIwJjRTMUJ
 7SvW7EWTHHI+ooaIgWj1mOXVXMoWErF89aze0hJLUMkDFEs4ODVvD3NmzkMMIB4KKWw/
 ax3b7Jh2p47Uka7vVce9ttgYeOuMXZujkjcvPDrvPWk7Y/bTDEOSg/9yWmn2h7dnad84
 H1yasZpbtVPGlpNuuAXBDvQaqZs/20rVsdAWts5PBslkfYpwsP3YTuE90Z/BpTO1VD2z
 ooxg==
X-Gm-Message-State: AOAM53087KHNACmEtltx2h8sSxKYomYHTYDW4yu8xEQ+DMzt/QRy37a0
 ingRl9wycITqUvhXJUp2u0W9GBE2Llg=
X-Google-Smtp-Source: ABdhPJxZdmREwmpjm3ClZRih+Xd/aS9OnXF2jH07D91jC8RQ+ZyLFgtchJqCZr5l/YuyeuKD4ZDJMA==
X-Received: by 2002:a05:6000:3c6:b0:203:ed4f:a2b with SMTP id
 b6-20020a05600003c600b00203ed4f0a2bmr8583081wrg.48.1648832372362; 
 Fri, 01 Apr 2022 09:59:32 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 b5-20020adfde05000000b00205bdc6bd57sm2752291wrm.95.2022.04.01.09.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 09:59:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Apr 2022 18:57:22 +0200
Message-Id: <20220401165722.540239-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/postgresql: fix pkg-config without
 openssl
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libdbi-drivers raised since bump to
version 14.1 in commit c9bd02911565819789120370178e82da5dfbacc0 and
https://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=beff361bc1edc24ee5f8b2073a1e5e4c92ea66eb:

configure: error: Package requirements (libpq) were not met:

Package 'libssl', required by 'libpq', not found
Package 'libcrypto', required by 'libpq', not found

Fixes:
 - http://autobuild.buildroot.org/results/415cb61a58b928a42623ed90b0b60c59032f0a4e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...libpq-Fix-pkg-config-without-OpenSSL.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/postgresql/0001-libpq-Fix-pkg-config-without-OpenSSL.patch

diff --git a/package/postgresql/0001-libpq-Fix-pkg-config-without-OpenSSL.patch b/package/postgresql/0001-libpq-Fix-pkg-config-without-OpenSSL.patch
new file mode 100644
index 0000000000..90b0577a20
--- /dev/null
+++ b/package/postgresql/0001-libpq-Fix-pkg-config-without-OpenSSL.patch
@@ -0,0 +1,34 @@
+From 465ab24296c27502c81c8c197725cba728b9b057 Mon Sep 17 00:00:00 2001
+From: Peter Eisentraut <peter@eisentraut.org>
+Date: Fri, 1 Apr 2022 17:12:56 +0200
+Subject: [PATCH] libpq: Fix pkg-config without OpenSSL
+
+Do not add OpenSSL dependencies to libpq pkg-config file if OpenSSL is
+not enabled.  Oversight in beff361bc1edc24ee5f8b2073a1e5e4c92ea66eb.
+
+Author: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Discussion: https://www.postgresql.org/message-id/flat/20220331163759.32665-1-fontaine.fabrice%40gmail.com
+[Retrieved from:
+https://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=465ab24296c27502c81c8c197725cba728b9b057]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/interfaces/libpq/Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/interfaces/libpq/Makefile b/src/interfaces/libpq/Makefile
+index 89bf5e0126..b5fd72a4ac 100644
+--- a/src/interfaces/libpq/Makefile
++++ b/src/interfaces/libpq/Makefile
+@@ -95,7 +95,9 @@ SHLIB_PREREQS = submake-libpgport
+ 
+ SHLIB_EXPORTS = exports.txt
+ 
++ifeq ($(with_ssl),openssl)
+ PKG_CONFIG_REQUIRES_PRIVATE = libssl libcrypto
++endif
+ 
+ all: all-lib libpq-refs-stamp
+ 
+-- 
+2.30.2
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
