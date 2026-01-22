Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2D6D6CFA2
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 20:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C5A3409FA;
	Thu, 22 Jan 2026 20:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zsOtCKa9ap5E; Thu, 22 Jan 2026 20:15:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCCBC409DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769112915;
	bh=/ooEbTFsGx2A0gbK0Mx7gVCYXwawT6acXtpIfQ54vC8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EWVYisQqdGE+w6o5WbGeVil76RfuiA0UVNuStCSYKK4abKD08jP/2UorFllLmp/2M
	 OLsRNtOMk4noAqcCdBqdWTXN2QSQEes4Fl7e4jmIXHLMRo5S/S1bJOb4nPLDwZvDy7
	 oNpOL3tgCrTk8QA3MEEidCK0pAX1pgP4ovYYB9mHUEz1AKbOIrubr+tQvTVpXsXPm4
	 BGQygFCcrPReEXyqJBHgNnrYKsyCa83V+EopkVp+Wy5zFNRaKAPyhjmzU2c2WKSf8g
	 G92qfRLucVACGSr+gJg/HaF/LrAqsndmArM5npgZzkCmRk5e+4Sj5d6tu8fm9MqR0V
	 xEH8U59fMTWWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCCBC409DA;
	Thu, 22 Jan 2026 20:15:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A7AD158
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 20:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38FE980E5B
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 20:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RUUqcz6RRhWD for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 20:15:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 34B108254A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34B108254A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34B108254A
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 20:15:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C05177803A2;
 Thu, 22 Jan 2026 21:15:09 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 22 Jan 2026 21:15:09 +0100
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 21:15:09 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260116213359.2747785-1-bernd@kuhls.net>
References: <20260116213359.2747785-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <ef37a6a9fed0ab1a0e1ff502b3acc604@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769112910;
 bh=bwUmqRFuVB1/YygGuPtif8JLzFKEzWWPjA7JbkqtaoE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZzHIF+Cm78lsxUuD9Eb38dmYDA60nZWkJZQ15RL1zO/e/KuuujxcgQp1UwwYHCw35
 f9xbTzeBE3tZo0n8CO+1Mocim615GBgz3tbLCW0gb+NRNYzvgJY98j3LiZMMtyT9sd
 qXsh5IHrQYJMKfHHrlGAgGPg0//n2tIpXvzXDVOUR4KT0pi1dEk1Kqqdhx1UTCIJ+s
 Y2AxqiQ2faxhLNecPafv7ZloHKoenRZnd7zJsntp5UdBmvg+dIRA+ZCma4ktuWqbcV
 zn9+nixLJktcOEzolY9SFJ+4xWSXeSa4hd5HKezhnV5ay4ykVoP5ZetIuydnrkhMhB
 PujSZ/WU6BSyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZzHIF+Cm
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 26.1.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 16/01/2026 22:33, Bernd Kuhls wrote:
> https://github.com/intel/media-driver/releases/tag/intel-media-26.1.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
