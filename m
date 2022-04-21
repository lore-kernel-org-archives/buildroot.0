Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1A3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 20:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12B0660E2F;
	Thu, 21 Apr 2022 20:58:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9C2AE6RFbk-i; Thu, 21 Apr 2022 20:58:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F17460C19;
	Thu, 21 Apr 2022 20:58:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 308231BF3E3
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EDD584061
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:58:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x48ci73u0st0 for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 20:58:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 171CE82978
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 20:58:00 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id x3so3907950wmj.5
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 13:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=1eAzC3loREw4mVxaWH1IMhnEz+/T69q+dOLtkfjs/64=;
 b=IoMGHfs7nW90YnvFz/FXyFI9c3+mag8xqak4mNwt4ZER/qIoMF8IkFiXIp971FNPhj
 qgAAkwrlaKyoc5R/AWc260UHkNrsT7p0bxS0lNVtpWs4jLxko1Udo8gtmSmlvy5qf8ZK
 k2jc72m6pvTvQL4vRJFDNKq9p2+AtNs2MXkNBYQksC/GIPBqG2p487aEkMd1fyBdEFW4
 0zoelglGzBA6qoDJZiMDWCyA5qtWASe5mRKxwWBvkYuNOYnfKTrM/+7B/cGjsqIqwi7t
 FQdaL/sCb7hS+FMvm4L16A0NtL6eciz0UlDXbJwyKHxTHB14g2/NsendNUqMogHPSy0U
 gasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1eAzC3loREw4mVxaWH1IMhnEz+/T69q+dOLtkfjs/64=;
 b=56EZx7Js9kiDOIVN4K9kZAgO3NM2UmojwBXONWOM+tKSAv/O9ERNtz97Dtcr56iE8Y
 CkYrMG5uTtRyd37dYFylplQ+1CJodXdxjaK4X+RGa6nkcrUNtXc+ZZDCWbsQHPGrD1C+
 AbJxoWOcUOFuQBTXpJtlGWwk+EwfeD/zdej7D4u5bjzjVCJUxaYZi4+yqVQnIlsnHXMN
 bV360JvmATtHtKJaaeM1B1nOaNiTfIe/9cATKHiZEv/CuWrF2h7obYR8Jc6d4y8Z11O3
 h7Nt1cMGXxe2IytXgjjh01/oa8NPHGU2w51XE8rpoQeVzd8xdmNpP4yyssl7VRoqls81
 R9JA==
X-Gm-Message-State: AOAM531i2HjhR0I4qojNZGkG+k0mFkzCGQ7YtUaywQPp3zjzWcyma13h
 Bz+6GahjijwaNwgwojOVzFz5Hg==
X-Google-Smtp-Source: ABdhPJxvjW3at6MwgP5lj9pnQrGzF5mu2xmYuk7derYxL2RjvysdORAAehaEr7dArFPLUlEndpLdjw==
X-Received: by 2002:a05:600c:1e17:b0:38e:ba41:2465 with SMTP id
 ay23-20020a05600c1e1700b0038eba412465mr10166083wmb.132.1650574679148; 
 Thu, 21 Apr 2022 13:57:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 k20-20020a05600c1c9400b0038ecd1ccc17sm3217109wms.35.2022.04.21.13.57.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 13:57:58 -0700 (PDT)
Message-ID: <0a93268b-16f7-cd7e-a048-89012cd8a2a9@mind.be>
Date: Thu, 21 Apr 2022 22:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220418091909.7449-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220418091909.7449-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/botan: fix mips64 build
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



On 18/04/2022 11:19, Fabrice Fontaine wrote:
> Disable cc-tests to avoid the following build failure on mips64:
> 
>    ERROR: Configured target is mips64 but compiler probe indicates mips32
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/c44f44f36686268479563afd879db588e15ede7d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/botan/botan.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/botan/botan.mk b/package/botan/botan.mk
> index f9ebcf8d0a..6095844b14 100644
> --- a/package/botan/botan.mk
> +++ b/package/botan/botan.mk
> @@ -15,6 +15,7 @@ BOTAN_INSTALL_STAGING = YES
>   
>   BOTAN_CONF_OPTS = \
>   	--cpu=$(BR2_ARCH) \
> +	--disable-cc-tests \
>   	--os=linux \
>   	--cc=gcc \
>   	--cc-bin="$(TARGET_CXX)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
