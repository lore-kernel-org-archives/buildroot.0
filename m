Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C51C433EF
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:16:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46F146138B
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46F146138B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CBA5606D6;
	Tue, 16 Nov 2021 20:16:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V6DzXyIspi1I; Tue, 16 Nov 2021 20:16:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B9A96070B;
	Tue, 16 Nov 2021 20:16:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 982DE1BF3D1
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 873E380C76
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:16:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wRL7r4e_jPz6 for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 20:15:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8FCF80C3F
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 20:15:58 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id r11so198616edd.9
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 12:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TOJvVndNI2ZZV8Kgw2QblH8iEfp8CHAPdZJVN2e56Js=;
 b=HnCc//g+hd+oVs5pTYzKSrTv3nxMam8C71VWsDzXbHOZj/E3zU9MIjLjct0nfoLz7D
 JW0PTk2ejydMFg/s9c9DyrjPS4Xf6bJzgy4A0c13wS7bankgnnwV2pNDWzz0TWwzdXu7
 X2FlabDI6A/eiHJNyLeH9F3t1CIbG/F8ULqjLj2T2fJUIkR/o97xXUg+2T224rdUXA+f
 zKsm/iSLX/AKvlEnKt+J0M2qg6UWsnX0R4Mudk6Bikh4PXvGVN+0llbVU+4hFU9MnbwE
 VZoqOmneq+O8wJLmTsYaC4svq/4NlG98HkcP3AknZRsl7wQS3pvw4IcflHJr9IFwf3Iv
 DHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TOJvVndNI2ZZV8Kgw2QblH8iEfp8CHAPdZJVN2e56Js=;
 b=67DAf6DC7L5zxTmMAZdT4BunfT6b7ttEiaHozE2SgHphDhNrsfeuIi+UhiSwvm3CIu
 Ku5MP1i7m86Amo01/Qncdl9S5Y7wEIyldUi8xAtTmHE0Vnkb/XTnKt+gOEuJASr/EcmX
 kvsHpHFkGbz0O5yWzc64O59u7aNi+LK8n9Mf1g3GeNu5GY0HbWGBev8FewERKMUdymfw
 LBOf2agXp5Bk2b3DkPNRZK/+6ENiOSA6nYd7mOFpb6ZUjO3mDxAk8UX1qaaovI9QDoH/
 1EU0p9dJtMGeFIHWh3nekOZzfMVA/LAyauYA/xdcvhWq71f/6BwT9eUczNOzLYtMXh0o
 HuoA==
X-Gm-Message-State: AOAM530h7u7uY85n0W5rsLKRqUTIMcOgBhWRH8oz05q+rzioRhOSjitb
 QZA7sktxvMsrXk5QIAe8HusmN9/xOJ8EIQ==
X-Google-Smtp-Source: ABdhPJw/emXBdRr3d27kjPnKnwsA1ho51W/42yw/r8cRS8i47gj11XOdq/NtO8KcMopejfmMib2e0A==
X-Received: by 2002:a17:907:1b0a:: with SMTP id
 mp10mr13674554ejc.29.1637093757165; 
 Tue, 16 Nov 2021 12:15:57 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id sa17sm9164729ejc.123.2021.11.16.12.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 12:15:56 -0800 (PST)
Message-ID: <828fe1f9-2c34-bd08-56a3-f8799f6e7c7c@mind.be>
Date: Tue, 16 Nov 2021 21:15:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211114174921.3136770-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211114174921.3136770-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/log4cxx: select boost chrono
 and date-time with gcc < 7
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/11/2021 18:49, Fabrice Fontaine wrote:
> Fix the following build failure raised since commit
> 4e267a7d3d5d350710a81ada188a1629348e4b4a:
> 
> -- Found Boost: /home/buildroot/autobuild/instance-3/output-1/host/sh4-buildroot-linux-uclibc/sysroot/usr/include (found version "1.77.0") found components: thread chrono atomic missing components: date_time
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/e7443e3bc955e7eddd7bed63e2728880dabb31a7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/log4cxx/Config.in | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
> index 6f1956f829..27a5f06988 100644
> --- a/package/log4cxx/Config.in
> +++ b/package/log4cxx/Config.in
> @@ -12,6 +12,8 @@ config BR2_PACKAGE_LOG4CXX
>   	select BR2_PACKAGE_APR_UTIL
>   	select BR2_PACKAGE_BOOST if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
>   	select BR2_PACKAGE_BOOST_ATOMIC if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
> +	select BR2_PACKAGE_BOOST_CHRONO if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
> +	select BR2_PACKAGE_BOOST_DATE_TIME if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
>   	select BR2_PACKAGE_BOOST_THREAD if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
>   	help
>   	  Apache log4cxx is a logging framework for C++ patterned
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
