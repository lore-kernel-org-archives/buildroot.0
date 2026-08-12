Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6603C5CFDB
	for <buildroot@archiver.kernel.org>; Wed, 12 Aug 2026 19:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54F6A605D7;
	Wed, 12 Aug 2026 19:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2yWd_u19QbXO; Wed, 12 Aug 2026 19:51:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 718D86078E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786564263;
	bh=3EzXu+UMxpshYTYNzQdR2G55D9PPGL7hHsgSmcqriJ4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Mbw1vGGnClNo77aBLusdBDqLW0ccmZcybvrt51yDzTfyzSX3m1hjFj2J/IOxLJlDx
	 QayCMNnDhdW66F9+Dz5isZhT7NMM15pZyFWJaPh/C5gnPwwnDxr+U/X5HQKDX6CxD0
	 DL+uFLalXcPMx1lTRxrwgjI6CDymia4adw/3kz9pPZI9XZN3912bSybjraji4p0xKr
	 GHLf4R0MMkCCCoMHLzH5nqLeOc9q9+o+6u5TtF+3Exb2KSnslfkBRd1K8iemevO94r
	 Hd0o6pmZFJjesCz7DuMAp+CkNpJax3ba79O9kkMkvkIJ/I6icf9KFwDlywKqAzJr/z
	 mW1qRA6NQ8T1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 718D86078E;
	Wed, 12 Aug 2026 19:51:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B56A010E
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 19:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A76CE6069A
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 19:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m2wG7PbWkGgN for <buildroot@buildroot.org>;
 Wed, 12 Aug 2026 19:50:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C43B605D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C43B605D7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C43B605D7
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 19:50:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0529.dip0.t-ipconnect.de [91.58.5.41])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6DCF5A4C4B3E
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 21:50:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59536)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wuEyW-0000000030N-47lX
 for buildroot@buildroot.org; Wed, 12 Aug 2026 19:50:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 12 Aug 2026 21:50:57 +0200
Message-ID: <20260812195057.3862025-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786564257;
 bh=25IbmMvtVrkoSONDLNnA8LzQ5A1zcY+wvV3oPMyUSMU=;
 h=From:To:Subject:Date:From;
 b=ni2DiozSWrlFLh+9Jn4N21vo9M2Galvl4/3UKEFzZUON+iUHD6FkIqNyG/dKFyjpb
 qVB3x4xt3t0ODBKj6pL/mM0+NEi1aSXSnaIHGvMaGFaCRtwdTDsC371QRMkEQyAXGf
 /iC+aHkHGA/jkdeeVKiM+l8OaCwoEako9vwU0dEWWpV27WZi3qjyyj4pJFb7cRC0Kf
 gGNK0L1k9W8J6mPf2eniL+64DWySuK54LPRspCt0d1a+8mKe6wiBrO5KtTMnnDkvZd
 cSDehe1D45Ob714HrEBzQ0PHYOwxkwg576c8OhdgI2AE/hsGDuOM9O03DRwyVRosB8
 65E3O80CAl8aA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ni2DiozS
Subject: [Buildroot] [PATCH 1/1] package/libbluray: bump version to 1.5.0
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

https://code.videolan.org/videolan/libbluray/-/blob/1.5.0/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/a941cad23264ea7d651b6701c523d6076032cc19

 package/libbluray/libbluray.hash | 4 ++--
 package/libbluray/libbluray.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
index cc5bb2f753..7af4815c4c 100644
--- a/package/libbluray/libbluray.hash
+++ b/package/libbluray/libbluray.hash
@@ -1,4 +1,4 @@
-# From https://download.videolan.org/pub/videolan/libbluray/1.4.0/libbluray-1.4.0.tar.xz.sha512
-sha512  7284169b32624e5ca4fd71b260a4cc2921efafb1f63143a562568be45e373bfcbfeac63895d5659ccdcb11d7dbd0236cc46ccb15c12eff855703010e46991f27  libbluray-1.4.0.tar.xz
+# From https://download.videolan.org/pub/videolan/libbluray/1.5.0/
+sha256  f676408e91a5d321abf8b8d4dfdae36205c297dab5c54c3ec519639025f474a2  libbluray-1.5.0.tar.xz
 # Locally computed
 sha256  b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  COPYING
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index 4b20dd404a..14d258de58 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLURAY_VERSION = 1.4.0
+LIBBLURAY_VERSION = 1.5.0
 LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.xz
 LIBBLURAY_SITE = https://download.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
 LIBBLURAY_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
