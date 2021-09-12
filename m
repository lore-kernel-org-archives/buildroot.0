Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A39DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:29:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AC4B60F6C
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6AC4B60F6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1331040155;
	Sun, 12 Sep 2021 19:29:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7MlF5KheeVY8; Sun, 12 Sep 2021 19:29:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4176140186;
	Sun, 12 Sep 2021 19:29:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 107001BF409
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0DEB80E56
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xxZdSn5u1Rvl for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 19:29:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F5A880E3F
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 19:29:21 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id i21so16215464ejd.2
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=kk5xdWkuMC4IJYhZb7Zj0lFSKe+T4HsLcXB+0JvvKVQ=;
 b=SqP6no26lFk5QOe5rgKWry4uiFn54Rn4fAYTsmSBueOfshOMHilG90jlor8MZrWDLq
 gqduhjMb1tIhAXsBCcrdn7HCPCnj7djvcdCp5LXHI2GsnD4mtOLzG0j6G8lhtzOmXWuM
 aerVLU5/FC5mRV/vD5e+GcRVrkAOskxVv2+CKicMvvE7JMOGDGeY6dEMm6CBwbsVfpfx
 /5E8zqW5pATd5SmQ7Lra2w4RM3lFtYLpCwm7FLCBcX2I/vjPx8orb5bMy//TMM1smCOO
 lD5c3KpmvtuBTk0Hu6sY42EDaO/HBV9kCiCrLgrbloeqV+pNuStSi4T9B/P4vv36Q+rn
 W/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=kk5xdWkuMC4IJYhZb7Zj0lFSKe+T4HsLcXB+0JvvKVQ=;
 b=NpC328E8X/QXtNKnDGc7HYGcdCOUXVun36O97epr1jnqe1m3WOTFSCKrVQPxGCWLiF
 yDROOprY0T3MA/6Ag9/3y1DrVb+VsIHTOiEpM4OXn3Qe52DX1KaRz0fvz7FyABCq8Jdl
 iBWSCEv+13904a1Kr3QX9AM0VW44upqIhQVjOVIxjG1DfLVG7PA8zAESUMuymXKnOmIM
 vvtkZk7kOmuOOwvt5UlXpEDb6Hr4Yperz9EZyDg9h15jyrNCWC5JqfAuNU0U+iN/WeR7
 BoprCQDcszalRYviDiEYgokZ6yx0NAbQor7Bp55RndmzM8KSQ3950T+H7oB4D3VtL2Is
 LwVA==
X-Gm-Message-State: AOAM530PXFalOc6Ic0xH7wXnqO+1/eX91agmgFqJ+eEGmb5sOUFhrJvq
 deBtRSljOCgvF7MNMftyTSBP4qB1/zw=
X-Google-Smtp-Source: ABdhPJyc0FdS3cKg6MHWMGfLzAwbqBPUnFdV9afCOUMTRHiv9tYxFcmpVInsteQCw2Zt9W91sSpVxw==
X-Received: by 2002:a17:906:a01:: with SMTP id
 w1mr9034393ejf.117.1631474959491; 
 Sun, 12 Sep 2021 12:29:19 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 s4sm593365eja.23.2021.09.12.12.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 12:29:19 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mPVAE-00057L-BF; Sun, 12 Sep 2021 21:29:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20210908221516.1719932-1-giulio.benetti@benettiengineering.com>
 <20210908221516.1719932-2-giulio.benetti@benettiengineering.com>
Date: Sun, 12 Sep 2021 21:29:18 +0200
In-Reply-To: <20210908221516.1719932-2-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Thu, 9 Sep 2021 00:15:16 +0200")
Message-ID: <87pmtd384x.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: add myself to harfbuzz
 package
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

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Add myself to harfbuzz package.
 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
