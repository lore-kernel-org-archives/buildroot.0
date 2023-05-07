Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A804C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 060E740535;
	Sun,  7 May 2023 12:44:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 060E740535
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3-InBGmYVAyd; Sun,  7 May 2023 12:44:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E8AB404FE;
	Sun,  7 May 2023 12:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E8AB404FE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3D4F1BF391
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DA7881F27
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DA7881F27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dARh6uE8zgqG for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:44:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C08A181F1E
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C08A181F1E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD95985F30; Sun,  7 May 2023 12:44:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 14:39:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25d2a13782302a181c268b4616f1eda158a955b0
X-Git-Newrev: f89b988d33c9bd65ab33023fafab80b69d767656
X-Patchwork-Hint: ignore
Message-Id: <20230507124404.AD95985F30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/micropython: pass $TARGET_LDFLAGS
 to build
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
Content-Type: multipart/mixed; boundary="===============2087864440656338719=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2087864440656338719==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f89b988d33c9bd65ab33023fafab80b69d767656
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LDFLAGS need to be passed to the micropython build system via the
LDFLAGS_EXTRA variable, which was so far missing. This patch adds it.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Acked-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/micropython/micropython.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 51b45e5e99..5f687c73b9 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -36,6 +36,7 @@ MICROPYTHON_MAKE_OPTS += \
 	MICROPY_PY_USSL=0 \
 	CROSS_COMPILE=$(TARGET_CROSS) \
 	CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS) \
+	LDFLAGS_EXTRA="$(TARGET_LDFLAGS)" \
 	CWARN=
 
 define MICROPYTHON_BUILD_CMDS

--===============2087864440656338719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2087864440656338719==--
