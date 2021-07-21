Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDEB5C6377A
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:40:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 830A46101B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 830A46101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5010C40136;
	Wed, 21 Jul 2021 20:40:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OwxXZk-P3fRm; Wed, 21 Jul 2021 20:40:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0B0B4012B;
	Wed, 21 Jul 2021 20:40:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 180BA1BF5F5
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 080AE60AD1
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:40:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zmvuYZ63Aajb for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 20:40:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7029C608E4
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 20:40:50 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id c17so2056454wmb.5
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 13:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=aEsHCnHtA6/Xg/ANjtE4luYgua3I6QEEsh4M8tfAr1Q=;
 b=enbXAqLPBDkKh2mJ3gTDPA8CFyT760DTLBpCa7cioZY0co01o+vAxXlOklMgW+d7B4
 TaTDgtVGrJFOtOG2LD31Im4i9AA+tayukdb/OndAInacfAComNx0Jf6bVR6QHTsIjUcy
 y4TBL0y30XSrqUXd+xdHrqsVwC8AmLpeFeBK74ik4PHfbaF2DmDjlsp5CK8t8YiomgG6
 qIAF/wW+Y5rbgcxvuaQL51tA7gUW5pycGIJpr8UHkMmeFoHM2Cf+dkNAS4b3WQfh2m3T
 2Y7UbWj8lQ7BtDjblpOCIH2n/A+DPKvPPzJfrdAGM6DOdTmkH+zGzGKTWykA+3U46pU2
 OG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=aEsHCnHtA6/Xg/ANjtE4luYgua3I6QEEsh4M8tfAr1Q=;
 b=FsYWXDurTLDwMt2K47wBQJ9Tr4gyzZVd1PAYiztsytp0SceUjYgosmaU1//FWiuHu+
 dEb9LCHupqBtR0GDm5c+f4WlPy/iKHuEmlay68LiAl+c86fRK/7T4WsQJcOSvXlk82O7
 XeQ3OADYGDO2Sbn1P+bEGaoJgEeAu6Yhjr1rLrp7j2jz0bFTuXhXlOrc49IN16YWMmvd
 n5IU+rxlZMq1CE9rzFtTSaZGcmTZHv9caJqDapgvBl+kZV+Xwd2sqmCIsNp2V7IK2wJC
 CgFDmeaAQPmmWMGsIv60Eyn7Pk6nOyK3eIhphcKInflglIePS8vNJvOkLl1YFErWeiUb
 w3ZA==
X-Gm-Message-State: AOAM530fd8SHNbq+9NnzXJLK1p2LG7sswg8vBLgzJqYxT/B6fMaoiSa6
 urnIXa4GUN85FpImyA7zh2tD5mhdUxN7uQ==
X-Google-Smtp-Source: ABdhPJxbo5xHNjrTNhT80Pi/Rcw/7JFKK6PB3vhRcTLjSGwqhYWvanJJF03lp1IWKgvpjmeeeOrJkw==
X-Received: by 2002:a05:600c:4a17:: with SMTP id
 c23mr5840900wmp.50.1626900048714; 
 Wed, 21 Jul 2021 13:40:48 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id g138sm27894995wmg.32.2021.07.21.13.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:40:47 -0700 (PDT)
Date: Wed, 21 Jul 2021 22:40:45 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <YPiGTY/q98eb/9rt@pevik>
References: <20210718204406.899038-1-james.hilliard1@gmail.com>
 <20210718204406.899038-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210718204406.899038-2-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v4 2/2] package/nfs-utils: Add optional GSS
 support
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi James,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Thanks!

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
