Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1522DD3A697
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 20:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8C166081F;
	Tue, 29 Oct 2024 20:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YeGDO1leFI1K; Tue, 29 Oct 2024 20:22:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F26FA6083F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F26FA6083F;
	Tue, 29 Oct 2024 20:22:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CE9B4969
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D99940ACB
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tC14Vbog1aQD for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 20:22:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 00DF04014E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00DF04014E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00DF04014E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:22:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D78B21C0004;
 Tue, 29 Oct 2024 20:22:15 +0000 (UTC)
Date: Tue, 29 Oct 2024 21:22:14 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Cc: Neal Frager <neal.frager@amd.com>, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, michal.simek@amd.com
Message-ID: <20241029212214.33b2f005@windsurf>
In-Reply-To: <20241029145127.4011427-1-neal.frager@amd.com>
References: <20241029145127.4011427-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730233336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nOE6UHhI6oTA0WYPgI/Mz6TGqqAHuB+f/MmXNCGiL5o=;
 b=mtRBMgTuiVs+1FCalYRQNEaBShp6GUP/3qV6JeC5iNZ3CIurC+k8YBSTCltpkQ+tdyQ28M
 /J/5eRyqKyAIqlmcgTlgEMpq8V5tC+cGWyjG7i4b3XCosgu2aMpiwfw8FNDf0YG7JpCQcq
 LymtL+0p1xOKwCMQFu8XehhvZ1VTw4J1vQ4F6oiUT/LKACQwiZz+stf5aGwwef9Ev7v6Ga
 o856A0x6xpvGkhKXv3WzEyy3QYFPjHx4ZciYU8OSzcGppYmlFB/Y2PNYPv44n35N5KdpR9
 8dq+KgB4dF7YLD4oMs0bFIUMYSyLYs0WiSFizz7FLR3G+LQi3bGgrfYB7SShgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mtRBMgTu
Subject: Re: [Buildroot] [PATCH v2 1/2] package/binutils-bare-metal: clean
 up variable names
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 29 Oct 2024 14:51:26 +0000
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> Removing HOST_ prefix from variables to follow buildroot coding practices.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> -V1->V2:
>   - Correcting BINUTILS_BARE_METAL_VERSION variable name
> ---
>  package/binutils-bare-metal/binutils-bare-metal.mk | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
