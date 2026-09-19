Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01EFC982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 19:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E802407C5;
	Sat, 19 Sep 2026 19:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pq3oTOHsrdX2; Sat, 19 Sep 2026 19:20:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7229A407FF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789845651;
	b=gzvK8sebptJigkp6vckGMPf5rFDlYTFXW4xr9cmOjuDHlCQH+kJlqtMnxLts9DB0fBdl
	 TGsCEMlfTykFomLxQTox1pz94+AdEBPzFq/2acyZyvYUfwmjuH2YDudwUUdYvbI3LMwU/
	 TDvQkYi2FqFGTlkAS3Xs5lgeRB/UTWEgmIDZq4H8KAgUjgPkRGxOUrdZm85wjw5Wcxwi+
	 bv8nyvmWcenUBcsIf/x/IgOGmssN4panMCY7F82gvFZxbu/mr7KcKFbiq2KQamAFE0x79
	 wx+tbqP5Hr5pJdxNev0mbZxDKYjDvng1Wz85FAB9higi85d3/ofuMNqPqKKKG3xtt5Q==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789845651;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=c6aNoStKJzk3Sal7luWLP3PEQkHZJ7Vn9IkVcbjDQn4=;
	b=njOwCsV62j66CZH7L1SWtnU/4+GCt/wUF7VrC1vKU+HKLY5Oo+M20EKFVA1dAcUonjUW
	 1Cdet4v2St7vd74eRN62ImGuqxO4GOR2AQsphEndYube9YskK+krGdhtKbTiW7d16HO/Q
	 PbQpRiKnfhlCjjkSi9TlCHEWJMs5DjwZHM/636B6J8plrkWXwVtRi0Ji0vsM0B51Dc4pA
	 F5ENPXqeoTy5RkVH0uN/vjFuvqZ4kM7DvSex83jVHz5YL3hTpASapglh551oTLkqVkRCB
	 9HqA7vFVT6/M6YgcDq6eh+JRtu/x6PrlQcCJ0eVwMj6sN5O2tGM4upF81D8jNLtIT8w==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789845651;
	bh=c6aNoStKJzk3Sal7luWLP3PEQkHZJ7Vn9IkVcbjDQn4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EioTbvSyj2ULLhbJ/a7S4wk8E3nIpXRALVk18PR2+1YWGmhi+xpw1BkJa5gosLVbI
	 ttlWOHRtMT3l29aivdKIKXj0xarxackidu8ogn401+twgepMGl7pQZZWKcw/zKc79/
	 c7EkRaKn5R2P+CR/OlXTkXmJPZEWZ2y6IL2UTDgQYGD9GTRT6frQ+IAMns9vxcQ1Mm
	 gMl4YtC4VqsJTSoik1Ry7NoErFwB/75zo6uVt/NWpyzJ+yqvZ4gZMLHu0twfeOXmlP
	 yRJuC1alokSaHDWNfNUIhwXhtWQqdEqmkRqZrzqaLnpS2/1CxYZMOpNF2dKskKhLi1
	 HfqXhtd92H7dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7229A407FF;
	Sat, 19 Sep 2026 19:20:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D06E371
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 19:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EACE4017C
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 19:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzCRgSgJzWlm for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 19:20:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 22EEE40179
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:41::e"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789845649;
 b=gaUJi0oV253LSJ6kU1v4ppJYIlyYHArdyHOV016K9Le0KSfEPJX26uPaIwMdBRGzovmE
 jWPrcNXFOopqRmiIq9e4zTxYhs5pNzbbMhdzuL9tv39c6oS8/p73yM8wWn+TaWqowR6ii
 T7vmSR/kIPVMDsjW0kOEkS7MGax3I14MNeg7tKCgRWhj3DXf9b9DhFS/C0fzqquJS8Je4
 yE7lP003rzI//OPQ1XNpUda4fH40kABt05IaIJQwh37wvxgWXaAQgEE4LbV0IU5j/D1q0
 KXYtbzOZ5eKRSNXoJqYMO8Q30DzTaGk33bKVj+urxeEaJMANvNQSU0RvFOlsQYdlkIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789845649;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=uQkwv9oSkxfBikjvJVkOfZ0NRxO95/90J/VbG/vr0XM=;
 b=HD9qBqYBsZS5V2qRS2Srnpm93mEZDIeO6O4AmNJlHUDfD5hoJn0qbZfHAsgJnc0+q9Zh
 YVY1igcca3u6tiltM9KgsnSD68fo0KffvR+MpvLYcDYzlpIrxg3QwWzD3lmChWHt2ieJX
 wkD1nYrIOXWtZq4Y1AKBiyw7v9/I4pzCKppuMNhXJ3ltSXxOyjLlF3VGDiTMR9WZJT/7v
 OmUb0ibQP0mOfBKnAJ4QVS7Pm6lBJj7dvZy/N0KeigRtb/3VwVekDu8M9wK07hx/386EL
 7rCbMOxsTNO+wJ0Cxm7NrdQ/634xyDkA5GMkJGbWWdluit9XDT3eqlf5CGV53iiU7mA==
