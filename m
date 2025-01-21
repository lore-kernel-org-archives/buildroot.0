Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1772C02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 15:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6194E60787;
	Tue, 21 Jan 2025 15:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kiW7fqJ3QwfS; Tue, 21 Jan 2025 15:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8313B607C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8313B607C0;
	Tue, 21 Jan 2025 15:36:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F423959
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 15:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BD0240462
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 15:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qn_7Mg0I6D_z for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 15:36:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3E39440356
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E39440356
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E39440356
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 15:36:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4CC020002;
 Tue, 21 Jan 2025 15:36:14 +0000 (UTC)
Date: Tue, 21 Jan 2025 16:36:13 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250121163613.7aec92bd@booty>
In-Reply-To: <20250121102222.1335874-1-neal.frager@amd.com>
References: <20250121102222.1335874-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737473775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kSBWPxXyJhFSOlpI3u1NjdW/kfhWTITyuIJwMeCdpt0=;
 b=fb0mXcRjux6oqaS+aDJPwyA5TORqI91IAuSF8wTvMc39mEAnITAUFELFehjT16UB/IM9Ta
 hQgrJRZJUm2ZIh3aJmacscIY62Qw3O71acwDhRtROA+JebOhSDxo3g/BL5IWb9YAfEUNLa
 noQ/jNQ0tUlp+zo2QG0OAJSqji5QCYuUcdy4kCvOoC54yCZSNLHDjjN8U8EzCotXVSihL1
 JytmWU7EbHA4kWYBvnLzzjdlPD5P9iHWg1g7CXLR8je9hsy670X4qI+cess09tfFehPdog
 ud9fmM2WWojcUZX1d1y5US4wUutnzC0b0eMVSXeXjMq8xkfW/RyE3PIT80h/Kg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fb0mXcRj
Subject: Re: [Buildroot] [PATCH v3 1/4] boot/xilinx-embeddedsw: new boot
 package
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

On Tue, 21 Jan 2025 10:22:19 +0000
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds a new boot package to Buildroot for building boot firmware
> applications from the https://github.com/Xilinx/embeddedsw repo.
> 
> If a user chooses to build a boot firmware application, it will not be
> installed by the xilinx-prebuilt package since it will come from the
> xilinx-embeddedsw package.  In this way, users can mix and match applications
> to be built by the xilinx-embeddedsw package and applications to be copied
> from the xilinx-prebuilt package.  This is necessary for the versal platform
> because the pdi file can only be built by AMD Vivado.
> 
> Support for additional applications in the https://github.com/Xilinx/embeddedsw
> repo can always be added to this package as needed or requested.
> 
> The xilinx-embeddedsw package replaces previous solutions including
> zynqmp-firmware, versal-firmware and xilinx-source.
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
