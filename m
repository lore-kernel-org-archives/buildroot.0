Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6ADBD597A2
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 20:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E08040324;
	Tue, 12 Nov 2024 20:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7T9PL7RX72L; Tue, 12 Nov 2024 20:16:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C93540302
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C93540302;
	Tue, 12 Nov 2024 20:16:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7670FDB1
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 20:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 647FB6076C
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 20:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWTEaFUWFXFm for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 20:16:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C01160673
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C01160673
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 20:16:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74A7986185; Tue, 12 Nov 2024 20:16:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Nov 2024 21:05:46 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f93225071a9267f4b0a90206fe6d8c581cc07a35
X-Git-Newrev: ceff4b7dc4e7048a4175ede7ffa1631b9f91ed18
X-Patchwork-Hint: ignore
Message-Id: <20241112201650.74A7986185@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/ltrace: mark as
 unavailable on musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=ceff4b7dc4e7048a4175ede7ffa1631b9f91ed18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Commit bf9583a50276f52edbc37d9f85df5f2cc7fdb5dc enabled elfutils on
musl, as well as all its reverse dependencies, including ltrace. Turns
out that even with elfutils fixed, ltrace doesn't build on musl.

Fabrice proposed a patch to fix it, at:

  https://patchwork.ozlabs.org/project/buildroot/patch/20231104155857.110364-1-fontaine.fabrice@gmail.com/

but ltrace has no active upstream, and some aspects of the patch don't
look correct. So err on the safe side and make ltrace unavailable for
musl configurations.

Fixes:

  http://autobuild.buildroot.org/results/a3a5c46e8562d3f091a9b4b205322168fbf9d16b

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 859bd545821a838454577c4c1c9106837cda51cb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltrace/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 21d381db70..2dc969c4f1 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_LTRACE
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_LTRACE_ARCH_SUPPORTS
 	select BR2_PACKAGE_ELFUTILS
 	help
@@ -25,7 +26,8 @@ config BR2_PACKAGE_LTRACE
 
 	  http://ltrace.org
 
-comment "ltrace needs a toolchain w/ wchar, dynamic library, threads"
+comment "ltrace needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
 	depends on BR2_PACKAGE_LTRACE_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
