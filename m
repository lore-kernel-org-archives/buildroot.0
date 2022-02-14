Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E2DC4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 09:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28137813D0;
	Mon, 14 Feb 2022 09:39:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZqRyNc-CKLL7; Mon, 14 Feb 2022 09:39:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C070A813F3;
	Mon, 14 Feb 2022 09:39:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D2D4B1BF3C9
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 09:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C162660D52
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 09:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lUdUOU4VxEUb for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 09:39:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A2B460C09
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 09:39:40 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id u20so808051lff.2
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 01:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EVRmLCVNXVuhCmIPqw43VU4TB/1hrIHDF9mEUxj2dts=;
 b=ahEMGGrxZNT7QyQWDdQTxr+rFLGxxpZPA3g0S8wxmOifM1Q5tvOgOQOEyQF1KNCkWj
 sXKSVMiy2BLRm3HuIeMmpv9lINqlZEH68NxSi25LHXRkz0RFM7jtIcick3nzWT/gXyHc
 ZVSq+E92iqTp8Hj2mG4S6Ohgcvj64Pmf2DL0ErRJYIZNf3A3OBs0dhQ77du0lmYUCabP
 xQqv2a1El8TQC+SMETH76yM4nkIPe/4LbPPfSBVzqvF+g9/ydYzT13DuEq8SczSWFeNi
 Zyx8fT+Y2DUijcxouLyRUmuJsivmd846dC5h/2hVkcMCaxkHYnuYgES6lwuLR3bJHOcj
 5zhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EVRmLCVNXVuhCmIPqw43VU4TB/1hrIHDF9mEUxj2dts=;
 b=qvHqeIFc41u98WoZRugMZ7af4BWiZ+qZrgMVU1+cNiqlVolmUxlAx1u9rAzSivWODd
 BiwwJz6OkojuB5bs5lnclzNMOONdaeVzvV96YXuG8oYNa+7NxEVQ11z7Dolxzf73lSP7
 4UvhEiErNOUBv1is+nPyOwi2Em2Xfis0EUAHZet6s55dYC83NpokLmkxDml4ORPAleRB
 UeXJYIvoANM3H77D4ap4n5y0Tt3G79m1XiIMH4khpzv0tnE9GyUxBWUvbPK6B4ik3Oks
 K1sPqTSEuKryxkD8tdNqwUvIIWL60ChB1t0yk/XqfGJYmKuXAF51ggBIfxkKPk93PQI4
 U/nQ==
X-Gm-Message-State: AOAM532MjGl0QYjOIavutnFA/9KIvZ/sOdlkR1f6bQ/O0+Hm9KCqezUV
 QmZ/8obA1hK3uWAouV918gs=
X-Google-Smtp-Source: ABdhPJyHTR/5Rih4hWV5I1DTBNUlVLYfeluunWb3U7yamrQF6+zuTjel1SjKL9BbAUtC5i+6SqCvfw==
X-Received: by 2002:a05:6512:12d6:: with SMTP id
 p22mr10481182lfg.231.1644831577825; 
 Mon, 14 Feb 2022 01:39:37 -0800 (PST)
Received: from curiosity ([5.188.167.245])
 by smtp.gmail.com with ESMTPSA id u9sm714573lfr.203.2022.02.14.01.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 01:39:37 -0800 (PST)
Date: Mon, 14 Feb 2022 12:39:37 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YgojWbviqjNzjSxD@curiosity>
References: <20220213155208.560001-1-geomatsi@gmail.com>
 <20220213155208.560001-2-geomatsi@gmail.com>
 <20220213213809.361f3ea9@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220213213809.361f3ea9@windsurf>
Subject: Re: [Buildroot] [PATCH 1/2] package/hostapd: update DPP option
 handling
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

> > Makefile hostapd.mk defines different macros for different defconfig
> > options. Options that are not listed in defconfig, can be set using
> > HOSTAPD_CONFIG_SET. Options that are listed in defconfig, can be
> > enabled/disabled using HOSTAPD_CONFIG_ENABLE/HOSTAPD_CONFIG_DISABLE.
> > 
> > Starting from hostapd v2.10, option CONFIG_DPP is explicitly listed
> > in defconfig. So it is time to switch to enable/disable macros for
> > this option.
> 
> This seems fragile. Why don't we have a single way of enabling an
> option, which doesn't depend on whether the option is listed in the
> hostapd defconfig or not?

What do you think about removal of HOSTAPD_CONFIG_SET and having
something along the following lines for configuration step:

@@ -124,9 +124,11 @@ define HOSTAPD_CONFIGURE_CMDS
        cp $(@D)/hostapd/defconfig $(HOSTAPD_CONFIG)
        sed -i $(patsubst %,-e 's/^#\(%\)/\1/',$(HOSTAPD_CONFIG_ENABLE)) \
                $(patsubst %,-e 's/^\(%\)/#\1/',$(HOSTAPD_CONFIG_DISABLE)) \
-               $(patsubst %,-e '1i%=y',$(HOSTAPD_CONFIG_SET)) \
                $(patsubst %,-e %,$(HOSTAPD_CONFIG_EDITS)) \
                $(HOSTAPD_CONFIG)
+       for opt in $(HOSTAPD_CONFIG_ENABLE) ; do \
+               sed -i -ze "/$${opt}=y/!s/$$/$${opt}=y\n/" $(HOSTAPD_CONFIG) ; \
+       done
 endef


This way only HOSTAPD_CONFIG_ENABLED/HOSTAPD_CONFIG_DISABLED macros will
remain. Options that are required, but not listed in defconfig, still
will be appended. There is a chance that next hostapd releases will
introduce some new options for existing functionality, that will require
attention. But there will be no need for shuffling existing options
between CONFIG_SET and CONFIG_ENABLED.


Regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
