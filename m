Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E1DC4320A
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:03:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8C4060560
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8C4060560
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78DA06FB26;
	Thu,  5 Aug 2021 10:03:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cBoK-EGuLWSv; Thu,  5 Aug 2021 10:03:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C117F6FB24;
	Thu,  5 Aug 2021 10:03:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 624751BF9CB
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EC168376B
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P0KWdTRlOa1O for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 10:03:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADDB483759
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 10:03:17 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id x17so2951356wmc.5
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 03:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=QLeu3c7Z1MlsuhKxCpnueWu3mbSaOAaItPM2UxrgPM0=;
 b=KFp4wGVPJheETQ8JPcGtKRNhnZqLXruHhp0CsLfcRvpGlZd4X+BS2lRhSJuTrvxQ5W
 mpNVJ4ohPyrBlufNe1nxLwu6pxRDXbgLxKMP7b3dM22j8vZWbu/69D3HsPZUebaYxbRg
 ddhlhwZ6NpaUmhPwfJxm35V0vSghG86viL2HMcHtvnB/kcX/pglYy/bSTqydFPr2yslw
 jjOadcajPVG66VYvldIpIcaCuHfkP5P5+lHwWOYplliKW8xqmRmd03HsdfDZumWRvT4Y
 yXgKYCh2lzI2R7emLNaRCF+aLPOqyvwmQQPsHFtijM2fLAwdNROfnIoQ2uBoPxPKWgzN
 36+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=QLeu3c7Z1MlsuhKxCpnueWu3mbSaOAaItPM2UxrgPM0=;
 b=ZCw3DcLClO9aWVMwTo2tFLeb8dS9WGf/yMOSpQnU+7ZW8ilgFQaa7KbcY8o3PkigPt
 f9Pp3nMd2NwwhZw+egPBEoEQzG0Foc81A5/w/qi0wgVEKfk88hh6PykZzPLZr7oiCovs
 Yi+5/IdfhyAdctiUn8s3yyCeOo/XbQLK9UcrQdUkffjEWUYp3JIty+XUiQilAOuG1vfs
 hPMaY1pP2CvniQ494bge8o9wMrhG/OV33raLUDtite5ssH3ylKcxJHann/VCaVw8oSjw
 xzznfzJFkF+KbxZ8iXw7T9kVgSDofdgfr717tj1EJj/Bwo/YJiPmfZkWR3qyKtac5XBe
 m1zQ==
X-Gm-Message-State: AOAM531MF//p6rQR0/G+KyreBOu5sCA+ODZEVb7xra90C3dW3GHT87Ne
 Nxr9E2Sg7CsdUXLb0PCK3GM=
X-Google-Smtp-Source: ABdhPJzDDjzAAUi9NAFLEagqfF9tfYxYHqwa4SVomD/jsQ8uklX2x3eEoiqlGF25hAtZtqbAQp/03Q==
X-Received: by 2002:a7b:c114:: with SMTP id w20mr4209545wmi.85.1628157795958; 
 Thu, 05 Aug 2021 03:03:15 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id h11sm8056850wmq.34.2021.08.05.03.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 03:03:15 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBaDa-00080r-9q; Thu, 05 Aug 2021 12:03:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1627161553.git.yann.morin.1998@free.fr>
 <c7fa0b9edd4181cea247a8f2edac3ebd0c0458af.1627161553.git.yann.morin.1998@free.fr>
Date: Thu, 05 Aug 2021 12:03:14 +0200
In-Reply-To: <c7fa0b9edd4181cea247a8f2edac3ebd0c0458af.1627161553.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 24 Jul 2021 23:19:23 +0200")
Message-ID: <87tuk4ky3h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/4] package/uclibc: add nconfig as a
 kconfig editor
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
