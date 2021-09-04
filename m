Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5DAC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:37:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA8CD60F42
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA8CD60F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64A0B6066B;
	Sat,  4 Sep 2021 21:37:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wyESvATZ-OVF; Sat,  4 Sep 2021 21:37:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADAA36064B;
	Sat,  4 Sep 2021 21:37:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 177811BF3ED
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06FAE80F67
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:37:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G-y4wayS8K63 for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 21:37:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC14181028
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 21:37:05 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id u14so5258179ejf.13
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 14:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=5DhYYBeaoKtidFvVJbjDIJCbnYwajButwyQuGFv9Fxs=;
 b=iwolhZjCik/Ut8lvUqCLZTbQeLSjcFVcV2EY/SMcvTQUNR4jK/jqUhjW0QRGaHLQPA
 StP4Woc8IBaMyRkKouhBpIRvyFIyg6RDeVS86fW+wM/fSCmTCwfNzXpBMgFmv/vEToy2
 t5Q3E0zFPBlTyqoA3R7Pk7aqxAudjTZjhKLjU74vN68xbtZiNwtzDC2O4z7116dAN2sV
 QQEeI/9dR1a6XZjdum5cPtQ8YwN9dAtK6JzwmsPTEDUDEBvCmx+ug9j//C/qqx2u0Sit
 Ou7CikGvOOS0yihBBdOUUItaayqgsqfxIx+Bp30WmKD5GYKopiMM4US2JV7dq6lbShkG
 VxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=5DhYYBeaoKtidFvVJbjDIJCbnYwajButwyQuGFv9Fxs=;
 b=fxZLUY71kgk8tXS5Wl7BmJTDK+GWazQxnzNU+rF6t+i7tu2AzcuYWh8bKPa3XzWc3y
 Z005NEf5zyiFAPKJjN3e+vmD2eUFQjD3u4FGTy7KpKhYeBfGLWVuNEQzwqgVR4ozu/+c
 clrxsQ3x026Q+07EKyaBh8U3ElF1bV5vCPRoOiJhDNJML49tquHrpD9UROZmfQZPyjkT
 xxZ/s05NsrXYKiNRh+UuiOowj0x8AbjIUKEhFNee+iipIO7kDb+oWXFXTLPWpQEmP4KS
 fUejkpmE4vFb2+EYWKWan19p6IERQaOxOuVrkfEXg8t+rBBb0jiQ8jZIfwq1CfhX+lSZ
 0a1Q==
X-Gm-Message-State: AOAM533f6byQuB2boJXseuVzxdc4xfPe+xnuR2ktMLliqq60DZVvkgQd
 RsjTPzs6Zs6sAzUJTa1zNzKEKfIvLjM=
X-Google-Smtp-Source: ABdhPJyKnd6Wy1ruDwvN92RmM1YGBiwijtcdAM/wOraOS6GtSZx6ogzEUWT0EHrt+CZF/Q8yLvyX+A==
X-Received: by 2002:a17:906:d541:: with SMTP id
 cr1mr6104700ejc.81.1630791424134; 
 Sat, 04 Sep 2021 14:37:04 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 u16sm1549304ejy.14.2021.09.04.14.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:37:03 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMdLS-0005Yo-Qd; Sat, 04 Sep 2021 23:37:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20201107155250.427556-1-fontaine.fabrice@gmail.com>
 <d22b2bcf-27a3-3d98-f594-5359e35522a0@mind.be>
Date: Sat, 04 Sep 2021 23:37:02 +0200
In-Reply-To: <d22b2bcf-27a3-3d98-f594-5359e35522a0@mind.be> (Arnout
 Vandecappelle's message of "Tue, 17 Aug 2021 21:47:54 +0200")
Message-ID: <87wnnwkoox.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/fontconfig: break circular
 dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 07/11/2020 16:52, Fabrice Fontaine wrote:
 >> Build fails because of the following circular dependency:
 >> 
 >> fontconfig -> util-linux -> udev -> systemd -> polkit ->
 >> gobject-introspection -> cairo -> fontconfig
 >> 
 >> which results in the following build failure:
 >> 
 >> checking for UUID... no
 >> checking where uuid functions comes from... configure: error:
 >> *** uuid is required. install util-linux.
 >> 
 >> To break it, apply the same ugly workaround that was applied for
 >> libglib2 and cryptsetup until a better solution is found:
 >> https://patchwork.ozlabs.org/project/buildroot/patch/20201101150619.1709959-1-fontaine.fabrice@gmail.com/
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/2c6ef073e7e98e13daa409e1ea6130e9abd32c87
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 >  I found this old patch because your other fontconfig patch didn't apply... It's
 > still failing in the autobuilders, so applied to master, thanks.

 >  I'm not sure if the workaround really needs to be called "ugly". This is what
 > util-linux-libs is for, right? Perhaps it would be a little cleaner to
 > unconditionally depend on util-linux-libs instead, but this is fine as well.

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
