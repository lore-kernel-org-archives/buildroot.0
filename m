Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937F8C001E0
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 11:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B83C583B8E;
	Sat, 29 Jul 2023 11:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B83C583B8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MZK_5S88jqoG; Sat, 29 Jul 2023 11:57:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1AF583B60;
	Sat, 29 Jul 2023 11:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1AF583B60
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 922541BF82C
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 11:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C33F40182
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 11:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C33F40182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L89PMhpOGyXO for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 11:56:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00737400C8
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 11:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00737400C8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0C6B83AE3; Sat, 29 Jul 2023 11:56:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 13:55:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 256395d8e5e7258df830dc19b47dc9ef19e48535
X-Git-Newrev: 4bcbf467c307a8bb07e7937ebf4b35e27eb66305
X-Patchwork-Hint: ignore
Message-Id: <20230729115651.E0C6B83AE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fio: add optional libiscsi
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

commit: https://git.buildroot.net/buildroot/commit/?id=4bcbf467c307a8bb07e7937ebf4b35e27eb66305
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 247ef2a fio has optional libiscsi engine support

This patch enables fio iscsi support if BR2_PACKAGE_LIBISCSI
was selected, which also requires pkg-config as it is used by the
configure script to detect libiscsi.

There is no --disable-libscsi option in the configure script: if
--enable-libiscsi is not passed, it doesn't even try to detect/use
libiscsi.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fio/fio.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index 90ec407207..b1763d6c73 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -9,6 +9,8 @@ FIO_SITE = http://brick.kernel.dk/snaps
 FIO_LICENSE = GPL-2.0
 FIO_LICENSE_FILES = COPYING MORAL-LICENSE
 
+FIO_OPTS = --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)"
+
 ifeq ($(BR2_PACKAGE_LIBAIO),y)
 FIO_DEPENDENCIES += libaio
 endif
@@ -17,6 +19,11 @@ ifeq ($(BR2_PACKAGE_LIBNFS),y)
 FIO_DEPENDENCIES += libnfs
 endif
 
+ifeq ($(BR2_PACKAGE_LIBISCSI),y)
+FIO_OPTS += --enable-libiscsi
+FIO_DEPENDENCIES += host-pkgconf libiscsi
+endif
+
 ifeq ($(BR2_PACKAGE_NUMACTL),y)
 FIO_DEPENDENCIES += numactl
 endif
@@ -26,7 +33,7 @@ FIO_DEPENDENCIES += zlib
 endif
 
 define FIO_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) ./configure --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)")
+	(cd $(@D); $(TARGET_MAKE_ENV) ./configure $(FIO_OPTS))
 endef
 
 define FIO_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
