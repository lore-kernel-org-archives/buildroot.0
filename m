Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FE2C0218B
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 08:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2D3381FB9;
	Sat, 25 Jan 2025 08:12:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Elopooc7aCk7; Sat, 25 Jan 2025 08:12:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D796481FBA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D796481FBA;
	Sat, 25 Jan 2025 08:12:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 48B8D1183
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 08:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3680E60B17
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 08:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qYBke2AQQykQ for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 08:12:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA47A60AD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA47A60AD9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA47A60AD9
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 08:12:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c8f0.dip0.t-ipconnect.de [79.214.200.240])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 06B5DA4C0701
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 09:12:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41234)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tbbGj-000000004bS-1dxz
 for buildroot@buildroot.org; Sat, 25 Jan 2025 08:11:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 09:11:53 +0100
Message-Id: <20250125081153.13580-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1737792721;
 bh=MnNzLtKF/3EXg0cMoDxmlueldtTwpR5HO/6TJ1XPw9s=;
 h=From:To:Subject:Date:From;
 b=geokX3lJ6Xz2uyyIHYJQ4aWenPdqkMGYnWtJnFZl36RWSivtn6z5y+HbeHb9Mszpd
 rQQD7vYPuaarI+HXDZ+6v62xODSfCrgzcwmNXiacrhq5u+Fc+dzCBpRI9ntwBuU4ma
 9+SaWg2WOFjvaGtR9QQC/4PIppSh/NySWvu6wUqsN24qwd4FhxkN14X2WwZxUC/5BW
 +gZKteCiH6yF5mYuGSCElkrfxJLIBZdk9Paz++GuchBWMh7INjgqpyk7cP0/VZcXgo
 dxf3GZ9jSAkNrie6M/RnIB/dzO3w4TmUjdem8daxTiBYplbxyol8LUv7zNeRVjX9bW
 axLJwRrgxt8hw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=geokX3lJ
Subject: [Buildroot] [PATCH 1/1] package/clamav: security bump version to
 1.0.8
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

Fixes CVE-2025-20128:
"This issue was introduced in version 1.0.0 and affects all currently
 supported versions."
https://blog.clamav.net/2025/01/clamav-142-and-108-security-patch.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 8e8351cf00..b5b10d3a13 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f4d67240a8b2e882e18f864529040084617de066cdab9b7684951ace6ea6f3cf  clamav-1.0.7.tar.gz
+sha256  4783f2ab3fc323a887c117c672dc0b4e7ace72d76f8c06e990bd49c3ef58f10a  clamav-1.0.8.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index d748a33db7..42be9be41c 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 1.0.7
+CLAMAV_VERSION = 1.0.8
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
