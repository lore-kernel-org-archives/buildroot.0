Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDECC624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 10:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E07328112D;
	Sat,  5 Sep 2026 10:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_AOsNJSTuuP; Sat,  5 Sep 2026 10:42:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5152181111
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788604951;
	b=lvgJg27DPKGyR+PBN/EgzLXu8gXXNPgC30cpg0Np9RwZCFzQKuQvVLPOlRaPhoPmBlIA
	 ODhVzgCmgXh6eNtHYB3DZ8HmcB/x+CCAwGh2FcvG0ELtXn8Nsp7loU9pUXfhqlwndK6qe
	 0n/xJA/5dk2I/EKUiDjUnZ/2exLjW+ZBS05nJdtYUzD0VEdR7D9qg2o/ocylHD+LYrT4k
	 1sy/ho+6h5+UCMaQkuPpcT3VMo0XaKIFRrM4WxTF2f3o4vVzNsk2f07ocCZxctUEhbFxa
	 o1aQngWPPSRGJhIHYaCY8bFAYdteFzz1wLqR7py9D6Wm5mHLulFP8TRR8wB5U4XXOMQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788604951;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=o2GYkxd8/9fJkhgWHALqi9kk9W0BebvIp84J8YuS2ac=;
	b=UfvKXEEHSwuXX3v6h9f4nnm/879mpYHVnySyb0WO663YizMNBNe453q6I+KNnSgpGCHX
	 1dHTMHIsGpdlG0zskhPzJV+Wz8UFyRpOlZRapLbc7BkHS21L3mi7PQiHWUWztvpTModBj
	 z0sKemw31hAYQEsY0C0+UUCmU0wtT8W5XJibKdEwmCWUQHWgsi1eCO+F0SxF0Qu8gS5uy
	 vUWDBahmWSwV6BQQ0DSA21EWzbb99ui5JyYyC/RDnqRN4TdHyJapQnO5EVpwzq8asOMHI
	 +HZgcSbXjT4RZ0UW+dPg8FQLJrRgvjra98Uy630Zx34LYJLBi6zunb3p4vPucb1yQdg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788604951;
	bh=o2GYkxd8/9fJkhgWHALqi9kk9W0BebvIp84J8YuS2ac=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=r1Rwu7u4ix12jMWp7m7ML3EtdLpGTMfttfaA9R2/Afbhu/j6GSKK5yo4netZWLcwk
	 4cd/P/nU6eLVIlWplo3Siqsijnr4OD2YJtZrJLZb8vEaYV079O5HKCosX7t3yK0gES
	 v6UcZ5y8HAXSBhO6XGctQFQ+IOglbFpuAKACfGT4vuDj5+w+LF1qi+Z8lZMMa7NX3U
	 o6xwIa2iTN0f0nceqRkcaReyJpdQ5cwE5B+pqk/80tuIzoKp3Z5MAJx5pax8krKfSR
	 r5FCzY3elZBNc4ihDu/CLI6vCFbHUmFfx/eygqHJhyJLKbbEhh8BwWI8sJYxdRgQ3J
	 GYKGPMmgz+xAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5152181111;
	Sat,  5 Sep 2026 10:42:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D0AA2FC
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 10:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E9FD60BF1
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 10:42:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ZSJn34sjHbg for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 10:42:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0DA6460626
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788604948;
 b=I9vv78leU1UYkFwuiKMbhw3Iej+1jdmBfUoPKA6HQVtWTGPHq4dnnqnYb+LjQY21wcZ5
 RYLWf3vxK4hwpI/OJM5oulVsC5kN2Q2gG+QK7b466AFeLj4Et4SoAUNeHpt+BJlDAZalO
 fxR2ErZWYUzp1Vocf83+9XMvk6lyJqYJyHb3FVMDNWrCueD4SNwROP0syGBnHlpJZq81Q
 1UKIQFFkD4CIGbjJ23r1Trb2nLjCKgRMgefHCea8VxA8WlPkvpRf99ntsOlkmBIa1Jfaz
 PcIJSnhCSLkx4jQ1b6cNoDU8WxhdzwjpL6Akg0qFzziZjHaKbsU3y/e1cezpkyPRkgA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788604948;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=3dghmOh3ZQSlV0UJwnNbWF6XtmQk7X+e8EId4MLpr+M=;
 b=b9Sxtqi/Szd3mJGrbdnwXu6A6m9TxuYrC0kQJo2Trzh6//0gk5iQ+okLfLEPILjQ9tUc
 mZFb9KPJi4KWJCmZII4ERoMa8bU8oicOOIaG7UdCFtWnwM2B1owsHcjxv5TJJKkJkFb7I
 FL50RFAP2VIJJS2HR5bCobB4L4xoKPPA/Si7HRwgnoSpLhpdBQpwUSSJF2F1obHFmHptr
 M3cDWIVceW+PElF9HSTQzgrB+VgTCwFAvP5VvUl47uHZmUiM+1YjoqnXVUPXOhaP3slX8
 3CPQA3ftrd7CJ/5WNCRVpTKgpl2tiQB78sujjoUYMoaSUCZDaHUOpDd8RK1Mk4TI/LA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b="ORt/wD+M"; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DA6460626
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 10:42:27 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MatVb-1wQS1z3NYB-00el5I; Sat, 05
 Sep 2026 12:42:24 +0200
