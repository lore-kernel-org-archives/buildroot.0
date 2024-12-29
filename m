Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619BBE7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 12:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2DED40152;
	Sun, 29 Dec 2024 12:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fv2hDBfZEVc6; Sun, 29 Dec 2024 12:37:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD64240164
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD64240164;
	Sun, 29 Dec 2024 12:37:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73BFEE0B
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6181180492
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IasIaVtOIObE for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 12:37:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6CAE88048A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CAE88048A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CAE88048A
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:37:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 678A2FF802;
 Sun, 29 Dec 2024 12:37:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 29 Dec 2024 13:37:44 +0100
Message-ID: <20241229123751.639378-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735475873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xn/owEAqz+YU8pPRRYnBLhGesa8TlG4Ldtyv7E/sI7s=;
 b=UUGGdaPNpdGAfjMRGJRWUA7WAKFM9o+QhrpTwB/2H1S2ipnJlHHUcfoNBFKNb56eg/sutc
 VQlSjw1odH5Iv+3O2JcMrJFDpFGd330Eg6QH7Tmgsk7K3RqvNpCoz1jSG0Z5VjZ4nh2qkm
 3avRoptpD0fLHKBW3Ej3TnZPpW1Iofbjmen9DGXn6Fh1aSO9r4/UFLO30JMFA+r7H+vRP3
 50272PgY8yRLSfa0Nafs0HtihGh8XbPFy4Wlat+gIMTbkeipwB7gxMKdDbZB3lWEKgpdBd
 AxhqVmeTLh44isFLt62rWQ0utkWJdfnuzUpa5htmSrpetLUSMm+Qjmt2g0Yq+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UUGGdaPN
Subject: [Buildroot] [PATCH 0/4] Fix linux build issues in the autobuilders
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

The four patches in this series aim at fixing recurring issues in our
autobuilders affecting the linux kernel package.

Thomas

Thomas Petazzoni (4):
  linux: select host-uboot-tools with FIT on mips
  linux: select host-uboot-tools on nios2
  linux: select proper defconfig on PowerPC
  linux: select proper defconfig on ARC 750d/770d

 linux/Config.in | 5 +++++
 linux/linux.mk  | 6 ++++++
 2 files changed, 11 insertions(+)

-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
