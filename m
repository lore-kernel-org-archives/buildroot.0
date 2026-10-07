Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9552ACA5FF1
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 11:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5540B606CA;
	Wed,  7 Oct 2026 11:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f58iKLdSPRhl; Wed,  7 Oct 2026 11:17:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 75147606A6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791371832;
	b=aUrLvUKqEOMe1y6LE+XxiLiKiYOEQaWOYCQ6ppMAAS7mTS1xlNaU+LG2oOeT/c3eIcKP
	 pvofZDKh6Ysebh2N2/HrthIdFeXzDDUkm2E9phCa0IWeQ7dA3iRURoGwjt3N73vEKDoY8
	 nSXXzBtANzgFSKvthz+0KKHNvTHHyRBIQTXZfgkpLOd+G87JbxY8eIpsEe2xEdL/2FISE
	 OyqEoshtMNkM7v2H8vVIp7qhertAjgv602Vatf+Kz3AqZmQ3U5227ciBRqkiu0uX/bLXb
	 FJYoNiTyuUhUFunRwuHDDgCzFDgrDZyxpKZKRz6crzxfzwNToWe+ZY6O1TnLWbXosbA==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791371832;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=2IuuO7O9EoIZnGbD0pCPKtEu8PgO4JSG8e0mZIAOcVM=;
	b=K1fBeHZeyiHwK9c+Vl1KwngB/ETk4FC7ihcoqmbf9h7QEAeDcHR9C3HTdycIqMCjdie1
	 A7EHAOD7L8UYkOF29ybivu/mpt5atg5hnozS9aiD77vPIKDqdVk/RMjsTvZuztT2iEWUQ
	 /22zfo0nbkpTzeDh/2m8CiXmZUAc5AJ+6ReAT/bOMu372AgnhYHCK0iBtVyqGkFQE43g0
	 4REsUPgml9UZjPRoD5oEst+Ys6L4DsQtVU1Q6uD4hmKLGkRWJ9sbo0hNLhDtPN29nrWvR
	 GsjSAeNYu4SiFb7j3Y+M3x5canosoQsQhkxR0guN1HvOwmLrl9h8Lwc1I+NOcrc2QTA==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791371832;
	bh=2IuuO7O9EoIZnGbD0pCPKtEu8PgO4JSG8e0mZIAOcVM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AQ5N7Jh0r5+si/Ch0AZ7BpOXJDbeICLO2N2WWBGGYTOWv3rre7j0X5iBzUIU7dJBm
	 Xupj8oOiOGw62jBHe3GG8lrs1ileifFxjlnW4MQKiAjXjXxHVlPpCD1gN3yxHFt2DS
	 6JqEGBawzxMS+gJrDbD3Sc7aDgJUSE1qgLrumb/OJuPJogt7mLFQQJ7GgdpxuAJgTF
	 KmUEYqcwks6pDOP/+Rk0fsaPe0Rh+/WVHhmZqaTXXfSEJ59A0Dcy0f2tbNP9oP2uCR
	 Lef8k6sH5aJHWN7ha3lrhIDdzx4jyKAuv1w3Tyy7jMNqJDkmdhgqvjMKVE34+reG86
	 a08wO/fPogedA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75147606A6;
	Wed,  7 Oct 2026 11:17:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ED60A32F
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 11:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE6194062B
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 11:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XsM721fnTLb7 for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 11:11:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DA506404EB
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::b131"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791371499;
 b=oyl7VoNFxbq8DrvBHVu0Lx9JF2gntKRRQI3yonHQlBZFQnM4fIqaQ9kkVwY1SgWULuvz
 s+i9NMMh+mUT4Pi2IfCNeKbHQLfUtowupu2FoKG+/h158+ntLiyvoxxqfz1wen1SI9szs
 iJOVd+y7w8nk45mdwk3WR4lbabd9NTnrOLdIlg3MGEU6PGJwbiUuyWXF4+PC4i9KKQHTk
 VuWJaPfyR181zZNov4L6Mq6Hn3xsIi0Do5DriDIWcQFC1o7vTpXH2ofW9Yqxr5IhzGMFR
 WMPe5fIHzYYmJC9UISkjpZEvwq8X+2LieKVTLac5TBaPMENySTN378sKVBVFU9I+GVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791371499;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=/aHNoDY3wzVkYB4LabIfU8fhtk92J2aw6xCos/58Os8=;
 b=oKZm4iYuuFQ5eJSeq7bxxrQKv0r8O3FW+JMNos/gaPElOghNG20N3BT+vqSr6g5UtDbe
 sESz/shQvCclhxPY+43EV2xI9WCHDKhJrdFkFGs6C9NWN4UnGNFnnsqSchvit0Bp7KGgH
 VMLoDkzsMMBR9J+J4WFUKj6WS9gIVv9/xd0HInO3CLnbzKB04uaXyhZYDcqUFllO7x8nk
 l1mdgsn36TqGbIfn9iAYQ+h8ypXSTp5cnPhOfSU9aZOitA0Quq8+8Tc/OdF2m9mL+21sY
 FlvCVulxoQzbrpVtQ5SKQdo99JGQSepaKvXC0npGSzlRnTYbsXeMd/7VrLG4JI8jExA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PjBDqfXE; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::b131"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b131; helo=mail-yx1-xb131.google.com;
 envelope-from=fractalclone@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PjBDqfXE
