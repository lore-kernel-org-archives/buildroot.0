Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C38DC67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 16:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9EF4813ED;
	Mon,  8 Apr 2024 16:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s780fyMqEetL; Mon,  8 Apr 2024 16:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E08F78145D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E08F78145D;
	Mon,  8 Apr 2024 16:51:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 655851BF34D
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 16:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5292A40C0F
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 16:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMMmyzJ-Vjp5 for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 16:51:45 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c31; helo=mail-oo1-xc31.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D37C0400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D37C0400E4
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D37C0400E4
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 16:51:44 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-5a7d6bc81c6so3307674eaf.2
 for <buildroot@buildroot.org>; Mon, 08 Apr 2024 09:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712595103; x=1713199903;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LtQvNh8MndrDOcvLdI/licU1nX0Vfg+Nvfq+6VC5HBQ=;
 b=GK6FotGVgrj+6+g1E4rLMZZ7kyvyh5SBBZ0c+eKJBHYAvKxKsWKcAIIZwYJTe8N5NC
 y9yHruYjvq9ncMuHu5iz3qxzJmzDdoTW3Av7YTEeYnQietIElZXLOSZVPMGNSEuXQQnz
 zox4aBUEHt4VIOoNfYFKXsytNcN67wgYpDSW9J3dTQvJDkgHL6v0uGbiECoZvaB9lUT3
 7eacvfhAwkmcmEYgG7QMeTMlqbGyB1gl8rw0iirRjP2HsPCDHCmMcI9j6OutOpFIhrVH
 MyWBHjEsp98kI2JMbU2S91OGlzzSCUtOwuHcHH1fvfKbv0bQdlg3n5fndrlZMCvPT+bh
 Cfkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9wMqlVG+skBlDsj2/ABey4+NxijNVxY4lB6jmUS6k/nsixzB2roLcsaUmPKhkvUX7dlRK8ZQKVN/S+yES8klJrrdzyYmzSA==
X-Gm-Message-State: AOJu0YycyLLavrfNuJgpjHIS2G14chS2MD76/Glv+n6/rvz4hfY1nNGE
 iu7DZIJ3X7AAfuLGkxHBMCocPPx/vqSRrdI6yr6oUYuwCclrPoV0w+v5qHJ6V3du/tJPT19PP/j
 x
X-Google-Smtp-Source: AGHT+IEEygJJJ/OsL2TUKbjyv5M2/+hjD8tLzQvfAQcz9ZnmzlPI//dTEyKDCAeAKbms3aNMdAmqgg==
X-Received: by 2002:a05:6359:a111:b0:17b:c7b8:be7f with SMTP id
 kl17-20020a056359a11100b0017bc7b8be7fmr14628153rwc.32.1712595103422; 
 Mon, 08 Apr 2024 09:51:43 -0700 (PDT)
Received: from [192.168.2.93] ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a63494c000000b005b7dd356f75sm6657650pgk.32.2024.04.08.09.51.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 09:51:42 -0700 (PDT)
Message-ID: <e8770fde-432c-471d-8e60-90dbc0741c4e@newtesc.com.br>
Date: Mon, 8 Apr 2024 13:51:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: KAMenyaev@salutedevices.com, buildroot@buildroot.org
References: <CAEHOWiNoPYk4zGjw4RSBYkfStCO=fd3DWFyt6N37Y4vUZDixug@mail.gmail.com>
 <20240404195847.246579-1-KAMenyaev@salutedevices.com>
 <20240404195847.246579-3-KAMenyaev@salutedevices.com>
From: =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Content-Language: en-US
In-Reply-To: <20240404195847.246579-3-KAMenyaev@salutedevices.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1712595103; x=1713199903;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LtQvNh8MndrDOcvLdI/licU1nX0Vfg+Nvfq+6VC5HBQ=;
 b=RQCCzPU01itucSn+zdVtBZ5cbjK7VlWAp0HfBTnO4hbiydvy69ggPT1GyfvnuuwGwn
 iMer9hmNEK7FOv+FObg4FR0DyjB9Xvgy06MHiBaz1Y3PLS8DN07drJdjjfABTayNqFAw
 pgI72G2q743B4X7Nsupo2Jgnh7PxY5A6Gbg2qg0m9+Ez4uRIHECjD6qg4B4oUIf2k3h0
 CtxKFPRdiwl1tquXqRr4sbIzkSlvr8HIhpvtaWefkVpUzJPilMgDh/3S4/x1ALh+hn8H
 RANWsCqhpVPfXonZ1ElzLFIxQ2Slcd30HHCSEy/zym3DfU9lDVe4zKFp/3avJXsqVT23
 o4qg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=RQCCzPU0
Subject: Re: [Buildroot] [PATCH 3/3] package/rsyslog: bump version to
 8.2404.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 sdfw_system_team@sberdevices.ru
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I just tested this. It seems 8.2404.0 isn't building if libcurl is 
selected due to an upstream bug 
(https://github.com/rsyslog/rsyslog/issues/5357). Let's wait until this 
is sorted out

Em 04/04/2024 16:58, KAMenyaev@salutedevices.com escreveu:
> From: Konstantin Menyaev <KAMenyaev@salutedevices.com>
>
> Signed-off-by: Konstantin Menyaev <KAMenyaev@salutedevices.com>
> ---
>   package/rsyslog/rsyslog.hash | 2 +-
>   package/rsyslog/rsyslog.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
> index 212a1accea..91e8a74cea 100644
> --- a/package/rsyslog/rsyslog.hash
> +++ b/package/rsyslog/rsyslog.hash
> @@ -1,5 +1,5 @@
>   # From http://www.rsyslog.com/downloads/download-v8-stable/
> -sha256  acbdd8579489df36b4a383dc6909a61b7623807f0aff54c062115f2de7ea85ba  rsyslog-8.2402.0.tar.gz
> +sha256  30528d140ec1b1f079224081fa37df6e06587ff42b02e3e61f2daa0526c54d33  rsyslog-8.2404.0.tar.gz
>   
>   # Locally calculated
>   sha256  054b3a047d9232376a46b87356b19b0c0c2924cb5e6911ab96a01fc4b515f083  COPYING
> diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
> index ae645011ba..dd91f2e376 100644
> --- a/package/rsyslog/rsyslog.mk
> +++ b/package/rsyslog/rsyslog.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RSYSLOG_VERSION = 8.2402.0
> +RSYSLOG_VERSION = 8.2404.0
>   RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
>   RSYSLOG_LICENSE = GPL-3.0, LGPL-3.0, Apache-2.0
>   RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
