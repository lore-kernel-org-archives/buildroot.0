Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A033FC27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 19:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E358241958;
	Thu,  6 Jun 2024 19:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0mI03XRPqQEp; Thu,  6 Jun 2024 19:40:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB8364196B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB8364196B;
	Thu,  6 Jun 2024 19:40:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 993E01BF57B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FB566117F
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fiSDB-CatCoZ for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 19:40:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 512A76084D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 512A76084D
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 512A76084D
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 19:40:50 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42163fa630aso4509105e9.3
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 12:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717702848; x=1718307648;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cAUO5/rys/NO1uIm6GA05v1wniBBnd6DmRTb+OUYed0=;
 b=F+HaxDSyYTLgtjpJqfzF+qcJxntgTK7qONrjdFj2TkvGIMf8S5I8VDid6hpZ8Eu/5A
 zA1Y4R98Doaf5fD9TLxuUA+FZ7DKb8iE9p4qMIEE+wqH9O1Vm8T+1fDqp7zt8xFEVwb0
 3umRmiJrbY+n4cQxLjZaNKmRA7GavJo0Pas6vRHE+HSihrcL+KcJeNaw/UgJNcaFLvpE
 rQp/yVqI0Ikv8UuJvJO6UjQGokGd1FWUe6sENrTcBtxbUSAxLJM+kwdthTEFnDD9Ys2A
 qtQhBTx2IYKrrMhObNzc0cJZPnNT0JT8l85ezG5WBGuueOdvl1sWFrFtBvyvKGDkeB3q
 DAAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeRCeOsruXvz0Sc7lGkNh1RcRW3f/yql8RnvtSP2T4lU2dJTPyWLPa3bWMuOfv+iDZiwbPbPC1EL5bj1AEBQmHqsxNH8PtgQ==
X-Gm-Message-State: AOJu0YyvqvqlOXQ4UPFdAWxmKUqCXDAWQ+hYZ7fZn60N2pUxlCu56ECL
 3JV7URaMVkXEY5r0WOG+uVGiLB3Qrse0mt3EaVh9NnhHtYZ5Tzgr/M92VMZQDCM=
X-Google-Smtp-Source: AGHT+IEBjd2eDST8rVocZ+cEDPt2Nn6lh469xxsptw8PmWGJWpGfcAa5abXzrKltMXWXZprmfCRXIw==
X-Received: by 2002:a05:600c:3106:b0:41a:fa9a:d86b with SMTP id
 5b1f17b1804b1-421649f11a2mr4872115e9.11.1717702847951; 
 Thu, 06 Jun 2024 12:40:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2a6130sm31051965e9.26.2024.06.06.12.40.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 12:40:47 -0700 (PDT)
Message-ID: <2e75a11f-c42b-4786-afec-795dc32e26dd@mind.be>
Date: Thu, 6 Jun 2024 21:29:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240515162501.1086749-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240515162501.1086749-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717702848; x=1718307648; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cAUO5/rys/NO1uIm6GA05v1wniBBnd6DmRTb+OUYed0=;
 b=VHIa1gHq2Gq5HB/Br3pRSqtti/O4ss7y/iRxYbDhbkj/bWD9lP11qwxIYnIM8NB+Gx
 0FgQp5bq1F2Ky+DoeHLajzHnj64tayhgEOXJSnE+WYtNxpTXs7tJGElsdMpW+SDtbcnD
 6yUS7vEoGtZOOkbgnNJD6VkmHLOFYd9pbGMqjSCnwiJ3V6pFPHGH2ZwiQTkS/A049tkE
 rMe2UAMevKCJMp/grU3jguPWSnZCxazFU3HTi9NCqvHALU1lKVDGIkJKq3gaWFR2Lshr
 k+m/OFfyTfSkVOI9sj1HZ75QNPx/ttlTOL4My5fGgpoeuA+X3rlzvrI7BrW67blUhtbn
 PnFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VHIa1gHq
Subject: Re: [Buildroot] [PATCH 1/1] package/syslog-ng: fix libcurl build
 without C++
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/05/2024 18:25, Fabrice Fontaine wrote:
> Fix the following libcurl build failure without C++ raised since bump to
> version 4.7.1 in commit 105f0398c76f3288b2668e0b3ec722b2ebe55a0b and
> https://github.com/syslog-ng/syslog-ng/commit/86feed7bff068a48be477a5b702ca24abc441d70:
> 
> configure: error: C++ support is mandatory when the cloud-auth module is enabled.
> 
> Fixes: 105f0398c76f3288b2668e0b3ec722b2ebe55a0b
>   - http://autobuild.buildroot.org/results/cf36fb119224ba50a768dbe363d4c381f76eb476
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/syslog-ng/syslog-ng.mk | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
> index 4f9a455e81..57ee46ce05 100644
> --- a/package/syslog-ng/syslog-ng.mk
> +++ b/package/syslog-ng/syslog-ng.mk
> @@ -61,8 +61,13 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_LIBCURL),y)
>   SYSLOG_NG_DEPENDENCIES += libcurl
> -SYSLOG_NG_CONF_OPTS += --enable-http --enable-cloud-auth
> +SYSLOG_NG_CONF_OPTS += --enable-http
>   SYSLOG_NG_CONF_OPTS += --with-libcurl="$(STAGING_DIR)/usr"
> +ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
> +SYSLOG_NG_CONF_OPTS += --enable-cloud-auth
> +else
> +SYSLOG_NG_CONF_OPTS += --disable-cloud-auth
> +endif
>   else
>   SYSLOG_NG_CONF_OPTS += --disable-http --disable-cloud-auth
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
