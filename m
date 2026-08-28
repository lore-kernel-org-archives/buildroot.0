Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E067C61DD3
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06A446073A;
	Fri, 28 Aug 2026 14:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tP9u0V9-sDWk; Fri, 28 Aug 2026 14:26:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927187;
	bh=aJiXY4FxecYN7YVme1sri2qF+6HYlqTf+8N113MHgd4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=su0xezOydt/idc5fPoQQb/1wUJj9/XtIvhdgw9jr8+Rz+M4uJ3gCOQ+BGIwqXJEdI
	 zZetwZhinAdLRpwDmlWO8AVuBBFCO370Ele5XvPk74F+RifgxQqBgff4U4ydekUJke
	 M6EFajV8E/J8WKHaoAR7fCIhE0Ido1sceIKUY9Vb3BIKNAooGeSKXnY+KyH4p9Jwkw
	 pxEB1myyWGiY3niaxaErcb66ChnQ1h3NP7sysOsWHsv1+u0ti1InjRCUW3U6ka02Ac
	 +v/Zw/FUEd+OK5qtxnxpQJcMXChBpgxJwOf/fBMyvEpWHVdjIZ2/vf6/IXtZDKIAHA
	 RAF03ZsLcXJEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E2FF60825;
	Fri, 28 Aug 2026 14:26:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD06C386
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEBE280ED0
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5fACLneTU-H6 for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6C9580F5D
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5167921FA; Fri, 28 Aug 2026 14:24:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:05 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 7d1c8b992f2dc44237a9599e7fe01e03ae83ca2e
X-Git-Newrev: 018c7b9108fb136c4ca8f93ed3c8abe3c506eb83
X-Patchwork-Hint: ignore
Message-Id: <20260828142442.B5167921FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libssh2: fix
 CVE-2026-66035
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
Content-Type: multipart/mixed; boundary="===============4204081487259258800=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4204081487259258800==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/018c7b9108fb136c4ca8f93ed3c8abe3c506eb83
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Backport the fix for CVE-2026-66035.

The ETM decrypt path does not validate the received packet length before
calculating the decrypt buffer size. A malformed packet can therefore
lead to a heap overflow.

Use Debian's libssh2 1.11.1 backport of the upstream fix.

Signed-off-by: Stefan Müller <stefan.mueller@rey-technology.com>
[Julien: add links to Debian patches]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 03757abfce3d5ad17e8c1b3a4f1e2e19634648fa)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...ix-potential-heap-overflow-on-ETM-decrypt.patch | 42 ++++++++++++++++++++++
 package/libssh2/libssh2.mk                         |  3 ++
 2 files changed, 45 insertions(+)

diff --git a/package/libssh2/0010-transport-fix-potential-heap-overflow-on-ETM-decrypt.patch b/package/libssh2/0010-transport-fix-potential-heap-overflow-on-ETM-decrypt.patch
new file mode 100644
index 0000000000..18e9ec5329
--- /dev/null
+++ b/package/libssh2/0010-transport-fix-potential-heap-overflow-on-ETM-decrypt.patch
@@ -0,0 +1,42 @@
+From 42e33d81577ed4b95d4b4f6f845e5ee8efe5eeb4 Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Fri, 3 Jul 2026 18:22:55 +0200
+Subject: [PATCH] transport: fix potential heap overflow on ETM decrypt
+
+Reported-by: Vladimir Eli Tokarev
+Fixes GHSA-6c79-444r-wx26
+
+Closes #2198
+Forwarded: not-needed
+
+CVE: CVE-2026-66035
+Upstream: https://sources.debian.org/patches/libssh2/1.11.1-6/CVE-2026-66035.patch/
+Upstream: https://github.com/libssh2/libssh2/commit/42e33d81577ed4b95d4b4f6f845e5ee8efe5eeb4
+Signed-off-by: Stefan Müller <stefan.mueller@rey-technology.com>
+---
+ src/transport.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+--- a/src/transport.c
++++ b/src/transport.c
+@@ -242,6 +242,12 @@
+                 unsigned char *decrypt_buffer;
+                 int blocksize = session->remote.crypt->blocksize;
+
++                if(p->total_num < mac_len + 4 + (size_t)blocksize) {
++                    LIBSSH2_FREE(session, p->payload);
++                    return LIBSSH2_ERROR_DECRYPT;
++                }
++                decrypt_size = (ssize_t)(p->total_num - mac_len - 4);
++
+                 rc = decrypt(session, p->payload + 4,
+                              first_block, blocksize, FIRST_BLOCK);
+                 if(rc) {
+@@ -249,7 +255,6 @@
+                 }
+
+                 /* we need buffer for decrypt */
+-                decrypt_size = p->total_num - mac_len - 4;
+                 decrypt_buffer = LIBSSH2_ALLOC(session, decrypt_size);
+                 if(!decrypt_buffer) {
+                     return LIBSSH2_ERROR_ALLOC;
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 4a4491f0f1..7715b0bc0a 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -36,6 +36,9 @@ LIBSSH2_IGNORE_CVES += CVE-2026-66033
 # 0009-publickey-fix-potential-OOB-read.patch
 LIBSSH2_IGNORE_CVES += CVE-2026-66034
 
+# 0010-transport-fix-potential-heap-overflow-on-ETM-decrypt.patch
+LIBSSH2_IGNORE_CVES += CVE-2026-66035
+
 ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
 LIBSSH2_DEPENDENCIES += mbedtls
 LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \

--===============4204081487259258800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4204081487259258800==--
