Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F14DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 17:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECAA141937;
	Thu, 21 Apr 2022 17:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4DRTS1HMkI4Q; Thu, 21 Apr 2022 17:57:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FEB64168E;
	Thu, 21 Apr 2022 17:57:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AAA9C1BF406
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9991C83148
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S0Jk-r78p8u8 for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 17:56:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5D61830E2
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 17:56:57 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q7so122085wrm.5
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 10:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+640ODq2LHJF9W3BhfGaL/MY9bnvgWtjoU2Hq/Pk0J4=;
 b=EaY3avapY0l91PMXjWtGrrpQV/eb8OZGbvJqIsRez3T0O+kvBAMaMXhAYLQNP2py5Z
 A5dz3JMotALeQc9xe8Z8tdbmref7zukKjcpOqikwAW6tx5Y12FTs+bRZPZDBCGaRzBmb
 IWuYxGfJdgst14OfTp07H1EIWLRQrV3DpKfOzDc9IU5EU+e9RrcWcLhjPY3tJnemN0K7
 CwYySK8dB9AnHt0tttY7s/LtwO2b5HiqrHZFFC4oJIeWREaQWTtOpdzVQS28WkNgmv9I
 02jGsJU1c06ulvRMapov3rHI6k4jIGJQaD1tobwNhI0jc+TbvkNptpPAp5QibJT07upP
 aXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+640ODq2LHJF9W3BhfGaL/MY9bnvgWtjoU2Hq/Pk0J4=;
 b=PB/io4t3AagMAQjG0um8L9ar7U5Fs4ufOz9mSt3A3Kp7h7vPSSIdNRvGM33BujQgdZ
 X2rxP1SCYrOguHRC03VYbhjDdMG9Bw2qQec1i8FyM2Q89C8YqFPqiPj3EyAi9RNr5Fh+
 6jBxIbk6s9rcmkWAVqzFZAtCLM4cs7CyC2rfj/dPZSD5/n46tkZBK4ZFxYcl/K/CZYPa
 sOCwloYQTX40XbYRtn/xChZcqo6gj+die2LRvvYF719Hq566qigxOa32SyY/u81Hm39T
 nYLQR/+kEeNMmwyl2id8TRUuEiaOgtCdLmms0qzl4BssH2h9ovc6Yce3JeFTSSzJUJFo
 frzw==
X-Gm-Message-State: AOAM531EeSgq7f2Ygu6Mngs72K1dDkn3iB68PUM8kwatRK+gBItZFXW7
 ovdn9ss4+sshU3vwlFikxpf9Yw==
X-Google-Smtp-Source: ABdhPJzhvGqG03XY8Qz3b/Kqqsx1mNnCw8JFaZKzjbw8gyPdGJU7Q0qcdDI4BZE3Y7pWdqk9jlLO/g==
X-Received: by 2002:a05:6000:15c6:b0:20a:8f8b:d029 with SMTP id
 y6-20020a05600015c600b0020a8f8bd029mr662789wry.319.1650563815762; 
 Thu, 21 Apr 2022 10:56:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a0560001b8e00b00205918bd86esm2816768wru.78.2022.04.21.10.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 10:56:55 -0700 (PDT)
Message-ID: <5546c432-bdc0-944d-14c4-32c3648319fb@mind.be>
Date: Thu, 21 Apr 2022 19:56:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220412163624.1143941-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220412163624.1143941-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/netdata: fix uclibc build
 without wchar
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/04/2022 18:36, Fabrice Fontaine wrote:
> Fix the following uclibc build failure without wchar raised since bump
> to version 1.33.1 in commit 73dc2eef2dc40b78e732872b26eee0bcea1087d1:
> 
> configure: error: Netdata requires a compiler that supports C99 to build
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/bca4d370ed0553d5f99f1277d0a1e3b49f62b95f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/netdata/netdata.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
> index d29733d8f6..dade6c625b 100644
> --- a/package/netdata/netdata.mk
> +++ b/package/netdata/netdata.mk
> @@ -18,6 +18,10 @@ NETDATA_CONF_OPTS = \
>   	--disable-unit-tests
>   NETDATA_DEPENDENCIES = libuv util-linux zlib
>   
> +# ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
> +# provided by autoconf relies on wchar_t.
> +NETDATA_CONF_ENV = ac_cv_prog_cc_c99=-std=gnu99
> +
>   ifeq ($(BR2_GCC_ENABLE_LTO),y)
>   NETDATA_CONF_OPTS += --enable-lto
>   else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
