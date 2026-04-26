Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE0AFF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 14:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B24E84295D;
	Sun, 26 Apr 2026 14:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHZtTz2IWsFP; Sun, 26 Apr 2026 14:43:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E35D24297F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777214624;
	bh=mwcZaw4l8K9Wd4yGW7oxt+k7IwZV70p17vX8DdEuSwI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LfVLUp1KQXtkRwQrvrOFJk6vHM8XGurGGJJLZR2oxwGFFELARJBeuLfJ568H/fr2N
	 IOR+u/lodnx4GfFQkTFdxGGJ9ukeTEixNKpY++Fu33QF2HbwgeCaCmluKO2VplircJ
	 GQ8kc5DYVvsbDGKzj1My4Z3dZXC08lA+55WdaSAzEGUxF/JC3dpACIaVIfl85xV3NL
	 fTAztkm0zAZ17z9w62j3Xn9zQseKZEww/k4ubjCgxBPocYxBfd4aZBTL+BuxTo9NxS
	 sHuDuWhra3pho0FRwGPauHG0moCJ+7X4Gyqh0rIn5owrWH9EhYfu6joExEoOzlKQjU
	 5niwYhG+WCghg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E35D24297F;
	Sun, 26 Apr 2026 14:43:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BCF21B8
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 14:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8724984BC8
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 14:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qgLqrz68aVV4 for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 14:43:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9537A84BC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9537A84BC7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9537A84BC7
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 14:43:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ADA9EA4C0EB9
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:43:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38068)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wH0hu-000000008Vj-418m
 for buildroot@buildroot.org; Sun, 26 Apr 2026 14:43:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 26 Apr 2026 16:43:39 +0200
Message-ID: <20260426144339.1530435-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777214619;
 bh=dRaUtkBioOfFhxmv7sCX2IU6aS5q80PpADuFEZqmtC8=;
 h=From:To:Subject:Date:From;
 b=CEhESPraVRLTHGxFhmLnBPjB1FZCLapg2tAqlESWNISWt5byFXQUoc2Nh9RD4HIRu
 cJ6QsitzqrDExr+5jkNIzXGu7mq3+9/SaHghQ+YwaXNGqDCse0nd5IKA/YwHpLMCtG
 FLzoyWiF9+cEStJI/EMNsgDP8dTVEevuevLGQt248rgB87O8N5/17wS2P3JzRpoGOV
 OTvcA73tjRdfcOgGSpiOHlWvxpVbJTpUJeAVqe1k+SYEmTl2JFRjYxAj6xdXaN54jt
 UF28bGI1uPbCCpOe3ZvThohg8Tq14s7uZkI9RBBJd6Qxgt9+gkZ4Qn6Y6IssS9pJES
 rqGrngVA9B+Ow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=CEhESPra
Subject: [Buildroot] [PATCH 1/1] package/sudo: bump version to 1.9.17p2
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

https://github.com/sudo-project/sudo/blob/v1.9.17p2/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sudo/sudo.hash | 2 +-
 package/sudo/sudo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 3bbce74cbc..340d155346 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
 # From: https://www.sudo.ws/getting/download/
-sha256  ff607ea717072197738a78f778692cd6df9a7e3e404565f51de063ca27455d32  sudo-1.9.17p1.tar.gz
+sha256  4a38a1ab3adb1199257edc2a7c4a2bd714665eb605b04368843b06dada2cfcfb  sudo-1.9.17p2.tar.gz
 # Locally calculated
 sha256  41eb34d6b184c2638d6d32c6e7f70b8dd6423e68b91da959e0cf773aa01f62d7  LICENSE.md
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 0aacd8207d..8602e62b0b 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SUDO_VERSION_MAJOR = 1.9.17
-SUDO_VERSION_MINOR = p1
+SUDO_VERSION_MINOR = p2
 SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
