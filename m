Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7B8CAC5B0
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 10:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92C6283BD2;
	Sat,  4 Oct 2025 10:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jO2kkfGI-ITS; Sat,  4 Oct 2025 10:53:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15F3683BD5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15F3683BD5;
	Sat,  4 Oct 2025 10:53:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA857909
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 10:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D06A760A4D
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 10:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxbgLzTsZ8HR for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 10:53:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F1BE360A72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1BE360A72
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1BE360A72
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 10:53:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4936CA4C5ACA
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:52:58 +0200 (CEST)
Received: from [192.168.1.144] (port=42892 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v4zsn-000000004SZ-3tnY
 for buildroot@buildroot.org; Sat, 04 Oct 2025 10:52:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  4 Oct 2025 12:52:57 +0200
Message-ID: <20251004105257.379452-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759575178;
 bh=xayDATVIi5YXV9qUXrbJtxuCSBmlx5VxB0Ssd9RHQGY=;
 h=From:To:Subject:Date:From;
 b=zCds4ySn8qaDppGzUpg0nG3kx/X+TJaF6zZopATWFMLhB4QkVI4uoqwWYoOEvIDnv
 /KB3deyJHjmaeHAMkGr1rsz2Dk+TNQi2tDBa6/hQPmaOMGfGiW2p/9f6WpUcC89Uqh
 0SIkHR8hee4YZvVQ7bWHe5zR7xtjcqQ0G+muO/tNCHQmS6bNlZmJwore9EoJsvoh9L
 7WEeSXqig9ln49OLutL5D/KVPS6t+SMPyWqkYAZElxP4gYJKV9RIshsEZ8/N8Bqeoz
 ZGKQ+9IsUYIlN3YrKC0RZpnHceqxJrza9+MgdWw3JcbSvJZJ7cMZBMkzlYqL6+Gcmz
 44ahBBynyIrZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=zCds4ySn
Subject: [Buildroot] [PATCH 1/1] package/libatomic_ops: bump version to 7.8.4
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

Release notes:
https://github.com/bdwgc/libatomic_ops/releases/tag/v7.8.4

Updated _SITE and project URL following upstream:
https://github.com/bdwgc/libatomic_ops/commit/7fc1a8151aaa660c5991f06e80cc793df0b1c0fc

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libatomic_ops/Config.in          | 2 +-
 package/libatomic_ops/libatomic_ops.hash | 2 +-
 package/libatomic_ops/libatomic_ops.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libatomic_ops/Config.in b/package/libatomic_ops/Config.in
index 8287c6522d..834f7cb134 100644
--- a/package/libatomic_ops/Config.in
+++ b/package/libatomic_ops/Config.in
@@ -15,4 +15,4 @@ config BR2_PACKAGE_LIBATOMIC_OPS
 	help
 	  Atomic operations library
 
-	  https://github.com/ivmai/libatomic_ops
+	  https://github.com/bdwgc/libatomic_ops
diff --git a/package/libatomic_ops/libatomic_ops.hash b/package/libatomic_ops/libatomic_ops.hash
index 1710fd3a47..64de98954d 100644
--- a/package/libatomic_ops/libatomic_ops.hash
+++ b/package/libatomic_ops/libatomic_ops.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  ad8428a40e01d41bc4ddad3166afa1fc175c9e58d8ef7ddbd7ef3298e32ac37b  libatomic_ops-7.8.2.tar.gz
+sha256  ea8295ac627646e37fd194d31535bbc02da60b908c8166c5e04d2461a53cb059  libatomic_ops-7.8.4.tar.gz
 sha256  969294c9324b2d360ae2a08edd5ca6f9cd754cb71b71e56bee15d2f10bb10496  LICENSE
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index 555ba678fe..bbd7f36db8 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBATOMIC_OPS_VERSION = 7.8.2
-LIBATOMIC_OPS_SITE = $(call github,ivmai,libatomic_ops,v$(LIBATOMIC_OPS_VERSION))
+LIBATOMIC_OPS_VERSION = 7.8.4
+LIBATOMIC_OPS_SITE = $(call github,bdwgc,libatomic_ops,v$(LIBATOMIC_OPS_VERSION))
 LIBATOMIC_OPS_AUTORECONF = YES
 
 # From doc/LICENSING.txt: "Our intent is to make it easy to use
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
