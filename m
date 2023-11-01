Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1C6C4167D
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 18:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 851B084C38;
	Wed,  1 Nov 2023 18:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 851B084C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZgOrRWrSrjV0; Wed,  1 Nov 2023 18:14:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9434E84C1F;
	Wed,  1 Nov 2023 18:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9434E84C1F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4FFD1BF59F
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BCB170444
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BCB170444
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jUujHWzjai3T for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 18:13:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A72A7045B
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 18:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A72A7045B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0506686441; Wed,  1 Nov 2023 18:13:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 19:12:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a2909ea48f31bb8558a4a8dcc32465cef698ee6
X-Git-Newrev: 3204b01f5352d9161db43bd5e3efe58b79c47ead
X-Patchwork-Hint: ignore
Message-Id: <20231101181337.0506686441@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openrc: add split-user support
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

commit: https://git.buildroot.net/buildroot/commit/?id=3204b01f5352d9161db43bd5e3efe58b79c47ead
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also, introduce a new test in support/testing/tests/init/test_openrc.py that
ensures split-user support works properly.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openrc/openrc.mk                  |  6 ++++++
 support/testing/tests/init/test_openrc.py | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index e3f51d45d1..63aec7615e 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -40,6 +40,12 @@ else
 OPENRC_CONF_OPTS += -Dpam=false
 endif
 
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+OPENRC_CONF_OPTS += -Dsplit-usr=false
+else
+OPENRC_CONF_OPTS += -Dsplit-usr=true
+endif
+
 define OPENRC_INSTALL_SYSV_RCS_SCRIPT
 	$(INSTALL) -D -m 0755 $(OPENRC_PKGDIR)/sysv-rcs \
 		$(TARGET_DIR)/etc/init.d/sysv-rcs
diff --git a/support/testing/tests/init/test_openrc.py b/support/testing/tests/init/test_openrc.py
index c6ade7676d..a1eb8fe213 100644
--- a/support/testing/tests/init/test_openrc.py
+++ b/support/testing/tests/init/test_openrc.py
@@ -44,3 +44,16 @@ class TestInitSystemOpenrcRwFull(InitSystemOpenrcBase):
     def test_run(self):
         self.start_emulator("ext2")
         self.check_init()
+
+
+class TestInitSystemOpenrcMergedUsrFull(InitSystemOpenrcBase):
+    config = InitSystemOpenrcBase.config + \
+        """
+        BR2_ROOTFS_MERGED_USR=y
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_TARGET_ROOTFS_EXT2=y
+        """
+
+    def test_run(self):
+        self.start_emulator("ext2")
+        self.check_init()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
