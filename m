Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A67C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 12:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D6E1405DD;
	Mon, 15 Jul 2024 12:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8kcJlWLJPEXx; Mon, 15 Jul 2024 12:36:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F271F405DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F271F405DE;
	Mon, 15 Jul 2024 12:36:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B5671BF3B8
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1744B81222
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 12:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWf6scVMZfFr for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 12:36:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED04581220
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED04581220
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED04581220
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 12:36:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06B3F40004;
 Mon, 15 Jul 2024 12:36:11 +0000 (UTC)
Date: Mon, 15 Jul 2024 14:36:10 +0200
To: Ben Hutchings via buildroot <buildroot@buildroot.org>
Message-ID: <20240715143610.26215270@windsurf>
In-Reply-To: <50b8003c4466222765fa343b71bcad2da8478a37.1712957992.git.ben.hutchings@mind.be>
References: <cover.1712957992.git.ben.hutchings@mind.be>
 <50b8003c4466222765fa343b71bcad2da8478a37.1712957992.git.ben.hutchings@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721046972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gecxMNH2qcXxTC8GywVpoz8XQxbwpUuTcJROllflFfw=;
 b=DKYJdosuUl4eelVqlAd9sKmWI3io3BRVTlO4yoltn7O2ppoOoit2dmql5gGhoetJbTvN0m
 VZldtQfFh06Yq2Q2Wi+OIJojzFq6d59T4HFWyGFGpwZ6U03+aCJ/t7orRsxgquP230yZlY
 TXQxcyorR+B6XHf3hxd3qTKdaVoKechM/efHwB3fJxcyXvFApLb2lTvGKw5wRroXCDCD15
 Cn4u458SNUv/fzYCAx0Jw1/tbPKo8qUBFcrO00P/Iaxc5Cf2DbY0nc3Zp2rGb6fZvRNKoZ
 zrS0zEAkMPNWq/zh0VoNyKO7CbIBrpUbmquVoM9xlyVRw4F0NZzdTFcTK/Xskg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DKYJdosu
Subject: Re: [Buildroot] [PATCH 5/6] package/libksba: Add host package
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
Cc: Ben Hutchings <ben.hutchings@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Apr 2024 23:43:09 +0200
Ben Hutchings via buildroot <buildroot@buildroot.org> wrote:

> This is needed to support a host build of gnupg2.  It is not directly
> selectable.
> 
> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
> ---
>  package/libksba/libksba.mk | 4 ++++
>  1 file changed, 4 insertions(+)

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
