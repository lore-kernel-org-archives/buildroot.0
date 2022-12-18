Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042EDC4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 00:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88B42400D0;
	Sun, 18 Dec 2022 00:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88B42400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kTn8PPqJEh7i; Sun, 18 Dec 2022 00:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D399D40003;
	Sun, 18 Dec 2022 00:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D399D40003
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A0271BF847
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 00:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD628414E6
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 00:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD628414E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fMAycVTNRLdV for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 00:44:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91457414D1
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91457414D1
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 00:44:33 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id i9so8460607edj.4
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 16:44:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qtN78XNS5wZcFqw4VWNpePnIR4dghAtLg59OWCppEZs=;
 b=Cnufa/8amQuNW/uWx4FFfPMPSJgGGbn993QWXYUhtS8n4IwCxV0FRwCAj6OliWBUJ/
 Iy3Bri2q0OKdkuiYjpaf5WTaXxf3DdDEM7Se3iTwALLkbwfqvTqEElgB/qaqanj+PXu6
 helUTwkumRw/BMuHBbRJ3KXhLBEhk+EiZyV1CevTfOHpDYNopq70FGsvJqQ7kE4NI4tZ
 1H9oTRbKeT1ra0haDkMdKT9IroeFvDXCP3/nL67M/Ne987njaXzYNwENq0FPyuDXu1iG
 FRcWJ1G1wAnZUJSnt4S0RtuupehfdBvcGovTsCuJw5OHP34XAEZHGhMZwwWclLxkyToD
 InmQ==
X-Gm-Message-State: ANoB5plTi6huEoEk3DkZ980pBFjHlU7fcpd+JV2uWVS94IGa0sfrtruF
 omzCmwu2WnoqTq+8KcZMhioVCmk8T2aXG/Kuups=
X-Google-Smtp-Source: AA0mqf7q+mJRnXpAl7asFR8BV1JAyvX+pH64u4UgqKClVahOoer/N3G+rq9pjySCcUEKd3YdwnNxrg==
X-Received: by 2002:a05:6402:550c:b0:462:6ba5:7215 with SMTP id
 fi12-20020a056402550c00b004626ba57215mr29252796edb.32.1671324271319; 
 Sat, 17 Dec 2022 16:44:31 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 h28-20020a056402095c00b0046c64b0efdbsm2595970edz.33.2022.12.17.16.44.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 16:44:30 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id m19so8420092edj.8
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 16:44:30 -0800 (PST)
X-Received: by 2002:a50:fd07:0:b0:475:ddec:3f7f with SMTP id
 i7-20020a50fd07000000b00475ddec3f7fmr766970eds.113.1671324270234; Sat, 17 Dec
 2022 16:44:30 -0800 (PST)
MIME-Version: 1.0
References: <20221217232556.1609969-1-christian@paral.in>
 <cbc76ca1-a87e-7a2a-d06e-222d9c00a29e@benettiengineering.com>
In-Reply-To: <cbc76ca1-a87e-7a2a-d06e-222d9c00a29e@benettiengineering.com>
Date: Sat, 17 Dec 2022 16:44:18 -0800
X-Gmail-Original-Message-ID: <CA+h8R2pLQd9pLeQq+hDMpdO34BBv0E=ToZCP7AB5A-qEp3HRhA@mail.gmail.com>
Message-ID: <CA+h8R2pLQd9pLeQq+hDMpdO34BBv0E=ToZCP7AB5A-qEp3HRhA@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qtN78XNS5wZcFqw4VWNpePnIR4dghAtLg59OWCppEZs=;
 b=Tapt8OvGJJ11hG9/3AH7kVydiJ3gxaRKIyiDXx/ZDMh9ymnjUQrzD6u8k+kih01qof
 ZixJhDExsQPnFDa8Fi6NG+gEsC+T2jeyM989zvkK7TkdyhKT8YmwmjUYeQcwPYwtQOIM
 ESRRz7QRBf1mTwvSo4GYvgM1EUxasGh4E+5jPgG8BcobiNi8oIJHfHt4mnaA3RaaDgUy
 7CFH7f4Zcmg9CCvAHwXTEssubnpPoE+BP7x/bOC2UuRRODTX1QcbU1R9r/b/Z21tukbn
 2rpZcudUFVElOuPnIkbcrmXtzZkNYJ0wvH4DwkvyTnxdPLMDSy817Du4qrKunvL36wOd
 zGYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=Tapt8OvG
Subject: Re: [Buildroot] [PATCH v3 1/1] package/rtl8821cu: new package
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
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On Sat, Dec 17, 2022 at 4:38 PM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
> Check my pending patch as reference:
> https://patchwork.ozlabs.org/project/buildroot/patch/20221213203236.171656-1-giulio.benetti@benettiengineering.com/
> There I use CONFIG_PLATFORM_I386_PC=n but the approach is the same.

Thanks, that's much cleaner:

RTL8821CU_USER_EXTRA_CFLAGS = \
    -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
    -DCONFIG_IOCTL_CFG80211 \
    -DRTW_USE_CFG80211_STA_EVENT \
    -Wno-error

RTL8821CU_MODULE_MAKE_OPTS = \
    CONFIG_RTL8821CU=m \
    KVER=$(LINUX_VERSION_PROBED) \
    USER_EXTRA_CFLAGS="$(RTL8821CU_USER_EXTRA_CFLAGS)"

Sending as v4.

best regards,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
