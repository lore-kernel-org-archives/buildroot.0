Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857C8C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30D95817D3;
	Sun,  6 Feb 2022 10:27:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QpytJHYc_acn; Sun,  6 Feb 2022 10:27:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84E2E8142E;
	Sun,  6 Feb 2022 10:27:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 513951BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F74060B6A
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:27:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B0_FQqhDfeaO for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:27:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A0856059E
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:27:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 745438276A; Sun,  6 Feb 2022 10:20:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 11:27:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ca3b660f4d75f1746508fc7cdee74daa14250a1
X-Git-Newrev: 6647ee8ee6e35a17f9154ece4903b09fb5a3014c
X-Patchwork-Hint: ignore
Message-Id: <20220206102014.745438276A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuhttpd: needs MMU
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

commit: https://git.buildroot.net/buildroot/commit/?id=6647ee8ee6e35a17f9154ece4903b09fb5a3014c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libuhttpd needs MMU since version 3.13.0 and
https://github.com/zhaojh329/libuhttpd/commit/ffdf7de3a4a1f5a62aa3814ac96e889958a30840
to avoid the following build failure raised since commit
61797c52f5deef2cb67e60cf075ca243078c8855:

/home/buildroot/autobuild/instance-0/output-1/build/libuhttpd-3.14.1/src/cgi.c: In function 'create_cgi':
/home/buildroot/autobuild/instance-0/output-1/build/libuhttpd-3.14.1/src/cgi.c:321:11: error: implicit declaration of function 'fork' [-Werror=implicit-function-declaration]
  321 |     pid = fork();
      |           ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/8d2a79dacf9ac423f7ece51b8c23f3683238312b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libuhttpd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libuhttpd/Config.in b/package/libuhttpd/Config.in
index 9159341d89..52bbd313bc 100644
--- a/package/libuhttpd/Config.in
+++ b/package/libuhttpd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBUHTTPD
 	bool "libuhttpd"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBEV
 	select BR2_PACKAGE_WOLFSSL_ALL if BR2_PACKAGE_WOLFSSL
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
