Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60807C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:15:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BDD560E96
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BDD560E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5603400AE;
	Sun,  8 Aug 2021 19:15:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cuvNuvqH0S9q; Sun,  8 Aug 2021 19:15:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E004400FF;
	Sun,  8 Aug 2021 19:15:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17D6D1BF3C3
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11FBD40284
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:15:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wevCPLcNAEVX for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:15:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36EE04022A
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:15:47 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so12951888wms.2
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 12:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=ow4Wn1f+/C9Wga5OHVWoUB7E5Jm16n1HFF11N4Wk+RQ=;
 b=dImHpjnxGkvi33fLlAABsi4+emcn6JLTy2c6OMGcVedgb9LsJ+z9Is4c4wODkHXpH7
 N+KE439H3/gHaLEiF1+jBo1JouA2DE4tN2F3j94+tsKWEgFMOnq3LUP0SxD/MGscpiKU
 PmccAc3t764GIcBgsBhm4U3ENbZHD+Qpw6y2Z0SXDris38xZdYbUIT1/GT5cDclpmRdF
 zSlT97qUU8zTu7OfY99p4M9I/TMgUU+xB2gOlPKowevBBZlK9Ht+ZFGqpyj0mPN2rNrt
 9wwt/mtwjk9xKo0/55P6kR26XykHUP1derOmPmRq9dTPRFx4adPVdm2VffMzaeg2ctT4
 PATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=ow4Wn1f+/C9Wga5OHVWoUB7E5Jm16n1HFF11N4Wk+RQ=;
 b=MRzXhYKtvVyXDVqhyl8tEZmH08hpdUjU7nHmgz4swx2e9EeUI3Kwr8DDh7TdRdLat8
 qaAItF27dinGY2mu2cVnvDWOf2ec8R1ObchUBiY1/Skdcjm2k5Bz13tKK5YhjyLt9BH4
 fX4ZspACFtuFc8fHWO68EmeC+vkdcF8yKkuSbUSIbevZ9ep9aMDW3/61glIXzyUPXOau
 ctRX51C1pXJYqA0PwNX+NLzkNvOsngOlxqONYjJS1bDQe/ZSif5Q6g/kbPBe+yV632Of
 7vrtxhLahw3h5ut0EfZ+JDAU5264mAghZsgDx15CSnJ0zeP8+GJX6hXGfwHXSO5i5k7C
 nymw==
X-Gm-Message-State: AOAM531/Bz0joWZrp6HkdO9xtk33jualHhvbIjt82Bp3P252YupgpFcd
 XqY8X8rtjAoXiIavNyGongk=
X-Google-Smtp-Source: ABdhPJzBRMtunW9jetVwUyPVnaEYjIVI7lnNNogmWbcL92enSYN7d8gj4JN3SDv5dZ67bSsjz4LKdA==
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr13005608wmp.52.1628450145278; 
 Sun, 08 Aug 2021 12:15:45 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id a191sm14866061wme.15.2021.08.08.12.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 12:15:44 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCoGu-0003Sl-0u; Sun, 08 Aug 2021 21:15:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210805212540.3032007-1-fontaine.fabrice@gmail.com>
 <20210805234836.77fde375@windsurf>
Date: Sun, 08 Aug 2021 21:15:43 +0200
In-Reply-To: <20210805234836.77fde375@windsurf> (Thomas Petazzoni's message of
 "Thu, 5 Aug 2021 23:48:36 +0200")
Message-ID: <87tujzagtc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libesmtp: security bump to
 version 1.1.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Thu,  5 Aug 2021 23:25:40 +0200
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> After more than a decade, libESMTP version 1.0.6 is superceded. Despite
 >> proving robust a little bitrot has occurred, especially regarding
 >> OpenSSL support. The original application data APIs are prone to memory
 >> leaks and are deprecated in favour of safer replacements. Version 1.1
 >> updates libESMTP without breaking API and ABI compatibility and
 >> provides a basis for future development.
 >> 
 >> In addition to updates to the codebase, documentation is modernised and
 >> is more comprehensive.
 >> 
 >> All libESMTP users are encouraged to upgrade from version 1.0.6.
 >> 
 >> - Update license files
 >> - Update indentation in hash file (two spaces)
 >> - Switch to meson-package
 >> - Handle threads and tls meson options
 >> - libesmtp-config has been dropped:
 >> https://github.com/libesmtp/libESMTP/issues/8
 >> - Fix CVE-2019-19977: libESMTP through 1.0.6 mishandles domain copying
 >> into a fixed-size buffer in ntlm_build_type_2 in ntlm/ntlmstruct.c, as
 >> demonstrated by a stack-based buffer over-read.
 >> 
 >> https://github.com/libesmtp/libESMTP/releases/tag/v1.1.0
 >> https://libesmtp.github.io/changes-since-v1.0.6.html
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> package/libesmtp/Config.in     |  1 +
 >> package/libesmtp/libesmtp.hash |  6 +++---
 >> package/libesmtp/libesmtp.mk   | 24 +++++++++++++++++-------
 >> 3 files changed, 21 insertions(+), 10 deletions(-)

 > Wow, it's a massive bump for a security bump. So, I've applied to
 > master, but it's a bit risky. Could you make sure that collectd and
 > syslog-ng continue to build fine after this bump ?

Yes, I also don't really like it for the stable branches :/

I think I will wait a bit before backporting.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
