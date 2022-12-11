Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53FAC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 410BE60BEB;
	Sun, 11 Dec 2022 20:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 410BE60BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NGaqzWRaNghv; Sun, 11 Dec 2022 20:33:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F88D60BE8;
	Sun, 11 Dec 2022 20:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F88D60BE8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C7541BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 327CD4031F
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 327CD4031F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EwGpf7hLlK8M for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:33:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 164ED402A8
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 164ED402A8
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:33:13 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id n20so23355514ejh.0
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 12:33:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6V0RPP+38z+DTvDYJFk6pQ327aOlwZFFGuiYtdDWrDA=;
 b=dLHhAwO3MHQh/YV3CLCUcM6B1O6TQ334kCDP5P4G1ItCEarxiStuvs2k67WQwlTqrM
 YT3BTrj5IMHRKogiuwoWmMc6EsTK8M3sIVP73bS4hniX2g5XeF651xJdRUOFuXlv4Xq9
 ZgNHlTPQJGhKbfDIL/Wsodft7dUm2bpXN7tJEXHP7YXr/ILCjl5OG6FrXBX39q2VFXZX
 d7ZnQHYcRmkFARh8FrSgVqafmA4x+GuG2+31QFx2c/CCy7COz6zYuiBEASg1QfZIqW8X
 o7MXpfRvOZCRGdw9/JZ+yIt4sZxjW+6O83mJNfndKB+s+5C2jpGwO0TIKrCmYLneVzMa
 a7kA==
X-Gm-Message-State: ANoB5pldNS4Bii8iBjqYHEk1z8hFLjF+IiJZxom/b3P1P1gyalUMS8HH
 96iZayUDsBf4Tu8bMqxHd1MPhe0ocwQmr7jltKA=
X-Google-Smtp-Source: AA0mqf65W5Ec7PKRYDO9iFmTdA4potoDkk4v/ZOVsUvWZ6Ryq0eWwgs+bKYDVTexAwwYPI/BJngIbA==
X-Received: by 2002:a17:906:abcd:b0:7ad:2da5:36ec with SMTP id
 kq13-20020a170906abcd00b007ad2da536ecmr12317838ejb.41.1670790791956; 
 Sun, 11 Dec 2022 12:33:11 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53]) by smtp.gmail.com with ESMTPSA id
 eq17-20020a170907291100b007a4e02e32ffsm2433668ejc.60.2022.12.11.12.33.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 12:33:11 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id ud5so23289566ejc.4
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 12:33:11 -0800 (PST)
X-Received: by 2002:a17:906:99c8:b0:7b5:ff35:6715 with SMTP id
 s8-20020a17090699c800b007b5ff356715mr59906941ejn.255.1670790790949; Sun, 11
 Dec 2022 12:33:10 -0800 (PST)
MIME-Version: 1.0
References: <20221201014538.679048-1-christian@paral.in>
 <20221211212504.4ee65e0e@windsurf>
In-Reply-To: <20221211212504.4ee65e0e@windsurf>
Date: Sun, 11 Dec 2022 12:32:59 -0800
X-Gmail-Original-Message-ID: <CA+h8R2qPG=2ghvntT=jXAp0s+0tsZANvJUvV7F1iU7ukLkh1Ng@mail.gmail.com>
Message-ID: <CA+h8R2qPG=2ghvntT=jXAp0s+0tsZANvJUvV7F1iU7ukLkh1Ng@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6V0RPP+38z+DTvDYJFk6pQ327aOlwZFFGuiYtdDWrDA=;
 b=UFCHzm7If4DLKnKhl45yrKf60bgPyfz6HBzv9bBlxQgA+sM4CebDKXNKL8xOIq6tuI
 IyYMnmpa6Opn5mY55uNFdKOZunuHEBixxYGy7x/Tr4U655l10GdZBWOpo6k/qTcZCPmF
 +YyHh6GpSZsOQUNXHzAP6UoWdwJHabHBQ+65vicIh/dBBREMKZXfb1VSyzuCOD4zd16b
 VdpIcpsVtZISeahbmyLizjzpZUa3+k9XpqLPti3uRr4R0LplYY0RNf3zHmBfXuJzEtjf
 IK0BR2VuCrmDgeWXUG3NeXqO6Qt4rM8SA48tfnKEs+8NHHlPXsWNwZ7WHsG8sDJeLyO0
 txyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=UFCHzm7I
Subject: Re: [Buildroot] [PATCH v2 1/1] package/rtl8821cu: new package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

hi Thomas,

On Sun, Dec 11, 2022 at 12:25 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> On Wed, 30 Nov 2022 17:45:38 -0800
>
> >  .../0001-makefile-cleanup-whitespace.patch    | 122 ++++++++++++++++++
> >  ...akefile-remove-Wno-date-time-warning.patch |  30 +++++
>> Did you submit these two patches "upstream" ?

The first, yes, and it's been merged:

https://github.com/morrownr/8821cu-20210118/commit/3b594e7654ef1320ff9cac6b6472fa1b17af134b

The second, no. Since removing the compiler version check for
-Wno-date-time is not something they want, and more of a Buildroot
thing, I think the patch probably will need to stay.

Shall I resubmit or can you fixup those two little things?

Thanks & best,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
