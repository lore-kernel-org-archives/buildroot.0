Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AE8C7EE23
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 20:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1532E8214D;
	Mon,  5 Jun 2023 20:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1532E8214D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJhE5KuF7lyG; Mon,  5 Jun 2023 20:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D5CE82137;
	Mon,  5 Jun 2023 20:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D5CE82137
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9789A1BF3A1
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D12F415E6
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D12F415E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RyGCd-qgH5wx for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 20:06:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F075415D1
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 20:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F075415D1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29BD386C7F; Mon,  5 Jun 2023 20:06:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Jun 2023 22:03:02 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 44b1e44ef9b62c637975d8446c24c8cc6653f912
X-Git-Newrev: ded4f049f674f996c5f65911a87a024010b3cd16
X-Patchwork-Hint: ignore
Message-Id: <20230605200608.29BD386C7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/micropython: pass
 $TARGET_LDFLAGS to build
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
Content-Type: multipart/mixed; boundary="===============2582713581743831107=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2582713581743831107==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ded4f049f674f996c5f65911a87a024010b3cd16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

LDFLAGS need to be passed to the micropython build system via the
LDFLAGS_EXTRA variable, which was so far missing. This patch adds it.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Acked-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f89b988d33c9bd65ab33023fafab80b69d767656)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============2582713581743831107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2582713581743831107==--
