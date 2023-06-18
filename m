Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111E2EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9FEC610E2;
	Sun, 18 Jun 2023 13:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9FEC610E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0XQGm7UsmEHI; Sun, 18 Jun 2023 13:17:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1109608A5;
	Sun, 18 Jun 2023 13:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1109608A5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1923D1BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6E4D608A5
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6E4D608A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SIdQ3p5iQF_d for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:17:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA1CA605A3
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA1CA605A3
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:17:12 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-51a4044b7a1so2971622a12.2
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 06:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687094231; x=1689686231;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PXS8SonMNH8y03/tGapaNZBur/QI/hrDxl/1dmUX/eo=;
 b=mCUypUWxz0XEq+Q/2OqVPzKHh9BYvLqhTv9EArqpvERFD97dibYU8K1eTe/bzTB0GM
 3wECreWz+Piab01eoG4Jii2hCmiTHC8yXuXEcapXpFNs7+qEQS3cCTkpsFTQyy0OGtTU
 fQEe+W6Ze3GauXZsrwYl4cI42mL2eITAKqOO9tfCBu0x34fpk6vjFfhA6w5G8cPSOiZ4
 xYNzPpTiRC9WIwfYoagbuhstmrZnWRYOZtG9JdvrCGBhr65F6ySlOjmqTYHL4M7pV8Z/
 39CL/TiedofENjb7GK6Z3c7WV2/WfGHUDdg4+Umg7QJEVKhA1fxB0vTy+Qq75XHH41r6
 e91A==
X-Gm-Message-State: AC+VfDwA/rxltTdF+aLiBP1xp7KId+QT7fzkUcWj66IU5u36rCWuC1Ym
 RXiBNrvOrKyLOhKao3Cb5Jti1w==
X-Google-Smtp-Source: ACHHUZ5L4O4CFLMIcnR88TpwGx9hFop39+mvVe4xQh8IfE/jiCKZURRxhqHWYGZCITKCxvxNo8IdTg==
X-Received: by 2002:a05:6402:1252:b0:514:a0e9:3deb with SMTP id
 l18-20020a056402125200b00514a0e93debmr5284591edw.23.1687094231008; 
 Sun, 18 Jun 2023 06:17:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 i16-20020aa7c9d0000000b0050d83a39e6fsm11941848edt.4.2023.06.18.06.17.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 06:17:10 -0700 (PDT)
Message-ID: <9a8fee52-c5f8-dd63-4e5a-286acff765e0@mind.be>
Date: Sun, 18 Jun 2023 15:17:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230605080025.1925464-1-james.hilliard1@gmail.com>
In-Reply-To: <20230605080025.1925464-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687094231; x=1689686231;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PXS8SonMNH8y03/tGapaNZBur/QI/hrDxl/1dmUX/eo=;
 b=ING8fNMQqjHjty3EknDoMvZiEvwyA6WAs6EmmWArufav0JidFfs2oGCxmPgFAxvjGw
 bIw/rGVenFN3+ZciC9Dd/K7dbfaeo3oKKD4TtXsXPaV3ljvo7/IcjMzOyLTq2DKythlo
 81vpug+EwIaWq0dZuevOxthN+/i0SfcJSvzAlMCnhcC5GiaF8YOqFAtyd5behGGzSqDZ
 jjBc1jtXTdbokaVew0wjUyCDh9HblKcyrMj4GDPnBQwtzs5r6NpcBZa9ZC6X/6dIzY2r
 eE7NVwJT3kPJRm46yCiQX/cDUf8K9H0ZontiXX+ASfnC8RwtswMCxkKMpPlaY5lE5qoB
 XDDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ING8fNMQ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version
 9.5.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/06/2023 10:00, James Hilliard wrote:
> License hash changed due to wording update:
> https://github.com/python-pillow/Pillow/commit/997932bc93c778919fe22f4838ef0929482fe520
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pillow/python-pillow.hash | 6 +++---
>   package/python-pillow/python-pillow.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
> index d514bdfe56..43bb824b6a 100644
> --- a/package/python-pillow/python-pillow.hash
> +++ b/package/python-pillow/python-pillow.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/pillow/json
> -md5  ee6e9a6c729ed9e9a78ccd3f6e9d7143  Pillow-9.4.0.tar.gz
> -sha256  a1c2d7780448eb93fbcc3789bf3916aa5720d942e37945f4056680317f1cd23e  Pillow-9.4.0.tar.gz
> +md5  ed80942ad1ade1aab0fcf3790d0be3ec  Pillow-9.5.0.tar.gz
> +sha256  bf548479d336726d7a0eceb6e767e179fbde37833ae42794602631a070d630f1  Pillow-9.5.0.tar.gz
>   
>   # Locally computed sha256 checksums
> -sha256  4e1755595052d843e2f350c930759f945ecf707bf812883948d181016b12dd0f  LICENSE
> +sha256  0fdb68ffb39062553be40be4e6eaea9700b4f5e870a720ae86b8925d67613ddd  LICENSE
> diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
> index c02968610f..b69d329cde 100644
> --- a/package/python-pillow/python-pillow.mk
> +++ b/package/python-pillow/python-pillow.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -PYTHON_PILLOW_VERSION = 9.4.0
> -PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/bc/07/830784e061fb94d67649f3e438ff63cfb902dec6d48ac75aeaaac7c7c30e
> +PYTHON_PILLOW_VERSION = 9.5.0
> +PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/00/d5/4903f310765e0ff2b8e91ffe55031ac6af77d982f0156061e20a4d1a8b2d
>   PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
>   PYTHON_PILLOW_LICENSE = HPND
>   PYTHON_PILLOW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
