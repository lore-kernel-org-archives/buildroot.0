Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78313CE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 10:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3C1561195;
	Sat, 23 Sep 2023 10:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3C1561195
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n6_nCHhNhYjc; Sat, 23 Sep 2023 10:59:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4500E6117D;
	Sat, 23 Sep 2023 10:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4500E6117D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B8CD11BF21A
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 10:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90F004154A
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 10:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90F004154A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NOyo1DCOgTpN for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 10:59:36 +0000 (UTC)
Received: from mail.light-speed.de (mail.light-speed.de [85.214.38.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4132D4151F
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 10:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4132D4151F
Received: from bilbo.fritz.box (ip5f5a8b4a.dynamic.kabel-deutschland.de
 [95.90.139.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.light-speed.de (Postfix) with ESMTPSA id CEEC43D42A65;
 Sat, 23 Sep 2023 12:59:32 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sat, 23 Sep 2023 12:59:32 +0200
Message-Id: <20230923105932.1865002-1-mail@jens-maus.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230923093901.1372593-1-mail@jens-maus.de>
References: <20230923093901.1372593-1-mail@jens-maus.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jens-maus.de; s=mail; t=1695466773;
 bh=9oSLtAap/X9ftC7Y4btiw+4hcJmv/KZ36w4fJyCAfWc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=2APANqSQaB1peHqqVFtoQSfKUILWhCjSnsG52EIyxjlTFU4/vKxlIZJWwC3tOMCuB
 0fG4xmfOWQw24ca5f2G1C9IGcfQgKlcqp4a+4ZayoGfU23SAydNzTkOQbdhp3DSBFM
 Rks54vFcXp1orWIE+Ebszu64RrV0Vg7umlDi8NmE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=jens-maus.de header.i=@jens-maus.de
 header.a=rsa-sha256 header.s=mail header.b=2APANqSQ
Subject: [Buildroot] [PATCH 1/1] package/nodejs: fix cross-compile builds
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
From: Jens Maus via buildroot <buildroot@buildroot.org>
Reply-To: Jens Maus <mail@jens-maus.de>
Cc: Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When nodejs is build a qemu wrapper script is used to execute
some programs built for the target in user-mode emulation. However, in
some constellations this causes the build to fail because libraries from
the build host are used rather than from the target staging directory.
This has been already reported [1] and throughoutly investigate [2].
A commonly used fix for this issue is to explicitly use LD_LIBRARY_PATH
to make sure that the correct runtime libraries are preferred rather
than using libraries from the build host.

[1] https://bugs.busybox.net/show_bug.cgi?id=14366
[2] https://lore.kernel.org/buildroot/20221031213926.50d3c778@windsurf/

Signed-off-by: Jens Maus <mail@jens-maus.de>
---
 package/nodejs/v8-qemu-wrapper.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nodejs/v8-qemu-wrapper.in b/package/nodejs/v8-qemu-wrapper.in
index e1083f47f7..48222d089b 100644
--- a/package/nodejs/v8-qemu-wrapper.in
+++ b/package/nodejs/v8-qemu-wrapper.in
@@ -5,5 +5,6 @@
 exec @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
     @QEMU_USERMODE_ARGS@ \
    -L "${STAGING_DIR}/" \
+   -E LD_LIBRARY_PATH="${STAGING_DIR}/lib:${STAGING_DIR}/usr/lib/" \
     "$@"
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
