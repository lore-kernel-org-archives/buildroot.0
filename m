Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BB1C83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 15:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 397EF60E32;
	Sun,  6 Jul 2025 15:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IsbLB00TK41u; Sun,  6 Jul 2025 15:17:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C32960DC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C32960DC9;
	Sun,  6 Jul 2025 15:17:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 82B0715F
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 15:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 736BC40DA5
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 15:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NEe3hmIKhwPa for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 15:17:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 833E240C59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 833E240C59
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 833E240C59
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 15:17:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c4c9.dip0.t-ipconnect.de [79.214.196.201])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 92569A4C384E
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 17:17:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42908)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uYR74-000000003sf-2kWo
 for buildroot@buildroot.org; Sun, 06 Jul 2025 15:17:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Jul 2025 17:17:06 +0200
Message-Id: <20250706151706.2547241-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751815026;
 bh=704gU9ekIAvZ+zETa3NopAnSW8GlW9N2LNWb8O395sM=;
 h=From:To:Subject:Date:From;
 b=XGncibFdClbtRxGMyFUGwA0heq4ABzX3E29fz1iEwnqJS4169CEOpI8Fu6CRf1+zI
 wuKHZow0B4EGCrmYBbLYAwujv03xKUAjY7oCbB58n+e9zJED5Rg+N9ms8+q1OLQ1hF
 Gl8A2Ky0zX7HdCuO08ph7HZLcdQgTyq1bAiGb8P3GGMmkpzvTmTZPBGxJObCi7LNCv
 1lZhTPyXQ4UzKaHFP7SbQsTjcHJiGxAJ6frToRVL9nWf2pw+CsE1QGTAv9Wz9MfFUC
 IuO802CKZIh15apT5DK5L1j2cf0HyFdHooZqXU0Ku5dWZTNt6x0t7CJc2ou+oqALqt
 noE9V3sGz+TPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=XGncibFd
Subject: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 25.2
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

Release notes:
https://stellarium.org/release/2025/06/22/stellarium-25.2.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/stellarium/stellarium.hash | 2 +-
 package/stellarium/stellarium.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index ada974b4b9..e4e832699b 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,4 +1,4 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha256  610384311455ce75f9b02f0d3d50e5cc127c36e67008817ea8cbab0bdadeaf5a  stellarium-25.1.tar.xz
+sha256  5423334212a6d0daa006d44e1bc039cc212fbc990358c7b6636a7a2aac67434f  stellarium-25.2.tar.xz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index df74ea47c1..f342652a4d 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 25.1
+STELLARIUM_VERSION = 25.2
 STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
