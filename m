Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C83CCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 07:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1040A813F5;
	Sat, 10 Oct 2026 07:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HtiVSQHGHiCG; Sat, 10 Oct 2026 07:34:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 374A8813F6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791617661;
	b=AemyyjZYOrOW31S0JAAXJDq1C3MVBUvB4Lb2KU6bivL7L4wcCDI27ZSdWBjqS8UjA+Dp
	 YzJjrceAyL08+oKVQPEpFi9teb99ddeFq5S5YLqD6BjBT6PKebYr/Y1zgvZyQvv1CcRp6
	 JPTz9Pns+48h1TwyoeT+ipZBK9HYW1I4uOGXAUyjBlwjxzk1yNr35e7djxQ46D1r2tWtw
	 jBQ6ZsUUDd0xFcf3h9DKN4x5GAEYiy/uyDP5kh/F6pwznI/GZ+WRRIcETGbpFeKoFzCAc
	 NbuPCh1vXbIXZwDIOl+OqiW0SJUw/GRiLxE33QUmhp13siPTuZz5mc2LoBTz1BZwI0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791617661;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ccFQijLYYq9HFn8mWybCDGhMSuucDH+jQrNwGJhkD+M=;
	b=n0+J7OumkfCSz3tg/SUTyCApoxdqyJ9QvwSTDvj5xIWY+7Mx9AwuxLQnMMtR3KOi91C7
	 eULKGJcrk19Y7yzAr3uUTHH2S6BN2WkKU3vIFC5jAMt0uyiQjoURM5SgZeznBBnHuEEHV
	 3o4zrf2OSMAYgq3Drmz2VQgI6mTsMs4LASu6UYMBRPucYcbecQ9F701Ps1cD3Wzn0zc56
	 amul1TkydOP7MxccviMeMdVyWQsYuLLZ5uRoRJP6dR46NZb8p3FSXgfIJ8u53Y9GeKPx7
	 Dt6rsKIPtNmoKAcSe6tJF/R5VbHuwZQ9aMdRKkzE6w8QbponokyPRRXYQ4Yd+wIaRdg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791617661;
	bh=ccFQijLYYq9HFn8mWybCDGhMSuucDH+jQrNwGJhkD+M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mDffLHqf3YEjAs8nrJjPzyS0YeMtd9xx8i9rl/FGlYUfGeLRckRsF9dpcSPm7egau
	 FDw0ZwvACdQswQMy1dVmlhA51nKEUoi/YZLT3OCa7nj6yZ0C3HnFzPuuN2ufcFZJiI
	 ipKaupCz7C+bunW4BtE1GUfxizV+FBaPZer6dXQriPbstQHyY+jyU/4H/KMyXgMbYN
	 dFlxTMa+NtwFxEXqIa62QfkJ3nuiiBoo2EnLFNtD1M5nwSBQ8aVfC7MxRf81LjozbT
	 9NSkLFJVMszz8jyMgC1m84UJx1kHHW7QgB7wWXh+iWlUx/QnCk2zDKfVBROv0yOTbZ
	 gQ8zIrXYqj5Mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 374A8813F6;
	Sat, 10 Oct 2026 07:34:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A6ECC9D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CFAA40894
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Uu8jCd9Ne9I for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 07:34:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2CC8E4088E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791617658;
 b=qxUPQ2kjUY+dS6eF+8MNmup/xhZ7Uri3etuqChg3z9+ds4rI0H0Fo5fr6+U1yxxCKsjI
 tma72k7yVtym510ofulYcPkFGmHQ1OS0d6a81JBn7Rfo4OQlkgILyJOb6WCwoUF3Wz9fK
 ecJqikCFZJdWgqxhKBLTDxE+bvJUO8sVLAN1yWw33j4HAaIefPwDYeVIIbXLMRTxtGyn6
 ib7OzP35JbUMcYTMtflVhyp/+0xRR9ZcO1jNcn1afIvdFvx1ImUhfHSh1h5MJiovvxWGa
 gidLy1rsRnBl8/b8xJu9Z1zkOawtiJt1QV3CKV1eBFoMTAx6Z4WDWC1rUGXPCjvJZJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791617658;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=a4ZakR4w4dzJkUm627FPlgOPFX79Eyc4cHfvhbN5+Zk=;
 b=Dvg6tjukkWUqdTLQeuxU3jeJtI9VyeWGAKs4wsLEz4vHz0H9yZEoYI05ydaufiv0unXs
 cVyanYMYEq9QmFmbJIQ/dmmoGB5vHtqAgIH3T9edkiBst9gVfQaqvZd5dmPtE+w5OgcFr
 HsimlN9Bb6b23lORwUB2BtXyP7+ddOrx4YiYN90VWM3/K7IiK/WuoWSCocdlW+kLuarNX
 yiGPAxMd/UEd8kdjd8/JQSe1Wohe03U+XCgHi5QdmDYyoxpJ1yRZXCFhi4D7Mjx3G//wC
 YnFn37/Ba1ifgB4CS86oPt0AZka1RDc+5iCpOcM+d4/Yd5Wu3zcjLFkt6W5QNZ14Y4A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZLg97FTW; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CC8E4088E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:34:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 5C731B00576;
 Sat, 10 Oct 2026 09:34:12 +0200 (CEST)
Received: from 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f)
 via 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Oct 2026 09:34:12 +0200
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 09:34:12 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261003234707.769506-1-james.hilliard1@gmail.com>
References: <20261003234707.769506-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <67f08514c586d7dc4bb2af45a8255d79@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/python-grpcio: bump to version
 1.84.0
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

On 04/10/2026 01:47, James Hilliard wrote:
> Skip dependency checks as the source archive includes generated C++
> sources and does not require Cython.
> 
> Update license hash due to clarified third-party license paths:
> https://github.com/grpc/grpc/commit/fb53717dfa6b264e7f930bb5e9a7e5c86a31ed9e
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
