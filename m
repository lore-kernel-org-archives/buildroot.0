Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40443E77179
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 15:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C38BD60B49;
	Fri,  6 Dec 2024 15:04:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cgkEeV55DdWI; Fri,  6 Dec 2024 15:04:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B33BF61210
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B33BF61210;
	Fri,  6 Dec 2024 15:04:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8E7EECA
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 15:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96C8E403E2
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 15:04:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bRQ_66cXMDf1 for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 15:04:50 +0000 (UTC)
X-Greylist: delayed 26462 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 06 Dec 2024 15:04:49 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2229C401A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2229C401A2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2229C401A2
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 15:04:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 956AD1BF208;
 Fri,  6 Dec 2024 15:04:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tJZsr-007VKB-3C;
 Fri, 06 Dec 2024 16:04:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri,  6 Dec 2024 16:04:43 +0100
Message-Id: <20241206150443.1788694-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/foot: change to git download to work
 around codeberg archive issue
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/1959614f6ad63878c390a23770a6778830d6c698/

The tarball downloaded from codeberg has changed.  Interesting enough, it is
only the compression that has changed, the uncompressed data is still
identical:

mkdir s.b.o codeberg
wget -P codeberg https://codeberg.org/dnkl/foot/archive/1.16.2.tar.gz
wget -P s.b.o http://sources.buildroot.org/foot/1.16.2.tar.gz

sha256sum */*
0e02af376e5f4a96eeb90470b7ad2e79a1d660db2a7d1aa772be43c7db00e475  codeberg/1.16.2.tar.gz
8060ec28cbf6e2e3d408665330da4bc48fd094d4f1265d7c58dc75c767463c29  s.b.o/1.16.2.tar.gz

gunzip */*
sha256sum */*
7b9fad0611c75d6ba8f53d12ad1366d53c8697240031a5b27334d173b76560fe  codeberg/1.16.2.tar
7b9fad0611c75d6ba8f53d12ad1366d53c8697240031a5b27334d173b76560fe  s.b.o/1.16.2.tar

Looking at the autobuilder history, this seems to have changed in
January/February, E.G. on January 20th the file hash was correct:

http://autobuild.buildroot.net/results/d4b90a505a035d9bab400ed65f94571854f74f24/

But on February 14th it wasn't:

http://autobuild.buildroot.net/results/2ff85fe3fba2d36c7f0358f2ce43e703aef5f4f0/

This was unfortunately only noticed once we started doing builds without the
s.b.o fallback. To fix it, change to a git clone instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/foot/foot.hash | 2 +-
 package/foot/foot.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/foot/foot.hash b/package/foot/foot.hash
index f3bf0f6058..9a4335f2c6 100644
--- a/package/foot/foot.hash
+++ b/package/foot/foot.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8060ec28cbf6e2e3d408665330da4bc48fd094d4f1265d7c58dc75c767463c29  1.16.2.tar.gz
+sha256  ff81bca86178ef326588176f8bdf817bb3e0fbc891d026960144f69c8a74eb4d  foot-1.16.2-git4.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/foot/foot.mk b/package/foot/foot.mk
index 1595e2a718..e300d04d0a 100644
--- a/package/foot/foot.mk
+++ b/package/foot/foot.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 FOOT_VERSION = 1.16.2
-FOOT_SOURCE = $(FOOT_VERSION).tar.gz
-FOOT_SITE = https://codeberg.org/dnkl/foot/archive
+FOOT_SITE = https://codeberg.org/dnkl/foot.git
+FOOT_SITE_METHOD = git
 FOOT_LICENSE = MIT
 FOOT_LICENSE_FILES = LICENSE
 FOOT_DEPENDENCIES = \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