Message-ID: <7f4b1a1a-efa1-429e-b19e-74f0869024d2@gmx.de>
Date: Sat, 5 Sep 2026 12:42:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260905075317.1183805-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 xsFNBFrLsicBEADA7Px5KipL9zM7AVkZ6/U4QaWQyxhqim6MX88TxZ6KnqFiTSmevecEWbls
 ppqPES8FiSl+M00Xe5icsLsi4mkBujgbuSDiugjNyqeOH5iqtg69xTd/r5DRMqt0K93GzmIj
 7ipWA+fomAMyX9FK3cHLBgoSLeb+Qj28W1cH94NGmpKtBxCkKfT+mjWvYUEwVdviMymdCAJj
 Iabr/QJ3KVZ7UPWr29IJ9Dv+SwW7VRjhXVQ5IwSBMDaTnzDOUILTxnHptB9ojn7t6bFhub9w
 xWXJQCsNkp+nUDESRwBeNLm4G5D3NFYVTg4qOQYLI/k/H1N3NEgaDuZ81NfhQJTIFVx+h0eT
 pjuQ4vATShJWea6N7ilLlyw7K81uuQoFB6VcG5hlAQWMejuHI4UBb+35r7fIFsy95ZwjxKqE
 QVS8P7lBKoihXpjcxRZiynx/Gm2nXm9ZmY3fG0fuLp9PQK9SpM9gQr/nbqguBoRoiBzONM9H
 pnxibwqgskVKzunZOXZeqyPNTC63wYcQXhidWxB9s+pBHP9FR+qht//8ivI29aTukrj3WWSU
 Q2S9ejpSyELLhPT9/gbeDzP0dYdSBiQjfd5AYHcMYQ0fSG9Tb1GyMsvh4OhTY7QwDz+1zT3x
 EzB0I1wpKu6m20C7nriWnJTCwXE6XMX7xViv6h8ev+uUHLoMEwARAQABzSBGaW9uYSBLbHV0
 ZSA8ZmlvbmEua2x1dGVAZ214LmRlPsLBlAQTAQgAPgIbIwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBOTTE4/i2fL6gVL9ke6nJs4hI1pYBQJn9S5IBQkQ6+MhAAoJEO6nJs4hI1pYvz0P
 /34nPCo/g0WbeJB6N75/1EkM9gDD1+lT4GdFEYYnCzslSxrIsL3kWuzG2kpqrErU8i7Ao/B2
 iE3J9NinRe613xlVUy2CU1VKaekm3YTkcfR7u8G/STNEQ42S46+3JRBMlLg1YldRsfVXq8tc
 jdwo193h4zrEeEmUDm8n43BPBhhwNRf+igtI8cNVyn9nBt6BrDnSswg497lrRjGjoP2zTkLT
 Q/Sb/6rCHoyFAxVcicA7n2xvaW0Pg0rTOrtA9mVku5J3zqyS4ABtoUwPmyoTLa7vpZdC33hy
 g7+srYNdo9a1i9OKF+CK9q/4auf3bMMeJB472Q5N8yuthM+Qx8ICySElyVDYSbbQIle/h/L7
 XYgm4oE1CxwiVCi8/Y/GOqhHt+RHLRGG1Ic+btNTiW+R+4W4yGUxL7qLwepIMY9L/0UcdnUa
 OBJk4waEX2mgOTmyjKR0FAGtaSH1ebz2UbY6pz5H9tZ4BIX7ZcQN0fLZLoi/SbbF+WJgT4cd
 8BooqbaNRoglaNCtTsJ7oyDesL9l0pzQb/ni1HGAXKW3WBq49r7uPOsDBP8ygyoAOYw4b/TX
 qUjJYpp9HcoQHv0sybSbXCFUMnL1E5WUhy8bBjA9fNtU43Fv3OR2n5/5xSn6o33XVMYMtkrN
 0AvEfAOGGOMJWktEYA7rxy0TQiy0ttUq0eQszsFNBGQ1Nr0BEADTlcWyLC5GoRfQoYsgyPgO
 Z4ANz31xoQf4IU4i24b9oC7BBFDE+WzfsK5hNUqLADeSJo5cdTCXw5Vw3eSSBSoDP0Q9OUdi
 PNEbbblZ/tSaLadCm4pyh1e+/lHI4j2TjKmIO4vw0K59Kmyv44mW38KJkLmGuZDg5fHQrA9G
 4oZLnBUBhBQkPQvcbwImzWWuyGA+jDEoE2ncmpWnMHoc4Lzpn1zxGNQlDVRUNnRCwkeclm55
 Dz4juffDWqWcC2NrY5KkjZ1+UtPjWMzRKlmItYlHF1vMqdWAskA6QOJNE//8TGsBGAPrwD7G
 cv4RIesk3Vl2IClyZWgJ67pOKbLhu/jz5x6wshFhB0yleOp94I/MY8OmbgdyVpnO7F5vqzb1
 LRmfSPHu0D8zwDQyg3WhUHVaKQ54TOmZ0Sjl0cTJRZMyOmwRZUEawel6ITgO+QQS147IE7uh
 Wa6IdWKNQ+LGLocAlTAi5VpMv+ne15JUsMQrHTd03OySOqtEstZz2FQV5jSS1JHivAmfH0xG
 fwxY6aWLK2PIFgyQkdwWJHIaacj0Vg6Kc1/IWIrM0m3yKQLJEaL5WsCv7BRfEtd5SEkl9wDI
 pExHHdTplCI9qoCmiQPYaZM5uPuirA5taUCJEmW9moVszl6nCdBesG2rgH5mvgPCMAwsPOz9
 7n+uBiMk0ZSyTQARAQABwsF8BBgBCAAmAhsMFiEE5NMTj+LZ8vqBUv2R7qcmziEjWlgFAmf1
 LrEFCQeCXvQACgkQ7qcmziEjWljtgBAAnsoRDd6TlyntiKS8aJEPnFjcFX/LqujnCT4/eIn1
 bpbIjNbGH9Toz63H5JkqqXWcX1TKmlZGHZT2xU/fKzjcyTJzji9JP+z1gQl4jNESQeqO1qEO
 kqYe6/hZ5v/yCjpv2Y1sqBnPXKcm21fkyzUwYKPuX9O1Sy1VmP1rMzIRQHXnNapJJWn0wJAW
 079YqdX1NzESJyj4stoLxIcDMkIEvOy3uhco8Bm8wS88MquJoR0KlyBR30QZy9KoxmTiWKws
 Mn6sy4aX9nac3W0pD+EyR+j/J9SWSvOENAmn4Km+ONxz93+oVLWb+KHtQQloxOsadO0wwiaZ
 xUT7vJcxSgjrHugSs+mOLznX/D8PfG/+tYLFlddphcOGldzH0rxKfs53BplAUe+LEZY1AU8p
 0WDK2h097ZQ0eZiVZlvAKSjwsjow2tpqwamtfNKrFg/GFRbNZcoQuYsf3vBW1CiZ5JQ6Vh2A
 bCn+vBDsJwD9Hcht1eVRxnIq745SQ0naL48Q3HGpKdXZpJoBQZ8bSAFhRSb3m+P4PE272rLY
 6FCkqS+UeX7RBpPkkIDoL7WS9HdvDHuQ751D56WkTnIpoF+sgW6tOEcfgFrYf3rVvh6G3B8S
 FPSOJuHYnwzMFrDNxQQKb0uS/j1s2dnlS55MouCvd5pShM5iRFzE7k3CMeS4NkhFim0=
