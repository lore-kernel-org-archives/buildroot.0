Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA01C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 19:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7857782628;
	Thu, 28 Jul 2022 19:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7857782628
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QuF0c_u5D0Le; Thu, 28 Jul 2022 19:39:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5EC6825E8;
	Thu, 28 Jul 2022 19:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5EC6825E8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFB6F1BF21A
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7E4B825E8
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7E4B825E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QS_RdxkRnWzE for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 19:39:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95CD4825CA
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95CD4825CA
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 19:39:15 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id s9so3414678edd.8
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 12:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wdDPUzQ5bp4ijiqYuOF9/zD2i1pIFqVfWoLZUjvNLf4=;
 b=6xDypDwWWZeadZUoLCpKIGR6jxKW9hYalIg1F3WkEmkrtt/WazPOZvhMU8Ucnt8q7g
 oMQGaMYm0/VUiv6SNFQcBOMFYfK0y55C+SA82vtRZOGYdp2j8Sp25jkQnrK2cUiVDDG/
 iXy43uzC8dKWWNBN4vRibsgJiwHo3WMfGym99mcIVgm6ywmMc8N4ypZsku3DYDJcGN85
 8tJprauX06A83pbUUX1QjATLzjqCbSSRa+HvYw30MWv1mLxOO+Y5lbeSeyDj7yQ96VVv
 kVFzSPhprNtPoT/q2YO+FPiplvkSr1mTJA4OsncoNl/YuzB/wQ6SBW5D10zEToVCBfk3
 h2XQ==
X-Gm-Message-State: AJIora8vq0Lt1xfTWv9DqG/5QeGCDF/DeTWhAENK42fg7B6LbvyFBXOF
 7ivVYek07kYy8vmz74AC/JTHmQ==
X-Google-Smtp-Source: AGRyM1udY0drqawLwTnzouWq8333KiSsqqKii+ujUFGuP4rs4M4ztsfbzzyl33GD7CCnpUXV025HlA==
X-Received: by 2002:a05:6402:4255:b0:43c:3af9:9653 with SMTP id
 g21-20020a056402425500b0043c3af99653mr498839edb.222.1659037153661; 
 Thu, 28 Jul 2022 12:39:13 -0700 (PDT)
Received: from [10.101.1.216] (ip-185-104-137-32.ptr.icomera.net.
 [185.104.137.32]) by smtp.gmail.com with ESMTPSA id
 fv30-20020a170907509e00b006fece722508sm732760ejc.135.2022.07.28.12.39.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 12:39:13 -0700 (PDT)
Message-ID: <56e3cdc8-3c1a-de9c-be9e-b114790fa026@mind.be>
Date: Thu, 28 Jul 2022 21:39:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220728082438.1697487-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220728082438.1697487-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wdDPUzQ5bp4ijiqYuOF9/zD2i1pIFqVfWoLZUjvNLf4=;
 b=gXmJ1M5XwLyg4Oi8ExgGA0FxvR1otZfStE7xnFv3wzxLeoVkc1VWekNWc4163BVRnT
 aEGpPlmffXYE2LIHeF7F2CjpIVboQCWbEUdQW42xqaE27QZYBOLCj+KCldF9FwNNx3xr
 u33C0sDpSC6vdywPWHsFK0eUYeS7FHhLYv4eyKhghqxNNKONSZxDpOFNQ13IJc37Yj2h
 GLUAQS49lVWtRqAj26TYlFQmfNAv91cZN1Ep0yu9gFBXgnmsbmEsYE45Wf/uTgJplXjd
 0AQ4z35J0LOqlQaaqrZCAOYv/ch3SzlMyugvZcUz+mHYS8F89C+qBk2b81+YIzoNh49E
 vvGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gXmJ1M5X
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: requires MD4
 in openssl
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
Cc: David GOUARIN <dgouarin@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/07/2022 10:24, Fabrice Fontaine wrote:
> Enable MD4 in openssl to avoid the following build failure raised since
> the addition of the package in commit
> 736c4c1655d93652a9a7e79235bbe726b3d46176:
> 
> In file included from src/lib/md4.c:16:
> src/lib/md4.c: In function 'fr_md4_calc':
> src/freeradius-devel/md4.h:76:33: error: unknown type name 'MD4_CTX'; did you mean 'FR_MD4_CTX'?
>     76 | #  define FR_MD4_CTX            MD4_CTX
>        |                                 ^~~~~~~

  Would there instead be a way to convince freeradius not to use MD4? Using MD4 
these days is really a bad idea...

  Regards,
  Arnout

> 
> Fixes:
>   - http://autobuild.buildroot.org/results/a8aa12a8129056391f975820ea3d1d62241ac051
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/freeradius-server/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/freeradius-server/Config.in b/package/freeradius-server/Config.in
> index 52a50bd3a7..d51d92714d 100644
> --- a/package/freeradius-server/Config.in
> +++ b/package/freeradius-server/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_FREERADIUS_SERVER
>   	depends on !BR2_STATIC_LIBS # libtalloc
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
>   	select BR2_PACKAGE_LIBTALLOC
>   	help
>   	  FreeRADIUS is an open source server which implements
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
