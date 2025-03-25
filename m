Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DA5C36005
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 20:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA861406D7;
	Tue, 25 Mar 2025 20:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-kYI9n14KOw; Tue, 25 Mar 2025 20:41:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2CAD4063E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2CAD4063E;
	Tue, 25 Mar 2025 20:41:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F119B757
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 20:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D75624063E
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 20:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFl__BRZ_dus for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 20:41:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA4F740565
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA4F740565
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 20:41:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C713982DF6; Tue, 25 Mar 2025 20:41:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 25 Mar 2025 21:34:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 440e99e5799fae693d157e15d77b1118f6882a67
X-Git-Newrev: 22ffdea9e65056a4e1c5307963962e05b5b6f0dc
X-Patchwork-Hint: ignore
Message-Id: <20250325204146.C713982DF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tesseract-ocr: needs gcc >= 8
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=22ffdea9e65056a4e1c5307963962e05b5b6f0dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] tesseract-ocr fails to build with gcc 7,
with error:

    src/api/baseapi.cpp:67:10: fatal error: filesystem: No such file or directory
     #include <filesystem> // for std::filesystem
              ^~~~~~~~~~~~

In Buildroot, tesseract-ocr has a C++17 requirement captured as
gcc >= 7. Gcc 7 has only a partial and experimental C++17 support,
which was sufficient, prior [1].

The tesseract-ocr upstream commit [2] introduced a usage of
std::filesystem. This commit is included in version 5.5.0,
bumped in [1].

The C++17 with std::filesystem support was introduced in gcc 8.1.
See [3].

This commit fixes the issue by raising the gcc version requirement to
8.x.

Fixes: f32da8b9844ae5f1b9dc6b7a89d7d9bd9d194f55

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/f32da8b9844ae5f1b9dc6b7a89d7d9bd9d194f55
[2] https://github.com/tesseract-ocr/tesseract/commit/4e42f9de541f21acb010886925afe42094a15dfe
[3] https://gcc.gnu.org/gcc-8/changes.html#libstdcxx

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/tesseract-ocr/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tesseract-ocr/Config.in b/package/tesseract-ocr/Config.in
index 4d9b78733e..79a27780b2 100644
--- a/package/tesseract-ocr/Config.in
+++ b/package/tesseract-ocr/Config.in
@@ -1,13 +1,13 @@
-comment "tesseract-ocr needs a toolchain w/ threads, C++, gcc >= 7, dynamic library, wchar"
+comment "tesseract-ocr needs a toolchain w/ threads, C++, gcc >= 8, dynamic library, wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 menuconfig BR2_PACKAGE_TESSERACT_OCR
 	bool "tesseract-ocr"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
