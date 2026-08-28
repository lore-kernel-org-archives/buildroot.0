Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8CDC61DBD
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E80981046;
	Fri, 28 Aug 2026 14:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b7T7GP9mekw2; Fri, 28 Aug 2026 14:24:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927048;
	bh=onnkJSfvNTtsGo9scg7sVSKADHbwshSkLv0WhVtD1yo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pbGPNoyCWPo8CdMMeSokCXPp4LFkvHSEQg+c7HHuVqS5EwqRBmO9tUweTlM/RMnx3
	 TD1crqd0RP+7WadungSdo1jnbn64pt528aP3hcm8JAugHADkLq2vMs87gKEydOmQze
	 tkF3iIQge0HAaNDiUZYChCPBb0UjyYU65wG5UP6yS/6N4l/4ZCaUEBiIyov1dGEBeL
	 Ucci7GPfhBxol/YNAslduZ1LWZdnMIn8v5ukA4neDrUURmVCajp7LZT2+PDwFNLv+J
	 lRimvBBAskaUAOjIv6WKq/eZOANaAyPWnOf/5Qtq95C8MLVkrEUA9LjLQjuY0iV3hU
	 eigED9fDHKksw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02EB98100D;
	Fri, 28 Aug 2026 14:24:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C492386
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E62C407BA
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1cUNvWt0mOB for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 763AC4081C
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 748DA921F9; Fri, 28 Aug 2026 14:22:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:57:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 33289483492e7b87f22ae76d7f9440895e85c0e3
X-Git-Newrev: 87b425ca6dab61fc8a202f8570c91a725d1cbebd
X-Patchwork-Hint: ignore
Message-Id: <20260828142241.748DA921F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libssh2: fix
 CVE-2026-66032
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4327121918711311797=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4327121918711311797==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/87b425ca6dab61fc8a202f8570c91a725d1cbebd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Backport the fix for CVE-2026-66032.

A SFTP error path can leave a dangling pointer after freeing the
response buffer, which may result in a double free on subsequent error
handling.

Use Debian's libssh2 1.11.1 backport of the upstream fix.

Signed-off-by: Stefan Müller <stefan.mueller@rey-technology.com>
[Julien: add links to Debian patches]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 05c13e87e983705ef65c18979a5d1bb7b50438a2)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...-sftp-prevent-dangling-pointer-after-free.patch | 29 ++++++++++++++++++++++
 package/libssh2/libssh2.mk                         |  3 +++
 2 files changed, 32 insertions(+)

diff --git a/package/libssh2/0007-sftp-prevent-dangling-pointer-after-free.patch b/package/libssh2/0007-sftp-prevent-dangling-pointer-after-free.patch
new file mode 100644
index 0000000000..3658c00e0d
--- /dev/null
+++ b/package/libssh2/0007-sftp-prevent-dangling-pointer-after-free.patch
@@ -0,0 +1,29 @@
+From 5e4776146552d898b9c0e1b313cd093fa8dc92d0 Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Thu, 2 Jul 2026 11:00:23 -0700
+Subject: [PATCH] Prevent dangling pointer by nullifying data (#2180)
+
+Set data to NULL after freeing it to avoid dangling pointer. fixes
+GHSA-px3w-7g75-hg7w.
+
+Credit: VladimirEliTokarev
+Forwarded: not-needed
+
+CVE: CVE-2026-66032
+Upstream: https://sources.debian.org/patches/libssh2/1.11.1-6/CVE-2026-66032.patch/
+Upstream: https://github.com/libssh2/libssh2/commit/5e4776146552d898b9c0e1b313cd093fa8dc92d0
+Signed-off-by: Stefan Müller <stefan.mueller@rey-technology.com>
+---
+ src/sftp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+--- a/src/sftp.c
++++ b/src/sftp.c
+@@ -1279,6 +1279,7 @@
+                                "got HANDLE FXOK"));
+
+                 LIBSSH2_FREE(session, data);
++                data = NULL;
+
+                 /* silly situation, but check for a HANDLE */
+                 rc = sftp_packet_require(sftp, SSH_FXP_HANDLE,
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 6b2d774b38..583ed56c1c 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -27,6 +27,9 @@ LIBSSH2_IGNORE_CVES += CVE-2026-55200
 # 0006-sftp-symlink-fix-SSH_FXP_STATUS-response.patch
 LIBSSH2_IGNORE_CVES += CVE-2025-15661
 
+# 0007-sftp-prevent-dangling-pointer-after-free.patch
+LIBSSH2_IGNORE_CVES += CVE-2026-66032
+
 ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
 LIBSSH2_DEPENDENCIES += mbedtls
 LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \

--===============4327121918711311797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4327121918711311797==--
