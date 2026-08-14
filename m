Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D8EC5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA5E640E82;
	Fri, 14 Aug 2026 14:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-LILaNZN6rV; Fri, 14 Aug 2026 14:22:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19A0040E71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786717341;
	bh=isW29oJTcvCBbDQlSwgTUFiFDAF6eaRt5giqxlKI268=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EJruBurVc8TuNRmiYogqmDOKmudYDEUf1CgDbEXfEdCA23xPtYq4d9m46aXnXI3eA
	 8RoypGIGFUs55gtbQLf2X38DEHhhnbVQwmfEPj+OBGZ5RIFbzQBDdwf3HeEw8eOmgT
	 tR6/SHA/6ft9V7bWHIjh3WBtNjrMlnyZND+s9ymTSOexobx/cK+kjrEOFBgwIRaiMc
	 G3ag+DHNTew/YNR740l/burYd7IUQa5EnGYtGv/mScHQSxl2BS2eRCfgNB/wfyelwW
	 gHRaaajICgOMYPlfoZL/csLUtn6UrfXsD9A0bHr4zIDSbZHXen9YjORVv3jAzox9Yb
	 56ypTT0D1MqZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19A0040E71;
	Fri, 14 Aug 2026 14:22:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 607F23A0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5288340E71
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:22:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JWeqxPEumxl for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:22:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 552FC40E70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 552FC40E70
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 552FC40E70
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:22:19 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-47fd66a094eso424449f8f.3
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786717337; x=1787322137;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BozvKZppp/rwiCZiYB6vq3VvZrX+STdfYbQ3YwlIOmw=;
 b=Z6r3g9t9W/vkYtqV9z1vZff9D+nD7nWqKUb6NrchwZln8w9CgFvFfNhpc4hLAlPc8/
 f6ajNJonYapBvBJt5EnhH7dIbtFDvseBvECDy6H1HHGWhveKolfbeFduiVZhCPXL45ko
 vWCj+YchtXnBxxjmopkREGi9iUBvPD5bsEgUMUORfWXXqEI5n0RwMVOf7uOXp48nRuHN
 OlczJmf2vzv3lV2kTRfm5cnTfbYUx1Lj+7QnZ3oHtCPapPxr7lMDIuVJIjpmQJ5hZPTV
 FpgMovD28Eosrg5ebrqIH2FREd4qPz30JZ0+VTEze2Fz36yGk8k4hHYt7ODNMzq6UVq9
 r4Ig==
X-Gm-Message-State: AOJu0YyhRHjMpAxnTdw/O4mokzd64Gu2ecXiXhCYbJlsGH50vGRf3ld+
 9sP337olminmzxS0cfnUWIoa7XmHCgUijAdNBFBJC4rMszhN+nNmQ8yfRphOFsX21bbd13NhAfH
 qh3PYYz8=
X-Gm-Gg: AR+sD1306SJf6nIrAQrqaJ2qeB2gkaD4gZbRWh3sG2Eb9lYkJyiEoX/3a52JCPqCAZG
 i8i49ajPCgHFLTKlyWIwJv7BO5JxfcDKzrKMoXs0/FF6LCGprPKIu2LbhJuPbbvO7r0UA05QsZs
 /m04IpzlMcARix1UMLH5Cai6SKdrIt3iMyCvbrCd6WwMWHZ+npbT411JUVRx7QKOjNWsSBOdduh
 /Od2Qtplq1z0tEZsd06Vc3E8XNH0r0JZpgLCKQgP8LxFoT0Ob41roPSvH+S6YNAZWHunmYEKUJ6
 nM4DRbKPMjufmxzHLtUp02AAIVf2NI3RzVP84yyQQurF4925aQH2JR7Pz/amYWtcGZfsHgCLk8a
 B5/cdr+OyiCDh6CoRBmMQgRJ0zVg+aqm9669G2Zv4xsy4Af7X/KpRD+V+n9Sjs3TM2M20vd6Ao1
 GfPGXbyOfaxOJY196NHz+vVk6OrOxxd4AKvL5vIQNuSlAtv2mRqq61b3Gs1QpgJ4t8+hJAfC4UH
 EB3nN4unMFXCJldsVpP+QBJT88tkG4JhP/Mk8Ga1JcOTArH
X-Received: by 2002:adf:e28b:0:b0:47f:9de0:c27f with SMTP id
 ffacd0b85a97d-4816071c574mr7066581f8f.1.1786717337312; 
 Fri, 14 Aug 2026 07:22:17 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f20059asm8018666f8f.5.2026.08.14.07.22.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:22:16 -0700 (PDT)
Message-ID: <1e3c4b9d-5c3a-499f-9771-a2a407812af2@mind.be>
Date: Fri, 14 Aug 2026 16:22:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, James Hilliard <james.hilliard1@gmail.com>
References: <20260726092711.212660-1-ju.o@free.fr>
 <a8a63d9b-fdc3-4e44-aeed-846d1406af93@mind.be>
 <6e608820fd7573c7acfe09e92deda3e6@free.fr>
Content-Language: en-US
In-Reply-To: <6e608820fd7573c7acfe09e92deda3e6@free.fr>
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pydal: needs python xml
 module at runtime
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

Hello Julien,

On 10/08/26 20:31, Julien Olivain wrote:
> Hi Titouan,
>
> On 07/08/2026 13:53, Titouan Christophe wrote:
>> On 26/07/26 11:27, Julien Olivain via buildroot wrote:
>>> pyDAL is using xmlrpc at runtime. See:
>>> https://github.com/web2py/pydal/blob/v20260313.1/pydal/_compat.py#L114
>>>
>>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>>
>> Applied to 2025.02.x and 2026.05.x, thanks
>
> I saw you included other new runtime tests in maintenance branches,
> but you skipped the pydal one:
> https://gitlab.com/buildroot.org/buildroot/-/commit/67d6e6602fec095084f64560050cb1195dff7765 
>
>
> Is there a specific reason, or did you just missed it?

It was an overlook from my side, indeed.
Now applied to 2025.02.x, thank you for the heads up !

>
> Best regards,
>
> Julien.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
