Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C214E95A67
	for <buildroot@archiver.kernel.org>; Sun,  8 Oct 2023 18:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCFF1408F9;
	Sun,  8 Oct 2023 18:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCFF1408F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qib2CYUaunqN; Sun,  8 Oct 2023 18:29:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D93540853;
	Sun,  8 Oct 2023 18:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D93540853
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73E0E1BF3AD
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 18:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D3F680E92
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 18:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D3F680E92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bv_dsDMjcqMP for <buildroot@lists.busybox.net>;
 Sun,  8 Oct 2023 18:29:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23E5E80E7B
 for <buildroot@buildroot.org>; Sun,  8 Oct 2023 18:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23E5E80E7B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D89C843A7; Sun,  8 Oct 2023 18:29:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 8 Oct 2023 20:11:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1316b4ef313cf5257a8cde39179b3e438f88318e
X-Git-Newrev: 4c185a42fdad1b48f61286edf65421818d43fd79
X-Patchwork-Hint: ignore
Message-Id: <20231008182952.0D89C843A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] system: introduce a choice for /var
 management
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2350350118497516238=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2350350118497516238==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4c185a42fdad1b48f61286edf65421818d43fd79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we have a single solution to handle the /var content on a
read-only root filesystem, and users can opt out of using it.

We're going to introduce another solution (based on an overlayfs), which
is incompatible with using the factory, so we'll have a choice of three
mutually exclusive options.

Introduce that choice now with just the existing /var factory, and a new
option to opt out of it.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Romain Naour <romain.naour@smile.fr>
Cc : Jérémy Rosen <jeremy.rosen@smile.fr>
Acked-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 system/Config.in | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 24798dc068..c017d3797a 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -159,10 +159,16 @@ endchoice
 
 if BR2_INIT_SYSTEMD
 
-config BR2_INIT_SYSTEMD_VAR_FACTORY
-	bool "build a factory to populate a tmpfs on /var"
-	default y  # legacy
+choice
+	bool "/var management"
+	default BR2_INIT_SYSTEMD_VAR_FACTORY  # legacy
 	depends on !BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
+	help
+	  Select how Buildroot provides a read-write /var when the
+	  rootfs is not remounted read-write.
+
+config BR2_INIT_SYSTEMD_VAR_FACTORY
+	bool "build a factory to populate a tmpfs"
 	help
 	  Build a factory of the content of /var as installed by
 	  packages, mount a tmpfs on /var at runtime, so that
@@ -184,6 +190,16 @@ config BR2_INIT_SYSTEMD_VAR_FACTORY
 	  var.mount unit, that overrides the What and Type, and possibly
 	  the Options and After, fields.
 
+config BR2_INIT_SYSTEMD_VAR_NONE
+	bool "do nothing"
+	help
+	  Choose this if you have custom dispositions (like one or more
+	  of a post-build script, a fakeroot script, systemd units, an
+	  initramfs, or something else) that prepare /var to be writable
+	  on a read-only rootfs.
+
+endchoice
+
 config BR2_INIT_SYSTEMD_POPULATE_TMPFILES
 	bool "trigger systemd-tmpfiles during build"
 	default y  # legacy

--===============2350350118497516238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2350350118497516238==--
