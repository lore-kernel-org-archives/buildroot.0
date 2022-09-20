Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B9AC54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 21:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02E3E60FCE;
	Tue, 20 Sep 2022 21:29:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02E3E60FCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LlJhGaNygNYH; Tue, 20 Sep 2022 21:29:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24F4F60FCA;
	Tue, 20 Sep 2022 21:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24F4F60FCA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 264611BF2A7
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 21:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B42A401A4
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 21:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B42A401A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2JLg4-z04Q74 for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 21:29:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3A7C409E7
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3A7C409E7
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 21:29:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 570CB60003;
 Tue, 20 Sep 2022 21:29:22 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Sep 2022 23:29:19 +0200
Message-Id: <20220920212921.732287-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663709362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=T8JWEbUHDR6jP9OnPi85BggKS7rdfgHbJ/8q0BQPfrs=;
 b=aGGFswD2biBTa+O/usoFzic+i8nvPsjjGQ1XQFFNxIJn4DBvju2x/VX9zVsL11SWyHVSxq
 oY/xOfhsYRxh8fw2hCeOxW55EyO+b77ZIMAv3hsRxNKLMAG2nGN26SGH+zfE56WhFHb7G2
 rxiu+94GCdr5raAFU6IyV3rR7RLVh+5nmbdR5XX0BTWcAijLhDDss3C5EMn4qaGEFcyqrO
 95FHKeQeYToUI6apMRdl1/f8iwOqADaUbIPXCk1ZLJUhAsfVh/Fjni80zT95Dg7rZvXbX+
 /IjHA4f0ZMvYzgQ/BgcZVBRN/MC+munBtRQQQPlcMwWcXCRCCFJDjY3wxETrGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aGGFswD2
Subject: [Buildroot] [PATCH 1/2] boot/grub2: add patch to fix CVE-2021-3981
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit backports an upstream commit that fixes CVE-2021-3981.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...onfig-Restore-umask-for-the-grub.cfg.patch | 43 +++++++++++++++++++
 boot/grub2/grub2.mk                           |  2 +
 2 files changed, 45 insertions(+)
 create mode 100644 boot/grub2/0002-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch

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
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
