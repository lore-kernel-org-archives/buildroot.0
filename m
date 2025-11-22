Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D289ECFD2F3
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 21:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3542410C8;
	Sat, 22 Nov 2025 21:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tzbLrgpex65l; Sat, 22 Nov 2025 21:47:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A99FE410AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A99FE410AA;
	Sat, 22 Nov 2025 21:47:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E8D8158
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 21:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8E9260AF5
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 21:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFQDdbUYskvz for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 21:47:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1A3D560730
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A3D560730
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A3D560730
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 21:47:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b63c.dip0.t-ipconnect.de [84.161.182.60])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 11138A4C7298;
 Sat, 22 Nov 2025 22:47:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42402)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMvSK-000000005uc-1jWR;
 Sat, 22 Nov 2025 21:47:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 Nov 2025 22:47:44 +0100
Message-ID: <20251122214744.1653626-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763848065;
 bh=RqTK+ZyWtP7bUezr4hk4AA+PgaJGJD+xp4lZvvw6ejQ=;
 h=From:To:Cc:Subject:Date:From;
 b=vGrv4xgW/xpijktQMduru09bc2XVfeEmw8S6Gey5pX02z8ZhgZ2viCzIHOH/FGn5y
 aglhg5lIIGGrRpN0DgZpE8B87MKBf7q/N3jhh3KWIeExK0iAXtkhtxLQ8aHx8Y5LoM
 19YK2Q1U6ql56d3jIgZQreQpVQW6YPGkIs9K/DP5ebED15l+QZggcCL9obfb48Ksjf
 ffxEw8l6iHvftBUVduVztGQ00/DtTJ0hQLd+EJeXeKIETNHc1UinQujTORsusIR55K
 9+YOBEstskLlxwdWgiSo+zdQPWbXo+s5/sSprBLH+MPwvdlCQY1jOEkrHIRns3fWfP
 8j/eqEQoaJk5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=vGrv4xgW
Subject: [Buildroot] [PATCH/next 1/1] package/libupnp: bump to version 1.4.25
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

Changelog: https://sourceforge.net/projects/pupnp/files/release-1.14.25/

Add upstream sha1 tarball hash, switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libupnp/libupnp.hash | 4 +++-
 package/libupnp/libupnp.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index 86437a7339..d04fbd5b98 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,3 +1,5 @@
+# From https://sourceforge.net/projects/pupnp/files/release-1.14.25/
+sha1  664b3981f6a54dd3b921af4ab2ecdfb6d1feb626  libupnp-1.14.25.tar.bz2
 # Locally computed:
-sha256  b6423c573b758d09539f5e6c4712c1a9fd35dccf835f81d99473d50a50ad49b0  libupnp-1.14.19.tar.bz2
+sha256  36fdf15767573f4f92320f01b3fd3c1cb41732b91cfc24d10d1e6a55969c9f56  libupnp-1.14.25.tar.bz2
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index cd148d14d0..f29275d2b5 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBUPNP_VERSION = 1.14.19
+LIBUPNP_VERSION = 1.14.25
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = \
-	http://downloads.sourceforge.net/project/pupnp/release-$(LIBUPNP_VERSION)
+	https://downloads.sourceforge.net/project/pupnp/release-$(LIBUPNP_VERSION)
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
 LIBUPNP_INSTALL_STAGING = YES
 LIBUPNP_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
