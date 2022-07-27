Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F97C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 11:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FF2060B59;
	Wed, 27 Jul 2022 11:10:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FF2060B59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SpTjhZpbVbfT; Wed, 27 Jul 2022 11:10:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EFEC60A7B;
	Wed, 27 Jul 2022 11:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EFEC60A7B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A3A91BF46D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65FEF404B9
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65FEF404B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mxs4TxxCtItz for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 11:08:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59CAE40168
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59CAE40168
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 11:08:38 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 x23-20020a05600c179700b003a30e3e7989so837991wmo.0
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 04:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pIOhjJ4uw4fuzcGgJRNdTcdDcVwLsFYtXEBL4A6raqQ=;
 b=RiMeMNRR4m2NPyFtGnCigNPgaACF9g0N8lJg0eZJeDqxRlY8XIkqvrb8oFpNGQ9kIY
 pwzCP8vP6gOMLgUzygu+JDSpmn61KiYXqrR1GvyBL1es4yAIpH8z04fFAMlKDWUEXxnn
 x527Ze/7Cb7RK18QSylSpFDtfjvZ7gPCSOOt/eG4RxVQsBihe5GaVz/wjHyPPYrCatHX
 q5SxJ/PNcQeeRAH29fzCBHA6l0l504LlUTeuhkVrhKfGG2zRRmzw09hDhMaGlNhSvJEL
 hKWYuqkx3UVKUbw9kxKNx1qkbHwMT3QuLXOPiIZ8zJ8lCncugYw9r4uOXpp2lqV7ran2
 ZKSw==
X-Gm-Message-State: AJIora9mHg/LbBY60Xkvi3cCCy+4HRm2ZA7kSRLWFTnBaPDJfdVOOIw7
 biA/EalMo3HQCJctjFUCOn+NJw==
X-Google-Smtp-Source: AGRyM1s4YIZVJigB0/CYVzxarbesrUMJt79KDgS2eWEUwjYN6PK1b5wMRrnDyehJ2q/vrKbwlcVs2w==
X-Received: by 2002:a1c:7915:0:b0:3a3:11a3:7452 with SMTP id
 l21-20020a1c7915000000b003a311a37452mr2695100wme.27.1658920116504; 
 Wed, 27 Jul 2022 04:08:36 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a05600c401000b003a305c0ab06sm1460514wmm.31.2022.07.27.04.08.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 04:08:35 -0700 (PDT)
Message-ID: <c1c3040b-d429-dcaf-6e97-5f0c8367b48a@mind.be>
Date: Wed, 27 Jul 2022 12:02:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220108224337.3702128-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220108224337.3702128-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pIOhjJ4uw4fuzcGgJRNdTcdDcVwLsFYtXEBL4A6raqQ=;
 b=K6Nb+1hRsg0CW0w2CsFYtJoW9dc7yaBWWnXmPJ70wIUTLeAf0QMR/1UGiB08Vf07Qq
 zo6MLIeiUx5nAmTyI57ROxpxnXGBZn4AU3rLBW1vp7xzXAJ/uB5CppeQllBND+9+3Wg/
 4G4yDAHkAgikSL9oDdZAzxw1kF1ZA/+HdWDboLRh4UNXCkh4SPwdUGXP1+x02uc6Cxyf
 aUZDrt8iHKhTED4G0V2oy8fDSGRUh3JeJsplcGinAJ//D/FKXG1wyJc2Kk58f4kwDvCg
 nFkULvK7mVVhBVCMeMoqfgZyq+gB1w5jy8Qc4BEOVTPLC3mLWxZpYr3aoknMz4uhvSMe
 Fg7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=K6Nb+1hR
Subject: Re: [Buildroot] [PATCH 1/2] package/minizip: add minizip-zlib
 support
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
Cc: Fabrice Fontaine <fabrice.fontaine@orange.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Fabrice,

On 08/01/2022 23:43, Fabrice Fontaine wrote:
> Add a virtual package to allow the user to select the minizip provider:

  A virtual package should be used when the alternatives are more or less 
drop-in replacements. Here, however, they are absolutely not: they install 
completely different header files and libraries. There is no way that something 
that expects minizip-ng can build with minizip-zlib or vice versa.

  In addition, the two can be installed in parallel.

  So there's no reason at all to make it a virtual package.

>   - the current minizip (which has been renamed minizip-ng since
>     https://github.com/zlib-ng/minizip-ng/commit/db95894646b87f6178ceaa389cbdb5b1ba8cd97a)

  It would make more sense to switch the existing minizip package to this new 
upstream repository.

  We could rename the package to minizip-ng, but we generally avoid that. It's 
just annoyance for people who upgrade buildroot (legacy handling helps, but it 
is still annoying), and there is no benefit at all other than "consistency".

>   - the 'legacy' minizip provided by zlib which is still widely supported
>     by various opensource packages such as domoticz

  We should just add a package minizip-zlib.


> There is no need to add entries in Config.legacy as the previous options
> are kept and the default provider of minizip is minizip-ng.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

[snip]
> diff --git a/package/minizip-zlib/minizip-zlib.mk b/package/minizip-zlib/minizip-zlib.mk
> new file mode 100644
> index 0000000000..67d4e31f41
> --- /dev/null
> +++ b/package/minizip-zlib/minizip-zlib.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# minizip-zlib
> +#
> +################################################################################
> +
> +MINIZIP_ZLIB_VERSION = 1.2.11
> +MINIZIP_ZLIB_SOURCE = zlib-$(MINIZIP_ZLIB_VERSION).tar.xz
> +MINIZIP_ZLIB_SITE = http://www.zlib.net
> +MINIZIP_ZLIB_LICENSE = Zlib
> +MINIZIP_ZLIB_LICENSE_FILES = README
> +MINIZIP_ZLIB_INSTALL_STAGING = YES
> +MINIZIP_ZLIB_PROVIDES = minizip
> +MINIZIP_ZLIB_SUBDIR = contrib/minizip
> +MINIZIP_ZLIB_AUTORECONF = YES

  Please add a comment why autoreconf is needed.

  Regards,
  Arnout

> +MINIZIP_ZLIB_DEPENDENCIES = zlib
> +
> +ifeq ($(BR2_PACKAGE_MINIZIP_DEMOS),y)
> +MINIZIP_ZLIB_CONF_OPTS += --enable-demos
> +else
> +MINIZIP_ZLIB_CONF_OPTS += --disable-demos
> +endif
> +
> +$(eval $(autotools-package))
[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
