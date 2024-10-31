Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA9DD767F4
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 18:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B3A6402DC;
	Thu, 31 Oct 2024 18:03:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 49di3EQ6KH4G; Thu, 31 Oct 2024 18:03:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D888402D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D888402D8;
	Thu, 31 Oct 2024 18:03:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC8FE5E4F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA204402DC
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R53Qgt4annAl for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 18:03:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 653CE402D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 653CE402D8
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 653CE402D8
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:03:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86C491C0006;
 Thu, 31 Oct 2024 18:03:20 +0000 (UTC)
Date: Thu, 31 Oct 2024 19:03:19 +0100
To: Boerge Struempfel <boerge.struempfel@gmail.com>
Cc: buildroot@buildroot.org, Boerge Struempfel <bstruempfel@ultratronik.de>
Message-ID: <20241031190319.72ef03b4@windsurf>
In-Reply-To: <20241031133702.1467746-1-boerge.struempfel@gmail.com>
References: <20241031133702.1467746-1-boerge.struempfel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730397800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4UkknIRgQy+kv4TfvnGJt1qcenm/G3N15HVt1Szb/1Y=;
 b=JuWwx7YPbxfoJdNhaGdcI6+R1OkL6QU11X7zfTrdA2DJs2JjRX0+Tkm/+0yqQuV4XF5QVY
 RgROZgjf9l0ul8TG/sqjw/w5b4yznYfOab4RWf3YWxGIQcWI9XlblMw0S3vvfZEevSMuQG
 Gce72ppxQZ44eB0z5vG0njQh25XyPBgpzwTs/Q/8l/G3XtwpwhmONpnSPir1eTqZ1D3wKa
 10cjvW+cLTp/k3OSLFc0dgbt/e50N+oCSj9m58SdrndpEbsDIv4vuiz63Nk49pLHQzmb42
 NnA3dV6cNBeQnkmYT0i/xV6XW0dd3fX8Htf6/VodhS4qqGaE6a0BXL5ncPOK9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JuWwx7YP
Subject: Re: [Buildroot] [PATCH 1/1] package/libgpiod2: bump to version 2.2
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

On Thu, 31 Oct 2024 14:37:02 +0100
Boerge Struempfel <boerge.struempfel@gmail.com> wrote:

> multiple improvements and bugfixes [0]
> 
> [0] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.2
> 
> Signed-off-by: Boerge Struempfel <boerge.struempfel@gmail.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
