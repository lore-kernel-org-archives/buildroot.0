Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6068C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 20:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80EE560EA1;
	Mon, 13 Jun 2022 20:23:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NWxBzi-cJXis; Mon, 13 Jun 2022 20:23:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A79C160E50;
	Mon, 13 Jun 2022 20:23:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E76C1BF37C
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C39780B87
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g3UmqeQ-xodz for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 20:23:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C55D80B7A
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 20:23:44 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id kq6so13232629ejb.11
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 13:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=ybQmS0DmwAZWFRiFG1H7ssmcCMz6DKjTboTIisvq0jo=;
 b=Qp1hK9i01a/PHAD7uQppry/OUEAEyfzkmS7oVDxxEbfwMcH/H8mGgStyBCe5wXeWrV
 hutUZL5rS7AjAM3mCDRexctpNcz79sbNYvbSHQrdzh1Itdhq+cSbZSD2LPN1OZ96LMfG
 rzdVLJA2lpIQBXzWmJVcJtJw1Qn/pPfPyOM1b4l5LRI3Eadsx7yj82qeT3s/MU9CuUH3
 nQjzBjKG/q/6GvDMHW6ogigIjgED4dtkfWX/RyKzvWtsxEzwCIGVFb86CFtJIm8emmOe
 TNsSXH306IS88oPl1t0BxECXTpBuew1bC8IK77gqR4a5U2Sd5MF0JeiXkZnESzdEe2Ed
 7oxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ybQmS0DmwAZWFRiFG1H7ssmcCMz6DKjTboTIisvq0jo=;
 b=bg8yd1YrfmBAvVOs7+OYD+atREHOJLLNeTF1owtvqWlOo3cgyqVG3TlK4iOg0+yHhC
 OesgEF3CJoexglxxZDGjA/zJ8OxUr92pdCoqod9MwICyBCcI+ysV87P6MCA9ZII/ucrq
 toZxhUCx3yZXLhQINXmqmw0iPQ/N7wTfQobqpFWtuCZqKyZmKQJwWWrVeXHN3qV3Bb+r
 i9wXKfaEt105G4Ezf0dHnbf2uF3zT6wx3WRUxWHRSjFkf2tKb3QWCD2fAHpMJbKkqQtJ
 W3JUfxVVhjbU60QJeDwIFFCy9VtcZmk61nECObu1e4uIQyJP6BNHXnTGekcyX/WL9jZ0
 pw8w==
X-Gm-Message-State: AJIora8NFFYSq1jdIBOa3dnb1+IJRPFyVLq1E4tHUgsFhdWXyIyVLZMi
 5TYmcUAOtLiuek9/C8nQ251cEudiOQBZ6w==
X-Google-Smtp-Source: ABdhPJwSUqmOf7BDhviZoNH0TENetVgNj7sqMiUzMBXC7anm9isSTwSl/keQ2T9oPiBQQIQ/k0Lz4g==
X-Received: by 2002:a17:906:6d91:b0:715:7d4e:84a2 with SMTP id
 h17-20020a1709066d9100b007157d4e84a2mr1314444ejt.504.1655151822406; 
 Mon, 13 Jun 2022 13:23:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a1709063bc100b006febeb51cd5sm4223264ejf.174.2022.06.13.13.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 13:23:42 -0700 (PDT)
Message-ID: <0f31020a-57af-84c7-289b-9663b8a56f31@mind.be>
Date: Mon, 13 Jun 2022 22:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220609212510.2942019-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220609212510.2942019-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,1/1] package/noip: fix static build
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



On 09/06/2022 23:25, Fabrice Fontaine wrote:
> Pass TARGET_LDFLAGS (which will contain -static) through LIBS (as
> LDFLAGS is not supported) to fix the following static build failure
> (e.g. with musl):
> 
> /home/autobuild/autobuild/instance-15/output-1/host/lib/gcc/microblazeel-buildroot-linux-musl/10.3.0/../../../../microblazeel-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-15/output-1/host/lib/gcc/microblazeel-buildroot-linux-musl/10.3.0/libgcc.a(unwind-dw2.o): in function `__gthread_once':
> /home/autobuild/autobuild/instance-15/output-1/build/host-gcc-final-10.3.0/build/microblazeel-buildroot-linux-musl/libgcc/gthr-default.h:700: undefined reference to `pthread_once'
> 
> While at it, alsp pass TARGET_{C,CPP}FLAGS through LIBS as suggested by Thomas
> Petazzoni
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/5ea9b1b976aecc401e0aff21eef3e31c8ed17181
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>   - Pass TARGET_{C,CPP}FLAGS through LIBS
> 
>   package/noip/noip.mk | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/noip/noip.mk b/package/noip/noip.mk
> index b7fcc84e2f..1bf4524a51 100644
> --- a/package/noip/noip.mk
> +++ b/package/noip/noip.mk
> @@ -10,10 +10,13 @@ NOIP_SOURCE = noip-duc-linux.tar.gz
>   NOIP_LICENSE = GPL-2.0+
>   NOIP_LICENSE_FILES = COPYING
>   
> +# Pass TARGET_{C,CPP,LD}FLAGS through LIBS as noip doesn't rely on implicit
> +# make rules
>   define NOIP_BUILD_CMDS
>   	$(SED) "/^#define CONFIG_FILENAME/ s/PREFIX//" $(@D)/noip2.c
>   	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" \
> -		CFLAGS="$(TARGET_CFLAGS)" PREFIX=/usr CONFDIR=/etc
> +		LIBS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS) $(TARGET_LDFLAGS)" \

  TARGET_CFLAGS already includes TARGET_CPPFLAGS, so I removed the latter.


  Applied to master, thanks.

  Regards,
  Arnout

> +		PREFIX=/usr CONFDIR=/etc
>   endef
>   
>   define NOIP_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
