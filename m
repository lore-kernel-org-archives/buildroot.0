Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77017C433EF
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 20:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EE976106F;
	Tue, 10 May 2022 20:27:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JTmJd7lkCTFt; Tue, 10 May 2022 20:27:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C8C360FDB;
	Tue, 10 May 2022 20:27:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67EB01BF82F
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 20:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5711E401B6
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 20:27:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yvbcX_8UueOM for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 20:27:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8714940195
 for <buildroot@buildroot.org>; Tue, 10 May 2022 20:27:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4606685D34; Tue, 10 May 2022 20:16:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 22:25:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68d0aede597d32816c5b2ff32de0ce33cc14eb93
X-Git-Newrev: c2d3033ddcf0c497cd46744bdd2bee84d18349a4
X-Patchwork-Hint: ignore
Message-Id: <20220510201626.4606685D34@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc: add option to enable gpt
 support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c2d3033ddcf0c497cd46744bdd2bee84d18349a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GPT support was disabled by default before.

Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rauc/Config.in | 6 ++++++
 package/rauc/rauc.mk   | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/rauc/Config.in b/package/rauc/Config.in
index b4f7b81948..2ea51f5bad 100644
--- a/package/rauc/Config.in
+++ b/package/rauc/Config.in
@@ -25,6 +25,12 @@ config BR2_PACKAGE_RAUC_DBUS
 	  This option enables support for controlling rauc through
 	  D-Bus.
 
+config BR2_PACKAGE_RAUC_GPT
+	bool "GPT support"
+	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
+	help
+	    This option enables support for GPT partition tables.
+
 config BR2_PACKAGE_RAUC_NETWORK
 	bool "network support"
 	select BR2_PACKAGE_LIBCURL
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 7a10470cf2..0520b30521 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -31,6 +31,13 @@ else
 RAUC_CONF_OPTS += --disable-service
 endif
 
+ifeq ($(BR2_PACKAGE_RAUC_GPT),y)
+RAUC_CONF_OPTS += --enable-gpt
+RAUC_DEPENDENCIES += util-linux-libs
+else
+RAUC_CONF_OPTS += --disable-gpt
+endif
+
 ifeq ($(BR2_PACKAGE_RAUC_NETWORK),y)
 RAUC_CONF_OPTS += --enable-network
 RAUC_DEPENDENCIES += libcurl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
