Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FBEC83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 18:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79C2340B56;
	Fri,  4 Jul 2025 18:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPqzcDo7c0zO; Fri,  4 Jul 2025 18:41:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A151E40B8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A151E40B8E;
	Fri,  4 Jul 2025 18:41:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 311A57AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 18:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22A8640B8E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 18:41:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ml4EprSBdoiJ for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 18:41:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F9E240B56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F9E240B56
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F9E240B56
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 18:41:10 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ae3ec622d2fso202685266b.1
 for <buildroot@buildroot.org>; Fri, 04 Jul 2025 11:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751654468; x=1752259268;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w79dV8nBzWFadoXVR3fRxUTkiLsue+gQnGmFpGMUSEE=;
 b=vG8dDInwaZV5+CVWdPlJQQi4Lmxs2P8k6Fsbx7zPmlcA9YM8irWd3NiEWuyeriK0jh
 uZ7E9VYJDjkx/dJc2XRgGvJ0+iGRtvz6mPNZyDyYKWjw8J2yLHPpVq68+JDdUdD8GdGj
 xvXA3L/7016K6we9k3L9kChfRA5XHxMIoyWy1D4oL/LUxS/f4M892vgaMx9jHJ0f8/GY
 XCcXVTb6xKQWe2FV51tYKY/Mws85T4KajPLILt5p+OA6f3BFOpC/MONqxPfD1cFW/vZ8
 0+0V1CqqF4CpqDWQ48cbeu2fD6obvc+zxrvggyiuETESZV4AkhdB4CPcye9LnPTGaAgW
 Ppgg==
X-Gm-Message-State: AOJu0YziwTleC99VXAuxWxnD4cwjbLVW5Q0PKwkTBlqU/5YxKHwvcDrj
 uCTKBqll2we4nxLb3Kj58E4sM3N1bfV8UY5/JmWSC/Q9+0n5KP48SPCi60FK5o0I/B4=
X-Gm-Gg: ASbGncvJBvN3T/63CnDeknFfFe3Ctf2jTNcPcry8RjUgDv/DErRwJGGDto31swUXFJ+
 KtEotfGTkk3p1g2eqfVcGJGWWW3g1tWQkJUKEAyDDYb2DxibFLpcAj2a8XhZDDazxwX2IfDR45p
 f7e91fYYJJtF8YFweVl6SfDY/+qQbQ/fyV/b2beY7TRHrVTXEsQwYuW1b5a5swxE3yj1tbos6+U
 qEkxHcmwttWBORIWl2kTdGAdO5RVdA9jvx82Vw35qNfYlAw9QsxjOhq4ElY9qPjnCqTQBg+K9oY
 biWEZnV6BnN3yiNgM1dQ1K3Kwfjsuzbdo5f/fSh7Ruw0w8AoiCmc/irgrHdAh3pbkH2y49D5UDx
 6TFf76tFbn7AEIwqwrAXgr6MoaOyYj5GXrtT0D0x8BkAhbQ==
X-Google-Smtp-Source: AGHT+IH2XjoxfzJN/NUaOkGNxC40GH3cDz0BlDTjrD0dWK4qloN59o5Xbb52D5iGuAl+VZ53H17wkw==
X-Received: by 2002:a17:907:961f:b0:ae0:ab3f:36b5 with SMTP id
 a640c23a62f3a-ae3fe457c8cmr368394566b.4.1751654468150; 
 Fri, 04 Jul 2025 11:41:08 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:639d:e501:5db7:a3a4:443e:4828?
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f66e7d4asm212299766b.23.2025.07.04.11.41.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 11:41:07 -0700 (PDT)
Message-ID: <a85879a1-59d1-4569-bb58-bbf71dffe6a5@mind.be>
Date: Fri, 4 Jul 2025 20:41:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 thomas.perale@mind.be
References: <20250702151228.1641390-1-titouan.christophe@mind.be>
 <20250704092142.1885856-1-titouan.christophe@mind.be>
 <65c67a53be84ac80cad1b880a956e73a@free.fr>
Content-Language: en-US
In-Reply-To: <65c67a53be84ac80cad1b880a956e73a@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751654468; x=1752259268; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w79dV8nBzWFadoXVR3fRxUTkiLsue+gQnGmFpGMUSEE=;
 b=L3Vp5rFPjbXzrkqEkInCEWK6UI+315rwCFOC/l91LXuoirIo33DYNzca7r6wMa/y0+
 U+1GPS/EEEX4n48oZZyQxJLdZ+Qrxskev8mA6t2i7Kxb3PBZf8bZfPrFe1Wowls5KbLL
 hxZ64WS8ZpW1FwGgXUM5YkYLx9vOSsnpTEBCmL+kRy38nFCNUlEncN0Xw5JpfqZorGFa
 fiFJV+myjEBVnVCMwTXrZPiHTRcpOm+MnD6kKBBzNWFjYaPm7fXX2awD0HNuzn/VrD3i
 mqwoOwTsUH89wwEZiMi9GaDz+Um6f9YvXBP/wItJt7LkRSecO5aAM42HuCVfpjtSSfAS
 8pfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=L3Vp5rFP
Subject: Re: [Buildroot] [PATCH v2] package/libsoup: add many security
 patches
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

On 4/07/25 19:02, Julien Olivain wrote:
> On 04/07/2025 11:21, Titouan Christophe via buildroot wrote:
>> Import all security patches from OpenEmbedded for libsoup.
>> This fixes the following 18 known vulnerabilities:
> [...]
>> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
>
> Applied to master, thanks.
Thank you for reviewing all of this so far !
>
> I saw that the last package using this libsoup (v2) package is
> gstd. So maybe it would be nice to update it to use libsoup3.
> We will avoid piling up those CVE fixes and could even remove
> this old libsoup package. 

Yes indeed, this is what I would have liked to do. Unfortunately, 
libsoup3 seems to have quite a few breaking changes compared to 
libsoup2, and updating would require some change in gstd itself.

On a positive note - as you've seen yesterday - gvfs was in a similar 
situation but they moved to libsoup3 upstream, so we could remove one 
dependency to libsoup2 in Buildroot already 
(https://gitlab.com/buildroot.org/buildroot/-/commit/3ea1225d4f73025e8ce42264835303a8790c0d01)

> Best regards,
>
> Julien.

Have a nice week-end,

Titouan

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
