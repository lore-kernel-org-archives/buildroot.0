Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32B1C5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B82A58125A;
	Fri,  7 Aug 2026 11:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfADES4JozBV; Fri,  7 Aug 2026 11:54:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB35A811A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786103641;
	bh=hc0yMfDw3lS/AcZx8DWkN/74XiYb2djzFftUFAwMMI8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ozsjLoDr5hFAGqVhjyxTcclb1iFdeleuNqtTrXVQf5nWuj4ogsJJ01y2ll+xsu0Ok
	 c5Qdrn/MCeDLPpkTX5imjUwujv1dIfYWzBlc6gDAYtILIuFc2lzyLT1gXEP9mZtM6n
	 sBZ3PxWUIkCrWoHwpNXctU4WFzhSE6t8EUqYfCCmaTmFut7zJ4/My+g/afNhbCEtKl
	 HuEsU3TkN86JNHoN8c86xfTK01YWf7PXxD4qmnpswy1Am8P74lcj0pE1v41FVVgRDN
	 EFs7zrjZMmHAJnMsG4YAgyOME6kaURvNoU9/6rDMn1RM0/QVk5N/gqSgFrdupDee78
	 huI/X7cmySrRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB35A811A1;
	Fri,  7 Aug 2026 11:54:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14606282
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE5D1811A1
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YfuRNuL2cNXX for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:53:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B1E28116D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B1E28116D
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B1E28116D
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:53:58 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4956869750eso24135665e9.2
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 04:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786103637; x=1786708437;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=a5Fwu0RisPUfKDIDNAKF4ga9ShKQYt6nL+L2KExhLQI=;
 b=LH2pooyjOrHdggpgJBOVQs4zlpM/bhkumgXgSnKohVEHHoIa1iooQ84u+txhal+V63
 YxFbN8x2c6i5qQxc/dwJCrPLfUjhTaOqYEOcoXt1x+7+nN94Tj0p6V10a216Ok8OYVhS
 fNibdmxREEWuTg9OosFuPcL/WZIW/hGcH2z2wsre2akUZzvxwsCtV0HiZEYpGsoDg70W
 pEK44YWVYi0n0XY59/LTE0y03gZo+eirPL9HKTERwS2S8621Uy8gEasX2wwhxL3JVNpX
 73mWNpfsU0pIrdqpmE/TJ2xmJKHXVx2xAS6JcQS/CW3wtKb9+ClZ7DdahwTDDrJ5IxCp
 BQ4Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RoEDv+4/mqrmOzoalhBMjOldaEKKnvXD7anE4YWOZQaRHn2YhESsfF0pHA4TBOU/Msnm2zpCe1gFX8=@buildroot.org
X-Gm-Message-State: AOJu0YzQBXdtGxvF+hCUiVPNAOZ9jEUDu0rbU2jSashztQ52+C3+xjiR
 p2/yi9LpLqnjj4iHtu1SbhO0sx3Nh+8LUHRFS994DsWyJYdThCDzQmRWQTlyZUVQiSM=
X-Gm-Gg: AR+sD12KtzIJiZscWtO+hBld33ioF3d9V09aDp1G/M5iZtD/BWgM9nkXaBA0kNjD73x
 ZSTTWu3TVpCYBsJpoGvHgZ7IVDiwe4nbgKYYyYK2DyMtV4ZQS5SiCo7oHzge6zFxe+3YF00w7z/
 mMbUej7sv98GKaZKbSFz+BNR6pJV3ADBzKHpNSKVMJHw7nv/kJEl4hSpXlwDPEGEWkdXTUmS5yu
 iToJwPARFCtHpW894+3WC0a7z2B6JiFkXnsBEz7Jy+aax9AgkbSpXdnDmu6+XBkioAWd7F4eXec
 CJpDuSokrVcdmdRlcezZrfI9D0XjFpRLnwf01vOLyvDgy1PLw7G9t1hB5fvweSHUXZDBVCRL++q
 388ubNEyHQEPRKkCq6WIXr5L9TMTw/c5UByaEM5JuQR32a3gGpjvSzUaBMFkdwVGbvU3rugNKbU
 EqSnqgGsojrGbQ7MmEOCeoh5xLTAdlaMCgpd9uS4luH+VHOsZH7zoG9bbYJ+U9NNMj/mJWcG/ZG
 Tz/KSEBQ68EuWE0Go2eugKuQNPXRc5L6/GCQm1Gy2LkbLSX
X-Received: by 2002:a05:600c:4ba2:b0:493:b6ee:fcb7 with SMTP id
 5b1f17b1804b1-4994e7d3434mr197967595e9.14.1786103636943; 
 Fri, 07 Aug 2026 04:53:56 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499542851d6sm157578515e9.12.2026.08.07.04.53.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:53:56 -0700 (PDT)
Message-ID: <a8a63d9b-fdc3-4e44-aeed-846d1406af93@mind.be>
Date: Fri, 7 Aug 2026 13:53:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20260726092711.212660-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20260726092711.212660-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786103637; x=1786708437; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=a5Fwu0RisPUfKDIDNAKF4ga9ShKQYt6nL+L2KExhLQI=;
 b=DVVgS6rYiXIglhGH78FkEpS6FFCaPUfIPv5kJ7451lAX0yW45B0QOpc6XFqngoOuw5
 AuepSp5Z907SdBUHC/YINAgHWMRTy9s+gKqBUpszkokQSxvqUh0GqUP4G7Y7WRv7aWBm
 tbx2u6QricSf7aiTvDcPhi4m+vNEaB0pUGJPaMu2XyUVz/hZ5WOlaEpCGShDqUxDRo03
 zYz0ZZnzUcHkABbnuQ4C1Qf5IoSMQqdYYCnnA0QVHshslIV3MMOacaf5bZPoTL+HL9TM
 arT9EY4/fucQWMx2tne8c74F7bgfTolkjFPi+2cQNQx/u4rAzMK9OuwCMeOjFOqZ0Mjh
 hwRQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DVVgS6rY
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

On 26/07/26 11:27, Julien Olivain via buildroot wrote:
> pyDAL is using xmlrpc at runtime. See:
> https://github.com/web2py/pydal/blob/v20260313.1/pydal/_compat.py#L114
>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x and 2026.05.x, thanks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
