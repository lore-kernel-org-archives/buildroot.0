Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C04ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB03A40BB8;
	Sun, 11 Sep 2022 08:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB03A40BB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tR4_5NUuxdMJ; Sun, 11 Sep 2022 08:54:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3300240B9A;
	Sun, 11 Sep 2022 08:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3300240B9A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7FE821BF9A4
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 973836107F
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 973836107F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5AA9YQfoIvgx for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3498661033
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3498661033
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 21FA383620; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:53:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b92dc8bd0f73615eaf63f9aad33bbf63b208603d
X-Git-Newrev: 4d32bd37458d6fa2b418c1a37aba59fcba9f3fac
X-Patchwork-Hint: ignore
Message-Id: <20220911084824.21FA383620@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/makedumpfile: add zstd optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d32bd37458d6fa2b418c1a37aba59fcba9f3fac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zstd is an optional dependency since bump to version 1.7.0 in commit
bbc52f3ff382e4c50baea2e1876a3f6ebf77a851 and
https://github.com/makedumpfile/makedumpfile/commit/afd0a6db2a0543217f8e46955a1b44b71f7e7ef3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/makedumpfile/makedumpfile.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index 8399e4d063..b787f0f387 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -30,6 +30,11 @@ MAKEDUMPFILE_DEPENDENCIES += snappy
 MAKEDUMPFILE_MAKE_OPTS += USESNAPPY=on
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+MAKEDUMPFILE_DEPENDENCIES += zstd
+MAKEDUMPFILE_MAKE_OPTS += USEZSTD=on
+endif
+
 define MAKEDUMPFILE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		$(MAKEDUMPFILE_MAKE_OPTS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
