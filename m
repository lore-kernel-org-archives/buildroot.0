Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FA9CA9ECA
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 19:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06F5280CB0;
	Sun, 11 Oct 2026 19:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LdzgaouomL2e; Sun, 11 Oct 2026 19:31:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0B87A80CA6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791747067;
	b=W/Ypv0NLmC9oTLQOYDE+PpmLfzImPpglyx+PU8Q6u/XWWwTwSJvlszx535jpdYXHcq0i
	 InjRNdS1kJ9OnjmJqGjewSjBKvW3WSdWj+nE7kaAuheYDHueMfyoDOTxzksClNGn6Zgd/
	 wSEbw4MjY3iaKbm+OAtFNyq4LudjZB0syn6voy5wVI9cLSQ3cK6cDW/2g5fjcPY7oNrt1
	 DUbl8L+nywQWiiYT4lJKeU85MJc/dd9wbJu2kVbN3Ful57qAXH/Rpv9uRyOmwjUzTweLm
	 vUnOxBpgOLPVnIyH2PuRHZLS/U482LZVS2zwBT6Ld0vmlPRY9Z5Bcy+Dh9l6NHIHwlA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791747067;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Transfer-Encoding:
	 Content-Type:Errors-To:Sender;
	bh=dwN7amOfX0TKyqpQnNBs5g9qzfED9wRZsLmx22bO0w0=;
	b=oYztJZZhrz0+/xEfb15nwnS0hlMh+SIBPT/FqhH2nOXEZ+I2noPKfalyF/ln0k41N+IK
	 REC4rrT6zRCjOzbEI3v5VNIv/0/gt11yKg17ni7JY810G0z79Ym/lcg6bosfDbMnYFl7e
	 YpHWWapqDdWG7ItqM44K4wawHDF4Vmfjd2tsFrPgYOFf+hBDRRxrcZWnAXuBc6T2wD0Qc
	 rajtMzMcchNV/F36YgUAqzA6raMgRL0aFUqOBE/1k6rO3xHXzpmOvFjc4WnwnQOVTkOIT
	 Vdx8wtyX2fN2w+eKbT2wjMif1fBSmrnWfXbq2UDfA9XZBCR1ItfN4O/YFImuXkNS8Jw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791747067;
	bh=dwN7amOfX0TKyqpQnNBs5g9qzfED9wRZsLmx22bO0w0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=hKuMfGl9X6gqC+5xHW0RfEhcdpt5rZnH3/2YmJ8Dnb7cO1Cu7HeH15CxAaAYnSJVk
	 3kxWM3QEFEtfoblBfV6euQ6rTKjjwNe7RsAIBTdMYCxxeOXHikne+ZmSbE767kX4cu
	 qGn1rc4ADEbeC2/WdWip0r0z0ytDGpcCZMAw5gTgjBWgDOwvpCHC8gQSh23x0Ke6cV
	 lhwM+1JQUZeaudF3cRLD6FN9l4/XjtMiV14rgY5YF3M2p+r2TnG9w7hSWZ0UgJcIiZ
	 xfWkAmIeKQUPVjPp/1H0O6QjMHtioDjn735Ehhtb0jk2IBr2URwGEboENgHWFOwG4g
	 Zv8RhaY9o+YnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B87A80CA6;
	Sun, 11 Oct 2026 19:31:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CBD5B75
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACD1F405B9
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p778NxHSbma1 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 19:31:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 98A3D40567
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791747064;
 b=CqkwN40XRnwCbHTEbjZ0BfX4T+wdoU615P4FThlAv4iqNwXbB5rM+Ekhqbc+ag6gX0VF
 0MiEs2ymazcl92mHZKpJyz17VezIQfxPk+kwCoJ+IL8HpYXkTX+UT+f04MPYuxF97OtGz
 Tyx1HuQvTkftiDcyHvvmguKSkzpstsplNkNqTXgLaON8hm440zAt3Bky/aGn+S318MJYo
 SLHi51YjbhHfyuY7GbUJeCmjrlxhk1JxJ5ICoki2BHHJXN8NJUVzjH1nWoq0bciF6LWGL
 uyl6veAgDY7onA0kIofrzCaAWWz+GlD7vPa07csYx85spE75r5tZ3as4pZBwVZVYknw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791747064;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=zNCNqqlTe2jva0xNV8VrVDX4easW4DiSSXl9TBiMbZs=;
 b=iy9Kmtq1qtmIKgS4RQRokpCPvRvw98ijCL1+o7KDvof1zHS/Pk1O0OMBCpD7MZRsVggN
 ZzyFwyK6ZLHQzBYMDEko9PHg6Z2fT9pQoPTAXxNT5VaSdYoWN8PNNDXn/praLXQggUcne
 6QilklSqxtg3y8O6iD/yQQqN2hJka59Pw3nmD5EhlvDiQBKp8ZSL42BsHsJYXMDPRjzxb
 xzbG7Vlx54ZsX4NXqjeiyeMc7LXkzAl95zClmgNIWFVJPUwbwgCK85u+3BZyjGVkEM6l1
 d4KHbZbVmGUx2lL+huwtc93V7beYeUmvU4s3/374LrMGgV1Mvz2zOTcuoU5WW2zVxSw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=LxVcxcdi; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98A3D40567
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:31:02 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a16af2a232so10175745e9.1
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 12:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791747061; x=1792351861;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zNCNqqlTe2jva0xNV8VrVDX4easW4DiSSXl9TBiMbZs=;
 b=UMsI36r0K73ihtIazlZhVr1R8Z1gxAPcMc/7bcm9qrEN7+pafZ3g7msTYp2Kudv5Cu
 QrKx2xV9/HG254+4l1yE7UmagRZ5s7LKc4MaaKrONvrS51b/0EjYymUa/IXdH1vGfMlm
 vMLmetXoUfzu8osUbGyaqUwwosSNeHYJTM5emuzm9tem7UC5kaQhvsaaraqJKqzs5Tki
 vVwARkHpL1kb5etKk8L0JciWOugObS86WpzPX988EfhUOuENF4fQ9pElDh/5/V0XwvzO
 iPqmHVSErBAq0eUUw4CfHYY07bQHkQ6w5WHtnFrqOTLWnt2KQrW+Z7gg5fw4tH+vFaeL
 c99A==
