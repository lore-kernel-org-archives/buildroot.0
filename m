Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03830C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 16:18:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22D1C61AF9
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 16:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22D1C61AF9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEEEA608CB;
	Sun,  3 Oct 2021 16:18:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dhfExvITjj58; Sun,  3 Oct 2021 16:18:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E5DB60AFA;
	Sun,  3 Oct 2021 16:18:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA9461BF45A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 16:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA9FE84395
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 16:18:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xKxD_fNG8_It for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 16:18:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B40A68438F
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 16:18:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 2E208E0002;
 Sun,  3 Oct 2021 16:18:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Sun,  3 Oct 2021 18:18:10 +0200
Message-Id: <20211003161811.256036-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-augeas: switch from "depends on"
 to "select" for augeas dep
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
Cc: Herve Codina <herve.codina@bootlin.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

During the review of the lua-augeas package, it was pointed out that a
"select BR2_PACKAGE_AUGEAS" should be used instead of a "depends on
BR2_PACKAGE_AUGEAS". But, the same review pointed that python-augeas
used a "depends on BR2_PACKAGE_AUGEAS".

In order to make things consistent, let's switch to "select
BR2_PACKAGE_AUGEAS" as well for python-augeas.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-augeas/Config.in | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/python-augeas/Config.in b/package/python-augeas/Config.in
index 3503a83b3b..4ab2bd1b26 100644
--- a/package/python-augeas/Config.in
+++ b/package/python-augeas/Config.in
@@ -1,8 +1,14 @@
 config BR2_PACKAGE_PYTHON_AUGEAS
 	bool "python-augeas"
-	depends on BR2_PACKAGE_AUGEAS
+	depends on !BR2_arc
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_AUGEAS
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	help
 	  Pure python bindings for Augeas.
 
 	  https://github.com/hercules-team/python-augeas
+
+comment "python-augeas needs a toolchain w/ wchar"
+	depends on !BR2_arc
+	depends on !BR2_USE_WCHAR
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
