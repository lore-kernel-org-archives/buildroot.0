Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C022C5AD49
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 09:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E421483F83;
	Fri,  6 Jun 2025 09:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5SZhF6A9Vfcf; Fri,  6 Jun 2025 09:20:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 350B883FA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 350B883FA1;
	Fri,  6 Jun 2025 09:20:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AEE61A4
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 09:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BCBF406B0
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 09:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ncYYOLuXsoyP for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 09:20:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 45BA140770
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45BA140770
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45BA140770
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 09:20:28 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id F19A2440319;
 Fri,  6 Jun 2025 12:19:36 +0300 (IDT)
To: buildroot@buildroot.org
Date: Fri,  6 Jun 2025 12:20:12 +0300
Message-ID: <e5b537b303b5e57c90925196afa558503f6f6072.1749201612.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1749201577;
 bh=QeBTUOk8iI1l8bjHki+s5E/gdfhPNdsfGjk9N4qy72I=;
 h=From:To:Cc:Subject:Date:From;
 b=PIBiNuHFxadQQ82QgyEg2pK0BEJnv2+8lAsU/aAI+7lGCpzbQGbSS1X9bKiuTdpus
 KKYODwvvOmMBvD3ynlyI3WG6nJzA+/qAqsU0XpNiQmJGmWBxu4g7tkLl94+95Ve3Sj
 uxX/jlmRL9VrZSsN4nHsWhiL1NUVavGEuFsW9w9iW1Ypyg8gRdQT76KQKrDsXt9XRg
 m6bzgjPm6fy/zRmnqB1Mnz8payY5o/wO5m7VbLCPH489PDUQI0dZaxxmfaDw1h27qZ
 VRHTdSOBikFtCJsM8558u5KM7Q3vGrtsdu3P3ujQ6ni5G8ZIRTvpFnFfByJYx9bX7x
 6U8Gy26IgBJ5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=PIBiNuHF
Subject: [Buildroot] [PATCH] package/libcurl: fix build with HTTPS-RR
 disabled
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Experimental HTTPS-RR support is disabled by default. curl version 8.14
added configure check for double resolver, threaded and c-ares, when
HTTPS-RR is disabled, failing configuration.

Add option to enable HTTPS-RR. When not set, disable the threaded
resolver if c-ares is enabled.

Fixes:
https://autobuild.buildroot.org/results/45e5cd39fddee64f38cf4601877826ff7433a26b/
https://autobuild.buildroot.org/results/9e9c8b28c476544a1a5cb4f62666525225e15aca/
https://autobuild.buildroot.org/results/ea44b98214c3c8d744815e2a866fbf8776291829/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libcurl/Config.in  | 5 +++++
 package/libcurl/libcurl.mk | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 0e52bc69c286..3612166f8eac 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -36,6 +36,11 @@ config BR2_PACKAGE_LIBCURL_WEBSOCKETS_SUPPORT
 	help
 	  Enable support for websockets.
 
+config BR2_PACKAGE_LIBCURL_HTTPSRR_SUPPORT
+	bool "HTTPS-RR support"
+	help
+	  Enable support for HTTPS-RR.
+
 config BR2_PACKAGE_LIBCURL_EXTRA_PROTOCOLS_FEATURES
 	bool "enable extra protocols and features"
 	default y
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 8501910ac5d2..1c2f6ce919aa 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -170,6 +170,15 @@ else
 LIBCURL_CONF_OPTS += --disable-websockets
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL_HTTPSRR_SUPPORT),y)
+LIBCURL_CONF_OPTS += --enable-httpsrr
+else
+LIBCURL_CONF_OPTS += --disable-httpsrr
+ifeq ($(BR2_PACKAGE_C_ARES),y)
+LIBCURL_CONF_OPTS += --disable-threaded-resolver
+endif
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL_EXTRA_PROTOCOLS_FEATURES),y)
 LIBCURL_CONF_OPTS += \
 	--enable-dict \
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
