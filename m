Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C816AC05027
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 13:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2432441B7E;
	Thu,  2 Feb 2023 13:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2432441B7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E4F5DWjRmLEX; Thu,  2 Feb 2023 13:08:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E86B41BD0;
	Thu,  2 Feb 2023 13:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E86B41BD0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B5B121BF30A
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CE6F403F8
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CE6F403F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5JsYnGlSVJ3p for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 13:08:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F56D40120
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F56D40120
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 13:08:52 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ud5so5802077ejc.4
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 05:08:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yAMUnbjQKTsBCQPuKlp6d18CJK1AZt3RAGgDI3iPtwE=;
 b=EwTLiBlTVuCrqbHFxEIwbXqNWKbGdY/qehwAIllWBG6ctaNqsUkaNVKX1ZJ/6LqRox
 0GVV66QuBMhV77QfnAKsxKn/qr3ruQVPqWWq5ZnBuHXk7FPOlVXgktcW4VibIBk0DQx8
 CaBvXbK5NYGYv+RZloVRthdB00eNfB63JpvhT3uXAtLn1jmzxbCfoAYBbAqQK9zkfLXS
 NicCdAVbjP8OFdorWDYCK4fPkYU87y7eaGPtDa7Am3nuQh1rqwKzxJ7T+k13dp6IkIJG
 A1G3ozyAkk2FLJs2P0ZDqmAfvM/lBZ5u/Kw/P3S0EluS1E4qWXRHAm0+EQYcJUhOoI4z
 Krlw==
X-Gm-Message-State: AO0yUKXC5Y91fyG9i3tS/3kKAJKzm37gykydrAygRicyXyd0Nh1sqBpU
 9wWB6Uf2c5kh4AIxAgvVoY7bt+VifZ7O1R8g870=
X-Google-Smtp-Source: AK7set+eFkSVSE45/NRPzxRSxq6iIcbFuPBx7AtLP218vAWcfQXikf9a0KfHUqTu8aP/oNPEArlvug==
X-Received: by 2002:a17:907:6290:b0:88d:ba89:1853 with SMTP id
 nd16-20020a170907629000b0088dba891853mr2125999ejc.36.1675343330219; 
 Thu, 02 Feb 2023 05:08:50 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com.
 [209.85.218.46]) by smtp.gmail.com with ESMTPSA id
 dc19-20020a170906c7d300b00887a28ac01asm6792930ejb.31.2023.02.02.05.08.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 05:08:49 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id k4so5848481eje.1
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 05:08:49 -0800 (PST)
X-Received: by 2002:a17:906:a2c9:b0:88c:ee63:bafe with SMTP id
 by9-20020a170906a2c900b0088cee63bafemr1684107ejb.27.1675343329223; Thu, 02
 Feb 2023 05:08:49 -0800 (PST)
MIME-Version: 1.0
References: <20230202105544.315452-1-christian@paral.in>
In-Reply-To: <20230202105544.315452-1-christian@paral.in>
Date: Thu, 2 Feb 2023 05:08:37 -0800
X-Gmail-Original-Message-ID: <CA+h8R2oHeV+cTWDzPfKzFPg3_F5df-t4b=bZC4EZNVCRgsVVuw@mail.gmail.com>
Message-ID: <CA+h8R2oHeV+cTWDzPfKzFPg3_F5df-t4b=bZC4EZNVCRgsVVuw@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yAMUnbjQKTsBCQPuKlp6d18CJK1AZt3RAGgDI3iPtwE=;
 b=FoT04Sk3EYLc2QnxDavS/L6RzUwAF2+KqARGZKWFX+U+S3jAMENClbblBmNyvVDrCR
 XiE1evH8VzmDFgtdKrGBUrXx5seQ0wr5nVqAWieOq40iJJ8GRelxXPkL6/1z4tvLYRjo
 uJJ2MtaYdGAFoLL2J5gRYxqsH4GogmHikJossI/2ecfAOfcWe+uV4iSbFI+ZRE6JQBpW
 tQKmv9NUbgRy1FyXdvWeM9TDwEELlN9TfHza1Y1/uyU27KNBw+kefGpimcM4gwIFaOFU
 sVlfGzZYwM/Ynce13EEzxGbI47V2gwQHbYAgl1UA/Y4OOZAZX84YnshhCztbKJWcbVrz
 KwjA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=FoT04Sk3
Subject: Re: [Buildroot] [PATCH v1 1/3] package/go-bootstrap: split into two
 stages: go1.4 and go1.19.5
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Anisse Astier <anisse@astier.eu>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On Thu, Feb 2, 2023 at 2:55 AM Christian Stewart <christian@paral.in> wrote:
> +# Use go-bootstrap-stage1 to bootstrap.
> +HOST_GO_BOOTSTRAP_STAGE2_DEPENDENCIES = host-go-bootstrap-stage1
> +HOST_GO_BOOTSTRAP_STAGE2_MAKE_ENV +=   GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE2_BOOTSTRAP_ROOT)

This HOST_GO_BOOTSTRAP_STAGE2_MAKE_ENV += line should be dropped (it's
overwritten below in the file).

Thanks,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
