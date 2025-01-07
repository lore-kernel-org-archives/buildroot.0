Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7050FE77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 17:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0125B40296;
	Tue,  7 Jan 2025 17:23:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z2asHUdvmZc9; Tue,  7 Jan 2025 17:23:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8C96403FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8C96403FF;
	Tue,  7 Jan 2025 17:23:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EE946B
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 17:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D125D4041D
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 17:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3QdFsVPrI5bq for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 17:23:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C5CAD4016B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5CAD4016B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5CAD4016B
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 17:23:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E62A60003;
 Tue,  7 Jan 2025 17:23:07 +0000 (UTC)
Date: Tue, 7 Jan 2025 18:23:05 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250107182305.7286671d@booty>
In-Reply-To: <20250107063136.787314-3-neal.frager@amd.com>
References: <20250107063136.787314-1-neal.frager@amd.com>
 <20250107063136.787314-3-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736270587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B3p++Q+fLqah7mKBHsdywXvh1UuvgWuxD+8h8U3jj7w=;
 b=L/JKVVuEf7YIu34LKTVACeQ7J/E6chQHDz8yl4IUCSCFK5xrtUBje7XpBOUAuF3v+4q0yc
 XjY5xq2kz31XPNZ/oGoX38OT+J75RsEhCCwYFFNPoHsHiE+IotQorxZg4Zhwej/NIbu5AP
 T8XqW2G04Flz4k10ujzucicNlTnu70UfzbvfUmwlqh1SXoiZZF5pDgR58cgM04wJ9ThxB5
 SOBkC/D3doNZYOL/ZjWWXte0nrzehBLkwN9ttr2RfTwOGaHMV/oSJAqoTk6wQ3ghWOTbVt
 upfQYRoJydIRuqsLQMqtIpswSbZW3c4/jGh3vncwsnul9r+3VmjAhJRx/UMm4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L/JKVVuE
Subject: Re: [Buildroot] [PATCH v4 3/6] board/zynqmp/patches: add zynqmp
 binman patches
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
Cc: brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 7 Jan 2025 06:31:33 +0000
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds the zynqmp binman patches that are already committed to the
> u-boot next branch.
> 
> Upstream: https://source.denx.de/u-boot/u-boot/-/commit/10de9b5a6a5b53a37600894115685f00d3bbfc2d
> Upstream: https://source.denx.de/u-boot/u-boot/-/commit/290385f374fba69f9c4f473c8bd25d64935a4c82
> Upstream: https://source.denx.de/u-boot/u-boot/-/commit/d92fdb60677b3990919a4216d3452418db215224
> Upstream: https://source.denx.de/u-boot/u-boot/-/commit/afbc1fa5f18a2eebf1cf06f62574016edc093f50
> Upstream: https://source.denx.de/u-boot/u-boot/-/commit/2eb8cd5bd4936a5eb2e77729855d946f6720921c
> Upstream: https://source.denx.de/u-boot/u-boot/-/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca
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
