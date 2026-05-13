Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF2DCD4F24
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 08:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B62764131A;
	Wed, 13 May 2026 08:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDtA6W9fJXJI; Wed, 13 May 2026 08:23:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E25E74140C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778660632;
	bh=ca3FmpiZtptZly1GceUUt6HRn1pO3V6dGwPSJ+TeJKE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=To8TH6DmiWTRBxTHQnGHV8YGkU7P2y2Xr1jFAZGm+A8UjEUnVpnpsNkFWEGdvkdeq
	 kNbUvXl1HXXNI+e9WDH2KmqeADGswSqlJ40GWIhGdUA1hkINne9taauUXQ9sFO6qEG
	 O/dT0aA73g571hXP5R6inhEw2QYK8222F2W6Awdi3Is7cWUoLr0eqmLfZS9VWLJvM5
	 tQDpQKptqaJIIVakpnYcLhuYv48DYSIMDYXlUI0gGaaj7iPDzK4QM1uBkURvzkvG6E
	 NNtpfr2HoB/6c0pJgxLHecGoNzcpfTjLyGKK1kJ6OaMgsHJ5Xa/dx+hgTe/U73d3HF
	 nazb7dsVkFVhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E25E74140C;
	Wed, 13 May 2026 08:23:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00308223
 for <buildroot@buildroot.org>; Wed, 13 May 2026 08:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5CC540917
 for <buildroot@buildroot.org>; Wed, 13 May 2026 08:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pIzBG5mHFmAm for <buildroot@buildroot.org>;
 Wed, 13 May 2026 08:23:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C45E340913
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C45E340913
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C45E340913
 for <buildroot@buildroot.org>; Wed, 13 May 2026 08:23:49 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so72073085e9.2
 for <buildroot@buildroot.org>; Wed, 13 May 2026 01:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778660627; x=1779265427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xB+Lx1UIqvZkWlaLXoN+EdWKgCN7r4vvWb1dEawpXn8=;
 b=i6RpHKTrt9P/Ak1XF5ZeLwDXzYRNK4EjoDkGamkozri30cbtmExN0UFFZjmwoLcPHn
 OwMdf02a+gTo8UFdcjc7EppJJp8zlTPEd6iMjf/4pi7NVre71Yjj76nUjodPsU+GVSJl
 hR2nicNFZ912Rur1b6FhlIIemV6ec00gIqT1IngVYQz4V8qGjJhOBFdRlbaeFC0idTnB
 wSzR5A96fNUuh5pPP8LDz2iJ1hO9ufwp1Cv2Wuwvs4tRGq38q8dmJGOrJy6HQC19fNY4
 nH4ecMDmGnvjIkuHjl3tl2vCq9WZ0zoValn5eWvoj3S4aHPKnMIPVhLYInbmscAm/+ZY
 am8A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/+SttnIpYp5qkHvsRxMB4Wmp+miYNJo2KnDocc4gwahVvFFrcOpMFyoLTMr4438YpsJdmuqnPj1HE=@buildroot.org
X-Gm-Message-State: AOJu0YyC1oluhAKB3mIkTB0bLqmdl8SedaeW/sS6okrjgWjPp0ujZPa9
 zDpetSUecfun8SeHHY0rNtU/jpbnzWr8ZLfe3+iV3FuuhR66WAhnuiAO07aWIBCabvQ=
X-Gm-Gg: Acq92OGCq41aKG7hMvCcOiRfNQ2z/hmRL7V6s8A+JjvEjgr5KSiEZyyL6MzoiLG+yT/
 rxXr/U75tEbhrSHfQCrGXDKEfdfG2T1z2bAZL+VIe0uIbFzs8HbTvdEMYDRheVBE2G8PsxQqBEf
 Humkh5k8OkjZvnRn4Vv+Z188wv4Jjr3cH1UMFd7o1xSRIvSiEhKDSpKPK/Oc57X8SEYfBmz/l/K
 xKIUO8QF0iChqfIGJIFRLzZTBpu0ZPMrQzddB56LMUE607eBJJIG+/v0z3Pfcj5WDQuWKvW4qZB
 z1GuNsab2wRng/XLySKYlsnqKh7m+Li+46VGGiMgRiyTLQ+EvLeNpuVrHxTBS9kZ5csUsOb3I7t
 /x33SGBnTxsRDiTjviAg0Yljdkt/olayy+MGeehl3RmiO5VUdKLGLsWnT2v6yBh4WdU5dMhEui4
 sjMhDtAr8ffKRkhqhZdl352BtZkUQl5fnW+G7mIuLLOfYM
