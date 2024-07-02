Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E47C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 06:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46BC781F48;
	Tue,  2 Jul 2024 06:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wy-Jk0py6k8K; Tue,  2 Jul 2024 06:51:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31CE281F57
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31CE281F57;
	Tue,  2 Jul 2024 06:51:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A42131BF32A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EFB56078C
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ujj3CysjS55o for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 06:51:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A0117605C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0117605C4
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0117605C4
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 06:51:12 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4255fa23f7bso26714205e9.2
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 23:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719903071; x=1720507871;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yxidYbAOJxv2HgGo/P8teiIoXQivJ+ZFhbAHPSGmoNI=;
 b=g8YaMDvE0kZqZATxYiOR3/0eRnatP+UbVrECmPwTYMfFgT93IBdhXC8ShQo+Gmghod
 3kPnBcmFFRyiR/7lBjdzEpvtBpjDpzJvup2hzf3MZ3byHMP88Rp41gVxHfbyRl4js/jX
 BJ5z7bDrBLfKzCRqdW7j/d0ciIBYrEq3SYfNGFtFledc+Ze603ctClSv3lNZ5n/uXnOO
 3xvEQQlq4VdwZLKrYScno7e0qD3SdXsXRivhfwODgAxcNRkDrF4rhPLgPgVJsTyZeRt9
 uxK/qkKxwPqg0i17p7p8W0CUleBRc16DQrRCrSdhiwk6A0z9eUNRPa7nhWWvpKoh/F8x
 eNBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuHnrGfZh+yDDt41tdVsTv+PYS7Jcnw3sN3Zisxuv+eXg7AB0ZuJvQFJK9upNHJWIo7SeY22mHZWvX6woHeGs5ppwqiS6Imw==
X-Gm-Message-State: AOJu0YzvodqtQD0BGyztDnWyRsiyKaS/hnN6jziZCdioU74pC7xxc16D
 xb+v9HZzhd6SNsg0htIfYv0GRnJVdWXVkeX8yqgiYdKkV1/utT5/lkH77tn25hE=
X-Google-Smtp-Source: AGHT+IF/H2zIm6KbwCRv5aAoqK61R8t1HpZv5cMl0v1Se81DN/TUseCc+qgK3mx+3zMSiAzt8Yg6Bw==
X-Received: by 2002:a7b:cb8a:0:b0:425:8bf9:6ce with SMTP id
 5b1f17b1804b1-4258bf9071cmr3351495e9.15.1719903070795; 
 Mon, 01 Jul 2024 23:51:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0d8daasm12157045f8f.30.2024.07.01.23.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 23:51:10 -0700 (PDT)
Message-ID: <9290dd9f-5b8e-4367-96bf-31b6aef0399e@mind.be>
Date: Tue, 2 Jul 2024 08:51:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240702055554.1039927-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240702055554.1039927-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719903071; x=1720507871; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yxidYbAOJxv2HgGo/P8teiIoXQivJ+ZFhbAHPSGmoNI=;
 b=S8xKBI65Ng2yW+Mm0xYSYQcf2CG2Z6stS+x6so5HUjdcZBwMbAZxfFvVRHWEHAwE1e
 e7XV0UL+MphM1eLbYjJb7gGiW/uWYgIvA2hO4u60MtR3HylPqplaRq7ipXdVYAM87R6t
 ZDjcrdOE9esjmI5ZZG/HV2fZ3y9ckffPuRogRDn450cAsm/Oj14M0tXaoSx5zmq1QCA+
 epGWQLq3Th59jZlYFRU72t1KKgsi8cvKyqZ9iZZ/Yi0Cl3ZZsb7IXgVHnUbW7QIIoSrS
 19y8gWFyWNYl2KC7zEg/NfovcQV2j083IEDMQNrdZD7rkoKsi8LL7tnA4OKfHcj2xDqa
 3kzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S8xKBI65
Subject: Re: [Buildroot] [PATCH 1/1] package/libblockdev: fix patch fuzz
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/07/2024 07:55, James Hilliard wrote:
> Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0" reduced the fuzz factor.
> 
> Due to this change, libblockdev fails to build with output:
> 
>      Applying 0001-Provide-replacement-function-for-strerror_l.patch using patch:
>      patching file configure.ac
>      patching file src/utils/module.c
>      Hunk #1 FAILED at 28.
> 
> This commit fixes the Provide replacement function for strerror_l()
> patch so that it applies.
> 
> Fixes:
> http://autobuild.buildroot.net/results/df5/df54118cc7057ba8dd566515281b77c49a596a04
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0001-Provide-replacement-function-for-strerror_l.patch      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
> index f7f75c9c14..d073e16ac5 100644
> --- a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
> +++ b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
> @@ -41,8 +41,8 @@ index 6557c3ab..5893f0ac 100644
>    #include "logging.h"
>   +#include "utils.h"
>    
> - #define UNUSED __attribute__((unused))
>    
> + /**
>   diff --git a/src/utils/utils.h b/src/utils/utils.h
>   index 801a8b6e..b2bdf0d0 100644
>   --- a/src/utils/utils.h
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
