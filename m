Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3F8C001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE9F881361;
	Mon,  3 Jul 2023 19:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE9F881361
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pQFcha9QzM4T; Mon,  3 Jul 2023 19:53:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ED40812FF;
	Mon,  3 Jul 2023 19:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ED40812FF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 910861BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A51A405BE
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A51A405BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tUfsl9hf68fe for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:53:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1CBE40420
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1CBE40420
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A16EA8650A; Mon,  3 Jul 2023 19:53:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jul 2023 21:53:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bde8c744cbe420f2e85af7a63782bb89ca6da06
X-Git-Newrev: ff037fe5430738e85d9c2270883e71cd77e99ff3
X-Patchwork-Hint: ignore
Message-Id: <20230703195343.A16EA8650A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpir: force arm mode instead of
 Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff037fe5430738e85d9c2270883e71cd77e99ff3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure:
/tmp/ccuwJnnt.s:124: Error: selected processor does not support `umull ip,r6,r2,r1' in Thumb mode
/tmp/ccuwJnnt.s:159: Error: selected processor does not support `umull ip,r0,r7,r1' in Thumb mode

Fixes:
http://autobuild.buildroot.net/results/610/61094bc7b7eb1d1e49bf8fcd1864b5cd3d7c4499/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mpir/mpir.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
index 91f704d30c..5dbd760aa1 100644
--- a/package/mpir/mpir.mk
+++ b/package/mpir/mpir.mk
@@ -36,4 +36,8 @@ ifeq ($(BR2_powerpc64le),y)
 MPIR_CONF_ENV += MPN_PATH="generic"
 endif
 
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+MPIR_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
