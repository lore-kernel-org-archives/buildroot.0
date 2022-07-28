Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114ECC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 20:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFCCE812F7;
	Thu, 28 Jul 2022 20:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFCCE812F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J5Z05YiJeRmZ; Thu, 28 Jul 2022 20:59:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1F4C80D9A;
	Thu, 28 Jul 2022 20:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1F4C80D9A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 60FC11BF37F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CE4B40327
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CE4B40327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NyHLRyZuYPp1 for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:59:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66F5F402F2
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66F5F402F2
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 45817867FE; Thu, 28 Jul 2022 20:45:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 22:58:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba27d5a63bca33bbb17e7f3d379f9fabef50d635
X-Git-Newrev: b573a7029523925746efbe056f7ff02b63edbb7f
X-Patchwork-Hint: ignore
Message-Id: <20220728204520.45817867FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/connman: add an option to disable
 stats generation
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b573a7029523925746efbe056f7ff02b63edbb7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
