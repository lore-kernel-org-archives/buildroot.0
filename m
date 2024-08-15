Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECB4C52D7C
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 17:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2435940978;
	Thu, 15 Aug 2024 17:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68Rmd0WXultT; Thu, 15 Aug 2024 17:23:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E097340BE3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E097340BE3;
	Thu, 15 Aug 2024 17:23:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D86031BF475
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 17:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C418740BEB
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 17:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i2UlIhImhq-k for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 17:23:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A60540BE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A60540BE3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A60540BE3
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 17:23:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b460.dip0.t-ipconnect.de [84.161.180.96])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 28EF6A4C178E
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 19:22:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45764)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1seeBS-000000004QG-3aEL
 for buildroot@buildroot.org; Thu, 15 Aug 2024 17:22:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 19:22:46 +0200
Message-Id: <20240815172246.3519347-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240815172246.3519347-1-bernd@kuhls.net>
References: <20240815172246.3519347-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1723742567;
 bh=wJ9X4q0S0L+C0QLe+SvJW9eEEXCtMdNG+BcmU4hqDyg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZtQuMgcq8TVzPAMOZh0+6e+KWpcIY7TOeZXSOr/w4TIrASFW3zAWq9HccmYI+rISA
 lbgv28MMwKb98I3viKn3WX+J6u6DJT3xNSKbVNTlPzbXs29Lu/EChteSIHZWG8KbI3
 L0KjGogATfMR/FQFkxrhATG/1iH5kUGt9EQFjswNUR5j9feMnZpRZKE3xeYKn9udM+
 bNmwEv3Ctkgx9Vs3TWNIdPp3GuOzVb+030QYGWbJDeHXtM3X4g4VYnPp2hoJBSLAQ3
 AFJiucRxnL7Hi2xcltkNoh1GhVq0GwkPIP9G5q9huP/04U2qsr47KLOLZnNIARRDRL
 /uNuM44H6xuHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=ZtQuMgcq
Subject: [Buildroot] [PATCH 2/2] package/dovecot-pigeonhole: bump version to
 0.5.21.1
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

Release note of this bugfix release:
https://dovecot.org/mailman3/hyperkitty/list/dovecot-news@dovecot.org/thread/4KDY5GDGPVG5ZMXKTBEKPKK764LT56WU/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index 8cd3356dce..247f74fdba 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,3 +1,3 @@
 # Locally computed after checking signature
-sha256  1ca71d2659076712058a72030288f150b2b076b0306453471c5261498d3ded27  dovecot-2.3-pigeonhole-0.5.21.tar.gz
+sha256  0377db284b620723de060431115fb2e7791e1df4321411af718201d6925c4692  dovecot-2.3-pigeonhole-0.5.21.1.tar.gz
 sha256  fc9e9522216f2a9a28b31300e3c73c1df56acc27dfae951bf516e7995366b51a  COPYING
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 679fd4db98..4d21ebd395 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.5.21
+DOVECOT_PIGEONHOLE_VERSION = 0.5.21.1
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.3-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = https://pigeonhole.dovecot.org/releases/2.3
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
