Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23812C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4AC64014B;
	Thu, 16 Dec 2021 18:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 32egLLBxywpe; Thu, 16 Dec 2021 18:19:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB9204017B;
	Thu, 16 Dec 2021 18:18:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 727591BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F27D61041
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:18:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oRQHnH36gHiY for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:18:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF6F861040
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:18:56 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id y22so19296716edq.2
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 10:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VoWpVh7W2LVljUUD1uBSJ1d75WWGP26iY2We47fRUTI=;
 b=MSRjL5XrO/QY+9kxXrEMvYSDkECYSbK6LdJ/RpVF4PWj5SEz9/roo1mEZx/DsqevCe
 YTyC2sPG8nkKlhK3dByjQk80DT8arMppSksJisQoOloapr7JMlHms5D/bKNsxfPKyn/1
 gsFB4m4E9SyQ07i98LeiorcHL8Geoja3Fa73Xq7WriM1S1ojpaTMZxeOgOaXBLYTghcj
 uCjKi/P99HfBK5U5SSLIL0cFUR3XT/421txy1EbzUpy3z0mDt/m4CTVQq462otmoDjeT
 f2JK6BH+I+RrZ08ZIPLbE6QcfQxOJcS81laqM8cZHG2wI8FMKrYCMfSoQcNwgavLqD3p
 ex7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VoWpVh7W2LVljUUD1uBSJ1d75WWGP26iY2We47fRUTI=;
 b=QpEwFll2iBSuSH9Y2DHy5seJ93H9Nv6aqrDLhwCLH/ZqWzYRle6NylYBY8yaPBX3eB
 8NNMa5uF+Gw7ecTL39x8TDs4jEQ2yBkcXYWVNDHs4RbWSCudSHkuPVEDLNdVkbgwRimB
 ovtRGaVsuGKKq3mh6lEnBmZMZC4uMgu0q47Z3u0bjbKB+YnLj3IOn1Fa48Yc0iBHQ+uc
 AkoXnx70fmHsn4GyD3xxgog+EKc/tSZTmUH/0aD0tFlcAd8Sx2H4NNyAT/pCELy1rFEw
 fITg3DUxXthU57RHLLAGn0dRUMsPYDTzCMcUH826Cu311r3nTNfmW70pXq2Qsuvqt3k8
 LKGg==
X-Gm-Message-State: AOAM531d84NVvi2Gp3vmY0GQHhTrgsm3lS6A5CSXSwizGY/6XvQvGo2/
 lqVVDIURzWz0ff5/U8Cs18LAxQ==
X-Google-Smtp-Source: ABdhPJzv8/D1NxVhG385k77xmMySx38vscmuJd3la+1qVk6BB41OPC5tpPIXsYXjOKxLDwI4BRfDug==
X-Received: by 2002:a17:906:d54e:: with SMTP id
 cr14mr17652364ejc.458.1639678735033; 
 Thu, 16 Dec 2021 10:18:55 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y22sm2729341edi.8.2021.12.16.10.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 10:18:54 -0800 (PST)
Message-ID: <7f6c110f-ae1e-5a1b-f27c-5c812c21e071@mind.be>
Date: Thu, 16 Dec 2021 19:18:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211214211051.2220248-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211214211051.2220248-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: add libcap support
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
Cc: Vadim Kochan <vadim4j@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/12/2021 22:10, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/frr/frr.mk | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/frr/frr.mk b/package/frr/frr.mk
> index e707f50ca1..49b4a190f0 100644
> --- a/package/frr/frr.mk
> +++ b/package/frr/frr.mk
> @@ -29,11 +29,17 @@ FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
>   	--enable-user=frr \
>   	--enable-group=frr \
>   	--enable-vty-group=frrvty \
> -	--disable-capabilities \
>   	--enable-fpm
>   
>   HOST_FRR_CONF_OPTS = --enable-clippy-only
>   
> +ifeq ($(BR2_PACKAGE_LIBCAP),y)
> +FRR_DEPENDENCIES += libcap
> +FRR_CONF_OPTS += --enable-capabilities
> +else
> +FRR_CONF_OPTS += --disable-capabilities
> +endif
> +
>   ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>   FRR_CONF_ENV += LIBS=-latomic
>   endif
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
