Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CDDC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:40:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C3A860698
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C3A860698
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 342318242D;
	Mon,  6 Sep 2021 15:40:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z2EC7Ye6e2AQ; Mon,  6 Sep 2021 15:40:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B95181C40;
	Mon,  6 Sep 2021 15:40:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E54D41BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE62B402BF
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:40:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N_uDY1GjSKeZ for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 15:40:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C259404A7
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 15:40:54 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id q3so10033374edt.5
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 08:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=fYwml9yDBXxlFFgHYNbXS6nLYO9AzQ/sknO5/cfITvQ=;
 b=fYBGowomExrmKPWcvY8Qo7s75yZnJOz8s+h/npCnMsZm0hvEs7HT06qqDFxM0kF0uV
 UTjBHsGbe1iDwRZcusR5jxjmSCGY2qPdBNcmFNrOsHOMhHoMbD8+uFJeZ9H97btyxvxC
 m/3u0a7yc6vQ7Kh6DZLawXmUyDTT+bW0vP/irg5tCTjVPNH3Byw9DK0whGo6B8FdA/jc
 WM97OqT89c2EIprKNLcd5b7ek3y9VZuE/m5ncbIXag8pKdfWiQqI7gYRU5GddTA+br5A
 ob+voe1hgFObh1gnG1/oMv0x/thsOBqAwQTobR44B7V/qleF1IXHu6q8tsMmR/pS7MPE
 tigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=fYwml9yDBXxlFFgHYNbXS6nLYO9AzQ/sknO5/cfITvQ=;
 b=CtwWjSF5ka9PSrkVASZtlc3rVhJDseHxX5HiENHjI2JY7XcxH8VBrIBj2CE8uXM9IZ
 r6dX07tEPGDDm22U+jqddX0gvUScXDXYM2CTcB8gquMgLrYl1Xg5cbkorHz+slrtA/PD
 y9EuiUoJ9VDEbB6cRYC684bygOM166OWsyZNifNra2RhBa6QOGavzGXSJORUgaMIkbDa
 zDALipevPA51APPuO//WcN/QRo37rJGrtZCgH3L9bl6Zlvba1ddJtEYTSHbLAC6i7mha
 hbAbx083Rqi3J8zPt5NmiI0okHzIxjNJq7PKVzUPhq6tS06DMuICLB9sU0r+2UAz9orU
 Ht5Q==
X-Gm-Message-State: AOAM533kLsE/M6MGeh0+D6VApdAPsBatPGDSr6tzXvnpWOz4VSEAfUQP
 55PTZFR4iiCOLTJPxQv3zZykKMs/Mio=
X-Google-Smtp-Source: ABdhPJyQRB5QEpvfWpabDQsk3b0mcg1hZsWlJToQQbr00dJT+5x4W7MASFTqOs6AYjo9fTu+Cq1TQw==
X-Received: by 2002:a05:6402:1d05:: with SMTP id
 dg5mr13880009edb.375.1630942852321; 
 Mon, 06 Sep 2021 08:40:52 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 g19sm4163826eje.121.2021.09.06.08.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 08:40:51 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNGjr-0008Nm-5U; Mon, 06 Sep 2021 17:40:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210821093908.677218-1-fontaine.fabrice@gmail.com>
Date: Mon, 06 Sep 2021 17:40:51 +0200
In-Reply-To: <20210821093908.677218-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 21 Aug 2021 11:39:07 +0200")
Message-ID: <87ilzdiuf0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/sdl2: kmsdrm needs GBM
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
Cc: Michael Fischer <mf@go-sys.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > kmsdrm needs GBM (and so mesa3d) since its addition in version 2.0.6:
 > https://github.com/libsdl-org/SDL/commit/56363ebf6124b345e1cfbd14fb6c0e654837910c

 > If libgbm is not found, kmsdrm will be silently disabled

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
