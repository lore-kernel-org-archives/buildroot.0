Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33259C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 23:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0EC8400E9;
	Sat,  4 Dec 2021 23:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JDk-iEO5IszP; Sat,  4 Dec 2021 23:43:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F54D401AF;
	Sat,  4 Dec 2021 23:43:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA1351BF34F
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 23:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C74A583145
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 23:43:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L03QUW0rluLu for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 23:43:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0579283139
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 23:43:12 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id t19so13774762oij.1
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 15:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GEd2YJ8f95KGoHWNjBBEztogj4zalm2ffRfnUYIqwV0=;
 b=oYDXg62RRU5Mcq9qoBnl+HZDdFkQNSdwLzAWOzVLuFaaCeUDEGlg53Ld76GMYFga6d
 sLgM078Ml85P3IEsR8NZarDPnAmiA0YNpNpgbDqnIUCVponyGkM5zQ78spFSqNqw5dt4
 9ceemCbRckG4c97DxtaRnYUa/z2SbZNikwQv5yk98VgURin57zOE4TIfbNBohSgxB1GP
 UI++KqGIxNCPSya/iNox9QMjC2dds81DmdMM6qnJ+NuICZSyzFN5r7VFk+M6TXFApRW2
 5x9qkvPpf6zjhWWT2fMBGUeiX4suscJXyb1XwJH2nyptgZABvzUOjju/FtwYUFuRNr1V
 zMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GEd2YJ8f95KGoHWNjBBEztogj4zalm2ffRfnUYIqwV0=;
 b=zOuQ3ccmx07sR5AhFeCI6rNUtpb7dojHAadSM4j2bRC9wvSBLBzYRXhZawTFRS5V58
 MBwc/zyAx485tq4fQ8/XfsK16fdJEyv/nacsLnNbQU8n8F8CjNXpTder6bYV69W4Acdm
 yzOqOi0D3sjxIh+Dq6WC3qxyE/xluGLh57bJUFrFvnEEdc3Z7mKaKI67XEJt9Y1LFvWn
 OC+6y7qv3Q+s1d2XfFoJu6EB8BmEu4NUb9CsReWKIF/ozC4RCKeU3BKnYyIxehkKAd3p
 4Qk5WnwS/fEabRD8BqkS5NckzU3XUrU0u3h0ApT6D4PfW91jWCdrxEoGJdPjvOFbWgCu
 aE7A==
X-Gm-Message-State: AOAM531kk5NO+aNBrfchbO8LBy5ywBwsPV7XYq37kXP56BxUvmB2ZDI7
 92lU9pHiZl4A9Scw+CJu1vpXfYQd+tBVwY8nQzM=
X-Google-Smtp-Source: ABdhPJyXvoCXhm0/AAEiLIoG2j46ZzntTVU3jG+NlcukfjIisWiwaEWpJm+zbsag6yZ+9B7Au8+j82OqcBwO/iwq+Hw=
X-Received: by 2002:a05:6808:118c:: with SMTP id
 j12mr16764890oil.65.1638661391859; 
 Sat, 04 Dec 2021 15:43:11 -0800 (PST)
MIME-Version: 1.0
References: <20211201135103.2302297-1-james.hilliard1@gmail.com>
 <20211201183413.2a98291c@gmx.net>
 <CADvTj4p6pRZj=iTihdDXAZf7_sT6h0i-=krpMW+OE3YX55a7rA@mail.gmail.com>
 <20211204212803.344ccdc5@windsurf>
In-Reply-To: <20211204212803.344ccdc5@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 4 Dec 2021 16:43:00 -0700
Message-ID: <CADvTj4qUzn166MNU9fOuqJQy0pDJt1bYaNHBKWb0Cv2gwv_jZA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/iwd: enable required kernel
 dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Peter Seiderer <ps.report@gmx.net>, Matt Weber <matthew.weber@collins.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Dec 4, 2021 at 1:28 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Wed, 1 Dec 2021 16:15:24 -0700
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > > > +define IWD_LINUX_CONFIG_FIXUPS
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_ASYMMETRIC_KEY_TYPE)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_AES)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_AES_NI_INTEL)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_AES_X86_64)
> > >
> > > Not sure if it is good idea to add the x86_64 specific ones unconditionally
> > > (they are marked in check_crypto() with ADD_OPTIONAL instead of ADD_MISSING)?
> >
> > Doesn't the infrastructure drop them automatically if they aren't selectable?
>
> I think the point that Peter Seiderer was trying to make is that
> CONFIG_CRYPTO_AES_NI_INTEL and CONFIG_CRYPTO_AES_X86_64 are not
> mandatory for iwd, and therefore shouldn't be forced enabled here.
>
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_CBC)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_CMAC)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_DES)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_DES3_EDE_X86_64)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_ECB)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_HMAC)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD4)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD5)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA1)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA1_SSSE3)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256_SSSE3)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA512)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA512_SSSE3)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_USER_API_HASH)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_USER_API_SKCIPHER)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_KEYS)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_KEY_DH_OPERATIONS)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_PKCS7_MESSAGE_PARSER)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_PKCS8_PRIVATE_KEY_PARSER)
> > > > +     $(call KCONFIG_ENABLE_OPT,CONFIG_X509_CERTIFICATE_PARSER)
> > > > +endef
>
> Does it strictly need *all* those options ? We don't want to be too
> aggressive in forcing kernel options. We should only force enable the
> ones that are absolutely mandatory for iwd to work. We should not force
> enable the options that *may* be used by iwd but are not needed in all
> cases.


Ok, wasn't sure since I thought they were always recommended to be enabled
if available for the arch specific optional opts, I removed the
optional opts in my v2:
https://patchwork.ozlabs.org/project/buildroot/patch/20211204234005.2051254-1-james.hilliard1@gmail.com/

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
