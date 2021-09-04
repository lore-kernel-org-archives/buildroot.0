Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9759C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 19:55:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39CED60555
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 19:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39CED60555
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2929606C7;
	Sat,  4 Sep 2021 19:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gFChrxgH09eM; Sat,  4 Sep 2021 19:55:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A51760646;
	Sat,  4 Sep 2021 19:55:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75BFD1BF31B
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 19:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6422940169
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 19:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id an51Z7OtLSu3 for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 19:55:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5373040167
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 19:55:52 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id mf2so4967929ejb.9
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 12:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=sm83X6MVDAJ80ZpDrKqkK4S5NVmGFTq+CKBkPubcvE8=;
 b=CRXMrkV5a1uBOM+hm7wbPLsqD3nbpU2Kyu1I1ltYxG2bDITq8bvJe3oAeF8rNAbMXS
 0pswVaCKSoYyh27AnEYZ2bYmBzlLQVZwjbMiy9zm4KBLAc4j6QxzyLDSKvjfpVTjKJIl
 ts0VQr9D7hfBzh3oKDp66lUeKBwou/2tgZWwDmjtwG157n92bNvlBRjaA8NKLEGpk8yb
 BctsqOQKlV/hJp7CTXfEaZSOmv/xVyDWNFf5gn+2GWWKNH1EJlllCvhsUkDFe1XbV/G6
 TP/Fm4kxtaMXUvKc5xKPhLgOnxC3VPwUMjISxr7tw6UtFM5Xrvv1UxZbocwiu5ES+qGy
 rR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=sm83X6MVDAJ80ZpDrKqkK4S5NVmGFTq+CKBkPubcvE8=;
 b=Hs/8f5TWxk+6K0VuYASGhs09gK9VW2z8XfI3+jqR8VHK3Tq7J+rHtbUk5mou64bdPs
 GI2mxq6SV1ZZKXDOK4uaGJBMqW9W723Nche+9z8eoTAKm1h1kiM+BlzxKJq4u31+Ot1y
 1vEPcHG3mM5z3it3/Ezey75EKBmcJ8EkKZuJfk1/SO3WFAv+zFgkx3YkpC17+PfRHeo0
 iXJYYbOflyjNQh29iRn4YcrLmeUpgsGhGHwBdMkjLIi49ghzjcCwzTifieAZeqSAj30t
 k+1KxPSbtxYQjmqq3LVIFObGceUqnitZwdZmKKDMBfoeOdl/YN1wYKxfLyA33V9jvsYZ
 kU+Q==
X-Gm-Message-State: AOAM5334BIVIwbQE64+LPjcaObE43DkvyZLBE48ZYXdzDE0q+MfVb9mE
 E25QKIN5skMY/JNwnYfsy0nGw7BeuKs=
X-Google-Smtp-Source: ABdhPJzqqRLQiDo2R72Fr9U/0SLh608TE68NADtRN2hISZrVye0ASiZFUrL65ZoORmUuIJW+jyfXYw==
X-Received: by 2002:a17:906:840d:: with SMTP id
 n13mr5604793ejx.53.1630785350434; 
 Sat, 04 Sep 2021 12:55:50 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 v24sm1794813edq.79.2021.09.04.12.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 12:55:49 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMblV-0003UG-9l; Sat, 04 Sep 2021 21:55:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210807155704.488812-1-fontaine.fabrice@gmail.com>
Date: Sat, 04 Sep 2021 21:55:49 +0200
In-Reply-To: <20210807155704.488812-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 7 Aug 2021 17:57:04 +0200")
Message-ID: <87fsukp12y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ogre: fix build on musl
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure on musl raised since the addition of the
 > package in commit eb91fa730c5d92202c38514345e86315e138944c:

 > /tmp/instance-1/output-1/build/ogre-1.12.0/OgreMain/src/OgreStringConverter.cpp:
 > In static member function 'static bool
 > Ogre::StringConverter::parse(const String&, Ogre::int32&)':
 > /tmp/instance-1/output-1/build/ogre-1.12.0/OgreMain/src/OgreStringConverter.cpp:253:22:
 > error: 'strtol_l' was not declared in this scope; did you mean
 > 'strtold_l'?
 >   253 |         ret = (int32)strtol_l(val.c_str(), &end, 0, _numLocale);
 >       |                      ^~~~~~~~
 >       |                      strtold_l

 > Fixes:
 >  - http://autobuild.buildroot.org/results/491f89e45610a7752c0700ac02b80a92b7876ec3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
