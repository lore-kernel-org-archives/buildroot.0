Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6566EC36008
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 19:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED51881CEF;
	Tue, 25 Mar 2025 19:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YhfpHQ6gq4an; Tue, 25 Mar 2025 19:57:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24F8281E0A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24F8281E0A;
	Tue, 25 Mar 2025 19:57:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29838E4
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 19:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 105C840480
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 19:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dniGRVCz6hIc for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 19:57:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5FA6A40A82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FA6A40A82
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FA6A40A82
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 19:57:29 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso50766905e9.2
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 12:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742932648; x=1743537448;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kHoI41XyDjXlUDEih5bXsAN2ZbmmFTPAdEEeFBWQxqs=;
 b=R4mMkeABtqOLPBFSL5jTfxbKbCdm9kl08dSYPBCIJcsr1qiIfV8OwVtEZEvHB01fyK
 vgoW/i86CtBMhgAM6/xFbnBq831L9paCc1GJl3NvMcA2aFSctmj1PBoNpeFD+sj8VHhc
 3VWsnDC2Y/auO4ZItpK26fPFGnQ+Q0jM0dMO7s9jA14oHbK4LzIab9zlcQnmBGUbtrc8
 mr0LqV9Hlp8/FimwQ6PFTrtUB8eRoXQbjPMBn+C7xJRnmNY/ANgpij+tFzewSM+yFYYL
 b4wpImllfwM4GyPWIL2sPC+f8/lYtAAv3/43mMaLckTg18Pas7BPz1RnsScl2qV/nzfe
 bJBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBsHyGLlUXSTZstCzWqS7e/g6nySvBTPkGEHUBHYKcnwuJKKTu3URrbSu9OhC3nsd1qs7RPCwxXbY=@buildroot.org
X-Gm-Message-State: AOJu0YwA6J9dWnGvBn1AT3GIlzSYlOsl5qIKlP5Uw7QZy/Rf1456lwKy
 bF0F/8RPxLdC6bc0EV/YourfQ5ECAWIUldhU0fJNgzlqtLf+3hv6SXjoDztiF89rRPGDxgtVArb
 8
X-Gm-Gg: ASbGncsuJ/bQJw6f0hBDLdX4uX/nugCDWTxelgSizGNl6CnoHRk1kwajw357CbEL8Ij
 m7gEs0/PQP3J8n/TH8EQ48dYtjG1JH0opzfroQ/xEMRabOn3R8xEFy99mcJPkVM1jVGDSAupj//
 olsrkTFfdVC2mGME58do/TmOVASDd7j4cIpKl4U67rZN2LpCLuRKksEr6sgtED9JsrgtaupPIu9
 3YM5cv9aMgaLJHDY5IwqBwP5kX6+TIuSMd7BtUzyPNG6ew8GnhRRHdMk+ehbBtt/cL281HtCUvv
 rKz24hmzppXKovWkvkrbGIm5htQUYw3nkxW2+OXV8P0YHw+hbxDaYCpqdL6l4/wRfLY0EvGDAvE
 NFv3PW8BusVhcjd259Fh3dBM5BMoSBSiAGQ2icS0nBwSMlP/OaDUixuR3VdJ2PQ7Fim6goHaMue
 A=
X-Google-Smtp-Source: AGHT+IHMF20vwSljkt9SSSX2OMYFZLn1zwQhHTyWy7ZvBz3Mrb+YHKCya39H6VQ/LcgHuEIj7cU9Yg==
X-Received: by 2002:a05:600c:b8d:b0:43b:ce08:c382 with SMTP id
 5b1f17b1804b1-43d509f6797mr185431965e9.16.1742932647836; 
 Tue, 25 Mar 2025 12:57:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f556a4sm210594205e9.22.2025.03.25.12.57.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 12:57:27 -0700 (PDT)
Message-ID: <4b2f5741-c3c7-49d3-961e-06cae12836ce@mind.be>
Date: Tue, 25 Mar 2025 20:57:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ian Merin <Ian.Merin@entrust.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <BN7PR11MB278825F154A3B6A0FDB55E90FFD82@BN7PR11MB2788.namprd11.prod.outlook.com>
Content-Language: en-GB
In-Reply-To: <BN7PR11MB278825F154A3B6A0FDB55E90FFD82@BN7PR11MB2788.namprd11.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1742932648; x=1743537448; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kHoI41XyDjXlUDEih5bXsAN2ZbmmFTPAdEEeFBWQxqs=;
 b=VDe11V59Gk454O7+FRfnDGXlzuSaRKZkWO9o7BYKNe6C5iyMgevL69YuOn+Bw+9rEW
 JLgCebgFV93+KVrDbASAcldt8JMLGJ4rKdw5X9XLBRmwX2acn6WK//G23WAmS2wUQtIH
 WJEkUoJK6avkFh2gAauxG6zd84JQV1tGScf4zomHmPeIcH12miHjkOOx1rMBO0q67BT3
 wVpzRpjOwBL18v4AvjZkDqfhF+YlhAZd0xNj/1No0PWevsSnfyksK0yZ8R/gXmB8VMrm
 0IftjKTJ1xKY9UG1P+24c44MuVGQ0EK72Lthpr/gdBq+dTSY2h6wRXNh9iClYiwcoG+G
 Hq6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VDe11V59
Subject: Re: [Buildroot] Apparmor.mk references libapparmor variables
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



On 20/03/2025 13:11, Ian Merin via buildroot wrote:
> apparmor.mk is using ${LIBAPPARMOR_VERSION} in the source URI instead of 
> ${APPARMOR_VERSION} as it was previously
> 
> Is this an expected change or is it a copy/paste error?

  It's a copy-paste error introduced in commit 
5649202ddccdbc4d6e2a6aca8330c0846d9cd999. It happens to work because the 
variables where it is used are not used in := or ifeq statements - but in 
general we don't want to refer to variables defined in another package.

  Care to send a patch?

  Regards,
  Arnout

> 
> 
> # When updating the version here, please also update the libapparmor package
> 
> APPARMOR_VERSION_MAJOR = 3.1
> 
> APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).7
> 
> APPARMOR_SOURCE = apparmor-v$(LIBAPPARMOR_VERSION).tar.gz
> 
> APPARMOR_SITE = https://gitlab.com/apparmor/apparmor/-/archive/ 
> v$(LIBAPPARMOR_VERSION) <https://gitlab.com/apparmor/apparmor/-/archive/ 
> v$(LIBAPPARMOR_VERSION)>
> 
> APPARMOR_DL_SUBDIR = libapparmor
> 
> https://github.com/buildroot/buildroot/ 
> commit/5649202ddccdbc4d6e2a6aca8330c0846d9cd999 <https://github.com/buildroot/ 
> buildroot/commit/5649202ddccdbc4d6e2a6aca8330c0846d9cd999>
> 
> /Any email and files/attachments transmitted with it are intended solely for the 
> use of the individual or entity to whom they are addressed. If this message has 
> been sent to you in error, you must not copy, distribute or disclose of the 
> information it contains. _Please notify Entrust immediately and delete the 
> message from your system._/
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
