Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAC4C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 17:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5ED661138;
	Fri, 17 Dec 2021 17:39:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jtb9KVB6p6VJ; Fri, 17 Dec 2021 17:39:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02F3561119;
	Fri, 17 Dec 2021 17:39:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC2CC1BF2AF
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA096400CE
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:39:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ojET-IrTaCtO for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 17:39:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D40D240C1F
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 17:39:14 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id o20so10553519eds.10
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 09:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MxNZqQ1itsCkbSwCKS7FAkNXg3Qz92JLFc6ikYc9xBE=;
 b=GG2As5/8EuTrsL6bfedkFllSrh+vHcX/r63DR4HOsYL1hH2gk8zJ2ECwbblIZAGT5N
 IstO3MSpYNPACnciTe3HOl4dDtAyXeY/c3yvcGiMq8b0Vx5EqdTwVYmGrk3t4/Ntz6F4
 B941jQS4eDa/KXL5TUeIRkfztvdmQUHQU5oJ3M2qA3r2mrGKPmiQQE9A3VgPUPlic/EY
 PKFo2hbfwjkyD30kjgIlM18ccN/zC1jSt/Mvtbd/l7MADLZmhGEhYVM2AP8kMXFgMXD+
 08KzCmfsWacP3iOHqYJJBzw8MT/4Y8OBOZpinJr3LewXsMGcK10SjcE3dEbLLA2++nPp
 UkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MxNZqQ1itsCkbSwCKS7FAkNXg3Qz92JLFc6ikYc9xBE=;
 b=I9oY+WY4yc/vRkqvK3gOzAMKBxc4bjFItzm+VfJLdZH9Wbe785deFktxlAgdVzQ2XE
 9yDckrp8862OWxQQDoAcIbm0gfMA5OYeTSnAwb7roKdVhmhvd4RsuBJd4MouW13O2Ajz
 eXaONq+S1I9wl+Yp07KtqM7w/NOmQIe4XdlbdPk07rAw7/A+PN8UpZt25mCjv8ww/kyK
 ScnDRzCs8GcE8+M2mTqakL4xQyvf36vbuwjta/jMRcYDkcmGNnzn22lnIsUysRZKx6ru
 uqxjWfxWGv1ybdDCM5LvX0Wg2LvuijnUapBj2hE0/yxpN/rI40/mzqMfYBz29IrViiWH
 y+tw==
X-Gm-Message-State: AOAM530ZAHyBYD6s56j470w210fDEzCbkYzN7sBuwEkQWFXGLJBt5zs/
 tfQUtOjGs9IMziS4JLSz4Yp3LQ==
X-Google-Smtp-Source: ABdhPJwCGzaLT4PZ5LTnYzPjIOxsj3qxtWAmMzDA0Ip5YbslXjNGtk46SsrCHbW0rMAmuj91GhCeNA==
X-Received: by 2002:a17:907:6e15:: with SMTP id
 sd21mr2687715ejc.107.1639762753039; 
 Fri, 17 Dec 2021 09:39:13 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hs14sm584403ejc.218.2021.12.17.09.39.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 09:39:12 -0800 (PST)
Message-ID: <9127381c-c5e4-24b5-9167-cc3ec5b899ca@mind.be>
Date: Fri, 17 Dec 2021 18:39:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20211216213002.788654-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211216213002.788654-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-mediasdk: bump version to
 21.4.3
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/12/2021 22:30, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/intel-mediasdk/intel-mediasdk.hash | 2 +-
>   package/intel-mediasdk/intel-mediasdk.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-mediasdk/intel-mediasdk.hash b/package/intel-mediasdk/intel-mediasdk.hash
> index 69a7422741..83c52fa271 100644
> --- a/package/intel-mediasdk/intel-mediasdk.hash
> +++ b/package/intel-mediasdk/intel-mediasdk.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  d9358dc784c4146fd21faffbba03c304684978de1ce34d3714bd2c6b50233d14  intel-mediasdk-21.4.1.tar.gz
> +sha256  2bcf0bfc2cc4f6a0b865d50c08a327d5bca81738b31a40c8f0e4eba12689d63d  intel-mediasdk-21.4.3.tar.gz
>   sha256  dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6  LICENSE
> diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
> index 57276bbd74..58334b3ddd 100644
> --- a/package/intel-mediasdk/intel-mediasdk.mk
> +++ b/package/intel-mediasdk/intel-mediasdk.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -INTEL_MEDIASDK_VERSION = 21.4.1
> +INTEL_MEDIASDK_VERSION = 21.4.3
>   INTEL_MEDIASDK_SITE = http://github.com/Intel-Media-SDK/MediaSDK/archive
>   INTEL_MEDIASDK_LICENSE = MIT
>   INTEL_MEDIASDK_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
