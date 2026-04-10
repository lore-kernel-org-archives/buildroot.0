Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B019F36BAB
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 05:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 213B460BB4;
	Fri, 10 Apr 2026 05:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id grmvpolfzHrN; Fri, 10 Apr 2026 05:15:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0265960B9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775798125;
	bh=fPgqOrAG4EpW2RYpjG2ZuY4Eiqr4snu1yv4rBPoL68I=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AKd2YTWRVG429DcHoFeZJgZnQsrqUnk9T2j81to2ayGGKpgfWhUXijSMfnqA0SHmo
	 ifyWuWnox5Lj4wXKmqwr+G7nEwYY3j/MwIbR1I8/E7JajjRm03I66whQC8UhxTOYDK
	 DR/1zTQfkjFBGIZT2zzpO39dyonfiru1NLaDqZjVASEV5qX0Kw2vHK9ddIcqVOeolY
	 pbhI5RiuWmaQDMBbLRz4NI6PBWFk20ZfTKvlTRdQz4rpRWUtDucPXT4kun06QW1lpR
	 GpTWGSGq+bHvUnRrzGP2qJkE6E8fT/9g0qHFYcEx5wNk2RHhpr7hxWepZZE9GcS935
	 zSLsBn/vrwPUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0265960B9B;
	Fri, 10 Apr 2026 05:15:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17432237
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 05:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1189606F2
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 05:15:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MgGa9VH6AZ4G for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 05:15:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 97DDC60648
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97DDC60648
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97DDC60648
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 05:15:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a090a.dip0.t-ipconnect.de [91.58.9.10])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 54CC3A4C063B;
 Fri, 10 Apr 2026 07:15:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43246)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wB4D9-000000006L8-0wkx;
 Fri, 10 Apr 2026 05:15:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Murat Demirten <mdemirten@yh.com.tr>
Date: Fri, 10 Apr 2026 07:15:18 +0200
Message-ID: <20260410051518.21363-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775798119;
 bh=ir2waJ///ETrhDCTzAOyg0euMa+WPfKxwWrwjmK88lM=;
 h=From:To:Cc:Subject:Date:From;
 b=GRzZ0/tYgSVLkm+qpe/ODGX30h787bnMB2pqZLp7TjOzUHRpgJof3z7EMjwIDxqH8
 XFkiysWCjQxHD8294ciVXK5vLdV9iCUtpVNRMnUIT3i+mbbdxETqQvq3DT5n3Cjylw
 6FQiyPeKAjsn9VALTGkULf/seIV9hvHwuyk89s0s6+rt2t/RMgmleIJR7ObEVb3NKN
 SbADKJUB0de20Vzjn0LjqS7lEQsvNMhVTN+eCniuOd84p/WahCZzOJQI1LyJisLrtv
 TTxFoaIR419iK0WKZA6T8fBcb99V92+RfEebnO3OCJybqSUgd0mtYfuoUdI3V4HZHN
 5b96JcN341yxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=GRzZ0/tY
Subject: [Buildroot] [PATCH 1/1] package/jpeg-turbo: bump version to 3.1.4.1
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

https://github.com/libjpeg-turbo/libjpeg-turbo/blob/3.1.4.1/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/jpeg-turbo/jpeg-turbo.hash | 4 ++--
 package/jpeg-turbo/jpeg-turbo.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index f2795bebc1..382f780f23 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,5 +1,5 @@
-# From https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/3.1.4
-sha256  e23d3ebb2c6ee4d0e2a5823dbb55b614845df5ea3435c956fed5cf04041a87ad  libjpeg-turbo-3.1.4.tar.gz
+# From https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/3.1.4.1
+sha256  ecae8008e2cc9ade2f2c1bb9d5e6d4fb73e7c433866a056bd82980741571a022  libjpeg-turbo-3.1.4.1.tar.gz
 # Locally computed
 sha256  e10114e6e40f3d0311c401ca25245ac5ef459a43c20f976fd63f03e816f5741f  LICENSE.md
 sha256  75815e3bf6484201a3c3d17a1bbf10f2e8e3237f84df10a2357ea896db2a81d6  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 56eebdc765..b00a71a231 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 3.1.4
+JPEG_TURBO_VERSION = 3.1.4.1
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
