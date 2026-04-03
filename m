Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45095E8536F
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 13:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFE7160A85;
	Fri,  3 Apr 2026 13:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hs_iIDiskNjV; Fri,  3 Apr 2026 13:41:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E41C60A38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775223698;
	bh=Ho4zFOdCsNkRThQJ58wsgIgRbFBSNOMVM/t19KoxAgE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OmxAUKUTbK3KBJqw/EtXmb977ywtWqNzqjXLn9MMolxyMGEbfDCSnlh4e7P1cdTRV
	 QAd7UKyBTBGfv4vUUeXxxKrPt97SWzs2etYRRweDC2KHUTqbigvRvo9czhXCkChfK0
	 PcXWUL5QZSSxHcQBsjjaxbMBU4VLsUGwf0Nz+UDtWr1PVlaQtv/vbNgA7Z7mseFw3q
	 +3NrYEODJ6UcHlxtOIIOavyxXFNEANCKIAFtfPWM+Q6D8y6cZIHYugxDam41KCsc5t
	 6eoCfPeuslJ211kBFnqVDKn6cyC7RVlPjoDTizosaZOgRnsNksjd0JRP2h09Y1+Yol
	 /GZfWjJaLRHWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E41C60A38;
	Fri,  3 Apr 2026 13:41:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 019FB2CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 13:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB8ED40F52
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 13:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8PQFhrtg2jtA for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 13:41:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7ED5C40F30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ED5C40F30
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7ED5C40F30
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 13:41:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cb24.dip0.t-ipconnect.de [79.214.203.36])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A0DEEA4C3603
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 15:41:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53532)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w8emA-000000007Kp-0WmI
 for buildroot@buildroot.org; Fri, 03 Apr 2026 13:41:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Apr 2026 15:41:30 +0200
Message-ID: <20260403134130.675035-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775223691;
 bh=ZCChxCsRHt+sU0cQG8v25YbfQAGtImVjqC3nmtvG34I=;
 h=From:To:Subject:Date:From;
 b=Nejwnr38/bSdCnJ/RGDs/gaK15DiZJVwZlk3/9QYialu9YSY+7lg8/41LnBRJeWzm
 yNNNHt+kognarbqCr8NeI8BaqvDe012Knj5z5hX+/MqQNdBMafGyiaVceI2DvX26wQ
 1JRMRhJgRPs0Evkqs5YsanZwCSBjkDwfk1SgGo7bqBUaJU9+L6ufobcarx+Ym0kSLE
 LXRoI5+ZxgQw/btLw7hE3u356EZItu/TaAWrPK0S2uhEUr0zAsWS20eFdQD0d9hojw
 AzusiF2cvx+B+pQ7GG3I5SVy3wYildv61xWATyJtM30H/4HtTzcqEHxHl5I5zma1NG
 DfA/5U1//PL9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Nejwnr38
Subject: [Buildroot] [PATCH 1/1] package/cppcms: Remove dependency to pcre
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

Upstream allows to replace pcre with std::regex since version 2.0.0:
https://github.com/artyom-beilis/cppcms/commit/731bc83a980211a704e59a7049957ad579ca7c2f

We switch the package to the new code path to prepare for the removal
of the unmaintained pcre package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cppcms/Config.in | 1 -
 package/cppcms/cppcms.mk | 5 +++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 48266e00c1..094dc473c0 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_CPPCMS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_PCRE
 	help
 	  CppCMS is a Free High Performance Web Development Framework
 	  (not a CMS) aimed for Rapid Web Application Development. It
diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index b39122d12f..28167b0acc 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -15,9 +15,10 @@ CPPCMS_CXXFLAGS = $(TARGET_CXXFLAGS)
 # path
 CPPCMS_CONF_OPTS = \
 	-DCMAKE_SKIP_RPATH=ON \
-	-DCMAKE_CXX_FLAGS="$(CPPCMS_CXXFLAGS)"
+	-DCMAKE_CXX_FLAGS="$(CPPCMS_CXXFLAGS)" \
+	-DDISABLE_PCRE=ON
 
-CPPCMS_DEPENDENCIES = host-python3 pcre
+CPPCMS_DEPENDENCIES = host-python3
 
 ifeq ($(BR2_PACKAGE_CPPCMS_ICU),y)
 CPPCMS_CONF_OPTS += -DDISABLE_ICU_LOCALE=OFF
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
