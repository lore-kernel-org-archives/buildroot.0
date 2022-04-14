Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE17CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C94440A8C;
	Thu, 14 Apr 2022 20:11:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id De6OAMqSC0zO; Thu, 14 Apr 2022 20:11:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83D96404D7;
	Thu, 14 Apr 2022 20:11:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D34C41BF393
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D08B5831E3
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:11:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a0JEpOqKmS2A for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:11:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65CCF82C84
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:11:38 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id z12so7756617edl.2
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 13:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=rt1nE0BZGeMtKh9RR1z+gNFzW+7zk4FI+huubYJk7zU=;
 b=U1HG36hXwfbrcJ+unMMUlzkfyZq8Q9qt5qZ6bqbCdkFbbeEqcnvlTI/sjgzkmUyaPI
 DA1RUJ3KV43WfoQQ06YcpR/0Odfb8MoyrvpXwu5pMXBZlipfuXTpJLnEoq3PttaBV/ub
 wozhw9r/uKDwUF6XyjHt1snBqerJHzbaGdE8VdZMoifdLS0DkH0CDy1aAZXXLfg8kERS
 2AET14sOE/yJaUhW+zw5BlXVb1qXVsqxLzwLuIQ3Z7FAdLQbX8NLLHbgDJwpjV92ABsO
 6elHIINZbINICwPHLSrc0Uymj+4oa5zkb4n8FR4KCfY2xiUzEViG9dKdklkpXH6WNV4k
 8n6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rt1nE0BZGeMtKh9RR1z+gNFzW+7zk4FI+huubYJk7zU=;
 b=NZHWEfVhwsji30u8fzQxTnGNNuMhy6UNu/ewfOIF/oj6qFJhT8MKMq9sf215AMEHuh
 yAb0lUrTHUxQfQPGtNrAd7mlrVGmVTpvf8ZNbf66CDi+NvRtoqqnJNwvPXZuOgl4U3lP
 8Q2ci+S0wUOPKxqsvUH+lg15QSQkKV+uRlOhudjZ6LMZxOu6bwBZV0DFK9Fv1kH4kmJd
 9n2Jv+VBzz5GaLwYBhChdpYxYJ1m2cMznRgvreim5zXRkGsKKkI/9PQ0TXQWh0mLa73g
 XW032SyhMORUQHjGTyvhtWSl+/GUfhf3aq+geSb5QG9QKgNIwI/oBEpgbl4suC/A5S5W
 ADsw==
X-Gm-Message-State: AOAM532Ggjhdjpk7d7X09IuXqJp1bE624RxP1CxGX125EGoiXBU1tbPU
 IiAQ7+QbS7nufJ5j14VvEt5yow==
X-Google-Smtp-Source: ABdhPJy6fe/xKK1OgJqT5SnUY524C2TYqBdyeomI27Kp+rv8/X4kDmNaH09Sztv4fQdHBy//MqTjCg==
X-Received: by 2002:aa7:cc02:0:b0:411:487e:36fe with SMTP id
 q2-20020aa7cc02000000b00411487e36femr4882438edt.338.1649967096482; 
 Thu, 14 Apr 2022 13:11:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 gb3-20020a170907960300b006dfafbb4ba4sm979483ejc.83.2022.04.14.13.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 13:11:35 -0700 (PDT)
Message-ID: <70529734-5955-f97c-3cae-3cd764d67333@mind.be>
Date: Thu, 14 Apr 2022 22:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220410103014.115744-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220410103014.115744-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/libkcapi: fix build with BR2_OPTIMIZE_0
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



On 10/04/2022 12:30, Fabrice Fontaine wrote:
> Override CPPFLAGS to fix the following build failure with BR2_OPTIMIZE_0
> raised since bump to version 0.14.0 in commit
> cd707a9112e38b4ce98326b96c0ed12054ca1cca and
> https://github.com/smuellerDD/libkcapi/commit/0e7b2b0300782aca19c324f3352f109777b4c51a:
> 
> /home/autobuild/autobuild/instance-15/output-1/host/i686-buildroot-linux-gnu/sysroot/usr/include/features.h:412:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
> 
> It should be noted that upstream already rejected a PR to remove
> -Werror: https://github.com/smuellerDD/libkcapi/pull/132
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/35141ea3046f5a4593e0b27ef92e4ace6bc0be66
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2 (after review of Arnout Vandecappelle):
>   - Override CPPFLAGS instead of COMMON_CPPFLAGS as -D_FORTIFY_SOURCE=2
>     is added to CPPFLAGS by ax_add_fortify_source.m4
> 
>   package/libkcapi/libkcapi.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
> index 71dfbd9eff..30d500696b 100644
> --- a/package/libkcapi/libkcapi.mk
> +++ b/package/libkcapi/libkcapi.mk
> @@ -15,6 +15,7 @@ LIBKCAPI_CONF_ENV = \
>   	ac_cv_path_DB2PDF="" \
>   	ac_cv_path_DB2PS="" \
>   	ac_cv_path_XMLTO=""
> +LIBKCAPI_MAKE_OPTS = CPPFLAGS="$(TARGET_CPPFLAGS)"
>   
>   ifeq ($(BR2_PACKAGE_LIBKCAPI_ENCAPP),y)
>   LIBKCAPI_CONF_OPTS += --enable-kcapi-encapp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
