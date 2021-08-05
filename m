Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE8EC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:59:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CECF610CC
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CECF610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 201FD403A0;
	Thu,  5 Aug 2021 10:59:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ya9qBuAfPDr; Thu,  5 Aug 2021 10:59:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE1184029F;
	Thu,  5 Aug 2021 10:59:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4C501BF852
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D1C983837
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:59:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id emv7T5HX0GMI for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 10:59:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39C16832D0
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 10:59:03 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id x17so3053508wmc.5
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 03:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=Yd6Jh5ABfsz4Q8wFwLtqETAXQm7X22HXxTEWPookt+4=;
 b=lMz26dr/U7byEQl8bFzjoHN3ShZStxngKzQYBSTo9xRZaVyX6cmUwxnijLE+8M78tJ
 Hm4hqY7pFYZ4r/gw+pMuCEmiGnT7/I6Cnon8SYTiEO86MJhMMHODN4Gzh1R7dGxaMkEA
 3i3qMMXmJGP0/ZCUVnA0m5Jt7fZGucOFU6OTnMLWjwkuPIxvNZuwbftd2NS+Ew+52NpI
 AdQaCaxr8KbDUBi3QZcAssJt/gr2LjMzcxhPY3vU2zG1L6iKp+edNFadV6JQqypcRYWJ
 PMcgPErD/d9JUXR1iYEZbr4fRjRmDNdn0C0W7X51Yw4/DBajtCdz7X07SQyeTBFI6jIa
 nRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=Yd6Jh5ABfsz4Q8wFwLtqETAXQm7X22HXxTEWPookt+4=;
 b=FEgvult1hy2KjSPNxQGzWnhO39SQA/8pu2o7N1nwhtjyi9GUuOs9AJ13wz3GrsVrYy
 mHdMadJfIsKjVQKhBXM9qHexTP0Er6gCdjI7TARID+sOHY90ZWAHpDufmzRZzxvJV6YU
 UOLYbv24I7Q+R038zgmdlwB/Qn3SH6mQeZCsK9H6KxEvoM0VAn9lmMyM2mvAxZntkqRg
 C+iAs7S2/KiXZ7QWENNYhuTPQ+37/eYj4EZjm23RB3lgGRHodThsWru4qfMXjpen+m8V
 2V6l42gvFG1mHqOF2aQHQcz7CS0tp72iXdpxamwQUy/0v/Ma2N9t7Goo2Oal/0libQTf
 SNwg==
X-Gm-Message-State: AOAM5319AX7Ub2yxl7hSeR7J13ihI+O9d4YNNl9M7on6lg6RYxYPK0Fb
 dVUZGpkVTvDW0Ch3sJGeVD0=
X-Google-Smtp-Source: ABdhPJzLI2OfKhAryrHiHkuHhu4cGOLxqf9Vk7ZjRvPc2S55Xq6WhIpB/N3HFPVLXb7+uWw4jb8w9g==
X-Received: by 2002:a1c:6a03:: with SMTP id f3mr14602239wmc.135.1628161141446; 
 Thu, 05 Aug 2021 03:59:01 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id z3sm8909049wmf.6.2021.08.05.03.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 03:59:00 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBb5Y-0000eL-1Y; Thu, 05 Aug 2021 12:59:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210725131350.CF4CB88EDB@busybox.osuosl.org>
Date: Thu, 05 Aug 2021 12:58:59 +0200
In-Reply-To: <20210725131350.CF4CB88EDB@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 25 Jul 2021 15:48:13 +0200")
Message-ID: <87h7g4kvik.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] Config.in: add
 BR2_PIC_PIE_ARCH_SUPPORTS hidden option
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=70dd4bd156bac2bde07751dc3c4d5da9b14d7d7c
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The nios2 architecture is already excluded from PIC/PIE due to issues,
 > and we're going to also exclude Microblaze, so let's introduce a
 > BR2_PIC_PIE_ARCH_SUPPORTS hidden boolean to facilitate adding this new
 > architecture exclusion.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
