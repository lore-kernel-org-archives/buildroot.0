Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0635C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:11:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E539460E0B
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E539460E0B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C46E4073D;
	Fri,  3 Sep 2021 16:11:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Saje01Gd7Tmb; Fri,  3 Sep 2021 16:11:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC6B5400C7;
	Fri,  3 Sep 2021 16:11:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 955311BF327
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83A2583F11
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:11:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gRC7C7ruM_RN for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 16:11:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE88483F10
 for <buildroot@busybox.net>; Fri,  3 Sep 2021 16:11:48 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id u14so13038100ejf.13
 for <buildroot@busybox.net>; Fri, 03 Sep 2021 09:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=JNNiLllIwzAOPScrQKQSXEdXPHIeEbnyAeLW3feCbIQ=;
 b=QEf6b0KUQ2way+AFHHpVr2dE1HWlrgEEUrJeALwfAH0XyVvJAtd0BNK08aa8GBMnjB
 TcsWiyAXdBzjL3kdRCmzrm9dF3OEjsTJsS1DQLAGIzTpiSi4D7PDdaRHRe+57cPqXqGo
 gUKuAHAzThEL+b+YUjmwDzV0ayNBcNgITh5L9JE/YKv5FzhNmkeo/iKV4Ou29qqGeG8z
 2AbXzQRfeFDyo34F/LEE0PNa2WEmhpfVsmdNpSrbTCBUwPTScvOtAnrunl9C5LqYGIKT
 PodHPH+AzdtuRXqPMaArJicnoVzD+0NQ0ocIpQap4hxg/dkn9fInQ0U1a4XHvkUbK3Zd
 6bvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=JNNiLllIwzAOPScrQKQSXEdXPHIeEbnyAeLW3feCbIQ=;
 b=WdkKyd3dt4SjU2Ld+10FerXveQhAJifTi1cduc0HANcyoEKcq9qVNy5PntUTe9q8+Y
 r3gdN/iuDN8vkthTIrHruPpGZIRwxvzaY8ABEvOLv0oJ2SMsxTXuEWFV7QyCgc42EKS5
 0S2ItoEr4EYrzhkR4aoX0bsvtoLuHRYhRG1mnYiZT6tUOf0nnexKKiUfT/YYTDACNbf8
 a17nJOpeeRtnnzcl7Bqr7wV1pYMxnZKpcnbNivE8kjRa5tA0mLbUfP4pwWyRujTo+iYW
 fX7DeZMgoZRhe1yCrOwTCUz5USFlkSY7WG66nIrlvA0BcQ/XlKBKGt+OOwMtfdv6YExD
 FrFw==
X-Gm-Message-State: AOAM533GMzjIkFKjElHzzOVbtQPUsqNJ9gKrVSP9jQnAICAVbyclJrei
 q/h1Uk47MXpUNOkdP4bvunU=
X-Google-Smtp-Source: ABdhPJyk3+47yiRq52iNPw7G4VfHK7Hv2dmhMVhxP0byjwRoHI1ZnttXTcxktUfdwK2tKXyPdUq81A==
X-Received: by 2002:a17:906:720e:: with SMTP id
 m14mr5008428ejk.500.1630685507044; 
 Fri, 03 Sep 2021 09:11:47 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 o15sm2995101ejj.10.2021.09.03.09.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 09:11:46 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMBn6-0006Jo-LI; Fri, 03 Sep 2021 18:11:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach <baruch@tkos.co.il>
References: <eb6c1c71663811f27493ec0b7f32f9bdb88a8820.1630643968.git.baruch@tkos.co.il>
Date: Fri, 03 Sep 2021 18:11:44 +0200
In-Reply-To: <eb6c1c71663811f27493ec0b7f32f9bdb88a8820.1630643968.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 3 Sep 2021 07:39:28 +0300")
Message-ID: <87pmtpr64f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/netsniff-ng: fix static build of
 mausezahn
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
Cc: buildroot@busybox.net, Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The configure script fails to detect libpcap in static build because it
 > does not take into account the libnl dependency on link. As a result the
 > configure script silently disables mausezahn build even when
 > BR2_PACKAGE_NETSNIFF_NG_MAUSEZAHN is enabled. Add upstream patch to use
 > pkg-config for libpcap link flags.

 > Cc: Joris Lijssens <joris.lijssens@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
