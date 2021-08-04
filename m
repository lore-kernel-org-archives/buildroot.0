Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49453C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 11:02:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9DE161029
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 11:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9DE161029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 694F383C55;
	Wed,  4 Aug 2021 11:02:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n99AQMhE3CnW; Wed,  4 Aug 2021 11:02:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4C7583C42;
	Wed,  4 Aug 2021 11:02:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 859A31BF418
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 11:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C00F606DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 11:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RvB9IbGCHlny for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 11:02:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25EC760650
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 11:02:36 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 l11-20020a7bcf0b0000b0290253545c2997so1198689wmg.4
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 04:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=9cLZw2RX5FQt/a0NsgCv9gTEclmWNo83nTLfePUTiZ0=;
 b=V2izFnugUAdZq5mnIGhdb8/PAM7MCRrIbUrhorcCpi6G5ziG8HCPIQMNWKXhoQZ7Ri
 5eYPM7hb1JE/gU5NqURxziAiG4Qidx1g7E42u0ccG+vKrYcerxykcO9qScyru4m19M4w
 2M4JwDC4aInAIWqhMKjbo+u2vmeZc6ObDnZFvNfTtcq1NoLwErucD/uQGPFKorSM8X6F
 bRarrfCSr8EHKhdBxAg3tSWati8u5x3eiSMM41xhujJBAWe9TpA6bh+lQir8eZlCQkTF
 zWvrbrmDARutt7OTnXWJFVQUF+ycSqbtV+yf1Uwox+O+J076gI1UQLo/X3MSnhaDsVgl
 uWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=9cLZw2RX5FQt/a0NsgCv9gTEclmWNo83nTLfePUTiZ0=;
 b=aTwsNrIsijNx0AGrtYMI6g5Mr4nr7eAR3l9A0vP8jLxymx2HMNTETEHnku7Cc1pYH3
 UKGCagGsrNcQHyU86X6WDAXAaeu6qEFhYR6TmQXYKErMjgjcCk4DxTUyXhzFisOFvIYc
 w0bKD/iq8vF+C28Ck1+ys/LGSAiJA3W2f19/rq9UudepHMlOF53xX5rXnSYDULYPT2YK
 l7p5ZU08LHaZby2gpq4R8n7QOJOT7Mt08fXWR4Pjm6pz6EyaYoGDeHaA+RVGSrM5bNBf
 sajf43JnSCNaR+mg7CVauwaLrbv8Z1RhbqKkPVIyjH3kVVbjak0TrnihvEmEh+DWz5O9
 oBAA==
X-Gm-Message-State: AOAM530UIifX/7C0js1uDyN1k3EpDo5mINmAwW2sHaMN/7Bq1HAD5aTf
 JBlTgfxOMD5A82LxOwv/Z1Q=
X-Google-Smtp-Source: ABdhPJyKYAf2+VnwhTJ9Y7HAKYw1DdkqCG6SlXAmoXjqZd9VNvQj/3ThQ/J4zUrAPlcKVfNkOWm4Rw==
X-Received: by 2002:a1c:2314:: with SMTP id j20mr9293177wmj.30.1628074954198; 
 Wed, 04 Aug 2021 04:02:34 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id n186sm6441787wme.40.2021.08.04.04.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 04:02:32 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBEfP-0000tx-Jr; Wed, 04 Aug 2021 13:02:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Mirza Kapetanovic <mirza.kapetanovic@gmail.com>
References: <20210625091900.811972-1-mirza.kapetanovic@gmail.com>
 <20210705121933.1055057-1-mirza.kapetanovic@gmail.com>
Date: Wed, 04 Aug 2021 13:02:31 +0200
In-Reply-To: <20210705121933.1055057-1-mirza.kapetanovic@gmail.com> (Mirza
 Kapetanovic's message of "Mon, 5 Jul 2021 14:19:33 +0200")
Message-ID: <87r1f9tquw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: concat files
 before passing to env image tool
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Mirza" == Mirza Kapetanovic <mirza.kapetanovic@gmail.com> writes:

 > Fix BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE so that files are actually concatenated
 > as described in the help text.

 > Signed-off-by: Mirza Kapetanovic <mirza.kapetanovic@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
