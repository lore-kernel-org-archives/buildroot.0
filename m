Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AAFC27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 19:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A771740354;
	Wed, 19 Jun 2024 19:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id idwy5u1BBeHO; Wed, 19 Jun 2024 19:40:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 530244052D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 530244052D;
	Wed, 19 Jun 2024 19:40:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A6391BF25F
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 19:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D4584096F
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 19:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nbd-nMTFRMew for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 19:39:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AC7D040934
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC7D040934
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC7D040934
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 19:39:58 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-36336aa7ca1so116994f8f.1
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 12:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718825996; x=1719430796;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R7KFLAAxx5/A4DvEO1A5TfKBDyFOuMQAs1SGC4Tccoo=;
 b=VLEi62W6qtPbunJ7qjIlOPWNZmF7wVcFIGmO4peLmKJyeTK3G+N1JNAcpXsU/9kJ9N
 H8mymAINJPxbKM79ytEPj8Uh+1fh3PwaO87i44NYyyU3Pmi7h0/weIpAtZCelZYGgDQf
 X/EG5qhhfLt/BxB1XvKXnBBDa5cAnLoVeeJdurErYEDCOKVaTdiB86QSgn4iq7LAOKoc
 syHbc0irUudSbpEd2KUGB/MNZvFsTE/gyJ8WQBa2Lx5hkxwXXWdAAdthFxj3P1KiItrY
 prFVFLRkCStg+DZo2kw4IiW7r2eqqVdrSrcRL6/6lTXe6ZydSRuCNmBg4loreiI2/KB/
 vtCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY9NWkd2rKcAsNZoOFPk2HFNGJTFWTWERTXMOjJE4grP5Lor3wBNKHjTxBJaRNvi1i4PJKbHtu/taBqg9QXpm3ProjhVNmHA==
X-Gm-Message-State: AOJu0Yz9DIsAEUHpwTq2NmvMRma3B0PVGZL0TsaHgN8BSC7mkBTXsn7O
 cUwvlYrn80RL0Al2R+555+JGhRHb025cnpj86Vp6kFG/0zCudA3LlsKkZTFNlTY=
X-Google-Smtp-Source: AGHT+IFOu+zlVpo3cfTluCT8xnd8TkF4gpcq/FV23pFbru/R3V2swDaro2OIC7Qn7cya1SV1cBzlXQ==
X-Received: by 2002:a05:6000:d41:b0:360:73f4:7937 with SMTP id
 ffacd0b85a97d-363171e2cffmr2474959f8f.6.1718825996215; 
 Wed, 19 Jun 2024 12:39:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0c0deesm400855e9.15.2024.06.19.12.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 12:39:55 -0700 (PDT)
Message-ID: <0e05072d-b0df-4e5e-bd08-567958be05d3@mind.be>
Date: Wed, 19 Jun 2024 21:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: friedtj@free.fr, buildroot <buildroot@buildroot.org>
References: <1392555888.1047670733.1711087389627.JavaMail.zimbra@free.fr>
 <1322751925.1056008247.1711141112983.JavaMail.zimbra@free.fr>
 <20240512095911.17df30df@windsurf>
 <1829902423.330785126.1715848461667.JavaMail.zimbra@free.fr>
Content-Language: en-GB
In-Reply-To: <1829902423.330785126.1715848461667.JavaMail.zimbra@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718825996; x=1719430796; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R7KFLAAxx5/A4DvEO1A5TfKBDyFOuMQAs1SGC4Tccoo=;
 b=ZgrvOpx0dSLdu4oCcVAmjlA3mcuBUvRr0VlZuUXN2rc4Mp+SryFs7zFvDO0l0rKfW/
 niemtcPHMRUM1gzKODGtz0a/FL+W6iduJ7U41eaUe8FLcWKQfF6O3Sq/EQkAFY6IjclJ
 PFQWcZ0nr+a75hEIB2ponXFq1DDXQtu4zJ7no21z49ahI0V6aiHpySn46gcVQQ4FSySK
 TKuq+96DqMdyi3HWdOfXWSxcz0lmPjhdqaOtzf2kvR+bjrHYMqk2JSCy2cUd4Vg7OO++
 IAloFac7OigYKmLsgBGxKU3Ane4Y4tM5Ww0950PlhVomWHjfFH9GhT3HeQ8f6dyf6WhT
 di4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZgrvOpx0
Subject: Re: [Buildroot] [PATCH 1/1] package/gnuradio: add optional IIO
 support to GNU Radio
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
Cc: gwenhael.goavec-merou@trabucayre.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/05/2024 10:34, friedtj@free.fr wrote:
> Indeed libiio dependency must be activated. The following patch aims at
> providing optional IIO support in GNU Radio since it is now included and
> no longer an external package:
> 
> 
> Signed-off-by: Jean-Michel Friedt <jmfriedt@femto-st.fr>

  tabs/spaces were again mangled in this patched, but I managed to fix that and 
applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gnuradio/Config.in   | 7 +++++++
>   package/gnuradio/gnuradio.mk | 7 +++++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> index be997e91e2..78bee9e221 100644
> --- a/package/gnuradio/Config.in
> +++ b/package/gnuradio/Config.in
> @@ -136,6 +136,13 @@ config BR2_PACKAGE_GNURADIO_FILTER
>          help
>            Filter signal processing blocks
>   
> +config BR2_PACKAGE_GNURADIO_IIO
> +        bool "gr-iio support"
> +        select BR2_PACKAGE_LIBIIO
> +        select BR2_PACKAGE_GNURADIO_BLOCKS
> +        help
> +          IIO support
> +
>   config BR2_PACKAGE_GNURADIO_NETWORK
>          bool "gr-network support"
>          select BR2_PACKAGE_GNURADIO_BLOCKS
> diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
> index 4e82c9e129..bdaab86f35 100644
> --- a/package/gnuradio/gnuradio.mk
> +++ b/package/gnuradio/gnuradio.mk
> @@ -112,6 +112,13 @@ else
>   GNURADIO_CONF_OPTS += -DENABLE_GR_NETWORK=OFF
>   endif
>   
> +ifeq ($(BR2_PACKAGE_GNURADIO_IIO),y)
> +GNURADIO_CONF_OPTS += -DENABLE_GR_IIO=ON
> +GNURADIO_DEPENDENCIES += libiio
> +else
> +GNURADIO_CONF_OPTS += -DENABLE_GR_IIO=OFF
> +endif
> +
>   ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
>   GNURADIO_DEPENDENCIES += python3 python-pybind \
>          host-python-numpy host-python-packaging
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
