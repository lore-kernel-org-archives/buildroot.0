Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4085DCA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02F6F80A75;
	Mon, 28 Sep 2026 21:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nghukf6Mcmw7; Mon, 28 Sep 2026 21:08:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1588480A4A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790629706;
	b=BlanimoSdNVWL4gKyEY+rptYY8NXRygZ9R7jdSVxl3P33h18sdNtfvBnLFbuPKbkFFWB
	 371ox5sMxA0tLr9XvooSQaS65mrkmOItV+KC2g+nOc1AJYojPhhEzTzJI8pvgPiFjLzip
	 WfkeWwZdTV6QwNKFesbsQdrUQsvFddTv5Mj1HXZ6XsRdSbeXtYAna8sVjkDvB7gZEzH9g
	 xfLa9GS489QB7Yd61bXr3gbh9hG776hkTqQn684dldwZ992H8HCUJ4V7zhcXYKg9HwPT6
	 7Cw7KIdvHuVR0HbxRtAL7lKYHT0KbRa1RGtJ1idDZBhPzJ0JvXMK39nqYnrDJW1irmg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790629706;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dzGEznAx59fMXD5KnhiQ0XHbbD46o2Uo04zNoSNfI5k=;
	b=TssThrMabUnFMx6YtEfd/aoTQqWmb33oOUOFTvzU9Er8wdKUD42hnw8TzuhMRFMinpRx
	 7Dvizp5lB0h6CiszHIa5HJvLczyYiRF06e50FtiEfP4BGN/iJlcQWiKju7WWil+tdJbkq
	 D0ZpsLXW+uU7f2cpP8wmPw1mkPgzuJTYMHz4JThyRuKd0lVGcpPE6gWpfmnk3QBIyDZNM
	 EbIkv0qAqTWFxf1qnjgE3zGwYIdUZAa2BrBVVGphXece8M6/WXNz6WVoJgF5lMcG6tJQi
	 IipM8zseAznHA1GJUcsIwZy+6XHDsUBuIuyx4LJIZxFYtv3TNysjMzytdum9cmwl7bg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790629706;
	bh=dzGEznAx59fMXD5KnhiQ0XHbbD46o2Uo04zNoSNfI5k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d6supFlf5onuP3bg3z1Q8qD28jwcQcXzaHrO0K7gFjU5s4HKZwouYY+N8RxF/7Xp9
	 jG5DVe8Rbp49I6+EY9iRzHPV3ehZbbkeB9kY8AnGmayQOpu52e3Jg9Lxu1CtaOnOG8
	 Wjit69ujHdqgsAqLQRYRD1vuGrJJCCNBHJhTQ7Lluq/RCw/oKHIy63Wnhm/0TbYcaq
	 ek6fDoSv1iY4wVwBhoaKMJsuDz3s1kV0s1dowd7XSNqJc6RfBwf7xw8BIvQ03zog0h
	 Bzif4Zj++9dCvcRwvsIPEaZ6sOqr9LaOzZwm3tNAQ9ak58gGD6y2FX63IbO/MNIgqU
	 b3miTt5VQ1Xug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1588480A4A;
	Mon, 28 Sep 2026 21:08:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A6DA172
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A40EA80A4A
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tKn7l9Rc2jyA for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:08:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1F381809F8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790629703;
 b=FIt2WGcaFsd5o8UB23aH2JoYpdUiKMtv1FLV5VJoch7S9sEo1slGVrjvYqMqz/c1b59U
 fpgLv9VMkAOJK554plxvyPATyBgk1hwFtkjWrUKq4H0zKQBULI/iPG+ql1gBwsVeG1zU6
 xM//1pOVJ185UdDoKJZIjPyQcfCarvXM/5dbzKAXVXO15U4FnNJWiDFOYAx6VRGpXNkR1
 U4w2mxZRUDdzGmrqnBwcbICfoaen6AwIp/C2nOpXmOqNh2VTrggHmcAcV2TaUWsI/iE0I
 kfcwVBK+MQomwXemwH1Ho86dRR/+BJZyCU7VTc2R6NivD27i+blvDR0s2Z15noDzVGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790629703;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=6j9wzeFwltodNe8RdeKox8j1d5WwvK4DaMYDitaWwDU=;
 b=PiughIeATYCJZDbxglBtl4/3/AKsT/SwgyGSLlggx6vpKQZQTj87JHjPx1jZOnumVUNV
 IgRaj9J/ktno1xCCNac6OPHGgPV21vtBQStbJsxGe7Vv3llMuYkdrY8gngeF5Hg7kwjcO
 HSdyL0uhr/o1U7nsh2BOF67cDbVBwxBAVY+MkfBbvrYhEK4PpAAbvIUg50X2a6jw/7HZt
 iR7HMNPaZqiJ4cKhZSOsjQS5UOqmAFUeKRyTLv4dg5ap8bKET19PwnS6G796Wz4E4bTN6
 YOrKUa62rNYOLY0+7gbCGK1SKL3AkaICFigc5hL31mi7mez6ek3Xckypt6Xziys+RMA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=YV+65vfl; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F381809F8
 for <buildroot@busybox.net>; Mon, 28 Sep 2026 21:08:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1FF2F4E410A4
 for <buildroot@busybox.net>; Mon, 28 Sep 2026 21:08:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D4CBE601BD;
 Mon, 28 Sep 2026 21:08:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AA29A1032975A; 
 Mon, 28 Sep 2026 23:08:16 +0200 (CEST)
Date: Mon, 28 Sep 2026 23:08:15 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
Message-ID: <arrXGSEe4SmWlIm7@windsurf>
References: <20260928130756.24498-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260928130756.24498-1-francois.perrad.86@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/wireshark: fix support for lua
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

On Mon, Sep 28, 2026 at 03:07:56PM +0200, Francois Perrad wrote:
> since 4.4.0, support for Lua 5.3 and 5.4 has been added,
> and support for Lua 5.1 and 5.2 has been removed.
> see https://www.wireshark.org/docs/relnotes/wireshark-4.4.0.html
> 
> Fixes: 49fa20e6678ee32e4b26979f5cb4d149876fbedd ("package/wireshark: bump to latest upstream stable v4.4.9")
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Thanks for the v2! I've further improved the commit message, most
notably to explain the visible effect, i.e the fact that the builds
stalls with cmake taking 100% of one CPU core, and I've
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
