Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECA9C88E72
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 16:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D721810B8;
	Thu, 17 Sep 2026 16:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6-A7zjKTsRa; Thu, 17 Sep 2026 16:10:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A6E77810B1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789661449;
	b=i3QSFt67cAzS+79LCFHTZskZNC66o8ToXI3ALPg9g7Lt9b9JIObfD3Eyy1sWS6Env+wN
	 pV6bOC1j0hiHiiDKpXFEIA9d/AExE4jtDMXGlNsF5PHNk4vP9AHH/RLSecqExJhkw+Oyh
	 I/7XM2npMYLPcSnZaanmCmkHAEAQc00zzwdrnNkLhhiXLbn2YOufGSRHRur001rF83dSh
	 eAbUgrLLAInpSPPiwtQbiDVV6i0DNKCNTbUxPBwGXI4gARLAMhnMa7UWqKezjfxR/bAxF
	 PeVaJL21mnTpTYLBctPrH8uCySH5ryZXxPR/OohY8w5ajFUFFGlJK5O3k4AQWtHTliQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789661449;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:From:To:Cc:In-Reply-To:References:
	 Organization:Date:MIME-Version:User-Agent:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:Errors-To:Sender;
	bh=Lj2AMrRIEtAgcVLS8uXFC2eKDe2tXU0aD4hRw0WQe4w=;
	b=FYEPG59SNNQLiWrei2dCTCiPicdCblcXo5oAFHlo41P/JeK0D/t3urxeaDY7Q3N4OJlm
	 19C4teHfxWar/NogRHXKX/povrrMooSvEohuI5mMniL7Ddy9Q7zT8Gs3sMF3mcPb/8ZVY
	 IhQEf3wulVghMp93hPDWwo2IiWHG9Gm2A0eKx2xjiBn0KuLPtGILTnJ4OCfQ0GTBDNDPq
	 lpVLu8vg5KobXtngFAGnCNkLAJDSLtVYO08HpwLaR65pyla7Fhx7saK4jk7tNiwKQxWGO
	 7kYI8X/Sj4Ve+pLG/bXvLN20B115InD+OmoJvgsQgXg48SLTityn7g5t3rDvqqTZbeQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jTSsjLcN;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789661449;
	bh=Lj2AMrRIEtAgcVLS8uXFC2eKDe2tXU0aD4hRw0WQe4w=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n2TFzNQLirIYee/IOqPGEx/xuu4wcF7g5+p2av94MZ9X9KNL6ynTOU+rswgflqJop
	 HqFiBBgFNj8zpGV+Gd3OHLw1W0aP7BQYyL8f/nYhlKQaJd2aFPBR3vSWg6x1mKCdU3
	 Oxzfp1ZnCuXu4hDveWJnRjMAK/yxHPjMGn/Y3V7p6e7GwPldR3TDSVytpZvufDXlqU
	 wCQParULc1IPDcwz1HAy+sl/EQCju41Fwz0J3S92j66Lk/PeDePuu3JEJHFtJjraxA
	 gSK71HAfR+5moaqen2DtpvbB9eg/u+uzf5BS44Vee3Tawzp5sd8IyCUJywiBmcGyOP
	 4XoDuWyjqlpcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6E77810B1;
	Thu, 17 Sep 2026 16:10:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F38E465
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 16:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04D60810B1
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 16:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L_N5QBsgFzvk for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 16:10:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 288FA8108D
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:33::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789661448;
 b=Z8WQ7Fy0vvWHWBwLnQLYGJ7l9NGWM9imt6LRHROxtTGIxaXrvOJUBi5YrCXC3XSJqF6D
 ++xSv0P0495l6d8lU7GNpCjgkf5wXEEvlgYovdXLH38PK9Hn+QHYbql7f/mqU7ngBJ6gE
 qkHepst9KChjJkUDmc4aqtiW89pqrvhITrbvcsjQuo1wjjjQD5D0iQqHq/534Lg1rO9vW
 i9lIcl4JmJy6DUNPD8qN0rYq0IQWhjuaK/LMXGKMclSPZD3R0gYRoSYnDrNotz6vAS/SW
 umG2tczqqa6QXbZocPyeJcWEWXV8vENMZjuc3bq3SPo13HPXHQKD8CNFdDOQbnMkpKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789661448;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
 From:To:Cc:In-Reply-To:References:Organization:Content-Type:Date:
 MIME-Version:User-Agent;
 bh=CGQySzqc9SE8WLN0Z73fAaEyYPpw95hKL0cqCSPlu+c=;
 b=BK475aLrRVluLEuBJ00dgZ+XVJqIvkksRddsE8gbSKlsWYPJRbROp+fVEdg5581uYYOB
 EcP+yjyGPVYVuJXjAn0bA6ivm/Jsn0rEN818mr0PwUdPyASvQpNuSamQbSDSy+wybDNX8
 890nkpybbEWjE59PExwrOXStXEbi/eYnYVNP1E2JKaHYjNRImNEVfCY4rqfoEHBZhiqME
 mc6x1Sb/ay0gAsCyC6JLOI/HoOGs0ZxcDQCewfM0djFAVs1WYaSg1SEyJbbl6ryOlJwxB
 x9eFMDHM9RPZh2YHnmDBkQ40WMz1zm/MP6t4vEI80MygvgUT8D1Nl4GIQUIqsvEoUPQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jTSsjLcN; 
 arc=none smtp.remote-ip="2a00:1450:4864:33::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:33::10; helo=mail-ed2-x10.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=jTSsjLcN
