Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F191C4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 08:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0970615F9;
	Thu, 11 Jan 2024 08:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0970615F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g-DMnoCB9qBm; Thu, 11 Jan 2024 08:49:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3597D615E4;
	Thu, 11 Jan 2024 08:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3597D615E4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92FD91BF57C
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 08:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78A5741B50
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 08:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78A5741B50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7KVmG58-_AGD for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 08:49:03 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06E0041B19
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 08:49:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06E0041B19
Received: by mail.gandi.net (Postfix) with ESMTPSA id 995A6C000F;
 Thu, 11 Jan 2024 08:48:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1rNqkE-0099Jw-2V;
 Thu, 11 Jan 2024 09:48:58 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 09:48:54 +0100
Message-Id: <20240111084855.2180761-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH] package/udev: move back sgx group from systemd
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 6d163e12a4784580 (package/udev: move render and sgx to
package/systemd) moved the sgx group creation to the systemd package because
eudev at that time did not reference it.  This changed in eudev 3.1.12 with
commit a8ffcd1b985fb4 (rules/50-udev-default.rules: fix issue 160) so move
it back to get rid of a warning from udevd:

udevd[303]: specified group 'sgx' unknown

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 1 -
 package/udev/udev.mk       | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 4746bda904..d371233cfe 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -639,7 +639,6 @@ endef
 define SYSTEMD_USERS
 	# udev user groups
 	- - render -1 * - - - DRI rendering nodes
-	- - sgx -1 * - - - SGX device nodes
 	# systemd user groups
 	- - systemd-journal -1 * - - - Journal
 	$(SYSTEMD_REMOTE_USER)
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index d70d13ebb3..21c1a71f5a 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -8,6 +8,7 @@
 define UDEV_USERS
 	- - input -1 * - - - Input device group
 	- - kvm -1 * - - - kvm nodes
+	- - sgx -1 * - - - SGX device nodes
 endef
 
 $(eval $(virtual-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
