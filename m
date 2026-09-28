Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444A8C9833F
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 11:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E5D680D64;
	Mon, 28 Sep 2026 11:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rxlK2zC2wITN; Mon, 28 Sep 2026 11:33:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1E23E80BB8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790595227;
	b=NLg0Ctt+1kWKIpYndovl7tKUY/ZwMPlxmWGXc9MEhyodNtmMkbAODzr8nzU5zwxOZYmQ
	 IjDdbt/p5DtAtbTJTWFQMC0nM7WUu9PCOvpB0SiNYxXwnG4+ny1548vBa0oa1rF/tpVO5
	 lAnhAgaJgyEWLfVWvJrxsw9jsqRtb8By+TOrS+RnIoKKv23ttdCc+i7k2900hsjkHIylJ
	 stZg4PLlpIeTwjJg98uuJQ5+n+7GaOXyqufRdGH9JMKfkfjZsA7VMVYQsk/SwEiik0+HB
	 yWfMZtc9ixIJhTCU8ifNz+FZ+5C7Kv0FeBMJPLHUE4vqjIijbDz01bRL+8FB/w0XbAA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790595227;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RnnGC4aWZ3pKzXSUofhoDdCJsOt/AQrUlwBsXxu9SsI=;
	b=YTzbfXq7fQJWsDnMKquumMZKZh8WI9o1rRnYyELH9/nQpx51TcwS8MBzI6MnO0/EhB/Y
	 spqZxdKOTk2eW/FWueoGpmCMtBxu6SYMZxN2FHdHIi/Vi/2aT8Xk0NAYhWI7+lLp3eOYp
	 cpXdB4p20jiUpJXtNeJ07afoZj7gIRgS8n9FYOSVT2kzLQL4+MBiCQOxqOc6ms7MjuWc2
	 Vr5bfxU8cc0RlSkhQW7kaR7b7CNQPt5/oRTaKm1256nS339YTrs6VlfVH4AI00aOYZ2W6
	 48bPhSGfDM571aSWTnniv0KsemnLc2zdkffiUzJSxrVS/twhWR72lWpWG8ia+j2Sovg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790595227;
	bh=RnnGC4aWZ3pKzXSUofhoDdCJsOt/AQrUlwBsXxu9SsI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hyXLVe6KI8ybfd/zQSz3qk0YMNvpZo9XJma1jHRACezap2UJ1tBE7EwdYAR5FeBlE
	 0th/UB6Cnr3xfqvt93rjRRsqIO7m9GTdvnStCj+sOvueScbmkrnh0U09K+tIh82Yf+
	 Hwne5U0I4KEzXficgiCRXtaT0Dbz4G9Qx7Puz4opGqiNtcVOwwc4C/HGPz+8ync6qa
	 GUx7npXncetf+TwjzqrlMWh8JRDnM1WfhX3QAfAKnhnc6BBDQgtDWo9irWGJhg3iTG
	 2hSr5V6WKGytEMqaX4+akQ1WixP6ZVTYmVL54tHmxqaIyp8/7sbJoe5ZLGcm3m49ca
	 iuRwVmIRq+/JA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E23E80BB8;
	Mon, 28 Sep 2026 11:33:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E96A03D8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEEF98081B
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RCtVrdkJrcxw for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 11:33:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7910C80D5E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790595224;
 b=O/vnhFZZT6Rlq5G16YPBJOqhEHxuHkWkdBqro7dATNVoCdwjysRQ3jTbg6DVyD8hU0+7
 S+egAWB0tvmrZtk5u1xCyhNNnsHwhmAHZN7/Z4ddUK9+ZBb2aIZMMU85mobNmX4Po83VW
 jjztAIJEJr+NJGOtbEUpMwA/NXnIc4kkVyV8fh3Jhc88Y6lUmgPuAqHd5rKfe6w89tCjS
 yFufuJbDeuJeWnU06YWfWfgft54B9MKOVblRoTv4THNNCST6DX+eh5ibOFF2SqBXgcH/1
 tNQE+0KG6BYtOAPeRCzjwwnKzdBttIPz1mfytbn0HguQ62tlpvAX9vqSldnR6IVGVng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790595224;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=7G2K0g8U5bBwqTNDYbOkM4s7BPli6cF+YMposmjty7o=;
 b=fAOWAe+uiHmVyv3gIJhlzGMO4S7W1WjLOfGb8qI5Ziqf2M/iaTnSaKtf0i8PJQ3662qM
 XchcDYLM2/9pGVPHstmx/4G6E+Ng2CNgCEJsEgi2vwufIWei/WnikiCJIALKB1nrQ5dCe
 tE6GqoYQE2D5RyGRhKJcCB2tZd0SN2xbcL8/aoFjKPpt/WnyCG1i17/GiGpXkt8Szo7gP
 zuqlmjYbhrICbW/rir4BfPXDpdMg0veMdENlSS+TvukPuCYDW+jyD75uXIfpKb8fjhVSh
 LmhlsNPqINGpj7WuvJ06uOHyEARE1C++NqZ/ZOt1VPBbELUq/9fYL1r33fKQ/eqpmIw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=g6i1YpQw; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7910C80D5E
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:33:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D83D54E41025;
 Mon, 28 Sep 2026 11:33:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A2BF5601BD;
 Mon, 28 Sep 2026 11:33:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6C7D2102F1E82; 
 Mon, 28 Sep 2026 13:33:33 +0200 (CEST)
Date: Mon, 28 Sep 2026 13:33:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Marcin Bis <marcin@bis.org.pl>, 
 Robert Rose <robertroyrose@gmail.com>, Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>, 
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, 
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>, 
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>, 
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>, 
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>, 
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>, 
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>, 
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>, 
 Sen Hastings <sen@hastings.org>, Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Message-ID: <arpQa7dmBbQfVSCN@windsurf>
References: <20260927104301.1801638-1-bernd@kuhls.net>
 <20260927104301.1801638-56-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927104301.1801638-56-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 55/82] package/mender: Fix build with
 OpenSSL 4.0.0
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

On Sun, Sep 27, 2026 at 12:42:33PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/mender/0001-openssl-v4-update.patch | 180 ++++++++++++++++++++
>  1 file changed, 180 insertions(+)
>  create mode 100644 package/mender/0001-openssl-v4-update.patch
> 
> diff --git a/package/mender/0001-openssl-v4-update.patch b/package/mender/0001-openssl-v4-update.patch
> new file mode 100644
> index 0000000000..010872e69f
> --- /dev/null
> +++ b/package/mender/0001-openssl-v4-update.patch
> @@ -0,0 +1,180 @@
> +Fix build with OpenSSL 4.0
> +
> +Downloaded from Ubuntu:
> +https://git.launchpad.net/ubuntu/+source/golang-github-mendersoftware-openssl/tree/debian/patches/0004-openssl-v4-update.patch?h=applied/ubuntu/stonking-devel

You could have kept the commit description for this patch, which
includes the original author, so I've re-added that in the patch
description.

Applied with this fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