In-Reply-To: <20260905075317.1183805-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:EWPBnh+AlmQPQ1zkPeAyDracKJIAlvhnP+wpgEYUiOz5MMD0o19
 Idw/I++SVFvwRll1H4zKi1du55lWQFsTEV/wsLEUvapt9fDCvPXsesv2I9mPqyTJQU2CozP
 o3XKbuhxa6fzp2Px3rgB86D+at/3EzXbyUo7HSkBdeoCy1Cbfpv/gCHcLhix1QxZkNhEZpT
 FOkJoPdV2A1HVnNBVXzng==
UI-OutboundReport: notjunk:1;M01:P0:BpFKbMFtySs=;BagS/8GPfD+Y50VTYhw1v2c3us5
 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
Subject: Re: [Buildroot] [PATCH 1/1] package/rrdtool: bump version to 1.11.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 05.09.26 um 09:53 schrieb Bernd Kuhls:
> https://github.com/oetiker/rrdtool-1.x/blob/v1.11.0/CHANGES
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/eae6f5f5c97266b739f5285c0e75fef91620ec8a
> 
> with the exception of br-arm-full-static which sees linking errors to
> pango & co.. This problem also exists with the current rrdtool version
> 1.10.3 and is not introduced by this bump.

Confirmed that, so: applied to master, thank you!

