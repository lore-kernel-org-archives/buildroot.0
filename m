Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DB3C982DC
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 11:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DA4040B4B;
	Fri, 18 Sep 2026 11:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6TaF-0ai8PcR; Fri, 18 Sep 2026 11:08:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 61BE740B4E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789729731;
	b=GRJ6Cyqg3R29gTIYR578WOERuRAQBfba4Ud49TYBoZtZtTX6jehxeefxUezqcKiObZ75
	 dEkmql0poeY1hB2MS3AaU0UF9WcE+hS+L1Ob0xrc16aKXCzvIKCdbpZld3pS3Xeei4/hf
	 2d3fsyT/v8I6py4X0A/VJMBeT5ub7+8sNja/veyL6CIikc5eyAzQNXOZKu2EkooSscdz6
	 KxvJ2TRzTnODAEcIozZIy9dfajNVgQE1FwpwGnKuMWwHYvYqFXGHsoyAMC/exjSSsfm6d
	 Y9OOQvsC4oWlY+N3i7wLAjPjXj7UIzLR4EQJfwqzODDws8F5yYttm5EZrsTE2sYFABQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789729731;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=nH0YrT4uWYDChw9fNdXHiZq4ML3vaimfr//bf5M0oyY=;
	b=XsnQERPSn3+dcsBgOXh4+AP/s0VYK0USLmWiXtCpDDD6OeVl/P6qcpCTCNvhFy2R0FTc
	 K9dsyMbWw/g82nGv4P5J/IrkSgCPbe9WkVVMUCzJDFAt0zWsnU/T0dJFG5D50inGgKFGF
	 +45MDDPLuJ3ZnFlOjZRmCsLsNwfFXHT+yA2CAni5ENRFDKsSB0eDGjF5TbrMCkfpFibfP
	 jRPbFIVSVayFb6fdZO6Ion/xjx8ZVuQnGOsqJ4S/f/Xxr8YRVetgp7XGEQSZA36Iuemi3
	 RxnU6VGQoMWIj+G17IugHCh1MGiyfyXeKOnMXmwaaHv9DOyy0gmqTFGo6VceR4dmGSA==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789729731;
	bh=nH0YrT4uWYDChw9fNdXHiZq4ML3vaimfr//bf5M0oyY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nHi8B2FlE8jsX4k7kSCShhW6ewufxze0QjfwHVE8RwcYh3HPzk7TGe3DmEAR+SE9X
	 i6IhDO2D2n2ltOIicyEdtDhTDxBr0BI1VHVZZHi88hrRFu6xUvCxl5KQPv3QAzLOoD
	 azndMqJ3B4dS7+Lzy1eBA0Ze2AJ1kmoDwh2cO46ehDhIKGni/shhRUjOxt+bhtsis3
	 KoTQ7oJkI73/0u3zffDkuwmZ3PwoGbR9ir+OS1LFUS/rQsOdLkrQfwWbQYJQ2I2eEE
	 1Ojul5Jsuq6oSSpjdScLqE06g83qt9CxCsUNSrNgyjoE0xAzAcRPceLe14OnUHCRXj
	 mjscdmdeHGe0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61BE740B4E;
	Fri, 18 Sep 2026 11:08:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B134D42D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 11:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A302660C1E
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 11:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJuyIcq9-l7I for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 11:08:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 56F7360BE6
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:41::10"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789729728;
 b=QZG1mOQ4rtByau3aXn29upEpOLnmRzlSkIbXi3flMhvqfjS4I1AiqUYGhO0v+3QNja1s
 BwZqAi9QlCq+vsH40tOLFwMZlyRy2rY7d8YRQg+7wyJiibNkh1VYP4JGounbuzXfXaur8
 njlCXQ5W5YjXysHaB3GMIa+i26d/J6FuNAUXP0JuvCC9oRuAx8K/J5ix5uQZuj78Q6GWV
 YJHZbP5A3qZdbEEPLZ6ovkSFQgEfRx5BKP7Zmqs08P3W47Gnmucb2fBdtnDGCk3//xZ69
 uE00wnnqhEj1uiREJM+mXDwGO4WANjG9njHrwtO2oKzJ0YvtYsDkJIsHluLQPoXkh7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789729728;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=/ZY0qYny43B6qtsR9bF/M5YnahBfLsMxQwSOD6KKlk0=;
 b=BVPI8c4C4YIswi++kXF8sj1k43maCBxVmUaV6hm5RexLLETAyvvx0BaJhuvtqQ/g+nfq
 GOb5QKjk/f8c0f37ZkAED2L7csFr24a8zDqiqiqLycWIB/YG1DwF0qz8t+7uWiKD77y7X
 IdEQ/1hJN+NSIHtRmWgsHjjD8PDojmK3tnTudALAFP3ada9Grt3was7E4o0ElIzbxXo4K
 dtTFi+Z9nFU4rqFORgFelbM9PKHLcGLQTEAjAw9uFMc2Cq6exc0JfKGE5+yvtKCwxY471
 nhL52A50dgz+6Mv0NQXRA64QIJe6cpy0DQRYx2hsw45GUw5GdpCDae3jE6Ikm7b4lUA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=kRfNzJOn; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:41::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:41::10; helo=mail-yx2-x10.google.com;
 envelope-from=fractalclone@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=kRfNzJOn
