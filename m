Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CC3CCF9EB
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 18:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 445BA611C9;
	Wed, 25 Sep 2024 18:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVWU-NGibMYi; Wed, 25 Sep 2024 18:53:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D9B1611CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D9B1611CB;
	Wed, 25 Sep 2024 18:53:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F3CCD1BF408
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1E32408DB
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rv65k7FW5TaQ for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 18:53:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0CCC400F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0CCC400F4
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0CCC400F4
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 18:53:11 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42cba8340beso8342415e9.1
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 11:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727290389; x=1727895189;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M+gcTNoHThSsuI/ViU24VJZDYOdY7ceBVYk1SIOYg3c=;
 b=G1ImtjC42diAOZXc8i9dCc5AS2WfmE2KcMLXtOxwtgFUwQWeVlGvE6KhrkPpLLHP6B
 ipfemNd2Da9VM7RL/OpQR/Tdmj53RjOYgQjf8HLSbCT5z1HPYIkor8JFp38W33QKvoah
 GEkujGda7mnhQrFwlC29XWxHRm3kzyi1xMiUlK5nd32HYzJM3b8Hvmj+nd3G/z/obYm0
 qCG+toecZFuC2e39FGw2izjeGGVnyS5eiToh67MPSqAuyMEgeIJ871frrFG3DJz6PA3G
 L4G1aFqwfOxOX3Lid6dJXzs1C2DbIukKnOjLldAIR8aQejl8bmZb7e7gPreMNI0n3039
 Yw6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpjouMu14dVLuyHhyggFp8BogaLTelA/WJ02oijYczop98uTF5SieKXQp0WqsIUBww8c97P/xNB5k=@buildroot.org
X-Gm-Message-State: AOJu0YwjOT8JYLr+pWiwsUk9LjS0DOkHeClS91QXeagMT4D746Is1LPz
 Asa2mz0IBSS2qZl122KxH28blG6ztQcUnaHbHjLJuEwXDi0IJH+9bkVXqhUVUp8=
X-Google-Smtp-Source: AGHT+IEsFFPfgQjRjqmOb6aG6RnUtQhNLWUjfZlBazuo3w9D3NKrVAm9aKRPIRPjJ/0fwNgU39fkrw==
X-Received: by 2002:a05:600c:4511:b0:42c:b8e5:34d5 with SMTP id
 5b1f17b1804b1-42f521f21eamr3404505e9.15.1727290389265; 
 Wed, 25 Sep 2024 11:53:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e969f90absm26582425e9.12.2024.09.25.11.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 11:53:08 -0700 (PDT)
Message-ID: <8eef7fc1-4f84-4431-bf2b-21f03cb6939c@mind.be>
Date: Wed, 25 Sep 2024 20:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20240924122406.1125261-1-peter@korsgaard.com>
 <20240924122406.1125261-19-peter@korsgaard.com>
Content-Language: en-GB
In-Reply-To: <20240924122406.1125261-19-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1727290389; x=1727895189; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M+gcTNoHThSsuI/ViU24VJZDYOdY7ceBVYk1SIOYg3c=;
 b=SF2yh1A3DZ2xjNCUoRlCuKKFAaSyzc6lbdUFnK+cvhW6GnfQm03A1RSAP4ADtnaa1j
 2BevjfYoIAhcBoYLC/05Z1zz5KChR5LEm+RejLim84nolcdZJOLn8E+UX8fS8jUctXpD
 2GH20mmNs7muz+eSDkV1rTnnBNCj7O4tjlk+VUHIBx20kviS29I8i7FbDlM1iHP++sKQ
 +/06XeclOxSDv3fNeK2c8bZHpREyM0Dv+HY4c1hhOFbTxVHuO298bNA2N70DF+aWda0h
 f0TeofrOCceVdSuD73Sil0N003vkYbglsrvuiMNty3JX+iWgRwJkrLHx7pCAU4+uzvGp
 SqTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SF2yh1A3
Subject: Re: [Buildroot] [PATCH 19/22] package/stress-ng: fix 'correctly'
 typo in comment
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/09/2024 14:24, Peter Korsgaard wrote:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   package/stress-ng/stress-ng.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
> index 659904a9dd..95bf561b2d 100644
> --- a/package/stress-ng/stress-ng.mk
> +++ b/package/stress-ng/stress-ng.mk
> @@ -30,7 +30,7 @@ endef
>   
>   # Don't use make install otherwise stress-ng will be rebuild without

  rebuilt

>   # required link libraries if any. Furthermore, using INSTALL allow to

  allows


  Applied to master with those two additional fixes, thanks.

  Regards,
  Arnout

> -# set the file permission correcly on the target.
> +# set the file permission correctly on the target.
>   define STRESS_NG_INSTALL_TARGET_CMDS
>   	$(INSTALL) -m 0755 -D $(@D)/stress-ng $(TARGET_DIR)/usr/bin/stress-ng
>   endef

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
