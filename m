Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003CFC982E6
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 18:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94B7460762;
	Mon, 21 Sep 2026 18:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f5WicKezkgiY; Mon, 21 Sep 2026 18:09:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A40676073E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790014184;
	b=JbYNqXhVngSo4lsVYfH0wN7FycZAxzAZW3+N2MidwkjMSnfWec0YRusqKyHN4pA/ODwe
	 yLGykQXW7wto+f+DY285f2Sm8JB5a+PpjF1ddpJAQ7aq/SiuujkEdbEX/R2IQB5OmxQTt
	 EMfZxjQ2uAhzqeb1WYKH8viMoOTEa22D32h+JEPwzUbjxcyADf/4/QT/s/ao3ArSKaKH1
	 k5750pqKeYI79UoUVixTkRj/diRH9chqZTH2cAg3m06zD69Aw7ZD5EjUPUy9ijX9dqD7p
	 AsSmphQmuK0vRcgipLS/SAGnwKelq3CORvsF1Myu9P+LkkTA2xXpLbtR/auG8Td9nLA==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790014184;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:To:Cc:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=a2GEuDLCQ+WhCIvTaS7yw9F6+ngGzOLbECZQENg5EPo=;
	b=od/n9BvAquwTLuUpnPYtIJbLUrdU9sGo6B3KYIvWMM7U5MEfmYN7xG1OW6ZSC4yOXART
	 84g3vr5Idmu7YWiNTOKaAzBPYpL6P2KEqpfKTMkono23gauMdkzsFSNQ2cH+p+IGPOAtU
	 YLryumIuB23AGPII0fsBe5g36IwzjqC4SfE/oYGwBr5g872cxyuWSP8KcXjdIiVxS5p/m
	 mGwRVDzNZcNOpb5tsGvZ2jjJ4RklLYFOUvJPJM9XKkKHNZa9YriuPa/gN27KXgiV198Ap
	 zSh+//jrnopCSGkEdNIJuQ3e/4EAWD+IEjUbzXt5H8HfcpODQY7/lD3PQKrFoDU74Ng==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790014184;
	bh=a2GEuDLCQ+WhCIvTaS7yw9F6+ngGzOLbECZQENg5EPo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f/BbQpEK46hcCkdWpBlglCdXwdxJTaiOyGqDYJJCNG84wDvd/glIdXIfi26oTKAFY
	 cP9pQt5nsd4LUU0x/52Zc27dX36bhIzGJEVIjWBpAF3GWJGZbq9JZsQGwQFOyG7zE9
	 Z1RgMM7LbGBpZFPiGwSLR59hFGDvzmFuJhhhJvBmMVX06msGbUVxwlyFBAhxIstIe6
	 bQskE0aaW52u0m/BJrZkYnQ0MuqRE7qdhSl8ITIYtUb+yOjPZoSjMZkaS3H9mEsOKt
	 1TYtfsdEfI/l69qAOhRbz6dU9Cl5H8UzuG+N/ufrIBhIPs2fz2jcKYj8cYjwtqBPOG
	 XPVw1/j21MBMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A40676073E;
	Mon, 21 Sep 2026 18:09:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 731FA3A9
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 18:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 593D540A70
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 18:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GMwGjkZkBLij for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 18:09:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2DF9440810
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip=74.125.226.235
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790014181;
 b=ZVrBJi8hGKx1gOevdb0M0BMOYdZheoXN6z5TFFh6MJZkLlDpQN6vErs692L3V4M9tIFF
 B2L+NHUFf6yEaQzkHpI4IfIiAe3pX+5NmFB493jG/I4EQ2wwAbRcV1nPmWaombeHmYx16
 tMF3HZEjCRwzuA/yQXYThz7pH7Mr5WgoAPnMNgx3OVi48EugkdE4k7itR0t7Kscyhrvt8
 A3i2l/l3YCn+AXZBmZK4H1P0K4Ju+EPN1T1fc8Vqfx0swZs4PLBIuE5v7iw9ef8osaLnF
 2fQO6dJwNkUNQTsux/Ou8VSzdpuGdWM/2udE0lNazmJFOrn8hUYiQL6WJu2TmjVG2fw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790014181;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
 bh=NACYNv6Hwkfl+0fqqq+08Yrxlg9w4xhQclj3nSgqlAY=;
 b=KzPjDLRHqS6U1ZCCoiIxTRjf/6dvchEZbWl8AFi3xWVwcq4fKq2+wWKVz3apeZh3mWhH
 3mTnxxYRo/O2c1xtrKZT//baal0weAkBwxjfWPdeOVp42lfLUOMiweU7tLHzY6/B0OTEn
 OY/tJPmUBRw/NQfuujWyx6fH39HLEmH3rw0et0xIAIjj0sFWkgA0HqQTYc2Cx4ik/6HbM
 kVmnFS/qlg59591SCkLG9cvfASNb/XLp8+2DI9gimx3sZl1iV1Xm2mzmRkwG/t5o//0H0
 7CUY80Hte0K+bct7UMXBMUNE/+x6iv4dZb2l9Px0jlBGqIAu0Y2BBuFfm0RDV6SFGMQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=oZzAUEdq; 
 arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.226.235
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=74.125.226.235;
 helo=mail-ua2-f43.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=oZzAUEdq
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com
 [74.125.226.235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2DF9440810
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 18:09:40 +0000 (UTC)
Received: by mail-ua2-f43.google.com with SMTP id
 a1e0cc1a2514c-98334af2ca0so874521241.3
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 11:09:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790014159; cv=none;
 d=google.com; s=arc-20260327;
 b=TRBFmNOdYVzfP9hipk8bcKUE//1XKB/MeKYsX1HJxmoUfCUzfE4+T1gseGUv7vuuRa
 as8Fiu7Wvks1o4MYLB4IYpe/ekftiCJ+TX5pkGzvsFZQTbx3u7y65lzep/Ncwytzr4lx
 zluXlxrx4kB9NAxfY+RD2FtQcVJcToF6PwwfhoIw3VsnwXmnZKFWpXB0XuiDuRtmlMm0
 uOi+/wPAxJ0O/NwVH9+AMyy77MycL1ZBItXo17Sebk8ZWMr0HcW7YDpl1VjvA6lqfaZk
 FFjNfUwGZc+g0quX99qlFCRxZ8ZqDDlv+LAnadALywYlPm+4OWgfgBCp0HkyK5G/9626
 69bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=NACYNv6Hwkfl+0fqqq+08Yrxlg9w4xhQclj3nSgqlAY=;
 fh=ZvWiieRx4vyFCCRkUHfEExelDPePmnPanD4jC7qbuhE=;
 b=qV+8jncYDeeEnrvqt/hNWEllNBVopJ0KZRArV93YJeeY5VrPxjHpN/gRC5MaCX/j/5
 EnqEc0HtqqLOzkFMARwljr4hj4L8S/u5XoBzqXC1gGufqFH/5wd1QbVbaeDdRcJ819rt
 +HcBpFP4AKA64KV/JdD3e3Sj1PHkbbEMl8YSgkLnVPNlqo8fkQSbtyvpyttW6jct6idj
 NlUVq0r0wGV+Y3FwcH5tP+vptAE7H4pt2XvvZ6C4XccUfWIUjxCHHvC3lhIVaGTYlLGN
 eZU9vXH0TYEjh3dRdaVrP1i6/e7JTflhj+/5ZQgovJoQo0mIw0KULy9WoTSFclhUm67E
 tBwA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790014159; x=1790618959; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NACYNv6Hwkfl+0fqqq+08Yrxlg9w4xhQclj3nSgqlAY=;
 b=oZzAUEdqhtceBYRAarNBN5T3xcCNyC5SDgJJjBQhB8VIvYBjTXVZ0EElM2Q3qD26rp
 O4bqGkyT8d4YyF01FABh7+EQTllKJarKAGCylrhWOix+QPBMbSOArJ38nD/i26P2vXyJ
 yCmN72DNGN/IRBh9ukWIQ+NCNEQs29OD9YT4mcC0aU47oKjaBMAeRNCOs/CQvXgAfoAi
 VNwAalGC629RLf1b5nYAf7T3yfooewjtLJPGrqqFJxLHrMFtfPA3aBqF8O8OdSZVVyUS
 L2uRLMr7hP5QPiEyyEozbxOGs0o9jRPI/ADIODUzG87uf0eh3eev1t547Kq4O5luMnRx
 D/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790014159; x=1790618959;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NACYNv6Hwkfl+0fqqq+08Yrxlg9w4xhQclj3nSgqlAY=;
 b=bswqfUSED8ylluRk0GD+sEB4HO7EGo218QTkmf+lOGhmX0gqSg20HOOIi004eSpeQV
 15qKyDs5cZz3SBQZlMgrCDv1mBsEpklm47WI+7VrPA03DyoULeUQyjVvx3e5iLyKjtX4
 xGLB8Fzlp6NkxmVhQwapJbM0hH0jgpzdqxbNhbPObVlzAk5eer7+1KAJibDzF9Mp4wku
 6Rd1buYwL0DK+Y7d60JtgZYAqzOueNnrzxpYnm7kql+8wGuNY6IK87Eb7diA7VjHebF/
 AH3lTGzj7LiJgIErN02P2QTZ1wRzeWshBm+erVj2Yq2UGLl4puSsxxltVDI9oXZSl+P9
 2J2A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwGC2tEnCFWr6ITkeYtCFP5TFQoHjWDI4eljFm8Hs1KrLN7JgZ9GLj45SEzO8XOJFYvD0rvidxcZWc=@buildroot.org
X-Gm-Message-State: AFuF++lyktbRSKP++2LiR5CxtQ/YpIKi/I1zAEiG105MIHJGS2EyEJym
 LiPtUGYY0aceIf9IvFf+bSiE1LQAiwYkHbrvjpMFbzhV/hauWL0k913qhrwvNoJoLlLeK//3SBy
 gQkRM4tb6KSJrEgkpHo0kg0uZiGuSg2g=
X-Gm-Gg: AYBFou2LVAPHgKlhPFA8v5hnHyasecVfMZBe+jqCyL2p+q7f57IFMGRCyktUnNM1c8s
 GonWIx616WCHHi7ouP+kJzAz46bKcJAYDC2tTU++Nh2838r/TZ2IBpLKd8lgkREInrVUK2quQT6
 w9uhdxMjRGZ228OiZQmeoYk5XTaJpEDDK1Aj2LC0K1+L45gtc8aSr+4/DMFOCmH1jRGPkC1+K6o
 N7II0Dq0fCBDRwd1M7FH+z07nZGGorEOtAv9ZeXdLe03JMjtdARgXiExQV9BJfLnUzrTpiXYquO
 mshIZOV4RVfGu8kC6a8YbF9Xqk2mnrqZOuIpOAFad0xjUTDTB23YVftNBC8jqFhEv90d4hUZTgV
 0YHL2vp5cc2SohBlSKhbjTtD9r+eXbliT44Kp2bWXdSVGOsv9DiDcly4TFr7FozK1uTY0XjgEJ3
 YzYXvDWA5jl64yoMf2LUgIByYbxCDM7IGBzh2wTpgS3E6UvRJWNeSfnJ4=
X-Received: by 2002:a05:6102:41ab:b0:799:e1cb:d690 with SMTP id
 ada2fe7eead31-7a55a02254emr5578413137.1.1790014159224; Mon, 21 Sep 2026
 11:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-2-bernd@kuhls.net> <aq-xqh_4_J_v2lQ6@windsurf>
 <CAFSsvmpcYXFia=4TuZGKAEpyciugC5nUn4vM6nYTnAQHG_+G-w@mail.gmail.com>
 <arFb6txpfwW2SwzJ@windsurf>
 <CAFSsvmqhq-xbpkXPFUUnip9=Db9aHv17=sjgojP7rmqXYqgFxw@mail.gmail.com>
In-Reply-To: <CAFSsvmqhq-xbpkXPFUUnip9=Db9aHv17=sjgojP7rmqXYqgFxw@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 12:09:07 -0600
X-Gm-Features: AcwNN1XiQVlfuYJWQwFjQEEfjjz3IdGJOc4lnKwoEuSptDL9nCpie-2HV-Rf7ng
Message-ID: <CADvTj4pPKx2ZxGH5Cct+0ekDTxFXqPPe6HvhnVKj7ig-+S8cvQ@mail.gmail.com>
To: Adam Duskett <aduskett@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, 
 buildroot <buildroot@buildroot.org>, Koen Martens <gmc@sonologic.nl>, 
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>, 
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>, 
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, 
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 =?UTF-8?B?Q8OpZHJpYyBDaMOpcGllZA==?= <cedric.chepied@gmail.com>, 
 Heiko Thiery <heiko.thiery@gmail.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, 
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>, 
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>, 
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>, 
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?Q?No=C3=A9_Rubinstein?= <noe.rubinstein@gmail.com>, 
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 David GOUARIN <dgouarin@gmail.com>, Andrey Yurovsky <yurovsky@gmail.com>, 
 =?UTF-8?B?QW5kcsOpIFp3aW5n?= <nerv@dawncrow.de>, 
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>, 
 Philippe Reynes <philippe.reynes@softathome.com>, 
 Fabrice Fontaine <fabrice.fontaine@orange.com>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Subject: Re: [Buildroot] [PATCH v2 01/77] Remove mender packages
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgMTI6MDTigK9QTSBBZGFtIER1c2tldHQgPGFkdXNrZXR0
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBUaG9tYXM7Cj4KPiBPbiBNb24sIDIxIFNlcHQg
MjAyNiwgMTg6MzggVGhvbWFzIFBldGF6em9uaSwgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5j
b20+IHdyb3RlOgo+Pgo+PiBIZWxsbyBBZGFtLAo+Pgo+PiBPbiBTdW4sIFNlcCAyMCwgMjAyNiBh
dCAxMjozMzowOFBNICswMjAwLCBBZGFtIER1c2tldHQgd3JvdGU6Cj4+Cj4+ID4gSSBmZWVsIGxp
a2UgdGhpcyBpcyBhbiB1bmRlcnN0YXRlbWVudC4gSXQncyBiZXR0ZXIgdG8gc2F5IGNvbXBsZXRl
bHkgaWdub3JlZCwKPj4gPiBpbmNsdWRpbmcgbXkgZW1haWxzIHRvIHRoZSBvcmlnaW5hbCBSRkMg
Zm9yIHRoaXMgcGF0Y2ggc2VyaWVzLiBJcyBpdCB3b3J0aCBldmVuCj4+ID4ga2VlcGluZyB0aGVz
ZSBwYWNrYWdlcyBpbiBCdWlsZHJvb3Qgd2hlbiBhbiBleHRlcm5hbCB0cmVlIHRoYXQgaXMgYWN0
aXZlbHkKPj4gPiBtYWludGFpbmVkIGlzIGF2YWlsYWJsZSBpZiB0aGUgbWFpbnRhaW5lcnMgb2Yg
QnVpbGRyb290IHJlZnVzZSB0byBldmVuIGxvb2sgYXQKPj4gPiBwYXRjaGVzIHRvIGtlZXAgbWVu
ZGVyIHVwIHRvIGRhdGU/Cj4+Cj4+IFRoYW5rcyBmb3IgeW91ciBmZWVkYmFjay4gQmFzZWQgb24g
aG93IHlvdSBwaHJhc2UgeW91ciBmZWVkYmFjaywgaXQKPj4gc2VlbXMgbGlrZSB5b3UncmUgc29t
ZWhvdyB0YWtpbmcgaXQgcGVyc29uYWxseSwgYXMgaWYgaXQgd2FzCj4+IHNwZWNpZmljYWxseSB5
b3VyIGNvbnRyaWJ1dGlvbnMgdGhhdCB3ZXJlIGJlaW5nIGlnbm9yZWQuCj4KPiBOb3BlLiBPdGhl
ciBwYXRjaGVzIG5vdCBmcm9tIG1lIHN1Y2ggYXMgdGhlIHFtYWtlIFFUNiBzZXJpZXMgaXMgYWxz
byBpZ25vcmVkLgo+Pgo+Pgo+Pgo+PiBJbiBjYXNlIHRoaXMgd2Fzbid0IGFscmVhZHkgb2J2aW91
czogdGhlcmUgaXMgbm90aGluZyB3cm9uZwo+PiBzcGVjaWZpY2FsbHkgYWJvdXQgeW91ciBjb250
cmlidXRpb25zLiBXZSBjdXJyZW50bHkgaGF2ZSBhIGJhY2tsb2cgb2YKPj4gNzAwLTc1MCBwYXRj
aGVzLCBzb21lIG9mIHRoZW0gbXVjaCBtdWNoIG9sZGVyIHRoYW4geW91cnMuCj4KPiBXaGljaCBw
cm92ZXMgbXkgcG9pbnQgZW50aXJlbHkuIFRoZSBjdXJyZW50IHN5c3RlbSBkb2VzIG5vdCB3b3Jr
LiBUaGUgZXhhY3Qgc2FtZSBwcm9ibGVtcyBmcm9tIG92ZXIgYSBkZWNhZGUgYWdvIGFyZSB0aGUg
ZXhhY3Qgc2FtZSBwcm9ibGVtcyB0b2RheS4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL3Bp
cGVybWFpbC9idWlsZHJvb3QvMjAxNS1NYXJjaC8xMDg3ODMuaHRtbAoKTWF5YmUgd2Ugc2hvdWxk
IHNlZSBpZiBpdCdzIHBvc3NpYmxlIHRvIGVuYWJsZSBzYXNoaWtvIHJldmlld3MgZm9yIGJ1aWxk
cm9vdD86Cmh0dHBzOi8vZ2l0aHViLmNvbS9zYXNoaWtvLWRldi9zYXNoaWtvCgo+Pgo+Pgo+PiBX
aGlsZSBJIHVuZGVyc3RhbmQgdGhlIGZydXN0cmF0aW9uIHRoYXQgaXQgbWF5IGNhdXNlLCBzaW1w
bHkgYmVpbmcKPj4gImdydW1weSIgaXMgbm90IGdvaW5nIHRvIGhlbHAgaW4gYW55IHdheS4gV2hh
dCB3b3VsZCBoZWxwIGlzIGhhdmluZwo+Pgo+PiBtb3JlIGNvbnRyaWJ1dG9ycyBpbnZvbHZlZCBp
biB0aGUgcmV2aWV3IG9mIHBhdGNoZXMgZnJvbSBvdGhlcnMuCj4KPiBEb24ndCBiZSBjb25kZXNj
ZW5kaW5nLiAgVGhpcyBpcyB0aGUgc2FtZSBsaW5lIHRoYXQgaGFzIGJlZW4gdXNlZCBmb3Igb3Zl
ciBhIGRlY2FkZS4gUmV2aWV3cyBhcmUgYWxzbyBpZ25vcmVkIGFuZCBtYWludGFpbmVycyBpbnNp
c3Qgb24gbml0IHBpY2tpbmcgZXZlcnkgc2luZ2xlIHBhdGNoLgo+Pgo+PiBTb21lCj4+IExpbnV4
IGtlcm5lbCBzdWJzeXN0ZW1zIG5vdyBoYXZlIGEgcG9saWN5IHRoYXQgaWYgeW91IHdhbnQgdG8g
Z2V0IHlvdXIKPj4gcGF0Y2hlcyBtZXJnZWQsIHlvdSBuZWVkIHRvIGhlbHAgdGhlIGNvbW11bml0
eSBieSByZXZpZXdpbmcgcGF0Y2hlcwo+PiBmcm9tIG90aGVyIGRldmVsb3BlcnMuCj4+Cj4+Cj4+
IFJlZ2FyZGluZyB0aGUgaWRlYSBvZiBleHRlcm5hbCB0cmVlcyB2cy4gdXBzdHJlYW06IGl0IGlz
IHZlcnkgbXVjaCB0aGUKPj4gc2FtZSBkaXNjdXNzaW9uL2FyZ3VtZW50IGFzIHdpdGggb3V0LW9m
LXRyZWUga2VybmVsIGRyaXZlcnMKPj4gdnMuIHVwc3RyZWFtIGRyaXZlcnMuIFllcywgYW55b25l
IGNhbiB0aHJvdyBvdXQtb2YtdHJlZSBrZXJuZWwgZHJpdmVycwo+PiBvbiBhbnkgcmFuZG9tIEdp
dGh1YiByZXBvLCBhbmQgeWVzIGdldHRpbmcgdGhlIHNhbWUgZHJpdmVycyBhY2NlcHRlZAo+PiB1
cHN0cmVhbSBpcyBnb2luZyB0byB0YWtlIG1vcmUgZWZmb3J0IGFuZCBtb3JlIHRpbWUuIEJ1dCBz
dGlsbCwgcGVvcGxlCj4+IChpbmNsdWRpbmcgeW91IEknbSBwcmV0dHkgc3VyZT8pIHByZWZlciB0
byB1c2UgdXBzdHJlYW0gTGludXgga2VybmVsCj4+IGRyaXZlcnMsIGJlY2F1c2Ugb2YgdGhlIGNv
bW11bml0eSByZXZpZXcgdGhhdCBwcm92aWRlcyBoaWdoZXIgcXVhbGl0eQo+PiBhbmQgY29uc2lz
dGVuY3ksIGFuZCB0aGUgbG9uZy10ZXJtIG1haW50YWluYWJpbGl0eS4KPj4KPj4gQ2FuIEkgYXNr
IHRoYXQgcmF0aGVyIHRoYW4ganVzdCBsb29raW5nIGF0IHlvdXIgb3duIHBhdGNoZXMgZm9yIHlv
dXIKPj4gb3duIHNwZWNpZmljIHRvcGljLCB5b3UgdGFrZSBhIGxvb2sgYXQgdGhlIGJpZ2dlciBw
aWN0dXJlLCBob3BlZnVsbHkKPj4gdHVybmluZyB5b3VyICJncnVtcGluZXNzIiBpbnRvIG1vcmUg
cHJvZHVjdGl2ZSBoZWxwL3BhcnRpY2lwYXRpb24gdG8KPj4gdGhlIEJ1aWxkcm9vdCBjb21tdW5p
dHk/IFRoaXMgaXMgZ29pbmcgdG8gYmUgYSBMT1QgbW9yZSB1c2VmdWwuCj4KPiBBZ2FpbiwgZG9u
J3QgYmUgY29uZGVzY2VuZGluZy4gSSB3YXMgQ0NlZCBvbiBhIHBhdGNoIHNlcmllcywgSSBwdXQg
aW4gbXkgdHdvIGNlbnRzLiBJZiBteSBvcGluaW9uIHdhc24ndCB3YW50ZWQgdGhlbiBkb24ndCBp
bmNsdWRlIG1lIG9uIHRoZSBlbWFpbC4KPj4KPj4KPj4KPj4gQW5kIEkgcmVzdGF0ZTogTWVuZGVy
IGlzIGFuIGltcG9ydGFudCBwaWVjZSBvZiBzb2Z0d2FyZSBvZiB0aGUKPj4gZW1iZWRkZWQgTGlu
dXggZWNvc3lzdGVtLCBhbmQgaXQgbWFrZXMgY29tcGxldGUgc2Vuc2UgdG8gaGF2ZSBnb29kCj4+
IHN1cHBvcnQgZm9yIGl0IGluIHVwc3RyZWFtIEJ1aWxkcm9vdC4KPgo+IFRoZW4gcGVyaGFwcyBv
bmUgb2YgdGhlIG1haW50YWluZXJzIGNhbiBzdGVwIHVwIGFuZCB1cGRhdGUgdGhlIHBhY2thZ2U/
IEkgd2Fzbid0IGJlaW5nICJncnVtcHkiIGFzIHlvdSBwdXQgaXQgd2hlbiBJIHNhaWQgYW4gZXh0
ZXJuYWwgdHJlZSBpcyBlYXNpZXIgZm9yIG1lIHRvIG1haW50YWluLiBJIGNob29zZSBub3QgdG8g
ZGVhbCB3aXRoIHRoZSBlbmRsZXNzIG5pdHBpY2tpbmcgZmFuZCBiaWtlc2hlZGRpbmcgcm9tIHRo
ZSBtYWludGFpbmVycywgYXMgSSBoYXZlIHZvaWNlZCBteSBmcnVzdHJhdGlvbnMgd2l0aCB0aGUg
bWFpbnRhaW5lcnMgYW5kIGRldmVsb3BlcnMgZm9yIG1vcmUgdGhhbiBhIGRlY2FkZSBhbmQgbm90
aGluZyBoYXMgY2hhbmdlZC4KPgo+IEFkYW0KPj4KPj4KPj4gQmVzdCByZWdhcmRzLAo+Pgo+PiBU
aG9tYXMKPj4gLS0KPj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxp
bgo+PiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+
PiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
