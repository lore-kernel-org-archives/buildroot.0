Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7620EE81A29
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 14:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2869540AE0;
	Mon, 16 Feb 2026 14:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNzw6PIGEwtL; Mon, 16 Feb 2026 14:14:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 173FD40A9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771251270;
	bh=Pp/xiPZt+GNJ7Dvz4KdLUabqBEuDZfKmVA8osDpOodY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sBzGM/ryIxXPu1lMflB2oIb5OVbQOCRTjK55GTobJl+ABEEWAvo/FsZoNVqdeiIxi
	 NnwfJOHg5VBizAyAv4T2WL1vy+UEHxwDG6fd5lN5KkgI+ELWJ8zrv8BZLeZppeRaV3
	 gQ6WnepAWV6eOg1zgeitMLrAfeEZ8givPWHeYdL7+BQbr0BQ5rUTT9tCNjR4bYEIWy
	 wTxQ/pJtT6Hx+QKr7iBPw8iUyIm5lGEDqz/j4UhlO3jcmMX4aNfMfaiSdgW56dgxWx
	 1PH2eUwrca8FuzFUeQsuxEwHJyaLOj1U0VNT5Yhga58RUIpC7HHAShhx8+usQdKp9N
	 uGY0mOBvhk8Sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 173FD40A9F;
	Mon, 16 Feb 2026 14:14:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DCB035B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 14:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B390404CF
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 14:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Us6MezHdJOC for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 14:14:27 +0000 (UTC)
X-Greylist: delayed 308 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 16 Feb 2026 14:14:25 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0F033404CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F033404CA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F033404CA
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 14:14:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.118.94]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDywu-1w1qeq3Enc-0065pQ; Mon, 16
 Feb 2026 15:09:12 +0100
Message-ID: <151f8aa9-4b6d-4928-9cab-7cc532cec18c@gmx.de>
Date: Mon, 16 Feb 2026 15:09:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jimmy Wesolowski <Jimmy.Wesolowski@mobileye.com>,
 Peter Korsgaard <peter@korsgaard.com>
Cc: Fiona Klute via buildroot <buildroot@buildroot.org>,
 Julien Olivain <ju.o@free.fr>,
 Guenther Harrasser <Guenther.Harrasser@mobileye.com>
References: <20260202141045.1913969-1-jimmy.wesolowski@mobileye.com>
 <a062166d22db6b02629b21913b366fb2@free.fr>
 <81e91ea4-20bd-4786-83f9-5e3810f52cfd@gmx.de>
 <87bjhqpd6c.fsf@dell.be.48ers.dk>
 <55c29855-c3a7-47d5-ae6e-a16062a418b1@gmx.de>
 <87y0ktoe8g.fsf@dell.be.48ers.dk>
 <DB9PR09MB4987AF416E2EE547BE59868EF66CA@DB9PR09MB4987.eurprd09.prod.outlook.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <DB9PR09MB4987AF416E2EE547BE59868EF66CA@DB9PR09MB4987.eurprd09.prod.outlook.com>
X-Provags-ID: V03:K1:KMSKgyBGSAdqHYZJdHdCCY2b3IgEhVWcGNYiGrT9/WxBXJXqo2o
 z4Ebe+v8a0nvZzSc0jxiKKOQ3EJlGgtd5QSHVKLFY73oiXdwTlEotkzMPAeR/R/cXW/+Aoj
 ncdPEzGNA7RYfSRG+LWQbvsce/H2vKvZquN30zV4FcARSpD19auHB66PebUiKG7ABnEwPMn
 RuEcZTYgEN8vWs00SxINQ==
UI-OutboundReport: notjunk:1;M01:P0:2FNNsqOXh48=;krz+Wzc7YCA30q3oIScKdYnxmfc
 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
 YEOVYv9bISeKlI6w7Oy+9h6sVT6vOpRCnAIUOu
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1771251263; x=1771856063; i=fiona.klute@gmx.de;
 bh=OUTjq7wciAcZHX2Epjdv5JFjvYBOVg55TQP6oLEoOZ4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=rKFx6sMucSFCQa+SPtUOcQnMSdAbH0MKcgpAqamnAp8SldzrCfqWy8LwVdyRO3+5
 O8jxiyEsqwkH0AHYZLsRWrXXuNrodCk8WOX0BmcjYR16F9fXQmA388h9SrXEHY+Ce
 pA56Mt9Nyxrrbd2toRu/YcJ8KOeNOt206V99hgJ9ojXOFE8RKjSR/4t11shwD+GbE
 czhmnoyw7ayeid0FZ+bRizdh/1+Ayoco00+3G+cC6oC4pm4x5FKRJsgRkX+9GbtcH
 OPHeVbArccbQVHYQ7qk/IyCKO1CUGJf3Zn83AFMuY0QH3qoMx/8sYCnitlIqUNFEG
 toCaKWJ1QFYfVmnl5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=rKFx6sMu
Subject: Re: [Buildroot] [PATCH 1/1] support/testing/run-tests: specify
 multiprocessing method
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 16.02.26 um 10:00 schrieb Jimmy Wesolowski via buildroot:
> Hi Fiona, hi Peter,
> 
> 
> Thank you for checking this change.
> I am sorry this broke Debian Sid. I should have tested on more
> distributions.
> 
>   >> I've tested this with environment variables and it worked fine, though
>   >> I'd prefer something that allows type checking, and doesn't require
>   >> setting a bunch of environment variables. How about adding a little
>   >> dataclass (or serialize/deserialize functions in BRConfigTest) and
>   >> using an environment variable to pass the path of a file with
>   >> serialized config to be loaded in BRConfigTest.__init__()? I'd
>   >> probably use JSON because it's easy to handle with the Python standard
>   >> library.
> 
>   > Yes, that sounds good - Care to send a patch?

I intend to, some time in the next days.

> I recall that we are planning to move away from Nose2. Do we still want to
> invest in fixing this long term?

This is about fixing the current problem, not a larger rework. :-)

That said, so far I see few places in the testing code that rely on 
nose2 specifically (run-tests, and the config that enables the "mp" 
plugin). The test code itself seems to be mostly just using unittest 
classes, as far as I've seen. If there isn't anything else hiding in 
parts I haven't looked at switching to another runner that can handle 
unittest classes shouldn't be too hard (but I'd still want to fix the 
immediate issue first).

Best regards,
Fiona

>   >> Another option would be to switch to a test runner that has built-in
>   >> support for passing config (like Pytest), but that'd be a major
>   >> change, not a simple fix.
> 
>   > Indeed, that is probably what we should do longer term, but not a quick
>   > fix.
> 
> I can try to support in that effort, but as you could observe, it
> could take a while for me to find the time.
> 
> 
> Best regards,

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
