Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E80FC04FF9
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 21:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4637C40BD2;
	Fri, 12 Apr 2024 21:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M1k5memDVhAk; Fri, 12 Apr 2024 21:18:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 513874117E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 513874117E;
	Fri, 12 Apr 2024 21:18:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66BC61BF37B
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 21:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 529B44071B
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 21:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQz01UH34eCX for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 21:18:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=ben.hutchings@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6D543405D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D543405D9
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D543405D9
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 21:18:49 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4181e10b346so934225e9.1
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 14:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712956728; x=1713561528;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1quyl+sfHNJQJ07oOI3W0pwRLyDcZkbGGFyvHdoCV5c=;
 b=xSm6rLOVAuA6Cuyz2So48NdKoTfBITiZq0m+4kHCat1+lP/iZoOsu9QBMs8Qhcpi7C
 jjxR8PuDoo9mxK4IC10cmQSYVpOKBpJ+FSjwQfvHGXTqX0+BI/ssDofQZyde2x3GtVIR
 zHGipssrS1u8oMTQBl/co9M4KrWQvKoP7Rb00/7woSE+80R/4FePQ2j4z2eiXEZTgkpe
 +kRbu71M8O3uwKcvcsxEW2HiZ3qPAIiesLeCD69qNoE6y/o8h1WWLsH+UJZHGSXAhnxW
 K/MI9aqTMxF0KpukrqpN82goPCCcVe1lKScu9zxmEdtgP1HR2H/ori+7ArBn2pZ5S40m
 2YWw==
X-Gm-Message-State: AOJu0YwQ9OsBAeHShtAYpVMvi4JdkwM4SnTobIS0sViB32N5p+nVd+t8
 Hzd5osdCeRDLYehdnnfZ2kbjKWFzvkX9J+nkvknKQRpK3udpEopHCEKwRC7oC5w=
X-Google-Smtp-Source: AGHT+IE4ZAkeGmzH2HSfmbv43rewdchP4SavusNPlNfRCAzymYaqCfKLhhnfDRmTavbiZXZWwIoqpA==
X-Received: by 2002:a05:600c:5252:b0:418:1031:2a84 with SMTP id
 fc18-20020a05600c525200b0041810312a84mr1125632wmb.17.1712956728009; 
 Fri, 12 Apr 2024 14:18:48 -0700 (PDT)
Received: from cephalopod (213.219.156.63.adsl.dyn.edpnet.net.
 [213.219.156.63]) by smtp.gmail.com with ESMTPSA id
 g7-20020a05600c310700b00417e4add806sm5485988wmo.7.2024.04.12.14.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 14:18:47 -0700 (PDT)
Date: Fri, 12 Apr 2024 23:18:46 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <ZhmlNkAZ8_BA5NzZ@cephalopod>
References: <20240411145559.1183064-1-ben.hutchings@mind.be>
 <20240411145559.1183064-2-ben.hutchings@mind.be>
 <ZhgwczmiLaRsX25t@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZhgwczmiLaRsX25t@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712956728; x=1713561528; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1quyl+sfHNJQJ07oOI3W0pwRLyDcZkbGGFyvHdoCV5c=;
 b=RilUdn/InfcdrRpNsnrp3kGVWex4jGdSU8WZnTcXppXObWEaY08DJaV10C5HAj7ay6
 sfnqE/M+xuh8er7+EUNadMS9m2d1wSYBFBADevgVxmW1XPLXQY/BbFtIxuGtLXFIc+OH
 ibeloxy1c2uwBLi7HhDDsZMvtm0YRWjfjcLUWavC0KSLihsSqLWrP47PMYiRfb+2VjPs
 dIvcxKnwsYMxDKT/Bt8TrnupprdZ47rO70XS1M/30XlwRbaoLnHWj2Dv8+LZb9Y2L7IM
 k/jRdPmDZW8Qvc3f8m6wBbLo1sRyB9mV95GCryAapyiWTJa4mKdFbiOj9e82VNPWsEQ1
 nTgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=RilUdn/I
Subject: Re: [Buildroot] [PATCH] package/qt6/qt6base: Restore DirectFB
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
From: Ben Hutchings via buildroot <buildroot@buildroot.org>
Reply-To: Ben Hutchings <ben.hutchings@mind.be>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Apr 11, 2024 at 08:48:19PM +0200, Yann E. MORIN wrote:
> Ben, All,
> =

> On 2024-04-11 16:55 +0200, Ben Hutchings via buildroot spake thusly:
> > Apply a patch from upstream to make Qt 6 support DirectFB again.
> > =

> > Implement a config option for this, similar to what we do for Qt 5.
> > =

> > Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
> > ---
> >  package/qt6/qt6base/Config.in                 |   8 +
> >  .../qt6base-directfb-Fix-compilation.patch    | 288 ++++++++++++++++++
> >  package/qt6/qt6base/qt6base.mk                |   7 +
> =

>     $ ./utils/docker-run make check-package
>     package/qt6/qt6base/qt6base-directfb-Fix-compilation.patch:0: use nam=
e <number>-<description>.patch (https://nightly.buildroot.org/#_providing_p=
atches)
>     package/qt6/qt6base/qt6base-directfb-Fix-compilation.patch:0: missing=
 Signed-off-by in the header (https://nightly.buildroot.org/#_format_and_li=
censing_of_the_package_patches)
>     package/qt6/qt6base/qt6base-directfb-Fix-compilation.patch:0: missing=
 Upstream in the header (https://nightly.buildroot.org/#_additional_patch_d=
ocumentation)

Sorry, I should have known about those.

> Also, we currently only have qt6.4, while qt-6.7 is already released
> now, and the patch you add was already present in qt-6.5.
> =

> So, maybe it would be better to actually bump qt6 rather than backport
> patches?
[...]

That should also work!  But I don't know what else might break when
updating Qt.

Ben.

-- =

Ben Hutchings =B7 Senior Embedded Software Engineer, Essensium-Mind =B7 min=
d.be
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
