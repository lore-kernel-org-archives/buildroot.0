Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71D9CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A04F60668;
	Sun,  4 Oct 2026 16:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3-p-BtcXF2v; Sun,  4 Oct 2026 16:07:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 41E7F60652
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130075;
	b=mcWpviw8K6BuYA3znFF1aKg3Yco4UOitp/RLHfHQTPW2NeSHniiKzsJTD2IpxJpJYI6H
	 UKIvuPUbWmBl3rWZ5+MbV6Fdl+YoRM5eHgoElEbupdZxn2EK2DWk9Mc1qiUoCBA+xi+dO
	 Ww5ulgbaAk9YGJ0Wqc6OuvyUmx1Rsdz0WwlWkuJZmM3kAat6GGnEcT6jpdLy0pBW6jWdD
	 FKYbSz1ir8kFsJxm4qgXsTlLs7VjjnfsX7UR3loG1hsBqwJeZ5J3iE7uESWgrcrgowg4f
	 LRCwGkxvtTq2dpfbvJtQKqbydsWyL31a4Qb0wztkwd772oiur/0inzHukiiWp6Myz1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130075;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1wjZuUGwQRyO+NK8D1wXurVT5NyjeNHwhDYvL2H3uik=;
	b=QPZG3vdctbrQ/7aeXVy1AS4LKjE8uqalP+ntUwgNp3kQFgARd2oykyiO7Avs5xMGX1IX
	 O1QA+tbe3Pxr5pprk7aCs6W5aV0QqzZskYMpbBqFyZiZArmwky1GkrG1NY75mMPBbUx6k
	 vI5MTJ1Dg+X/JtRpsBHXaFq9vjj8bJZkBIjdkDxdq67OyI5BALZ6AURupEiN6/pwmh4W9
	 z/LKL+nnv1fVyXGecBJurDEkXQi2c24eouiZJmlqdgX6zwXm4+9V4w64RqCpQhJA9Zqev
	 X+8+wYU45zAAOulfTs1z8Mq49Qe3VDdGDVa1WUKBLm4dArY1EpdlZA8uWScHPeHjpCw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130075;
	bh=1wjZuUGwQRyO+NK8D1wXurVT5NyjeNHwhDYvL2H3uik=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aJrCliKU0HEJKRKEdvhYkKyc33VmIbXFiMQ0Kk2mRC3sK8iydUdoeN5SlNE7kLHd2
	 kImgOAOyGrTsS4lfT8rtln3+uT2OSjQxWNMCrzb9CBIikZKQQ1omIZl+IYNZdMzkY2
	 Rbrv02JKqd6VdF7Wj7xFTCEJWNXhsDULPM9WGTm6ONefuxGo26hW7X5jQeP3MT+LUH
	 eOohrtCn/sbJ1oHHBsTref7MDUsvdd0wvM907ofh81gMBoQsY1BQ+RTyahrl5qn7uc
	 yctEKEl7InbwVRgJeLSUfozKj7ySGN4P5Rl+0aPbc8rOKDcpuqWnX/LYLoWTwTWhGw
	 zIy26PuzJNxzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41E7F60652;
	Sun,  4 Oct 2026 16:07:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 664C234E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5839540068
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vlW3u6thpLPK for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:07:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0CF6A40049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130072;
 b=ZCk5HaCHlIXe2TwmDgNduP6Jq+zcpiB78OOA3HFSecZ9YQlwYDo/DpuZKPQgjU7ugTEf
 vp0GClibKGh7uNYyKkiVLoKUTk5WERAP+O/Fv3kYq6zRaaK/VKd1AdF3aBBBJoZcqeZFY
 wY22ymeMfEGViK81cseU7EgvuUkRJPBH6K1emz4KlqQ+Xil0s42IOqkYpF82CtDnaxRI/
 eKdcpqzb5wJ7UQIg26/uHwdLKQFGeYacZT02R27z1YaK+LXbCTs7xbIGnFApvc3krcGt5
 MMVMbR2MqCVmbCvIop0BQ0RJJ65NPdLPfgnrzfOj3GjO7wsB9c6e7J3NiOqnRCSq+AQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130072;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Ar66OQKp+oz8a+ujBXcN+KIyBu/SfM61sAE4s9HF6Gg=;
 b=jF3eMSd/RZTIxs7qRzV6nE6ZitMoEnVL5RsExjla+RpxNWjhpUc/U7wQQZnm//e+mEXt
 Yw6QSvXCaY41pKVUBX7sf6V/ak9ELhfPACQ32ydS36qe3KB4PVmC7XGnWoSdtO3C8jfCz
 5l68JRdt8W7GtlPGR72EtxNtLhPmUc0pEsWO0OMpdvZEB8i0+nbBagdmr5pLDWrKWiXOM
 2CGwx+iEuhCBtO6NLgiGCMvRlyZCkvzkNUxHlH9VsH+zoUvlKvNtUqAZAvhVbzZmiHQ+w
 b6wigzEak5Dc76FVDZM6elxeMLmJrwsg2aWfy1w6bTFT0f6e07ESUCEaDu1H499tc6w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=IXQjjAaw; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CF6A40049
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B5B144E41163
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 71F20604FE;
 Sun,  4 Oct 2026 16:07:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 318CC103281F4; 
 Sun,  4 Oct 2026 18:07:46 +0200 (CEST)
Date: Sun, 4 Oct 2026 18:07:46 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, "Wojciech M. Zabolotny" <wzab01@gmail.com>
Message-ID: <asJ5zVW_eQZAJNDo@windsurf>
References: <20261003210833.735937-12-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003210833.735937-12-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-msgpack: bump to version
 1.2.3
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

On Sat, Oct 03, 2026 at 03:08:02PM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
