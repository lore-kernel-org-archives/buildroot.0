Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680BDC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 10:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FBF460624;
	Sun, 20 Sep 2026 10:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQpeMtQH9OIG; Sun, 20 Sep 2026 10:33:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2D57860632
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789900402;
	b=gHXqBBhnYQsq0oALv2mgJkO3kgax9KRTBpyzskaTazFgHH/lupzk/PTdpj5I9v60J9Hg
	 3HU3jFE9qP391wMbcXWDBvCsqh40yS0elfiwQfeIj8hu4JgzW0SufvhoAA5uo4/6zWLA3
	 5HppLTla7k40GIz/9e0GvtMw1g5NvpeGLuH8M8QgiYCqdtjfGE1uqrcS99lYVxPkB2/Ny
	 Et83IV40RSbglEppULH2aG9TXY7rQqwIQtGPvG/uaN4WvBAm5gv2KPej9ItTYEQNBjzER
	 kF715YYOesaf/UoAhr9LLa94TdrVmeDSYQwUVvg5mEOWN50IqddoG0+S28JqlTd1dZg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789900402;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:To:Cc:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Errors-To:Sender;
	bh=PCMwcraNlZCpCxPMpd7Wg5FArdJDxHeOcmNvI3tVDbg=;
	b=ePgFJWELxBW5D5h3j5G4HyqA2k4QKoajEFIFHXrQv0HjKgRygSG3nEeunMpgB5AtaTuG
	 ZOZL6qQ+dwaLaU7XR2QjhIVln0vNx1g6MBKr6GKsi+x2X9E+lpJkEZfklGAR8mnV3G4Oj
	 yqZdoaomtet1/MpA06dhw2X9zauwZV2NjnshlemCISC9YG4doYSwShwXQonrh7ZGLR6FN
	 gzUPf2IgURNijNDnkJ9ehLaA7aKgeZhPGlUjIYy8jeXc2YH0tT4740Je+6xBT5rQZv5ef
	 7Q+ps8gRjZA7/lrXeytdFmY7LHn6pkNjW0z6m6qBy2fnoTyrhzMnjRZ0ufbTqDAh/ew==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YwrxK+Bl;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789900402;
	bh=PCMwcraNlZCpCxPMpd7Wg5FArdJDxHeOcmNvI3tVDbg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PJZdxPlUcn5ZdSXF9xqhJCcpCoqd0Pqsurg+alNTVDLS5eY/j0MU2P20C5DDjNE8z
	 d/Nsc+JkylcHfNeW+scX2qJgp/f/6ltpDlkjh8uHFyUpXh1JZicLgkONu+VX7ey4NO
	 LSrI5q36x8C/zwFM6wQsom+5YNeNaEN+hjXvVvrgJc44ltGmfVA3I9xVqb3CNInsi2
	 ZOVcGgG5dmoyvtbY0hTKXOaw0N9MmqZMAPtSosw/coP16oWyUcqf6kZUrI2UF2YxsC
	 u7kbmVZON7RCnB312QP0bgMcC59KgMi+tavfFpL8URN45IRoAkuvDd0h7o5kFpdb5Q
	 f7CEB39h217MQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D57860632;
	Sun, 20 Sep 2026 10:33:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A4998371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 962D360632
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TshG4gM0vYRx for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 10:33:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A6A4260624
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:3b::10"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789900399;
 b=SlkKtGppyFRu5b2epa7fgDDd7KNNBFn5LI06Vf9bCMn0AXMjKMGgrfsduM5sr+XLuhYT
 1Uld45FrxRV+tpg4njoTdjBlzCa6eePyih4vCP2bdHAvEvo75VtfH826ah9HGsiQFzRev
 OEOF2NRoPQnPBkZbN/UEKA5RmXhQbdw4jJo2cF5UAKZkkWNKjubRR+dLz1O4O2O52LEGI
 tIOMyS4GDxMIIu+Df8t/3pkEvJD08DxRzpjPYKPbn9REka56BecKP0Q5lPie7qf83oY6H
 QdFMBMIXb7XJP6Gw99cCbQfD6W+pbdu4KfDchJ1SRp9eI/we0b6EtOyVlQw+PhOy0Vw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789900399;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
 Message-ID:Subject:To:Cc:Content-Type;
 bh=fuWOdB9MI8UeiKAfBwT5KerfgEdvo9pYXYwTVcFg5As=;
 b=TmGdvw9QD72rOphW3HuHbaDX1tGyb9lz9VihorB86DDu8D4wzdoxOABXt3w/MnWayvBf
 aHpDPeAVnMKLumiIvv/AiYvkjOHyeGOnIx66/EBc3oXm4AIIEOjB9WXrS76Uu3QYZBAFm
 VEdSIhD36ehgK4l43XI1hJT/axVe6ByR/1+Uap1gtLZsqSgZbMxiiBlhzEbhhQ1mGQb6E
 F0Ehlj8csJuRqZXrBIjKnGvcHTLbZkmMMO6FO9NMFZtyZR/2cIucqgLLkZdPJw9TRmXZz
 9IpJjxzR4zfTo4DIGio6QasSdVVPIvThKhThgWGm7Cps5em6DzcxL9TGHQMNRoZ/3Qg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=YwrxK+Bl; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:3b::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:3b::10; helo=mail-pz2-x10.google.com;
 envelope-from=aduskett@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=YwrxK+Bl
