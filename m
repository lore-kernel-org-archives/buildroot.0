Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBCCC433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 07:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1499C40B61;
	Wed,  8 Jun 2022 07:12:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E6B0c6J5xvUk; Wed,  8 Jun 2022 07:12:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2719A405AA;
	Wed,  8 Jun 2022 07:12:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 57E0B1BF3D2
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 07:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4384E4191A
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 07:10:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O5XmxkV_uq-h for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 07:10:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A964F410C8
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 07:10:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 8565AFF808;
 Wed,  8 Jun 2022 07:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654672241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZ+fbjTQ/fyLJ4DCTw6uOrQ3JSKEnpEdBI1vMFz40jo=;
 b=ozpR51uiZDn6FGAqf4woi4zvF7LyNE/0PykLpoavPL7wEG3bfrBgT0y6j4+x7PfmOmpvvl
 XjiEh+D8z9VA3HKDTevBK1ahsZC3oAwoe5855Pqx+rkIq73noh4m4l/3JdbegqsiP7jQxZ
 D4l7suPVt6p9NNiBhY0jUco+WK2j7bZMwZHzXrAK8fYcEUckZCzzAkAXbQNfC5prEBpTME
 YoMKjU1HsRcGVc0HnugnzeBvaiXzlRqpZ/U89BN7rm7gJJUxgYODoYUTQ6nj4CzW5R2vm+
 bB2QzkANbwuFLtnES5ovhSpbThYiz6WOxbPQf6/oNYFcQzxTtjnEWI83egg85A==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Wed,  8 Jun 2022 09:10:19 +0200
Message-Id: <20220608071027.3384469-8-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
References: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 07/14] toolchain/toolchain-external: add
 BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER option
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some external toolchains do not have gdbserver available, but the
option BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY is always visible. And
when enabled, this option aborts with an error when gdbserver cannot
be found:

  Could not find gdbserver in external toolchain

Due to that, some random configurations fail to build when
BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y, for example with the Bootlin
toolchains for Microblaze or OpenRISC (because there's no GDB support
for those architectures).

One solution could be to make "Could not find gdbserver in external
toolchain" a warning instead of a hard error, but then nobody would
notice about this issue, in cases where it should legitimately abort
with a hard error.

So, the clean solution would be to add a
BR2_TOOLCHAIN_EXTERNAL_HAS_GDBSERVER. But that means all existing
external toolchains would have to be modified to select this option.

Instead, and as an exception, we chose to use inverted logic, and
create an option that is the opposite:
BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER. By default, we assume
external toolchains have gdbserver. If
BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER is enabled, we disallow the
BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY option.

Note that the case of custom external toolchain does not matter: by
definition they are not tested by the autobuilders, and by definition,
we cannot now in menuconfig if the custom toolchain has or does not
have gdbserver.

This will help fixing:

  http://autobuild.buildroot.net/results/6315ef7b66ee4ae8f870c92186bc674d65f62f2c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Note: if you want me to go with the positive logic option
BR2_TOOLCHAIN_EXTERNAL_HAS_GDBSERVER, I'll be happy to provide the
patches.
---
 toolchain/toolchain-external/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 2177e6a678..1a67e5645f 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -155,9 +155,13 @@ source "toolchain/toolchain-external/toolchain-external-bootlin/Config.in.option
 # Custom toolchains
 source "toolchain/toolchain-external/toolchain-external-custom/Config.in.options"
 
+config BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
+	bool
+
 config BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
 	bool "Copy gdb server to the Target"
 	depends on BR2_TOOLCHAIN_EXTERNAL
+	depends on !BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	help
 	  Copy the gdbserver provided by the external toolchain to the
 	  target.
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
