Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53647CD13CF
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 20:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 047624048E;
	Sun, 17 Sep 2023 20:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 047624048E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rngmbYJ0yg1V; Sun, 17 Sep 2023 20:29:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F6934054E;
	Sun, 17 Sep 2023 20:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F6934054E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5266D1BF399
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A35340936
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A35340936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UlbXVmvwfyOE for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 20:29:23 +0000 (UTC)
X-Greylist: delayed 1663 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 17 Sep 2023 20:29:22 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B949840921
Received: from mail.light-speed.de (mail.light-speed.de [85.214.38.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B949840921
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 20:29:22 +0000 (UTC)
Received: from bilbo.fritz.box (ip5f5a8b4a.dynamic.kabel-deutschland.de
 [95.90.139.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.light-speed.de (Postfix) with ESMTPSA id 688653D4246F;
 Sun, 17 Sep 2023 22:29:18 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 22:29:17 +0200
Message-Id: <20230917202917.1391442-1-mail@jens-maus.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jens-maus.de; s=mail; t=1694982560;
 bh=QWY317RQcVQcBFoFTer80PpZT8qFaeHYq0D8UqcbPac=;
 h=From:To:Cc:Subject:Date;
 b=1xFpsos+h/heLrx9jErp1fVezIMDxIy/VIHtA+FIZkGyCh0UlRu3S+DXMZwo3HGKT
 SZM77dZ7k2ZZA8N0uShQcnn2tmzV6u0+l0vPOLVPvN9BlwHpS4GZveQsMr6ms1tD/X
 EU7fUTgBX/h1xuRhO9fKbGS6cXT5mvjYAHSk++DQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=jens-maus.de header.i=@jens-maus.de
 header.a=rsa-sha256 header.s=mail header.b=1xFpsos+
Subject: [Buildroot] [PATCH 1/1] package/fio: remove native build to fix
 crashes
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
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Per default, the fio package uses the "-march=native" GCC option. This,
however can result in "illegal instructions" when fio is compiled in a
cross compile environment where the target machine will have a different
cpu feature set than the compilation environment. Thus we make sure fio
will not use that compiler option by adding --disable-native to
FIO_OPTS.

Signed-off-by: Jens Maus <mail@jens-maus.de>
---
 package/fio/fio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index b1763d6c73..f6e7b036bb 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -9,7 +9,7 @@ FIO_SITE = http://brick.kernel.dk/snaps
 FIO_LICENSE = GPL-2.0
 FIO_LICENSE_FILES = COPYING MORAL-LICENSE
 
-FIO_OPTS = --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)"
+FIO_OPTS = --disable-native --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)"
 
 ifeq ($(BR2_PACKAGE_LIBAIO),y)
 FIO_DEPENDENCIES += libaio
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
