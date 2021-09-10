Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6FD4C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 13:07:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C41F96103D
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 13:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C41F96103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69B98406A1;
	Fri, 10 Sep 2021 13:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EvWcrnGHWnnc; Fri, 10 Sep 2021 13:07:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F304406A4;
	Fri, 10 Sep 2021 13:07:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E7D31BF317
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 13:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 170A560EAA
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 13:07:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vhY9WJVbYQqi for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 13:07:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1464F60BBC
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 13:07:46 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id h9so4169093ejs.4
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 06:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=bcT2S7gcCfeemznJm3NnTVyedPpyxdc957mNJdaQqd8=;
 b=ar5IZPBFIzlTJ11KlHrTzCzdIWgrRwEKXDsIxdjZYI1VhQp4h49BvtILCS6fRBbt8Z
 JLemcMiPwDwV1zX8h2LSrKYGJKSRU+IsxvODMuJ5a6MmjSJzrqhfWeLWPGR6e+UOo8pT
 LDVcA8950Km5/CiIaVdxGaP0QIegGwOPvmaZZAMJfvBRWhVPjXiKAWPF1L4VxdLFDo7X
 mSTJqO8Zg/UXGTMRacpn6VcedvURuvn1kj7HfDhv/NpDgrb5dZW2giXs3ub76YJ6Njg0
 V/byTAs85SEFDGS8wSzhg7DLz1lVIEq//EvKYposwvtah8MKmatXhm45jMmE/UBF97ig
 cOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=bcT2S7gcCfeemznJm3NnTVyedPpyxdc957mNJdaQqd8=;
 b=hjv9PljW0CHpJw1Goom/4jHvWM1t21c86DVstxD+WtD/D2HoXygVfA159B0UedDk17
 Qt12MT/GF6KCuVAyBz4LZB4aTPC4C6EtcYexkxNcRSQe95Dtg3xLHjzHGzJZr+HLnhxe
 ccKp4FI9n41UFXQSsoTeNrINWARCq2y9I4tPxmg2UFTV6iBpfa604qHbnRVfb2Mg3vc+
 S4u+QKuIEiQF8VLfOak5iFKyxYPDv7ZYDLBj/E/aNPC9D0TnE8Wsfe5EYTNVVOueeYyh
 nYgUDUHxODVvB3sjEfILxnHC2nbycT5CpUhdvINY3t+2e7OfFNA80RYbQO4LsRTAihJW
 NVqw==
X-Gm-Message-State: AOAM530auYEzEbTquaJ283KAuGEdPR+dDYPQySCKkXzo0LCy+2cwnJf5
 qj99RdDXrR+FuBG374eHDFo=
X-Google-Smtp-Source: ABdhPJwR8r1oW5lTzEWkGAiqR2zPgxTtqErfn9k4iZRQZ4QZdVqI7RNNHw+9i7cvAE5lvjmDsUQsKA==
X-Received: by 2002:a17:906:c298:: with SMTP id
 r24mr9404232ejz.93.1631279265304; 
 Fri, 10 Sep 2021 06:07:45 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 w13sm3104794ede.24.2021.09.10.06.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 06:07:44 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOgFr-0002FD-8S; Fri, 10 Sep 2021 15:07:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210910064722.99806-1-fontaine.fabrice@gmail.com>
Date: Fri, 10 Sep 2021 15:07:43 +0200
In-Reply-To: <20210910064722.99806-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 10 Sep 2021 08:47:22 +0200")
Message-ID: <87v9388tpc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] Config.in.legacy: drop 2021.08 entry
 duplicate
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Drop 2021.08 entry duplicate added with commit
 > 531b2a10cda6bae78ecc141c9fe48f2024f71dbc

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to master and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
