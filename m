Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61553C2BA1A
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 18:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBD87605C2;
	Mon, 17 Jun 2024 18:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B1-c0Bci_KvS; Mon, 17 Jun 2024 18:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F22DE60A40
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F22DE60A40;
	Mon, 17 Jun 2024 18:06:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 898831BF293
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 18:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8323B608FA
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 18:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QMgKAGdTeZne for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 18:06:14 +0000 (UTC)
X-Greylist: delayed 327 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 17 Jun 2024 18:06:14 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3C02060A3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C02060A3E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:67c:2050:0:465::101; helo=mout-p-101.mailbox.org;
 envelope-from=a.wellbrock@mailbox.org; receiver=<UNKNOWN> 
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C02060A3E
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 18:06:14 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4W2yNY20SMz9sWN;
 Mon, 17 Jun 2024 20:00:45 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 17 Jun 2024 20:00:39 +0200
Message-ID: <20240617180039.3770876-1-a.wellbrock@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: s5d4ff85inxrhb8yg71uf9a8hjzpbebp
X-MBO-RS-ID: 281ae8a18689cc1cfbc
X-Rspamd-Queue-Id: 4W2yNY20SMz9sWN
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailbox.org; s=mail20150812; 
 t=1718647245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Mrr+aNVdeAEnb5b6xeB2i2FiOloo4PpUyApqSbH2knA=;
 b=d6cuF5H/lE0DOwxLkRh5HQtZ9JzQWJ7QfhN1gKDTcfPoiAiPx8+1xsTXO8DViITIsr1m1C
 KrRD96LfiJ27le/jCjSDoRcfWr/nu/j6/TdOMW1ezaZFg2mkHO/y+UHwCOh9KbkaL9sAE0
 3iIhWoTCZH5dUiA5H8d1wmaQtQEpyIPA/OdqIAZQfiF2rdM9FjadBm4RifkHeGvc5JDgXz
 d7de0cKmo7+I420p8d8LHNiL2EQtmYRO/tS+R8N4SAjvLo2+2YwW/4oI/VUGUcJe8HlJBf
 voNVomstXK8mZ4BFv8D+cfMG+rFWLTa091v1BFgHG+ayCpHpGzdPj8mC3RVegg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailbox.org; s=mail20150812; 
 t=1718647243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Mrr+aNVdeAEnb5b6xeB2i2FiOloo4PpUyApqSbH2knA=;
 b=YAUxKnUV55lsiMfDaVqsLH9c4TVPByUM+5exPv2bPXyIe0VGYiOZAM/qioOy2xz7DghqNO
 D/vtiPqYbQ+F/1JFPRBaktLZEzJhNZCjlzO63aaR6dx+KxpgIfR3J9fQXpwn48ZGc4NXGY
 rLbeo2yHSsv9xbUP6tqHvdIsD/GF0NEFYGW/BbckcYi1KeEdNH93MJxgmRbsHT6HL9yd3f
 7qOFoJS3Gufo7VSu7XDgLeuTzVUW/56D9f288aTyz5WmFPHQ3o+n6+lI5RX0GvgJi8lZyW
 NooqkF2RPS4McbHqPacsfEkBCPTG0SBzcTEeH4tyy4KHQD1krFKm+pdx+Spppw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=mailbox.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=mailbox.org
 header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812
 header.b=d6cuF5H/; 
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.a=rsa-sha256 header.s=mail20150812 header.b=YAUxKnUV
Subject: [Buildroot] [PATCH 1/1] package/c-ares: update site url
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
From: Alexander Wellbrock via buildroot <buildroot@buildroot.org>
Reply-To: a.wellbrock@mailbox.org
Cc: alex <alexander.wellbrock@othermo.de>,
 Alexander Wellbrock <a.wellbrock@mailbox.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: alex <alexander.wellbrock@othermo.de>

Download URLs changed after hosting of the c-ares website changed
ownership:
https://daniel.haxx.se/blog/2024/06/06/bye-bye-hosting-c-ares-web/

This cannot be fixed upstream as github pages does not support .htaccess
files according to:
https://github.com/c-ares/c-ares.github.io/issues/2

Signed-off-by: Alexander Wellbrock <a.wellbrock@mailbox.org>
---
 package/c-ares/c-ares.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index c4441255a2..a75a40da70 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 C_ARES_VERSION = 1.27.0
-C_ARES_SITE = http://c-ares.haxx.se/download
+C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/cares-1_28_1
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
 C_ARES_LICENSE = MIT
-- 
2.42.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
