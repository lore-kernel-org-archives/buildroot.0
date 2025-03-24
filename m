Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D52C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 12:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EFA981272;
	Mon, 24 Mar 2025 12:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dNZ6lKaOiKLF; Mon, 24 Mar 2025 12:20:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 833C281244
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 833C281244;
	Mon, 24 Mar 2025 12:20:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8218AC0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 12:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6756640247
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 12:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2s5DRr45rUZB for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 12:20:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFEC540109
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFEC540109
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 12:20:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA860882D8; Mon, 24 Mar 2025 12:20:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 24 Mar 2025 11:25:28 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 4085ca3069e8a359f9855987e8d6eb2fc06bcbde
X-Git-Newrev: 5b357927f0ff96e5e550e0f61fc164f9e6e50caf
X-Patchwork-Hint: ignore
Message-Id: <20250324122026.BA860882D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/rauc: needs
 libopenssl, not libressl
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5b357927f0ff96e5e550e0f61fc164f9e6e50caf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Fixes http://autobuild.buildroot.net/results/6efc1275d3aac9f0a4c000f3d0911b5a880e495d/

Rauc uses X509_PURPOSE_get_by_id() since rauc-1.3 with commit 375dbb16dd94
("src/signature: add support for codesigning certificate purpose"):

../src/signature.c: In function 'signature_init':
../src/signature.c:97:13: warning: implicit declaration of function 'X509_PURPOSE_get_by_id'; did you mean 'X509_PURPOSE_get_id'? [-Wimplicit-function-declaration]
   97 |         if (X509_PURPOSE_get_by_id(id) >= 0) {

Which is not provided by LibreSSL:

nm -D target/usr/lib/libcrypto.so | grep X509_PURPOSE_
00000000001377b0 T X509_PURPOSE_get0
0000000000137850 T X509_PURPOSE_get0_name
0000000000137860 T X509_PURPOSE_get0_sname
00000000001377d0 T X509_PURPOSE_get_by_sname
00000000001377a0 T X509_PURPOSE_get_count
0000000000137840 T X509_PURPOSE_get_id

So force the use of libopenssl.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9679ddbcd066d562ffc8b8d46a571fd99fe7f275)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rauc/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rauc/Config.in b/package/rauc/Config.in
index af0b99c36b..8d0c0a4f2a 100644
--- a/package/rauc/Config.in
+++ b/package/rauc/Config.in
@@ -5,8 +5,9 @@ config BR2_PACKAGE_RAUC
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL # uses X509_PURPOSE_get_by_id
 	# uses ENGINE_* API
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES
 	select BR2_PACKAGE_SQUASHFS # run-time dependency
 	select BR2_PACKAGE_UBOOT_TOOLS if BR2_TARGET_UBOOT # run-time dependency
 	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV if BR2_TARGET_UBOOT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
