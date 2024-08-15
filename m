Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C336AC3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 11:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36EC160A7B;
	Thu, 15 Aug 2024 11:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L65-VJWXHLMJ; Thu, 15 Aug 2024 11:19:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AEA36066C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AEA36066C;
	Thu, 15 Aug 2024 11:19:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6851B1BF325
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 11:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54ACC81E75
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 11:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5HMcxO9MxjCf for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 11:19:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3FC8780E25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FC8780E25
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FC8780E25
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 11:19:22 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e0875f1e9edso800608276.1
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 04:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723720761; x=1724325561;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q2dD5/H02Rhgcz7s5jdcFFLCIJYF8xTSD8lRsGYXDJE=;
 b=Jt7i8LJ3YEk2FR5k8RCF+zP20ijvEN7G+58Vv1ZMyMW2gOOoA05gZTsl61G7pabq9J
 7csD1/crLbUvVuVak7fDkNfrldu1fGTIwpvdC3bwY94Q9wzAFD56l2ymS9UR2nsXo0Hv
 NwwyD2wu4au5eJOlG0Vv6VNXS5+odBaN6BTbd+SucregWrhn10Vxq7GkwxPELN0h020I
 lDbdnhR15n4ofRijGXzWrfgUvRnqc8V1NUjZcQrtTXAoQp/jupxykoqlVEdo+1qEu6UJ
 BiOBUbRmwU0H1AGL/HtFL2wxm0vIEVYGtL2A2zl3cjr0opQZGkgAKw6eV0r6gEOxtpSZ
 odQQ==
X-Gm-Message-State: AOJu0YxpOCj/K0ljXlpda55ONHOIpWRQzC8joFQhuwYcZfmUbW1GQQJR
 GESA4LdyjswLKtT2u4ajbVwA8b0fvqe5+DxjBXhTzXnTeK3FqtLz9I2lMDV0UbJCMtHwnVFzfeu
 zhW2PAgOJ7Emo2G+WLTqmJ8xv77s=
X-Google-Smtp-Source: AGHT+IESxeimkCUic5vR72kWMnH8UpjTcdY95I4QbQJ9HlV595/Mf+nGjfAMQBqFSO8MKpAawS0YQ2+6/hhFVyG+tgk=
X-Received: by 2002:a05:6902:1ac8:b0:e0b:e38d:b396 with SMTP id
 3f1490d57ef6-e1155abc3d7mr6506902276.21.1723720760965; Thu, 15 Aug 2024
 04:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240815062841.1051418-1-roykollensvendsen@gmail.com>
 <20240815094738.266ac1f9@windsurf>
In-Reply-To: <20240815094738.266ac1f9@windsurf>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Thu, 15 Aug 2024 13:19:08 +0200
Message-ID: <CA+R_deriCwom9cj5cYO3R4P9NXXJrHdCvYCTqzkH1UAAOCwdOA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723720761; x=1724325561; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q2dD5/H02Rhgcz7s5jdcFFLCIJYF8xTSD8lRsGYXDJE=;
 b=Kfosk+o2ZR5+Ii0CwT+jHlesD1z/ZZjiwOMWJTtvXpdnlPsWGptx5cVvvwI44JlUJz
 CUYnVoHeX0FziJ511ZtYBxrjcVZzeRMkq2cMRh6Sfs6tBq+yKCOFReaLKROqNH8NIt7k
 um4SybPBDmKpyDMbHRObmrjBT1LvNAZcqQTmbhIphlBV5jB4JEZ7t3COyIWAkSP907F1
 kmbiK/iY4XpDFYliLBOwd9+gAm889WVbF4TJR7etbp8+yrgi9IAterkXaTaFCI+1J7zn
 JzZUzdIsVI8vI3pEeE2u3lrnkuYrhkvh+US1QvtlqvPQis97phcYfYm+VJpz8tk4EEcE
 3mjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Kfosk+o2
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6base: fix CVE-2024-39936
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CVE-2024-36048-qtnetworkauth-6.7.diff:
  - Does not apply since we have not yet added a package for the
qtnetworkauth module.

CVE-2024-33861-qtbase-6.7.diff:
  - It is already in 6.7.2:
    $ git branch --contains 7c4e1357e49baebdd2d20710fccb5604cbb36c0d
      6.7.1
      6.7.2

  - As Jesse pointed out earlier the bugzilla report dos not mention 6.4.x:
    https://bugzilla.suse.com/show_bug.cgi?id=1223917

    The patch applies without warnings/errors to 6.4.3 though.

Regards,
Roy

tor. 15. aug. 2024 kl. 09:47 skrev Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Roy,
>
> On Thu, 15 Aug 2024 08:28:39 +0200
> Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
>
> > Fixes:
> > https://security-tracker.debian.org/tracker/CVE-2024-39936
> >
> > Got patch from:
> > https://download.qt.io/official_releases/qt/6.7/CVE-2024-39936-qtbase-6.7.patch
> >
> > Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
>
> Thanks for the fix, but I actually have a request, see below.
>
> > diff --git a/package/qt6/qt6base/0001-fix-CVE-2024-39936.patch b/package/qt6/qt6base/0001-fix-CVE-2024-39936.patch
> > new file mode 100644
> > index 0000000000..1d11eb9fd9
> > --- /dev/null
> > +++ b/package/qt6/qt6base/0001-fix-CVE-2024-39936.patch
> > @@ -0,0 +1,155 @@
> > +From 627617b002a34a9a0a63bcd9529c655e93d6246e Mon Sep 17 00:00:00 2001
> > +From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
>
> The patch is not from you. I know the patch
> at https://download.qt.io/official_releases/qt/6.7/CVE-2024-39936-qtbase-6.7.patch
> does not have any author information (which is kind of crappy from the
> Qt people), but it would be really really better to use the real
> upstream patch. So instead, could you cherry
> pick https://github.com/qt/qtbase/commit/2b1e36e183ce75c224305c7a94457b92f7a5cf58,
> adding the Upstream: link and your Signed-off-by ?
>
> Another question: in https://download.qt.io/official_releases/qt/6.7/,
> I see two other patches for CVEs. Do we want them?
>
> Thanks!
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
