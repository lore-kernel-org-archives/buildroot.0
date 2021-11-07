Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC285C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:24:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 720BF60F0F
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 720BF60F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47D5140267;
	Sun,  7 Nov 2021 20:24:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NIsYYPqqaZ4I; Sun,  7 Nov 2021 20:24:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29FA64025C;
	Sun,  7 Nov 2021 20:24:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8504C1BF28A
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71FEF4025E
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Px91s6W42vfT for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 20:24:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 728B84024F
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 20:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9B38F8B4B1; Sun,  7 Nov 2021 20:20:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Nov 2021 21:20:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5850f263d9be318f52f20732bb6d48790b1e3ee
X-Git-Newrev: 95654305fc64306c3fee37e84c340e688891d59f
X-Patchwork-Hint: ignore
Message-Id: <20211107202017.9B38F8B4B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/softhsm2: needs threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=95654305fc64306c3fee37e84c340e688891d59f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

softhsm2 needs threads since the addition of the package in commit
53873b6daecd2a97740833cae7c5b4cdb185a6b2 to avoid the following build
failure:

osmutex.cpp:240:2: error: #error "There are no mutex implementations for your operating system yet"
  240 | #error "There are no mutex implementations for your operating system yet"
      |  ^~~~~

While at it, fix a typo in comment

Fixes:
 - http://autobuild.buildroot.org/results/40a8c2d9f58fbe490b6832754fdf8ac4ee0804fc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/softhsm2/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/softhsm2/Config.in b/package/softhsm2/Config.in
index 58f3e3086e..78fccc9512 100644
--- a/package/softhsm2/Config.in
+++ b/package/softhsm2/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SOFTHSM2
 	bool "softhsm2"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # dlopen()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
@@ -14,6 +15,7 @@ config BR2_PACKAGE_SOFTHSM2
 
 	  https://www.opendnssec.org/softhsm
 
-comment "sofhsm2 needs a toolchain w/ C++, gcc >= 4.8 and dynamic library support"
+comment "softhsm2 needs a toolchain w/ C++, threads, gcc >= 4.8 and dynamic library support"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
