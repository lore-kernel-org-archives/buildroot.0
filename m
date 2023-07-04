Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C7EEB64D9
	for <buildroot@archiver.kernel.org>; Tue,  4 Jul 2023 20:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BFA440576;
	Tue,  4 Jul 2023 20:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BFA440576
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YIElupbLT3RZ; Tue,  4 Jul 2023 20:47:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7C8540135;
	Tue,  4 Jul 2023 20:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7C8540135
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C7741BF42E
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 20:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55800815AD
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 20:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55800815AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8C8tCpnmZphs for <buildroot@lists.busybox.net>;
 Tue,  4 Jul 2023 20:47:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C5DD81518
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C5DD81518
 for <buildroot@buildroot.org>; Tue,  4 Jul 2023 20:47:28 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-51cb40f13f6so7503297a12.2
 for <buildroot@buildroot.org>; Tue, 04 Jul 2023 13:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688503647; x=1691095647;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f82N0rm6ErDmXlDDHEEWtk7CEXPlJfodBx5N47wSdY4=;
 b=L6yvTCtiv3ctXqwRT/7AB86/wG16mHZsVzBdSFKwXqZq3q35eH2bmvfuV4lPN5G5Da
 M+nakvyHS6rwMSv9arltVB8NQOJu4PXZORdOuSPC7AUtM49skK4g9n9ZmHwxaa2kGIwB
 iN+Z0FGB5ez9qA/MN2tCBy1vrW3W8LiNvBnKyCwmdDTJLPPNublIHncD5mq245y24pbn
 zsdDc6vuKpBYchkPCwLNyrHKMwOxEWbdcFmD0KqOPcMWtGRjk2UxkFX5akAnUn0ihICD
 +aXPjWKGt30OT5GWfdqxqN+RXpnW4Ok4pJfD1uNMWPQy84VnPQShjXTD/CPmibV5GA7D
 +FHg==
X-Gm-Message-State: ABy/qLbHQtkaOdVlEMLUGUfBGG1Jf1Yl0mVMzpCu05kABuFrx4/gzud4
 YF114rGmNVKLgvMwffClf878WQ==
X-Google-Smtp-Source: APBJJlEezpqD4uhjr6E8XwCkNyvDuqrzxpiq0UnNPAFWC1+i6f9+gQYWfaNon5V6EUDm2Z+ycBIibg==
X-Received: by 2002:a05:6402:612:b0:51d:b0a4:1d44 with SMTP id
 n18-20020a056402061200b0051db0a41d44mr9812752edv.29.1688503646812; 
 Tue, 04 Jul 2023 13:47:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49?
 (ptr-9fplejo7y5h55ppcgnd.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49])
 by smtp.gmail.com with ESMTPSA id
 b5-20020aa7cd05000000b0051da8fd7570sm6931224edw.41.2023.07.04.13.47.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 13:47:26 -0700 (PDT)
Message-ID: <c3fb3900-18cb-acf0-8bc2-63069fe3a22e@mind.be>
Date: Tue, 4 Jul 2023 22:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>, buildroot@buildroot.org
References: <20230626070536.311268-1-gwenj@trabucayre.com>
In-Reply-To: <20230626070536.311268-1-gwenj@trabucayre.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1688503647; x=1691095647;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f82N0rm6ErDmXlDDHEEWtk7CEXPlJfodBx5N47wSdY4=;
 b=bH6Xu+M/gSg/mwhzjQ4EVmnqtSF8NSzvnBXA4KIynmIS3ykuKhycnDJt9YU5pcVu9B
 XIubyN7C31ZhJYIK2II7pxhCObjj00ofiAvk2nWtuTHYWkQd4D0Cg80nstZTmqzHusLY
 GTpxrxmJMrrpxMkNnD0iTGE5GbsdE4IypdNW4MbVKfAJCdWwB/ph6d0s6gzAIidd3bm+
 4HwBpQXHuc3wWfGBYiTs+ZVKdhZWIAjDWi4ygVQEaAvBhauiH2jWahxkBm6It7+a7FaQ
 mzB4xNjpeiddhUXCgH9Et2tMB4l8ggYh2qi49IFFliN26uJltfz65P2AjTy/J7aY2I7u
 l+Bg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bH6Xu+M/
Subject: Re: [Buildroot] [PATCH v2 1/2] package/gnuradio: fix build with
 python-pybind > 2.10.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/06/2023 09:05, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Since commit 0e82c360942907f5a2f379e64e0d211aaff80774 (and since release
> 2.10.1), a new variable called PYBIND11_PYTHONLIBS_OVERWRITE was introduced
> and set to ON by default.
> 
> According to comment before this option:
> "Overwrite cached values read from Python library (classic search). Turn off if
> cross-compiling and manually setting these values."
> 
> In buildroot's context this option must be disabled to keep variables
> provided by buildroot and lib/app.

  I guess something similar should be done for all users of pybind. And indeed, 
I see that zxing-cpp suffers from the same issue [1]. For some reason 
python-scipy doesn't have autobuild failures though.

> 
> This issue affect branches: master, next and tags 2023.02.x, 2023.05.

  This kind of comment should not be in the commit message itself, but rather 
under the --- line.

> 
> Fix:

  And this should be Fixes: (so it gets picked up by patchwork)

> - http://autobuild.buildroot.net/results/7423df5db5237d94bb49e32698828d4fe470e39b/
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

  Applied to master, thanks.

  Regards,
  Arnout

[1] 
http://autobuild.buildroot.net/results/7dc/7dc04cb67280073d24dc550e5ed8aa3673a9c6b1//


> ---
> Changes v1 -> v2:
> - move PYBIND11_PYTHONLIBS_OVERWRITE option to python support section
> ---
>   package/gnuradio/gnuradio.mk | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
> index d9218b533d..1453b78493 100644
> --- a/package/gnuradio/gnuradio.mk
> +++ b/package/gnuradio/gnuradio.mk
> @@ -116,6 +116,9 @@ ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
>   GNURADIO_DEPENDENCIES += python3 python-pybind \
>   	host-python-numpy host-python-packaging
>   GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
> +# mandatory to avoid pybind11 to overwrite variables provided
> +# by gnuradio and buildroot
> +GNURADIO_CONF_OPTS += -DPYBIND11_PYTHONLIBS_OVERWRITE=OFF
>   # mandatory to install python modules in site-packages and to use
>   # correct path for python libraries
>   GNURADIO_CONF_OPTS += -DGR_PYTHON_RELATIVE=ON \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