Received: from mail-yx2-x10.google.com (mail-yx2-x10.google.com
 [IPv6:2607:f8b0:4864:41::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56F7360BE6
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 11:08:47 +0000 (UTC)
Received: by mail-yx2-x10.google.com with SMTP id
 00721157ae682-85d46e4cdccso3503337b3.1
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 04:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789729727; cv=none;
 d=google.com; s=arc-20260327;
 b=mW/73D4GrFtIV4tYhjMviz8dqX5Uqm73K6RkeCOHGHVE+qYiyGsYgWMLwJ5sNbAFNu
 jlKnwFqKA+GsPwyPgOBI/XV2auReTN6Ciu1JNfdg1eePpmjNGfC7H68LJ8uy57auIgNF
 dSjxMpgzq0VpiR9gmK/uTC6FzQTSMmjs/ZnI4e5h1qmQ1TuscKfsSQw4igurMQvC4KWu
 yTUb2p62p+diaWD5EcKXqzBItasPi8hPnZszuynKLOv/Lz7goKjBIEQwboIM5AwlnY5q
 VoQOlqp/SOWrpiD4nqH+1i7dwHzox7IFetcjHfwAL0ITsWhOqxegaOJLqwK0Db2No8Fy
 EyFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=/ZY0qYny43B6qtsR9bF/M5YnahBfLsMxQwSOD6KKlk0=;
 fh=t1HKz4FGwg2rlpSa7EUNbKGYl/IKyrvQ/1p5yhNuG2o=;
 b=F1mnY/pUY8YloVawKygb0bHR9a9KekQlJ+9RySWVMc6Mp9xiC1XBw4RODiXunzXSm+
 pKU+MAzFWWeacAgMOGGlIoBAbyTHCwVpxv8wclScTULThJO0zKCw8Um326McoIfeB8qA
 GmWIBxxigpsR9FnqzO48Zr2q4ZDu81qxCIpNO8RsD/+LTMjfxsQOavtph/MG37RWZL0L
 ifLJoyAhP8jsKS7E5gvCp4EFeFNnuF25+vdyqIrCMN1CkKR7fAD9RWC1/yo0S9pHu1F3
 upUFRA7kqwT1j1qYQidTi1zwSbUEQIh/hzAMSNz/YxicslP30dKnXSrgbgfQY04h/oLJ
 QbVw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789729727; x=1790334527; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=/ZY0qYny43B6qtsR9bF/M5YnahBfLsMxQwSOD6KKlk0=;
 b=kRfNzJOnco4LN9EuFurXcFxugPD3DUbx0O14sQ2x+xkyXH51IAggyYX2pvwSE4zLfl
 g6mV0GZR705tJkUqqoJl3MXVH2el3OVzvqAU8kTg2JSxS1b6WJT//uGqCNZyFKbKK1l1
 UHaXV2sp/epD+w+OjLzWhb0RwBvQpmMnIn+aPHRU7krzBMYf4iF6WcAIjv2IvZFJ+ipV
 IviUOZcMy9SounNaXeUAMd+1yKRzrdaO/AsTE/ZLC8DrjHsR9qvosqaH14vQ69+NLRrk
 E47TbfI36AiI91QwXW/F4DyEIP0OKAesEgDqBV83UhC1a1QI9rIYlPBlKiSwnfWBTuVZ
 bQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789729727; x=1790334527;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=/ZY0qYny43B6qtsR9bF/M5YnahBfLsMxQwSOD6KKlk0=;
 b=X0zkj6RVFhhJ8FxhUi2NtRr1agHzoSDKDn3My127zJIXk0+l6soXnxn55jYI+UF3uS
 9+87iJLCC0vgSGZ1qUNYJIhNndnpVhlwQNm510saB+B8XauMovTtC7OrSbKhm1q5xJH6
 5ucpPUcIVSyOijH+uGUgeN6MVSVFSVDRJEQ8yNx3raNiMsmkEXRIrj+NJfOlaoLu//Pv
 Kisl3Tj7aRe9XL2e536eaVX2b8TzShvquiJrejWqfAp7Fxo+pl8lun89Y/6QtPKnOm1O
 V6kvnG0mL1p6EQLQpasHS9A2XfDlqoCo1d3snXOn5BoUQO98sHSDJ30KwNVefzXic3mD
 CUkA==
X-Gm-Message-State: AFuF++mh6P34bdSrvTGM0yo5dWhC91TsqxXenzAf9+k93cdoBWvPOb2n
 de+3nZsI/coI1qk6sq0n7R4Jto9AzGQK3k57OFEgr9R0mCpR9A54nof8P/kVMUFQ+llZeiiBohB
 x1c6Bftx84Y+ebvlGb1vx7uzNckQ/Ssk=
X-Gm-Gg: AYBFou1gD1r2qZgcKBEKNHhorbia1pUDuKXfenSJwDMzPIqR06Uv1fDlM3zTXjrIGXL
 nU5u6xDa8diiUGMA9SuuYG0yDnsCzMh1FuPfbNpHrepvT0CfubHyjkvjXkPDQj7smFKSlkTYX0+
 Guwz4GAfIy/YQC25oWVUvxPq5zzgt323VtIWHjdQ+ISpv5Gj0K/gcecGxj5hqxpGbGmOkutUwAQ
 lKlNDc6a7BSE4MfSF1R9qYhFSeWCjBoqMJq9K3+aZRgZ2RsQ05Kg/4gd7TdQ4YBz6F9ESbASxIp
 rSc5TSPEEG/2Q5Jwor9NmcgPZhLUtqN96d69Xyh1l+eWowT8Ba5zkDrr
X-Received: by 2002:a05:690c:4dc3:b0:888:7a02:2800 with SMTP id
 00721157ae682-897350a5d28mr11313587b3.16.1789729726740; Fri, 18 Sep 2026
 04:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260917-rock-pi-4b-v1-0-a1da4ee05567@gmail.com>
 <20260917-rock-pi-4b-v1-2-a1da4ee05567@gmail.com> <aqznoUtW4EIcK_8m@windsurf>
In-Reply-To: <aqznoUtW4EIcK_8m@windsurf>
From: Jean-Paul Etienne <fractalclone@gmail.com>
Date: Fri, 18 Sep 2026 13:08:35 +0200
X-Gm-Features: AcwNN1X0DDbMpzMcvsVMEaptz3GXstMDnGOvzwZbomYyD0nKiS2IxNtyQ5FKkvQ
Message-ID: <CAN7e4jochVOH9Tj19YiFeeOxix=-bn4OhferJC9Mgg=j-AVsDA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH 2/3] package/brcmfmac_sdio-firmware: new
 package
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
Content-Type: multipart/mixed; boundary="===============8575651743612328176=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8575651743612328176==
Content-Type: multipart/alternative; boundary="0000000000009b3dbc065bbfec32"

--0000000000009b3dbc065bbfec32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,
Before adding this package, I've checked linux-firmware and saw that it
does not support brcmfmac43456-sdio.bin firmware
required for the AP6256 chip.
However, while looking in the brcmfmac_sdio-firmware-rpi package on
buildroot I see it supports the firmware:

ddf83f2100885b166be52d21c8966db164fdd4e1d816aca2acc67ee9cc28d726
 brcmfmac43456-sdio.bin
44e0bb322dc1f39a4b0a89f30ffdd28bc93f7d7aaf534d06d229fe56f6198194
 brcmfmac43456-sdio.txt
2dbd7d22fc9af0eb560ceab45b19646d211bc7b34a1dd00c6bfac5dd6ba25e8a
 brcmfmac43456-sdio.clm_blob (default_config)

But brcmfmac_sdio-firmware package has specific firmware and config for the
rockpi4b board as follows:
78085a816d23d9877e3ab872d8eb142646bfde18afd2c7a5b89885327a287d19
 brcmfmac43456-sdio.radxa,rockpi4b.bin
343d1c79cfe0e10e1777e3de19a0302f748f69fa8356cab2c36ca0cf90bbcf0e
 brcmfmac43456-sdio.radxa,rockpi4b.txt

And they are not just symlinks to the default brcmfmac43456-sdio.bin
or brcmfmac43456-sdio.txt
So I thought this package could be useful to the community especially since
it supports a lot of boards.

I'll update the patch.
Regards,
Jean-Paul

On Fri, Sep 18, 2026 at 9:28=E2=80=AFAM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Jean-Paul,
>
> On Thu, Sep 17, 2026 at 10:42:45PM +0200, Jean-Paul Etienne wrote:
> > Package containing Broadcom Bluetooth and Wifi
> > firmware for various boards, like pine64, orange-pi,
> > radxa boards, etc.
> >
> > Signed-off-by: Jean-Paul Etienne <fractalclone@gmail.com>
>
> Thanks a lot for this package. A question though: isn't this firmware
> already in linux-firmware? I see in linux-firmware:
>
> ./brcm/brcmfmac43602-pcie.bin
> ./brcm/brcmfmac43340-sdio.Insyde-VESPA2.txt
> ./brcm/brcmfmac4371-pcie.bin
> ./brcm/brcmfmac43241b0-sdio.bin
> ./brcm/brcmfmac4373.bin
> ./brcm/brcmfmac43241b5-sdio.bin
> ./brcm/brcmfmac43362-sdio.cubietech,cubietruck.txt
> ./brcm/brcmfmac43430a0-sdio.ONDA-V80 PLUS.txt
> ./brcm/brcmfmac4350-pcie.bin
> ./brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
> ./brcm/brcmfmac43430a0-sdio.ilife-S806.txt
> ./brcm/brcmfmac43430a0-sdio.bin
> ./brcm/brcmfmac4356-sdio.AP6356S.txt
> ./brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt
> ./brcm/brcmfmac43362-sdio.WC121.txt
> ./brcm/brcmfmac43340-sdio.pov-tab-p1006w-data.txt
> ./brcm/brcmfmac4329-sdio.bin
> ./brcm/brcmfmac43430-sdio.MUR1DX.txt
> ./brcm/BCM-0bb4-0306.hcd
> ./brcm/brcmfmac4358-pcie.bin
> ./brcm/brcmfmac43340-sdio.meegopad-t08.txt
> ./brcm/bcm4329-fullmac-4.bin
> ./brcm/brcmfmac4356-pcie.gpd-win-pocket.txt
> ./brcm/brcmfmac43362-sdio.ASUSTeK COMPUTER INC.-ME176C.txt
> ./brcm/brcmfmac43242a.bin
> ./brcm/brcmfmac43241b4-sdio.bin
> ./brcm/brcmfmac43143.bin
> ./brcm/brcmfmac43455-sdio.AW-CM256SM.txt
> ./brcm/brcmfmac43236b.bin
> ./brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt
> ./brcm/brcmfmac43340-sdio.predia-basic.txt
> ./brcm/brcmfmac4334-sdio.bin
> ./brcm/brcmfmac4366c-pcie.bin
> ./brcm/brcmfmac43455-sdio.acepc-t8.txt
> ./brcm/brcmfmac43241b4-sdio.Advantech-MICA-071.txt
> ./brcm/brcmfmac43430a0-sdio.jumper-ezpad-mini3.txt
> ./brcm/brcmfmac43430-sdio.ilife-S806.txt
> ./brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt
> ./brcm/brcmfmac43602-pcie.ap.bin
> ./brcm/brcmfmac4335-sdio.bin
> ./brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt
> ./brcm/bcm43xx-0.fw
> ./brcm/brcmfmac4350c2-pcie.bin
> ./brcm/brcmfmac43143-sdio.bin
> ./brcm/brcmfmac4356-pcie.Intel Corporation-CHERRYVIEW D1 PLATFORM.txt
> ./brcm/brcmfmac4330-sdio.bin
> ./brcm/brcmfmac43569.bin
> ./brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt
> ./brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
> ./brcm/brcmfmac4366b-pcie.bin
> ./brcm/brcmfmac4330-sdio.Prowise-PT301.txt
> ./brcm/bcm43xx_hdr-0.fw
> ./brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt
> ./brcm/brcmfmac43430-sdio.AP6212.txt
>
> So what's missing? Is it "just" the .txt config file that matches with
> the specific board?
>
> > +define BRCMFMAC_SDIO_FIRMWARE_INSTALL_TARGET_CMDS
> > +     $(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
> > +     cp --remove-destination --no-dereference $(@D)/*.hcd
> $(TARGET_DIR)/lib/firmware/brcm
> > +     cp --remove-destination --no-dereference $(@D)/brcmfmac*
> $(TARGET_DIR)/lib/firmware/brcm
>
> We normally use:
>
>         cp -dpfr
>
> for such copies.
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000009b3dbc065bbfec32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Thomas,<div>Before adding this package, I&#39;ve c=
hecked=C2=A0linux-firmware and saw that it does not support=C2=A0brcmfmac43=
456-sdio.bin firmware</div><div>required for the AP6256 chip.</div><div>How=
ever, while looking in the=C2=A0brcmfmac_sdio-firmware-rpi package on build=
root I see it supports the firmware:</div><div><br></div><div>ddf83f2100885=
b166be52d21c8966db164fdd4e1d816aca2acc67ee9cc28d726 =C2=A0brcmfmac43456-sdi=
o.bin<br>44e0bb322dc1f39a4b0a89f30ffdd28bc93f7d7aaf534d06d229fe56f6198194 =
=C2=A0brcmfmac43456-sdio.txt<br>2dbd7d22fc9af0eb560ceab45b19646d211bc7b34a1=
dd00c6bfac5dd6ba25e8a =C2=A0brcmfmac43456-sdio.clm_blob (default_config)</d=
iv><div><br></div><div>But brcmfmac_sdio-firmware package has specific firm=
ware and config for the rockpi4b board as follows:</div><div>78085a816d23d9=
877e3ab872d8eb142646bfde18afd2c7a5b89885327a287d19 =C2=A0brcmfmac43456-sdio=
.radxa,rockpi4b.bin<br>343d1c79cfe0e10e1777e3de19a0302f748f69fa8356cab2c36c=
a0cf90bbcf0e =C2=A0brcmfmac43456-sdio.radxa,rockpi4b.txt</div><div><br></di=
v><div>And they are not just symlinks to the default=C2=A0brcmfmac43456-sdi=
o.bin or=C2=A0brcmfmac43456-sdio.txt</div><div>So I thought this package co=
uld be useful to the community especially since it supports a lot of boards=
.</div><div><br></div><div>I&#39;ll update the patch.</div><div>Regards,</d=
iv><div>Jean-Paul</div></div><br><div class=3D"gmail_quote gmail_quote_cont=
ainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 18, 2026 at 9:28=
=E2=80=AFAM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin=
.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Hello Jean-Paul,<br>
<br>
On Thu, Sep 17, 2026 at 10:42:45PM +0200, Jean-Paul Etienne wrote:<br>
&gt; Package containing Broadcom Bluetooth and Wifi<br>
&gt; firmware for various boards, like pine64, orange-pi,<br>
&gt; radxa boards, etc.<br>
&gt; <br>
&gt; Signed-off-by: Jean-Paul Etienne &lt;<a href=3D"mailto:fractalclone@gm=
ail.com" target=3D"_blank">fractalclone@gmail.com</a>&gt;<br>
<br>
Thanks a lot for this package. A question though: isn&#39;t this firmware<b=
r>
already in linux-firmware? I see in linux-firmware:<br>
<br>
./brcm/brcmfmac43602-pcie.bin<br>
./brcm/brcmfmac43340-sdio.Insyde-VESPA2.txt<br>
./brcm/brcmfmac4371-pcie.bin<br>
./brcm/brcmfmac43241b0-sdio.bin<br>
./brcm/brcmfmac4373.bin<br>
./brcm/brcmfmac43241b5-sdio.bin<br>
./brcm/brcmfmac43362-sdio.cubietech,cubietruck.txt<br>
./brcm/brcmfmac43430a0-sdio.ONDA-V80 PLUS.txt<br>
./brcm/brcmfmac4350-pcie.bin<br>
./brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt<br>
./brcm/brcmfmac43430a0-sdio.ilife-S806.txt<br>
./brcm/brcmfmac43430a0-sdio.bin<br>
./brcm/brcmfmac4356-sdio.AP6356S.txt<br>
./brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt<br>
./brcm/brcmfmac43362-sdio.WC121.txt<br>
./brcm/brcmfmac43340-sdio.pov-tab-p1006w-data.txt<br>
./brcm/brcmfmac4329-sdio.bin<br>
./brcm/brcmfmac43430-sdio.MUR1DX.txt<br>
./brcm/BCM-0bb4-0306.hcd<br>
./brcm/brcmfmac4358-pcie.bin<br>
./brcm/brcmfmac43340-sdio.meegopad-t08.txt<br>
./brcm/bcm4329-fullmac-4.bin<br>
./brcm/brcmfmac4356-pcie.gpd-win-pocket.txt<br>
./brcm/brcmfmac43362-sdio.ASUSTeK COMPUTER INC.-ME176C.txt<br>
./brcm/brcmfmac43242a.bin<br>
./brcm/brcmfmac43241b4-sdio.bin<br>
./brcm/brcmfmac43143.bin<br>
./brcm/brcmfmac43455-sdio.AW-CM256SM.txt<br>
./brcm/brcmfmac43236b.bin<br>
./brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt<br>
./brcm/brcmfmac43340-sdio.predia-basic.txt<br>
./brcm/brcmfmac4334-sdio.bin<br>
./brcm/brcmfmac4366c-pcie.bin<br>
./brcm/brcmfmac43455-sdio.acepc-t8.txt<br>
./brcm/brcmfmac43241b4-sdio.Advantech-MICA-071.txt<br>
./brcm/brcmfmac43430a0-sdio.jumper-ezpad-mini3.txt<br>
./brcm/brcmfmac43430-sdio.ilife-S806.txt<br>
./brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt<br>
./brcm/brcmfmac43602-pcie.ap.bin<br>
./brcm/brcmfmac4335-sdio.bin<br>
./brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt<br>
./brcm/bcm43xx-0.fw<br>
./brcm/brcmfmac4350c2-pcie.bin<br>
./brcm/brcmfmac43143-sdio.bin<br>
./brcm/brcmfmac4356-pcie.Intel Corporation-CHERRYVIEW D1 PLATFORM.txt<br>
./brcm/brcmfmac4330-sdio.bin<br>
./brcm/brcmfmac43569.bin<br>
./brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt<br>
./brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt<br>
./brcm/brcmfmac4366b-pcie.bin<br>
./brcm/brcmfmac4330-sdio.Prowise-PT301.txt<br>
./brcm/bcm43xx_hdr-0.fw<br>
./brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt<br>
./brcm/brcmfmac43430-sdio.AP6212.txt<br>
<br>
So what&#39;s missing? Is it &quot;just&quot; the .txt config file that mat=
ches with<br>
the specific board?<br>
<br>
&gt; +define BRCMFMAC_SDIO_FIRMWARE_INSTALL_TARGET_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cp --remove-destination --no-dereference $(@D)/*.=
hcd $(TARGET_DIR)/lib/firmware/brcm<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cp --remove-destination --no-dereference $(@D)/br=
cmfmac* $(TARGET_DIR)/lib/firmware/brcm<br>
<br>
We normally use:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -dpfr<br>
<br>
for such copies.<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000009b3dbc065bbfec32--

--===============8575651743612328176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8575651743612328176==--
