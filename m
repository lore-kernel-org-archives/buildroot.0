Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196ECC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85AB640A15;
	Sun, 17 Jul 2022 13:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85AB640A15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FxH98iGl5KW1; Sun, 17 Jul 2022 13:59:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75B1040412;
	Sun, 17 Jul 2022 13:59:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75B1040412
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A48CB1BF228
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C820414C4
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C820414C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BW5XOkyapNYX for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:59:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CF7940977
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:59:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CF7940977
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 24AFB83C06; Sun, 17 Jul 2022 13:46:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 15:59:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16a8c68b2103e36c491712e4697b945a6684874f
X-Git-Newrev: 519b5ade92c80e3aaaa5cc5ac7e3bd34091aeae8
X-Patchwork-Hint: ignore
Message-Id: <20220717134618.24AFB83C06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tcpreplay: select musl-fts if
 needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=519b5ade92c80e3aaaa5cc5ac7e3bd34091aeae8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since commit
4138151e447e69771e2579ea5a3daa89c56d41a8:

Makefile:576: *** musl-fts is in the dependency chain of tcpreplay that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/629aabd00cebcad980bf707a70642a67ad4472ca

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tcpreplay/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tcpreplay/Config.in b/package/tcpreplay/Config.in
index 5e36452cf4..9e5509114e 100644
--- a/package/tcpreplay/Config.in
+++ b/package/tcpreplay/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_TCPREPLAY
 	bool "tcpreplay"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Tcpreplay is a tool for replaying network traffic from files
 	  saved with tcpdump or other tools which write pcap(3) files.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
