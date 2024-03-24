Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3784C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E5C7404A9;
	Sun, 24 Mar 2024 15:09:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DHX0jEGJIO47; Sun, 24 Mar 2024 15:09:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58239405F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58239405F0;
	Sun, 24 Mar 2024 15:09:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 33AEA1BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E2A7402F5
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqPRdmhdu1WR for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:09:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2966B40004
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2966B40004
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2966B40004
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:09:22 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4148863c863so1936075e9.2
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 08:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711292960; x=1711897760;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UA+PB1nEa+/401bteWiyHslqsP2qzXqCQU6OUSBEQ2o=;
 b=q4FvAeXH8DJDiSe76mPlNMu8Yh2kgmIDiu71VrY6JAaBPV979rrRSg01HufIVrykvX
 tv95br63rVKgJvSG/+Mi1M+JPMwqfwZPk//mF0C+iJUu0XAlxX+OpX3bzbUebvDh/obG
 Z2seKMM3/r2kM4F1axAfpY1Z+1racuFv+jLrS9hOmCbD/+eMrHA+VFjY9yAhVbzfW9eb
 MOEHGxxcRKrXdS9sqIT4Kgps6La7fBxj9OrEnbaaby64+ircSlPc73DGGXYxbNdur+PJ
 BRYlMf+gGp9vAyU7tlhwxBPZbtaemcfs13ynJK67U7FsQFbq87sgFWRo9I8Hgm7b0Zj9
 NVgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlK4rEvJwJcYQrqPs7LOpse3cLzHXkKAGuEE04BSWbkSbcuBm8EJolRkAXcYiKiMfA/ExmBSNSRxy3zNvGuO0xEG3+am+ekA==
X-Gm-Message-State: AOJu0YzUCCvUhNy18TWNKKTGSHT+9MLawMtaDiwyncO6GWazHAWtjZ9A
 BlUKx80ITRV1V3ryQra9D/Szjzj/NoaEwZ8W1aPQVatvBkwdEJstMul8Tf2o5gM=
X-Google-Smtp-Source: AGHT+IEAfDAHDUJHc1PB2jz8Jn1a5XIZ5MNOofM0j1AvDJB+Bxn+j0ELC65BexFU61a+zTqkWFhN8w==
X-Received: by 2002:a05:600c:4445:b0:414:5ec3:8fcb with SMTP id
 v5-20020a05600c444500b004145ec38fcbmr3695056wmn.23.1711292960179; 
 Sun, 24 Mar 2024 08:09:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 x18-20020adfffd2000000b0034181bea3b0sm7035705wrs.3.2024.03.24.08.09.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 08:09:19 -0700 (PDT)
Message-ID: <ef00a5cc-d7f9-4574-a4de-76b22c954014@mind.be>
Date: Sun, 24 Mar 2024 16:09:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240324085836.240068-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240324085836.240068-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711292960; x=1711897760; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UA+PB1nEa+/401bteWiyHslqsP2qzXqCQU6OUSBEQ2o=;
 b=exb6IRo7ROUBP/snRXpv7yl1ZasmA3dgupSQVm52fOgn7w7kxfVP7MOFjP92cZ1Npv
 bGMoJA2sIo7JQidN0kiwqtyJaFqzLGOy1hVemTBblimGjJ/cYXSr4BAgTLfrRe/W6C3t
 PcBgV+ftVEPB7pa+LUV02m6g7/REzsnnhjlZCwvtstIbf5k90d6ltPijVpEFZCRE2KJo
 zzBQIJcGQvTbQIVe8IBXO/0TlrN5soy4VxxsG+VDcARJBxJhDgskykfvoTpXgNvQvm2o
 WU0Fs41kF3moxWwROlO8ZXCBbTQ6x816uCm1vjimAGuPRBHaWQxZ9yXz1o7MkOmnw5mS
 q3TA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=exb6IRo7
Subject: Re: [Buildroot] [PATCH 1/1] package/libtorrent-rasterbar: bump to
 version 1.2.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Philipp Richter <richterphilipp.pops@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/03/2024 09:58, Fabrice Fontaine wrote:
> https://github.com/arvidn/libtorrent/releases/tag/v1.2.19
> https://github.com/arvidn/libtorrent/releases/tag/v1.2.18
> https://github.com/arvidn/libtorrent/releases/tag/v1.2.17
> https://github.com/arvidn/libtorrent/releases/tag/v1.2.16
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libtorrent-rasterbar/libtorrent-rasterbar.hash | 2 +-
>   package/libtorrent-rasterbar/libtorrent-rasterbar.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
> index 3f59642b72..b1abe85d84 100644
> --- a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
> +++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  c8ad8638684c0a903ebabc30490079e31b1a6a638da2adec5a8bef6a0e62214b  libtorrent-rasterbar-1.2.15.tar.gz
> +sha256  eee8e99548dc5eb5e643e49db9202f4f97112c032dba883dfdc8144af5b6e40e  libtorrent-rasterbar-1.2.19.tar.gz
>   sha256  f3a5dd1558cce616b12edad521427ec8976ce2bb0af33f7f359cfa648bf55ad8  COPYING
> diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
> index 5eb80f0bd1..81247c63db 100644
> --- a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
> +++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBTORRENT_RASTERBAR_VERSION = 1.2.15
> +LIBTORRENT_RASTERBAR_VERSION = 1.2.19
>   LIBTORRENT_RASTERBAR_SITE = \
>   	https://github.com/arvidn/libtorrent/releases/download/v$(LIBTORRENT_RASTERBAR_VERSION)
>   LIBTORRENT_RASTERBAR_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
