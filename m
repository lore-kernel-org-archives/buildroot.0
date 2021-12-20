Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BE2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD3D360E67;
	Mon, 20 Dec 2021 22:34:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YpCOav4Fu7zX; Mon, 20 Dec 2021 22:34:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 269B660E64;
	Mon, 20 Dec 2021 22:34:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FB1C1BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ED1C81B25
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:34:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 40aTQ3fPs8J7 for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:34:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66EDE8144F
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:34:11 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id w16so15896213edc.11
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 14:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0YBjWyS6PbY7q0RvWQvQWUTwsERXU2NV4OutIW6Ch2c=;
 b=Swv71el9GgCaPCOQkpLIiF1Tkono+hcuek/UuIV5e9Na+t6vmsofdUa70f6miyr//q
 KfedvYK+dtfeT29uIp7C7Dm3azQ2aPHEV0zH17aixq3XFLGKpVPvF6rMiXDYfBQaffhX
 qd8t1NxswI2ngLnLxexx/f6S1nAWL+gRVkuUY7evtwxDVbhcC9t8Xv2x2VxeAVqt+sGw
 xL6chMexyDKj1hWiyTAjncvQrWso9S+NAGy0XCthKfXWU0o24IP2S1HJLNbwF3PhZ/Zg
 3ctVByTxb3z5Ru/pep7Fmj7IQDidAAFYhSia88+TpNoWOcDw6reif87HCNCdYWqj1GFF
 m2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0YBjWyS6PbY7q0RvWQvQWUTwsERXU2NV4OutIW6Ch2c=;
 b=YTCXJi5kqPqLLXwwN1SBNEbsPi2rMKb92EYuUVCbjTPSvnIxtfffVmcti4Qv1Ec/h/
 X5/fa73EuSIwMO7aMJYSOw3+d00Z4K5TNcSPDqEQQ4V0aJaTdj8qZAVsI2W3KXHsJ7bj
 FCwNMWpiGSpshMg+WJ5ddm9MhGTByiyK8hlnYiRpziayUuOanDHrnvy+u9XV7rWywcwd
 4uqtSwiVEPVPG5rmYAl0OBDYDzWghGLZg1vyDF7TkiklqAuv4mjdOGxSUqOec084D9wS
 OSJwt6C7u6qGzuX5+wuRd1ogSE+LMeYF7ZaHSgDv1w82NmDXv6/DfRgj049fKUqpznOr
 vdTg==
X-Gm-Message-State: AOAM5310XDIibdSBu5aEmaKAOwq3hFluorxwVHrUvKXUjGjU+p+S0aBG
 hQGZG8vRIisW5ygzMrKB3b9AXdD+FRvZNw==
X-Google-Smtp-Source: ABdhPJw75YGhnFZ6uvPDPyrdpMB08ZcClm+3662R9Si2F+U11JZAiDWV+0z9bBpdrC9LQaGpoayRGQ==
X-Received: by 2002:a17:906:1c51:: with SMTP id
 l17mr233455ejg.610.1640039649612; 
 Mon, 20 Dec 2021 14:34:09 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 23sm5739753ejg.213.2021.12.20.14.34.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 14:34:09 -0800 (PST)
Message-ID: <7f99f3a3-cc60-a874-afbf-8f89259f63ff@mind.be>
Date: Mon, 20 Dec 2021 23:34:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211220084645.28659-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211220084645.28659-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/connman: add iwd support
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
Cc: Martin Bark <martin@barkynet.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/12/2021 09:46, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/connman/connman.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/package/connman/connman.mk b/package/connman/connman.mk
> index e5e596c973..d3ebb40a1c 100644
> --- a/package/connman/connman.mk
> +++ b/package/connman/connman.mk
> @@ -85,6 +85,13 @@ else
>   CONNMAN_CONF_OPTS += --disable-wispr
>   endif
>   
> +ifeq ($(BR2_PACKAGE_IWD),y)
> +CONNMAN_CONF_OPTS += --enable-iwd

  No need to add iwd to CONNMAN_DEPENDENCIES?

  Regards,
  Arnout

> +else
> +CONNMAN_CONF_OPTS += --disable-iwd
> +endif
> +
> +
>   define CONNMAN_INSTALL_INIT_SYSV
>   	$(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
>   endef
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
