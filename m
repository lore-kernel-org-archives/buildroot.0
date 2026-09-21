Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5330C982EE
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 18:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8603E60737;
	Mon, 21 Sep 2026 18:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQnJlxWrfq3H; Mon, 21 Sep 2026 18:33:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 66F8960743
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790015592;
	b=KGLx3O9jkyctGDrWKWSgM84NO8QLISFpuMMXptvulxpfuObIbsA92uNsajdVZ5TjE5M2
	 Ux+8j/jxMkw4X7cK+kjTf8xvvSMUUopcmg3BIYEmUMMPaz4s2aSg9t0x+gDCYYhVUd02j
	 utPSKRRu4CjmN6DjBL0dhOfPIiGatL8IK45bX6S0J2RRTGTd0qGD08MkDghcIRqyJ6bFC
	 S1yhd+XOX2aYlNMVfwqXdZqs5EfGou9MSUk/h+uWZ3abqksywxwKI9L4vh2+YQmDZQm7E
	 Vucgd5cqGn0Fr6oaw6ZACYxYJkUAOSLSbM68D7xPydzjYvYrDiwLzA00uyn3fXbA89g==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790015592;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:To:Cc:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Errors-To:Sender;
	bh=J/yT/ZbowsZEqYPNXum7Y9E8qllAHKsiap9pWqc+6Vk=;
	b=I0yLgOJPdyYUKseJwMPO/eFpxfVnu9uX7In2/MMREpbCIrtLjZFiTL3rY08K2DlbKVzI
	 3rbZkQG8pViqiCzbG2+VWkb7Fr7CTQAjmq/UXQMN8h+X2Fi/co0rgUN6lhlC/WMXaQR8k
	 ZlDKOXIZrI1iB9laZL/sMoRnN62kVRRac+7Kvpz5fwpQHfVkjAC/Jud8BsedxYXzNOvWk
	 IxRhY2KlYxDqrixBv+65rhxhKNYi9z8RSADSwWLZzfZK6IMMQ4RP/l3qISheWYuJUFXCf
	 JU4RycHsgmKR1lNcm3ig4JMSvW0uF4bufcKvHofe+7/1nXqnP08gaJbEZc1yM7jwb4g==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790015592;
	bh=J/yT/ZbowsZEqYPNXum7Y9E8qllAHKsiap9pWqc+6Vk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pJMsrwqZZRXbC+fxgluJI1URlwdYkL4Mhn/ShZavMzJm26Gb8sA5vZRbIG0OqrHRx
	 p2GAya4qyHkjA4lPKq8vuv1so0QhadsphFG9HtW/bNd5J1vUSdTrKXx4PDYGhEADTW
	 /sPTodpnd/Odw8X3M/zEaTNsIfoCy92RyzcMmMoRWh0SsgMAlq/XeoYhX2L73QEJvU
	 KzyAG/AkwlGZ5+/8pZidDNwuA+PKHFMg7wy1ITjIN6439Dk3xgQoKK2ZQgqG8Ol2Ev
	 JiqePHLPG/16pzrsOHSkhK3XBPqKH1YwvW/H3Douwm3st6aYv/MJ1x0ZRaCeM21gh9
	 O12Mx3D3/wnRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66F8960743;
	Mon, 21 Sep 2026 18:33:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 154D73A9
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 18:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 078EB4050A
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 18:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iQbUeuCoTFGd for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 18:33:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BE7CE40513
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:30::10"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790015589;
 b=UyorIOHGejzatgltOFaTeZcDfBb36WvpmRnMNGHpgKkMJXRN6bU6vJIzHpAUotc2dyWK
 9/7mYAMjv1spWDBrY1mezgfuT131e7NI2W9JwVI7qT1fvB7qqqqpMSOtSeuVCYtsjL4IF
 ceoMgybldDDYWaisk0k18wN0XuwT5H9l8j6SMrkmH6kohG88I4wlc8ZHkogQwQroK/IXV
 nHE9pnxP5W754la8jSThJAN334vXYnKiUPgaDFsv0BxAmvZvF7+6Zn6ehjDdTB3hI7ifb
 iPgFd435iyxdYCdE8oc9D9+OZ00Q/WTdbmM/0JXIlP7tqqHaCBtnB85v4a83mV4viYw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790015589;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
 Message-ID:Subject:To:Cc:Content-Type;
 bh=WdqEle2bGVRPEqnYFV1noRGx1q6gejLRiffSp4LWWBY=;
 b=hvqe8++FhTNJl1nZXcgtnmVvz/eyTWxKtnh6X8qJWxIQs8cAB9uuLGuUitA5RSppBLL5
 TjyvRpZ6YkIP901rSaVMP0FfogBe8Mi1Nb+Avknc1cIyBiT9VD5N/ychsQrT1+KuiDldH
 QXy3Bedk/pAUdnmluwzkONcbIcnSYPYIcncNRWrNa6Ys+QeWMVf41YOSeEnHLptjEU5eL
 1vIfZiFgPs6rrUGdvHY4M/5nEa04+adNHHk0JUmMJOsu4ZKnu42gaeJ9dQE3gJwWfQcwL
 umoE0iitexGD4RDM8oaZ1+QDyFACamUGiGmeRwXmHjowCRQTKwucBq2wotTQ22a8c8w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=hESjDnvo; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:30::10; helo=mail-oa2-x10.google.com;
 envelope-from=aduskett@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=hESjDnvo
