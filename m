Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A9CC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 11:04:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45EEA61029
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 11:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45EEA61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F47A4035E;
	Wed,  4 Aug 2021 11:04:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jpIy1TlsEqRb; Wed,  4 Aug 2021 11:04:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3642140239;
	Wed,  4 Aug 2021 11:04:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0637E1BF327
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 11:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6BA960667
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 11:04:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zew2Z6WgNSFd for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 11:04:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DAFB60650
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 11:04:53 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 k38-20020a05600c1ca6b029025af5e0f38bso3613396wms.5
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 04:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=YY9uZfOcXbojpgsKunSa4g/TCnBYVF3oIu9UxykZ2Zo=;
 b=jul+/+8eTb24tFIPqy8kMATP935EHt5tgWGifM34vqvfQydLpmEeXxPCyPjveo0J9t
 1RsI1JSU/AMnAHCg8f7UALG1UEjEgJJN7YA3b5/VLMVI4FQx6iXGa6BD1bRHaRsDtWgo
 yGXqgbQ13qD0JUD6ka0b0hyN/Ws5jIj5sO/lQ9hGGRkYzFQxd6U0UmCbLHTTImumLhQ6
 MUSp4FXu/2vWhxlvPGsjLyPEy9KLV52Xlh8qu6uAkKebufYmGxNqNxc4PxqsuzkjeUOF
 J0fcp273Kj2Cqs9dPqeGzGYz0y1xX3bdwu6RPN/4rWYh19zfUfzwDm6ajXz3z4lUjUJG
 zgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=YY9uZfOcXbojpgsKunSa4g/TCnBYVF3oIu9UxykZ2Zo=;
 b=I0h0581BwS9vT+oHwr6R9zgQBgzl9mMa8/D35xh+g1PJ8N7KFG3xfHzkyz8McTtt55
 87o/LZmj0cjroqWdEoP5euPr0i1zd10PMsD0UpDfiLM4h5sNEFlHyQUz/CtCaRARaw7a
 OkIBdJPPo6LCO58wBlXfmYOBo05w4U/+iE77Tc1c6S2f/vl7Akxu9ySYEgYW/fwncgnb
 LgIfHrzFeoNiM4aEaZen28GKW2f2s6/MvlTH8kQjoHN6aKS03CC6iPxMro4biHvd3RUd
 g4Q/IlWaMJdf5M7oR4ugSkQ4gQrIwiIByuyizMZpYd25DSqZ96cu6o+4eViU0V3qfCYK
 MmtA==
X-Gm-Message-State: AOAM531O5ZNEqDYSxVGxmCB5Sk4kK5CHlHG2TFEaLGcm8iWdDO3Gt+8G
 TErdN4kep2ix0pjUmZWs8Y4=
X-Google-Smtp-Source: ABdhPJwfayAyeLKMy26fb3kvY1ilIpQKxo/pKYox2cClyVbXVADWSW+T27RNi0ll2exX/3KI2NqmYA==
X-Received: by 2002:a05:600c:4eca:: with SMTP id
 g10mr8918387wmq.60.1628075091354; 
 Wed, 04 Aug 2021 04:04:51 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id e6sm1967847wme.6.2021.08.04.04.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 04:04:50 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBEhe-00011l-1K; Wed, 04 Aug 2021 13:04:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210731185629.746C08908B@busybox.osuosl.org>
Date: Wed, 04 Aug 2021 13:04:49 +0200
In-Reply-To: <20210731185629.746C08908B@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 31 Jul 2021 20:56:16 +0200")
Message-ID: <87mtpxtqr2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/exiv2: fix patch with stack
 protector flag
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=a6a1810711f8d634fe04ab33d24929595d227782
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > One of the files have CRLF line endings, which have been lost in the
 > process, causing build issues. Also, we update the upstream status of
 > the patch.

 > Fixes:

 >   http://autobuild.buildroot.net/results/31744f8476819c725f8c0024529515bb8059582d/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
