Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DCCECAAD3
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 12:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EE444114E;
	Thu,  1 Sep 2022 12:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EE444114E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jOZ9tYGgh3bD; Thu,  1 Sep 2022 12:53:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70C1B404EC;
	Thu,  1 Sep 2022 12:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70C1B404EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3D4D1BF356
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 12:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F7BD60C34
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 12:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F7BD60C34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i0bn2FfUjaAM for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 12:53:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B827C60C2D
 for <buildroot@buildroot.org>; Thu,  1 Sep 2022 12:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B827C60C2D
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B6A9B85CBB; Thu,  1 Sep 2022 12:38:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 1 Sep 2022 14:28:16 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6c872197f412b011ceefc6fb5ebbb34f2fb00c15
X-Git-Newrev: 45b4eddae6d0e60f4d545854265a7973f552d1e6
X-Patchwork-Hint: ignore
Message-Id: <20220901123836.B6A9B85CBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/connman: add an
 option to disable stats generation
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

commit: https://git.buildroot.net/buildroot/commit/?id=45b4eddae6d0e60f4d545854265a7973f552d1e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

By default connman periodically saves network interface statistics
into an mmap'd round robin file. These are not accessible over the
D-Bus interface and the only method to interact with this is
ResetCounters() which is marked as experimental.

Continually writing statistics will increase drive wear and may not be
desirable in some devices with limited flash erase cycles, so add an
option to disable this.

Note that connman does not provide any runtime control over this
facility, it can only be disabled via the configure script.

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b573a7029523925746efbe056f7ff02b63edbb7f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/Config.in  | 8 ++++++++
 package/connman/connman.mk | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 72b76bf19d..af3e1f69f6 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -94,6 +94,14 @@ comment "ofono support needs a toolchain w/ headers >= 4.12"
 config BR2_PACKAGE_CONNMAN_DEBUG
 	bool "enable compiling with debugging information"
 
+config BR2_PACKAGE_CONNMAN_STATS
+	bool "enable statistics round robin file generation"
+	help
+	  Enable generation of statistics in a round robin file.
+
+	  This is enabled by default upstream but is marked as
+	  experimental.
+
 config BR2_PACKAGE_CONNMAN_CLIENT
 	bool "enable command line client"
 	select BR2_PACKAGE_READLINE
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 1b6fd611f5..a76a339e6f 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -65,6 +65,12 @@ else
 CONNMAN_CONF_OPTS += --disable-ofono
 endif
 
+ifeq ($(BR2_PACKAGE_CONNMAN_STATS),y)
+CONNMAN_CONF_OPTS += --enable-stats
+else
+CONNMAN_CONF_OPTS += --disable-stats
+endif
+
 ifeq ($(BR2_PACKAGE_CONNMAN_WIFI),y)
 CONNMAN_CONF_OPTS += --enable-wifi
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
