Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50E7C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A0B540BFF;
	Sat, 19 Sep 2026 16:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0Xbv24a6q7S; Sat, 19 Sep 2026 16:07:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 364EA40BE1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834024;
	b=Pj1w+9wLnm7ot7/UW+mrgRkw8eMy7Wv+XQpwb28MiEXBdJH25GdgzIYzxNKoMVuLH9b4
	 7Ut6UOVHQdca27SMMHYJDDKTDI3YkXPUozSIs+AS2yxDUbif3gS+3YnrnUIkJ5JMdTZB7
	 Aw1lelT5ezSURxWN92Z2AYyOO939eehqgzqd9Ieos+0020EKsckYiIQykqUiS1qGEO6qK
	 JaQ91SxMOYhgv3kN2bKPuH3uYOKwYCSzp/srhuB6f5VWGxSDTc2vpuh8nbcz5ZSoPCksj
	 ibDHmgD74j7GUblVwPzg+T0dNX3IR21M+OG0+r/4cDqq1cg419hGmJccTp43vS9RbpA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834024;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9WbohgqE9tGz27/zvYo29fBU/u+clTz84Ym6tSNyovY=;
	b=BhuxeDiFP2m1EE8mni0Wdcso2m0SH7H1dPq8AaUqYgH7vL1a74Ta7agc7s8Gfj8Hb4N7
	 DZO0o+YVpJeHev+SLR6lKc31zhaLcjbQF6THBgvA9CBsfqps7zxpSEpCau6IqJ4G5qVOt
	 B0BH+Tl+b2+wztLsp4sDOfR085jvXFzX2gdqV2eN6DKrH4nkpaGWdEHQ4BlMkoDNqadyg
	 KlWp05rfpbNUJeu5XsnPO8LNF5PhYK9ZAFftzgGXrBxNdixDYVRrb/8Hf56Z8xNNc53Fh
	 OQ2cXe5/tYcM3weV9aBqrpAAV2eiK5t5EJZnDW6xhR1EDpCuIeZyfdYVaUNimdXRfGg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834024;
	bh=9WbohgqE9tGz27/zvYo29fBU/u+clTz84Ym6tSNyovY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZNTAYxaDDBnbm8WdyQT3qmjWuWbwIJ5/jq3rzdYoENzn0nSmHFZI0ISsk7dfiUTTA
	 rznVQL/ZdeY1VjpAd4CqlptaTfZZt6wUuJuDe6dH0Kf0WBIDqC3CMqe6I63wk8EsOC
	 z05eKB963C1ug/OtPIWEKyBGckKhSMBaut7dbC5JvIQktQ7NDjkpDMxhPFA0zj6U8i
	 cY4w45tf5Pw52peNsFbfsy6ted1c3c3ZCjSDqKuxqSdxB3Xnohk+mBz0gEQzFBw+gg
	 FO5r0elUpBIiJOdeGoiIU9etwpXGQ0SPPQBJCagnGLAcRCVZCqv0Eq0d1EIMgxma/C
	 WRD6PnA+isXnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 364EA40BE1;
	Sat, 19 Sep 2026 16:07:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E1AA37A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E2AE8113E
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZNY6KGaA_WB for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:07:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 04D24810F2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834021;
 b=KOpKWMj6sXGdA1apSMg+Z4p/z5gqvDvsWshQEXy5G+rhKr0HD/wHScyhYAxrjWVLNIwX
 BZxVuTQv9/Qgy1kHoIDNNYTVLu0wTcp2gDzUrP6H008qvheLD2Kv+qfecUxHGT0nFswG8
 cc4M3HUTbPCzR1JrscAVPXFOD5lM6bFT3IiIBTq1xqGX3ls3zvM6ECOKR7S6wntR4zAbm
 tjmriUXJWHO5/P2qXw3YjkYXP/safzgwm5s55QZvGV3ynRry/ReA15aXA1o565jgyKMAd
 acnuJzIW1/kppvkAoR3i3XP4pt1vipqpGs7SQsQl4GCzvR+Sji8cx4oRTb5+nIEUhRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834021;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=roOnbfjj2Q/62DLTCf58sBBp/FpQLtiBIaEeCrP7SsM=;
 b=Xgzmul3eEeRySDkEyPLbzjGYXN/E7iLFeeJTLq5dKD6GkNZQsZPavWfNZKr0pMttLcK1
 tj+tGve2RzWd7G2gXxeEIZwwICWtP+7OhrBTGMl60hOboh+sYJQNfqSO6hVH2Q+V1iHvl
 /9CRVAavW1o8oPMI99QypOC0DVxL8FS7Cu/1+HJtlt6hYAnvDB9KcKc5E36iBfz/vdmT5
 XnRbFlqMhZ6vkbXawsvBjTvuMnEGbtyPFTF6JA82z95AFVpSxxXw7/8Gued40ThYrjpfk
 mjlp85MpkE40XFvKDwlLPmA4Ep+pqMmkTWI3LD0ZxUplzCSeC8AF0ii3XhkridYXZDg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ScAEe2nw; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04D24810F2
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:06:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 084D9C5145F;
 Sat, 19 Sep 2026 16:07:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9D223606CA;
 Sat, 19 Sep 2026 16:06:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 847FE10328386; 
 Sat, 19 Sep 2026 18:06:55 +0200 (CEST)
Date: Sat, 19 Sep 2026 18:06:53 +0200
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aq6zA108SfaEFytJ@windsurf>
References: <aqsHJwIBte5JUy6M@windsurf>
 <20260919141935.11663-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919141935.11663-1-shirokovalexs@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/nnn: bump to version 5.3
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

Hello,

On Sat, Sep 19, 2026 at 04:19:35PM +0200, Alexander Shirokov wrote:

> I'll send a separate small patch to fix that for 5.1. Then I'll prepare and send
> a version bump patch with only the changes related to the bump.

Thanks a lot for your super detailed feedback, looking forward to your
next iteration!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
