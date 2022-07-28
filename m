Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CBDC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 19:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E8E2417AC;
	Thu, 28 Jul 2022 19:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E8E2417AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9f2ho1m7_Zjp; Thu, 28 Jul 2022 19:05:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C25241781;
	Thu, 28 Jul 2022 19:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C25241781
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24B3B1C11A5
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F16D341519
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F16D341519
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WkINgvMdD_H0 for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 19:04:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33C884099E
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 19:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33C884099E
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3B81586509; Thu, 28 Jul 2022 18:50:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 21:03:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 505b5a6cdd337c2fd5965aa875a1a53419d62ed1
X-Git-Newrev: 153225252046a697fc3ba1c662db617194a66b36
X-Patchwork-Hint: ignore
Message-Id: <20220728185030.3B81586509@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: use systemd-hwdb for
 generating HWDB
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

commit: https://git.buildroot.net/buildroot/commit/?id=153225252046a697fc3ba1c662db617194a66b36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

udevadm has been deprecated for a while for building the HWDB,
systemd-hwdb should be used in its place.

This tool further has a switch to generate the database in
/usr which is a better place for a one-time created file
than the default /etc/udev.

The systemd-hwdb wasn't enabled yet in the host build, so do that.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
[Arnout: split in two separate commits]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/systemd/systemd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 47aaddf849..45140cb042 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -307,7 +307,7 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_HWDB),y)
 SYSTEMD_CONF_OPTS += -Dhwdb=true
 define SYSTEMD_BUILD_HWDB
-	$(HOST_DIR)/bin/udevadm hwdb --update --root $(TARGET_DIR)
+	$(HOST_DIR)/bin/systemd-hwdb update --root $(TARGET_DIR) --strict --usr
 endef
 SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_BUILD_HWDB
 define SYSTEMD_RM_HWDB_SRV
@@ -819,7 +819,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dsysusers=false \
 	-Dtmpfiles=true \
 	-Dimportd=false \
-	-Dhwdb=false \
+	-Dhwdb=true \
 	-Drfkill=false \
 	-Dman=false \
 	-Dhtml=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