X-Gm-Message-State: AFq9FYK/qo/OfEl0+60zLqxemNlHhw5xq4o5kOcB6tUsob9rVuRAA7R+
 CDfrZNfHD0thn7pNgwgosNefqXZck1RzOMztj2bUeERVuzP2p+ZoMiSdO0K7feX7jys=
X-Gm-Gg: AYBFou1G46YR9f3yWeCvM9ljPqLWzSIgvLmq4RsgFGFGpkdEmkI2oZvMj1EFDpygplP
 +Q+Rw4Gw197ZJwHfVrNhIo+XljXNx8d1Kr9voXe6qXq9UyWGE3Cm9xzcD8WnidkOKDjlPRD0RBl
 seerKNcbvzPN1+cKW1dMQ/qQC9nKssX4o8khlrgtA8Kz6rJ6GFxYPacs8QK0bKntLJop83c21/l
 LTfS9IkCG7rOq/p+45rlRCLFVlddMJ0Mwp6edR/jI37VMN/AnU0UkPW77GDmD1AYKWbPp7F/Dwx
 KCDNX8X73uAiU/AvHc4k+WCBr21RJDQrDASjqNehW22GVzVGioQv8xnVA2tz1Un19J4ZQ3j1fM/
 mwnXzI8OD/8jlXEbFOLJKXH8XPlmYXF5bGnbzEOgotmOeElh8+m3J7+rEqGWSLNQMuYU+ymbyKy
 CoRCyDrx9WRHpyqrYGNSBc+M1bb3iAeEs6YPq+ARB+fc6f+co5HIzFEQV15VBqtL3EFad89F0i3
 cQIS48Wzq8CDKc1nJcryE42damT9ulXkzUdcBMlapACAok=
X-Received: by 2002:a05:600c:8b64:b0:4a1:7703:e537 with SMTP id
 5b1f17b1804b1-4a18e49302emr140319865e9.10.1791747060577; 
 Sun, 11 Oct 2026 12:31:00 -0700 (PDT)
Received: from [10.20.174.153] (ptr-94-109-186-101.dyn.orange.be.
 [94.109.186.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a195002123sm199535545e9.1.2026.10.11.12.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Oct 2026 12:31:00 -0700 (PDT)
Message-ID: <734360bc-1e66-4584-b04f-f5405af3be1b@mind.be>
Date: Sun, 11 Oct 2026 21:30:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <petr.vorel@gmail.com>
References: <20261010151121.876133-1-titouan.christophe@mind.be>
 <20261011191210.GA129909@pevik>
Content-Language: en-US
In-Reply-To: <20261011191210.GA129909@pevik>
Subject: Re: [Buildroot] [PATCH 0/7] Update kconfig inrastructure to Linux
 7.2.9
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: ps.report@gmx.net, yann.morin@orange.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Petr,

On 11/10/26 21:12, Petr Vorel wrote:
> Hi Titouan,
>
> thanks for this work.
>
> I'm having a trouble to apply your patchset. Could you please rebase on current
> next or master branch and push your fork somewhere?
I just rebased on top of the latest master 
(f43af4ef31cd40270c7db94b98c0ff9f212e6448) and pushed there: 
https://gitlab.com/essensium-mind/buildroot/-/commits/bump-kconfig

Kind regards,
Titouan

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
