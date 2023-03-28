Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A8CC761A6
	for <buildroot@archiver.kernel.org>; Tue, 28 Mar 2023 19:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9434541C73;
	Tue, 28 Mar 2023 19:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9434541C73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4WMb9VSvmSRG; Tue, 28 Mar 2023 19:37:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDCC641C7D;
	Tue, 28 Mar 2023 19:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDCC641C7D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 023DA1BF955
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 19:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D05A041C6E
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 19:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D05A041C6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N80CFxERyXgp for <buildroot@lists.busybox.net>;
 Tue, 28 Mar 2023 19:37:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08CF140147
 for <buildroot@buildroot.org>; Tue, 28 Mar 2023 19:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08CF140147
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E85B5835E7; Tue, 28 Mar 2023 19:36:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 28 Mar 2023 21:34:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ad6dd20ffe6cfb57133cef5f1fdd0716339172f
X-Git-Newrev: 37e63bb2c98052939de9b4e6cb30002016055c05
X-Patchwork-Hint: ignore
Message-Id: <20230328193659.E85B5835E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: perf: ditch redundant
 -f 'rm' flag
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

commit: https://git.buildroot.net/buildroot/commit/?id=37e63bb2c98052939de9b4e6cb30002016055c05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The value of the RM variable in make is 'rm -f' [0], thus the additional
-f is redundant.

[0] https://www.gnu.org/software/make/manual/make.html#index-RM

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-tools/linux-tool-perf.mk.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index dda63cccec..5431c78152 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -166,8 +166,8 @@ endef
 # target unless BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS is enabled
 ifeq ($(BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS),)
 define PERF_INSTALL_REMOVE_SCRIPTS
-	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
-	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/
+	$(RM) -r $(TARGET_DIR)/usr/libexec/perf-core/scripts/
+	$(RM) -r $(TARGET_DIR)/usr/libexec/perf-core/tests/
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
