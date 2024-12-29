Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7685CE77191
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 12:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2291A60827;
	Sun, 29 Dec 2024 12:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3OXq4Tfr9wnG; Sun, 29 Dec 2024 12:38:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D4A06083A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D4A06083A;
	Sun, 29 Dec 2024 12:38:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3E0372
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1F3760845
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 419tFMZE9jUj for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 12:37:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7AD096083A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AD096083A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AD096083A
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:37:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 2D412FF803;
 Sun, 29 Dec 2024 12:37:54 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 29 Dec 2024 13:37:45 +0100
Message-ID: <20241229123751.639378-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229123751.639378-1-thomas.petazzoni@bootlin.com>
References: <20241229123751.639378-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735475874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0rQfdIalMrqRuwjdHLexiWAIq73NblBVgx9QI8xV62A=;
 b=A4N/vgMl7MFGFdGIDs3r1e23mKDbUdBR6kwjxv7WKBnV+L4dBoB5AN49eeeicbqBGe/IbF
 9gSxspspojQU3xXOge5uqjiIJR557SFUC5kN6J2NaM1Eiud9KP0MXVvo/TZfzNt+aV/Sgw
 0RAJ3NCock7S4jVA3WKz55S9iQR8daAYlmq3u1W15Zt0aqX0CJneLd/hbfU4NPF252HHgh
 /Eb48R6srroTZGENXh8qHA3sLL6gYtBzzwNHByW7m33zKHB2F358vsaAob1BDlS+JdCkgy
 /G5AoQnrtk4KI3Jf9/vH09ga20HfHUEzVhe1zDeQUnon0H2u3arZEHa2ykUYMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A4N/vgMl
Subject: [Buildroot] [PATCH 1/4] linux: select host-uboot-tools with FIT on
 mips
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In the latest kernel, FIT images are always generated when building a
kernel for MIPS. Note that we build the kernel with:

  make all
  make <selected-image>

so the selected image through Buildroot options doesn't matter: a FIT
image is always generated.

Therefore, in order to fix autobuilder issues, make sure
host-uboot-tools with FIT image are always selected when building the
latest kernel version. We do not select it in general as custom
versions may be different.

Fixes:

  http://autobuild.buildroot.net/results/24bd5ae44f4097c374fe43b263254a985e2989d2 (mips)
  http://autobuild.buildroot.net/results/d18b458a600f1f4bd7008d13ad2a56cb22ce8a73 (mips64el)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index be44c00d7d..07e92c455e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -30,6 +30,9 @@ choice
 config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (6.12)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12 if BR2_KERNEL_HEADERS_AS_KERNEL
+	# mips always generates an ITB image
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
