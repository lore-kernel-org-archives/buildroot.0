Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04753C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 16:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A132E4026A;
	Sun, 24 Mar 2024 16:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dwSblIjKbFNp; Sun, 24 Mar 2024 16:52:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4296403A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4296403A2;
	Sun, 24 Mar 2024 16:52:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5ADAC1BF4D6
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47D1F405CA
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F1NlZ1UJfCfG for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 16:52:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 009F9405B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 009F9405B0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 009F9405B0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 16:52:16 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41489d4ffccso127365e9.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 09:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711299134; x=1711903934;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SuNHZ7weVD69JCHeEsalCaN60nnfqoos1nuMn2l9RUU=;
 b=aAP+zHR05pbqJi8hvX4bKKkGZFF61l/MLCsfmMIgwm1vIXtdaL1T2WvmKixLX0Z3pV
 IIipsj+Q/E9Dle0yKj3Y1mcY/E+5GwlgI+UnbRFl3I8VyujasbpXELTbrixFnXeLAZvH
 LJsUiVeWp3ty2Dc65otyy24dnpUxa/bi0X+eOPNJUY9x4F9S6Qbiz2EEk+kLXH67kU4A
 OGhGtF8wr5ukHC7tWJ+HKCcJ7Y+cyioqlbmLqdu1hQ1X8hspMvP/7ti6L9oBLMrfXTNH
 lZbGTY9ZX7gdI2iYfwTKrhZMZ2aKMWNV1GjkbmRn8H++Mu9VgSHahMm41gVjc+RgYQvS
 EmbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtPfIfNtaIygAVONd59a/Tf5f/J1p8F+sLfBjwT99WDK+8jo1G1Kb54oxhX74/WpsZS4UKTKBCPaacvFTyIe64hEz9SiFAlw==
X-Gm-Message-State: AOJu0Yzwr5i9lGYm4Vv9cFxjIKtUXgRbGhA4PGAUgdA78ZGyoYe8gs/U
 0l4EZVPc4zc4hZ5xrXCAGoTw3MEQFBfSUdDJBMUchi0D+9YiIxFjiXgnqeRP6iQ=
X-Google-Smtp-Source: AGHT+IGDglW+P++BEhDZDD9G4V2T/Eb1F317rWaa/f48pNmnJEPu/tsJ+Fyy//ANqAHARHKJsdeiUw==
X-Received: by 2002:a5d:4d0e:0:b0:33e:9dff:a3f7 with SMTP id
 z14-20020a5d4d0e000000b0033e9dffa3f7mr3654500wrt.62.1711299134431; 
 Sun, 24 Mar 2024 09:52:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 df4-20020a5d5b84000000b0033e7b433498sm7192618wrb.111.2024.03.24.09.52.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 09:52:13 -0700 (PDT)
Message-ID: <99fe8bea-8094-47aa-8b15-09854a190c8b@mind.be>
Date: Sun, 24 Mar 2024 17:52:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240316213718.3611716-1-bernd@kuhls.net>
In-Reply-To: <20240316213718.3611716-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711299134; x=1711903934; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SuNHZ7weVD69JCHeEsalCaN60nnfqoos1nuMn2l9RUU=;
 b=Tszr5sOCZQMoCsH8ig5W1hmULAeJqyFs/D/WNP1C0uOqHxjHwxFTljTw3Xw+9jW8WK
 lzAmxar3izrqh7xk/7qR31xxgoOZxM36l931VKGW766sJlTfipSD7KNxhWChMHfmlydY
 K2pTVyAIGtWPimfZqNJe5A5sIt8Y5IjbrqtzNhdOibqDIyRFgyo6PTts43/5MB0EhJAB
 +rC7JrdROYzenNV0YEjPeCFqPKBcHHZH6jw4JjJMP/sJzdBfw0CQV7c6+GrfjV/OIXKz
 aRR+NsbXy0tPJH2w404dh7ZKTrZBZvwbUWI2GX7vWcTx9XMA1t9yK3ER5gHsXq5tGoS8
 xIQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Tszr5sOC
Subject: Re: [Buildroot] [PATCH 1/1] package/pure-ftpd: remove optional
 dependency to libiconv
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/03/2024 22:37, Bernd Kuhls wrote:
> Buildroot commit 26d5d1c0a20719876220b429a43f8b1bcc29138b removed the
> configure option --with-rfc2640 due to upstream commit:
> https://github.com/jedisct1/pure-ftpd/commit/33eda763bfca8dfcf736275272b84602dcd18549
> 
> In the same upstream commit the iconv support was also removed because
> it was only needed for rfc2640 support, this removal was forgotten in
> the forementioned buildroot commit.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pure-ftpd/pure-ftpd.mk | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
> index ffd27d7b99..b918c70930 100644
> --- a/package/pure-ftpd/pure-ftpd.mk
> +++ b/package/pure-ftpd/pure-ftpd.mk
> @@ -10,7 +10,6 @@ PURE_FTPD_SOURCE = pure-ftpd-$(PURE_FTPD_VERSION).tar.bz2
>   PURE_FTPD_LICENSE = ISC
>   PURE_FTPD_LICENSE_FILES = COPYING
>   PURE_FTPD_CPE_ID_VENDOR = pureftpd
> -PURE_FTPD_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
>   
>   PURE_FTPD_CONF_OPTS = \
>   	--with-altlog \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
