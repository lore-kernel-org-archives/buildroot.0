Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF8DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 22:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11744408B1;
	Fri, 28 Jan 2022 22:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SD51ExIqRJ0o; Fri, 28 Jan 2022 22:09:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F6CD408AA;
	Fri, 28 Jan 2022 22:09:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51FB21BF40A
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 22:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EB9583410
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 22:09:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yvmQBym4wmo0 for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 22:09:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5209D830E3
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 22:09:28 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id c23so13416405wrb.5
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 14:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x6uuWR/Hb1UqLnh7/xrQjp35tCtWV0kfyNFWlSK5054=;
 b=LVRB1Kqmv/7MN8QzwY3MmgQyztH7FoaPW6ExvCfoHLijPOoKSEu+EFwKV5Q6n7so+5
 g8RBQ4ypewCDffTyFw2q9U9/auLea0Fno+Ov+p7WeNR4sRq2jX+3JQKQqrvLmWV/HStK
 DkJya6lOT8O/NfmNfEAlxO8Fb5PbIcSQ5YQgx83psLrXGK3MnshnbVVjw477hMvMsDy5
 LrL95UO9HX5VCA9lsIyHtFAF4XC2blScAVEKB5uJuS++MGzOGry2gy2/q3/eUhJ+4C2g
 qJWcwVjyCcNSQdw3EuCKvnJgV5JxG7gm5OZTXJwm/UH+dVY/oMsfeojxR7NHndu58hom
 xygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x6uuWR/Hb1UqLnh7/xrQjp35tCtWV0kfyNFWlSK5054=;
 b=5dtaPIoSw2qsKcfMpr4GAZTWy7PkWUBFP92wTEUMyJRog9xGtp2uuEC0LRCmUnOYD4
 q+o+mYIGgR6lJ2LKInpxcNH+rRWjGKtagpbxOWYCt9puHyRjCnjR0RglpxaJvkV3OVfU
 rT4PwVdOmlFQS0hxa0vM2cRsyQMB2z8wAicFmbRI42IVVgitAm0No24QMJOSST5EESbB
 whDUtuP53g5N2t3mJKVs0/tFBCtPToXFRVC82pfU+JhN2z5Omlhk+GyU8P94dHHioHt5
 KzWElJoU3F0Nq8tUnz/gPD5RqZ03+a0kUksNy5/YHhcZrAa1MSS9aN1p3JrH1ojJDZji
 A9GQ==
X-Gm-Message-State: AOAM530oHZPl9pmb/s4TEEI3VQMbIDUZmA8pf+rUS1obc5yRki0ZGcLC
 Cbw90VLZfX0YO8gH1bIbySAAKg299pk=
X-Google-Smtp-Source: ABdhPJxfq3n8Q32VSpW2c9tniI/WcMmaxNB58RMGCq+F3MHr7LMDWajKxiH2LzIIWvoxkWq0sGd0gA==
X-Received: by 2002:a05:6000:1c01:: with SMTP id
 ba1mr8776761wrb.28.1643407766401; 
 Fri, 28 Jan 2022 14:09:26 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id i11sm6899712wry.102.2022.01.28.14.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 14:09:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 23:07:38 +0100
Message-Id: <20220128220738.3028614-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: bump to version 3.14.1
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://github.com/zhaojh329/libuhttpd/releases/tag/v3.14.1
https://github.com/zhaojh329/libuhttpd/releases/tag/v3.14.0
https://github.com/zhaojh329/libuhttpd/releases/tag/v3.13.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-openssl.c-fix-build-with-wolfssl.patch | 47 -------------------
 package/libuhttpd/libuhttpd.hash              |  2 +-
 package/libuhttpd/libuhttpd.mk                |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 package/libuhttpd/0001-openssl.c-fix-build-with-wolfssl.patch

diff --git a/package/libuhttpd/0001-openssl.c-fix-build-with-wolfssl.patch b/package/libuhttpd/0001-openssl.c-fix-build-with-wolfssl.patch
deleted file mode 100644
index deb1a0f93b..0000000000
--- a/package/libuhttpd/0001-openssl.c-fix-build-with-wolfssl.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From e5c5ed1c64cfc715729c9bfbfdcc4be225f344ff Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 4 Aug 2021 11:32:39 +0200
-Subject: [PATCH] openssl.c: fix build with wolfssl
-
-Fix the following build failure with wolfssl:
-
-/tmp/instance-4/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c: In function 'ssl_context_new':
-/tmp/instance-4/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c:174:33: error: 'tls13_ciphersuites' undeclared (first use in this function)
-  174 |     SSL_CTX_set_ciphersuites(c, tls13_ciphersuites);
-      |                                 ^~~~~~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/d0fb629b40b05ad828775894fabed878692bb222
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/zhaojh329/ssl/pull/1]
----
- openssl.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/openssl.c b/openssl.c
-index 8f3d8b7..c42638c 100644
---- a/src/ssl/openssl.c
-+++ b/src/ssl/openssl.c
-@@ -71,14 +71,14 @@
-                 "TLS13-AES256-GCM-SHA384:"		\
-                 ecdhe_aead_ciphers
- #else
--# define tls13_ciphersuites	"TLS_CHACHA20_POLY1305_SHA256:"		\
--                "TLS_AES_128_GCM_SHA256:"		\
--                "TLS_AES_256_GCM_SHA384"
--
- # define top_ciphers							\
-                 ecdhe_aead_ciphers
- #endif
- 
-+# define tls13_ciphersuites	"TLS_CHACHA20_POLY1305_SHA256:"		\
-+                "TLS_AES_128_GCM_SHA256:"		\
-+                "TLS_AES_256_GCM_SHA384"
-+
- #define ecdhe_aead_ciphers						\
-                 "ECDHE-ECDSA-CHACHA20-POLY1305:"	\
-                 "ECDHE-ECDSA-AES128-GCM-SHA256:"	\
--- 
-2.30.2
-
diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
index 98bd6e513b..e4fde4eb64 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c234dd3d491c4daa047e28870c6e740529b2eff2dd027dafb6bf02d8dba286b0  libuhttpd-3.12.1.tar.gz
+sha256  512d4abfced0ec916d985d3d1eac7528e6676eecae6aca27fdaf313374e29f16  libuhttpd-3.14.1.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index 3a99fe0613..b8cf935d01 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.12.1
+LIBUHTTPD_VERSION = 3.14.1
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
