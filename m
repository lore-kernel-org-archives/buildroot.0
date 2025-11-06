Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3C1CCFA13
	for <buildroot@archiver.kernel.org>; Thu,  6 Nov 2025 19:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43E3F4112E;
	Thu,  6 Nov 2025 19:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_ARS_O70Gzm; Thu,  6 Nov 2025 19:42:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ABD641131
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ABD641131;
	Thu,  6 Nov 2025 19:42:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 460CB1CD
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38395401E1
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A570olHIP3QM for <buildroot@buildroot.org>;
 Thu,  6 Nov 2025 19:42:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 598B0401DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 598B0401DA
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:42:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46E5C83EFD; Thu,  6 Nov 2025 19:42:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Nov 2025 20:37:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10bf2e6629827e338947c189e88ef5bf32ec4dda
X-Git-Newrev: 9d7a0d07cd18751749a0b2c325a8bbcf538e23ed
X-Patchwork-Hint: ignore
Message-Id: <20251106194255.46E5C83EFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnvme: fix build error
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9d7a0d07cd18751749a0b2c325a8bbcf538e23ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added upstream patch to fix build error caused by version bump to 1.16
by buildroot commit 12500fb060997a0c76daa72521615038c8514d25.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...reaking-cross-builds-with-OpenSSL-enabled.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/libnvme/0001-build-avoid-breaking-cross-builds-with-OpenSSL-enabled.patch b/package/libnvme/0001-build-avoid-breaking-cross-builds-with-OpenSSL-enabled.patch
new file mode 100644
index 0000000000..7cf91fd98e
--- /dev/null
+++ b/package/libnvme/0001-build-avoid-breaking-cross-builds-with-OpenSSL-enabled.patch
@@ -0,0 +1,31 @@
+From 82066e5f46d743e7a7cf396be7f95e577084b93e Mon Sep 17 00:00:00 2001
+From: Daniel Wagner <wagi@kernel.org>
+Date: Thu, 6 Nov 2025 08:10:27 +0100
+Subject: [PATCH] build: avoid breaking cross builds with OpenSSL enabled
+
+The OpenSSL sanity check wants to be executed, thus we should only try
+this if it's possible. Since this is just a warning, we can just skip it
+if it is not possible.
+
+Signed-off-by: Daniel Wagner <wagi@kernel.org>
+
+Upstream: https://github.com/linux-nvme/libnvme/pull/1090
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index dce5c68e..6d1f5204 100644
+--- a/meson.build
++++ b/meson.build
+@@ -252,7 +252,7 @@ else
+   conf.set('fallthrough', 'do {} while (0) /* fallthrough */')
+ endif
+ 
+-if openssl_dep.found()
++if openssl_dep.found() and meson.can_run_host_binaries()
+   if openssl_dep.type_name() != 'internal'
+     # Check for a bug in the EVP_PKEY_CTX_add1_hkdf_info implementation
+     res = cc.run(
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
