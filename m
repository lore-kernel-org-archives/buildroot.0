Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91789C44501
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 600E680F47;
	Fri,  3 Jul 2026 14:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esjVZ5eV17Zf; Fri,  3 Jul 2026 14:26:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A55680A9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088816;
	bh=j9WAvKiLghYTd0Ts+Wfjzo2of2BlFfZGLD6h4tc4Dr4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TuaRNVnkRveX6F0KnW0tk0SZD7mQ20nXJ+Ovvh/eOQpnYlOesTEoiqIpk0jkoBziK
	 xx1pGacf3X21Z8CmWjFAdvbfVI6RULQMMx1JunhgOIba+H9KWzQxJpqBX7pitW0jjv
	 GPZF2mbRnjUt2Zn0CzVZhuLb4IOz3CLQd3/R/gOZlWqyGkIYx/0DqHEDp/XG30hIgM
	 i2FEHIQqbCvhJ+oa93JdW/NGGc7wrsMbhMaqWJ/BOkTXS+ezhwo8TmUiPv5RvsX3n+
	 oUOZ8GbLaMngsOcHtZ8md+BqKhez1MmJRQ21hk4Fjuy2f1eeJalO8wZ4FUZCVXiEgg
	 /mGGlKGy3LhnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A55680A9F;
	Fri,  3 Jul 2026 14:26:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE2E5363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACE6040420
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GEyQEKKIW4aR for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3B634059C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3B634059C
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 763EF883A3; Fri,  3 Jul 2026 14:26:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:48:53 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4f7f72e10ab8ddbe427620e75b0f99b6e0fb1a1f
X-Git-Newrev: 6b69a1f30eedd1f7afb044ef9150b86a5ed25be5
X-Patchwork-Hint: ignore
Message-Id: <20260703142615.763EF883A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/util-linux: fix
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6b69a1f30eedd1f7afb044ef9150b86a5ed25be5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
 package/util-linux/util-linux.mk                   |  1 +
 2 files changed, 60 insertions(+)

diff --git a/package/util-linux/0014-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch b/package/util-linux/0014-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch
new file mode 100644
index 0000000000..7195c223ac
--- /dev/null
+++ b/package/util-linux/0014-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch
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
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index cf75171e55..b5364b710b 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -37,6 +37,7 @@ UTIL_LINUX_CPE_ID_VENDOR = kernel
 UTIL_LINUX_AUTORECONF = YES
 
 # 0006-add-loopdev-fl-nofollow.patch
+# 0014-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch
 UTIL_LINUX_IGNORE_CVES += CVE-2026-27456
 
 # 0008-CVE-2025-14104-1.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
