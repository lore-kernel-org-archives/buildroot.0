Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFA4CD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF65685649;
	Tue,  9 Jun 2026 13:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2yRAbXwAg8Gs; Tue,  9 Jun 2026 13:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF310857DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010154;
	bh=wFehaOBjYfz8CddhO0zJKvuARBaNnGS3ZVu//OKpx8E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RdJDRGxQh0gM3676NQFFtqa4GovypJiGxaMKGGYpxjBEiHc9SxR+rYtpmXu9ptUDc
	 Eb5IlntRc3acmmT4m/VcnIg9NONXW9hxp7Lj4124aIoj2UMo3MFm76GfwcfrDCTKS7
	 1G+cUjWCP3Yj1T+eOuksWLx823u3+SoJhkg4A8xMhxESvhyHnXx//vrqj1FfmA3XhA
	 mc8sZl601YjVlKrLUMbXzEEQd4XSPbReVDDXbG+QFdV2JT2I4LT+wYdHCGHJ1cwW38
	 zG2vteVK85JAq3+nNTsJzjFBHqGIZ6McFKcmdxT3dlp12dRCatGH56WO2bZq4PsIoa
	 hndGA6I0EcWtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF310857DF;
	Tue,  9 Jun 2026 13:02:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 127A6196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FE2F459F4
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EdQhYnMivEKX for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEF17411FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEF17411FA
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0598287E8D; Tue,  9 Jun 2026 13:01:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 May 2026 21:16:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 319eeda6fa83b5bd21b14dc795f407fc5495953d
X-Git-Newrev: 7bb6e399d9d32c4305475e5d7f68e3029f1b1d97
X-Patchwork-Hint: ignore
Message-Id: <20260609130117.0598287E8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libselinux: Adjust fstab during
 TARGET_FINALIZE
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7bb6e399d9d32c4305475e5d7f68e3029f1b1d97
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Doing so in the INSTALL_CMD makes the fstab adjustment subject to
overwrites by other packages during a per-package build.

Currently since per-package directories are populated using hardlinks
this adjustment propagates backwards into the skeleton package, but this
should not be relied upon.

Cc: Antoine Tenart <atenart@kernel.org>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libselinux/libselinux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index bcd130ac72..9a01b9cf94 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -72,9 +72,13 @@ define LIBSELINUX_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(LIBSELINUX_MAKE_OPTS) DESTDIR=$(TARGET_DIR) \
 		$(LIBSELINUX_MAKE_INSTALL_TARGETS)
+endef
+
+define LIBSELINUX_TARGET_ADD_FSTAB_ENTRY
 	if ! grep -q "selinuxfs" $(TARGET_DIR)/etc/fstab; then \
 		echo "none /sys/fs/selinux selinuxfs noauto 0 0" >> $(TARGET_DIR)/etc/fstab ; fi
 endef
+LIBSELINUX_TARGET_FINALIZE_HOOKS += LIBSELINUX_TARGET_ADD_FSTAB_ENTRY
 
 HOST_LIBSELINUX_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