ARC-Authentication-Results: i=2; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=VwkfCMU9; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:41::e"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:41::e;
 helo=mail-yx2-x0e.google.com; envelope-from=fractalclone@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=VwkfCMU9
Received: from mail-yx2-x0e.google.com (mail-yx2-x0e.google.com
 [IPv6:2607:f8b0:4864:41::e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22EEE40179
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 19:20:48 +0000 (UTC)
Received: by mail-yx2-x0e.google.com with SMTP id
 00721157ae682-895eaf306cfso14489997b3.1
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 12:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789845647; cv=none;
 d=google.com; s=arc-20260327;
 b=qL8zpgkyf2u8aeBwT430HzubGBT3CDX3XRsDdKwooFWHTiz5fkTQkYYcTFTF1sJBm5
 2ru72nCf1xAuljkCRRuN2IcPhhDDtm+aqnWnwV0QGXYxq8iP4Du4XcJfTpGWolmBG3yX
 9p+NOKRXX99Xrt5Vn9Kc/amZMFSrEQgVpa5UmqFg1f+3eatrk2s4EcG8ajZ1oJpIHuCR
 vY3GQJNOl63xZZ9ZgRpRowEGnZB3smh09C3YDtTIFJL0lntJgyB5oqjiAHUGfBwccTw5
 1+rgkYXtCQTePtHJ7iIn31QdHkWIp4uD3T6q2r6DFFUv7TSaqzPd/l+XP8HjEz2J8yz0
 5EvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=uQkwv9oSkxfBikjvJVkOfZ0NRxO95/90J/VbG/vr0XM=;
 fh=t1HKz4FGwg2rlpSa7EUNbKGYl/IKyrvQ/1p5yhNuG2o=;
 b=AVFcuoZcUNzfhhjPwKJvo1bjpsoZNXHdW3KH7g1wlyiwHSiSfjy3f6EiysUm6P9Sbs
 H8fv8lwVnI0Esk0vt8hrF4bXp2sPIz4sWObeEnLmNuxNHkQMkrOA5uqJcH5bkO+eK23S
 +mVO9AZHur54RqmpDZ1dCzXXaqYN47F9CHFDDvVbfJHWo8l6wVOt7gfeD6ji5jI3Is/a
 3TJ3DBvoBXBhIrsx3wwQ04Sq5zBE+aOeVdUUqH1IxHlnntJlcUCcuNji71o4T4sfrNn3
 0Gd+MRF4KdxQU+NBIYI7Xfq4dB45VQgfZR5qlxpAk5nI9DvcHjBcVAm8rBm8PRYYWJXf
 egzw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789845647; x=1790450447; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=uQkwv9oSkxfBikjvJVkOfZ0NRxO95/90J/VbG/vr0XM=;
 b=VwkfCMU9710kRaYW1RxN/JgTv5Uz6Jws5BpBDfmB1DeAU4nRunZY9VK4z2IZVMgaCB
 sn9QBynReQq/Z89AoDXMDlQWfRjOarWrbrSIZQ6MFUEhz1v026lBp7vVKBceX1kApnve
 TQ9mxBVKAtTR+x1uIQNhGog7M7BNSu0NI4S1q7ruO52icSH+WChEveM4g24ijmDilbP7
 zgSZnR3fMBcOZUdLBRIAAAeNA+Q7PMxxB4NQkkF2/Um5K40W1q7yr8OWL5zB/nVJvGCr
 uDRrsySrKjVZe8CDFI44p272ODYImgzbEhKRVESO41D6qw5JGVF7h7Lvm3J6acvkFnp8
 Fo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789845647; x=1790450447;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=uQkwv9oSkxfBikjvJVkOfZ0NRxO95/90J/VbG/vr0XM=;
 b=KRHJQoKpUMxM7xs0hMrhyhJL1B5jDimw2IWPZAn6V8SDwtZLMpdb+LkclrxQ4FXST1
 URdXSfPisnRC8Td5bFXiRzoqN0+2c11rHRYZX62jb3PqjnWws2oKz5vZMNhElY4VHW2T
 61TUgp5A1QGrmEbXuaIgkN8WeBXDJL8VDsqAu6tYi54VZz4Bh8yHq0RwW48bRz9IJZ/F
 YqLFKVXF44Tqg8CKKdGLpV93JfUc7tuYv0iOl+ro36xpgrO0tXkewZY4PtqaJ29BszSc
 RYOU5bgFwf28DS+E2ppnmOua6xt8mVVQZWjhpbgwXJMswRjLPDLqjZyDXLXjb0o7xED5
 RDVg==
X-Gm-Message-State: AFuF++kqmz2Yex61Y0X/JchvVgOfBKVZPilxa2GJSNlQ8oRNd5YjqHJx
 nUdmdhL6QQP9gokOwdR49gEl1AUcuEbnaWlNHVkyIwlPfv7CpFq0WowRyjUM3hHeZzlvwbc/mjg
 ViWMBOwqY3ohZTP4XRZVO/qbSmr6+5oa3FImf
X-Gm-Gg: AYBFou0+DkN7iPEs6HTnatBRr1A5dd252Qf4Gru1u4wUpWlGbFfs2Q4yh1XfkX2Qgt3
 9C7wAVjhaxI7PmBB+aoEWcWyrzqGLSAvzRDN8RF3e+rQL4sxOB70idgwt0HvBCMrXLjwDuWNo5q
 i4VR6OQ/FrJb3ZAzyBZ/X5/mYEYlrqkbnuZLvf50976PsfkgJfG3LT1Vy6eK+8WKDtzIv6KG4Gt
 Hqy2+JXXfsPR2CR6D3wF9gWP8goR7T0n/7jTD6tFdqncHKCH+MVNNmP385cPpxRYnvN+KAVWknx
 3uY+6uoGg4QiMlzk1/rFGpIiXWxQ8bhdtZQZeUw4iD74rBcj28Ko+fs=
X-Received: by 2002:a05:690c:d94:b0:854:b29d:c670 with SMTP id
 00721157ae682-897306ffe74mr19101677b3.5.1789845647188; Sat, 19 Sep 2026
 12:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260917-rock-pi-4b-v1-0-a1da4ee05567@gmail.com>
 <20260917-rock-pi-4b-v1-2-a1da4ee05567@gmail.com> <aqznoUtW4EIcK_8m@windsurf>
 <CAN7e4jochVOH9Tj19YiFeeOxix=-bn4OhferJC9Mgg=j-AVsDA@mail.gmail.com>
 <aq0uT-ghEihRclnw@windsurf>
 <CAN7e4jotGmfe1y_8gR4imH1_YTKoEJJODPK6kfAtpL9hfLzcgQ@mail.gmail.com>
In-Reply-To: <CAN7e4jotGmfe1y_8gR4imH1_YTKoEJJODPK6kfAtpL9hfLzcgQ@mail.gmail.com>
From: Jean-Paul Etienne <fractalclone@gmail.com>
Date: Sat, 19 Sep 2026 21:20:36 +0200
X-Gm-Features: AcwNN1UVonGqU5HAT4U809UcfPMb123U_juX0hzgrunKsef133gtzQzlaEJcwyw
Message-ID: <CAN7e4jpdCKT=e8SY75Cb7o4qiC5Jr0w8oj-OaMmAPCDGpW5Fyw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0384268272262912222=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0384268272262912222==
Content-Type: multipart/alternative; boundary="00000000000000e62e065bdaea57"

--00000000000000e62e065bdaea57
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Thomas,
I've made an MR to linux-firmware and they've refused it because the vendor
was not
agreeable to distribute their firmware via linux-firmware. Their response
in quote below.

> We can't accept BCM43456 firmware, the vendor is Synaptics and they have
> not agreed

(and in fact a conversation I had with a VP of Wireless at the vendor
> refused), to redistribute their

firmware through linux-firmware.


Regards,
Jean-Paul

On Fri, Sep 18, 2026 at 7:45=E2=80=AFPM Jean-Paul Etienne <fractalclone@gma=
il.com>
wrote:

> Hi Thomas,
>
> On Fri, Sep 18, 2026 at 2:29=E2=80=AFPM Thomas Petazzoni <
> thomas.petazzoni@bootlin.com> wrote:
>
>> Hello,
>>
>> Thanks for your feedback.
>>
>> On Fri, Sep 18, 2026 at 01:08:35PM +0200, Jean-Paul Etienne wrote:
>> > Hi Thomas,
>> > Before adding this package, I've checked linux-firmware and saw that i=
t
>> does
>> > not support brcmfmac43456-sdio.bin firmware
>> > required for the AP6256 chip.
>> > However, while looking in the brcmfmac_sdio-firmware-rpi package on
>> buildroot I
>> > see it supports the firmware:
>> >
>> > ddf83f2100885b166be52d21c8966db164fdd4e1d816aca2acc67ee9cc28d726
>> >  brcmfmac43456-sdio.bin
>> > 44e0bb322dc1f39a4b0a89f30ffdd28bc93f7d7aaf534d06d229fe56f6198194
>> >  brcmfmac43456-sdio.txt
>> > 2dbd7d22fc9af0eb560ceab45b19646d211bc7b34a1dd00c6bfac5dd6ba25e8a
>> >  brcmfmac43456-sdio.clm_blob (default_config)
>> >
>> > But brcmfmac_sdio-firmware package has specific firmware and config fo=
r
>> the
>> > rockpi4b board as follows:
>> > 78085a816d23d9877e3ab872d8eb142646bfde18afd2c7a5b89885327a287d19
>> >  brcmfmac43456-sdio.radxa,rockpi4b.bin
>> > 343d1c79cfe0e10e1777e3de19a0302f748f69fa8356cab2c36ca0cf90bbcf0e
>> >  brcmfmac43456-sdio.radxa,rockpi4b.txt
>> >
>> > And they are not just symlinks to the default brcmfmac43456-sdio.bin
>> > or brcmfmac43456-sdio.txt
>> > So I thought this package could be useful to the community especially
>> since it
>> > supports a lot of boards.
>> >
>> > I'll update the patch.
>>
>> In what direction will you update the patch? I guess the main issue is
>> that your package was named just brcmfmac_sdio-firmware, while in fact
>> it is specific to the rockpi4b board.
>>
>> But instead of doing this, why don't you send a patch to
>> linux-firmware to add what's missing?
>>
>
> Yep, I'll check that, sorry I did not see your email early.
>
>>
>> Thomas
>> --
>> Thomas Petazzoni, co-owner and CEO, Bootlin
>> Embedded Linux and Kernel engineering and training
>> https://bootlin.com
>
> Regards,
> Jean-Paul
>
>

--00000000000000e62e065bdaea57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">HI Thomas,<div>I&#39;ve made an MR to linux-firmware and t=
hey&#39;ve refused it because the vendor was not</div><div>agreeable to dis=
tribute their firmware via linux-firmware. Their response in quote below.</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">We can&#39;t accept B=
CM43456 firmware, the vendor is Synaptics and they have not agreed</blockqu=
ote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">(and in fact a conver=
sation I had with a VP of Wireless at the vendor refused), to redistribute =
their</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">firmwar=
e through linux-firmware.</blockquote><div><br></div><div>Regards,</div><di=
v>Jean-Paul</div></div><br><div class=3D"gmail_quote gmail_quote_container"=
><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 18, 2026 at 7:45=E2=80=
=AFPM Jean-Paul Etienne &lt;<a href=3D"mailto:fractalclone@gmail.com">fract=
alclone@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Thomas,</div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, S=
ep 18, 2026 at 2:29=E2=80=AFPM Thomas Petazzoni &lt;<a href=3D"mailto:thoma=
s.petazzoni@bootlin.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hell=
o,<br>
<br>
Thanks for your feedback.<br>
<br>
On Fri, Sep 18, 2026 at 01:08:35PM +0200, Jean-Paul Etienne wrote:<br>
&gt; Hi=C2=A0Thomas,<br>
&gt; Before adding this package, I&#39;ve checked=C2=A0linux-firmware and s=
aw that it does<br>
&gt; not support=C2=A0brcmfmac43456-sdio.bin firmware<br>
&gt; required for the AP6256 chip.<br>
&gt; However, while looking in the=C2=A0brcmfmac_sdio-firmware-rpi package =
on buildroot I<br>
&gt; see it supports the firmware:<br>
&gt; <br>
&gt; ddf83f2100885b166be52d21c8966db164fdd4e1d816aca2acc67ee9cc28d726<br>
&gt; =C2=A0brcmfmac43456-sdio.bin<br>
&gt; 44e0bb322dc1f39a4b0a89f30ffdd28bc93f7d7aaf534d06d229fe56f6198194<br>
&gt; =C2=A0brcmfmac43456-sdio.txt<br>
&gt; 2dbd7d22fc9af0eb560ceab45b19646d211bc7b34a1dd00c6bfac5dd6ba25e8a<br>
&gt; =C2=A0brcmfmac43456-sdio.clm_blob (default_config)<br>
&gt; <br>
&gt; But brcmfmac_sdio-firmware package has specific firmware and config fo=
r the<br>
&gt; rockpi4b board as follows:<br>
&gt; 78085a816d23d9877e3ab872d8eb142646bfde18afd2c7a5b89885327a287d19<br>
&gt; =C2=A0brcmfmac43456-sdio.radxa,rockpi4b.bin<br>
&gt; 343d1c79cfe0e10e1777e3de19a0302f748f69fa8356cab2c36ca0cf90bbcf0e<br>
&gt; =C2=A0brcmfmac43456-sdio.radxa,rockpi4b.txt<br>
&gt; <br>
&gt; And they are not just symlinks to the default=C2=A0brcmfmac43456-sdio.=
bin<br>
&gt; or=C2=A0brcmfmac43456-sdio.txt<br>
&gt; So I thought this package could be useful to the community especially =
since it<br>
&gt; supports a lot of boards.<br>
&gt; <br>
&gt; I&#39;ll update the patch.<br>
<br>
In what direction will you update the patch? I guess the main issue is<br>
that your package was named just brcmfmac_sdio-firmware, while in fact<br>
it is specific to the rockpi4b board.<br>
<br>
But instead of doing this, why don&#39;t you send a patch to<br>
linux-firmware to add what&#39;s missing?<br></blockquote><div><br></div><d=
iv><span style=3D"background-color:transparent">Yep, I&#39;ll check that, s=
orry I did not see your email early.</span>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a></blockquote><div>Regards,</div><div>Jean-Paul</div><div>=
=C2=A0</div></div></div>
</blockquote></div>

--00000000000000e62e065bdaea57--

--===============0384268272262912222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0384268272262912222==--
