Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0404C004D4
	for <buildroot@archiver.kernel.org>; Fri, 20 Jan 2023 02:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1972E61222;
	Fri, 20 Jan 2023 02:35:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1972E61222
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QS2uA_BYHGYV; Fri, 20 Jan 2023 02:35:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65545611E8;
	Fri, 20 Jan 2023 02:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65545611E8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 337E91BF329
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 02:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BA5E41D7B
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 02:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BA5E41D7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J41JMTsakEj8 for <buildroot@lists.busybox.net>;
 Fri, 20 Jan 2023 02:35:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD53F41928
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD53F41928
 for <buildroot@buildroot.org>; Fri, 20 Jan 2023 02:35:21 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so6895680pjq.0
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 18:35:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sz/BZH9ISSAKyZU/PSfl9XDAak8ByN5udikHo/VA7Dg=;
 b=uYNX5snSiAR6w98FVj0fnSfdDBv49m3n0HivAxrfAi7nbv+fMb3RIsLbf5ivH5DCiD
 dYfvuftwWE+HX+AlUSZefQsrOtFC7VLAY1imq2FUqTGESxhliMAn0fd7Z20PdrR+BKKg
 I/1QFtx6ukxKANX/zLq/s1YPFvLo0yvaSslQqTFBSXJg6JqOQq17dqGGYxka7ZvHoUPt
 auwWPyfHTsL8U7ruWuH5gXcOCkUwV4VAL8h7b0Ejff15jDryO3TDUU+GYGf9GlztEQhd
 67wxQgKSOlL2Cf5AwSif0WZwem0/ZeN9ZjWZFihd2FW2G6D2xqBxoDe6vuCFn7TqMOyD
 0uRQ==
X-Gm-Message-State: AFqh2kqqJcB8nkiSVSssLBicCKYeaqA27eiVOSpYTAC3U5pCRTzl50PY
 6ub6pghv8V0X9v94Iwh2Y7Y=
X-Google-Smtp-Source: AMrXdXug9g9+At9p7zCDdTozxnfI9u/W+6stP2sEk+wl2UTJC7+F8BWVVS1ggrkX/3nZSCpEtutJew==
X-Received: by 2002:a17:903:32cb:b0:194:dd83:613d with SMTP id
 i11-20020a17090332cb00b00194dd83613dmr3115052plr.21.1674182121214; 
 Thu, 19 Jan 2023 18:35:21 -0800 (PST)
Received: from [192.168.43.80] (subs32-116-206-28-45.three.co.id.
 [116.206.28.45]) by smtp.gmail.com with ESMTPSA id
 u7-20020a17090341c700b00186e34524e3sm25799875ple.136.2023.01.19.18.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 18:35:20 -0800 (PST)
Message-ID: <b26514f9-0bbb-ac36-d0b0-c34b908dc30d@gmail.com>
Date: Fri, 20 Jan 2023 09:35:16 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Peter Seiderer <ps.report@gmx.net>, Peter Korsgaard <peter@korsgaard.com>
References: <20230119095842.445227-1-bagasdotme@gmail.com>
 <87cz7aden6.fsf@dell.be.48ers.dk> <20230119213538.093a1fa4@gmx.net>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20230119213538.093a1fa4@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sz/BZH9ISSAKyZU/PSfl9XDAak8ByN5udikHo/VA7Dg=;
 b=k0jCAdxZqcMSjnsaZco4ioficoZTJUfExX8rh7u6MTfM8mh3J7J7dOYosncK5zdB/R
 o1CZrbdQ+LTTDrjS3CRL1TUmNxxLxgo3hzW3gnUVGeZtZLn/OrfgL+99OeCcPmRfY3wr
 adhVazAA4jMCTXuDYwsJ/ctP9vuuu/XB0leNzsCBb20vlUUnGIku8p9KLhhrue3003Cv
 KvoSbfc85ziAYD1+yYIQ5v+J0fsO5b/HOgQXJx6K7zEp954gPVPADCfTk+55O+r54h3R
 dQ2DNm4SKS/rwoiu75AL49DXnFy/En5orgS31yTUlIvtC2Phknfg36chFJwhFgtzlNgV
 UXWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=k0jCAdxZ
Subject: Re: [Buildroot] [PATCH] package/git: prefer OpenSSL SHA-1 and
 SHA-256 implementation
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 1/20/23 03:35, Peter Seiderer wrote:
> Or 'Makefile: make DC_SHA1 the default' ([1]):
> 
> 	Makefile: make DC_SHA1 the default
> 
> 	We used to use the SHA1 implementation from the OpenSSL library by
> 	default.  As we are trying to be careful against collision attacks
> 	after the recent "shattered" announcement, switch the default to
> 	encourage people to use DC_SHA1 implementation instead.  Those who
> 	want to use the implementation from OpenSSL can explicitly ask for
> 	it by OPENSSL_SHA1=YesPlease when running "make".
> 
> And 'INSTALL: remove discussion of SHA-1 backends' ([2]):
> 
> 	INSTALL: remove discussion of SHA-1 backends
> 
> 	The claim that OpenSSL is the default SHA-1 backend hasn't been true
> 	since e6b07da (Makefile: make DC_SHA1 the default, 2017-03-17),
> 	but more importantly tweaking the SHA-1 backend isn't something that's
> 	common enough to warrant discussing in the INSTALL document, so let's
> 	remove this paragraph.
> 
> 	This discussion was originally added in c538d2d (Add some
> 	installation notes in INSTALL, 2005-06-17) when tweaking the default
> 	backend was more common. The current wording was added in
> 	5beb577 (INSTALL: Describe dependency knobs from Makefile,
> 	2009-09-10).
> 

Ah, I didn't see the discussions above before I submitted this patch.

Withdrawn, thanks.

-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
