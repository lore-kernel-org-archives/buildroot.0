Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AE8C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4612D40338;
	Sun,  5 Nov 2023 21:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4612D40338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u3TQ__L3MOq1; Sun,  5 Nov 2023 21:10:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73FED40358;
	Sun,  5 Nov 2023 21:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73FED40358
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27FE01BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00F536104E
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00F536104E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nKwXMrGIn-oQ for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:10:15 +0000 (UTC)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DE896104D
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DE896104D
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-540c54944c4so7634237a12.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 13:10:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699218613; x=1699823413;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iwDetK+eVKGfnbvjfV8KEBsGIJeouvFSxoTFLidJvEQ=;
 b=OsjYO4iaV1Hvy8ht1KyyURjInFFSyZjVQ16N95Z5kDULw6lnIQRqFzGCM5QgWlLcg3
 +W91S/8BhG0ekLf/9JSfHqE6tgS8Yr+m0K7g+L5AMaJ9kk4tvA7YraHSyhyRRHCiNUWI
 qO4i7g3t2b/QxBCnWhUfm5Ew0v3aCDLzYV+w6xSTkE416jvDGCQXJEm2l5xnTD7suyr2
 8sbBfeEoSjtJSZZSkxbxc5JrUhdQGI5JalM0sNAOQVT1FnThFzcJRyoqaKWha/SthByj
 dekUZpS/qx5wX6BY2m1o261WQqOOyY9wvF/HQuaIs3poAq/zdO0+IEGgpSw32rZ50MOr
 FwKw==
X-Gm-Message-State: AOJu0YwjnnXmaqxZwYknoUBlQnnNiXqLsAHszpqrg4MfEwEJ2ufYSO4/
 Lt6yH+ylj8y4UTFqWAIqXILrCQ==
X-Google-Smtp-Source: AGHT+IEIO5CicdEZEY1qyyH+EV5ai8Ow/Ek5VbwsxV8u9R3XTAjkmk04SoTuyBO+jE/A2z9YvcMquQ==
X-Received: by 2002:a05:6402:54b:b0:530:8942:e830 with SMTP id
 i11-20020a056402054b00b005308942e830mr7840106edx.2.1699218613215; 
 Sun, 05 Nov 2023 13:10:13 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 w27-20020a50d79b000000b005432f45bee9sm3659319edi.19.2023.11.05.13.10.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 13:10:12 -0800 (PST)
Message-ID: <2f4a215c-0f80-4601-a19f-8db52d46f27a@mind.be>
Date: Sun, 5 Nov 2023 22:10:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231105000028.2698957-1-james.hilliard1@gmail.com>
In-Reply-To: <20231105000028.2698957-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699218613; x=1699823413; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iwDetK+eVKGfnbvjfV8KEBsGIJeouvFSxoTFLidJvEQ=;
 b=MabFEae+xWkj944mmWFojpw3kYGeV98Qxp5m6c5cYzD6KECpmZclNmR3S2p3yGNPD/
 laxiBPXvKOmuwC51pEOcA14A1tCxEgyE38r6IdO8n1WjmbIdow56zzvmBURalGNVaFvt
 8q3XSs5/2fvl8Co9TOAfwZkyczK5RoMVj24ArSfSlwDI+n5UafX3izqKsTvtdsvZ213+
 7wCpxdf6/jjjQLj7xbA7c+9GOkY2AvAKAETLYoMMyr4HCBxQsSeW9wh32z7fKOQmR5Mg
 3zQOs4zL93nKkoGTOquZ3zdrOm9zZDMXaT+VvFnqoOUaSPcpXppSnXWOpErsrE1oQUZd
 8HUA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MabFEae+
Subject: Re: [Buildroot] [PATCH 1/1] package/python-argh: bump to version
 0.30.4
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/11/2023 01:00, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-argh/python-argh.hash | 4 ++--
>   package/python-argh/python-argh.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-argh/python-argh.hash b/package/python-argh/python-argh.hash
> index abfcec98f3..8bfb45d1c3 100644
> --- a/package/python-argh/python-argh.hash
> +++ b/package/python-argh/python-argh.hash
> @@ -1,6 +1,6 @@
>   # md5 from https://pypi.python.org/pypi/argh/json
> -md5  d51d4ed7d82ce24a981169074f3e64e1  argh-0.28.1.tar.gz
> -sha256  b2093086f0e809a3ecc24b64a2145309ee8f56d034936cd59e57c558a357329d  argh-0.28.1.tar.gz
> +md5  7001dd9ff619cf1422ddf8bf813bd08a  argh-0.30.4.tar.gz
> +sha256  9fca8e69c4dad4f8d2a7bdfbdd80b0754462b53510a03e1b5cf2b43a87e6e960  argh-0.30.4.tar.gz
>   # Locally computed
>   sha256  2594f46b9b23a5fddeca090faeb270c7ceee8116675fe35082be859aa7466e89  COPYING
>   sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
> diff --git a/package/python-argh/python-argh.mk b/package/python-argh/python-argh.mk
> index 82cef822e9..ccb9f61d48 100644
> --- a/package/python-argh/python-argh.mk
> +++ b/package/python-argh/python-argh.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_ARGH_VERSION = 0.28.1
> +PYTHON_ARGH_VERSION = 0.30.4
>   PYTHON_ARGH_SOURCE = argh-$(PYTHON_ARGH_VERSION).tar.gz
> -PYTHON_ARGH_SITE = https://files.pythonhosted.org/packages/bf/77/6758074453c83c7ac0456d397e95aaa91b33fbd2ec977dcf38be736ea177
> +PYTHON_ARGH_SITE = https://files.pythonhosted.org/packages/37/3a/175f4a2c47e8c20e59cf25fe69546f76cf1196251a377b182e8f4542b4c4
>   PYTHON_ARGH_SETUP_TYPE = flit
>   PYTHON_ARGH_LICENSE = LGPL-3.0+
>   PYTHON_ARGH_LICENSE_FILES = COPYING COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