X-Received: by 2002:a05:600c:3051:b0:48f:d2fc:d025 with SMTP id
 5b1f17b1804b1-48fd2fcd11emr2370095e9.6.1778660627547; 
 Wed, 13 May 2026 01:23:47 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d27667sm48575635e9.7.2026.05.13.01.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 01:23:47 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org,
 Titouan Christophe <titouan.christophe@mind.be>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 13 May 2026 10:23:46 +0200
Message-ID: <20260513082346.159218-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <3f14a474-e0bf-4bf5-b895-d4fabbb9d1ff@bubu1.eu>
References: <3f14a474-e0bf-4bf5-b895-d4fabbb9d1ff@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778660627; x=1779265427; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xB+Lx1UIqvZkWlaLXoN+EdWKgCN7r4vvWb1dEawpXn8=;
 b=QmGcSYB/pCCFhaLWB3qJ3BbroNRSLph3wXt11Lap6+zbCRDFYtW7N+pfWYvOGAQy/j
 S+SyVJc3nhZqZyyeiQOvBlS2RR/omn4lMg/5GDG0Hq5OhBSpWg44etsp2dms1L4+V+Y+
 8b6kSg/tU+hEZvDbCh71VFTgbSKQLwnNFIi3/QFZWf+vdCWUaR4RjSeKXFcYXbZHB7K/
 mywg6v8tpZg987ZhUZoIYuSxmP0twUWS5kmj16B2EA44DwIRAn5u5RBtNePtq++Fj/Rm
 PcK7x87ZwPbMlSRl2VhdI9F4/UI85JrNMcFe7lGvQYcusNYTw9RpO5ubomtIi5uM/FMM
 +3tg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QmGcSYB/
Subject: Re: [Buildroot] [PATCH v1 2/3] package/linux-pam: security bump to
 version 1.7.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Marcus, Raphael,

In reply of:
> On 4/29/26 14:48, Marcus Hoffmann via buildroot wrote:
> > Hi Raphael,
> > > On 1/29/26 17:10, Raphael Pavlidis wrote:
> >> The build system was changed from autotools to meson.
> >>
> >> Changelog:
> >> https://github.com/linux-pam/linux-pam/releases/tag/v1.7.0
> >> https://github.com/linux-pam/linux-pam/releases/tag/v1.7.1
> >> https://github.com/linux-pam/linux-pam/releases/tag/v1.7.2
> >> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> >> ---
> > Applied to master after adding a note to the vulnerability fixed in this > bump (https://github.com/linux-pam/linux-pam/security/advisories/GHSA- > f9p8-gjr4-j9gx / CVE-2025-6020).
> As for the builroot stable branches, debian lists these three commits to be the fix[1]:
> 
> Fixed by: https://github.com/linux-pam/linux-pam/commit/475bd60c552b98c7eddb3270b0b4196847c0072e (v1.7.1)
> Fixed by: https://github.com/linux-pam/linux-pam/commit/592d84e1265d04c3104acee815a503856db503a1 (v1.7.1)
> Fixed by: https://github.com/linux-pam/linux-pam/commit/976c20079358d133514568fc7fd95c02df8b5773 (v1.7.1)
> 
> Not sure how easy they are to backport to 1.6.x though debian seems to have them for 1.4 and 1.5?
> 
> [1] https://security-tracker.debian.org/tracker/CVE-2025-6020

Thanks for the pointers.

I just sent the following backport based on the work of the OpenEmbedded community.

https://lore.kernel.org/r/<20260513082124.157977-1-thomas.perale@mind.be>

The backport is quite big, not sure if it's worth the risk. Would appreciate if
someone could give it a second look.

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
