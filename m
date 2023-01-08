Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7558C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EE424F356;
	Tue, 21 Feb 2023 00:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EE424F356
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vVb2Al2RYSSe; Tue, 21 Feb 2023 00:25:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02B134F36E;
	Tue, 21 Feb 2023 00:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02B134F36E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB2DC1BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BF436FB3C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BF436FB3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bNAc6wh2DAfR for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E4E56FB10
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E4E56FB10
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69A168648F; Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 8 Jan 2023 16:57:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a0e134a05342507bd9ac47da03abca4c9c113a64
X-Git-Newrev: 4d5fd84496ac0ec65e7aed73a9386ab62f2a2c19
X-Patchwork-Hint: ignore
Message-Id: <20230220205228.69A168648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/crun: add libgcrypt
 optional dependency
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