Received: from mail-ed2-x10.google.com (mail-ed2-x10.google.com
 [IPv6:2a00:1450:4864:33::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 288FA8108D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 16:10:47 +0000 (UTC)
Received: by mail-ed2-x10.google.com with SMTP id
 4fb4d7f45d1cf-6a985e8fcddso1503351a12.3
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789661446; x=1790266246; darn=buildroot.org;
 h=user-agent:mime-version:date:content-type:organization:references
 :in-reply-to:cc:to:from:subject:message-id:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CGQySzqc9SE8WLN0Z73fAaEyYPpw95hKL0cqCSPlu+c=;
 b=jTSsjLcNM2v0OO5vi3F8MY34fWRlYrJflWVe0FMQ/zOvGF8iW+TXyOYedH69mvGFz+
 3RZYeVXNQSHWewwCh7TzSPuwWaZUxvyvn79RcRhK2NZl5vbbgTRw2OGvl3jgoBLKGlIz
 8lMaQCamdp4aHTAROcLi7HoqWmIdkyO8JQJ6OiTomUbzv2pL0pk9WpGh/1oLOlOruIHl
 q1m/rJDembLTGMzjzuSyvQ2BcIm46/+rJ9jvJ0uOLXVr2s4n3h/Pf4aE275lEm/eY9lu
 Y3FAVs3trjUn/7gamI0NznSElvVmuog2KaLaigpx5VzH2o/cS7mtnLKKMQFL+lWx8xKy
 meJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789661446; x=1790266246;
 h=user-agent:mime-version:date:content-type:organization:references
 :in-reply-to:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=CGQySzqc9SE8WLN0Z73fAaEyYPpw95hKL0cqCSPlu+c=;
 b=QpagaGazVDYCW16OOf1yrOcQbaMo7JSrbyc8xsP4yDd0ckLKVhd5LuoQmoWkBzioO2
 Erk52TGP9OcSU91qkAjcY3rEb8fr8s8QtjmMlOTkhBhABZPFoVquXJmCze4gZnWgHMRD
 nyPjCFzu+ErpPRSlP/GWrSSH+S+A2oVqOqWo41BTcqPlubA+L73XnwOXX771mLyJZLvW
 SFXr/H3kKQtnH1WM89uLW8yiyeCykQgPgigtTlozphZ7hhDl+wJ7XbYappfK44SZiUl1
 WsEixKzPCIO0EwKof7d5Th/W1o1Q2WqNS+XJ8XcNJLNPMcVVDbBhEIZC88sgsIu7TD4O
 4M/g==
X-Gm-Message-State: AFuF++molBIepQcmBKcNl8OWw5uJSdlpX7GmVVvnEF59Kai46xI7BgP/
 DgEO1ThVMuBWnA3tJ7EjFnsVVRvfoFzo//MRmRzXjFYkD4pH5JmO8dQR5T71WQ==
X-Gm-Gg: AYBFou2RwkBu/hCheg1GnR0zbDG9KRdlYL5BEl2IPsxoSsJlKA8x4ohbN1JnR0xCLL7
 x9BMnVAZB7TVwNmLQtCKi9NIpPeZj2/DuF/668BBR6mW6aB9rXGU4fIbDsue81+ATpWPhXXRY60
 lItnQ78DaOqM/qexJcw0Z9ZHRXj5EXdW/pYSU03rvgRiX8i8BV/NsKbR3nj1rynM7/BnpBX9HY+
 lNxnz4QCKb2vhnuaJM2fPK/797wzUA9tE/Vlnv5mrKO+9YgN9KiEgxTygePo1LjAr7shXoIgO8N
 C5W6OD5zoVQG9RG+TFsdszSJCAG6jiNSU93lxwtnDBXIaH/ViLCIW0h0BaxUF95b7pspfHOL32K
 1kOW3UOuiEEMBr4SPZwLKEUk1O1uvrVhgL+1MKRV4GnqqbIg9Dn35wXz6GeBISyV9bxcIVUF/Y+
 YlTG7ZB4adRbQD/KJDYq5PX6VBe2wpTTXjXh5dYlB1+axkIYhFQ7MQW+nQZO8yZHMqooHrzRvnm
 UiZEZHG1JDWscJRRyGnAMvELHMrGKpAdN5w
X-Received: by 2002:a05:6402:5d1:b0:6a8:59aa:214c with SMTP id
 4fb4d7f45d1cf-6aa2224bd63mr5569456a12.11.1789661445415; 
 Thu, 17 Sep 2026 09:10:45 -0700 (PDT)
Received: from [192.168.0.200] (h-158-174-22-6.NA.cust.bahnhof.se.
 [158.174.22.6]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6aa1d22898csm3760447a12.5.2026.09.17.09.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 09:10:43 -0700 (PDT)
Message-ID: <a9018d75e62870d876eea9e5c00709c1876b22c3.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260917160543.243218-1-troglobit@gmail.com>
References: <20260914103020.3485030-1-troglobit@gmail.com>
 <20260917160543.243218-1-troglobit@gmail.com>
Organization: wires.se
Date: Thu, 17 Sep 2026 18:10:42 +0200
MIME-Version: 1.0
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Subject: Re: [Buildroot] [PATCH v2 0/2] package/mrouted: bump to version 4.7
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
Content-Type: multipart/mixed; boundary="===============0909418773323169579=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0909418773323169579==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-CMpk1IdPC5HPimuKm0b9"


--=-CMpk1IdPC5HPimuKm0b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oups,

so sorry for the noise this creates! I somehow messed up my patch queue
so please ignore this series.

/Joachim


On Thu, 2026-09-17 at 18:05 +0200, Joachim Wiberg wrote:
> Thomas noted that the S41mrouted daemon-path fix is unrelated to the
> version bump and should be its own patch, so it can be identified and
> backported to the stable branches independently. This v2 splits it
> out.
>=20
> Changes v1 -> v2:
> - Split the S41mrouted fix (invalid /sbin path, executable bit) into
> =C2=A0 its own patch, 1/2, and note the commit that introduced the bug
> - Patch 2/2 is now just the version bump, unchanged otherwise
>=20
> Best regards
> =C2=A0/Joachim
>=20
> Joachim Wiberg (2):
> =C2=A0 package/lldpd: security bump to version 1.0.22
> =C2=A0 package/lldpd: rework start script
>=20
> =C2=A0.checkpackageignore=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> =C2=A0package/lldpd/S60lldpd=C2=A0=C2=A0 | 80 +++++++++++++++++++++++++++=
++----------
> -
> =C2=A0package/lldpd/lldpd.hash |=C2=A0 6 +--
> =C2=A0package/lldpd/lldpd.mk=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A04 files changed, 62 insertions(+), 27 deletions(-)
>=20


--=-CMpk1IdPC5HPimuKm0b9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEShHhOTSGNO9JnOys7Kgmo3tsdAkFAmqsEQEACgkQ7Kgmo3ts
dAkkfQ//aGDsqbeGyFcA4R8DMMl5kdH6fzVxG+tMsCckkPDNAehG9YBz9ngozEO1
OXydjSWYuk7zL4AKWuwQpqP5OClewOD9ikT7bymcq+Xl7rilwD85b3bvHtk3lFdK
VbHcwQBRDG+so6+mXBWm5tsjqNCKKek8A1JSePvv7p2+ZFSMCKaJQrkXV19yswXR
BNgIfOOx7evLNBG8d582fnAlSpwggMQZsv9crrUcoWtwRmvWWW4/yOqYuZY1irIi
mX4AKjXChw6G3dab7lUAj/DtxXpiwc+C2REr+o3COwUaapFExJrnYuht/X6zYQ6/
smhUF5CX9/iqh+BPnnnC3To5PTsjVTZ1FNjypgSqEgMjnG0nBXoQJVMNo9Rc/5B+
M7DoLrK9bpmX0fbg02jSznSwZwhr70A2f7+CjH8nqgiehjSWYSmBy+NsZSy0fdy+
fwfL9KzkNxENjgOWNCGcK6OmwvWfaKJx2um+KTHzv+wRTn2jSZkFsmddcuK5Ijqk
zQNRnmiHM8Knzk1hv4Uexa1PuLRBiT0Q8d1KL3jOO6md0ud4ZK+Nabg3MTcom8l6
3nepycL6yXbTA7NKOQTiBtxZK82p8QV048Pv2vkRGWrojBs591XUNKNLG6L7evhg
HnCeUn/yBdTmSInlM2COeBBTGmW4A5AoNrOPv+IZVjuxl2s8Sck=
=wY/h
-----END PGP SIGNATURE-----

--=-CMpk1IdPC5HPimuKm0b9--

--===============0909418773323169579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0909418773323169579==--
