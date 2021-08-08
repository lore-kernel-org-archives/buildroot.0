Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCADC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 07:41:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 756EE60FC1
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 07:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 756EE60FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4436D403BF;
	Sun,  8 Aug 2021 07:41:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zbXyZxfamhfB; Sun,  8 Aug 2021 07:41:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8559A403AC;
	Sun,  8 Aug 2021 07:41:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 502281BF5A9
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 07:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B969835CA
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 07:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Keo7RWFXfz6a for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 07:41:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 306D6835C4
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 07:41:21 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id c25so9398936ejb.3
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 00:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=ozaZetDuviihR89098x/C10GnV4/foPqZiDGrttIF9E=;
 b=jvTepr3cqh0EqeeY7fk0aerMlIGd/SJk1B9nuVJh/JXnAEZTsGJg7j2dOn6HHtj5Ma
 PDrnMNv7ZoVWsnn/PukMrNGL4EuWQldqAj3FD71OvtonXcl8Yc25StAhTWUCSLD2hzw3
 fKuUiamed8gnFhU+P8af4s1qcvnSmASLCb5os32X68KjaOB7KrIK/uZnIkB+oCw5IFeu
 /FqwPcXPG0WR38woEe0iCEyJgBTdSJl4QWBQWtV3iRQmh3k7oFZlLgm5wQPWArwED0bN
 B80s/Os/Oa4Y1U/j94P31XV57UEoYg+4BkxGLTgWWf8anjY2Iuh3lNl1xZQ2t8mPnc/Q
 gtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=ozaZetDuviihR89098x/C10GnV4/foPqZiDGrttIF9E=;
 b=dXr5oAAycFpwdRcWgf568b41J3jUFOymSM3l/SJDwh4Z0iCOxEyghhaKHSdKW2e1Sa
 ASVb4ITK4CdVyaSIZDABvGvtl1U9XdzCeh4UowjGyBcmDwEVS4kWRHGszUfnw2tC39aw
 Fh3tkuZsN3q54hIQGlIZ4BxXgkzBP07mpPuYvqfFUid/zh5rLum19Gj1rgVHEc/929Jc
 DKdPyYLjmRLR3Cme2FAyfCOt4Rr+z7S3SjwEYrQTSip2U9uVEvKJhLW9kQSG9LosUIJ/
 RBL0emCDZ4/V7c4HEDccddKFQxJnW6YkOBbFyak1l50XcA4i+4RzYqsm4kFyFZ8PXVnC
 T4Wg==
X-Gm-Message-State: AOAM530m1giZqZhisTBc6QVIjSukZMKAIgoOzovqP6hpLeQVDycsM715
 ImP0/aU4vK9Onf3ZtuU+jsY=
X-Google-Smtp-Source: ABdhPJwi9UfGnehS+lFpNbFhfIwDcZkKEIvdd5jL2QB2y56XN42Sa4bkTxRUGsyVfAxd5fS9J1NUdQ==
X-Received: by 2002:a17:907:2058:: with SMTP id
 pg24mr17627066ejb.315.1628408479179; 
 Sun, 08 Aug 2021 00:41:19 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id k21sm4663053ejj.55.2021.08.08.00.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 00:41:18 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCdQr-00070d-UZ; Sun, 08 Aug 2021 09:41:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210801215159.2435224-1-thomas.petazzoni@bootlin.com>
Date: Sun, 08 Aug 2021 09:41:17 +0200
In-Reply-To: <20210801215159.2435224-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 1 Aug 2021 23:51:58 +0200")
Message-ID: <87y29ccrj6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/libmodsecurity: fix build with
 libmaxminddb
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
Cc: Frank Vanbever <frank.vanbever@essensium.com>,
 Buildroot List <buildroot@buildroot.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Build with libmaxminddb is broken since bump to version 3.0.5 in commit
 > 464d0be380c84ac7c3f1684e49153c3868280d7e because of
 > https://github.com/SpiderLabs/ModSecurity/commit/785958f9b5089b918c7d054cbcc2fe4a3c7b3788

 > So revert this commit until upstream answer to comment to
 > https://github.com/SpiderLabs/ModSecurity/issues/2131

 > Reverting this commit requires autoreconfiguring, which itself causes
 > lots of warnings as configure.ac queries git to know the version of
 > various parts of libmodsecurity. However, it turns out that those
 > versions are only used to be displayed in the output of the configure
 > script, which is quite useless. The only one that is referenced
 > elsewhere is LIBINJECTION_VERSION, but it's in fact a different thing:
 > it is defined by others/libinjection/src/libinjection_sqli.c.

 > The only variable that was AC_SUBST() and therefore visible elsewhere
 > was MSC_GIT_VERSION, but it is not used anywhere in the code base,
 > except in the configure script itself.

 > Note that one patch is 0001 and the other 0003, because there was
 > already a 0002 patch.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/4c639fd967faa06f8ae362bacd38f3409c47267c

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
