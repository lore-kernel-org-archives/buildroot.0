Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1E3C04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 07:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E5E240074;
	Tue, 14 May 2024 07:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJwJuuyqLcte; Tue, 14 May 2024 07:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2608B40998
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2608B40998;
	Tue, 14 May 2024 07:58:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C99E91BF309
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 07:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2D2F40998
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 07:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7BKO1K8Iq6BQ for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 07:58:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D8F824097E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8F824097E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8F824097E
 for <buildroot@buildroot.org>; Tue, 14 May 2024 07:58:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0683C1C000F;
 Tue, 14 May 2024 07:58:15 +0000 (UTC)
Date: Tue, 14 May 2024 09:58:15 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240514095815.59ab4664@windsurf>
In-Reply-To: <ZkMDv++K4F2ifMyN@waldemar-brodkorb.de>
References: <ZkMDv++K4F2ifMyN@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715673496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dsSyNOPufV3f4Xn44c4gb9fFwAV76jnIFpoFunGSPoE=;
 b=ENcbzan6dstZBVvpsdy1/1BRN30N+/rDCIDW8vsUduF/A8gX4fsvbxfkW3IGKRVw7TLuZQ
 zxeEkN8m+lyl628aLmXVOtMqN9i7aqjDX641ydB7E2ZjXpCzIe1/tLp9tqKWhldBIPEHjg
 VhEG2Gh1JCTa+cHtebhqV9dm4tOzafPPMngNfS/3xfA3CfrRfdHdG73gcVGbfTq9UYJSA8
 ZW58rq0ngZjf6g6+zaYqlI8I4H7GkLL7APuT4Q6ncObuOjWWTjNmr5/MSokbwcaLMMczfM
 K6OpUASw/0EEq1BGkEt8bwqDO8brlyEEt574qI9iBzQQTvxAHVEEiaysKlcBnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ENcbzan6
Subject: Re: [Buildroot] [PATCH] support: update config.sub/config.guess
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 14 May 2024 08:25:03 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  support/gnuconfig/README.buildroot |    2 +-
>  support/gnuconfig/config.guess     | 1233 +++++++++++++++-------------
>  support/gnuconfig/config.sub       |  302 +++++--
>  3 files changed, 894 insertions(+), 643 deletions(-)

Could you share some details on the motivation for this update? Is it
just because they are out of date, or it is fixing something specific?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
