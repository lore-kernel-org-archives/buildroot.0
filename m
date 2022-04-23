Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D22C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 14:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74E2C41578;
	Sat, 23 Apr 2022 14:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id En9G3TKZEkeS; Sat, 23 Apr 2022 14:00:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8583A414CC;
	Sat, 23 Apr 2022 14:00:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D77F51BF307
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 14:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3F41403F7
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 14:00:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3_wfjiRkBcOI for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 14:00:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3FCD400F8
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 14:00:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D5A8A83D1F; Sat, 23 Apr 2022 13:50:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 16:00:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 908caefa91dbf70e7f40c61113f0f1ae2b83230d
X-Git-Newrev: 4e6163a1d88a70c647a27a1ba3a4ed29b076eefa
X-Patchwork-Hint: ignore
Message-Id: <20220423135037.D5A8A83D1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: lsfd needs headers >=
 3.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e6163a1d88a70c647a27a1ba3a4ed29b076eefa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lsfd depends on kcmp.h which is only exported since kernel 3.19 and
https://github.com/torvalds/linux/commit/3f4994cfc15f38a3159c6e3a4b3ab2e1481a6b02
resulting in the following build failure since bump to version 2.38 in
commit ee978e853a6a4c9bb5ed661c1ae704e79f155a35:

configure: error: lsfd selected, but required linux/kcmp.h header file not available

Fixes:
 - http://autobuild.buildroot.org/results/555c272fe0f966f7f46d493236cb6dabeca24d9b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/util-linux/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index d3c0070160..917f1bc2b4 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -206,10 +206,15 @@ config BR2_PACKAGE_UTIL_LINUX_LOSETUP
 config BR2_PACKAGE_UTIL_LINUX_LSFD
 	bool "lsfd"
 	depends on BR2_USE_MMU # libsmartcols
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	help
 	  List file descriptors (modern replacement for lsof)
 
+comment "lsfd needs a toolchain w/ headers >= 3.19"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
+
 config BR2_PACKAGE_UTIL_LINUX_LSLOGINS
 	bool "lslogins"
 	depends on BR2_USE_MMU # libsmartcols
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
