Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442D9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C04E460E65;
	Mon, 20 Dec 2021 22:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LOInvO1bbq0J; Mon, 20 Dec 2021 22:33:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06A1060E3C;
	Mon, 20 Dec 2021 22:33:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B2AA1BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE56B40288
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QrPyKqvxVVui for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:33:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E68CF40252
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:33:28 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id e3so44340855edu.4
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 14:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=sB7tVgDpeqQLUzQ46r+CmS3z07wdXjtxCThC3wNJImY=;
 b=TZEPh3KTc4Ah6lgJENuvM+Lfi14E5bqA2WpGIZ9M5CuCO204Ql/lNybHj/8TGLWAgH
 p/R6a1XY57pV1NHTaaGzfEICnO9JsadVv7q6qzLDPTXOKXbksvVloPvRLyxFaHNc/EkO
 FXmtrah1mjG6BbdymfsQNGFGp9wDkzmhskP0UnBb8aU4QOKwwg2vTBZeATgA5tRtBQSn
 VHBAkjuv97bMvHMKGQ6PR9R4V8ZmGm0vk3NEig/fNv0N7yM8IG3xqopKuNz1HQMPbXcP
 VSEhbUzYqCiKzb+ta74jmyAkfcKsRaS6GVLtVLH7ct9m/B48x22WphNiIJuUPV/zhTHQ
 7gTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sB7tVgDpeqQLUzQ46r+CmS3z07wdXjtxCThC3wNJImY=;
 b=QfXzs0JEqqesxXtOMfjZYFoWVjumOjcOGrKzLnhNYUY24OEtdWcy8UjESjU9Bs6QFM
 KLMPXN/S9lSpKDby8XXQW9jM9u28JMJXfgqG56IXWZI2rZisiHCWNrdn4MS80CbqO0rT
 Y911htUAv1xdqQdSAFO52n2Ubkb+hudduUu5I5GZeOZCt7kzHu9L+TTtY7qRUBXm1tSu
 +tQDt2Pc0lBZqXQQw0/WjpIyyX0Nv51Py5ARagLj9ONeVRIY2g2YAsYJINmwGWWsB/yP
 754pETT+TxAq4rRHLvEJeY21TRgYCkJ9oS4L3dyvM6SEKwDHzg5FlYMIuuwrTKdj6c5V
 KdQQ==
X-Gm-Message-State: AOAM533jHomlU+KjChM0nq2YwCxPtc0hMls6z8DatXbirzXukrNB0B0j
 3HToLQDQB9W+D7lTAGGl9cS18A==
X-Google-Smtp-Source: ABdhPJxhg3Wajds6zkxE/V8rrT0lBu39sF1CbOlSmIkgY+PLNc9/Jt5L04jN0tN0o/wZsG/45lrgNA==
X-Received: by 2002:a50:fc07:: with SMTP id i7mr234313edr.117.1640039606745;
 Mon, 20 Dec 2021 14:33:26 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id cw11sm1428720ejc.69.2021.12.20.14.33.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 14:33:26 -0800 (PST)
Message-ID: <d4ded68f-2bc1-b728-c653-68eabd2fa06c@mind.be>
Date: Mon, 20 Dec 2021 23:33:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211219160234.1358835-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211219160234.1358835-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pppd: fix build with kernel >=
 5.15
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/12/2021 17:02, Fabrice Fontaine wrote:
> Fix the following build failure with kernel >= 5.15:
> 
> sys-linux.c:148:10: fatal error: linux/ipx.h: No such file or directory
>    148 | #include <linux/ipx.h>
>        |          ^~~~~~~~~~~~~
> 
> This hook could be removed as soon as a new pppd version is released:
> https://github.com/ppp-project/ppp/pull/326

  In that PR, the maintainers say that instead --disable-ipxcp should be used. 
If that doesn't work, please add a comment so they'll actually merge it. Right 
now, it looks like they won't.

> 
> Fixes:
>   - http://autobuild.buildroot.org/results/5a7f89e5178735f4d3e3f3360f0feb263f6ac431
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/pppd/pppd.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
> index 71bfceb607..19b6f3ccce 100644
> --- a/package/pppd/pppd.mk
> +++ b/package/pppd/pppd.mk
> @@ -57,6 +57,13 @@ ifeq ($(BR2_PACKAGE_PPPD_OVERWRITE_RESOLV_CONF),y)
>   PPPD_POST_EXTRACT_HOOKS += PPPD_SET_RESOLV_CONF
>   endif
>   
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15),y)
> +define PPPD_DROP_IPX
> +	$(SED) 's/-DIPX_CHANGE//' $(PPPD_DIR)/pppd/Makefile.linux

  Even though it's a large patch, I'd prefer to take the PR patch instead of 
sed'ing. Easier to keep track of when updating IMHO.


  Regards,
  Arnout

> +endef
> +PPPD_POST_EXTRACT_HOOKS += PPPD_DROP_IPX
> +endif
> +
>   define PPPD_CONFIGURE_CMDS
>   	$(SED) 's/FILTER=y/#FILTER=y/' $(PPPD_DIR)/pppd/Makefile.linux
>   	$(SED) 's/ifneq ($$(wildcard \/usr\/include\/pcap-bpf.h),)/ifdef FILTER/' $(PPPD_DIR)/*/Makefile.linux
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
