Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695E4C282D3
	for <buildroot@archiver.kernel.org>; Tue,  4 Mar 2025 22:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17CD1820A2;
	Tue,  4 Mar 2025 22:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BmhW0fRwQ3lP; Tue,  4 Mar 2025 22:29:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D12583065
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D12583065;
	Tue,  4 Mar 2025 22:29:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CC58D2
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 22:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2B9360B38
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 22:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WoHqJ3_roTns for <buildroot@buildroot.org>;
 Tue,  4 Mar 2025 22:28:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF6D260C08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF6D260C08
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF6D260C08
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 22:28:57 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-390dd3403fdso5213241f8f.0
 for <buildroot@buildroot.org>; Tue, 04 Mar 2025 14:28:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741127335; x=1741732135;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cjvMPera1wOTVuWxwefEucA9g7L8zGZ+mKG/tQC45cQ=;
 b=H+71F4oxCOmYfpAY/44RTH3uoJLjA61lyWXnHS6mS5NrzIhQct19uu08ln1CdLGoie
 R03pE59yULCrRQBNPNIFyQ/9UiB3JAuql0Ut1N3srV181prjYtw+cZh6dK8l2EXm6dl3
 r9Hs6asSKWlfNKuU+pdijqaHQZN8lzJwyqc8A6mhS1H0hncwQ8Qk9amQloUyyQbwaDFf
 7KStalcR65Ds3U39wirho/JeEXaJUsbT8FYMvfQM/JFI6nnyrVpBM1pIqzgPfESbxJjE
 PWtJ+BdPElpCg6G9nGyNSFE60Vd36Gcr8fmge3lvBv67MxUFpWOEbcsUCwxPeZ4F5ANX
 rAoQ==
X-Gm-Message-State: AOJu0YzLl1dV6SLbS/XEy0wy0bz49PvNa6chaS6t1kmdHid8Q4GObtFw
 kO09lSi8RPvKD8wG+7w0RrLPpU/DH7yNJH48kNs+ft1gDoJZgwxhKBh0ZlLDd35Vt7b/MtTIFpK
 o6As=
X-Gm-Gg: ASbGnctgyuQIomujxijcN09jad8/Jyd4SpP7DfMamovye9Fb4F0rvGj98RE4XWXXvuF
 kQXcB+fACGqwUGtdh/2Ji/jPEcN0hLFrwdDo50k+PLm8/19IOyAWFZ2nl+0xRM5XCYLRNRejOOh
 jNLTcHUFfpuuImhJX41HKUQkyDNz9L893BVkUK1EJ7+WtJ5g2LQebDUn4ABdCJi7kY3KPGeXR/W
 kBFXg56r0Bxwr0A4PNI3jM6k2b4k0W8CsHE6vCkgfP8OfS0j+41rMBhV1Dw8+ouxCvJoKWXoByp
 bOQEaN+IBe/ojFt7FL8ojTaKSdQ77Sc28WhoqA==
X-Google-Smtp-Source: AGHT+IHAC2RzRX/B+xI4pvBTAGTQ17LmyZWb22hL3wzVJ12c+COjxlztyXkW0wCM063M9OB6zgBcgw==
X-Received: by 2002:a5d:588b:0:b0:390:ebae:6c18 with SMTP id
 ffacd0b85a97d-3911f740b6amr358933f8f.12.1741127334921; 
 Tue, 04 Mar 2025 14:28:54 -0800 (PST)
Received: from [10.5.40.70] ([62.149.42.250]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4848252sm19081875f8f.69.2025.03.04.14.28.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 14:28:52 -0800 (PST)
Message-ID: <e5a7d90e-c7cb-43d2-8035-82565a81a7d0@mind.be>
Date: Tue, 4 Mar 2025 23:28:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Frager, Neal" <neal.frager@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <SA1PR12MB561598FDC7DDED2E1FC57054F0CD2@SA1PR12MB5615.namprd12.prod.outlook.com>
Content-Language: en-GB
In-Reply-To: <SA1PR12MB561598FDC7DDED2E1FC57054F0CD2@SA1PR12MB5615.namprd12.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1741127335; x=1741732135; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cjvMPera1wOTVuWxwefEucA9g7L8zGZ+mKG/tQC45cQ=;
 b=TaxzUzcORapQYT8lxN+Q3g4kvkN2VZiMHMwq7QyOk519BBsebRsXRNl59eKKprD1pE
 QjLaAtVJQ2KqNGoOPEbAASC/0nfj/rMd0yXwk/w2Zi/ut3YH4mIeQofreNhP5hmiel6b
 04iDqr7VVy3KFyK2oExNddraOyxhGzI5a1pFCSP8dQs3WBH15IwWlXPP+s5LpsvIbVnW
 XHK2yCxM11sDW0tnBWyIvMyJRpScoWdCWEgIQ/bNvc383rESpHxB/apGwFHS1qazZXvC
 G4LP+ty76hqcGAEaa06vxewg7JbCp1kHn0PEmKIzyS1HFkos3S25pxea1VSqN64Yj7Zv
 VcFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TaxzUzcO
Subject: Re: [Buildroot] toolchain-bare-metal-buildroot
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Neal,

On 27/02/2025 13:58, Frager, Neal wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]

  You know that buildroot@buildroot.org is in Cc, right? :-)


> Hi Thomas, Arnout,
> 
> I am continuing the work on the toolchain-bare-metal-buildroot, and I have
> encountered a snag where I am hoping you can come up with a brilliant idea
> to resolve.
> 
> In addition to needing multiple bare-metal toolchains, the versal gen2 products
> need the riscv32 toolchain to have "--with-arch=rv32imc" included in the
> configuration.  Just using the riscv32 tuple is not sufficient.
> 
> Since the architecture tuples come as a list, do you have any ideas for
> how we can handle architectures that have many options beyond just the
> tuple, such as ARM and RISC-V?  Any additional variables we make will
> also need to be a list.

  When all else fails, we can resort to hacks :-)

  The target tuple components can only contain letters, digits and underscore, 
en they are separated with dashes. That leaves us with a lot of characters that 
we can use to add something extra that can be stripped off and treated 
differently. For example, OpenEmbedded uses ; in URLs to give additional 
information (like the download method or the hash). And URLs themselves have ? 
and & to add GET data. So we can use one of these to have additional data, like

riscv32-buildroot-none-elf?with-arch=rv32imc&enable-initfini-array

(not convincend if ?& or ; or something else is better; also I'm not sure if 
it's better to include the -- or not).

  It is obviously super ugly, but I can't think of anything better.

  Regards,
  Arnout


> Do you have any ideas for a clean way to handle this?  Perhaps arch
> specific configs that we can apply in the config loop should the tuple
> match the corresponding option?
> 
> Thanks for any ideas!
> 
> Best regards,
> Neal Frager
> AMD
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
