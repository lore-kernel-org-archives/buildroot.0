Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21452C77B76
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 10:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A76774059F;
	Sun, 23 Apr 2023 10:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A76774059F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Prds2ivg30-g; Sun, 23 Apr 2023 10:33:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B942D400A4;
	Sun, 23 Apr 2023 10:33:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B942D400A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EE7C1C2B8E
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC9A282073
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC9A282073
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F82VhLyrb4is for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 10:33:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2047D82070
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 10:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2047D82070
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E540843E7; Sun, 23 Apr 2023 10:33:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 12:29:27 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 5c7130f970a756df854373afce50b8a9b7aef1df
X-Git-Newrev: 6cee24af5316dd1104cc2a8198fdbddafeaa60d1
X-Patchwork-Hint: ignore
Message-Id: <20230423103322.0E540843E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/coremark: Set
 cflags
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

commit: https://git.buildroot.net/buildroot/commit/?id=6cee24af5316dd1104cc2a8198fdbddafeaa60d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The coremark build needs to set PORT_CFLAGS explicitly in order to pick
up the configured optmisation level, and other flags.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Acked-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c9a13ae0838174d1c05f026cee3ff66482620626)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/coremark/coremark.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/coremark/coremark.mk b/package/coremark/coremark.mk
index 418fd5c8d3..9ea8693e71 100644
--- a/package/coremark/coremark.mk
+++ b/package/coremark/coremark.mk
@@ -11,6 +11,7 @@ COREMARK_LICENSE_FILES = LICENSE.md
 
 define COREMARK_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) \
+		PORT_CFLAGS="$(TARGET_CFLAGS)" \
 		PORT_DIR=linux$(if $(BR2_ARCH_IS_64),64) EXE= link
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
