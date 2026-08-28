Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E20AC61DD3
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6597B80F78;
	Fri, 28 Aug 2026 14:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ErtQlYZ5IGyL; Fri, 28 Aug 2026 14:23:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927030;
	bh=/Nd0NLZDmbwf0OETgDREqKPI19zLFjbFzwjjgKiiXNY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=maMGLL8b9d/24fAypHCHTzF1U5uh+5s7AP6j5uBvalOexYVa3ASCarR2vkI4wrvfg
	 r5soSqXrUSWpd5bm1WvEpuj/2WxbME7SMhEe1XDErDzdYVPFP0ckLOTjKG2E99pDuN
	 MJJEZ4DN7NF9W7wywHVnQLQi9i3MLBtIWkDnHZCv9HHpTUub23ib/rEiYH4ufP9QMK
	 mEvtKaocwdFPLPBsYWhwxMu4Fy95HCJDSc2kcqXf9ApXVhMFw504DuZnF7hEmtMDg2
	 DChECNsAFW2btxGs3gF1pk/01Dd7VL/aErpVg29AnOhEuy4p4WvXD4l5niJwqPf5ML
	 1gOQOIVbfHmfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48ACF80F73;
	Fri, 28 Aug 2026 14:23:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C0C6D2D
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E18A6072C
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j35chIWFUugK for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80DB66072E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:23:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F798921FA; Fri, 28 Aug 2026 14:22:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:57:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 87b425ca6dab61fc8a202f8570c91a725d1cbebd
X-Git-Newrev: 0f853df25fd7908d263d7854990011e86e9cacaa
X-Patchwork-Hint: ignore
Message-Id: <20260828142241.7F798921FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libssh2: fix
 CVE-2026-66033
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
Content-Type: multipart/mixed; boundary="===============8017974866767740920=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8017974866767740920==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0f853df25fd7908d263d7854990011e86e9cacaa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Backport the fix for CVE-2026-66033.

The OpenSSL AES-GCM cipher path lacks runtime bounds checks around the
input block size. A malformed packet can therefore lead to an
out-of-bounds read or write.

Use Debian's libssh2 1.11.1 backport of the upstream fix.

Signed-off-by: Stefan Müller <stefan.mueller@rey-technology.com>
[Julien: add links to Debian patches]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6755a00cd23e52cee0085cf2a16f29042731bc0c)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .../0008-openssl-fix-AES-GCM-bounds-checks.patch   | 45 ++++++++++++++++++++++
 package/libssh2/libssh2.mk                         |  3 ++
 2 files changed, 48 insertions(+)

diff --git a/package/libssh2/0008-openssl-fix-AES-GCM-bounds-checks.patch b/package/libssh2/0008-openssl-fix-AES-GCM-bounds-checks.patch
new file mode 100644
index 0000000000..4d8eed0643
--- /dev/null
+++ b/package/libssh2/0008-openssl-fix-AES-GCM-bounds-checks.patch
@@ -0,0 +1,45 @@
+From a2ed82d40964bbc0d64cd717aa0a5a892117d2e6 Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Thu, 23 Jul 2026 10:32:04 +0200
+Subject: [PATCH] openssl: fix potential OOB read/write with AES-GCM in
+ `ssh2_cipher_crypt()`
+
+By applying two bounds checks to non-debug builds.
+
+Reported-by: Vladimir Eli Tokarev
+Fixes GHSA-c4f7-cvfc-33j7
+Follow-up to 3c953c05d67eb1ebcfd3316f279f12c4b1d600b4 #797
+
+Closes #2401
+Forwarded: not-needed
+
+CVE: CVE-2026-66033
+Upstream: https://sources.debian.org/patches/libssh2/1.11.1-6/CVE-2026-66033.patch/
+Upstream: https://github.com/libssh2/libssh2/commit/a2ed82d40964bbc0d64cd717aa0a5a892117d2e6
+Signed-off-by: Stefan Müller <stefan.mueller@rey-technology.com>
+---
+ src/openssl.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+--- a/src/openssl.c
++++ b/src/openssl.c
+@@ -1042,13 +1042,15 @@
+     const int aadlen = (is_aesgcm && IS_FIRST(firstlast)) ? 4 : 0;
+     /* size of AT, if present */
+     const int authenticationtag = IS_LAST(firstlast) ? authlen : 0;
+-    /* length to encrypt */
+-    const int cryptlen = (unsigned int)blocksize - aadlen - authenticationtag;
++    unsigned int cryptlen; /* length to encrypt */
+
+     (void)algo;
+
+-    assert(blocksize <= sizeof(buf));
+-    assert(cryptlen >= 0);
++    if(blocksize > sizeof(buf) ||
++       blocksize < (size_t)(aadlen + authenticationtag))
++        return 1;
++
++    cryptlen = (unsigned int)blocksize - aadlen - authenticationtag;
+
+ #if LIBSSH2_AES_GCM
+     /* First block */
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 583ed56c1c..a3c0b6a67f 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -30,6 +30,9 @@ LIBSSH2_IGNORE_CVES += CVE-2025-15661
 # 0007-sftp-prevent-dangling-pointer-after-free.patch
 LIBSSH2_IGNORE_CVES += CVE-2026-66032
 
+# 0008-openssl-fix-AES-GCM-bounds-checks.patch
+LIBSSH2_IGNORE_CVES += CVE-2026-66033
+
 ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
 LIBSSH2_DEPENDENCIES += mbedtls
 LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \

--===============8017974866767740920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8017974866767740920==--
