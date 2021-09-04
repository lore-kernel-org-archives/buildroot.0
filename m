Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F9CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 19:52:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F34F660F55
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 19:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F34F660F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3A1E40171;
	Sat,  4 Sep 2021 19:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5v5W-aabq-3M; Sat,  4 Sep 2021 19:52:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AA1540167;
	Sat,  4 Sep 2021 19:51:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D6531BF31B
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 19:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B40540167
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 19:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XX-Q9sN-sGLQ for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 19:51:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 242D1400CA
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 19:51:56 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id e21so4937445ejz.12
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 12:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=fr2g8D/SOWPTlxNb8Sgdx8I6mjGKB6QS30DmzMwZq2E=;
 b=UCdIha3bLZMptcKknn9dmwJIMJ/RWOg6A04bkfD+Q6tuyu6m4jQYcoi9AQNR+DCNEF
 yvC6Xq9/tqu2ptQ0E/Lz8t9kt6KHMcGJKRAM4ynlLoHCmiiJKnqCu1Lw0vpp92675+Qf
 NOJVhb5pkDUSY5P3N+pKWQ8wSKADjCXvqz3tPGOjw+Xj9gFluumFvtmYBYZCJ2zc3VEX
 OY37R1cZkqigcYGKP9WO0uD5g/x5JthvhtJ3FAEsZ7ic1lOz14G4cfgznALZi/yvJXnJ
 7C6R3IriB7NlOk+yHXY3qebWUOBoi5sfdhhJMAF0W0zfI1gpSvMHg4dzttwYnw33sNiL
 kXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=fr2g8D/SOWPTlxNb8Sgdx8I6mjGKB6QS30DmzMwZq2E=;
 b=VZaALYvpKB1nx80U4zDFAH40AcJUhn4j9oNYfUNkoQNfcsQPgi0Z2fRbEY4UydrP2+
 hOfV8vi9rHwEGbBp5mFNcyyCaJIQLe5+bNekV5vOe6Ogyaq16Yu+W9qKel5QwIgg+74V
 u2dksN9yNnlTNqwSkBStS9IuVpWFmHf63uWxrn4IIeLBmU9s6sMXbPRy7AAcrIm5jFRO
 iy/3Ky1Hf9Rt66WqyHhAmm8POVRHRgYNuj+WN/Cu6+P8syJAdrUH3hTd/mILCgRQ0vHl
 HguP7baKcSazBl80mHJ21OTKhgJ/FUxmxZk10NzN+lxRTZHaFFHA/VYdFxQCf9hzpYNp
 3FSA==
X-Gm-Message-State: AOAM533eAttve7QcgG0j4pouhfYZQeUSTNzlWH8s2Ll3dSL6EgLWf+yq
 xILg1UzG5Zr4t60kAa1UlCk=
X-Google-Smtp-Source: ABdhPJypA8DAsYZwZhHEDhbuWHVcS/sm7cvX5e2IjZFl6IsDW4PKGMo3MD8BOSs/MhZaSKqQpXgCYw==
X-Received: by 2002:a17:906:5855:: with SMTP id
 h21mr5609357ejs.230.1630785114184; 
 Sat, 04 Sep 2021 12:51:54 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 x9sm1788051edj.95.2021.09.04.12.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 12:51:53 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMbhg-0003FT-3Y; Sat, 04 Sep 2021 21:51:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210808203607.713828D2F3@busybox.osuosl.org>
Date: Sat, 04 Sep 2021 21:51:52 +0200
In-Reply-To: <20210808203607.713828D2F3@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 8 Aug 2021 22:35:55 +0200")
Message-ID: <87o898p19j.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/qt5/qt5base: fix libatomic
 handling to not affect host builds
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=2d991fd7b23f66e3a88c02177bf28d5587061ac8
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > qt5declarative builds qmltyperegistrar for the host as part of its build
 > process.
 > When building qt target packages (which is the case for qt5declarative),
 > -spec devices/linux-buildroot-g++ is passed to qmake in QT5_QMAKE
 > variable and this spec currently has -latomic in its LIBS.

 > This -latomic makes it to the build of the host build of
 > qmltyperegistrar which is not useful.

 > This was discovered on Fedora 34 where libatomic is not pulled with gcc
 > package, therefore was missing on the host machine.

 > This makes sure that -latomic is not added for host build of qt
 > packages.

 > Fixes: 7d286be4f9 ("package/qt5base: link with -latomic when needed")

 > Cc: Quentin Schulz <foss@0leil.net>
 > Suggested-by: Arnout Vandecappelle <arnout@mind.be>
 > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
