Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F69C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:59:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F032B6054E
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F032B6054E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE5FC80CE6;
	Sat,  4 Sep 2021 20:59:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qRNNKFbMGZqr; Sat,  4 Sep 2021 20:59:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 377EB80C75;
	Sat,  4 Sep 2021 20:59:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD21B1BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9DBB404BE
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:59:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jfz7L75KG-Hi for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:59:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08EC4404BB
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:59:15 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id e21so5133352ejz.12
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 13:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=1cwhKi0jhDpGIvGZntUhgHwrymgcZeomcEcQN2yT/e4=;
 b=Ebj97gu5VT5q/0mtylx2e1KkVoaWxgJFukvmKd5YHWkwo8uUuRdDst+6cIt740aMYW
 81oTQ0NB6R4o718gi1fwFbEBgzkGj8j5REG9Jr4zJX0e14lZB+aepqV8XT34XVE2kzLh
 lXfr5mCIW2j2vvRLEXliP+OQL3R9Vvbe7PoUUYyggZDkVSEaApLCwgk0+0kvPWrqa3zQ
 4hLIU0cz2tPb50SvUwKZktJvfUVnaK9vrsh1eaDObvjan2yJD+LE7bkK649XFgFM/XME
 nnkj0DChfH9DH8etUDsG4UgXbg5LE9TGHNUP8y+47g+eNu/0HLwmfUgDfiB61XW/7Dn2
 OGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=1cwhKi0jhDpGIvGZntUhgHwrymgcZeomcEcQN2yT/e4=;
 b=lKY/+SEBZLJd/nsPera9q2PzQ1bOmwJKzLUVb3ZoTfTB+WA4oGpN3miqMEUON+TLCf
 oUt3IT0/jysKjGiSNaJOsEsgE6b+UCsphwy0rW6xd/s9ZH/1V4OeFBBtw6s5fsbaBNNe
 3w3hEeFmgIuRY6ulM4GZfJPu4loAmCn1hCnMA3kC+tceP4M8UXXkHYP1KlpmEDEvZT6W
 CnOM2aGSrr5QMXIROXKCUcklt2G2azmCIQ+NT8SomfvFpJgeWHqjzeK+kVGXfHFAbYkm
 STEFUKQ0NtDXHVUrKNID/TKm272DYFRIwzHzpdfHP6HB4Zui7pYmgyB/T+s+PeP/8PCy
 h/kw==
X-Gm-Message-State: AOAM532y3JYwS6I6IRksqv1ziJtxa4Kyq4Z9APAlhmFNPnWQN9C6wIBy
 Kal5P7zH2ZmLGFb0sG3kiCc=
X-Google-Smtp-Source: ABdhPJyqoq/A84FrEjWyrAIuIsMnl9t9WANFJTblYBNdZJroRl14uVfQG0ewft9LGSl8PwM0B5S+cw==
X-Received: by 2002:a17:906:7fc4:: with SMTP id
 r4mr6042800ejs.75.1630789154094; 
 Sat, 04 Sep 2021 13:59:14 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 q11sm1857435edv.73.2021.09.04.13.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:59:13 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMckq-0004p4-Nh; Sat, 04 Sep 2021 22:59:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210815170031.1495825-1-fontaine.fabrice@gmail.com>
Date: Sat, 04 Sep 2021 22:59:12 +0200
In-Reply-To: <20210815170031.1495825-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 15 Aug 2021 19:00:31 +0200")
Message-ID: <87a6ksm50f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libargtable2: update
 LIBARGTABLE2_VERSION
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

 > Update LIBARGTABLE2_VERSION to reflect what is used by
 > https://release-monitoring.org

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