>   package/rrdtool/rrdtool.hash | 4 ++--
>   package/rrdtool/rrdtool.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rrdtool/rrdtool.hash b/package/rrdtool/rrdtool.hash
> index 85e894a642..72396586fd 100644
> --- a/package/rrdtool/rrdtool.hash
> +++ b/package/rrdtool/rrdtool.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/oetiker/rrdtool-1.x/releases/tag/v1.10.3
> -sha256  843b7caa2a80a815d44ac5c65daa42920cb64586fe804e36d0bc0783554e0635  rrdtool-1.10.3.tar.gz
> +# From https://github.com/oetiker/rrdtool-1.x/releases/tag/v1.11.0
> +sha256  24c345b5c077c1b2b2fcbc1a364f1da051650fb6743ad5213096adc04c862ed4  rrdtool-1.11.0.tar.gz
>   # Locally calculated
>   sha256  ab6b4646e9e01f1ec287c29c351c886c4cb7f945c11efc0a1be9f6e5e6cc5320  COPYRIGHT
>   sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  LICENSE
> diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
> index f911d54623..3e2d234678 100644
> --- a/package/rrdtool/rrdtool.mk
> +++ b/package/rrdtool/rrdtool.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RRDTOOL_VERSION = 1.10.3
> +RRDTOOL_VERSION = 1.11.0
>   RRDTOOL_SITE = https://github.com/oetiker/rrdtool-1.x/releases/download/v$(RRDTOOL_VERSION)
>   RRDTOOL_LICENSE = GPL-2.0+ with FLOSS license exceptions as explained in COPYRIGHT
>   RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
