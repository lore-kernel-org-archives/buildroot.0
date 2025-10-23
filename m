Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7CFCCD193
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 08:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2420C6167D;
	Thu, 23 Oct 2025 08:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZerGqN8elwxe; Thu, 23 Oct 2025 08:41:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DAC561650
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DAC561650;
	Thu, 23 Oct 2025 08:41:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C48AB70A
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 08:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE1AA61650
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 08:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SrS7qkLC7ox3 for <buildroot@buildroot.org>;
 Thu, 23 Oct 2025 08:41:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0C17B6164C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C17B6164C
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C17B6164C
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 08:41:30 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b5c18993b73so101985066b.0
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 01:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761208888; x=1761813688;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VFZ2iATfynUDzFsAaylg9uvFq9A0ODTlC5mA7M/SL3M=;
 b=g9APOG07dwBFxWOuXKI0b60hwgFr5nLfuda0Oj/lslOavT2WiDbKtJ2/PpXg4EBQ1W
 XbD8PeLEi+uRtzQhBdHwMxO1cLOb12SVAy2VeVP90PKR6/5gcjOHVayqWiZUvDU1dw8b
 8PqXO2mE+oWjxG2CSsIryntZ2TBilL/ZGc4yNYS/pWxW2d7NkSjGOw7YmZ+gtEkRyafj
 BPLVhHq+PCWX4u2/lZIV09bv9hyjE03xOS5vSTGz9LJ1611pgYykf8NbaWhP3iGm+VNy
 SUkp6tVhehfbiG07IMFH1/YRCHn+OSZpQY07EDUFGCvaqzt5pG3y13Dt4J/hISjp4ryy
 YJrQ==
X-Gm-Message-State: AOJu0Yw+9ee/0MLzzL7LneWQ8Rt6BJdfbqmpBqcZg5irVIEPHOIZ/ly+
 3xSlivDNFfjz8zGvCRB7cuoSDo/TxjyVeu0fTxud/nn6BALzRwx+ib9hTbt4yy6mLQ8ebWeSnZC
 hbeSYJxo=
X-Gm-Gg: ASbGnctdOx5wCGpQhRfeFmAtVQPBPF8/5pNJZq/Pr+B+q11Izna2bw4BvA2CtSYCIfD
 mknv2IaMTxPyKurj5EdwFVJwk406k+wiFqAOKrwmrUWU/1+V/AFIAiFV1NWhtqV/O+RV+bGyEJl
 1OCHSLM2HHanS40JLv7k3Jf4cUGcxshRv/wwN8IODfmsqpkKjjVV8BNp+bp3PsDMKKanEzSe0Qw
 f6L5rfKwhJuIQPB5KcM9qiO4AP1kzb7nedPV0mGFdJotohtAoGWb22HyxjRMPDJmuMnDQs31fge
 xFZ9mxfgdYvczXPM0JG1Ob4k4h4jNHS+6pca7s4Rg/LjLvybWRpC1cWXGxGGXalUknPPveBrt+y
 wlaMnmoWAME/if4nAnn8CWmcmyAR90cHqiq4GRgNzT0wTB07OAM8ViNhEb59n16CZabwW19E3m9
 5+9Yay2t7W3ZEX18zD/6mcqHEvhrg=
X-Google-Smtp-Source: AGHT+IGtpR2cetJkGYNPmbiYEjgtQKcvG/vsiukVd+k2PpOiLN1pGQBvP6fxYr1HrO7PdcCfMMMVpg==
X-Received: by 2002:a17:907:7f0d:b0:b04:274a:fc87 with SMTP id
 a640c23a62f3a-b6472c61940mr2924493366b.4.1761208888326; 
 Thu, 23 Oct 2025 01:41:28 -0700 (PDT)
Received: from [192.168.129.33] ([109.136.97.112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d5144bf9esm149152266b.61.2025.10.23.01.41.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 01:41:28 -0700 (PDT)
Message-ID: <888dcc89-e2c0-4f58-9b92-4889990edbdc@mind.be>
Date: Thu, 23 Oct 2025 10:39:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20251020104654.141781-1-titouan.christophe__16384.8985846684$1760957246$gmane$org@mind.be>
 <pan$79cd7$b6a8aff3$459f1ee7$48f49f3@ID-313208.user.individual.net>
Content-Language: en-US
In-Reply-To: <pan$79cd7$b6a8aff3$459f1ee7$48f49f3@ID-313208.user.individual.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761208888; x=1761813688; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VFZ2iATfynUDzFsAaylg9uvFq9A0ODTlC5mA7M/SL3M=;
 b=RzLYNrbq5VHsNMvyjcFBqzj3cc96Ltsr6d1IDvhW8w25nn57wO2H4gKzbOHJvzUtvP
 zatPcw7eBlAwHFb+eKnC4VxVaLxDGxA/Rz+abrCsATxx8Sesyq9HoovNQxDKK8lreJli
 xzGehY7wGO61m57exr2K+rEKM1fgGqiYmJ+5uXqDoFKjYIhUxPzOrAFKvKvpFUoZ6DZP
 b+0rLDqy4CC3zp/iSdhT/dJIBBWe+0qNJrn1M7u04MWSRFoYOfP92VrWkUAfvalIGESZ
 l7U+qH/iKNE4Z/qCzkQe69XFwsgvTSMTwx6rmQueNIpe3MX1zkawaObx0SS/2x4eTgJr
 CPsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=RzLYNrbq
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/samba4: security bump
 to v4.21.9
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

Thank you for pointing it out, I had not seen your patch for 2025.02.x 
while evaluating the backlog of commits on master for LTS branches.

I archived this one on Patchwork

Have a nice day,
Titouan

On 20/10/25 18:54, Bernd Kuhls wrote:
> Am Mon, 20 Oct 2025 12:46:54 +0200 schrieb Titouan Christophe via
> buildroot:
>
>> As explained in the announcement:
>> https://www.samba.org/samba/history/samba-4.21.9.html
> Hi Titouan,
>
> duplicate of https://patchwork.ozlabs.org/project/buildroot/patch/
> 20251016182043.3395066-1-bernd@kuhls.net/
>
> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
