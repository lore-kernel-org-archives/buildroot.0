Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F31C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 17:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9060583E26;
	Tue, 26 Apr 2022 17:36:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PYlQ2MFFLZAX; Tue, 26 Apr 2022 17:36:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9293083E21;
	Tue, 26 Apr 2022 17:36:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 833BC1BF5AD
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7012240519
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:36:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UWekHbGMoF1S for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 17:36:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F63F40499
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 17:36:04 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d5so11269181wrb.6
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 10:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jRQA8v+n+lHM8nlgJfcnBZLE8WNlvCfXEFc/Sx6nus8=;
 b=RLbUnw/242hXdEuTtCBmGKgbYG6Zq/kYzSl3lOvo44onpJLG/RaymyexUUGS4+yk/N
 GFRWNIXT3SkfEfljn6263NY7cHlXvqSQ8cOZsZrJG1SMEnVMnI08vR+mfp5pld+88H04
 ve4TqTas2oKF8xXydxtQGLhJVztoAwnL5SMAVd+3tAkrt/zDSxUnAF4taN92YYDXlIXT
 vfAsG7Vu40Xb3MWgW4SxKBgPXGA7ieSmvNHnHUgOF3AXHfF9KSD7/zafThSkpSHFZo6I
 ejSZfgEOowlvlw3Z+K5DK36H/tfnOX9KydUs3a4e4r/I3f+x4E7p/JEWiqI1w6PQbqCn
 IOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jRQA8v+n+lHM8nlgJfcnBZLE8WNlvCfXEFc/Sx6nus8=;
 b=flt8UoPxiNZjWdPVcq9f9AS0WH5+aazo5OiJAwHYs2aRR7/nX/nomUpVynvrZ1NUsI
 VfolbzzRmx2Z5+e6llOfaN+N8xKYCMl6Sgyn0ELuqku7LEcv42NiROBuVN17Gzsrv9ys
 FGYmFlpYLuXaH+SRnBZPaxtp/3F8IgSu1RD/GfhFtdHXGXZMKn2Mw5xcf/cDBpnny7SO
 mnfmVGQMoz7Qtz98MKoJDFtiuZD0JDukOZ+J1oYGEWK3SaAwvEAvSUsWMJD1DJX5rlSz
 Zd+r/sZmKRXku8t3+bUmufkCSN5ueXo5EwtBwV4QoWrZQoqUdeuuyZmf3CHk/IJA7DvI
 d3FQ==
X-Gm-Message-State: AOAM530hRKbmMheH0vCvm8g7uC8qIZx94Rx7UNUZU4vdidOLnNCGtRGi
 k/5AoxQxYrxXwqWzbAFrUc0WO73ivxU=
X-Google-Smtp-Source: ABdhPJwXAsy08BA6WWBUasJPtSxcUsNRYGGMQoMZSVFlxebUlprhD6zBY6DPHrBTTPqFtj/hebyj/A==
X-Received: by 2002:a05:6000:184e:b0:20a:ab4a:7239 with SMTP id
 c14-20020a056000184e00b0020aab4a7239mr19661703wri.321.1650994562468; 
 Tue, 26 Apr 2022 10:36:02 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a5d47ca000000b0020a992ce36esm13928172wrc.1.2022.04.26.10.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 10:36:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 19:34:03 +0200
Message-Id: <20220426173403.545488-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libevent: fix build with libressl
 >= 3.5.0
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

In file included from bufferevent_openssl.c:68:
bufferevent_openssl.c: In function 'bio_bufferevent_free':
openssl-compat.h:44:28: error: invalid use of incomplete typedef 'BIO' {aka 'struct bio_st'}
   44 | #define BIO_get_init(b) (b)->init
      |                            ^~
bufferevent_openssl.c:124:7: note: in expansion of macro 'BIO_get_init'
  124 |   if (BIO_get_init(b) && BIO_get_data(b))
      |       ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/273f9aa354a08ef3af6140b8dec086408bf5d574

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...define-BIO_get_init-for-LibreSSL-3-5.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/libevent/0001-Don-t-define-BIO_get_init-for-LibreSSL-3-5.patch

diff --git a/package/libevent/0001-Don-t-define-BIO_get_init-for-LibreSSL-3-5.patch b/package/libevent/0001-Don-t-define-BIO_get_init-for-LibreSSL-3-5.patch
new file mode 100644
index 0000000000..33c349b11d
--- /dev/null
+++ b/package/libevent/0001-Don-t-define-BIO_get_init-for-LibreSSL-3-5.patch
@@ -0,0 +1,29 @@
+From 883630f76cbf512003b81de25cd96cb75c6cf0f9 Mon Sep 17 00:00:00 2001
+From: Theo Buehler <tb@openbsd.org>
+Date: Sun, 21 Nov 2021 21:38:20 +0100
+Subject: [PATCH] Don't define BIO_get_init() for LibreSSL 3.5+
+
+BIO_get_init() is available in LibreSSL 3.5 and later. The BIO type
+will become opaque, so the existing macro will break the build.
+
+[Retrieved from:
+https://github.com/libevent/libevent/commit/883630f76cbf512003b81de25cd96cb75c6cf0f9]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ openssl-compat.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/openssl-compat.h b/openssl-compat.h
+index a23e34251b..f5de25539f 100644
+--- a/openssl-compat.h
++++ b/openssl-compat.h
+@@ -40,7 +40,8 @@ static inline BIO_METHOD *BIO_meth_new(int type, const char *name)
+ #endif /* (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
+ 	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x20700000L) */
+ 
+-#if defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x20700000L
++#if defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x20700000L && \
++	LIBRESSL_VERSION_NUMBER < 0x30500000L
+ #define BIO_get_init(b) (b)->init
+ #endif
+ 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
