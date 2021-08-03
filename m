Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9EDC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:14:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F02660243
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F02660243
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5007607C0;
	Tue,  3 Aug 2021 15:14:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9NpCWQRF-l1n; Tue,  3 Aug 2021 15:14:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26EDD6077F;
	Tue,  3 Aug 2021 15:14:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 61F011BF304
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E591828DA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:14:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KAhcU6GUSBiP for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 15:14:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A06C782572
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 15:14:54 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id c9so5435333wri.8
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 08:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=7/x0fIkEelwYEoTYBurluzxRl00XykjwSv9CiF8a0rw=;
 b=Fo0I+5L6E6AXhu1jXvkHDo//xOF+xgme1kFxLDRdznCVi7PlL+TAPkFNhJj3SdaJi+
 zNGvkG/Q+2S8LcSvP96DenSSYumRgAQynBvqK6q0q9h+x0+Q0BlfFBzR1XOm9qd3e/d6
 jVEggJGdir/Pdv4C0pyRBbjuYik07/Jy+unGIWaqw1KZhLdt3CB7Q2iLCV0cfmi8Zo7I
 fsJzxBKn5mh2+BrhJMl46J+5KgisLsDNQSKmaOC+ja2U2w4x1MQxShUuzqIXcEMSctF7
 6S0LCsc9PBOqT7j+Cn4jmGBIhNtdNBM1I4Jwv3D1Y+cBLVS6IVUnmDZUC/t3LWieMeq8
 gcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=7/x0fIkEelwYEoTYBurluzxRl00XykjwSv9CiF8a0rw=;
 b=H/9nIjIVIyi0SFVr4Jhrawim3iEsnuNJb41oq2lX4pk+yP4cinZQ5uPvkizcZDZcOH
 vKZU0KboLwlAfJDX77v+pY9zsB6wNgNfZOWBZrdp8wMiemNpbWD1IDddcPLCYSh6t7zY
 dLTnF3AVfhdJ33780k9NnFH63+0ol+iE67oe/kbVNucCYoz+O/yw++ijM/PYWXAmbgKV
 o6Te+uzX8fjp0gFouWfq8EgO7Oc78LUmKo2s8VXW6+ahjmAzNayegtuLduraYnbcx/RP
 kLCKxqIVA+AgGCj4bUKJKoET+8kIr1u6fxV06v2RN0zgFdlT2zh6M7WuVshWKyH7RUS5
 Khyw==
X-Gm-Message-State: AOAM530DEodo4vgaRJusTZhMDCt2IXoR4hSohX0ri0IOQ5o+saNgzDqc
 subfWYWdDafRZqUpTM1HoTE=
X-Google-Smtp-Source: ABdhPJzhiOozcZFzO0ovwYO4bLWvxL48J0+l5feYcroVMsCAKZhuMhPNwnGK1VEkMDe3cgn7yFCmKA==
X-Received: by 2002:a5d:6891:: with SMTP id h17mr22557651wru.324.1628003692877; 
 Tue, 03 Aug 2021 08:14:52 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id c10sm3115168wml.44.2021.08.03.08.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 08:14:52 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mAw83-00036Z-9O; Tue, 03 Aug 2021 17:14:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <YJvT8OBjdRJGM_NIy1jk4OLrxzBuhRAPbcJUM28fU3mjJoMmVKMiV4qQIMsCejUhiNT5o5yL_G-k-GF81J1_H4FSm7n6Pv1EgaIr4sdXXIo=@protonmail.com>
 <20210717081957.GG12203@scaer>
Date: Tue, 03 Aug 2021 17:14:51 +0200
In-Reply-To: <20210717081957.GG12203@scaer> (Yann E. MORIN's message of "Sat, 
 17 Jul 2021 10:19:57 +0200")
Message-ID: <878s1iwoes.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mpg123: Remove disable-lfs-alias
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
Cc: gameblabla <gameblabla@protonmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Bruno, All,
 > On 2021-07-12 18:30 +0000, gameblabla via buildroot spake thusly:
 >> From 81b245ab8b14126a1726154542bcef5e56863649 Mon Sep 17 00:00:00 2001
 >> From: Bruno Marie <gameblabla@protonmail.com>
 >> Date: Mon, 12 Jul 2021 20:22:35 +0200
 >> Subject: [PATCH 1/1] package/mpg123: Remove disable-lfs-alias

 > Not sure how you sent your patch, but the mail was completely mangled,
 > and the patch did not apply.

 > Please, ue 'git send-email' next time, as this sends proper mails that
 > can be applied without error.

 >> disable-lfs-alias causes undefined references for apps that want to link against mpg123.

 > I expanded the commit log with the reference to the commit that
 > introduced that option, and added an excerpt for the help entry of that
 > option too, to exp[lain that we should not use it.

 > However, I don't recall having seen any build issue in the autobuilders.
 > What application is failing to link?

 >> Signed-off-by: Bruno Marie <gameblabla@protonmail.com>

 > Applied to master, thanks.

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