Received: from mail-pz2-x10.google.com (mail-pz2-x10.google.com
 [IPv6:2607:f8b0:4864:3b::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6A4260624
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:33:18 +0000 (UTC)
Received: by mail-pz2-x10.google.com with SMTP id
 d2e1a72fcca58-85469a34907so2295310b3a.1
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 03:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789900398; cv=none;
 d=google.com; s=arc-20260327;
 b=rZKSew4k4bb33P9HFUCUxsimRry0RXBGaUogX4JnVJKaImxP0CmL/OaY8jX8yTIZsD
 MK2BIBRJ+M0Xjjo46TUWEhk/PH6gcTmXSstEybEYp+KHXP0799HScXbPuHj9Hn07ejLD
 tUtYYlpACrbqH4FQa73+Ewm5yWMRKqWboVpw7yO5i9gFJUB2cJMRAvytORd0O8BVH5WQ
 4l91ZW5bKGxDCUduYmCAQ5+th4m6XBQE2hk+p8jwwMX3KMASZYtPnPnA4ic4tnCN8FFg
 HgfJ+qZ4KLDvkTylLDpAMkS5SAs+aETCtAWW+92ftQOLPkneYkjGKK1Jnoa9hF7sHA4J
 WAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=fuWOdB9MI8UeiKAfBwT5KerfgEdvo9pYXYwTVcFg5As=;
 fh=iv7i76ZrvvVMU6drdhfngHOCwpP7Xp/gyBm6TYwkEGs=;
 b=WDTaBgu0mdOrg3W4TY2Yc1Vs6ruFtO8lT5+FNFg/Sn1MBJ1XBvtZ2p89y6/+dx5gRh
 y1GTUruWsedftK61+oUlo5TQxdB5JJLtk0NFOOpAtKLiFPT4boNeT9YVmVAU59eS3wEv
 aMHDFBSJ13USRit1zfGfZIe/0PXYuBe4xlgVKlA7TzYTzE2UGFnV6DkW2sXAdCjDvS3C
 o3G2cUYvJP06+IA7zwFERdZvB8z91YYK5zq8pbCt6yo82fIHHjKMpeCbnUfiMmiEwIIH
 OwfhcRwlxDY7GyDr8tDpmYAQ2Af8DyADMhs8sM+o3/Ssp50vTN65EzoViLJVcIZ6sYUY
 dUZg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789900398; x=1790505198; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=fuWOdB9MI8UeiKAfBwT5KerfgEdvo9pYXYwTVcFg5As=;
 b=YwrxK+Bl1Rx5AZ2nFLr76S7NWaTlx98R/m2n1FLeHI3Kek7hEbV2Y0cuELJbrFDJ92
 FzV8ZKTJOEYD2J+6BySDS0FOAy3ViuD0RhLUihvjLfEa/PwqxZUW7PqyN6t4PXbVz4Jn
 5ttWQtwXxMe8sBVnn3CUUfDyJHMczx0fuv1puxgi6ogggnR3cy69a2agusS6lUTjRQCf
 kvMiHF4KPxBRSxP/0GQovU9F12k3MUS0bCFiztfkd7pJcShRaLFaEnsD7Bqnl0oTMinX
 yDtDrDJym8mLhezljjOyfXT85YaOfQ7r0MSCWzON4UlMs5H1Cs4ROmL7ExNfbb8PwtTX
 nSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789900398; x=1790505198;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=fuWOdB9MI8UeiKAfBwT5KerfgEdvo9pYXYwTVcFg5As=;
 b=kfLNxmVpASICC6+g7KNd7O/YVTHnHX1cY3FQt2QiKOgm+yWYxMBk8/Dg2gVXXxaKgu
 EY7KBsfzOpzwulwgWnlE0AKgbyIzXtOAhJBWYcLyWwvOvT5VQ4DfZwGWIiTZEHp1wGTz
 HQHELcjwPzBR2GcqBn9ScmUPqTsdP+PMgkc0cq+IkefDPZsIJ5CIiGwZxkyLZVowBpG/
 FcObMY9z57v3v8hLbsLlXEkKzCC/fq7I7fT5/BbzRSWAnxUFC3LFVFS4X/0UPaZKHK+Q
 Wpvs8oq4dmz4pADUhdh5uFdrlUNL/D3DaPDpjiJSTEzhTOQ+uyfs2ZJrzQpVJ/Tk6x9u
 FW3A==
X-Forwarded-Encrypted: i=1;
 AKwUvBx2/4vP65Zt+1tVI5ei8nF/fqe/y1zvVtuBQWDKzI2hjUrmKzEWY51ZjU1+8ZSIxPfvBSwNU8MXQlw=@buildroot.org
X-Gm-Message-State: AFuF++naXIPlg78mPV3oKgg9o712P89/16qo/OVOpEa2BbLRh7U7pOgr
 +5lK5zeEXzg0APLTPd0KdbmpAd+wiznQVkHtYgMnQ83PAxdaDRvhJ5ykJMoFWrwnuXjSQRSzMAY
 i5CgYI4vLOlMAmqUASQKP3HcojRR3iQE=
X-Gm-Gg: AYBFou3EAaBHq4yz9pTJ6oCPNTP4mJthYvkhJOS7DvQORxxR6KXoaS7jYu29rR1l9hJ
 2QmtDRBLEsRmXcrTVC7/lFymDIB9Fr91i6L29X+4RY7dWhIe1DXYps95OzN6WEQEkMrxGEMoxi7
 KIdpFK0T/7hRWl35iTwIMqTyUU2EwIqkbyjL7+Ht2s7y8ugbdQZxE0dUpFDWYfh7xIWvT40JA7b
 Kwp0zxgSiy1NcTI2UYPsXA7M9IesaBEumHS1oXkCbM+z7E3ey3GJOfZTvPNzb6PlfedRYoTT6q2
 rhWXHCPOYPof/qiju3ilwLMDfsc6bpD3X2ksv2UnaOFViSf+w0hXy8QziBMhs9raswOvHvTaMQ3
 gcPBX8idwpHh6WQ==
X-Received: by 2002:a05:6a20:438e:b0:3d3:b02a:7252 with SMTP id
 adf61e73a8af0-3dd8c57f75dmr14695819637.28.1789900397722; Sun, 20 Sep 2026
 03:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-2-bernd@kuhls.net> <aq-xqh_4_J_v2lQ6@windsurf>
In-Reply-To: <aq-xqh_4_J_v2lQ6@windsurf>
From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 20 Sep 2026 12:33:08 +0200
X-Gm-Features: AcwNN1Vz7vzQ9ZaRzS9-EfUT74_VGILB4W3tk8o0UfIpOy1H0diREBlJ6ElnthU
Message-ID: <CAFSsvmpcYXFia=4TuZGKAEpyciugC5nUn4vM6nYTnAQHG_+G-w@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8858234957000148040=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8858234957000148040==
Content-Type: multipart/alternative; boundary="00000000000063c166065be7a90a"

--00000000000063c166065be7a90a
Content-Type: text/plain; charset="UTF-8"

Hi Thomas;

On Sun, 20 Sept 2026, 12:17 Thomas Petazzoni via buildroot, <
buildroot@buildroot.org> wrote:

> Hello Bernd,
>
> On Sat, Sep 19, 2026 at 05:57:26PM +0200, Bernd Kuhls wrote:
> > Building the current mender version 3.5.3 with OpenSSL 4.0.2 is broken:
>
> FYI, I am not a big fan of removing Mender. It is a widely used and
> modern OTA solution, and it makes a lot of sense to have it packaged
> in Buildroot.
>
> We have not been the best at merging the patches from Adam Duskett to
> keep the Mender packaging up-to-date, but I still believe Mender is
> very valuable to have in Buildroot.


I feel like this is an understatement. It's better to say completely
ignored, including my emails to the original RFC for this patch series. Is
it worth even keeping these packages in Buildroot when an external tree
that is actively maintained is available if the maintainers of Buildroot
refuse to even look at patches to keep mender up to date?



Its rewrite in C++ in its v4 makes Mender even more relevant I
> believe.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--00000000000063c166065be7a90a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Thomas;<br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Sun, 20 Sept 2026, 12:17 Thomas Petazzoni=
 via buildroot, &lt;<a href=3D"mailto:buildroot@buildroot.org" target=3D"_b=
lank" rel=3D"noreferrer">buildroot@buildroot.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">Hello Bernd,<br>
<br>
On Sat, Sep 19, 2026 at 05:57:26PM +0200, Bernd Kuhls wrote:<br>
&gt; Building the current mender version 3.5.3 with OpenSSL 4.0.2 is broken=
:<br>
<br>
FYI, I am not a big fan of removing Mender. It is a widely used and<br>
modern OTA solution, and it makes a lot of sense to have it packaged<br>
in Buildroot.<br>
<br>
We have not been the best at merging the patches from Adam Duskett to<br>
keep the Mender packaging up-to-date, but I still believe Mender is<br>
very valuable to have in Buildroot.</blockquote></div></div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"></div><div dir=3D"auto">I feel like this is =
an understatement. It&#39;s better to say completely ignored, including my =
emails to the original RFC for this patch series. Is it worth even keeping =
these packages in Buildroot when an external tree that is actively maintain=
ed is available if the maintainers of Buildroot refuse to even look at patc=
hes to keep mender up to date?</div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"></div><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blo=
ckquote></div></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
Its rewrite in C++ in its v4 makes Mender even more relevant I<br>
believe.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer noreferrer" ta=
rget=3D"_blank">https://bootlin.com</a><br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">buildroot@buildroot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer noreferrer noreferrer" target=3D"_blank">https://lists.buildroot.=
org/mailman/listinfo/buildroot</a><br>
</blockquote></div></div></div>

--00000000000063c166065be7a90a--

--===============8858234957000148040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8858234957000148040==--
