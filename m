Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0633FC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B73781FC8;
	Thu,  3 Nov 2022 21:38:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B73781FC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HeietgLiGADI; Thu,  3 Nov 2022 21:38:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B27A481FC2;
	Thu,  3 Nov 2022 21:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B27A481FC2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86FA01BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 628AA81FC2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:38:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 628AA81FC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7IkK5SDek7Gi for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:38:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2787A80DCB
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2787A80DCB
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:38:18 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 b1-20020a17090a7ac100b00213fde52d49so3016816pjl.3
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 14:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OUxx+169wEtUh1APqckL0AY5UwjNB+zu1PpBQkRvUKo=;
 b=N8kDTzjSi6fxSmIX3oUHEyqxjt/Eo+8DDHgSsSPCjakUczdwUVP2/Up59VCNPw4jau
 1CRfe0MhoOCmuPFJGNUPCRCjReBiR4dsMlwBlziJS+jQjLCdwjxE78MQVUxLQwnOWmVq
 Yz1wuZp+Z6/i3gioTRww/2P5kKOUbHVtYnzR5m0Hb4aO7Xa9gVrI8Xno0WZHpVeleZpb
 NqWQrJ9KjTsiYj5p2816QH6VwTMRJjfgmUGyoPRoFHeNDvxC2/ohsg+ETJkbin7n/Zhm
 yEoZ6DNjaI0AzJ+XPL1ou2zQsLkhzim+RvTkSZP2Aqtth82klB1njlJ5yHCN4mwplWRR
 gExQ==
X-Gm-Message-State: ACrzQf3hfwf5HeyTE7nrDMYUp/gqBkFGySeUtTlRZzpnq6a7ywKw8TVP
 xw6uRmJRWvFqoaeIMm9N39TXu3y1HuoCvRamo2w=
X-Google-Smtp-Source: AMsMyM5i4PO8DBVC+5dUz3GMWk+XkOM95hAdPGeAyIAfzWbcG/fYX4riwyEFnmGzjCySkbFDNQNuLFtrHdfeJh5umFk=
X-Received: by 2002:a17:902:e552:b0:179:e795:71c5 with SMTP id
 n18-20020a170902e55200b00179e79571c5mr31675857plf.57.1667511497446; Thu, 03
 Nov 2022 14:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221103132829.1589487-1-james.hilliard1@gmail.com>
 <20221103215812.58a4ca20@windsurf>
In-Reply-To: <20221103215812.58a4ca20@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 3 Nov 2022 17:38:05 -0400
Message-ID: <CADvTj4pnYgRWJ6RV4QOq01fiZtZy6PZE79hFtsYvGZMbhk5rjg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OUxx+169wEtUh1APqckL0AY5UwjNB+zu1PpBQkRvUKo=;
 b=A8vXc43X6ubHR/XkGi394axh7hC+FEjLAJwe+3RDJCD2vHCiHaf1BfrjMIlTT2i/5z
 QfEnwjd1N6eV+OwWOc1cLgcGXkg5Ik1mMWWhgtjOIEuPT1wTqkKi2MpevqM++Dsowq96
 fXIxRYqLwHwQ7n/P3hhWzRtiaPOl9KMmSRgAJNvZXeNr/BLHf0GNTeLSgKHSjRwQH0MT
 nNtHYr2D4Xo3IOnuwHIqCRpwwtnzvNRhkA2yku3YFaHcEreHFWZ5Etipy8QHs1ky9W5D
 vMO5735+ppRIJ+WP8au7vdd9axVvdJj2DDVJNGIgJtzQM9BEMUMYDx9XXadvdFLG1iWi
 qAJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=A8vXc43X
Subject: Re: [Buildroot] [PATCH 1/1] package/python-opcua-asyncio: bump to
 version 1.0.0
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Nov 3, 2022 at 4:58 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Thu,  3 Nov 2022 07:28:29 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/python-opcua-asyncio/python-opcua-asyncio.hash | 6 ++++--
> >  package/python-opcua-asyncio/python-opcua-asyncio.mk   | 6 +++---
> >  2 files changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.hash b/package/python-opcua-asyncio/python-opcua-asyncio.hash
> > index d8aee272de..36b16a1596 100644
> > --- a/package/python-opcua-asyncio/python-opcua-asyncio.hash
> > +++ b/package/python-opcua-asyncio/python-opcua-asyncio.hash
> > @@ -1,3 +1,5 @@
> > -# Locally computed
> > -sha256  e5fab37a92162351fe40cab43df09db8a2e9f8b8a2a8f13ed680aa6f6d687ec3  opcua-asyncio-0.8.4.tar.gz
> > +# md5, sha256 from https://pypi.org/pypi/asyncua/json
> > +md5  a52df0dc0586abd1592c97a0274d1c9d  asyncua-1.0.0.tar.gz
> > +sha256  25966e374b0c90da112a96e9dbc5cc36c123b2b60412eac6f26b04a4b0b4d91e  asyncua-1.0.0.tar.gz
>
> Are you sure this is the same thing: opcua-asyncio-0.8.4.tar.gz and
> asyncua-1.0.0.tar.gz ?

Should be:
https://github.com/FreeOpcUa/opcua-asyncio#installation

>
> > +# Locally computed sha256 checksums
> >  sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
> > diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.mk b/package/python-opcua-asyncio/python-opcua-asyncio.mk
> > index 50b581037b..54f8a1d0a0 100644
> > --- a/package/python-opcua-asyncio/python-opcua-asyncio.mk
> > +++ b/package/python-opcua-asyncio/python-opcua-asyncio.mk
> > @@ -4,9 +4,9 @@
> >  #
> >  ################################################################################
> >
> > -PYTHON_OPCUA_ASYNCIO_VERSION = 0.8.4
> > -PYTHON_OPCUA_ASYNCIO_SOURCE = opcua-asyncio-$(PYTHON_OPCUA_ASYNCIO_VERSION).tar.gz
> > -PYTHON_OPCUA_ASYNCIO_SITE = $(call github,FreeOpcUa,opcua-asyncio,$(PYTHON_OPCUA_ASYNCIO_VERSION))
> > +PYTHON_OPCUA_ASYNCIO_VERSION = 1.0.0
> > +PYTHON_OPCUA_ASYNCIO_SOURCE = asyncua-$(PYTHON_ASYNCUA_VERSION).tar.gz
>
> I don't see how this can work: this package defines
> PYTHON_OPCUA_ASYNCIO_VERSION, but you use PYTHON_ASYNCUA_VERSION. Did
> you test this? :-)

I did...but I bet I had not yet purged the scanpypi generated package which
defined that variable from my working tree before testing.

Fixed in v2:
https://patchwork.ozlabs.org/project/buildroot/patch/20221103213628.1321537-1-james.hilliard1@gmail.com/

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
