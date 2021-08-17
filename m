Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B18EC4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 07:23:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E93D660EFE
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 07:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E93D660EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA527401C3;
	Tue, 17 Aug 2021 07:23:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tIld3jP9XUpS; Tue, 17 Aug 2021 07:23:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F35FF401CF;
	Tue, 17 Aug 2021 07:23:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A589E1BF33E
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 07:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90F2A401C3
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 07:23:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kZegbc1c4E1o for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 07:23:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EAD4D401CF
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 07:23:25 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id bo19so30176390edb.9
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 00:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=qliKaAZshPJOR/IqfdfE/Hg3YBHQlIhFMX2yMOF16yo=;
 b=rAd2ZerB2+4s6jCIjsSIF+c/PnKgmQvZtyhO2eIkc5byvEKeJJ5hrWC6WXxL9RSiPO
 0Ci/hfRuxK2+FkVHXPplvrYWNCjfpKrLdJDa2z3V23kPrrSN6wCQy09ZbqL7/HTcDkxD
 r946aXBPkT0/Vxk6tF0rM67g6NC+g+ZKRi7ExkZu5hZhIMqenhqGtn3B0KZCXxwnUh0n
 DsC6YCGM8FGNkwGLOwCPYoW9Ggdt7DR/HgKi/9MYFehyJNzLPHZW5teTaDzje46OB2as
 nEzcOFu4dMEW8yARfVNEoHQHHt8iNhymiKZYAGh0ZLiZE2aA9SSvtBckOu59GxQvxgfl
 l8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=qliKaAZshPJOR/IqfdfE/Hg3YBHQlIhFMX2yMOF16yo=;
 b=MkGAZUQXJlT0m22b2WTdXyosf9AY78CEaTNU9mzpzyNrbMogYgOTKKbfR/SLNqmYUk
 NJPUTqrKZd11kGDY7HkGA6qKM1wWUtJlU+OMHofMDweZBXACxSjBGeYeXN8ykVlyIXDc
 CbIgK8z8dh7SPqOi9JmUg/u5VnpjAa/or0SEKBSyUM2qtmnc/6meIadCUy4s3yx6bXHZ
 XwyFIDny9I2DtVgGWMjEpVP8tJ/8jZxRK5ydCvCnKPVs1KLDNn9WcDKJJyLYmt+SUseU
 oO2iVZ8JSA4yamfoM+/lvYNggy+73wF74n5uRIyzMj4a3QwwPZRsH0xke+K8p/tF/2t+
 YBfw==
X-Gm-Message-State: AOAM530pmGP+nTBGTH5Tr1xZCbXnxxYpQlrGTyJMXm8P+AP/3XVT3dKV
 SGstSJ8up+Lw1358jXQP4+w=
X-Google-Smtp-Source: ABdhPJyRiFzQ50JfhsAoY0STS+W6exEam+Z52FFaMqFEZbkh29jrZtC2lnj2FFLE/QvH2PUzzbFVig==
X-Received: by 2002:aa7:c3d0:: with SMTP id l16mr2569996edr.122.1629185004132; 
 Tue, 17 Aug 2021 00:23:24 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 gj26sm371095ejb.83.2021.08.17.00.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 00:23:23 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mFtRT-0002ps-0A; Tue, 17 Aug 2021 09:23:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210815170031.1495825-1-fontaine.fabrice@gmail.com>
Date: Tue, 17 Aug 2021 09:23:22 +0200
In-Reply-To: <20210815170031.1495825-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 15 Aug 2021 19:00:31 +0200")
Message-ID: <87v9445yc5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libargtable2: update
 LIBARGTABLE2_VERSION
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Update LIBARGTABLE2_VERSION to reflect what is used by
 > https://release-monitoring.org

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/libargtable2/libargtable2.mk | 8 +++++---
 >  1 file changed, 5 insertions(+), 3 deletions(-)

 > diff --git a/package/libargtable2/libargtable2.mk b/package/libargtable2/libargtable2.mk
 > index 8215f552cd..d033e28f40 100644
 > --- a/package/libargtable2/libargtable2.mk
 > +++ b/package/libargtable2/libargtable2.mk
 > @@ -4,9 +4,11 @@
 >  #
 >  ################################################################################
 
 > -LIBARGTABLE2_VERSION = 13
 > -LIBARGTABLE2_SOURCE = argtable2-$(LIBARGTABLE2_VERSION).tar.gz
 > -LIBARGTABLE2_SITE = http://downloads.sourceforge.net/project/argtable/argtable/argtable-2.13
 > +LIBARGTABLE2_MAJOR_VERSION = 2
 > +LIBARGTABLE2_MINOR_VERSION = 13
 > +LIBARGTABLE2_VERSION = $(LIBARGTABLE2_MAJOR_VERSION).$(LIBARGTABLE2_MINOR_VERSION)
 > +LIBARGTABLE2_SOURCE = argtable2-$(LIBARGTABLE2_MINOR_VERSION).tar.gz

I considered changing that to
argtable$(LIBARGTABLE2_MAJOR_VERSION)-$(LIBARGTABLE2_MINOR_VERSION).tar.gz,
but as the package is already called libargtable2 I left it as is and
committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
