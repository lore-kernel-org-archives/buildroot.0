Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF78CD37B2
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 15:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7A0583DC1;
	Mon, 11 May 2026 15:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAG5b3Q7ZBiv; Mon, 11 May 2026 15:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB0AC83DD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778513626;
	bh=izW4HKHnMPQt9V1ILzCUIq7BRNZT1on9bKDlomd9TbA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cccY9v6wL8BlfUSeccLAvJi3iQJ8HcR1y8lBX8rzLNFc7U6uPWyrRs/Hg608nfH1K
	 N2Gr9AI20EjxsfYvfrtKuVXAhAAiODZh2fL+Uo9Qq5uIEUlUBpiuhSYsBUeUMeG3uX
	 ptu1FsCx0Jhxc3lDFbeZ3dNLvDKhNdUAjvzC54d6Elenxh2FcTMAU9ahZXGOwpGsJv
	 MjiQ4Ag+m55n/vhPZhPH+nhku+/971oeuhhX4ejGh0NIi+mRNk3N0LF1Q+xZxyGTv6
	 IAdjP3IABPa0j6heU3G9brtNCFdWbCWiLc/3FtK0marSntB/HNrSmxez4dJAznt6ha
	 Y+fbjA3jdPypw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB0AC83DD2;
	Mon, 11 May 2026 15:33:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EBD9272
 for <buildroot@buildroot.org>; Mon, 11 May 2026 15:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 200F8403C8
 for <buildroot@buildroot.org>; Mon, 11 May 2026 15:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hno4iuyJOQPe for <buildroot@buildroot.org>;
 Mon, 11 May 2026 15:33:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD8A3403C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD8A3403C0
 for <buildroot@buildroot.org>; Mon, 11 May 2026 15:33:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 183DF85E0D; Mon, 11 May 2026 15:33:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 17:31:19 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bb46c259f480dd68ec4ebc06714ed539dcf27b02
X-Git-Newrev: dd20ff11b84a9d2cd75170b7636f8019dd701db2
X-Patchwork-Hint: ignore
Message-Id: <20260511153340.183DF85E0D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/util-linux: fix
 loopdev nofollow patch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dd20ff11b84a9d2cd75170b7636f8019dd701db2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

eeb65cf0f6753da6bc53197b971aec12ba647026 manually backported upstream
util-linux security fix (util-linux: 5e390467b26a3cf3fecc04e1a0d482dff3162fc4)
but didn't account for ul_canonicalize_path being named just canonicalize_path
in 2.40.x. Use the upstream backported patch from the 2.40.x maintenance
branch instead.

Can be reproduced with the following defconfig:

BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_PACKAGE_UTIL_LINUX_LOSETUP=y

Fixes: eeb65cf0f6753da6bc53197b971aec12ba647026

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[thomas: added defconfig]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/util-linux/0006-add-loopdev-fl-nofollow.patch | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/util-linux/0006-add-loopdev-fl-nofollow.patch b/package/util-linux/0006-add-loopdev-fl-nofollow.patch
index 21b1e2596c..15e92fa61e 100644
--- a/package/util-linux/0006-add-loopdev-fl-nofollow.patch
+++ b/package/util-linux/0006-add-loopdev-fl-nofollow.patch
@@ -1,4 +1,4 @@
-From 5e390467b26a3cf3fecc04e1a0d482dff3162fc4 Mon Sep 17 00:00:00 2001
+From 0000ca30646d03f9dfbab9f62a5ce21a939c1018 Mon Sep 17 00:00:00 2001
 From: Karel Zak <kzak@redhat.com>
 Date: Thu, 19 Feb 2026 13:59:46 +0100
 Subject: [PATCH] loopdev: add LOOPDEV_FL_NOFOLLOW to prevent symlink attacks
@@ -47,9 +47,8 @@ Addresses: https://github.com/util-linux/util-linux/security/advisories/GHSA-qq4
 Signed-off-by: Karel Zak <kzak@redhat.com>
 
 CVE: CVE-2026-27456
-Upstream: https://github.com/util-linux/util-linux/commit/5e390467b26a3cf3fecc04e1a0d482dff3162fc4
-[Titouan: Adapt patch to apply cleanly onto util-linux 2.40]
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+Upstream: https://github.com/util-linux/util-linux/commit/0000ca30646d03f9dfbab9f62a5ce21a939c1018
+Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
 ---
  include/loopdev.h           | 3 ++-
  lib/loopdev.c               | 7 ++++++-
@@ -57,7 +56,7 @@ Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
  3 files changed, 10 insertions(+), 3 deletions(-)
 
 diff --git a/include/loopdev.h b/include/loopdev.h
-index d10bf7f37..0f85dd254 100644
+index d10bf7f3765..0f85dd25456 100644
 --- a/include/loopdev.h
 +++ b/include/loopdev.h
 @@ -139,7 +139,8 @@ enum {
@@ -71,7 +70,7 @@ index d10bf7f37..0f85dd254 100644
  
  /*
 diff --git a/lib/loopdev.c b/lib/loopdev.c
-index c72fb2c40..3d2274693 100644
+index c72fb2c404b..28fb489e402 100644
 --- a/lib/loopdev.c
 +++ b/lib/loopdev.c
 @@ -1267,7 +1267,10 @@ int loopcxt_set_backing_file(struct loopdev_cxt *lc, const char *filename)
@@ -82,7 +81,7 @@ index c72fb2c40..3d2274693 100644
 +	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
 +		lc->filename = strdup(filename);
 +	else
-+		lc->filename = ul_canonicalize_path(filename);
++		lc->filename = canonicalize_path(filename);
  	if (!lc->filename)
  		return -errno;
  
@@ -96,7 +95,7 @@ index c72fb2c40..3d2274693 100644
  	if ((file_fd = open(lc->filename, mode | flags)) < 0) {
  		if (mode != O_RDONLY && (errno == EROFS || errno == EACCES))
 diff --git a/libmount/src/hook_loopdev.c b/libmount/src/hook_loopdev.c
-index 597b9339a..4df1915a6 100644
+index 597b9339ac0..4df1915a619 100644
 --- a/libmount/src/hook_loopdev.c
 +++ b/libmount/src/hook_loopdev.c
 @@ -272,7 +272,8 @@ static int setup_loopdev(struct libmnt_context *cxt,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
