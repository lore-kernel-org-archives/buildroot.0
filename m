Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339AFC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:44:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA7F560EC0
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA7F560EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98F5981819;
	Tue,  3 Aug 2021 20:44:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KKc-FpRidEJj; Tue,  3 Aug 2021 20:44:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEE1581501;
	Tue,  3 Aug 2021 20:44:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC9B41BF83C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BF7040209
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qvOJBO9nWpMX for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 20:44:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD8824018E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 20:44:31 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso2538717wmg.4
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 13:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=TCxpeG6WDLqujgEbk5gVLWbYqbWIFApQKpDCQFwOHFU=;
 b=Q5Z44siCqf9t6m/JJGJmH1K4mI+2AL3giEw4pVhy5+Bl2xqES7UWhM1f0vZYdlvHJ9
 7Le791+78baCZxZwBbtHONGNSpg8fB3izwLgUvsrgg2ude6riApDOUME30vFnR2y9HDR
 EY1mPLcFXCA5ngRHv1bkYuVD3iGOIHuZq/3yWLyDx83Uuj8snuEX4uRJIgAiM1O2HfXJ
 CGEXnp310LJzg28HfHsFBdeNoFhjAmCjOfn8VWWoTTf1t4eYZd+mRv2A8RdCRYjOTqiI
 QMUKF+6D0DyqtUc5BGaKl5+HD/JaBbZLL19nSkYFu6tmiUQsxRlGfxDL0QKhpJC+TQbQ
 JRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=TCxpeG6WDLqujgEbk5gVLWbYqbWIFApQKpDCQFwOHFU=;
 b=dVhuV+8y4ZAXe4FbEdceVfmkxjKjXbyg0tb7iVWKGQpuqXGDVD+7zF70fehC+WD31v
 CqVeNBDL9cV5OKyuUshmQHUs7ge2fAuB5u7SFC3wx9D5VeUVgfta3mvWsF6G6zIUyeRd
 mxXanfD8Sw0IGFpnvi8sSEq5n0O7RUvlbq9v//vOI67DFgG17DPM+zkia12h96ryHz+x
 kLdq+sfHKN/lI3ZTQ0Fa8mJXtV5finFFszPYyr752k/WdV1TOs+rlfGuiCc0SCYhUM8b
 3ymRcgqfcODWOqx2yqhYogQd7MDHfIhclxN0LS8Ag0KSGWcSzdxjFnbHTB7wEM269Hoi
 dJvA==
X-Gm-Message-State: AOAM533NwpTieqFtXegEOvbbpQCcY5JIljMa+LNjzwIMy7AEr9zm/GaA
 xCqki5nJojTF5dKIuy92uVg=
X-Google-Smtp-Source: ABdhPJxMCJZElvNe7UPW1ANSOqramfajQwYBR1Ln7LBXklMbqOO9jiu1GiG7HS2eKA8hcNTO5gXzjQ==
X-Received: by 2002:a1c:a54b:: with SMTP id o72mr6221264wme.114.1628023470018; 
 Tue, 03 Aug 2021 13:44:30 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id c16sm6152wru.82.2021.08.03.13.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 13:44:29 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mB1H2-0006yr-PW; Tue, 03 Aug 2021 22:44:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210717214854.1150900-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Aug 2021 22:44:28 +0200
In-Reply-To: <20210717214854.1150900-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 17 Jul 2021 23:48:53 +0200")
Message-ID: <87a6lyuukz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/libuci: add LIBUCI_CPE_ID_VENDOR
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

 > cpe:2.3:a:openwrt:libuci is a valid CPE identifier for this package:
 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopenwrt%3Alibuci

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
