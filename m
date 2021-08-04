Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB6DC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 11:05:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8DB060F43
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 11:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8DB060F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACA7940239;
	Wed,  4 Aug 2021 11:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fMMsZOYZyUDi; Wed,  4 Aug 2021 11:05:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5C8040371;
	Wed,  4 Aug 2021 11:05:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EAE01BF327
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 11:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D61C60667
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 11:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JMe5zXACX5ca for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 11:05:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C18260650
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 11:05:17 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso3626527wmg.4
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 04:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=wpqLLNquZfyf/oVSSk298iOUEtFXpDSw+z02gxt5mxw=;
 b=SXvS63xdrfmBIqYSUaZCtYBwLJB9VpunLxYY25K3hrJYVfJu0JSqxPphbsrepmnQTk
 rolUuIeXILMQP5Z5MLppGb2+sSYjpn9MFTuLojfnSBCGw2bw2X+2vOLNITxbK+NdgQbX
 TlhB1NM1fZzLfVi3Ont1HyoNI+VLcIFWuYVFri+Z4BOrHhrbZCd1DpEuT8XWwcIFQgYG
 xhoN86Ot22/Ls1Ol2KlIQsRiLvHn4/eUmMtPXwv/+ztW2U8GHHb7YfpdzpQuGq/em+FR
 54/BcUxuRibHrVzJWMEIPyJkfPv/HzD7TINLcZcY75wDHRFlGYV76Xhbc8JDAkVWtx01
 9cGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=wpqLLNquZfyf/oVSSk298iOUEtFXpDSw+z02gxt5mxw=;
 b=mjL6cR0pLxFx0eeDBucVj3uLSUqHrdCbxyT1C8omaK9BwUItzSIjxeoU/HXcOCDwg/
 AtnlOjBtPSCzG0BnfVI8utCQkhOP2YEZLDOkNWvsDne7D3x4Z0piFZPfI4sJdiS7ORPV
 WrLcP8qZYFY1s1qp+6HCBrQqfUcPMf4FovBTvo4YQFX6OwcvSNW621ddkyMZ5X2eq8vm
 XtI1MnT6Yozfh7cWTEcNXSktfAVp3koAFcXMI1vr8UxLjHTIOTZHP0Qwt+RUUIAX/+MN
 R3H7H6KjvTvIh4O1D30mvlp0awVXsAodRkjp/TOTRGV+S1DPcGQ1qIFSeMuYB44T/HzP
 ErxQ==
X-Gm-Message-State: AOAM5303wNorEJqO90NGxpCdmZIFqznGujQDk3gznUP9wRO/+6Q6kaK8
 KFYaXAPlLp1onvPnhw7E2VU=
X-Google-Smtp-Source: ABdhPJxZnGYeX52qFivhWdIGO6pXsTHwZ4dMzvK2egZDw1IsrI25BD8j6yNg5WDKWX9+sSxnxK3bLQ==
X-Received: by 2002:a1c:43c1:: with SMTP id q184mr8895465wma.173.1628075115690; 
 Wed, 04 Aug 2021 04:05:15 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id g5sm5401839wmh.31.2021.08.04.04.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 04:05:15 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBEi2-00012W-G6; Wed, 04 Aug 2021 13:05:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210701174719.112866-1-fontaine.fabrice@gmail.com>
Date: Wed, 04 Aug 2021 13:05:14 +0200
In-Reply-To: <20210701174719.112866-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 1 Jul 2021 19:47:19 +0200")
Message-ID: <87im0ltqqd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/exiv2: fix build without SSP
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build without SSP fails since bump to version 0.27.4 in commit
 > bcace429426ee91aac56f3dcc33b69e22141d384

 > This is due to the fact that
 > https://github.com/Exiv2/exiv2/commit/bbe0b70840cf28b7dd8c0b7e9bb1b741aeda2efd
 > removed the wrong GCC_ prefix from HAS_FSTACK_PROTECTOR_STRONG variable

 > Fixes:
 >  - http://autobuild.buildroot.org/results/ae4635899124c602c70d2b342a76f95c34aa4a3d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
