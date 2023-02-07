Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1441DC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2740416ED;
	Tue,  7 Feb 2023 21:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2740416ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sKnN4iNQYd-a; Tue,  7 Feb 2023 21:52:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4EC7417FB;
	Tue,  7 Feb 2023 21:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4EC7417FB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 94B4E1BF377
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F30740B26
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F30740B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bk5TRrRMhnHC for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4A814057A
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4A814057A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BEB2843AC; Tue,  7 Feb 2023 21:51:54 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 22:51:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b16ae93c85355aad3440737bc4ef7c3ec2d534f3
X-Git-Newrev: 9a095643b4dd34eb7acb69662aa64fa945f4b542
X-Patchwork-Hint: ignore
Message-Id: <20230207215154.8BEB2843AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] system: Warn if systemd is used with
 kernel < 4.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a095643b4dd34eb7acb69662aa64fa945f4b542
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To quote the README:

> Kernel versions below 4.15 have significant gaps in functionality and
> are not recommended for use with this version of systemd. Taint flag
> 'old-kernel' will be set. Systemd will most likely still function, but
> upstream support and testing are limited.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 system/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index 6100d965e7..1ca7690ea3 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -140,6 +140,10 @@ comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.15, host and targe
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_HOST_GCC_AT_LEAST_5
 
+comment "systemd highly recommends Linux >= 4.15"
+	depends on BR2_INIT_SYSTEMD
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
+
 config BR2_INIT_NONE
 	bool "None"
 	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
