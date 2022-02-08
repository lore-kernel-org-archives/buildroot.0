Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB30FC433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 20:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FAF7827E0;
	Tue,  8 Feb 2022 20:56:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ew-9imbuIeiX; Tue,  8 Feb 2022 20:56:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8A8C827DD;
	Tue,  8 Feb 2022 20:56:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D65351BF390
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C522B410D0
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8S6DNBq6Nd2j for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 20:56:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBE9B410B6
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 20:56:11 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id o12so1094679eju.13
 for <buildroot@buildroot.org>; Tue, 08 Feb 2022 12:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hlWR5Hox+bmz+TAD9FETkZPrNdiaiZSitJ3YLGIGi3I=;
 b=DQfVoreNDqWG2A8smRAA7y6x7Nllh0qTWwpP12sVjPc5daDypRCmajvvyPnukhnVF/
 IOEkPduOkXrwNSUU8GFR5C0H4eBBL9Nr76iy6825YTiAcN3wQNjIZE1+wl6wJvja4PKS
 wUbKflXseAe3JAOM+jvmdtB3WgwwgFRuqHL9nSZAXGLaT+dPjy97Xd3XW8GmQcMacipm
 c+IuhUdf0Nw6RNnEMZc8jemXULWl1E7eZvvwAeHzvttAohjOWPvyN9C0FBmFlwwizeai
 dOm5JBlo9zAJKHykCQgsmQSYV90IKTqM37yPYQYTTTKSjU06JsDtJ8heKe/iokb9w14C
 ZZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hlWR5Hox+bmz+TAD9FETkZPrNdiaiZSitJ3YLGIGi3I=;
 b=Bx6uXysbmU9B4eUYCsrDOPnPFA16G8CimxSXvm+PI4PbO1Ny1dJktd3ZC72UDYzAED
 rbXEryh3F3BerFGqg9GHUAehn/Zn/aTtIqXM1c8XT3k0xsMSEhBx0MEmO/E4VHw92b7Z
 RWQhPJF3ZH4GRquDR3pNZ0pY8HYw5ukeEWHnzTI0LPk/cZt5wm06A+uyPvogQWSG2a05
 V7HWx6EedVKG1yoL9cmZQ8NoozzvKp5TsCohXcvElSqj0nE9AVc57Wl19NbSOjwtB2Kq
 a393/c+mFvWaOc9wA2rfuF3Nv3fu3kBD6Nxc+qc4qC0abNOZcaVUYN2QtcEXfrYuIYw3
 iZ7Q==
X-Gm-Message-State: AOAM532YEKvzPONT7d4XZK12j0mtS+9rFIDBRDHdnIFMF7Yx99zRloCd
 9fqXCGqfr1rJ8ib/cpmVJsJ5/A==
X-Google-Smtp-Source: ABdhPJwf2/0jzeG9JPyI+++D8MoWbsOD6L/y/VCpbH3C/PBwubJCBQsbbbw2JasFDA0lYtDHOhRc7w==
X-Received: by 2002:a17:906:644f:: with SMTP id
 l15mr5158649ejn.135.1644353769969; 
 Tue, 08 Feb 2022 12:56:09 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y11sm4029515edu.2.2022.02.08.12.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 12:56:09 -0800 (PST)
Message-ID: <6d74e1be-2ff0-5e4d-cf2d-1e2b078162c1@mind.be>
Date: Tue, 8 Feb 2022 21:56:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Juergen Stuber <juergen@jstuber.net>, buildroot@buildroot.org
References: <20210527145118.31373-1-juergen@jstuber.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210527145118.31373-1-juergen@jstuber.net>
Subject: Re: [Buildroot] [PATCH 1/1] toolchain/toolchain-external: Allow
 relative paths in BR2_TOOLCHAIN_EXTERNAL_PATH.
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/05/2021 16:51, Juergen Stuber wrote:
> Convert BR2_TOOLCHAIN_EXTERNAL_PATH to an absolute path when used.
> 
> Otherwise the symbolic links to the external toolchain binaries are
> not installed in host/bin when BR2_TOOLCHAIN_EXTERNAL_PATH is relative.
> This happens because TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
> changes directory into host/bin to create the symbolic links.
>  From there the tools are no longer found via the relative path and
> a single symbolic link host/bin/$(prefix)-* is created instead.

  I've extended the commit message a bit to explain a use case where relative 
paths may be useful, and applied to master, thanks.

  Regards,
  Arnout

> 
> Signed-off-by: Juergen Stuber <juergen@jstuber.net>
> ---
>   toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index 6d91cb5d1e..2b70007a34 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -68,7 +68,7 @@ TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR = $(HOST_DIR)/opt/ext-toolchain
>   ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
>   TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
>   else
> -TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
> +TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(abspath $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH)))
>   endif
>   
>   ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
