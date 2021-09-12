Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0F3C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:42:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D17666108F
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D17666108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 901AB40523;
	Sun, 12 Sep 2021 12:42:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DaoJ3zXIQXhb; Sun, 12 Sep 2021 12:42:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCB9A40530;
	Sun, 12 Sep 2021 12:42:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A4BB1BF47A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 869E04052D
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:42:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ryqrT14tUreJ for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 12:42:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88D0B40523
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:42:37 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id g8so9883440edt.7
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 05:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4h+GAl3xIw+30J1vxxqDvPfW6EhkfgkcVsk1ZZeoqr4=;
 b=Tl//n4XrEo/nNP72Cks2qwECup2uFPlToNjU7hXj/dTQA/wP9TZItrRl88wraVHzFi
 IPZeBDnNCgxSyKGyqRoeF2xfedPrAVTqZvzFg7PeCCjk4ZNXkn292DLatEAbzP+V2hFf
 KEvtjSkhzJa48bWmI5uvsVovTQe5NrUgIDyOpwRKmGrxQAs1LoUFiuAQBMv+7Sfte8sA
 pkXBRJWn9tt336qSL8W+/nFmoUOfR9A2fAgZkMkv1bd4K+Aj80UcZNKHqhK3mv8ZLRLJ
 xkuAFs8X2C/DLCaanScf+0hnDXnR7+0exCb3PeozYnQDPwpNqwJV6ckEZFN+uvwgcsCO
 I9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4h+GAl3xIw+30J1vxxqDvPfW6EhkfgkcVsk1ZZeoqr4=;
 b=yh6F+0O4sD0kR5QahLMDTvE98EEAlxATuf+KUgFxuGQIMJtZkbLBOmzPXE3+aK3Enc
 a7XN0mILOo7Zm5ykub/yz+MSsKp4sao2mq2n59ol1VYUzSvc4DjZwKC0BmO8j99AA6gZ
 5ibINU3xbX/kuhfiCWtzsRWO+IZrNirLPoY50OQeNg7WIYxkEqvkubwMsw3c3trxIh6p
 o5hlKcZLSCpvNZAAqEOGAzDH8Y6u/F3/L8We7NZsNaXGOlB7OHFwD3kn03j2uMrJPluC
 k0DAExqHe+ktaWUm5YbN5BB0ogROamibEITRB/ZX3xJHu17tZ9+2/NR3r6qjQk76t+aX
 ULwQ==
X-Gm-Message-State: AOAM531OJdgNBVOYPVfFeJu9+V2JM+Ov9TX7C5r8vFSPCY9udZKh9S4z
 fqY/EqBafaGep/VUWOmTEpTrj3OL5cPnuw==
X-Google-Smtp-Source: ABdhPJyhZKQi/AsfhIpN2HZYIm6pkX10KgGcTL2g5VMsugexxquGDi1tBiz7jAO8ON/cjKebHjIAYQ==
X-Received: by 2002:a50:ce44:: with SMTP id k4mr7812620edj.375.1631450555825; 
 Sun, 12 Sep 2021 05:42:35 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k6sm2287682edv.77.2021.09.12.05.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 05:42:35 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210905195128.1485052-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <8732a7aa-e04d-8608-c68d-8b17822944ee@mind.be>
Date: Sun, 12 Sep 2021 14:42:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210905195128.1485052-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/pulseaudio: needs xdg SELinux
 module
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 05/09/2021 21:51, Fabrice Fontaine wrote:
> xdg is needed (and can't be make optional as it is unconditionally used
> in pulseaudio.fc) to fix the following build failure raised since commit
> bf44a11cf67fde4ba96928a2a4196103b7ec4ef3:
> 
>  Compiling targeted policy.33
>  env LD_LIBRARY_PATH="/tmp/instance-0/output-1/host/lib:/tmp/instance-0/output-1/host/usr/lib" /tmp/instance-0/output-1/host/usr/bin/checkpolicy -c 33 -U deny -S -O -E policy.conf -o policy.33
>  policy/modules/apps/pulseaudio.te:44:ERROR 'attribute xdg_config_type is not declared' at token ';' on line 317285:
>  #line 44
> 	typeattribute pulseaudio_xdg_config_t xdg_config_type;
>  checkpolicy:  error(s) encountered while parsing configuration
>  make[1]: *** [Rules.monolithic:79: policy.33] Error 1
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/818219c0f722080d9f6ef778fdc50e34dd4187ab
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/pulseaudio/pulseaudio.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
> index 372cd98da8..a238315778 100644
> --- a/package/pulseaudio/pulseaudio.mk
> +++ b/package/pulseaudio/pulseaudio.mk
> @@ -11,7 +11,7 @@ PULSEAUDIO_INSTALL_STAGING = YES
>  PULSEAUDIO_LICENSE = LGPL-2.1+ (specific license for modules, see LICENSE file)
>  PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
>  PULSEAUDIO_CPE_ID_VENDOR = pulseaudio
> -PULSEAUDIO_SELINUX_MODULES = pulseaudio
> +PULSEAUDIO_SELINUX_MODULES = pulseaudio xdg
>  PULSEAUDIO_CONF_OPTS = \
>  	--disable-default-build-tests \
>  	--disable-legacy-database-entry-format \
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
