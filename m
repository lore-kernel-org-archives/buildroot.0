Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51CAC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 19:18:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0604761042
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 19:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0604761042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8C694029C;
	Sat,  7 Aug 2021 19:18:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xd5XEd0WRMyF; Sat,  7 Aug 2021 19:18:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A211640214;
	Sat,  7 Aug 2021 19:18:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4B011BF3AB
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 19:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C916640214
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 19:18:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ile69hifFhCu for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 19:18:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66E6740202
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 19:18:35 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id w5so1893729ejq.2
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 12:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=FNG9XekJMdmfwe2uNgfcsn0dfGlK/7xiD005GP0Ry/I=;
 b=LBZmDBtRrwlZuKNkSfuPbKdx4CV+S2P2hXajw47eTvJk6zXxKuoMenaRcHuEOa+QEu
 /vgckJfUeTexSyyrTevCnkWrc1cwMpmKZuQHK4oyw5pdO0QvrN8BMdygXef5Z/oUZsPW
 x4tvDYYcsAnIiHB1NC4QZqiDDuAqYpz2S0VLtB2HGQYE8OUwGmKqD8xEfIfq0bG4A1QM
 WHkWsbSqQgjDlUThrYaDrbPZ6KDMjgT25h4McUSsVnwN1CGLxEnRJJae8l+i4XhbSMXu
 KoTUVyp5k0lNvWTf5ed3WyUiW1aTJm4lOWRwYNI+YXqUpUG9lSqq0GbDVYQp1fpMy0ui
 ViMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=FNG9XekJMdmfwe2uNgfcsn0dfGlK/7xiD005GP0Ry/I=;
 b=kLB6LirbDPHXePscFB7EkrFp/Bj3CcWo3AbpC7poB4sLzjXSZAdcSwnNELLbWRMDPY
 tDXBu2AV3aqaFIpauW87C20LdKwi3n8Uzcs5qI9vAXsHO5YBsM5BBpZwzSUlkOOaONDA
 HsASN/SklDKUbwf8Tp051h9iPKE3Gh5ilFXz+MDfDAOiiAOq8UBEEGsqknMSAQ+fJYQ5
 unjlJmCyOxy51qE8ZfUh/y0dWRAp9isS5S+qASUNn+v17Xdip4ux8ygBjpJMK6C7V7ac
 n8yE7/qSfi0XFnoq/HNVYvM3EmWwBrR+/XNRElvtEnmzFjgpBcrzxR+9CsVtdbeE00FY
 +qnA==
X-Gm-Message-State: AOAM533zxFu6vnl+AIoNxEYUWHFUQIw3UTgehVUv3Mk4x9VpedkzE0lu
 1xJcgIHyQsXPAe+DOOpB243sLgLLE+OwWg==
X-Google-Smtp-Source: ABdhPJyhLGLcGkvjeI/hrMGgKDbKk9xeDYw1SVJSLjA4lHdUgPqGELiwFPCMN6D0th3Zg1rJx/XMtQ==
X-Received: by 2002:a17:906:81c8:: with SMTP id
 e8mr2378979ejx.401.1628363913565; 
 Sat, 07 Aug 2021 12:18:33 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id v8sm4087393ejy.79.2021.08.07.12.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 12:18:32 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCRq3-0005Lz-CR; Sat, 07 Aug 2021 21:18:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210801121336.3054884-1-fontaine.fabrice@gmail.com>
Date: Sat, 07 Aug 2021 21:18:31 +0200
In-Reply-To: <20210801121336.3054884-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 1 Aug 2021 14:13:36 +0200")
Message-ID: <87h7g1dpx4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libloki: fix build with gcc 11
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
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with gcc 11:
 > In file included from ../include/loki/SmartPtr.h:33,
 >                  from SmartPtr.cpp:20:
 > ../include/loki/SmallObj.h: At global scope:
 > ../include/loki/SmallObj.h:462:57: error: ISO C++17 does not allow dynamic exception specifications
 >   462 |         static void * operator new ( std::size_t size ) throw ( std::bad_alloc )
 >       |

 > Fixes:
 >  - http://autobuild.buildroot.org/results/768727160beaca5df3ef18be29cfbaa3ced67ad5

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
