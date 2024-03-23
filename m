Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA990C54E67
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 20:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A84B60708;
	Sat, 23 Mar 2024 20:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ygzh7j6sYmO8; Sat, 23 Mar 2024 20:33:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 345E2605FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 345E2605FD;
	Sat, 23 Mar 2024 20:33:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 332BD1BF37E
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20AB281457
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7jUhEDiSl3q for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 20:33:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09FC781456
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09FC781456
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09FC781456
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 20:33:45 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-34169f28460so1898644f8f.2
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 13:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711226024; x=1711830824;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=703Vm+nKlgGUolzXVfGNtB4JKJ0tvFdXJjoHq5bxmk0=;
 b=C5ZGaCK4oJedJ+FItzF0qlZVJWcHUWPl06iwIbwW2g3OgfHvTXY+PRuFd9YWU3oVoB
 fw/2cWil7f+uiMamYQ+BYtSJD4WFadjbcPxQ03Ft6TFk2RRNPVOXo02BsQBgK52FdFSZ
 C27dnqBU/NaEIm27ivpndoMbLqSOaOkgRHyRGSFyBRpm8sABQyjsfQ7iZlNsm0cXpF0K
 ixVfQ98/wFmQhXM4nruo1UpmmgiT4aqMjT1f9IQE3ZT1dI1gZVBFO4xT2qxixm/xlIOR
 BTLIyldi/NXSNgeCWldu29tj53ZQIMSVj3XMS2WEt95kizHmfqnU8ekzhySnt87GWyvR
 /OsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzkvDvUuaHQeMMxHD73uxhWRBkLcl9I56LByJxVaV87/eowxQBfRGHUmhXsIeQR96x6N5dzL8fKWQj4zTAkFxJYbbvktA7tA==
X-Gm-Message-State: AOJu0YxvJEja4mdqEA/lYUy0LpgB8hX+iu19WWNb7AH4CBX5mcYyqy4S
 lEkO4BtLK6YVO8wOdmH6IoRS5a/TYq5XZSobQZa+hwnRNe6j3exEUy5UbnVac2A=
X-Google-Smtp-Source: AGHT+IF6PW7fLrjGFJ/iu6oJUEJAlZuarNFX05LzYbAtwzzcfwhb6XejiUm4aLuoT2fvR1zp0s+i6A==
X-Received: by 2002:adf:f011:0:b0:33e:6f9b:7abc with SMTP id
 j17-20020adff011000000b0033e6f9b7abcmr1700519wro.65.1711226023883; 
 Sat, 23 Mar 2024 13:33:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 cr1-20020a05600004e100b0033b48190e5esm5164949wrb.67.2024.03.23.13.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Mar 2024 13:33:43 -0700 (PDT)
Message-ID: <23d1a8eb-be52-4033-a860-bc9471dfb03a@mind.be>
Date: Sat, 23 Mar 2024 21:33:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240322174941.475669-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240322174941.475669-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711226024; x=1711830824; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=703Vm+nKlgGUolzXVfGNtB4JKJ0tvFdXJjoHq5bxmk0=;
 b=Xn0H/dqOdf8I4ZHlG6H/6gMUdlOSoSFMSIWVZD/bQkyIsf/rO4opSSt4bVS0W4FgbP
 6B0MokXn9fzbkYBfqznplcWnnB23A8Z/fYoMkAa0K3RDwWob/agF9kFNMET1NGquBhMd
 moH0bcGOZWlTuo2Cwt7u3pDxn14KIlykNT/c99uiV44TR6T/WApelD7Nhwc8z2PY/mw4
 TMRFH7iAdcIoAx3gGuVByVro2EVckDQPWP9bl70CuVqmq7djqNNoD7DLWeqbN0z3X7Hj
 ZLzItZM2SfSCSfrYAJItqNyGqmyB0g0FczoKSvu56Dj6ViNPH63wvv1mxuoEwsiK1TjM
 nDyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Xn0H/dqO
Subject: Re: [Buildroot] [PATCH 1/1] package/libdrm: disable tests
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/03/2024 18:49, Fabrice Fontaine wrote:
> Disable tests to avoid the following build failure with amdgpu and gcc 5
> if cunit is built before libdrm:
> 
> In file included from ../tests/amdgpu/shader_test_util.c:10:0:
> ../tests/amdgpu/shader_code.h:113:2: error: initializer element is not constant
>    ps_##_ps##_shader_patchinfo_code_size_gfx##_n, \
>    ^
> 
> tests can be disabled since
> https://gitlab.freedesktop.org/mesa/drm/-/commit/46d1e99a5d291b22d86ac52710b079491beedff8
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/612aad1fa642993da36bbec6c16c9020ac283e34
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libdrm/libdrm.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> index 61d1c24377..a04331c2da 100644
> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
> @@ -17,7 +17,8 @@ LIBDRM_DEPENDENCIES = \
>   
>   LIBDRM_CONF_OPTS = \
>   	-Dcairo-tests=disabled \
> -	-Dman-pages=disabled
> +	-Dman-pages=disabled \
> +	-Dtests=false
>   
>   ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
>   LIBDRM_DEPENDENCIES += libatomic_ops
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
