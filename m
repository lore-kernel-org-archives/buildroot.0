Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DB5C54E67
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 22:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B55240163;
	Fri, 15 Mar 2024 22:21:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id exwtKHD6gOFr; Fri, 15 Mar 2024 22:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E95DE402E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E95DE402E4;
	Fri, 15 Mar 2024 22:21:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DA0D1BF2BB
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 22:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 185A7822FD
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 22:21:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O4nIDfPPjWq6 for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 22:21:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=jeremypeper@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96F67822E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96F67822E9
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96F67822E9
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 22:21:48 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-7c8ccffacbcso40873539f.2
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 15:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710541307; x=1711146107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tFwcDa6wH6iI5MrJ1LegZvPxGV4DS+/JmaPPfCWks1k=;
 b=PO7RDDdEcE1wprLhWL5vpN5ub+vwsDaJ3L31njmRwQcD5e4aoPqydqnJ8X1iTuuLuC
 fVeG5t6IGEQr/PKfaECtOLZfexCnj+I7z6lWzDy7m0K70W7BwS2zkb2jdiiZd4aKicT6
 TGR3dgLnvxWIiU+28vivKFBSdK+oyWaU1h83IFuDY29QMdIbxaAxIHJwaiuEO6/nR3uN
 dt7ZG9+3ppelkRSW7UYwfKNH8I95DZeKotrDyNbYdpu+vZPEkt7jaCJlQScDzYW6CLux
 87+1ZC+cWnm3VK31aL5Ez6mha95X4ll/yH5AdXKc1/uzj4Xw6tBkkikKLi7TAgnsZxfA
 32Nw==
X-Gm-Message-State: AOJu0Yzht9hApH4ejoYdzBp/dVw/lkndpgRARmvR1Q/woMhKIA4a+cqC
 WsJe2MX1g5Ok70uSqV/jenMTdUskvbdvtIT/x+p0UkNnd5H/5H2J5HmUwzk9zSQ=
X-Google-Smtp-Source: AGHT+IESswdReUZFqMBNk9WJWMsx1DkzEkYkL0Vv0y1uNy8nI0oP6LNX2bXWsK42aDrwFwTQO80+vg==
X-Received: by 2002:a6b:751a:0:b0:7cb:d3f0:a98d with SMTP id
 l26-20020a6b751a000000b007cbd3f0a98dmr3879208ioh.7.1710541306671; 
 Fri, 15 Mar 2024 15:21:46 -0700 (PDT)
Received: from earth.localnet (97-127-36-49.mpls.qwest.net. [97.127.36.49])
 by smtp.gmail.com with ESMTPSA id
 b20-20020a02a594000000b00474f42be9f7sm962806jam.91.2024.03.15.15.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 15:21:46 -0700 (PDT)
From: "Jeremy J. Peper" <jeremy@jeremypeper.com>
To: buildroot@buildroot.org, Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 15 Mar 2024 17:21:45 -0500
Message-ID: <4976560.e9J7NaK4W3@earth>
In-Reply-To: <5f96ce54-27f0-4657-9e20-3dd6606d7fe2@mind.be>
References: <20240312193528.664465-1-jeremy@jeremypeper.com>
 <5f96ce54-27f0-4657-9e20-3dd6606d7fe2@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710541307; x=1711146107; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tFwcDa6wH6iI5MrJ1LegZvPxGV4DS+/JmaPPfCWks1k=;
 b=FMwozzoWqv2aoPUWz/6Sh1fYc5opm9A/wiSXGoPQFbh+2c1HbI3hthAhDx8O0U/sTJ
 KvoA0merrCCye+ksT/2zH4vhnbnrNcePv2nVyRlQ5Zgv6MgQ0c3+f5zBCCRJfrtFGBmo
 GLhMhrjQG1x9YTPHgf5dPIN2t+Y9K3FTiRT1C9hbLS1NCehXhofTG4TgXeUS0V5rdDX+
 ZSaESpbyTDi3Qh57o3s9uXNbG340GpDuP8Fl/fgmz7vDCj2F7VVin2NK2s3wibkj5bll
 St+0RLcZMf4ZetGZyx/NWHNtA3ZUW9X1MY9nIvm1ffS8e1WT+F5kcT87ZTVzS+Q06WQO
 4gmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jeremypeper.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FMwozzoW
