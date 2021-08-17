Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3156C4320E
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:27:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A07FF60E93
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A07FF60E93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BB514272F;
	Thu, 26 Aug 2021 22:27:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rXq996jHMd_s; Thu, 26 Aug 2021 22:27:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C384142736;
	Thu, 26 Aug 2021 22:27:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 445EF1BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7D19407A1
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EiFaB2xK_TQv for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C2074071D
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A091F8DC52; Thu, 26 Aug 2021 22:01:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 21:49:04 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 93351fa0b3b8b6dd10faa9a15a7a173b92cb40a0
X-Git-Newrev: 3145adfb69ba5332be802fab17f12694ce85d329
X-Patchwork-Hint: ignore
Message-Id: <20210826220130.A091F8DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libbpf: needs headers
 >= 4.13
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=3145adfb69ba5332be802fab17f12694ce85d329
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since its addition in commit f7b8508e4fe9c96bf679cc5423cc1500b6523e83,
libbpf unconditionally uses TCA_BPF_ID which is only available since
kernel 4.13 and
https://github.com/torvalds/linux/commit/e86283071fb0eed28136adb52997888f4beb202b:

netlink.c: In function '__get_tc_info':
netlink.c:515:11: error: 'TCA_BPF_ID' undeclared (first use in this function); did you mean 'TCA_BPF_FD'?
  515 |  if (!tbb[TCA_BPF_ID])
      |           ^~~~~~~~~~
      |           TCA_BPF_FD

Fixes:
 - http://autobuild.buildroot.org/results/14996a0b7b9b65d0d6d5717d6da8922752789749

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libbpf/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libbpf/Config.in b/package/libbpf/Config.in
index 9eadf0254a..3aa6679b3a 100644
--- a/package/libbpf/Config.in
+++ b/package/libbpf/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_LIBBPF
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_ZLIB
@@ -24,8 +25,9 @@ config BR2_PACKAGE_LIBBPF
 
 	  https://github.com/libbpf/libbpf
 
-comment "libbpf needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
+comment "libbpf needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.13"
 	depends on BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13 \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
