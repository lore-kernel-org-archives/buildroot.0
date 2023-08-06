Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F823C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B12B640887;
	Sun,  6 Aug 2023 14:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B12B640887
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S112bSLZ21g3; Sun,  6 Aug 2023 14:05:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 682D141488;
	Sun,  6 Aug 2023 14:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 682D141488
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 769D71BF340
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C70760B9C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C70760B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jUOj97JrcwcD for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:03:24 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C68A860AA7
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C68A860AA7
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C3E37A4C10D8;
 Sun,  6 Aug 2023 16:02:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46282)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSeLD-0000Bn-1h;
 Sun, 06 Aug 2023 16:02:43 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 16:02:32 +0200
Message-Id: <20230806140241.4155773-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230806140241.4155773-1-bernd@kuhls.net>
References: <20230806140241.4155773-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691330563;
 bh=hQBTmTFWRdeJW4HB1hhCqL3psaSDOkN7o1gwjbihfgA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uHbyrVokqP+46ZzLgg42DiTuUYSNd+bpsIAIeNjD4tXUtJ4jc5gr0KkTb7ShtVU/x
 XO9A6G9CCZYorPtwVpuW4e59WpbsgMI469XTFP2nnQw3v97qkRyu96wM12bXu24vzZ
 oz7vW1IBtYF9pwYlNSmh5S4aB1DcdHE7HOeDTJbLRXgh1fVIxO2FqJzzk8JjDQerEm
 Dr8PqbxHTYyA8qlU4fd4yfR8PsMCQxmJjc6KoX6j4yIX8Q/xcdUwZTjki1YM34YRSN
 hIRBBp308uOXQtAVv7wJn+av2ToYfuugqQsjvLtBFpAzcIBJlIiSvchzDFKQ2d4C2z
 a3Ji5cVQ1IiCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=uHbyrVok
Subject: [Buildroot] [PATCH/next v9 03/12] package/libudev: new virtual
 package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Sen Hastings <sen@phobosdpl.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/Config.in          | 1 +
 package/libudev/Config.in  | 6 ++++++
 package/libudev/libudev.mk | 7 +++++++
 3 files changed, 14 insertions(+)
 create mode 100644 package/libudev/Config.in
 create mode 100644 package/libudev/libudev.mk

diff --git a/package/Config.in b/package/Config.in
index dd57856444..dfcb666be6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -531,6 +531,7 @@ endmenu
 	source "package/libiec61850/Config.in"
 	source "package/libmanette/Config.in"
 	source "package/libubootenv/Config.in"
+	source "package/libudev/Config.in"
 	source "package/libuio/Config.in"
 	source "package/linux-backports/Config.in"
 	source "package/linux-serial-test/Config.in"
diff --git a/package/libudev/Config.in b/package/libudev/Config.in
new file mode 100644
index 0000000000..2dbafe4991
--- /dev/null
+++ b/package/libudev/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HAS_LIBUDEV
+	bool
+
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	string
+	depends on BR2_PACKAGE_HAS_LIBUDEV
diff --git a/package/libudev/libudev.mk b/package/libudev/libudev.mk
new file mode 100644
index 0000000000..af1b3ddb51
--- /dev/null
+++ b/package/libudev/libudev.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# libudev
+#
+################################################################################
+
+$(eval $(virtual-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
