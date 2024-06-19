Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91F0C27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 08:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B11240676;
	Wed, 19 Jun 2024 08:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hyIv4Zcp44dQ; Wed, 19 Jun 2024 08:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28FFE413B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28FFE413B9;
	Wed, 19 Jun 2024 08:02:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 595541BF2C2
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 08:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45852401B2
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 08:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EeKEAktvYgr9 for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 08:02:23 +0000 (UTC)
X-Greylist: delayed 371 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 19 Jun 2024 08:02:20 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9E13740124
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E13740124
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.250.0.168;
 helo=mx.adeep.su; envelope-from=adeep@lexina.in; receiver=<UNKNOWN> 
Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E13740124
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 08:02:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BBE76AA2A2; Wed, 19 Jun 2024 10:55:51 +0300 (MSK)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
Date: Wed, 19 Jun 2024 10:55:40 +0300
Message-ID: <20240619075547.1390096-1-adeep@lexina.in>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lexina.in; s=dkim; 
 t=1718783764; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding; bh=WoBbOOWlNA6eiCRAVZxw+TNWwCEQbLsCg4C5YY8+DVQ=;
 b=a5NBskk9FqGwOQBsLPJgJwvYbyaAB1oIir9oJTRyVuTqcV1NCIyCF1ObcxYdR2GRMJLJEM
 kS7WzTN2DiIir8DS25V6gKsvtQUk1Mm50x2Ha70K5vwHUgp8QG37X1QXgcEoZik5HtOyI7
 s3Hx0+E0zSh0YtjknqSZFwlZYupJHvsEhjKamrhAs86pqIJjvJL1Ak8VZfIDB4LG9k3X2E
 NQSY10yGsgyZlWlFVb9lE/b3P3Obd53GpY0oAPejvkxWud/mcDLiiqzBywlt4l0Zr0c6L0
 VB7kdkSnFVvscIUbnyfEyJOIwWMeLJJqC4TcKrwYHdB7AwlOrqEuQ56gv4Gfxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=lexina.in
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=lexina.in header.i=@lexina.in header.a=rsa-sha256
 header.s=dkim header.b=a5NBskk9
Subject: [Buildroot] [PATCH v1] package/rtl8822cs bump driver version to
 latest
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
From: Viacheslav Bocharov via buildroot <buildroot@buildroot.org>
Reply-To: Viacheslav Bocharov <adeep@lexina.in>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update driver for kernel 6.9+
- Fix warning/errors on build

Fixes: http://autobuild.buildroot.net/results/82dd4d986c0ddfb48e7316473186ef4c9d8ee783

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 package/rtl8822cs/rtl8822cs.hash | 3 ++-
 package/rtl8822cs/rtl8822cs.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
index 34bcc412ce..77e837a0ac 100644
--- a/package/rtl8822cs/rtl8822cs.hash
+++ b/package/rtl8822cs/rtl8822cs.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  d61fff0ee8b4219a6441791ff26be1b8c49ef8b2ca78345bf12b7a0541f498e9  rtl8822cs-fda6cd263e89567272060e6182a39aee20b894c4.tar.gz
+sha256  9aea86233848e9edb497b27614c78680f7bb1962579d4b05333d9c1a189c62fe  rtl8822cs-40450f759c8a930d271b5f0a663685f412debc72.tar.gz
+
diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
index dbdc7d84bf..223d232c8d 100644
--- a/package/rtl8822cs/rtl8822cs.mk
+++ b/package/rtl8822cs/rtl8822cs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8822CS_VERSION = fda6cd263e89567272060e6182a39aee20b894c4
+RTL8822CS_VERSION = 40450f759c8a930d271b5f0a663685f412debc72
 RTL8822CS_SITE = $(call github,jethome-ru,rtl88x2cs,$(RTL8822CS_VERSION))
 RTL8822CS_LICENSE = GPL-2.0
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
