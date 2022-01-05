Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1281AC433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 10:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A5C240341;
	Wed,  5 Jan 2022 10:02:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Par8NVrMKCL0; Wed,  5 Jan 2022 10:02:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF5F0409B0;
	Wed,  5 Jan 2022 10:02:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 890241BF390
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 10:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78989823F6
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 10:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ji9ZW8EI8gkG for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 10:02:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BA7D823C6
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 10:02:25 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id w16so159886280edc.11
 for <buildroot@buildroot.org>; Wed, 05 Jan 2022 02:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=yuevKRVGI18v5HU8kWxOs5/v4yWsRPeuODViee3qOBI=;
 b=X1FGnJfSsNSN5g9ULb05bxyIv2zVUnrsH99f7i7kABLIoKCzSmnIp3FcXbXDaZTcuH
 GX51PVDrIisD0leYI3x/tWfsovE5jWsKvuXjAtdfKqS6EQOqDCkkx+Avn3+4JH9KKvA+
 mErSBow/G9CHWd3NqpLTKW/e23c/8m/RLLg4eiz0sQqsXIsQfbkqVAE4oTwhuLW8VEex
 n5tS4EMkmEAxECYHcnGLwhnRjGeamb/WlkZtva9cTO/qped8VjTLOoOk0QYblHO66OKE
 f/w6isOc21K7onuonUbU0AFi0HNnNaFF73HgCogw/Ncx+x8gqqjdFt1itNG4Eqf5XL5e
 SxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yuevKRVGI18v5HU8kWxOs5/v4yWsRPeuODViee3qOBI=;
 b=rckP+saxskSaa2Yr+l84rkV1DzHao/w/R+qEDYooPG9jLLVRfqg86/lOaJRG0jRW/a
 E+xHHRX0lS7BkmXTlkyLCcs8/pwPEUtSSMYXz0m+DwN8bcYMsvY/fVtSvt9K397Z4Pno
 iCbWBZIZw8gUxbpOrm7UZanRmvuZQ1IFb23EqaAhg1+dxIP1kwnKPrBIUpqySQWZ4QbB
 Jaj5UTRErdVWIn2A2RetGDxxtJXnEa1TxckY0suzx5oQRCIHuCRuO2LukIyPhuA9ERc+
 O9UKzLF2XhEwtaWyvXnFZPx68SE2nM5wjd+zU4zwLbVjVH/ed0ZRSTsf7cTopLvrijQF
 5HkA==
X-Gm-Message-State: AOAM533BjrNQAWPUJKDnGShN7gQXNzOUP29EyTsTgjp7qAv4qhpK/qPd
 4Fy74M0uOtpnjYUDdfSwTUawbCo0lpc9IA==
X-Google-Smtp-Source: ABdhPJzXQRhPwde6xBFRHhTRrjmuREnM1AEu0hUUWCiHAj7U+APzuzZzVo0z36ebLFx4AnMsmOz2iA==
X-Received: by 2002:a17:906:84e8:: with SMTP id
 zp8mr43472005ejb.289.1641376944000; 
 Wed, 05 Jan 2022 02:02:24 -0800 (PST)
Received: from [10.101.1.216] (ip-185-104-137-32.ptr.icomera.net.
 [185.104.137.32])
 by smtp.gmail.com with ESMTPSA id nc14sm12152583ejc.44.2022.01.05.02.02.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 02:02:23 -0800 (PST)
Message-ID: <495ad364-0adb-e8d0-bbe7-b1157f0cea70@mind.be>
Date: Wed, 5 Jan 2022 11:02:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20200407175535.409309-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200407175535.409309-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/avahi: add
 gobject-introspection optional dependency
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



On 07/04/2020 19:55, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/avahi/avahi.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
> index 73db37545f..3546979d83 100644
> --- a/package/avahi/avahi.mk
> +++ b/package/avahi/avahi.mk
> @@ -82,6 +82,13 @@ else
>   AVAHI_CONF_OPTS += --disable-dbus
>   endif
>   
> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +AVAHI_CONF_OPTS += --enable-introspection
> +AVAHI_DEPENDENCIES += gobject-introspection

  It later turned out that this fails when DBUS is enabled, and the solution is 
too ugly to apply [1]. Therefore, I marked this as Rejected.

  Regards,
  Arnout

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20200813232351.1552307-1-aduskett@gmail.com/


> +else 
> +AVAHI_CONF_OPTS += --disable-introspection
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LIBEVENT),y)
>   AVAHI_DEPENDENCIES += libevent
>   else
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
