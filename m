Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC03C77B61
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 19:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3A0C60E09;
	Sun, 16 Apr 2023 19:12:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3A0C60E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KdNrmTEzxf4F; Sun, 16 Apr 2023 19:12:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF8B960D76;
	Sun, 16 Apr 2023 19:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF8B960D76
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6470C1BF425
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 19:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E4A741C78
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 19:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E4A741C78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KcH7ATfsiW87 for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 19:12:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61334403FB
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 19:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61334403FB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E310842D3; Sun, 16 Apr 2023 19:12:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Apr 2023 21:10:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 115d362e079a2c733508f5d1b37fafabcdd27370
X-Git-Newrev: c9a13ae0838174d1c05f026cee3ff66482620626
X-Patchwork-Hint: ignore
Message-Id: <20230416191205.4E310842D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/coremark: Set cflags
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9a13ae0838174d1c05f026cee3ff66482620626
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The coremark build needs to set PORT_CFLAGS explicitly in order to pick
up the configured optmisation level, and other flags.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Acked-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
