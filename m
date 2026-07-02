Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F01C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A906B60B0B;
	Fri,  3 Jul 2026 14:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fIQJK2Y0NfEA; Fri,  3 Jul 2026 14:28:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D73F60BB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088916;
	bh=w4JYtcC1x331EPj+PsvoDUFTq7YBTdfKfxa6c6JUTNY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=No/v55YVRuXaoFB8PNfm4jR1zH3eEsbE1dmhmDGquJD7pnp8xbMJ2m9irXLQpgJWd
	 aEhN2sSgWHLvJqxImH6NcAm+C2mDCY0BFTcGBMiXr/szq0SM8Bs5z3LYSq0ej9CCA9
	 CV01jo4Nd72g9mo0nvbvDd0u77rmN+H8jtUiRGupdA6dlSkhrCks58pgtowHQTnfwT
	 jINo9Yi9CSKYl7r11zyrtshPKosE2sfhHWbjyCf4CkoNPLNhchVWsxWfp7VkjncNJV
	 HopC2626S1pR8EA5PlwdmHL+PSATgy/sFWxksqFDqtvEblkka1bpx+hMZTh7+qIHFZ
	 WnJ/N/UrvD67A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D73F60BB9;
	Fri,  3 Jul 2026 14:28:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D555B47E
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8ACF40EF6
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id frh4arIoa_S8 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:28:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA0D441181
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA0D441181
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C069883A2; Fri,  3 Jul 2026 14:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:36:15 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: c981779d2ab627dafc9e63f386e14b87fcff9cc0
X-Git-Newrev: cfe9d0e7cfaba645399990eaa5afa4041a8cd9c0
X-Patchwork-Hint: ignore
Message-Id: <20260703142758.5C069883A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/util-linux: fix
 CVE-2026-27456
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cfe9d0e7cfaba645399990eaa5afa4041a8cd9c0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

As mentioned here[1] we require patch[2] to fix CVE-2026-27456.

[1]: https://lore.kernel.org/util-linux/c2fo4x3lcppsj77k564i4qodmon3wagx47qf4mqwjwdtiplupg@jmaqrlzp273h/T/#u
[2]: https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?h=stable/v2.41&id=2dacaf3eea391e3bbf48e7d3ecce02cafe045b6d

Cc: Alexander Dahl <alex@netz39.de>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Fiona: add CVE trailer to patch file]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 9998130badb6101cdf6f6da0bbd1228d79825b63)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/package/util-linux/0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch b/package/util-linux/0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch
new file mode 100644
index 0000000000..7195c223ac
--- /dev/null
+++ b/package/util-linux/0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch
@@ -0,0 +1,59 @@
+From 2dacaf3eea391e3bbf48e7d3ecce02cafe045b6d Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Wed, 27 May 2026 15:15:22 +0200
+Subject: [PATCH] loopdev: use openat2(RESOLVE_NO_SYMLINKS) for backing file
+
+Use ul_open_no_symlinks() instead of open(O_NOFOLLOW) when
+LOOPDEV_FL_NOFOLLOW is set.  O_NOFOLLOW only rejects symlinks at the
+last path component, but TOCTOU attacks swap intermediate components.
+openat2(RESOLVE_NO_SYMLINKS) rejects symlinks at any component.
+
+Upstream: https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?h=stable/v2.41&id=2dacaf3eea391e3bbf48e7d3ecce02cafe045b6d
+CVE: CVE-2026-27456
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 119d23f1e3f55cf10e3c66dab80fc308c9f26456)
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+[Fiona: add CVE trailer]
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+---
+ lib/loopdev.c | 23 ++++++++++++++---------
+ 1 file changed, 14 insertions(+), 9 deletions(-)
+
+diff --git a/lib/loopdev.c b/lib/loopdev.c
+index 76685be70..31377fc9a 100644
+--- a/lib/loopdev.c
++++ b/lib/loopdev.c
+@@ -1412,16 +1412,21 @@ int loopcxt_setup_device(struct loopdev_cxt *lc)
+ 	if (lc->config.info.lo_flags & LO_FLAGS_DIRECT_IO)
+ 		flags |= O_DIRECT;
+ 	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
+-		flags |= O_NOFOLLOW;
+-
+-	if ((file_fd = open(lc->filename, mode | flags)) < 0) {
+-		if (mode != O_RDONLY && (errno == EROFS || errno == EACCES))
+-			file_fd = open(lc->filename, (mode = O_RDONLY) | flags);
++		file_fd = ul_open_no_symlinks(lc->filename, mode | flags, 0);
++	else
++		file_fd = open(lc->filename, mode | flags);
+ 
+-		if (file_fd < 0) {
+-			DBG(SETUP, ul_debugobj(lc, "open backing file failed: %m"));
+-			return -errno;
+-		}
++	if (file_fd < 0 && mode != O_RDONLY
++	    && (errno == EROFS || errno == EACCES)) {
++		mode = O_RDONLY;
++		if (lc->flags & LOOPDEV_FL_NOFOLLOW)
++			file_fd = ul_open_no_symlinks(lc->filename, mode | flags, 0);
++		else
++			file_fd = open(lc->filename, mode | flags);
++	}
++	if (file_fd < 0) {
++		DBG(SETUP, ul_debugobj(lc, "open backing file failed: %m"));
++		return -errno;
+ 	}
+ 	DBG(SETUP, ul_debugobj(lc, "backing file open: OK"));
+ 
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
