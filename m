Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4809DCCF9E7
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 18:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D07D9607C8;
	Wed, 25 Sep 2024 18:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VZPvyZZli-dE; Wed, 25 Sep 2024 18:50:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7414611C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7414611C9;
	Wed, 25 Sep 2024 18:50:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E74C1BF408
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C5824099C
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WWcpz5DahIL1 for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 18:50:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA7ED40496
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA7ED40496
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA7ED40496
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 18:50:52 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42cae4eb026so1240675e9.0
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 11:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727290250; x=1727895050;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nWlg1yd+s0KhtDkuEy0zDtpUgJVSx9jcLPm4YzqZHtE=;
 b=iCFSBkeSUIyBleEkxoT9dXRGhJ7VDIV3YLUUSa4U2FZ7pZtYCgFu/UTiUot8fyxzQ7
 AcEBI3P6aOgPI6+V8jP2DRAlVM7yjsi9Wd7ufC5Uxg1AWmZ4mAmKs9sYJkrKDh//NXSo
 Zs9WXg/OEb3Rqc+VpB78Nb2JnQEHyzk7f8/AQ/fSCcDwmUgT5o5a7jdPs5A0DySYQI0F
 zhaE1ca0jqbyXIl5B3+BggD2g8WOmT/8WsfTuUEfXoeQzWkVHw4j8QYtikf4apcyAXbq
 FVYy/7jXPeDpYtNzsyVa/7j2JStYdaU40IoYq8fhWJ0gSxPJ+eEkos+KdhEMp4EYoUtI
 gW+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+71mfrq5nsI3McLyZ7gTJkkOsw40vSFdvV8dE/x1wS3f02yjW8ZlHH7Kv+qCx14EFAALiCDMyyCQ=@buildroot.org
X-Gm-Message-State: AOJu0Yw+Myztt4GHC/Z+rnapqWH9jc2OOLhRg6NB0bbRx5Wzs5AmkW+N
 VLBIVR2THk8rqn3erPVpNsJPVHq98LKp3fIlhYJcQNqB8e5uqxVBtnauz154OU5OoKlpxj2f2eb
 b
X-Google-Smtp-Source: AGHT+IF/dV+wGvTyy/bkHhD8+WlwXLsLFeUxOSeWg0VtHjqg5T/WQOKgNCBn9UXdKElSrE3Tts6wrg==
X-Received: by 2002:a05:600c:314a:b0:42c:b6e4:e3aa with SMTP id
 5b1f17b1804b1-42e961045c5mr25994415e9.5.1727290250358; 
 Wed, 25 Sep 2024 11:50:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e902560cfsm58516795e9.0.2024.09.25.11.50.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 11:50:49 -0700 (PDT)
Message-ID: <3e37de05-bdc0-4b63-b10b-2e1de2cd2422@mind.be>
Date: Wed, 25 Sep 2024 20:50:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20240924122406.1125261-1-peter@korsgaard.com>
Content-Language: en-GB
In-Reply-To: <20240924122406.1125261-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1727290250; x=1727895050; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nWlg1yd+s0KhtDkuEy0zDtpUgJVSx9jcLPm4YzqZHtE=;
 b=Qu+YQGUIqJDB6OEdbXFqu/fLyxoz1eUDnA42S6GjpfHs+/1c8FVqJpIpaly7B8hpXb
 obgF0QjpEnbgKSHyiAVL9nw8jHAQvB4US79kyoEeyy19Gu+0qQHGrFHImiLujDJeJv2z
 43W7ibHdsMAff3Lj/iWolfK0O6Wov3HHk0Utb16VcU4XVW2XOzhhGARC2W7MJKequ50b
 jMUofhzJihP+zYhNy8uMYqZuOniuIMoT2sYeHR4Shitd82HpdRSyc5IBnojGNGBSw92G
 HOEkcOZvNqUgmuNsl9/FbavPLNCZ2Zmf2rsaaNMRGDbe9nXo3YQR15c//lZHYx4zjYKC
 1NHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Qu+YQGUI
Subject: Re: [Buildroot] [PATCH 01/22] package/qlibc: fix 'consistent' typo
 in help text
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



On 24/09/2024 14:23, Peter Korsgaard wrote:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   package/qlibc/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/qlibc/Config.in b/package/qlibc/Config.in
> index ad6f1fee55..5087cf6d88 100644
> --- a/package/qlibc/Config.in
> +++ b/package/qlibc/Config.in
> @@ -9,7 +9,7 @@ config BR2_PACKAGE_QLIBC
>   	  public licensed C/C++ libraries. The C/C++ library which
>   	  includes all kinds of containers and general library
>   	  routines. It provides ready-made set of common container
                                 ^ There's also an 'a' missing here.


  Applied to master, thanks.

  And the rest of the series as well, with a few changes that I'll comment 
separately.

  Regards,
  Arnout

> -	  APIs with consistant API look.
> +	  APIs with consistent API look.
>   
>   	  https://github.com/wolkykim/qlibc
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
