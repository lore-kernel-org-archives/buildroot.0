Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1B7C3600C
	for <buildroot@archiver.kernel.org>; Sun,  6 Apr 2025 14:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C22940756;
	Sun,  6 Apr 2025 14:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6geYXyOGtDIn; Sun,  6 Apr 2025 14:29:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9855940763
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9855940763;
	Sun,  6 Apr 2025 14:29:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C77211F1
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 14:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B115960D6E
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 14:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PY6TmKi2h6x1 for <buildroot@buildroot.org>;
 Sun,  6 Apr 2025 14:29:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C159F60D61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C159F60D61
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C159F60D61
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 14:29:50 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cf825f46bso3060715e9.3
 for <buildroot@buildroot.org>; Sun, 06 Apr 2025 07:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743949789; x=1744554589;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2xKlrp9AMDNeYJ+4iTtnfKQvCK3DVLtIk7uN5RFuS8c=;
 b=Cu8sc0hdk+Ict8jWJdHASvXATH+dTk9rDpf6b7sIucjHRcgnMR0dsTycAEeVCa7167
 WaYqmPxcvei53+AfA5po5psUQEY6j+/Pqbfg5zRtY0lfVzJ9QFRs3ueJkHwbSoT38l+z
 tyj7cWrrgL60/hUczHQMxaipoqr8t9+AlvPvj6gqPaioRqPP5P+FdYlQum9+Wwmr0uH0
 /4Cjgpja4XVyWvSzXmP1Ytuet7EDI806Y1huAvEna9EXp49BYO7Gs6Juc3uJY8wStQvi
 b2YeEDmBSLY8CKVhikXxAPPXdokYCRW35jZOTJNg+slBDMxtUSzeO3Z3xZ74FVidpXJI
 9gCA==
X-Gm-Message-State: AOJu0YwdHLB3kbmIitsdzN3CnCRqwO6Lypazpmely1yr+FHzq+tQ7qS2
 ylXEneJUomb/7z+YbAgMWHsYcDUAu1GYLq9d/x0cGN9F3qa4aAAv
X-Gm-Gg: ASbGncsgxmRQx16D10PigzAvH39YEVKoi8O36uBBoVzo9AY55W09IhjCQcNFeEnZ4J2
 L/zRuUAFY4omKbVAVE5wrs7PACDSePL5bkBUucbZbJR3BD9hovDKMEDx5bx/btiNxeoEDifJLb6
 GUsQhh2dQjpTajnvKahBixn2p6S933pMGhorF32GnkCJpGTNWR85dBQcvAHwJ9jK4fWhtz78iVa
 XLiEu2GcQ9KOdH9w+yWOq8LHE2hqYy06YWnpPPPNCy9pltJW/ClfgG4E6Ljs/YY5GMP12LbZD3B
 rR72pzuKatIlBfTfRQ/JaPfq2a0SooAd
X-Google-Smtp-Source: AGHT+IF1wR66phyGswymlTClPOSpFVEdG+XGiqEYLNY/w/DkwjT3vFVR2l4CDSSKsxowaEm5nVE4DA==
X-Received: by 2002:a05:600c:848d:b0:439:a3df:66f3 with SMTP id
 5b1f17b1804b1-43ecfa18ba7mr30581925e9.6.1743949788342; 
 Sun, 06 Apr 2025 07:29:48 -0700 (PDT)
Received: from skbuf ([188.25.50.178]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec17b0d06sm106118645e9.35.2025.04.06.07.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Apr 2025 07:29:47 -0700 (PDT)
Date: Sun, 6 Apr 2025 17:29:45 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>,
 Vincent Jardin <vjardin@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <20250406142945.5seublipjpxvzgn2@skbuf>
References: <20250302215219.1276480-1-olteanv@gmail.com>
 <20250302215219.1276480-13-olteanv@gmail.com>
 <aacd0a14ef0fb7cd53d4bb80a69c5bf9@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aacd0a14ef0fb7cd53d4bb80a69c5bf9@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743949789; x=1744554589; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2xKlrp9AMDNeYJ+4iTtnfKQvCK3DVLtIk7uN5RFuS8c=;
 b=VzD6CJg3L8S4cJZB0VjKJMZcjROlENhADEm/6TLbveZEbnWCz/yVA9btgAYtsUAtSa
 mqaq+EV7Wm4UsxZykkU6bZZy0mCJHRGjj+5xzCsaoN18ciN8lJ1Ujk4tQJcrV9KFsgYL
 0B16iR2qj9jpPEp2cVx76Ag5eUhGmzbdMwNZCg59f9l83d3NInstxSBCVAbFFR93P563
 Rs8nAvGdB9aiLPVIPjeKKJuYjDrnM8p3nf8qK4/hNSK/CVIUk2Xn2SiHcR/RO+Sf6eCQ
 ofJB1Ksl4oYFJAr5/rQV76OIraUTau9Qckxuzr9+t95BVpBAVCbjwdtmkY0gOk6yjXis
 Ylhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VzD6CJg3
Subject: Re: [Buildroot] [PATCH 12/15] package/tclap: update to tag 1.4.0-rc2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

On Sun, Mar 16, 2025 at 01:33:40AM +0100, Julien Olivain wrote:
> Hi Vladimir,
> 
> This error comes probably from CXX=no set here:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02-rc2/package/Makefile.in#L435
> 
> This should not happen, because tclap can only be selected when there
> is a C++ compiler available. See:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02-rc2/package/tclap/Config.in#L6
> 
> So it would be better to understand the root cause of this issue. I tried on
> my
> side few configurations with C++ toolchains, and the tclap-1.2.4 (i.e.
> without
> this patch) compiles fine.
> 
> Also, this tclap-1.4.0-rc2 is marked as a release client. I would prefer
> sticking to
> the v1.2.x series until 1.4.0 is released.
> 
> Could you double check if this patch is needed? If you still see the issue,
> can you share the config that reproduces the issue?
> 
> Best regards,
> 
> Julien.

Yes, you are right, I'm sorry, I should have done more research instead
of expecting maintainers to do it for me. I think I built this package
in a pre-existing output directory where I had just selected
BR2_TOOLCHAIN_BUILDROOT_CXX=y, but the toolchain had already been built.
If I do a clean build, tclap compiles ok and I do not need this patch.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
