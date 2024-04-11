Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70B8C4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 20:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91405608DC;
	Thu, 11 Apr 2024 20:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fePKjqCUZ8y4; Thu, 11 Apr 2024 20:59:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F6FA6065C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F6FA6065C;
	Thu, 11 Apr 2024 20:59:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62B7A1BF215
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 20:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EEFE41ED7
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 20:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P0tltZmFEQDd for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 20:59:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ADBD841EC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADBD841EC4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADBD841EC4
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 20:59:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1baba.dip0.t-ipconnect.de [84.161.186.186])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E88EEA4C3057
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 22:59:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55910)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rv1WG-000000000yg-3I8Y
 for buildroot@buildroot.org; Thu, 11 Apr 2024 20:59:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 22:59:41 +0200
Message-Id: <20240411205941.2127766-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712869181;
 bh=CB2A/OQPfFQ1w1r5W8mVJlSvX0s7ymvi8Z+tcZaFzxo=;
 h=From:To:Subject:Date:From;
 b=PyILLmm0CI6LIe0yC/d+cpktHLX7FstB4r5bWqVCPSNIevo70PiF+lmpqyMq226X0
 0eLpZYwK5ynlrNjWObgyTRk4BMBuWxJ6d7c3WwSRq9knFHsM3v5irBs0kfNU7UXi4r
 xTKAlCtI+86E/5lk+52gmH//VzB7rzV3pYzy5SsmnJcqU1EpNlKRuCFk0W0S13MtyL
 /emPybyF9sGfPXf1YBHinUcVuUmCd/Tz4NFRiqziJR4xoMAYNZ4yXISl4XNK57b1rA
 8rcxrX4TyZNI0zSHbaCzeKWSIL2g/fcO3BU5S4Tjpl2zgsmGq7vvvXGH5Speb/vTIS
 qUNWXlXjusOyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=PyILLmm0
Subject: [Buildroot] [PATCH] package/tor: bump version to 0.4.8.11
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
https://forum.torproject.org/t/stable-release-0-4-8-11/12265

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 8cc8eb435f..4052f11736 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.10.tar.gz.sha256sum
-sha256  e628b4fab70edb4727715b23cf2931375a9f7685ac08f2c59ea498a178463a86  tor-0.4.8.10.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.11.tar.gz.sha256sum
+sha256  8f2bdf90e63380781235aa7d604e159570f283ecee674670873d8bb7052c8e07  tor-0.4.8.11.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 12dcf3f07c..9986a5f472 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.10
+TOR_VERSION = 0.4.8.11
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
