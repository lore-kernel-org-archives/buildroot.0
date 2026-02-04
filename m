Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061B8E95393
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 12:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C57D360A55;
	Wed,  4 Feb 2026 12:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EoagQ-l4eBTJ; Wed,  4 Feb 2026 12:17:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9E9260A5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770207432;
	bh=U+utQIiK3P2g3Q16PrgEQQd3QMspr2/09uIsGi7y3vE=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KEFXIbMp26fc+ita88cTh7SY0IeUeddvpzSRWEwDQzgcmxecnu32w33PpMDU5R2lc
	 /ZCjCOkIeW1j9i4sS8expqygcNBl/6gjy5IYoTFiq8AczX7mbbUe31JMft06+LpOyP
	 ikZ7v6zUg9/HrRf2clQ8rTf0IiAoTOfYenee9w2eS8giQsKQ5pwO+zV4oE6CQGGilQ
	 G2kBXar1fY5stQ+hTKWVW5HRudclwDY8AcmeWhaRRMzi36u435tyEML+RgSUx92zqz
	 jF0qWaNoWMCgJ70xFoyXoaJOlH1s6I3FvrQ0Ibk28heg/rL/BVJWkEbsulwXOhG3on
	 9J+JlzNEi2/Bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9E9260A5E;
	Wed,  4 Feb 2026 12:17:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 862E2173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 633F660A5E
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oDTl22LIfqsk for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 12:17:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4DD4760A55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DD4760A55
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DD4760A55
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:17:09 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 7609131E0B83; Wed, 04 Feb 2026 13:17:07 +0100 (CET)
Date: Wed, 4 Feb 2026 13:17:07 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aYM4w48PkfR1ncCd@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1770207427; bh=Xojd7pZwZLmJTSSbBtM7BVINq7BwaKHloVBiXBGbY0U=;
 h=Date:From:To:Subject:From;
 b=B/CY5mc5PAzL16O9xdrPJYtGx1duTynxa7LURODCrz1WIyM41GbhpNeEMA9zSZbjv
 eYoWo8Rv/oxu1qYrwaEpAqpMfNKRK70eHZMT/xDTIO96j4fMOKXxPcqPHGkhPVIZIS
 1hiNnUaQGBx48XtxOCYzS/cky4TWMNRDzuk6Bd9OUwFEZu90Rw2/Rj+gfvY++JCJMh
 jLjCHtGMHJk1gGzUUjobBdmL8LkwtZjOawd1LIhYm3+4Es/HLDSayF/ymBq8RjH6EW
 tewc99Cp3kVicWjbpmDU8nAkCxsffV/qnhcgXQu8dqFOf2TZ8yMl8DUOCyc2ogtdOx
 993d0D0Tyhwtg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH v3 3/5] package/python3: add sqlite for host
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
 no changes
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
index 8195f4fd83..9c4c30a58d 100644
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
