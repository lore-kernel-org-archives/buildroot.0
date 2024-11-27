Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4A9D6D23C
	for <buildroot@archiver.kernel.org>; Wed, 27 Nov 2024 21:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E510612E5;
	Wed, 27 Nov 2024 21:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H19h42chrlEN; Wed, 27 Nov 2024 21:25:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB04E612E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB04E612E8;
	Wed, 27 Nov 2024 21:25:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 599C6712
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 21:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29AB14324E
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 21:25:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1A1FJczaW4F for <buildroot@buildroot.org>;
 Wed, 27 Nov 2024 21:25:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com;
 envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0A11643254
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A11643254
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A11643254
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 21:25:55 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-7b65f8cb347so9764185a.3
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 13:25:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732742754; x=1733347554;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wNWFx5dAVb0tAQWx924y3LhYJpWHYK5513vL/u4XJKg=;
 b=eM5jWtSA2cKFFbuS7Ya7/XVQWMf6C5MfTpnMLM1RFvB0Q2eRcQaZqV0aleVLegE7fU
 6XMiizoCSukqFYCE3NPuWAkb6paAOckxHrZGaGnNHDI+HQ3kY8qS8x5LPXSPVBbgB0QL
 28oTNynDx+2GhMK/sQrTnLlJKjtSeshI7DqWKDGlqSCGF5PNuCZ0qvmoGVWq+QnPRd0f
 tfNJZhTt013XGWzXpE3kBPD0RWoPdpn20v4eekS7LY7vQj9oDHyn6p019UFTgKj6f4e0
 6A1WwfO5XNiaMOva8o9E6sStLoLDJgMe2XdVNYg0wFLVWAkrbE8IVV0428GETGj9MYDc
 XA2g==
X-Gm-Message-State: AOJu0Yy/J5Co5MNYrLbxSu8alCx/mbNd4qS3yhqufvgAKGDIe2m/doE8
 j1HgaIF85f7f1GR9TkTXAYgK9SjeAdzONgbvd5rJTIDOSo0qlAdA3vaapj3y
X-Gm-Gg: ASbGnct0DgexIwGW5wXlKcYSjW5LxFEwcNDi1bSa6Gmoo42vQeuON2a32CxVFsP99EY
 YqgTG7qV/K7H4s9wMobI6dEuSUvZgLSXc4b/wvSaVBzH5aOLhsdxJCD/TdxM89Px421pUei9vMV
 gtaGbOPKfvu5EPrRbTG5TgRA0D49LiljCKGmsctmoQD6HmFM8apm+h91HxggbrQcCQnp0j1sxPt
 OK8D9bR5jLAcGp8Qzw7mW4QW9P7moIV3GuoyJb8jxbgwj2RZvOFoMfXly/7cTYCiY3IBMFOsyEB
 T3rsXNFuvcIn
X-Google-Smtp-Source: AGHT+IEuH4QzSrc6Kbmd4j0KhGedCP7OIh1tlF/fCV8pxZ9TafVSUrVieM9mvDfcE+DbgXOErdb8WQ==
X-Received: by 2002:a05:620a:1993:b0:7b1:4e01:547c with SMTP id
 af79cd13be357-7b67c2bdfbcmr539890985a.27.1732742754112; 
 Wed, 27 Nov 2024 13:25:54 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b684955c4fsm1499585a.69.2024.11.27.13.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2024 13:25:52 -0800 (PST)
Message-ID: <07af05c8-d1b2-435f-a7bd-58cab9005b16@gmail.com>
Date: Wed, 27 Nov 2024 13:25:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20241115195213.633633-1-f.fainelli@gmail.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20241115195213.633633-1-f.fainelli@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732742754; x=1733347554; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wNWFx5dAVb0tAQWx924y3LhYJpWHYK5513vL/u4XJKg=;
 b=YQIlHmyVhTRFUTE6UR3kyXxKmTwR/qaG3/q5ZuCm4ytg9tuzSWnGaJ70kV97ZqcLEE
 idGjxsarZBbl0ed07+hKnrKJxLv1YRcf3KFKo6n1L3ZiFe2xczzq67b5mPHuneruHG7W
 5QRR0ssi8eLoqUW24sr9ARCZDYOJXeNIoQ3hzgiAxMOMkQs/Lz1UI7Y9yp1C6AkQIghD
 sY5TK4iwUeEXWE9Gp4Bg69Lvc9gR73lx98heipfXqj56VpunWYZ2LbQguYBTFPflrLh9
 qj6zJiGrBCsQLfYSmi4VhXWZ47LGFpkrxjjIRfZRk2EZzlEaV4N/m0B62jGM2xBizWby
 YoUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YQIlHmyV
Subject: Re: [Buildroot] [PATCH] package/linux-tools: perf: Disable
 shellcheck
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
Cc: ju.o@free.fr, Bernd Kuhls <bernd@kuhls.net>, mmayer@broadcom.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/15/2024 11:52 AM, Florian Fainelli wrote:
> The use of shellcheck within perf is not a functional requirement and it can
> lead to build failures where the perf makefile attempts to link in empty
> .shellcheck_log files:
> 
> https://lore.kernel.org/r/fb078045-dc05-426e-b21e-72ffae3e8e1b@gmail.com
> 
> Disable shellcheck since we do not need it at all.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Ping?
-- 
Florian

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
