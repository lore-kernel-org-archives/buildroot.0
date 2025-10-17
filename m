Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2465CCD19A
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 10:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89A274040F;
	Fri, 17 Oct 2025 10:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O6rS1Yhkp0fv; Fri, 17 Oct 2025 10:39:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA35D40585
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA35D40585;
	Fri, 17 Oct 2025 10:39:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A0F5D8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 10:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A3C780C79
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 10:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wgBPLPZCtxdq for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 10:39:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CCBC3809A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCBC3809A2
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCBC3809A2
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 10:39:06 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 8EF2431E0B32; Fri, 17 Oct 2025 12:39:03 +0200 (CEST)
Date: Fri, 17 Oct 2025 12:39:03 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aPIcx-oY5Z9hH7mi@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1760697543; bh=6gVrjBRrf7+DJyOGKoWv5Jlmwu8h4WzOZCqMOx3SXz8=;
 h=Date:From:To:Subject:From;
 b=mxhCiTOhztobRUFAPg3n0jB+XMw2vRuIxXfnJhOrXaciwvxDtBOAHJuPpKfVNGw4u
 WDSsThI8oMiQnVEOHYg7IN97HHdB02iJ8J2/AZmOsfL/YGbog1QnRiv7XuxklKYlkp
 DOsX/kmTTgxdxWy5fJ6+YQptGkNT7FKle61sJtGtXulS2WfNC2tqEA3ORSFCI6EsXR
 Q4RrxG2J49EKjRi2Go3szuILEvdJn6IwxBBClygCydt5ktIGR37hBA6P7WKlM9c6HD
 Nq1UIVtuoq5eLBMDrxqmMvvWqnW45Xo9ZW4PbX3VohpqWlz7Z/mBiF9oAJgmmMNZxt
 QDXqxextbZ54w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=mxhCiTOh
Subject: [Buildroot] [PATCH v2 4/6] package/python3: add sqlite for host
 build
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
index b501aa7859..35a236da92 100644
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
