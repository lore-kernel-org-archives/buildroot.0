Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B125C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 13:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8879B4030F;
	Sat, 11 Feb 2023 13:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8879B4030F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nH6hO2HBhA6b; Sat, 11 Feb 2023 13:53:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87EFF40297;
	Sat, 11 Feb 2023 13:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87EFF40297
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 739371BF420
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 13:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D5D160A65
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 13:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D5D160A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mlSDd0BU5EBD for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 13:53:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72BE260759
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72BE260759
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 13:53:15 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id j25so7866301wrc.4
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 05:53:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PqGTkvc+hipAL1TiVecqhjSvqFJ9NhtxyQjxOdpwZqE=;
 b=P8eClLOWEQ2A3ho0UWc+b0QDBv7rb+SQC/qFB129dYVXQAqF4oF71OQgaNdGadKch/
 p7nv6JoYdzPdUjxMgeaPTxji6RhTnuUr3OXR3zq42Ow6B56DDAv6QQcU74WOybCvYD1I
 /gR2Yby0cm2Fmp1y+klfRrkC/Jvvs5kZFuFBf52W+BwaPvgWTGKVLdCbE4duVVPR/r5m
 G1H8EQuzPU58dyJCWdHXx7uvpNUzd+Fjsvvz3sjWC1CcAgMM/hNQjv5o2PVzhI/3Uyk6
 V7k0gkId1J6qfh0SEikms1FBTBrJMgsik5ay5n3fwypyT8ZQrS7wDWRPKrwrKvFWsqZg
 CO4w==
X-Gm-Message-State: AO0yUKUbJIs7LIA/lG7Q5kmvWsYP6aWPj4u8thXLGlUZr60redKA37Zp
 OMNORlL+kef9Hdhg/btjPWI=
X-Google-Smtp-Source: AK7set+VS6gbyxv/qznqHcPVJDwISGbpaWGLat6iMdZsBCINKLHHRt+GADCyvrn5/e+ciYEfYknDtQ==
X-Received: by 2002:adf:fd83:0:b0:2c5:3fcf:44c8 with SMTP id
 d3-20020adffd83000000b002c53fcf44c8mr6835472wrr.28.1676123593626; 
 Sat, 11 Feb 2023 05:53:13 -0800 (PST)
Received: from ?IPV6:2003:c6:373c:c74e:3414:cb6a:6234:dc92?
 (p200300c6373cc74e3414cb6a6234dc92.dip0.t-ipconnect.de.
 [2003:c6:373c:c74e:3414:cb6a:6234:dc92])
 by smtp.gmail.com with ESMTPSA id
 m3-20020adfe0c3000000b002c4084d3472sm6095002wri.58.2023.02.11.05.53.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 05:53:13 -0800 (PST)
Message-ID: <7f57a607-bf3c-0250-ed23-c6fbf73961a3@gmail.com>
Date: Sat, 11 Feb 2023 14:53:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>
References: <20221031124625.21172-1-raphael.pavlidis@gmail.com>
 <87h6vw5l2r.fsf@dell.be.48ers.dk>
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <87h6vw5l2r.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PqGTkvc+hipAL1TiVecqhjSvqFJ9NhtxyQjxOdpwZqE=;
 b=lXarbSaOCCRQA90jhMmPEUU2vCyO86OpmWgku4+BIioI7n/qJ9O35+pHwZ+kbmsxPk
 T65QBFJOxvnriuVQTAmIjeb/pTCaSVm0ZUi+zTam20le6ktS18T+HY1O/BmLJoYpm4ux
 +6Nn1qoCBYlYtPwIHHv40r3AJruZcR5Nzf5BX1Ztz21DFfoZqYuVQuZD9BnSHUEUoYdp
 htEBMpzY5zPPdWuHA+HnpsLMOaXVk3rEmbkH+wYovI+L2Pb8k22hJ0W/amH2xWVwKgt4
 QjPV5pINjn/rGEsiCP6SMXeQsDliscfMsj1H/RujqE2Cd3Z5xlIHJ+YMc145xvTDUzwv
 1esg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lXarbSaO
Subject: Re: [Buildroot] [PATCH v1 1/1] package/sway: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 08.02.23 14:43, Peter Korsgaard wrote:
[--SNIP--]
> 
> How did you test this? Here wlroots with x11 support doesn't build as we
> don't have an Xwayland .pc file or binary in Buildroot.
> 
I create a xwayland package, which build the xserver binary, but did not 
send the patch yet. (This will fix the problems with weston, too)

>> +else
>   > +SWAY_CONF_OPTS += -Dxwayland=disabled
>   > +endif
>   > +
>   > +ifeq ($(BR2_PACKAGE_GDK_PIXBUF),y)
>   > +SWAY_CONF_OPTS += -Dgdk-pixbuf=enabled
> 
> You also need to ensure that sway is built after gdk-pixbuf with:
> 
> SWAY_DEPENDENCIES += gdk-pixbuf
> 
> Committed with that fixed, thanks.
> 

Thanks,
Raphael Pavlidis
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
