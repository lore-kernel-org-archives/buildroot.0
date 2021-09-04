Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A41C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:45:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C625C60F55
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C625C60F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84E94606D0;
	Sat,  4 Sep 2021 21:45:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FEMxAX6jftax; Sat,  4 Sep 2021 21:45:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6CA7606A0;
	Sat,  4 Sep 2021 21:45:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18FF71BF3ED
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08A456066B
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:45:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UiJ5S5Fm5uZo for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 21:45:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C557E60639
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 21:45:03 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z19so3896701edi.9
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 14:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=iflA1vwQLNmcgjC9JKuaL37AXqr3g8qBZ4nEA15fK2M=;
 b=INQkJkFpKGx+pxt8M4jsMxph3AFlh317yyzHJmQVoaZY9YhtokwKotDVWYIrdjexmY
 eEa6jz8TppP5TkNM3FjY2+XWnN0mV//BU33oxNrouFFVzwflBvIrnrGzeLZuplXLmCRT
 xxJdRw42A6ZlbO5aFDJiEg5Ue6Xcp7F1maE8TvyfFxAsbfbaor5/MnCYv2Od2fS7x8Vj
 ZtYQyBGUY1YyyGHV/E5jnF+dM+0AMvOVc1hUA5Thvs2n2f0zHXpOPJZlIgXPKhBkN+sI
 1GFL9MKjvHJH50jMPSXOIgxbmCozi2d+3oNLL+CaOy8jgk6WxaRj/wkL4d35YQqOKuRF
 fbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=iflA1vwQLNmcgjC9JKuaL37AXqr3g8qBZ4nEA15fK2M=;
 b=YMPMvoypYdezp93LlFT1qdAJMWDgWKALcpkVvi6QvBncUSj2TdUY+bpvAT9owmVN/r
 e0JSM7wpL0mZDIzYS8GgXZn+ormI3Ew/noLQEWoi8Uk8p4hbK3De5KQbywmYCOuoer16
 rYcPe8CrhkwCOQu5CF2K08xQbUHJFst3YW8PI8TZSFMaspoiWOjk4SJ1lD4lv3TtqdrR
 SO3+Gc2nyMAfDZ+MzPkaI2Z3nzbZYl6y5dqq258aStnVKEEZ8AJiNupXytRzJA94/kes
 en3KIPVEbMjomnPpKRqj78Ae70g/iPU2ivdVPr6TJ4+PC4vso8z3tpDYX8muVWgsx9Bx
 Sbbw==
X-Gm-Message-State: AOAM532KGMsPlKFgtjfCZlSLTYyz6RUcCIk359P+uQezIHyb1HVw48K+
 TgM3SYfPXoxM3cmwMlU0BSMlsr8CBkY=
X-Google-Smtp-Source: ABdhPJxhsTEZK6ExShKJglkv6zcjh8uvPIkSUWaOf2jRXZyQAU/uU/ZAPszly1dVsSkXDweOWq679Q==
X-Received: by 2002:aa7:d9c1:: with SMTP id v1mr5971728eds.316.1630791901964; 
 Sat, 04 Sep 2021 14:45:01 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 f1sm1879872edq.89.2021.09.04.14.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:45:01 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMdTA-0005km-LD; Sat, 04 Sep 2021 23:45:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20210817195528.B6C6E8D3C3@busybox.osuosl.org>
Date: Sat, 04 Sep 2021 23:45:00 +0200
In-Reply-To: <20210817195528.B6C6E8D3C3@busybox.osuosl.org> (Yann E. MORIN's
 message of "Tue, 17 Aug 2021 21:55:53 +0200")
Message-ID: <87pmtokobn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/python-keyring: depend comment
 on BR2_PACKAGE_PYTHON3
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=6a932714d31440203b707394e1927f05c49f40e1
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The user shouldn't view the comment on the python2 menu.

 > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
