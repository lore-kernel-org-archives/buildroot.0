Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD3AC3ABC5
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 14:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01159411B7;
	Thu,  8 May 2025 14:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mry0o9hh_uzv; Thu,  8 May 2025 14:29:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FF6B411CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FF6B411CA;
	Thu,  8 May 2025 14:29:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 587CB1A9
 for <buildroot@buildroot.org>; Thu,  8 May 2025 14:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A01460672
 for <buildroot@buildroot.org>; Thu,  8 May 2025 14:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L33XxgoMNaCc for <buildroot@buildroot.org>;
 Thu,  8 May 2025 14:29:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C8B2C605E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8B2C605E0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8B2C605E0
 for <buildroot@buildroot.org>; Thu,  8 May 2025 14:29:16 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-22fa414c497so10242205ad.0
 for <buildroot@buildroot.org>; Thu, 08 May 2025 07:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746714556; x=1747319356;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=og4Q6LpPNEuOQ2uXcuqc3sQ3G1us+G0P45PRx9DBv0g=;
 b=nMhwBXEr9PVKLkO2j0njs13ytbmhcxO+NxoqaYE7ucF4qDdPJBEYKDhnwk2Z9FY/53
 ynvvr/tcqryLbraawUOQ5v7FuURBI2ri9NNcFVJfj0kxlXrlPrStk2r9eETmQEB5OfbG
 ZWFSS3xHxpzsHPA89tnVCoVFwdlcmK+SCf3TQDBO+pUVoxtKUjn+Dv6VvRfg+6F/2a+A
 qRK9hL1PygUysz9JtD/GaxD6ZmyJ4jSU15BJQZu0dtutxMKNIAESRiXZxCzZNRKQWh3x
 efTWjS0jU2uww5w10kKEuf8TYMpB1Wfj1C2rPCuE/0TKSXR11C1cbFE4RoplKH5SxVnE
 JKdw==
X-Gm-Message-State: AOJu0YwfeXRRIeBvNtO+Fcgqi74167uR1FUFG3OJ/P1pQJEwHQ/hOv5+
 29RLJyoykejSnXTyUSLwQY5DlU2hVVMg08/jBQ/fm3UOgLWVRP3tcqVQvQ==
X-Gm-Gg: ASbGncuejoc6cTAsw37ZktGqY8X+E8X44KuZndv7xl7oP802Fm+ARfvndrKRv/MT1hy
 Ux70iNwyz+vCx10V/1WsfxPMCwiVuwYPZ0FiM/umDBaA9Aav2KrAqYSyRyRBuDSnmfrKIL3mGXC
 UWbMxxXn+Jamh7/YXl2F7KErJeKfHCbkRKs/ALHSCI/ys6tOcq7ElWEWy5SLwMm9RvtK9iF3tM3
 /K9CWPpBMZH00qShqQkEeMNtngYzYuNcLv1OHdH608aHyArM3LDANsddoM3mYqNLMoOKxVEiD2J
 1AZUztr7F0BbzS0Fc6YJNsVmwhAiCY3BS7U0/ofBPfggNyStuEbYDAdrHw==
X-Google-Smtp-Source: AGHT+IG2y/NHsxt3AMEt/9//QIlAFWbm540JT8vtn8gzxCKEx+valaB02XOGNTCBFssEzRzpmAA9Iw==
X-Received: by 2002:a17:902:e78c:b0:22e:4dc4:5e91 with SMTP id
 d9443c01a7336-22e5ee1ecdamr115239675ad.53.1746714555858; 
 Thu, 08 May 2025 07:29:15 -0700 (PDT)
Received: from [192.168.4.69] ([76.8.199.226])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e6268f59bsm35268965ad.38.2025.05.08.07.29.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 07:29:15 -0700 (PDT)
Message-ID: <2b0ae9e9-b4f0-49ca-aef8-1d769780b231@gmail.com>
Date: Thu, 8 May 2025 08:29:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20250507231902.14cbc9aa@windsurf>
 <87ldr71q08.fsf@dell.be.48ers.dk>
 <CADvTj4pbysjPEsS1bAvkHSPTdW9ePHFpfybqg5Zb2Xkv8NnLgw@mail.gmail.com>
Content-Language: en-US
From: Lance Fredrickson <lancethepants@gmail.com>
In-Reply-To: <CADvTj4pbysjPEsS1bAvkHSPTdW9ePHFpfybqg5Zb2Xkv8NnLgw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746714556; x=1747319356; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=og4Q6LpPNEuOQ2uXcuqc3sQ3G1us+G0P45PRx9DBv0g=;
 b=mxaB40ysElosIuPeNr+0tYGyyImkrGjZ9iYmnef0uzbkfDnvdhx8z1/j5FDQpQldnh
 tQ70S1cBaj7dRcNDBKH6/KsgUG6WoJy8vg6yFW6C+WETctC6mcdE6jTGiz2PJKAnD7si
 WeyPC+OOHit65Pm2i/1td4CwDi4Tj+VsybtdCLNZYy/SRHiFn2cemEFqCl9S58UJkXNE
 970JgZQtRHIpaxbqCpQPwCEflr9h0XyY3WGu6ksuJ5jWoRCFPfEA7ptpBPHuttqHvWB/
 6CYMagVYxMVx00OXFprvH3Xkwy5+6EV+vOZGoozurf7aHNdVaXThDDq1qDj4iRgPq1S7
 F2eQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mxaB40ys
Subject: Re: [Buildroot] Grub security situation
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

+1 track debian for what it's worth

Lance
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
