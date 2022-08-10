Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6715AC25B08
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 11:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01A2382486;
	Wed, 10 Aug 2022 11:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01A2382486
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9MW4QXKsN3vj; Wed, 10 Aug 2022 11:53:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3277181D5C;
	Wed, 10 Aug 2022 11:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3277181D5C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C30FD1BF314
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 11:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB4B981C58
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 11:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB4B981C58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZGZsBJwS89ZI for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 11:52:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 028A38145A
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 11:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 028A38145A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 14ADF87054; Wed, 10 Aug 2022 11:38:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 13:51:20 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 526f9a103553b69261db2b7c4191bff543e7cbc2
X-Git-Newrev: 89ec94055cc41bd06138a8e38b5d34eb8e21c019
X-Patchwork-Hint: ignore
Message-Id: <20220810113827.14ADF87054@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/tcpreplay: select
 musl-fts if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=89ec94055cc41bd06138a8e38b5d34eb8e21c019
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure raised since commit
4138151e447e69771e2579ea5a3daa89c56d41a8:

Makefile:576: *** musl-fts is in the dependency chain of tcpreplay that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/629aabd00cebcad980bf707a70642a67ad4472ca

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 519b5ade92c80e3aaaa5cc5ac7e3bd34091aeae8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
