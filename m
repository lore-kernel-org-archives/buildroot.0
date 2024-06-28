Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C7FC2BBCA
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 07:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 171B483F3C;
	Fri, 28 Jun 2024 07:32:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OpDIMFEO_NyR; Fri, 28 Jun 2024 07:32:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A24D5844B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A24D5844B9;
	Fri, 28 Jun 2024 07:32:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFC4A1BF3BE
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 07:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8B7E404EF
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 07:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W8HPbLprry74 for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 07:31:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9E7C240491
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E7C240491
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E7C240491
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 07:31:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 058F02000A;
 Fri, 28 Jun 2024 07:31:48 +0000 (UTC)
Date: Fri, 28 Jun 2024 09:31:47 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240628093147.0f6ce4d3@booty>
In-Reply-To: <20240618033849.2389758-2-neal.frager@amd.com>
References: <20240618033849.2389758-1-neal.frager@amd.com>
 <20240618033849.2389758-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719559909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N39Pv5po2ymb4UvFFLRcIzDIBML8GUHQM++CJ+hxTEQ=;
 b=iJLMIhDjlnD/6JkoD/hAT8p1MAXbr8MKcJtBT+WOyG5svH2f4jtqouPWToqNecu8AZ+/J/
 6w3RNZvLz5n6KsyKjH6lcMFfHQBy0Q8soG2r0J8AT3/T5R+eyOx4ZN2S06+FmYhGusEeNL
 mBQm9wCBbOBsQprha9g1Y0w0t2HGEaXeSg0ZfIhoeMqa5wCZ+6PZLSalFfWOl63FUAnej/
 zllFes5coR06CNFnEKJc+0M9u9NVWp+8AjNnIGmgJp9OwOBG021X/bCHMfyt/yMI17iZj0
 lqXko9QiWOpqTeHSjzPyCCai0LnE879sdrJD0nEcJbKNvulH8p+ePRy/ITRZQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iJLMIhDj
Subject: Re: [Buildroot] [PATCH v4 2/2] board/zynqmp: cleanup
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
Cc: ibai.erkiaga-elorza@amd.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 18 Jun 2024 04:38:49 +0100
Neal Frager <neal.frager@amd.com> wrote:

> Now that all zynqmp defconfigs have been bumped to xilinx-v2024.1, this patch
> cleans up the board/zynqmp dir by removing files that are no longer necessary.
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