Received: from mail-oa2-x10.google.com (mail-oa2-x10.google.com
 [IPv6:2607:f8b0:4864:30::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE7CE40513
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 18:33:08 +0000 (UTC)
Received: by mail-oa2-x10.google.com with SMTP id
 586e51a60fabf-466ccde2a99so2323262fac.3
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 11:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790015567; cv=none;
 d=google.com; s=arc-20260327;
 b=r1fKuF2K/ffU6SaKQFFfKDmi8Ow6wVlS4YeUkhl5Le5HQTNR0IyjhRUjI83GtfHpaG
 ImNVvK/gF5wVOjsWN2keAq7dvJdfJqh8yHncnm+H7RWbHRBI1g0/3P5/iAAX6VLn9uh6
 HPr0xaMk9twZQ+zdZKRr4/TREJFmqEeQDMBLSyac8WDRylaoRk4spYYtWGCcg3zBRZ26
 oNHsZy9deSgiiquketAEfZZVNwtmwKN1+Lnw+sn9JcI5trxty0GVXZ/PWv53pZIsIXnm
 aTyC6qS1Qfx+NPIcy9+9ilREUYnVaFJsDik64TLvA5EGXwaUQVf4kpWL9W85PiHr24Qs
 inNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=WdqEle2bGVRPEqnYFV1noRGx1q6gejLRiffSp4LWWBY=;
 fh=Ee46ttdxmLTA17g43dOrOFfaJtHpRGgXIe+sxHx4FDQ=;
 b=YAiJ8/RmSi+XEzBkLbbAFOLsZ/eewVqFDxmdSKxDQukDAyfieM9G/IiZUuNB7TvCrL
 wxynO27C1A911+vMMJPp10cK96mz1c5U8rTwW/r9QXzmoSawSsgbJmbf0a3QpAxviMUW
 wX3suRJmSqbkKYK1bUTHF03k7Bj53w1Cw8s0YHeY5L+Q+COelAR888taaodvU8KQ3hLn
 kTC6mfiwRQu9N7wxMhGRlW2UCBzQyNZSlMGWAhb/deDA5giwfC6hGqGz1lDBY85qUIn8
 yzTdGeQTzFEYo/UjLWdJ/HtMH/Eay8DpQBBq0pHAGTSnQg1tGv/C6vlF2yukZbZgW33o
 +GVQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790015567; x=1790620367; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=WdqEle2bGVRPEqnYFV1noRGx1q6gejLRiffSp4LWWBY=;
 b=hESjDnvomTAPm4fYzeGjhWGDJQrBxAMng7IQGPqadkKITsJkiJfz8mAZ/2PQXRQUIZ
 BBYsY5xaDpYHhaPYTuFiv4/TfyWcCXU3W7HkahHqszE5YB9hJUJfPsjof+OyTPqpSUeN
 oxQArx3hD8BJYjEmccOEa5OTU7dHjYYSPBrMrRnwX2CrBb6bKErkVwEnZVjmiKUk5nAp
 rEihvpFEOkKvQzOCzzj72NIy/zviGyiWiU5XHAdjZU6WeSLdjXLfJ9D958NcINjvE+g/
 p8CEFRGKV3+7bed/zBqhAX1BCZ0UxdN0YjKv5UJ8CZgtlsTrRTp6Lu5m7k9HR6FmsZp2
 CcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790015567; x=1790620367;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=WdqEle2bGVRPEqnYFV1noRGx1q6gejLRiffSp4LWWBY=;
 b=QtBe1skalafP4/zzEtiTPCzgYeoUnMyvvDPYgbycft2a4qt+rbeDUK1bIwqZit03IE
 NSHP7bg8Wt0LRDFnHGIlXnbA/81//58u8c7cXODWT7B5nsZv3AF9hcstOTZJbpJZZDCR
 O9RfPqFioTJSz4mR+yaDrtqMFlKTjoEXHxlr1jIiRRW625gvg1+VrgMqOoVP4qkmUupn
 jMWLFo/w8wB8iC4lECelbrLmX0/+S/7vCSnE95wbWro09SGh7cYjfANw3FS4iWz8T3W7
 sZ2cmw/IPU7+xDpBtuxNiWamjQVnE5dL2rb7MgQ4QzFTwyE/xweO9hmLfCm+3nV3d+1b
 LpOQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxG0lgwCb6nxom1uwtCeTDEmNBvSeWsP/jM/pVgAMG4718YlzYcXjj4tjEVt8+cBjPZZzz7zzvb2qA=@buildroot.org
X-Gm-Message-State: AFuF++kDBUltUpQEIZV3jecz4Sjvg5fXeGHYGv2gcy75t4wdIaVh7FJ/
 CfF6TTS1ZJeZ618WmLQmhowgOqEQx3XjPDVYC/huieQm2/QCsE37/eLySeWApAagAhuYGHoHDcu
 GcCM9DwC9A0XxoDO6TKExekd0icmiwyuMkdIS/5k=
X-Gm-Gg: AYBFou1tuwycXrROcT2ulS9SDLDJGfeKnhk6pJr2e0bkNMSet011+oMd1eWBAXPSBMC
 XiR2pwzf1SgwV+Tibr/sOU6wc8VmlCkepIox++9d/p9XwfPfZt5ggT0mmi/AmuCt4g2BKY3PPFJ
 Ixu7GkTZULyr4p21SIOaBEZvdQl/il1ytHTeNkYNheC62i78w3SJbUCzhTYnIquwvc9JQ2cVhao
 JFrWWTdJPAS6xNBLok6HrerKAmwO9Ia0dYGWwgvdvtI1ZfZxRPMJFMG3o3rZlrAQ4gRnFfC/ZK0
 wyJPFKDaXefpJ8rx8Xwnj1xvv3Tjf7dsYC21jMfw0ygccGciHtFSjoNjwM/CnXJ+OTbaqpQE252
 DRk/e98qC7S87lKHEJhdFKVs=
X-Received: by 2002:a05:6a00:138f:b0:878:34d7:69ae with SMTP id
 d2e1a72fcca58-87834d76d32mr9870244b3a.53.1790013861213; Mon, 21 Sep 2026
 11:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-2-bernd@kuhls.net> <aq-xqh_4_J_v2lQ6@windsurf>
 <CAFSsvmpcYXFia=4TuZGKAEpyciugC5nUn4vM6nYTnAQHG_+G-w@mail.gmail.com>
 <arFb6txpfwW2SwzJ@windsurf>
In-Reply-To: <arFb6txpfwW2SwzJ@windsurf>
From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 21 Sep 2026 20:04:10 +0200
X-Gm-Features: AcwNN1XtdDxkV3gwIK_BLK3KKLZtDhKRR85joF8b8qf9DMAWyf4q9ELeNAyOyYg
Message-ID: <CAFSsvmqhq-xbpkXPFUUnip9=Db9aHv17=sjgojP7rmqXYqgFxw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot <buildroot@buildroot.org>, 
 Koen Martens <gmc@sonologic.nl>,
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
 James Hilliard <james.hilliard1@gmail.com>, 
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
Content-Type: multipart/mixed; boundary="===============3967941310833140442=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3967941310833140442==
Content-Type: multipart/alternative; boundary="000000000000573ace065c0214bd"

--000000000000573ace065c0214bd
Content-Type: text/plain; charset="UTF-8"

Hello Thomas;

On Mon, 21 Sept 2026, 18:38 Thomas Petazzoni, <thomas.petazzoni@bootlin.com>
wrote:

> Hello Adam,
>
> On Sun, Sep 20, 2026 at 12:33:08PM +0200, Adam Duskett wrote:
>
> > I feel like this is an understatement. It's better to say completely
> ignored,
> > including my emails to the original RFC for this patch series. Is it
> worth even
> > keeping these packages in Buildroot when an external tree that is
> actively
> > maintained is available if the maintainers of Buildroot refuse to even
> look at
> > patches to keep mender up to date?
>
> Thanks for your feedback. Based on how you phrase your feedback, it
> seems like you're somehow taking it personally, as if it was
> specifically your contributions that were being ignored.
>
Nope. Other patches not from me such as the qmake QT6 series is also
ignored.

>
>
> In case this wasn't already obvious: there is nothing wrong
> specifically about your contributions. We currently have a backlog of
> 700-750 patches, some of them much much older than yours.
>
Which proves my point entirely. The current system does not work. The exact
same problems from over a decade ago are the exact same problems today.
https://lists.buildroot.org/pipermail/buildroot/2015-March/108783.html

>
> While I understand the frustration that it may cause, simply being
> "grumpy" is not going to help in any way. What would help is having

more contributors involved in the review of patches from others.

Don't be condescending.  This is the same line that has been used for over
a decade. Reviews are also ignored and maintainers insist on nit picking
every single patch.

> Some
> Linux kernel subsystems now have a policy that if you want to get your
> patches merged, you need to help the community by reviewing patches
> from other developers.


> Regarding the idea of external trees vs. upstream: it is very much the
> same discussion/argument as with out-of-tree kernel drivers
> vs. upstream drivers. Yes, anyone can throw out-of-tree kernel drivers
> on any random Github repo, and yes getting the same drivers accepted
> upstream is going to take more effort and more time. But still, people
> (including you I'm pretty sure?) prefer to use upstream Linux kernel
> drivers, because of the community review that provides higher quality
> and consistency, and the long-term maintainability.
>
> Can I ask that rather than just looking at your own patches for your
> own specific topic, you take a look at the bigger picture, hopefully
> turning your "grumpiness" into more productive help/participation to
> the Buildroot community? This is going to be a LOT more useful.
>
Again, don't be condescending. I was CCed on a patch series, I put in my
two cents. If my opinion wasn't wanted then don't include me on the email.

>
>
> And I restate: Mender is an important piece of software of the
> embedded Linux ecosystem, and it makes complete sense to have good
> support for it in upstream Buildroot.
>
Then perhaps one of the maintainers can step up and update the package? I
wasn't being "grumpy" as you put it when I said an external tree is easier
for me to maintain. I choose not to deal with the endless nitpicking fand
bikeshedding rom the maintainers, as I have voiced my frustrations with the
maintainers and developers for more than a decade and nothing has changed.

Adam

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000573ace065c0214bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello Thomas;<br><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 21 Sept 202=
6, 18:38 Thomas Petazzoni, &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.c=
om">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hello Adam,<br>
<br>
On Sun, Sep 20, 2026 at 12:33:08PM +0200, Adam Duskett wrote:<br>
<br>
&gt; I feel like this is an understatement. It&#39;s better to say complete=
ly ignored,<br>
&gt; including my emails to the original RFC for this patch series. Is it w=
orth even<br>
&gt; keeping these packages in Buildroot when an external tree that is acti=
vely<br>
&gt; maintained is available if the maintainers of Buildroot refuse to even=
 look at<br>
&gt; patches to keep mender up to date?<br>
<br>
Thanks for your feedback. Based on how you phrase your feedback, it<br>
seems like you&#39;re somehow taking it personally, as if it was<br>
specifically your contributions that were being ignored.<br></blockquote></=
div></div><div dir=3D"auto">Nope. Other patches not from me such as the qma=
ke QT6 series is also ignored.=C2=A0</div><div dir=3D"auto"><div class=3D"g=
mail_quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br><br>
In case this wasn&#39;t already obvious: there is nothing wrong<br>
specifically about your contributions. We currently have a backlog of<br>
700-750 patches, some of them much much older than yours.<br></blockquote><=
/div></div><div dir=3D"auto">Which proves my point entirely. The current sy=
stem does not work. The exact same problems from over a decade ago are the =
exact same problems today. <a href=3D"https://lists.buildroot.org/pipermail=
/buildroot/2015-March/108783.html">https://lists.buildroot.org/pipermail/bu=
ildroot/2015-March/108783.html</a></div><div dir=3D"auto"><div class=3D"gma=
il_quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
While I understand the frustration that it may cause, simply being<br>
&quot;grumpy&quot; is not going to help in any way. What would help is havi=
ng</blockquote></div></div><div dir=3D"auto"><div class=3D"gmail_quote gmai=
l_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
more contributors involved in the review of patches from others.</blockquot=
e></div></div><div dir=3D"auto">Don&#39;t be condescending.=C2=A0 This is t=
he same line that has been used for over a decade. Reviews are also ignored=
 and maintainers insist on nit picking every single patch.=C2=A0</div><div =
dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"> Some<br>
Linux kernel subsystems now have a policy that if you want to get your<br>
patches merged, you need to help the community by reviewing patches<br>
from other developers.</blockquote></div></div><div dir=3D"auto"><div class=
=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Regarding the idea of external trees vs. upstream: it is very much the<br>
same discussion/argument as with out-of-tree kernel drivers<br>
vs. upstream drivers. Yes, anyone can throw out-of-tree kernel drivers<br>
on any random Github repo, and yes getting the same drivers accepted<br>
upstream is going to take more effort and more time. But still, people<br>
(including you I&#39;m pretty sure?) prefer to use upstream Linux kernel<br=
>
drivers, because of the community review that provides higher quality<br>
and consistency, and the long-term maintainability.<br>
<br>
Can I ask that rather than just looking at your own patches for your<br>
own specific topic, you take a look at the bigger picture, hopefully<br>
turning your &quot;grumpiness&quot; into more productive help/participation=
 to<br>
the Buildroot community? This is going to be a LOT more useful.<br></blockq=
uote></div></div><div dir=3D"auto">Again, don&#39;t be condescending. I was=
 CCed on a patch series, I put in my two cents. If my opinion wasn&#39;t wa=
nted then don&#39;t include me on the email.=C2=A0</div><div dir=3D"auto"><=
div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
<br><br>
And I restate: Mender is an important piece of software of the<br>
embedded Linux ecosystem, and it makes complete sense to have good<br>
support for it in upstream Buildroot.<br></blockquote></div></div><div dir=
=3D"auto">Then perhaps one of the maintainers can step up and update the pa=
ckage? I wasn&#39;t being &quot;grumpy&quot; as you put it when I said an e=
xternal tree is easier for me to maintain. I choose not to deal with the en=
dless nitpicking fand bikeshedding rom the maintainers, as I have voiced my=
 frustrations with the maintainers and developers for more than a decade an=
d nothing has changed.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Adam=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quot=
e_container"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div></div></div>

--000000000000573ace065c0214bd--

--===============3967941310833140442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3967941310833140442==--
