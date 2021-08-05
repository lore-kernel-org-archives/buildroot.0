Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A008C432BE
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:06:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6E3660F35
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6E3660F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A016B402A8;
	Thu,  5 Aug 2021 10:06:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 85iiA1YrAhDG; Thu,  5 Aug 2021 10:06:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC52240277;
	Thu,  5 Aug 2021 10:06:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0538B1BF298
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0142240441
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:06:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EGXkwDkTTJxp for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 10:06:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38D4A40435
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 10:06:34 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id b13so5783806wrs.3
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 03:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=iTTX4M94S9ByV1LxM6QitbmMIKMtN2nCTkCIEU3wk+c=;
 b=eN4VwEXiZ/EOcuIV4dBahAzqpmqRpIkd7ITofuxz9++D8zvm66duQqKLrq21mkzZJS
 g11fmFyRZAKt9Fg9khl2Vwnuj+5MvrHQF0KvWcLvNEQYXWwujct87BxkU/Vq7pHhmFqh
 FMwsRhF5/8E/Yl+Wg1FQ6nSbqAqqyLlvAYkf1lPbI8/+IiYh3waVJJiTJ8rdbhUYpaqm
 OWFQcRR/VPWnJco8q6qf9s02+s0CXNya668FpYdNZxYaFGHm8n16LCc5zKtgtTW/VEn8
 W7z7/z/GwXeGZgTgAQBf3MMwVzB+UWc8LRAMzejeZoxKok7/JNRSUeU+yGQ/SIQkJdqJ
 9yGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=iTTX4M94S9ByV1LxM6QitbmMIKMtN2nCTkCIEU3wk+c=;
 b=ThS9UU/6ZyOXB/39aTy3pYwY5oQDmudH+O6eiKeiBbE6LmqzdUyhywwfvdTg4FwTeY
 6vd3pWj/oPXitGKQiG6Bm27hcapHUJ44Vc4CDNmj+lHvE+eTMgY5xQs5ggg/2SUnhcg+
 8sgDRTqA9ZJyJ/vwy1eFmBTYH4o0nHzhKawb0WNmV1OfkYwWEwtPZt+O7yKWBbxDx0xt
 Va5iShCwwtjtRb/yzxKD5PO/kSZZEsiYcefIdcOOguHcnlnaRoDGttF+tCUbv8mW7rro
 jZXwwmfZt+/694UdkXDZmR3y0IvgEdK1X/AMZKSroVMq98ZYDHMgej0QPBMQJXocHB+i
 jkYA==
X-Gm-Message-State: AOAM532TriCfO4RQxYM44hfccfyyuGrXFXygMTiTxyeSxHbcb+1GKhgm
 Kl3Ic5yJhPexhHH1UDrPNMg5WFVPXlY=
X-Google-Smtp-Source: ABdhPJx+qqrOB6jmvxMP/uM3uM3dFcVv4qDW5P1nttgWuqXGGbQ/imDA86ppVsAVEpZFGtgwZ643IQ==
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr4404210wrd.247.1628157992464; 
 Thu, 05 Aug 2021 03:06:32 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id w13sm6843584wru.72.2021.08.05.03.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 03:06:30 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBaGj-0008Gv-No; Thu, 05 Aug 2021 12:06:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210720100828.421187-1-thomas.petazzoni@bootlin.com>
Date: Thu, 05 Aug 2021 12:06:29 +0200
In-Reply-To: <20210720100828.421187-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 20 Jul 2021 12:08:28 +0200")
Message-ID: <87pmuskxy2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python-pysftp: add missing C++
 dependency from paramiko
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
Cc: Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > python-paramiko has a dependency on C++ support, which was added in
 > commit 2d7b73cf75daedd4a198a75546308fedae7c9467 in 2016.

 > When python-pysftp was added in commit
 > 3b920487bad119abf5bfb10a237cedd3b5278c10 in 2020, this C++ dependency
 > was not propagated, even though python-pysftp selects python-paramiko.

 > This commit fixes this issue by propagating the dependency, which
 > fixes this warning:

 > WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_PARAMIKO
 >   Depends on [n]: (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_PYTHON3 [=y] && BR2_INSTALL_LIBSTDCPP [=n]
 >   Selected by [y]:
 >   - BR2_PACKAGE_PYTHON_PYSFTP [=y] && (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_PYTHON3 [=y]

 > That occurs with configuration with C++ disabled, but python-pysftp
 > enabled.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
