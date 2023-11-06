Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3D5C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA271417D2;
	Mon,  6 Nov 2023 21:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA271417D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dqmwiWnDL2Qq; Mon,  6 Nov 2023 21:06:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E09EA4180D;
	Mon,  6 Nov 2023 21:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E09EA4180D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4BF261BF336
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24306612AD
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24306612AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KFN0rKUyZlES for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:05:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B94AB6129E
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B94AB6129E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BD0F869D7; Mon,  6 Nov 2023 21:05:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 22:05:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 798d917b8e91f65ae84172673bc304aea3895ee2
X-Git-Newrev: d9233db918edc05ceecca78fd23de9110507a231
X-Patchwork-Hint: ignore
Message-Id: <20231106210558.9BD0F869D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xen: fix selinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9233db918edc05ceecca78fd23de9110507a231
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following refpolicy build failure raised since commit
64ce823223fece5c106994d9654a126fc6161d6a:

policy/modules/system/xen.te:559:ERROR 'type udev_runtime_t is not within scope' at token ';' on line 628879:
	allow xm_t udev_runtime_t:dir { open read getattr lock search ioctl add_name remove_name write };

[...]

policy/modules/system/udev.te:205:ERROR 'unknown type systemd_hwdb_t' at token ';' on line 582304:
        allow udev_t systemd_hwdb_t:file map;

Fixes:
 - http://autobuild.buildroot.org/results/849050b00a2ee5983c2324cb955cd533189a0460

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xen/xen.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index ad71b14105..80412cca97 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -6,7 +6,7 @@
 
 XEN_VERSION = 4.14.6
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
-XEN_SELINUX_MODULES = xen
+XEN_SELINUX_MODULES = systemd udev xen
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
 XEN_CPE_ID_VENDOR = xen
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
