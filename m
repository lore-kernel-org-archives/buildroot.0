Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAC6C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 20:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18EA461B09;
	Wed, 16 Apr 2025 20:49:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WMURRg2bIRDh; Wed, 16 Apr 2025 20:49:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5913061B25
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5913061B25;
	Wed, 16 Apr 2025 20:49:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54F00159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46B9C40546
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKZkDZwtHj5U for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 20:49:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 76CFA41AE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76CFA41AE7
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76CFA41AE7
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:49:18 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso78189f8f.0
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 13:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744836556; x=1745441356;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wGWMj9weraElyuI2TAghe3GiMBolHxrBxiQUmcDWWPY=;
 b=sTayKThZhaueoi9i0tcawyTJNe7/nMWxxeGrghYPkRJZ3BHNvbn8ia0vw2x9U4NN8o
 Qzn43kdzL9K0UbrLI9NiPTCj9jXK3GE+6q3ENCeS5Aq0GIYnY5Qq0e8mYUnTlGZVMZM4
 E4hSs9q13pZ0PiBY1IHBGOrr01xHfqb2XY/R2rt/W25cNHcLXy8FLj7QuQvu5ZyhK/on
 U9EKrp4xaSgVBgM3TttxFfe8kWomoP+d1JodCvj1FDZtyqZM46Hv8aqgbkJTFw3Xkrsr
 XCTXkHN5ZT5RWFYsGtlbuzFo5as8n+wUV5atovy8gWxrMvjlPbr+0vK1U/GMA65tTPAZ
 3WBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTWIZiOHXM+gCl1Cuh9fS9Z5bUGwO986sj29w7BE8SK+FYicCAlNiN9XrAXTymUCEMpMDUQDfNMj8=@buildroot.org
X-Gm-Message-State: AOJu0Yy0u+c/4Lc9vigNG3LeGrh4LkBhMPQ9RYgKSCQ5a931+1qbVKV6
 8nNQKQqYa93RMl+yeS0h8oZVGrq+f322nnZqVE4SmDO27fo7sV5t5H2naY5rUD8HDJgWPOIFAao
 a
X-Gm-Gg: ASbGncsy8aG3ZAfaI2hWY88Arx9hHcnyeQAuuHvnVPvYpNym5Giwd1UaOWniEkJ3gyq
 DHf+JKizfCl6QqWZbM34lWPPVBJ87PmRA7wE0V1KJkgvzi2AFW3o3nHhrqkVzeY2wN0fcm3nmh3
 2IV/jXLmPbT7dCjVy3xPd/xB0a6D64BgwFhzOkcFYZUt/ZJleKrK/i5Cp3eKPk16mhuIYpCdjD/
 HPGUis2gp0h3a6Zev+5FlmPAto3o1kzQR96uRanhDP1F3sKatxYFnsq9RN4EfGcNNprTxmfln3E
 2gmeJioWke07gjLwIPmVEYNwBlkOZLOlQEJs7QYyRuQIcy74kN42L7O/
X-Google-Smtp-Source: AGHT+IFpmYCuEHiKRcRdjjVF00Udqnx4Y++XryKK30dF+QKdeaKgToIsjEqpv0nqVUo8dnPZXCTNlw==
X-Received: by 2002:a05:6000:18ab:b0:391:bc8:564a with SMTP id
 ffacd0b85a97d-39eea303febmr214566f8f.22.1744836556422; 
 Wed, 16 Apr 2025 13:49:16 -0700 (PDT)
Received: from [192.168.4.20] ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43cccdsm18019818f8f.79.2025.04.16.13.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 13:49:16 -0700 (PDT)
Message-ID: <221f0412-b320-4ade-8936-9ae8d941ebf7@mind.be>
Date: Wed, 16 Apr 2025 22:49:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250415195547.199428-1-thomas.perale@mind.be>
 <87tt6o3oxx.fsf@dell.be.48ers.dk>
 <065809af-e4b6-4bd8-9f53-49d39fab38af@rnout.be>
 <4b029329-2258-428d-80c9-315dbd6335be@essensium.com>
 <20250416215812.6a8ae1a5@windsurf>
 <b864a02f-c98a-48f5-863a-a7bd800809f6@mind.be>
 <20250416224034.3eb04598@windsurf>
Content-Language: en-US
In-Reply-To: <20250416224034.3eb04598@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744836556; x=1745441356; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wGWMj9weraElyuI2TAghe3GiMBolHxrBxiQUmcDWWPY=;
 b=Y4R2sn5vNOt0tHhnWmPPq+zFtLk3qOhQoscZwrnIJ8G/5WcNptSQCPFSb83MnSY8ss
 iVER6olGx4Ba4W9P2n3yqsPnPDsZhvx9J7EfysdZ5V2j1zjqW7NUhxWAN/2IIRe8lfsa
 WFhqqncBJ1tLr8ygcKaKCI3XZOi3Ko9nSmVCIJMajOPD9mhQpYmAb8X0jzloCcwWYQC8
 tjAt6GmNcIAvYt+hRXt+6TwXRpLJZQi8yPnFkSJTWr6hXbxTuxoWNzzP3kep2DM879F9
 fJ5ht2UVbhel9orCSY692gIR/53S2qeL7YZtZbKuXByeuh/B2teKHZ7CVqzJtz5pNnia
 /QTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Y4R2sn5v
Subject: Re: [Buildroot] [PATCH 0/7] Add PURL support
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
 Thomas Perale via buildroot <buildroot@buildroot.org>,
 Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@essensium.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Just to say that with the PURL added to the Django package I got 
notified for the CVE.

On 4/16/25 10:40 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 16 Apr 2025 22:06:17 +0200
> Thomas Perale <thomas.perale@mind.be> wrote:
>
>> DependencyTrack uses NVD annotation unfortunately.
> And? Sorry, I'm not sure to follow you.
>
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
