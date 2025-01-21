Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1427BC0218B
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 15:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C36C684B0C;
	Tue, 21 Jan 2025 15:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eIp-uuc3scvr; Tue, 21 Jan 2025 15:36:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1D8F84B21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1D8F84B21;
	Tue, 21 Jan 2025 15:36:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4217669
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 15:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0721660881
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 15:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oF1FD8nxyjbU for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 15:36:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A8FB060845
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8FB060845
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8FB060845
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 15:36:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AEE751C0006;
 Tue, 21 Jan 2025 15:36:18 +0000 (UTC)
Date: Tue, 21 Jan 2025 16:36:17 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250121163617.1fd1559a@booty>
In-Reply-To: <20250121102222.1335874-2-neal.frager@amd.com>
References: <20250121102222.1335874-1-neal.frager@amd.com>
 <20250121102222.1335874-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737473779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+JcP6BW2j99uvzkuVOqBH3GynvUjPHJgma9KB62aZFU=;
 b=B98mZt8CTes56N8vWqnsgRbnqgFUonnOVNF3vZViBPnvk0mOry/uUBz+XAb5k3RllQLDx/
 kaOtRFD+gIZiYWKVAgXVk6ZPYgIdPB0SuvoXpjoLe09l93gV5uXfhlHTrWVP+zxDSeQkds
 8ZPy1hqnl3CKRXwaPd1EEVI7btEA6L0yNLU4YTHhSAs0FwXlEvMenKOhDJtEmJbKMKZnZ4
 BrXzqkLwvO8EZa7gzgpPhcIewnjsYr+u7LEWs2coWWKWzYWMlLwiU4tk1aMJsytPFXqSFy
 ds44gkCvtJtFWi/YUC8bxPr4AmvIB4cN1DJ5ynzOsvEPXJgnlMIxDEhb0WH1iw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B98mZt8C
Subject: Re: [Buildroot] [PATCH v3 2/4] boot/uboot.mk: new zynqmp pmufw
 embeddedsw option
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, romain.naour@smile.fr,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 21 Jan 2025 10:22:20 +0000
Neal Frager <neal.frager@amd.com> wrote:

> The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW option will enable u-boot to
> use the xilinx-embeddedsw package for building a pmufw.elf that gets included
> in the generated boot.bin.
> 
> If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_EMBEDDEDSW option is enabled, then the
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw from a
> custom location will be ignored.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

[Tested on Kria KV260 starter kit]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
