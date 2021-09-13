Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09558C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 17:47:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FC1D60EB4
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 17:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FC1D60EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35BBA6074E;
	Mon, 13 Sep 2021 17:47:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H0OqmOSJIed7; Mon, 13 Sep 2021 17:47:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 701EB6078C;
	Mon, 13 Sep 2021 17:47:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04AE21BF97E
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 17:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E43E3401D8
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 17:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UV4OL8leQQoM for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 17:47:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05C054013F
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 17:47:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F3E268A52B; Mon, 13 Sep 2021 17:45:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 19:31:55 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: eb4f027d55307582febefc0c31b8dac5ea94751b
X-Git-Newrev: 0d6c66fa7e7fc06bc1527a970d11af2fb5bc9c42
X-Patchwork-Hint: ignore
Message-Id: <20210913174527.F3E268A52B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/libvirt: fix
 build with lvm2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0d6c66fa7e7fc06bc1527a970d11af2fb5bc9c42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

libvirt needs a lvm2 standard install since its addition in commit
ccfc90e1010e42e6529afae3a5ea8bf7226dabc1 to avoid the following build
failure:

../output-1/build/libvirt-7.4.0/meson.build:1831:6: ERROR: Program 'pvcreate' not found

Fixes:
 - http://autobuild.buildroot.org/results/dc9af7a677af7e53c1240ebbee5b0edc84c8cf52

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d0bd34ab2099494132a37c3f4a7e1e75cdc996da)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvirt/libvirt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 1b420771f5..847c35e06e 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -166,7 +166,7 @@ else
 LIBVIRT_CONF_OPTS += -Dselinux=disabled -Dsecdriver_selinux=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_LVM2),y)
+ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),y)
 LIBVIRT_CONF_OPTS += -Dstorage_lvm=enabled
 LIBVIRT_DEPENDENCIES += lvm2
 else
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
