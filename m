Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194FBCAC5A5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 05:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C20BB613C3;
	Thu, 25 Sep 2025 05:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W16NE3nII3BP; Thu, 25 Sep 2025 05:34:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6F22613C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6F22613C5;
	Thu, 25 Sep 2025 05:34:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 511DC12D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 05:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 431364106D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 05:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Whl3ZeweJRcl for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 05:34:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::30; helo=mail-oa1-x30.google.com;
 envelope-from=jdknight@jdknight.me; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4AA26410A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AA26410A0
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AA26410A0
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 05:34:05 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-30cce892b7dso366634fac.1
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 22:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758778444; x=1759383244;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wbJtiZ7Mjhl5pYbPdUg9M4UL0l/D9M5zgzf/p3dGMRI=;
 b=XLRn04WyAL0iDQyekS1Nisn71/aq9vp9ksUihG3dtB0iclGV2Otj/aYN3LDDO+i5tE
 fMe1mOwHo+MaB3GDrB5zMPYBCHPakKSxwK34tULLv4FSxoH00U+IWY5s1ampD+YzpIzz
 TymPEeMF6v8WXIl/wbfxP8LZ8vYIJI6cIJARtzVNoFboFJhLg6ktaGOYJkKHDiTTc2w6
 hMAqiw2fwHxpH4JNJaoB2E/JqNONAamg3HmF8XQD/McyVmNQGShLGX67rBK+InfC21mE
 bXLCkuFfeQP0srgzuS4MBbIVvm2T/QyYOsnjbjr6TZvujz9ldDU3s2KyzQoRaMTE5Qbu
 Gkxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj0M33C2pDrsjFPDDShtPlQ3qxlWDkPtTFQyIGhgCSP/q1XOvQzMpMCfpuFPc0XRKkmuTx5icyVVo=@buildroot.org
X-Gm-Message-State: AOJu0YxN01eAwkX6waoVrk7lKhLqeYy8rrA+Xxs8IYigVzN4/bqxbJUI
 Jv8w9X8CXjIHcUPvX68OFJcVWbsYKR8vVIINortSzICdHaSYRYuOJdC9D7+YqZ2dFDWHBoafZ5o
 VVkX4bnjqIfTK4v1qRDchwgTCYglA2MFKNTMJ6eudZSQvJepln3ZLhwCG33kp
X-Gm-Gg: ASbGncvLeqQipTdOtXYeAm3kIAkVeI3dWFwZznLYkpCgM54dhX7agXzmbBJ7xH+esxl
 KIbvc3mwcaQVFiFe2eyj8L+/MFBxYTblJszT0n71w4lXbRH0LvEnQ8WQ29nJc5w56X8WtIjaE2g
 jB8l68F+cNuEzul1rBbXyefv6a2EKUmUapMhr1hrJTwSnAmjdVQL6yfkk34AAtdyvtaEqmrnvBL
 Fpp
X-Google-Smtp-Source: AGHT+IF5/QEX3u8Q+946PPNY8Dgvsv/WRqWSr0nsXrSMAQmxh7ZF02/CQoPJsNT1F21EF29bzgz8LtvqZt1SKKZMVT4=
X-Received: by 2002:a05:6870:961e:b0:2ff:89c8:44f4 with SMTP id
 586e51a60fabf-35ec120529fmr916335fac.11.1758778444024; Wed, 24 Sep 2025
 22:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250319043935.7756-1-git@jdknight.me>
 <712727dd-ca6e-4646-b335-cf1aa99ac3ea@mind.be>
 <024aabe1-f252-47df-be78-34c1ceb59211@mind.be>
In-Reply-To: <024aabe1-f252-47df-be78-34c1ceb59211@mind.be>
From: James Knight <git@jdknight.me>
Date: Thu, 25 Sep 2025 01:33:53 -0400
X-Gm-Features: AS18NWDLuBlb1qC0DMvT5rkx5uTRoT07jpCuuJQ1KoY1JDO8nYbnLfakJl7Mt1g
Message-ID: <CALAjcgWJrawEH8YwL+jw3PxznqDikTVyUomM9kR41iT9KGKqWQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: James Knight <git@jdknight.me>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jdknight-me.20230601.gappssmtp.com; s=20230601; t=1758778444; x=1759383244;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wbJtiZ7Mjhl5pYbPdUg9M4UL0l/D9M5zgzf/p3dGMRI=;
 b=OLJjoinm3PRjpaEHqwwTGt6QtFhR+gSEGdnmeM03pU2bs8TeouX7UK+goGoXGJOqmZ
 qROyAxgmG2QGA5d0FzT4WqDxsrcFdegAPkc0yhqnixW5CKl+L/P6SANDXen7PWe8YYK5
 YUI/KG9s8uTEHQean9QHtfN+TcArc2vacsq7HES9SfCjfqs/eTdug10jKgdNc2/AqJmi
 WAoNo96NCooB8ro2Rix2VT+d4j76ZztonYc4ij4fxhN/XAIwWK2gYJmr9Yvg9mOGteEy
 FYiUX8ybNkkRNqeCn0NCYngtOqKwe/F49UaBLnvzsx464HkXVHTvQIhk/uYkRNm767MR
 sJxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jdknight.me
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jdknight-me.20230601.gappssmtp.com
 header.i=@jdknight-me.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=OLJjoinm
Subject: Re: [Buildroot] [PATCH 1/1] package: add support for <pkg>_SITE_ONLY
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout,

> On Tue, Mar 25, 2025 at 4:19 PM Arnout Vandecappelle wrote:
> [It] was already marked as Deferred... Did you do that?

First off, sorry for the late reply to all this.

Yes, I flagged it as deferred as the more testing performed at the
time revealed issues with the implementation. I am still planning to
revisit this again in the future when time permits (taking into
consideration the points you have previously made).

> On Tue, Mar 25, 2025 at 4:15 PM Arnout Vandecappelle wrote:
> Can you be a bit more specific about the use case? Is it intended for
non-upstream packages for which you're sure they won't be in BR2_BACKUP_SITE?

Yes.

For the Buildroot configurations I use, I typically set up the
`BR2_PRIMARY_SITE` configuration to point to a local cache node of
artifacts to improve fetch duration (and as a bonus to avoid wasting
bandwidth). However, if the cache does not have a copy of an artifact
(e.g. an updated Buildroot revision), the preference is to fall back
onto the package-defined site and then fallback onto `BR2_BACKUP_SITE`
(which is current left configured as the stock Buildroot site mirror).
At the end of a build, any newly downloaded artifacts are stored on
the local cache.

This process works great for most packages. However, there are some
cases where there can be packages defined under a br2-external path
that will never be stored on the local cache (if it's already being
stored on another local instance) and will most likely never be hosted
on Buildroot's cache mirror. So, it would be nice if there was a way
for a package to define a means to say "only ever download from the
configured site since it will never be on a primary override (cache)
or external mirrors".

> I have a few more concerns...

I agree with all the comments you made. If I recall correctly, the use
of the `_EXTRA_DOWNLOADS` feature was something I overlooked that was
not handled. If I can submit another patch by EOY, I will make
appropriate changes.

However,

> [We'll] want the automatic host-from-target inheritance in pkg-generic.mk. Cfr. _AUTORECONF in pkg-autotools.mk.

I am not sure I understand this point, but maybe I'll figure it out
the more I look into specifics of the code.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