Received: from mail-yx1-xb131.google.com (mail-yx1-xb131.google.com
 [IPv6:2607:f8b0:4864:20::b131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA506404EB
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 11:11:38 +0000 (UTC)
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-675617e81f9so2001617d50.3
 for <buildroot@buildroot.org>; Wed, 07 Oct 2026 04:11:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791371497; cv=none;
 d=google.com; s=arc-20260327;
 b=Cho9dHwO1dlaszmbJH11/6z+enWcdyJAtwg4uSuuLlczUuor7Gf6O1ea43gwVi2/lC
 jJUhcaXnrl9pAsijTFu6Qxfo3T+1WL9EdJYchtjf7uSLqQhgId02jz97ixVGrabeacee
 Nv/awtMrJLgoG2Ven0I2cDo+j3+yM+1QMFVa0uQDBPMvLcylNKe1EROHX7uzq9yvDulh
 S/8uDvRjXYoLJc77WCpn6W9bG6suaFKoHAsCae8sIFJmW76W+0yBj7NKMVcgM3ThPJk9
 1t4SRnL3I7uHxQmHPSdpFbnsq5CO8P7kNskfDSIO2wV4zhxawosYNaGXXcY9InZnvQqi
 lxZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=/aHNoDY3wzVkYB4LabIfU8fhtk92J2aw6xCos/58Os8=;
 fh=t1HKz4FGwg2rlpSa7EUNbKGYl/IKyrvQ/1p5yhNuG2o=;
 b=pfakkQl42BJcPQi64ospwcaBHUCzGmRcnP4rmy3PCjGp6vZ0B4TMa7En8VKFo2tRpf
 mg7kjsfPnoDrZ+LIrknTSDIIETUxqK23sFnfM0WHpoUEv3RLXqINJE3c3B1ian1ZZnzT
 PdsTY292EPcFfSHnTWqzmmKo0JFw4d2I9SLsP1OO4wlfMks1RA1x8Ze1RvRc3g3xtx/9
 Z2o4kwc6p4sQE+/H+HOtN/C3pxebM27A1CcNS+GWNGEvsYHgGzMRRsVi1JmuN5TTvtGT
 8iO79OIurq+QUyaeN5w3QIrk7Z533EOzoOrFiSFPJdIngh1vzXo+DJGYeH0eZiAbSh+d
 r9hQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791371497; x=1791976297; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=/aHNoDY3wzVkYB4LabIfU8fhtk92J2aw6xCos/58Os8=;
 b=PjBDqfXEuSw7cfT7pKXWHc6EQFPfS+llYDEjsOlRa4+I7iPQVtPK9YkhJIncRuRXr0
 hA4MEfuhgnHX/pV11aMzoR1T7eTzzAINvwpa2PSk0MAYxGVI81OarJbGLvKn9Ffd9s+6
 NRNMefefq2LNGWgp0YpPjRRexJNdyPOQ70UiN2HIWdAxzpYcJj3Iqw70PxDfcRbp3IiF
 P+y8j9X71ekkMeolC7PenvDZrx630gwmMXQLzOxPc8DiY1c5G5t2klhVJFBg9TwJ7HzD
 96AVzD5Crh7SaZaoYCyFDN3hQmPuiysXyg9HSXTIfYMcxqTSSRdSvZ+V1WNyaDYxwV4t
 ljVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791371497; x=1791976297;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=/aHNoDY3wzVkYB4LabIfU8fhtk92J2aw6xCos/58Os8=;
 b=UBv83jBVVXo1vfhTFCBHLBS/w3R8NX/iwshH4LvcKWtbXZ6aZ8M2Xql1RBgObWVIFp
 5j/78YtPImR0+mlUeV4Gm0q0mAd9cLyXwtQShTx+ZuY4srTUVuLL76USF3w6X6vFoAZu
 FoU4fWz+KcFQmhI0XpuXzk0sV9xJ+OCtAAwvQ2B4n6LypQBmxzUNvzKL4lWE+3exV4qo
 unIh7uhIWtEQfWVaUD47tijWMv2qiJfLL4DCWmbPnri/U+uxSx/rJ5sfQH8/Xlnp7U2m
 nCC8W/ymqeXJRHAgA+owWJisNgp7wlR2nuM9kiu4A86nG9KmyO2Y48x8sF1XKwRFvvk9
 4IBg==
X-Gm-Message-State: AFq9FYLqGUyj0dcIehGmgXclb4rgGO9oZpauBNbUVnwGYOjNp25SRLs2
 cvsEIwVfU4SyNjt34kZb8kV33gxiBn+87oaGW3K9svuoAOjbozYy5yMvwRyXOos2gCwSHEFHB4j
 4ZfESmJR9g7tLyofEnbEHV6Z/LIpF7Z4=
X-Gm-Gg: AYBFou2CTcqSbz8lXNa+nEMOpFrDCm2Ky4WUz+5y2Hq2ifyUF1X2OtswQ0UWQKZI5s8
 Em+1vRWsJHqOqWOLZdBalDuST/pdTez16UkjWt93sW8cEX+s2huMf3zrnlCxEBKXcx3WLKbPcks
 ovTTjAff2GSH0tYLakpxBW8ZVK1AJu56cwEXBoo8/CiraDzzRB/s0nn1ja/03VT7dsiaaCDg1xW
 UuRygNmRDOC07Ea42lMkaEttpchqmW4IY6V8HgY2XHCyITr0nriQEGNRoLcXfeIHYNMybxzLc0A
 axl8NZx8aoQhsNYLSB8NTJbws0StMABuD2z9MvdnPiC/ISqT2TE0
X-Received: by 2002:a05:690e:4849:b0:675:4453:fb3c with SMTP id
 956f58d0204a3-6790a46ffa1mr961582d50.64.1791371496990; Wed, 07 Oct 2026
 04:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260917-rock-pi-4b-v1-0-a1da4ee05567@gmail.com>
 <20260917-rock-pi-4b-v1-2-a1da4ee05567@gmail.com> <aqznoUtW4EIcK_8m@windsurf>
 <CAN7e4jochVOH9Tj19YiFeeOxix=-bn4OhferJC9Mgg=j-AVsDA@mail.gmail.com>
 <aq0uT-ghEihRclnw@windsurf>
 <CAN7e4jotGmfe1y_8gR4imH1_YTKoEJJODPK6kfAtpL9hfLzcgQ@mail.gmail.com>
 <CAN7e4jpdCKT=e8SY75Cb7o4qiC5Jr0w8oj-OaMmAPCDGpW5Fyw@mail.gmail.com>
 <aq-ghf1VzxlgtHpn@windsurf>
 <CAN7e4jrtoeqcmEPECsEX9GWmxe-B-8khQYXOPqm9UBAZOEUpCQ@mail.gmail.com>
In-Reply-To: <CAN7e4jrtoeqcmEPECsEX9GWmxe-B-8khQYXOPqm9UBAZOEUpCQ@mail.gmail.com>
From: Jean-Paul Etienne <fractalclone@gmail.com>
Date: Wed, 7 Oct 2026 13:11:24 +0200
X-Gm-Features: AclHuK9sXyiQczl98CySi45AOKArqiPShbthjZbUycDdaOiyfB6FpVkiJdKmzVQ
Message-ID: <CAN7e4jpAMRduxWF6nPLUphR_Ju1PbuTXGiyGM6ts936pw72tbA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8942965907329922288=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8942965907329922288==
Content-Type: multipart/alternative; boundary="000000000000bd3090065d3e2d24"

--000000000000bd3090065d3e2d24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,
any news about that?
Regards,
Jean-Paul


On Mon, Sep 21, 2026 at 1:29=E2=80=AFPM Jean-Paul Etienne <fractalclone@gma=
il.com>
wrote:

> Hi Thomas,
>
> On Sun, Sep 20, 2026 at 11:01=E2=80=AFAM Thomas Petazzoni <
> thomas.petazzoni@bootlin.com> wrote:
>
>> Hello,
>>
>> On Sat, Sep 19, 2026 at 09:20:36PM +0200, Jean-Paul Etienne wrote:
>>
>> > I've made an MR to linux-firmware and they've refused it because the
>> > vendor was not agreeable to distribute their firmware via
>> > linux-firmware. Their response in quote below.
>> >
>> >     We can't accept BCM43456 firmware, the vendor is Synaptics and
>> >     they have not agreed (and in fact a conversation I had with a VP
>> >     of Wireless at the vendor refused), to redistribute their
>> >     firmware through linux-firmware.
>>
>> Meh, vendors. OK. But then maybe we need to find a better package name
>> that clarifies how this package is different from the other brcmfmac
>> firmware packages? I guess everybody is forking this everywhere to add
>> its own variant that contains board-specific tweaks?
>>
>
>
> The other package name is brcmfmac_sdio-firmware-rpi, which contains
> WiFi and Bluetooth firmware binaries only for raspberry PI boards.
> The brcmfmac_sdio-firmware contains firmware binaries for other boards.
> I've named it to package brcmfmac_sdio-firmware so that it matches the
> repo name
> in github. The repo is maintained by LibreELEC, same as
> brcmfmac_sdio-firmware-rpi.
>
> Regards,
> Jean-Paul
>
>
>
> Thomas
>> --
>> Thomas Petazzoni, co-owner and CEO, Bootlin
>> Embedded Linux and Kernel engineering and training
>> https://bootlin.com
>>
>

--000000000000bd3090065d3e2d24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Thomas,<div>any news about that?</div><div>Regards,</di=
v><div>Jean-Paul</div><div><br></div></div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 21, =
2026 at 1:29=E2=80=AFPM Jean-Paul Etienne &lt;<a href=3D"mailto:fractalclon=
e@gmail.com">fractalclone@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi Tho=
mas,</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Sun, Sep 20, 2026 at 11:01=E2=80=AFAM Thomas Petazzoni &lt;<a href=
=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"_blank">thomas.petazzoni=
@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hello,<br>
<br>
On Sat, Sep 19, 2026 at 09:20:36PM +0200, Jean-Paul Etienne wrote:<br>
<br>
&gt; I&#39;ve made an MR to linux-firmware and they&#39;ve refused it becau=
se the<br>
&gt; vendor was not agreeable to distribute their firmware via<br>
&gt; linux-firmware. Their response in quote below.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0We can&#39;t accept BCM43456 firmware, the vendor i=
s Synaptics and<br>
&gt;=C2=A0 =C2=A0 =C2=A0they have not agreed (and in fact a conversation I =
had with a VP<br>
&gt;=C2=A0 =C2=A0 =C2=A0of Wireless at the vendor refused), to redistribute=
 their<br>
&gt;=C2=A0 =C2=A0 =C2=A0firmware through linux-firmware.<br>
<br>
Meh, vendors. OK. But then maybe we need to find a better package name<br>
that clarifies how this package is different from the other brcmfmac<br>
firmware packages? I guess everybody is forking this everywhere to add<br>
its own variant that contains board-specific tweaks?<br></blockquote><div><=
br></div><div><br></div><div>The other package name is brcmfmac_sdio-firmwa=
re-rpi, which contains</div><div>WiFi and Bluetooth firmware binaries only =
for raspberry PI boards.</div><div>The=C2=A0brcmfmac_sdio-firmware contains=
 firmware binaries for other boards.</div><div><span style=3D"background-co=
lor:transparent">I&#39;ve named it to package=C2=A0brcmfmac_sdio-firmware s=
o that it matches the repo name</span></div><div><span style=3D"background-=
color:transparent">in github. The repo is maintained by LibreELEC, same as=
=C2=A0</span>brcmfmac_sdio-firmware-rpi.</div><div><span style=3D"backgroun=
d-color:transparent"><br></span></div><div><span style=3D"background-color:=
transparent">Regards,</span></div><div><span style=3D"background-color:tran=
sparent">Jean-Paul</span></div><div><span style=3D"background-color:transpa=
rent"><br><br></span></div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>
</blockquote></div>

--000000000000bd3090065d3e2d24--

--===============8942965907329922288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8942965907329922288==--
