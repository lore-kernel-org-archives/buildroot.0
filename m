Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE466C3064D
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 07:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A13981589;
	Fri, 28 Jun 2024 07:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRH031Y-R4Mj; Fri, 28 Jun 2024 07:34:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98D9D81F0B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98D9D81F0B;
	Fri, 28 Jun 2024 07:34:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 644241BF3BE
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 07:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D3E041B7E
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 07:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkrweyR13pbU for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 07:34:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CAE8F40491
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAE8F40491
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CAE8F40491
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 07:34:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BBA6CE000A;
 Fri, 28 Jun 2024 07:34:37 +0000 (UTC)
Date: Fri, 28 Jun 2024 09:34:36 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240628093436.41f0d254@booty>
In-Reply-To: <20240619101343.1240550-1-neal.frager@amd.com>
References: <20240619101343.1240550-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719560078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7N3a5ejJLxHArVngUbnXksJDt1uEHANPvIhbURB0d2o=;
 b=J4FrLvesM91dFsJFiP5vf9XzlKTTP5ykkWAryDIYtVi/aiCJPNNPX5Aa5d43wTJuL1vPtw
 tBzLg+ObLV6CCLD1xWWnp0VcXxeGAIzXVjArpM1vvVvW5/wFWEGaZIv/WxBmdeOB7Ig6Hb
 xTlZCDOhN7svNsCmQAtkQVn4Yu+7RShObPD/M91F15JndHlYVVTx/E69AUrzu9deXxHXXZ
 xFljarQaL4cPtdJXo1uuy/h9KH9R5LBopdZOEE3rCVizZ71jx1Wu7/BnCFN0kb3GmT8Cye
 Xo7ZHkqBXwfb8WL+jtKW6vGY/2s0P4ptGv8n7QHvb/DmkLPaILMp4/eRzvmL5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J4FrLves
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/versal_vpk180_defconfig: new
 defconfig
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: andy.a.kennedy@collins.com, ibai.erkiaga-elorza@amd.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 19 Jun 2024 11:13:43 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds support for Xilinx Versal VPK180 Evaluation Kit.
> 
> VPK180 features can be found here:
> https://www.xilinx.com/products/boards-and-kits/vpk180.html
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
