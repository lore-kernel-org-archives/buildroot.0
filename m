Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E666D5B845
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 22:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 174E1406E4;
	Mon, 28 Oct 2024 22:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCEzYFgyexlq; Mon, 28 Oct 2024 22:38:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6C30406D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6C30406D0;
	Mon, 28 Oct 2024 22:38:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 70810112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28AE780A69
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i4beQLyI3wUT for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 22:38:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2187081166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2187081166
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2187081166
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:38:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02c6.dip0.t-ipconnect.de [91.58.2.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0FEBAA4C017B;
 Mon, 28 Oct 2024 23:38:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36200)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t5YN5-000000006fH-1GW1;
 Mon, 28 Oct 2024 22:37:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Oct 2024 23:37:54 +0100
Message-Id: <20241028223754.2462242-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730155080;
 bh=EFyx8omKT2TxDYni91vGcfTU52RZ+l9X/jOtinNw8Vk=;
 h=From:To:Cc:Subject:Date:From;
 b=thPZ3LW+A/duN8PHj8WX6c76WyRL7tg7I1WpimQu6cGk66UnKIxoNGW+AgwEc5hSD
 /CXRgUyJOuiUx2OmaKbPJ3hAcMLX+f/h7xLal8DsER1aN+lS3/gW8gSK4BstiFqKOO
 n+8taOtnUzzIO0959zi5cUAXDnnzGgpXl01yNiZ2XqX2TFIQLhoxp+dbEwgmDVOCN/
 TGIiUjyl3VS2w8iieNhhAAM9ipKdNQJqpDmv21S36TW51OJHkhBrZeySDjwNhtNncV
 e7h1nLGUnobEo9aMMsOSUL6TrTGOiBoeZeQOxj9AfCGhptueMjBJPCmsOn5+HUo4lq
 ti9KSnK1u+o/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=thPZ3LW+
Subject: [Buildroot] [PATCH v2 1/1] package/libpng: fix arm soft-float build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumping libpng to 1.6.44 with buildroot commit
583bb434ffe1eec0dbf6887dd719c3f41a6253e9
causes a build failure on arm because the NEON code is only available
for softfp and hardfp ABIs, and not soft-float.

Fixes:
http://autobuild.buildroot.net/results/021/02158525203d8c7f16a4a32637d44d6c87b7f333/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Co-authored-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
v2: updated LIBPNG_CONF_OPTS (Thomas)

 package/libpng/libpng.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 3e7fc42d82..9761993d79 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -17,7 +17,9 @@ HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
 LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
 LIBPNG_CONF_OPTS = --disable-tools
 
-ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_aarch64),y)
+ifeq ($(BR2_aarch64),y)
+LIBPNG_CONF_OPTS += --enable-arm-neon
+else ifeq ($(BR2_ARM_CPU_HAS_NEON):$(BR2_ARM_SOFT_FLOAT),y:)
 LIBPNG_CONF_OPTS += --enable-arm-neon
 else
 LIBPNG_CONF_OPTS += --disable-arm-neon
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
