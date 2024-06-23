Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7C9C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 16:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3F0A607E2;
	Sun, 23 Jun 2024 16:57:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEexN_KZsBCD; Sun, 23 Jun 2024 16:57:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04A6360831
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04A6360831;
	Sun, 23 Jun 2024 16:57:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24E6D1BF593
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 16:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D2F56083F
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 16:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ydjNe-5SKCD for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 16:57:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DBED4607A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBED4607A4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBED4607A4
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 16:57:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb81.dip0.t-ipconnect.de [84.161.187.129])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B267CA4C0D1B
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 18:56:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60650)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sLQWR-000000003Tx-0WNN
 for buildroot@buildroot.org; Sun, 23 Jun 2024 16:56:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 23 Jun 2024 18:56:59 +0200
Message-Id: <20240623165659.1723488-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719161819;
 bh=lmeL7WdHpaSLpsjAyyB8rCP27KJdizVBenHBmExoamo=;
 h=From:To:Subject:Date:From;
 b=sjpxA9N1R6me7JHZ5v+eF9a5bZ41Y3nfdOpIufGmSM18ieuh+2QrgJmeRUJRxwdVD
 wKrJJVvWcgcPWftViA/fdh851rbB5iGvXpPV4HJ0BubeYwRT94wUTgwcqKwqcQPCX6
 ON1Feh2PUgB8Lt8CIDCeDURrpMI52xtEafy02OVtJSmsvUueq2QbIHMvWW1vZnYt+B
 MRr3tsQeAIMTdfwq9vjEcQhZyQWPaP6unREKkZOOUaSfx9UZ/6zyy33ftCOHVvuN/y
 ExUo6ffHzICJDsInSuagQUn8ze2KM+4KXd384XRtNoP9bV8ucXdO1yTM6YN4xZ7olB
 xhdrRumgTLKZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=sjpxA9N1
Subject: [Buildroot] [PATCH 1/1] package/openvpn: security bump version to
 2.6.11
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
https://sourceforge.net/p/openvpn/mailman/message/58786888/

Changelog:
https://github.com/OpenVPN/openvpn/blob/release/2.6/ChangeLog
https://github.com/OpenVPN/openvpn/blob/release/2.6/Changes.rst

Fixes CVE-2024-4877, CVE-2024-5594 & CVE-2024-28882.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 932483507e..a4ba458bd8 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  1993bbb7b9edb430626eaa24573f881fd3df642f427fcb824b1aed1fca1bcc9b  openvpn-2.6.10.tar.gz
+sha256  d60adf413d37e11e6e63531cacf2655906756046b4edffe88a13b9e2fec40d5e  openvpn-2.6.11.tar.gz
 sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index abcb123eea..3b39d62519 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.10
+OPENVPN_VERSION = 2.6.11
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
