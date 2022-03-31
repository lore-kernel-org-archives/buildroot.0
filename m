Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C73C433F5
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 11:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF0EC41E20;
	Thu, 31 Mar 2022 11:45:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nl9fKu_8cnJg; Thu, 31 Mar 2022 11:45:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91BA941DFF;
	Thu, 31 Mar 2022 11:45:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 623DE1BF3D2
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 11:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F34283F4B
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 11:45:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5CcIeEcLwAP3 for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 11:45:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A85BE83F3C
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 11:45:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B35B086069; Thu, 31 Mar 2022 11:36:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Mar 2022 13:44:08 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 90d633e632636b77dd5c7ce0dd23eec3692f20b5
X-Git-Newrev: f2e94303667b66a42f22f185ecfb12bef32728d2
X-Patchwork-Hint: ignore
Message-Id: <20220331113626.B35B086069@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/wireshark: fix
 compile with ccache enabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2e94303667b66a42f22f185ecfb12bef32728d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- use HOSTCC_NOCCACHE (instead of HOSTCC) for LEMON_C_COMPILER

Fixes:
  [...] /usr/bin/cmake [...] -DLEMON_C_COMPILER=.../host/bin/ccache /usr/bin/gcc [...]
  [...]
  [  0%] Building C object tools/lemon/CMakeFiles/lemon.dir/lemon.c.o
  .../host/bin/ccache: invalid option -- 'D'

Reported-by: Dan Ambrosio <dambrosio@outrider.ai>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 082076ffc186392f2b794facaa0545529e4f5851)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index a5ca4b1f73..1a549f7037 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -25,7 +25,7 @@ WIRESHARK_CONF_OPTS = \
 	-DENABLE_ILBC=OFF \
 	-DENABLE_PCAP=ON \
 	-DENABLE_SMI=OFF \
-	-DLEMON_C_COMPILER=$(HOSTCC)
+	-DLEMON_C_COMPILER=$(HOSTCC_NOCCACHE)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 WIRESHARK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
