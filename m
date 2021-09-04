Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E962C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:57:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E221B60EE6
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E221B60EE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BA30401B4;
	Sat,  4 Sep 2021 20:57:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YlKfjsgQPP1t; Sat,  4 Sep 2021 20:57:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0AB34015B;
	Sat,  4 Sep 2021 20:57:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F29BA1BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAFF080F7E
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8P6s9lXhOOU4 for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:57:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3158F80F7D
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:57:51 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id j13so3784157edv.13
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 13:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=6s4uDxhc7ExAy/saX0ycymWJWKcPhYXa/xsXk3frf+Y=;
 b=Vk7EBtw47B9kH078WUGNjyHtcWte3anbdd9iJyVGEnc5GKJ3yVAT7tRQ7MPTmbJa1N
 hxhNpHsW8X4rGqQIP2fjC2tk9oupnaOzuBnhL3X2HLAuOcaAZ7dkcfCAggD47uaBdBPa
 W5OBB18HuZudRPibJGUIPtefbCCkFKiNh3MC5FnUWigwjywmSuOC2emMCLnTjSo399od
 uAAymnl7i8NSyqqxBbA/KzeVNNM4oRyes+m5ZfFapoMXwjDl63Pu9OVhKahncnzrB8kP
 f+WuO2Z5UfPL7pFRjI5MRdGRaA4VRZJyLNtnA8XBf74BCA2/mN9gg86bfGvQTsyRrju2
 SmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=6s4uDxhc7ExAy/saX0ycymWJWKcPhYXa/xsXk3frf+Y=;
 b=CzFaqpcVuql68g2gwyB+i4+e5Qacr/jN8J+dLMrNya5YuPucl5HefRDalA024eXmZb
 rqBIRRHmjTH2A4QWEujZzQnLTtKa6gfoFBSMxjC3+UkOZicaXBxxxOwjACj6f6DKN0FD
 M78s+Rwjc2CsOYJkN6xFGhZqn7tPBVufaG8Klo+W0RvcQLAKNBv+4eFwrtrFgBZm3426
 9rdSHxOcWkEktl33viQfVN3/sItfytcBBMAS+/82eASWcxWP6m3C1IJesRWsWCTNCYMe
 fyjb5FR8sbqSsUFLQ/UdXhaJs1A2UnsSEcEZyN9I4QXz8QsSqMTs3aC3xLI5TcVtXRDa
 pz9Q==
X-Gm-Message-State: AOAM531ggGr+Woqn7dSSZD+aSUuspSsWl0SJfdxW5COmL7y2D+0OyegD
 zAOv/SstGMnLXeT2C6Oj5Z0=
X-Google-Smtp-Source: ABdhPJyPT8ufiIMGP76T4GUUuGFY4L/VcDjEqE0Gmu21zHtul/WtPDhZ8+sg1gXbWwzk+2/KXfFTXA==
X-Received: by 2002:a05:6402:6d1:: with SMTP id
 n17mr5619493edy.106.1630789069493; 
 Sat, 04 Sep 2021 13:57:49 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 o3sm1502682eju.123.2021.09.04.13.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:57:48 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMcjU-0004gR-71; Sat, 04 Sep 2021 22:57:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210815164405.1494069-1-fontaine.fabrice@gmail.com>
Date: Sat, 04 Sep 2021 22:57:48 +0200
In-Reply-To: <20210815164405.1494069-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 15 Aug 2021 18:44:05 +0200")
Message-ID: <87ilzgm52r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/sqlite: add SQLITE_TAR_VERSION
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > 3.35.0 is the version used by https://release-monitoring.org as well as
 > NVD NIST database so add SQLITE_TAR_VERSION and drop
 > SQLITE_CPE_ID_VERSION

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
