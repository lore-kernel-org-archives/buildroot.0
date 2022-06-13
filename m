Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE655C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 20:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75C6B40A03;
	Mon, 13 Jun 2022 20:22:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u3I8vRsem5Qx; Mon, 13 Jun 2022 20:22:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 860AC408EA;
	Mon, 13 Jun 2022 20:22:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF88D1BF37C
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF30082CFD
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yfF5tZcowTKi for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 20:22:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A76D82CF1
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 20:22:19 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id m20so13224767ejj.10
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 13:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=nYAU/Oet6iZSlmahsGwjJYgFd2EVfX+RMCQ4/ZhPSFM=;
 b=a4MyR74f1d/becevc5oJySyyvEEAJDtj4FhrhiBuddXoSAxfDCnVCTC6tcKs6Vnsfn
 xoFJWlGgUlhK7uuByI9nr9xhApz4481KTiM17w7q7mkuQDzQIZvkk6ETcpztl1bOKXVd
 CyjVbIgJ9dpfzWPUG2ZBESf4aFojfHQIV7YbFsA8qF2vFzC+3KrgtO94Zqq5Eyhi/KQo
 WXZELjJe9R7iBIeCnvBUp6XsKm5ddTfqYkb7TUBwdEIABF2WaYr6PURJWDFYX7V1q3bs
 zkrofMRUdvBWKkZ6lDwVXQF6395Wku2KV7hWnbbTN6ogsfMdo0UU+Lz1VXe3khs5GIxW
 SU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nYAU/Oet6iZSlmahsGwjJYgFd2EVfX+RMCQ4/ZhPSFM=;
 b=IsAtj2bxQuHABLoJygFFhYptky/3mzMBUZwjG/PQyDctTYKMi+s5I38E86GxY1aN4D
 IRZpYMav/4nDhKTNiU3itiAjoJq4e1yK7UOGw+DMs+YOp51uv786KEGxDXPs7OF9gcbw
 at7bveyPnbSd9AxTLlDySVmvRLmhnNO103ccu1aeKqX35Tc6djzY1t/giPcP5ffhfy7W
 QlCrv44IPb1acFpqEWTA0CSUDmtlWq+LfYsaVVrO5Rsi2WRXAGfZ4DE1UYnXoNrhc1MU
 z805cEGOuPl6l1/AaZyV+4kqDGOJSyQKMe8W96zz36zjqbTWD690LvaGwdPUSRkppeUf
 q/+w==
X-Gm-Message-State: AOAM532Zktlr1NtmUv23SkbWDsaB8tYNX/DDrUAjYjQW8zaabPZf5IOK
 iagefdfgbgwl3hTbVa56tTLluD6akqgIXg==
X-Google-Smtp-Source: AGRyM1s2v4z6OsoVfEzLJtnhefnvEe+BZGeGRDh7VFJcrm1wtYuUhFBzhzb3kfrXNLyNeDElacykyA==
X-Received: by 2002:a17:907:86ac:b0:708:9c4a:c6e9 with SMTP id
 qa44-20020a17090786ac00b007089c4ac6e9mr1296756ejc.297.1655151738257; 
 Mon, 13 Jun 2022 13:22:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 jw15-20020a17090776af00b006fec9cf9237sm4196284ejc.130.2022.06.13.13.22.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 13:22:17 -0700 (PDT)
Message-ID: <2c4e72f4-6a71-5d90-887b-44611abae6c8@mind.be>
Date: Mon, 13 Jun 2022 22:22:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220609211304.2939572-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220609211304.2939572-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libmediaart: link with -latomic
 if needed
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



On 09/06/2022 23:13, Fabrice Fontaine wrote:
> Fix the following build failure with BR2_PACKAGE_LIBMEDIAART_BACKEND_QT
> raised since bump to version 1.9.5 in commit
> 3db4d486d689b4a9d59c8f7637211893b0a1cb1b:
> 
> /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: libmediaart/libmediaart-2.0.so.0.905.0.p/extractqt.cpp.o: in function `std::__atomic_base<int>::operator--()':
> /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/sparc-buildroot-linux-uclibc/include/c++/10.3.0/bits/atomic_base.h:334: undefined reference to `__atomic_fetch_sub_4'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/39aa4ecd37de774e06f67a6e1c4495dc1f0917b4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libmediaart/libmediaart.mk | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
> index 77665fd95b..de92cde849 100644
> --- a/package/libmediaart/libmediaart.mk
> +++ b/package/libmediaart/libmediaart.mk
> @@ -24,6 +24,9 @@ else ifeq ($(BR2_PACKAGE_LIBMEDIAART_BACKEND_QT),y)
>   LIBMEDIAART_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
>   LIBMEDIAART_DEPENDENCIES += qt5base
>   LIBMEDIAART_CONF_OPTS += -Dimage_library=qt5
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +LIBMEDIAART_LDFLAGS += -latomic
> +endif
>   endif
>   
>   ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
