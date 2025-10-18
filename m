Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C72CCD195
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 19:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28BDB60E52;
	Sat, 18 Oct 2025 19:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Ud_lb3a_b3A; Sat, 18 Oct 2025 19:43:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B06360E3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B06360E3B;
	Sat, 18 Oct 2025 19:43:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A21BFD8
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CA1483BB8
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YDHxhOXkwcJY for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 19:43:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 994D483BB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 994D483BB3
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 994D483BB3
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id EF8114E41186
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:43:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C671B6069D;
 Sat, 18 Oct 2025 19:43:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0559F102F237E; 
 Sat, 18 Oct 2025 21:43:29 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Cc: romain.gantois@bootlin.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Sat, 18 Oct 2025 21:43:00 +0200
Message-ID: <20251018194314.114284-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
References: <20251018194314.114284-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760816610; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=ejgLO6ZWNjzWMotM3UU0NKWXyskLsm7vRZQl9kueAJU=;
 b=m9/09DgtGqBE/Y1NXYrx2aLaGQDf+0quMGkYKZfVxdkkdyGdFVByS/N95maThfL4T1ogOC
 vcqKSBp/MkTv2dI7LYccOngMP1smUeUSQUBGbdltvAeNyW8A94M7UllJ0lu/TYUCvYZNbB
 CLKvbfSFHX8kpYPh0GvF+K4T95mpH6Ao970/AO7ooX3zTvIWN9NgU3AMMUmR1Gt+fdaC8N
 Yz5OczcguDlxTm0IVgwsvUWXoveXt7Fo+9f2uSLgW4Cw4wQKeGMRyGDvhyvbDwEWNad5Ft
 P+A67b3n5/cRn5NGFLgoTBea1i1XqeKHwWibZ7qk+/CNdjBke6gNRX+EUnnJcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=m9/09Dgt
Subject: [Buildroot] [PATCH 02/11] support/testing/infra/basetest.py: add
 BRHostPkgTest class
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Runtime test cases are currently mostly used to test target packages,
and the BRTest class is perfect for that as we can easily feed a
Buildroot configuration, boot it under Qemu and run commands inside
the emulator.

A few tests use the more basic BRConfigTest when they have special
needs that don't match with BRTest.

However, as we are going to add a number of tests to verify the proper
functionality of some host only packages, which have no visible
menuconfig option, it makes sense to add another BRHostPkgTest class
that allows to easily trigger the build of "make host-<foo>
host-<bar>", and then run some commands on the host machine. Such
tests could be done by using BRConfigTest, but that would require a
bit of duplicated boilerplate, which BRHostPkgTest allows to remove.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/basetest.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 9fb9dffc53..13f9b2d398 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -60,6 +60,28 @@ class BRConfigTest(unittest.TestCase):
             self.b.delete()
 
 
+class BRHostPkgTest(BRConfigTest):
+    """Test up to the build stage of a host package. Define hostpkgs in
+    the class to the list of host packages that should be built."""
+    config = \
+        BASIC_TOOLCHAIN_CONFIG + \
+        MINIMAL_CONFIG
+    hostpkgs = None
+
+    def __init__(self, names):
+        super(BRHostPkgTest, self).__init__(names)
+
+    def setUp(self):
+        super(BRHostPkgTest, self).setUp()
+        if not self.b.is_finished():
+            self.show_msg("Building")
+            self.b.build(make_extra_opts=self.hostpkgs)
+            self.show_msg("Building done")
+
+    def tearDown(self):
+        super(BRHostPkgTest, self).tearDown()
+
+
 class BRTest(BRConfigTest):
     """Test up to the build stage and instantiate an emulator."""
     def __init__(self, names):
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
