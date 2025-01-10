Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8268E77188
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 08:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4291160B2B;
	Fri, 10 Jan 2025 08:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogb3HrJjJydo; Fri, 10 Jan 2025 08:08:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A627660B9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A627660B9E;
	Fri, 10 Jan 2025 08:08:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52C5C942
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 08:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BBB64020B
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 08:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jb_VjhSJqt8T for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 08:08:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C00A240186
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C00A240186
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C00A240186
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 08:08:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7037540006;
 Fri, 10 Jan 2025 08:08:03 +0000 (UTC)
Date: Fri, 10 Jan 2025 09:07:57 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250110090757.12d8e557@booty>
In-Reply-To: <20250107151521.1655280-1-neal.frager@amd.com>
References: <20250107151521.1655280-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736496484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=45wffdTeUR4jx/eiMItTqWuje0igH79F0pkWC0h/Oi8=;
 b=ZVw/KYSauan1loedtZVRY2xiUm40dgr1RagLUvM9gIqS6VLzW8mn2kR8zPuduPANdSmmZq
 CgH1NzZVhlDReoqGRHfhmT+kkxGLhktziWEK0Thyai3lF1SVq0r7pL5lKSb0XAHA/WxIX3
 6wbAMoWUWURfCDgKLLfq3AjRTVTg6ghr6R4MOd+hM7iSyJg6XwmGMLRxMTXd0Ts0Ae/aFb
 KLX4bsWQ0Oxd/OUG1t/cr2jDHbenZRkK6UoQ4ut+4lLDZ3c45cPEgKOfAZbfKP0HTiEIOa
 rc4CbTvzS8Syj0teytnt0GXoX09mfuLm8Zkj7034F1mO4/J7B32juPZtVyR9HA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZVw/KYSa
Subject: Re: [Buildroot] [PATCH v1 1/2] boot/xilinx-prebuilt: bump default
 to xilinx_v2024.2_update1
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

On Tue, 7 Jan 2025 15:15:20 +0000
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps the default version of xilinx-prebuilt to
> xilinx_v2024.2_update1.  For some reason, the original xilinx_v2024.2
> release tag was missing the kria boards.  There is no difference between
> the xilinx_v2024.2 and the xilinx_v2024.2_update1 release tags other than
> the fact that the kria boards are included.
> 
> Now that the release tag includes all the boards, it is possible to bump
> the default version from xilinx_v2024.1 to xilinx_v2024.2_update1.
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
