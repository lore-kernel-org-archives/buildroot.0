Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BB0C53210
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 15:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EA8760A68;
	Sun,  8 Jan 2023 15:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EA8760A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WetztbfWlIoZ; Sun,  8 Jan 2023 15:58:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3BDF60A4F;
	Sun,  8 Jan 2023 15:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3BDF60A4F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AFD81BF360
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 15:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA65B81CEF
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 15:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA65B81CEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id meomIwaiIi-J for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 15:58:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F6E981CE7
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 15:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F6E981CE7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C0CC876C5; Sun,  8 Jan 2023 15:58:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 8 Jan 2023 16:57:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0e134a05342507bd9ac47da03abca4c9c113a64
X-Git-Newrev: 4d5fd84496ac0ec65e7aed73a9386ab62f2a2c19
X-Patchwork-Hint: ignore
Message-Id: <20230108155803.2C0CC876C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crun: add libgcrypt optional
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4d5fd84496ac0ec65e7aed73a9386ab62f2a2c19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libgcrypt is an optional dependency which is enabled by default since
version 1.7 and
https://github.com/containers/crun/commit/dd310aaf5aee336d0f6236c1c2add7b7cb030482

Unfortunately, thetre are no associated --enable/disable flags; it all
depends on auto-detection.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/crun/crun.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index 8c9993993c..fd8bfb0981 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -26,6 +26,10 @@ else
 CRUN_CONF_OPTS += --disable-caps
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+CRUN_DEPENDENCIES += libgcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 CRUN_DEPENDENCIES += libseccomp
 CRUN_CONF_OPTS += --enable-seccomp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
