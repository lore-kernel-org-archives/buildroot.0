Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFC1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 18:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FAC182422;
	Thu, 21 Apr 2022 18:04:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RFUQUmoo4hTm; Thu, 21 Apr 2022 18:04:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB10A81C21;
	Thu, 21 Apr 2022 18:04:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 099521BF406
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A32982FAE
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P2SF5Hbs6x-N for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 785D183E27
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7C47983FB8; Thu, 21 Apr 2022 17:50:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 19:32:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30cbb1e21716b205d1bbd5fc23d53a3f83773f22
X-Git-Newrev: 84fe47d008d44cf0ec22885406d5644cdfbf072c
X-Patchwork-Hint: ignore
Message-Id: <20220421175056.7C47983FB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbpf: needs __sync_*_4 intrisics
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=84fe47d008d44cf0ec22885406d5644cdfbf072c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libbpf needs __sync_*_4 intrisics since bump to version 0.7.0 in commit
4b1003855b02f6d9c77de634c9d0f636470e7388 and
https://github.com/libbpf/libbpf/commit/b0c3d7133faa55fbcbc19f76f9cc9e183e178c97

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libbpf/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libbpf/Config.in b/package/libbpf/Config.in
index 3aa6679b3a..b3d6e44c6a 100644
--- a/package/libbpf/Config.in
+++ b/package/libbpf/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
 config BR2_PACKAGE_LIBBPF
 	bool "libbpf"
 	depends on BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
@@ -27,6 +28,7 @@ config BR2_PACKAGE_LIBBPF
 
 comment "libbpf needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.13"
 	depends on BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
