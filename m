Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348D4CAC5AE
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 02:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEC2883E62;
	Thu, 25 Sep 2025 02:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xGsQc75Jgoj; Thu, 25 Sep 2025 02:57:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0769683E60
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0769683E60;
	Thu, 25 Sep 2025 02:57:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75EBF177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 02:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BEEF612C6
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 02:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqTJNIxoqCHu for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 02:57:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5C76C612CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C76C612CE
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C76C612CE
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 02:57:13 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id BED7131E0C3F; Thu, 25 Sep 2025 04:57:11 +0200 (CEST)
Date: Thu, 25 Sep 2025 04:57:11 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aNSvh0nbwHQjNe3n@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1758769031; bh=fNO/+iuAw3LSOdpfAsl5lznkrE70Ne3iPoHbVY7Fev4=;
 h=Date:From:To:Subject:From;
 b=Hp2v+Tm8v3p1pHs8stIWpTQS3Ci1lRYOnXtB040MPYYekOLqj9cBUa12oBfQGlCsW
 CLoiGl+UjzVGPDxPQOX4jVqkiEw1hjBQpgOc2irOdxq3xmmV9HdQnzcvhBdf7sKSUZ
 v7eFjB6Pgr02HDMQeEqN1Jr/vNUNRuswGwR3Yj8w305F4gcd59fhK68daskClQgTyV
 EV/tApCOmo1s6mdMHejoTlnOq/IZ9NA1ZP0sixKbwTbNKsE4/GEdJnnGo6ezIlKHpL
 Hi1YyIll/0xReALARmouxhKSvqfnY04H9craYaaKEVZPvAa9/A7YJV/SF78kBghA/2
 w0fke7rw0FJ1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Hp2v+Tm8
Subject: [Buildroot] [PATCH 4/5] package/python3: add sqlite for host build
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

This is a requirement to build firefox.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/python3/Config.in.host | 6 ++++++
 package/python3/python3.mk     | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
index f3fcd63567..0d163e1fdc 100644
--- a/package/python3/Config.in.host
+++ b/package/python3/Config.in.host
@@ -28,4 +28,10 @@ config BR2_PACKAGE_HOST_PYTHON3_SSL
 	help
 	  _ssl module for host Python3.
 
+config BR2_PACKAGE_HOST_PYTHON3_SQLITE
+	bool "sqlite"
+	select BR2_PACKAGE_HOST_SQLITE
+	help
+	  sqlite module for host Python3.
+
 endif
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 1546915f08..2f162d3b0f 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -19,7 +19,6 @@ PYTHON3_CPE_ID_PRODUCT = python
 HOST_PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
 	--without-cxx-main \
-	--disable-sqlite3 \
 	--disable-tk \
 	--with-expat=system \
 	--disable-test-modules \
@@ -77,6 +76,12 @@ HOST_PYTHON3_CONF_ENV += \
 	py_cv_module__ssl=n/a
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SQLITE),y)
+HOST_PYTHON3_DEPENDENCIES += host-sqlite
+else
+HOST_PYTHON3_CONF_OPTS += --disable-sqlite
+endif
+
 PYTHON3_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON3_2TO3),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
