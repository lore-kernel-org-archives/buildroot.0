Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76065D10F35
	for <buildroot@archiver.kernel.org>; Sun, 17 Nov 2024 22:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4409184AD0;
	Sun, 17 Nov 2024 22:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5BCMqKSMWhSX; Sun, 17 Nov 2024 22:05:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6249084A86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6249084A86;
	Sun, 17 Nov 2024 22:05:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E8EEDB3
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 22:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD200607A9
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 22:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mMDqYhxU-l_f for <buildroot@buildroot.org>;
 Sun, 17 Nov 2024 22:05:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=robertoxmed@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2D6486156A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D6486156A
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D6486156A
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 22:05:14 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3823eb7ba72so664388f8f.0
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 14:05:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731881112; x=1732485912;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n1T0crj7ZzkrKfIzFyIRgOL8BEQzcy1WG7s7nV0xr6k=;
 b=C0UEXCz5/xOHdw2UsSFQH617obsm4CLYy2HzA+A3R0U/kPc5g8ImHBXuivqqlZfD9B
 tYqvXLnFF/851/JItkaMDM0ljxwRUD3p4qEi7TMXFzLzFCi/q5yhR0HDNdJGwxPwuXX6
 QTecStBF22LPPHEYKM3wiQ4y+xDIS+fzNYCTXTaWmlFxlvRQZocUluljSMi1OTXuaql/
 JuX0TlmmF6lmZIlQvCryqCPNYRUZlqCEW1Rlf+n9C0IKiPm1KqWW+EyFTzcSHACLIlzj
 PYcuY2K5vfcaiCUy1BJohaZ3DbFXO/owlOdlzieZ4J/ucNm3d9x8AVED+NUICwVAVAcH
 5fqQ==
X-Gm-Message-State: AOJu0YxHPWEv0hBRvAiWgY91x6UnOobvepHqvNhvAQ6skOX8DoG1LscR
 yTgcW/1h6AblCdYBSAwCihw5k7os+n1ZYGsTAwzyd+wy2Q3/Sp28StWauoiQHx0=
X-Google-Smtp-Source: AGHT+IHZ4lurPEkuLNMYpILU8krB/u3FRsAsHymHr2qrKPOtUcnM/uqG0e9lyMXpHiv1QojJtcSG2w==
X-Received: by 2002:a05:6000:480f:b0:37d:47b7:f2f5 with SMTP id
 ffacd0b85a97d-3822590b8camr8170578f8f.4.1731881112181; 
 Sun, 17 Nov 2024 14:05:12 -0800 (PST)
Received: from ?IPV6:2001:bb6:11e3:a300:da4d:c63d:b184:11d6?
 ([2001:bb6:11e3:a300:da4d:c63d:b184:11d6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-382371a5646sm5424193f8f.0.2024.11.17.14.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Nov 2024 14:05:11 -0800 (PST)
Message-ID: <16261939-c409-48e2-b63c-12c8223acf9a@gmail.com>
Date: Sun, 17 Nov 2024 22:05:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, ju.o@free.fr
Cc: buildroot@buildroot.org
References: <20241025093248.2015508-1-robertoxmed@gmail.com>
 <20241025093248.2015508-2-robertoxmed@gmail.com>
 <20241104231424.4c39ed7d@windsurf>
Content-Language: en-US
From: Roberto Medina <robertoxmed@gmail.com>
In-Reply-To: <20241104231424.4c39ed7d@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731881112; x=1732485912; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n1T0crj7ZzkrKfIzFyIRgOL8BEQzcy1WG7s7nV0xr6k=;
 b=YZ/oo6gQOzT4zNvRp3Ptwkw5/F9Jix9BVJUCUQmWZN9NcLV4/C9I5KMto6051/Ib8z
 tVYrclDAHz6csYGcQg7BKAYOcL1Z0v6NOS9kiIxEcBjEhhlnUnOaFRfy0GPHZ296g8sO
 ajMeTHTCWIw5PtBr9m/NmOOfxc5oqYO6qkY+Ghfsa0d+CKdMsD8AOfxSv4stEltB9n90
 dSPYgiIjSNcDTPf08wi80qigqNwJN8erW/OXoEAoD8aC4r5YWlhUsAj2INYMqCngrs2D
 XeXVfjRXF+0NfHGKwuuIy0wPlqTwcWohco1layCjk7tYanzPO9PV56IWREjqdWeFNx+b
 zh7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YZ/oo6gQ
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/roc_pc_rk3399: Bump Linux,
 U-Boot, TF-A
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas, Julien,

On 11/4/24 10:14 PM, Thomas Petazzoni wrote:
> Could you send a v3 without this change to uclibc, or provide an
> explanation?

Had some issues building the image on the container with Glibc for some 
reason. Probably a bad clean on my side when testing.

Submitted a v3 reverting this change. Thanks for the feedback.

Best regards,
Roberto


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
