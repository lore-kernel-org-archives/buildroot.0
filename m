Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF657C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 16:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42845414E0;
	Sat,  5 Nov 2022 16:49:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42845414E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lYqrsOpcFNKO; Sat,  5 Nov 2022 16:49:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E84B740996;
	Sat,  5 Nov 2022 16:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E84B740996
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 026F11BF870
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 16:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D213D4047B
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 16:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D213D4047B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4N3zww-BHwu9 for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 16:48:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2FAC400D9
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 16:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2FAC400D9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2C7E87B77; Sat,  5 Nov 2022 16:48:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 17:23:21 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: abd03c74f80ca7f2f40797efd546eafb6d134eec
X-Git-Newrev: b1ff39b71191464b49bf9513d211e3f5e687515b
X-Patchwork-Hint: ignore
Message-Id: <20221105164858.D2C7E87B77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] boot/grub2: add patch to
 fix CVE-2021-3981
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1ff39b71191464b49bf9513d211e3f5e687515b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

This commit backports an upstream commit that fixes CVE-2021-3981.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 51b04fc02c8ec204b13cbf1f854328c7ca276a20)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...b-mkconfig-Restore-umask-for-the-grub.cfg.patch | 43 ++++++++++++++++++++++
 boot/grub2/grub2.mk                                |  2 +
 2 files changed, 45 insertions(+)

diff --git a/boot/grub2/0002-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch b/boot/grub2/0002-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
new file mode 100644
index 0000000000..0d6a1a6e01
--- /dev/null
+++ b/boot/grub2/0002-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
@@ -0,0 +1,43 @@
+From 8418defaf0902bdd8af188221ae54c5a3d6ad05d Mon Sep 17 00:00:00 2001
+From: Michael Chang <mchang@suse.com>
+Date: Fri, 3 Dec 2021 16:13:28 +0800
+Subject: [PATCH] grub-mkconfig: Restore umask for the grub.cfg
+
+The commit ab2e53c8a (grub-mkconfig: Honor a symlink when generating
+configuration by grub-mkconfig) has inadvertently discarded umask for
+creating grub.cfg in the process of running grub-mkconfig. The resulting
+wrong permission (0644) would allow unprivileged users to read GRUB
+configuration file content. This presents a low confidentiality risk
+as grub.cfg may contain non-secured plain-text passwords.
+
+This patch restores the missing umask and sets the creation file mode
+to 0600 preventing unprivileged access.
+
+Fixes: CVE-2021-3981
+
+Signed-off-by: Michael Chang <mchang@suse.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+[Upstream: https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=0adec29674561034771c13e446069b41ef41e4d4]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ util/grub-mkconfig.in | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/util/grub-mkconfig.in b/util/grub-mkconfig.in
+index f8cbb8d7a..84f356ea4 100644
+--- a/util/grub-mkconfig.in
++++ b/util/grub-mkconfig.in
+@@ -300,7 +300,10 @@ and /etc/grub.d/* files or please file a bug report with
+     exit 1
+   else
+     # none of the children aborted with error, install the new grub.cfg
++    oldumask=$(umask)
++    umask 077
+     cat ${grub_cfg}.new > ${grub_cfg}
++    umask $oldumask
+     rm -f ${grub_cfg}.new
+   fi
+ fi
+-- 
+2.37.2
+
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 4e7e0fa898..f04be05227 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -30,6 +30,8 @@ GRUB2_IGNORE_CVES += CVE-2019-14865
 # grub_linuxefi_secure_validate() is not implemented in the grub2
 # version available in Buildroot.
 GRUB2_IGNORE_CVES += CVE-2020-15705
+# 0002-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
+GRUB2_IGNORE_CVES += CVE-2021-3981
 
 ifeq ($(BR2_TARGET_GRUB2_INSTALL_TOOLS),y)
 GRUB2_INSTALL_TARGET = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
