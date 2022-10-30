Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602DFC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 14:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB30D812C1;
	Sun, 30 Oct 2022 14:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB30D812C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22X3HXJv6U9x; Sun, 30 Oct 2022 14:03:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E82F080F2C;
	Sun, 30 Oct 2022 14:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E82F080F2C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ABFA11BF489
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94DD1403A2
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94DD1403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WFdXkgaHTcpB for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 14:03:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C286440352
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C286440352
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE89F874AC; Sun, 30 Oct 2022 14:03:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 15:02:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b3f0153bb5accd1f543a43088a8cf792cda95fc
X-Git-Newrev: cd317f701b60ddbf546504bf3f8aca6b960e05af
X-Patchwork-Hint: ignore
Message-Id: <20221030140306.AE89F874AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kmemd: needs headers >= 5.14
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cd317f701b60ddbf546504bf3f8aca6b960e05af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kmemd unconditionally uses BPF_PSEUDO_MAP_IDX_VALUE which is only
available since kernel 5.14 and
https://github.com/torvalds/linux/commit/387544bfa291a22383d60b40f887360e2b931ec6
resulting in the following build failure since the addition of the
package in commit b3f915c6561bcb2f7952faca3bedf1766f299538:

kmem.c:36:17: error: 'BPF_PSEUDO_MAP_IDX_VALUE' undeclared here (not in a function); did you mean 'BPF_PSEUDO_MAP_VALUE'?
   36 |                 BPF_PSEUDO_MAP_IDX_VALUE, 0, _idx       \
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/dcd7e6321d64746b8b867fa3f32095d1180a40fc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kmemd/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmemd/Config.in b/package/kmemd/Config.in
index 902e636947..cd92757508 100644
--- a/package/kmemd/Config.in
+++ b/package/kmemd/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_KMEMD
 	depends on BR2_USE_WCHAR # libbpf
 	depends on !BR2_STATIC_LIBS # libbpf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libbpf
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13 # libbpf
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # libbpf
 	select BR2_PACKAGE_LIBBPF
 	help
@@ -12,7 +12,7 @@ config BR2_PACKAGE_KMEMD
 
 	  https://github.com/wkz/kmemd
 
-comment "kmemd needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.13"
+comment "kmemd needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 5.14"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
