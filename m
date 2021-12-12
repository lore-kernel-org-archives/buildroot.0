Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4545C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6072240568;
	Sun, 12 Dec 2021 14:09:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vcpfAJE9Z8jW; Sun, 12 Dec 2021 14:09:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 716BC41223;
	Sun, 12 Dec 2021 14:09:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 361FC1BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AD0260D68
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wqtO1D1AFweJ for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:09:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D3E760791
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:09:16 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id y12so43447587eda.12
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HQoEJ4UiXWTK9/QdXsFl1yYFlkYD1uetP9lvVnTkIIE=;
 b=ERoE3ChF14meawoPy1rx1wY97P3yezN5BwBjgsaMUBYJMmt/Fl0GUisdQgGlSLrOtA
 JfjYlp8rHsi/Nlh8F91ub+J2OL4WI0fy/i3WNy3qAvzDpR10vEyArJaEvsoWN7phAbd8
 fn/CBtypE3TGcrJCzJyJOszwmiY6ESGPzE8uDU1Na2JF1l3SUL8ofvUj8Nl77zvN7wBD
 iId/StZry6tMGxyaMIIwQJ+N6DzJOuEK4ij5UoSG+AsoQgNV2RAXd52WD/5IiPAY8SSP
 mngF7cC1d/py/vrmrpyxb/nIvSGEqGBxjhG2/wlKuknp0j83VuiydFFOQVL+uxOgpjoV
 dQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HQoEJ4UiXWTK9/QdXsFl1yYFlkYD1uetP9lvVnTkIIE=;
 b=zrNNOrsE+w443LY84VdTjZJu1Sb4ftGoXs26u9RPQUZQFA9mOi8mwbMXhxQ8BMsY7Q
 zvSwtzCCv1ZIqG1hqyWQFMDLRHEJH25qOGhzZhQeFnMxvVoOKQwJirVftpLThsNtAg7f
 23osg02MWL1+aU5rCJxzrVkax+IbpBa4ubnvmAGT61w4rsl9WFtK87lY3GD4tDUhEswl
 X6dA2Zk22IEG4kaFKIuUkNGAuWQKeFZGHhixArOOr712KHT8WTgGxMIp8XPyfHeN2et3
 gUp8D7/56mx7H4R+lsOQKXRHNzl/E7giELCXBqQqXypa1sp5S88wjwno+CLCNDohYWEq
 3kdg==
X-Gm-Message-State: AOAM533C6VcE8C1CtxTDZzNPbB7ej9TseAe8cZJy6ykFboH4W+iA8SPn
 CpUGQkDOwYE2NduVO8AfAaJ2fA==
X-Google-Smtp-Source: ABdhPJyL3+GJ056ID87x4VTcE/OdEyBtXXgY5hWpV1XwBadhPu75xMiNlHIp4OPfjlE5vrbkTSi5aA==
X-Received: by 2002:a50:bb2a:: with SMTP id y39mr54059437ede.348.1639318155355; 
 Sun, 12 Dec 2021 06:09:15 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f17sm4825429edq.39.2021.12.12.06.09.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:09:14 -0800 (PST)
Message-ID: <34833d99-371f-e3a6-3a1c-07243f028a85@mind.be>
Date: Sun, 12 Dec 2021 15:09:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Joachim Wiberg <troglobit@gmail.com>, buildroot@buildroot.org
References: <20211209201455.139562-1-troglobit@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211209201455.139562-1-troglobit@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/inadyn: bump to version 2.9.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/12/2021 21:14, Joachim Wiberg wrote:
> See the ChangeLog, or release notes at GitHub, for full details:
> https://github.com/troglobit/inadyn/releases/tag/v2.9.1
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/inadyn/inadyn.hash | 2 +-
>   package/inadyn/inadyn.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
> index 801400b2f5..98af30e9fc 100644
> --- a/package/inadyn/inadyn.hash
> +++ b/package/inadyn/inadyn.hash
> @@ -1,5 +1,5 @@
>   # Upstream .sha256 from GitHub
> -sha256  b90c02a4f1964d8c1f3e178b6ef22eb29c689cd9e09669af17a8fd998c87dab5  inadyn-2.9.0.tar.gz
> +sha256  7370eb7ad5d33a9cf2e7e4a6a86c09587fbf9592cd357c6f472c33f575bac26d  inadyn-2.9.1.tar.gz
>   
>   # Locally computed
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
> index 9ccb16ddfe..041d1eff57 100644
> --- a/package/inadyn/inadyn.mk
> +++ b/package/inadyn/inadyn.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -INADYN_VERSION = 2.9.0
> +INADYN_VERSION = 2.9.1
>   INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
>   INADYN_LICENSE = GPL-2.0+
>   INADYN_LICENSE_FILES = COPYING
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
