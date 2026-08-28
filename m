Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2303C61DD9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B557811B8;
	Fri, 28 Aug 2026 14:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sY49FBguR79U; Fri, 28 Aug 2026 14:26:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927171;
	bh=PQQG2FahI6pBrejx4zBk+nueDsHtLFcFXIlb9RfUclI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HA05Hemr1Y2tolBTouV2BL4NIM7k5Qt3HH0wiHXE9kp26v6dLtq+2+lZUWSw3jhSX
	 vAsfKvtBphv8TkTyPMvuyU6MALsZ78nDZHv3eGDooICSv+En1erxb90xzjeWoMl4DG
	 vDmYP0tZ0Vskvc1Hk9Gzlz6QYHirvVfow0vvXrfq3y3Ur8f5lngDDs52tAWl6Kt7wF
	 WQNb8oIOSDruz4E6tue+7mYmwQkwHkDMjndaqPIuguktbGp+WBAMdmvpN1ohD54t1o
	 1hbYJFantwkIyUGSXIsVrigBzNQdxZIMBaPytSVVpOCYefEZFnCuzmt8GU+SQ2DXyo
	 wVwMreBQEvYFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25C0E8118C;
	Fri, 28 Aug 2026 14:26:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 726D4D2A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 584D36082A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JHPsqPUZT8FT for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD48C607EC
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABBEC921F9; Fri, 28 Aug 2026 14:24:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 24f10b7bd83c25d6699d8853e1974dcf3bf172fb
X-Git-Newrev: 7d1c8b992f2dc44237a9599e7fe01e03ae83ca2e
X-Patchwork-Hint: ignore
Message-Id: <20260828142442.ABBEC921F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libssh2: fix
 CVE-2026-66034
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
Content-Type: multipart/mixed; boundary="===============0219822751537390938=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0219822751537390938==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7d1c8b992f2dc44237a9599e7fe01e03ae83ca2e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Backport the fix for CVE-2026-66034.

The publickey subsystem does not sufficiently validate the length of a
server-controlled comment field. A malformed response can therefore
cause an out-of-bounds read.

Use Debian's libssh2 1.11.1 backport of the upstream fix.

Signed-off-by: Stefan Müller <stefan.mueller@rey-technology.com>
[Julien: add links to Debian patches]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 58581deeca7768271056e9a1461362a2a698105b)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .../0009-publickey-fix-potential-OOB-read.patch    | 36 ++++++++++++++++++++++
 package/libssh2/libssh2.mk                         |  3 ++
 2 files changed, 39 insertions(+)

diff --git a/package/libssh2/0009-publickey-fix-potential-OOB-read.patch b/package/libssh2/0009-publickey-fix-potential-OOB-read.patch
new file mode 100644
index 0000000000..91cd42f640
--- /dev/null
+++ b/package/libssh2/0009-publickey-fix-potential-OOB-read.patch
@@ -0,0 +1,36 @@
+From a13bb6c773f0d55ad1628cede57e99803cd898d9 Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Sat, 4 Jul 2026 11:19:49 +0200
+Subject: [PATCH] publickey: fix potential OOB read in
+ `libssh2_publickey_list_fetch()`
+
+Reported-by: Vladimir Eli Tokarev
+Fixes GHSA-w6g9-cpfp-22gc
+
+Closes #2202
+Forwarded: not-needed
+
+CVE: CVE-2026-66034
+Upstream: https://sources.debian.org/patches/libssh2/1.11.1-6/CVE-2026-66034.patch/
+Upstream: https://github.com/libssh2/libssh2/commit/a13bb6c773f0d55ad1628cede57e99803cd898d9
+Signed-off-by: Stefan Müller <stefan.mueller@rey-technology.com>
+---
+ src/publickey.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+--- a/src/publickey.c
++++ b/src/publickey.c
+@@ -988,6 +988,13 @@
+                 }
+
+                 if(comment_len) {
++                    if(pkey->listFetch_s + comment_len >
++                       pkey->listFetch_data + pkey->listFetch_data_len) {
++                        _libssh2_error(session, LIBSSH2_ERROR_BUFFER_TOO_SMALL,
++                                 "ListFetch data too short");
++                        goto err_exit;
++                    }
++
+                     list[keys].num_attrs = 1;
+                     list[keys].attrs =
+                         LIBSSH2_ALLOC(session,
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index a3c0b6a67f..4a4491f0f1 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -33,6 +33,9 @@ LIBSSH2_IGNORE_CVES += CVE-2026-66032
 # 0008-openssl-fix-AES-GCM-bounds-checks.patch
 LIBSSH2_IGNORE_CVES += CVE-2026-66033
 
+# 0009-publickey-fix-potential-OOB-read.patch
+LIBSSH2_IGNORE_CVES += CVE-2026-66034
+
 ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
 LIBSSH2_DEPENDENCIES += mbedtls
 LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \

--===============0219822751537390938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0219822751537390938==--