Subject: Re: [Buildroot] [PATCH v2 1/3] package/targetcli-fb: bump version
 to 2.1.58
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Friday, March 15, 2024 3:31:09 PM CDT Arnout Vandecappelle wrote:
>   Hi Jeremy,
> 
> On 12/03/2024 20:35, Jeremy J. Peper wrote:
> > bump to latest version because previous version did not work with python
> > 3.11 corrected version mismatch with my first submission
> 
>   I unfortunately already pushed before I noticed: you shouldn't include
> "personal comments" or references to the patch history in the commit message
> itself - that belongs under the --- line. So it should have been:
> 
> package/targetcli-fb: bump version to 2.1.58
> 
> Bump to latest version because previous version did not work with python
> 3.11
> 
> Signed-off-by: ...
> ---
> v2: correct version mismatch

Sorry about that, I will endeavour to do that properly in the future. 

> 
>   And another thing: we've had Python 3.11 for more than a year, so this has
> been broken for quite some time. To make sure we notice in the future, it
> would be good to have a runtime test that detects the situation.
> 
>   Regards,
>   Arnout

I believe you are correct, it appears to have been broken for at least the 
past few stable releases. 

Adding the test sounds like a good idea and I'd be interested in setting that 
up at some point but I'm not sure when I'll get a chance to work through that 
learning curve. 

> > Signed-off-by: Jeremy J. Peper <jeremy@jeremypeper.com>
> > ---
> > 
> >   package/targetcli-fb/targetcli-fb.hash | 2 +-
> >   package/targetcli-fb/targetcli-fb.mk   | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/targetcli-fb/targetcli-fb.hash
> > b/package/targetcli-fb/targetcli-fb.hash index 64f68a66..1732fa99 100644
> > --- a/package/targetcli-fb/targetcli-fb.hash
> > +++ b/package/targetcli-fb/targetcli-fb.hash
> > @@ -1,3 +1,3 @@
> > 
> >   # locally computed
> > 
> > -sha256  7ae4120a54f24b13263b4b85c43952a03546f8b9fc9bd15fe87678f68245a33f 
> > targetcli-fb-2.1.54.tar.gz +sha256 
> > 605f4e4e4e7189d6a03f11a4f55e7ddb4671002d542c2f684f87dd68391dcdc2 
> > targetcli-fb-2.1.58.tar.gz> 
> >   sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320
> >    COPYING> 
> > diff --git a/package/targetcli-fb/targetcli-fb.mk
> > b/package/targetcli-fb/targetcli-fb.mk index 2d375417..8cdcc6f6 100644
> > --- a/package/targetcli-fb/targetcli-fb.mk
> > +++ b/package/targetcli-fb/targetcli-fb.mk
> > @@ -6,7 +6,7 @@
> > 
> >   # When upgrading the version, be sure to also upgrade python-rtslib-fb
> >   # and python-configshell-fb at the same time.
> > 
> > -TARGETCLI_FB_VERSION = 2.1.54
> > +TARGETCLI_FB_VERSION = 2.1.58
> > 
> >   TARGETCLI_FB_SITE = $(call
> >   github,open-iscsi,targetcli-fb,v$(TARGETCLI_FB_VERSION))
> >   TARGETCLI_FB_LICENSE = Apache-2.0
> >   TARGETCLI_FB_LICENSE_FILES = COPYING

Are there any other changes that I need to make before this is suitable to be 
committed? 

Thanks again for all your feedback and guidance.
-Jeremy




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
