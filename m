Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04612C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:46:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91FDF60FE3
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91FDF60FE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 600F1606EC;
	Sun, 12 Sep 2021 19:46:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GfdimamUWe9r; Sun, 12 Sep 2021 19:46:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA706605E1;
	Sun, 12 Sep 2021 19:46:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6FB51BF409
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D674E81A92
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:46:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iRIVEmky3Xmr for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 19:46:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E679781A30
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 19:46:13 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id i6so11032680edu.1
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=iku9GQbWlqfGUFATfVT70uoyC1WH0zKMAYMLDDnfets=;
 b=YL+tOTPMNR1jCJZiEsR+xE1YtrV29evdtmQHDAJjeY6PQP36oerol9WfIjMn5wRPGq
 VLwH2hRZ3A3A0rFtUKWriloGShh3HPMe3iSNY0FmNOqQ8nbtlyBiMR3nLygfbBBeml2U
 JWyN9D9gMZfvTnpMK9xfW0cSTL1B92dJFSsZ5KRgRazqn8WNecEGcXW/NIyVfeRerxw9
 sbkpiaHtNwsdxED0dJIC+UBygkgmiGNFZcFzha6DUEc3gHhwaRiw/w2TeWN2mDCaOrwu
 1VBTF0pPXTEGXI/RMsvG+aTNzaRxgoJv+lnOK2K/VFmhFjH4aGqSS+7I+Vb1edxrI415
 fMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=iku9GQbWlqfGUFATfVT70uoyC1WH0zKMAYMLDDnfets=;
 b=a1uwwiRQxAvE/mjSJH+moC7LklOqW2QZPjOdKpzHqgcG5MkP2J1XUe+upIsou/LTPV
 Z89l4U2yDWUwBQK9LQu3D29QeS06e+dubxXAhExTTd5NsSZ2UiyjQ25aB08SjkNT3A14
 AH60CLEFhPo/buaZM2eDO5B8HxktsuRZsFqHeYM/DQiG3B2oH+JAlRntOzu9DiV2EXge
 SFDwIqwmSlltUuSUgb4RFT47/oXBpOFxvl4dVtMS7YFXlqtC5d1Q58vkeasZI/pfbc0b
 EsYvzWJZAd/AJ5584jYaeXh8tp3jw89fUwkC1A9sO1Wk2bzAv15m8v44I7cokRPekpW2
 JSVQ==
X-Gm-Message-State: AOAM532HN1r5sqGJvgEOjegsQ63v2/DYpVnU/dYsOjBbTfFv2l8nepMW
 u/FF/De2e+Do9/Wk6dnBKl6RBaM1Nng=
X-Google-Smtp-Source: ABdhPJwJeSk0PuuxpicSH+6ylyK+B9zXMAyKQTdDmiCVvZFxqPTLSjakgqW5pg7c9tJSEJpEo10/fw==
X-Received: by 2002:a05:6402:17d5:: with SMTP id
 s21mr9432242edy.377.1631475972285; 
 Sun, 12 Sep 2021 12:46:12 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 e21sm2384519ejj.4.2021.09.12.12.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 12:46:11 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mPVQZ-0005nw-3f; Sun, 12 Sep 2021 21:46:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210827220531.273104-1-fontaine.fabrice@gmail.com>
Date: Sun, 12 Sep 2021 21:46:11 +0200
In-Reply-To: <20210827220531.273104-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 28 Aug 2021 00:05:31 +0200")
Message-ID: <878s0137cs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/qemu: fix fuse-lseek on uclibc-ng and musl
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure on uclibc-ng raised since bump to
 > version 6.0.0 in commit 6b86c9335fc3ff381878156c6243454d4b688df9:

 > ../block/export/fuse.c: In function 'fuse_lseek':
 > ../block/export/fuse.c:641:19: error: 'SEEK_HOLE' undeclared (first use in this function)
 >   641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
 >       |                   ^~~~~~~~~
 > ../block/export/fuse.c:641:19: note: each undeclared identifier is
 > reported only once for each function it appears in
 > ../block/export/fuse.c:641:42: error: 'SEEK_DATA' undeclared (first
 > use in this function); did you mean 'SEEK_SET'?
 >   641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
 >       |                                          ^~~~~~~~~
 >       |                                          SEEK_SET

 > Fixes:
 >  - http://autobuild.buildroot.org/results/33c90ebf04997f4d3557cfa66abc9cf9a3076137

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Yann E. Morin):
 >  - Fix build instead of disabling fuse-lseek on uclibc-ng and musl

Committed to 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
