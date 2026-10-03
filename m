Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E01CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 11:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E910A412FF;
	Sat,  3 Oct 2026 11:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q2-9qXLBxnFu; Sat,  3 Oct 2026 11:36:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D995C412F9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791027404;
	b=kPxjbEITpcVeplGfVURIV/pATFXBNzJ+7ybED1HVcDE6eZWuvxLCmjw4yvMayBkWGMsU
	 fHNFe2bF2pci4Y92Sd1aeYW0CEzQlu4B+BCbNQBifcsgXZuEGok1zJHGKfobRsgjUatos
	 bOcJT319iZrEJq8OpwOfbudOh9fNkmFDgsBfPHuJj4SIZGvsHzBzn+cqMs8zw/vGzHjUB
	 MNZuU2YvEQpev/bWrf+Td8FOLuS5l5uqnqWik2u/AB3iJR7k5zqs5Ziklp0eKD9zqxbND
	 jfdRAvOa9e7MLiqBFZzLTz7sWg1QkpomolSorv1DopAtXMqxadI6CkNLCqolSkYOECQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791027404;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=dhMQHfX5/V8KWsglB2TZhWQ9PUqz3Axa0gJllIdxaTk=;
	b=JuLDzZkC8WtwsfCJnX9KMD0NgQbx6TaLDIvab7LCRAwnk1MkDKbvBFjlWqMm75majSQS
	 17OXnADCRpdRZjT/fQpSdpDaMHABYZvhQIIm6IzxlX1l0SZPBGMNZAUlxkzpkG8QeKJb5
	 xbSxw9Mv+h1/ao0DkfV/YLpCTABxzJoi+nUQCybFvsEajSwx8V43mNkoDBcwv3kSxSvUM
	 ZvziLVVgG6Pe7t/GRFX+PTWDGXgDKfMzCllwSOmxm0dLZ3tp0OW+fmpM9KBNb2MfiCfjU
	 fV2aeCMAr+/mzGrbpPTetkJ5RQs5Uu+MUckSJNNv/lVNM5r2RWs6FeUD2x2omfzW2HA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791027403;
	bh=dhMQHfX5/V8KWsglB2TZhWQ9PUqz3Axa0gJllIdxaTk=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Mdz+UALEbWihHvGpHZnI4Uka78IuaZamMaLcsSDyGd5CbEdh9xDaof05HEMSLFY5S
	 aPDJ/2xyFZveuYwd8Z5Cv38WzihdwycpKCToAg2Poy56byVsRFqkzFjW9WbZnZ6CEj
	 T/tv4jYFtVC/T0p56RRM0tai8fxO6Ib3Igud1kho2iS7/BaWEDdMq2qVYWp0tMwJVm
	 8JWs37QjkclzASxmvJ61LXtQ4oc9gHQZw/Zkc30prawZZOat9eHc9Yt0/6sWTlDiPX
	 29XNbhXz0Rr15l20zn6EBX8XXI/kl/6+IFVGCSL+s8dR1fNDUezasCQFR+6cJ776ER
	 mVOqvZqaTVEvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D995C412F9;
	Sat,  3 Oct 2026 11:36:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E424C34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 11:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E13F381108
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 11:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ec9Kbf2YLLmS for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 11:36:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 086F88110C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791027400;
 b=r0Xtu5V7dTBF8sEwkPwzr0lCPBNgEsM7i4zuWUklEmui65BcgF7fy21sIpLMjzxye8vC
 J8/kYTPH3Jq/omtUEz8aKDHGDVE+asoemstiLGd+p1ljXuRgW6qvDf8j5IuSZ3Uz86OxT
 z2xkNAJ+49qyAEC9abX0YhZ+0GiKXZHqqI7JRRRmB7hTuYgBjrUNkuxkFhYg+qS8cH+hE
 apIH8lL3kHss62mazWTOwSipjc5+Z+ppvULGsYKPCeI4D8a65fIAZmPfIJRHE8iPTOYvB
 IIMvTm3L6YLUZ1/zJML5907xYL2rP9bYPb2jrFr9DFtlG7F7ojdbjWMJFP6bPj3hPSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791027400;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=DUXync7JgVYdffpCvkVahxhUpQLIGrnodS3sCz+StbQ=;
 b=MuFipNfe65ysiSz268thb9iSfgLHjVaVVqfRCx46e3DrBW+wHtUDHbhwm2MfOO1Fbalj
 CwBfqmuw7bw8bETPG26IBUFUMovzBA9H+Xu1yD0BURu4Ej4jlD2ff24tagftjnwLdEOY1
 6wi5IQ3yJejZZRes/eo1EX6Gk7x1iXNAUIzrKnMLPTsbe/ecoDiqxunslU2ftMy/TB9nT
 TfnVveVa8JrNEJyk/G661TGR7Qo6hrjIZxu1Xn3cMWxvfDNz6/0wa0sJ/MTcTsZnp7MIS
 qJDp3NQNi/RX0H6uFn7LEqGjyLK5xadv6f/dKCyeipUlh12qlt68bw8A5yu9MLq3ZOA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ssXAYEym; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 086F88110C
 for <buildroot@busybox.net>; Sat,  3 Oct 2026 11:36:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8hZJ-1xHf0f2XNB-0041ds; Sat, 03
 Oct 2026 13:36:36 +0200
Message-ID: <19167e12-ead7-48ff-83b0-b6fc79fc714b@gmx.de>
Date: Sat, 3 Oct 2026 13:36:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad.86@gmail.com>, buildroot@busybox.net
References: <20261003065529.117519-1-francois.perrad.86@gmail.com>
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
In-Reply-To: <20261003065529.117519-1-francois.perrad.86@gmail.com>
X-Provags-ID: V03:K1:RlwP94KfggKlXTvBfJRftxLUhbV1l3TzgmCJEvtFMg2GnbCnCAn
 MjxXg/ccqwfWH3bIT06eG721n57cQgzQvcNjZEWg4Kw+eHPOqmjyux5Cgul1dmixppB+tyb
 gaZbnq5DpUx5ZLOpzc3R2fA/u320c70fDDlLZX18YJfxeazTgyeBR1BE5lGL0kLL4pEov4v
 W+ofIsCAKl3CrIOlHeC+A==
UI-OutboundReport: notjunk:1;M01:P0:PXFIXL4r33k=;0V5hinUlex+1oXHU8XXzKZnFTTc
 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
 uWLW6NgMk3SSOmzLkqAmbLMtYt5jiYoU8ZtOP8=
Subject: Re: [Buildroot] [PATCH v3] package/kbd: bump to version 2.10.0
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

Am 03.10.26 um 08:55 schrieb Francois Perrad:
> remove one upstream patch
> 
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Applied to master, thank you.

> ---
>   ...e-dlopen-and-memfd_create-for-libra.patch} | 48 ++++++++++++++-----
>   .../kbd/0001-libkbdfile-fix-zlib-build.patch  | 35 --------------
>   package/kbd/kbd.hash                          |  2 +-
>   package/kbd/kbd.mk                            |  4 +-
>   4 files changed, 39 insertions(+), 50 deletions(-)
>   rename package/kbd/{0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch => 0001-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch} (77%)
>   delete mode 100644 package/kbd/0001-libkbdfile-fix-zlib-build.patch
> 
> diff --git a/package/kbd/0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch b/package/kbd/0001-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
> similarity index 77%
> rename from package/kbd/0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
> rename to package/kbd/0001-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
> index 3c83146d7..38733d337 100644
> --- a/package/kbd/0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
> +++ b/package/kbd/0001-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
> @@ -21,17 +21,20 @@ Signed-off-by: Alexey Gladkov <legion@kernel.org>
>   Upstream: https://github.com/legionus/kbd/commit/6ff3161c1e5d448920d412a269716cf42be155b5
>   [Fiona: backport to 2.9.0]
>   Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> +[Francois: backport to 2.10.0]
> +Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
>   ---
> - configure.ac               | 19 ++++++++++++-------
> - src/libkbdfile/Makefile.am |  9 +++++++--
> - src/libkbdfile/elf-note.c  |  3 +++
> - 3 files changed, 22 insertions(+), 9 deletions(-)
> + configure.ac                 | 19 ++++++++++++-------
> + src/libkbdfile/Makefile.am   |  9 +++++++--
> + src/libkbdfile/elf-note.c    |  3 +++
> + tests/libkbdfile/Makefile.am |  5 ++++-
> + 4 files changed, 26 insertions(+), 10 deletions(-)
>   
>   diff --git a/configure.ac b/configure.ac
> -index 05cecab..0691167 100644
> +index ffd67fe..e1a78f3 100644
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -81,7 +81,7 @@ AC_FUNC_STAT
> +@@ -85,7 +85,7 @@ AC_FUNC_STAT
>    AC_FUNC_MALLOC
>    AC_FUNC_REALLOC
>    AC_FUNC_STRERROR_R
> @@ -40,7 +43,7 @@ index 05cecab..0691167 100644
>    		strdup strndup strchr strrchr strspn strstr strtol])
>    
>    AC_SEARCH_LIBS([timer_create], [rt])
> -@@ -263,13 +263,18 @@ AS_IF([test "$VLOCK_PROG" = "yes"], [
> +@@ -267,13 +267,18 @@ AS_IF([test "$VLOCK_PROG" = "yes"], [
>    ])
>    AM_CONDITIONAL(VLOCK, test "$VLOCK_PROG" = "yes")
>    
> @@ -60,7 +63,7 @@ index 05cecab..0691167 100644
>    	[PKG_CHECK_MODULES(ZLIB, zlib, [HAVE_ZLIB=yes], [HAVE_ZLIB=no])],
>    	[HAVE_ZLIB=no]
>    )
> -@@ -284,11 +289,11 @@ AC_ARG_WITH([bzip2],
> +@@ -288,11 +293,11 @@ AC_ARG_WITH([bzip2],
>    	[],
>    	[: m4_divert_text([DEFAULTS], [with_bzip2=yes])]
>    )
> @@ -75,7 +78,7 @@ index 05cecab..0691167 100644
>    	AC_CHECK_LIB(bz2, BZ2_bzDecompressInit, [
>    		HAVE_BZIP2=yes
>    		BZIP2_LIBS=-lbz2
> -@@ -306,7 +311,7 @@ AC_ARG_WITH([lzma],
> +@@ -310,7 +315,7 @@ AC_ARG_WITH([lzma],
>    	[],
>    	[: m4_divert_text([DEFAULTS], [with_lzma=yes])]
>    )
> @@ -84,7 +87,7 @@ index 05cecab..0691167 100644
>    	[PKG_CHECK_MODULES(LZMA, liblzma, [HAVE_LZMA=yes], [HAVE_LZMA=no])],
>    	[HAVE_LZMA=no]
>    )
> -@@ -321,7 +326,7 @@ AC_ARG_WITH([zstd],
> +@@ -325,7 +330,7 @@ AC_ARG_WITH([zstd],
>    	[],
>    	[: m4_divert_text([DEFAULTS], [with_zstd=yes])]
>    )
> @@ -94,7 +97,7 @@ index 05cecab..0691167 100644
>    	[HAVE_ZSTD=no]
>    )
>   diff --git a/src/libkbdfile/Makefile.am b/src/libkbdfile/Makefile.am
> -index 2511064..ebdb28d 100644
> +index ea7aaf2..d301ca6 100644
>   --- a/src/libkbdfile/Makefile.am
>   +++ b/src/libkbdfile/Makefile.am
>   @@ -10,14 +10,17 @@ headers = \
> @@ -107,7 +110,7 @@ index 2511064..ebdb28d 100644
>    	kbdfile.c
>    
>    libkbdfile_la_LIBADD =
> - libkbdfile_la_CFLAGS =
> + libkbdfile_la_CFLAGS = $(AM_CFLAGS)
>    
>   +if USE_ELFNOTE
>   +libkbdfile_la_SOURCES += \
> @@ -141,6 +144,27 @@ index 842be9d..bc4a684 100644
>    
>    #include "elf-note.h"
>    
> +diff --git a/tests/libkbdfile/Makefile.am b/tests/libkbdfile/Makefile.am
> +index cf31f3f..0b1f516 100644
> +--- a/tests/libkbdfile/Makefile.am
> ++++ b/tests/libkbdfile/Makefile.am
> +@@ -22,12 +22,15 @@ noinst_PROGRAMS = \
> + 	libkbdfile-test02 \
> + 	libkbdfile-test03 \
> + 	libkbdfile-test14 \
> +-	libkbdfile-test16 \
> + 	$(NULL)
> +
> ++if USE_ELFNOTE
> ++noinst_PROGRAMS += libkbdfile-test16
> ++
> + libkbdfile_test16_SOURCES = \
> + 	libkbdfile-test16.c \
> + 	$(top_srcdir)/src/libkbdfile/elf-note.c
> ++endif
> +
> + libkbdfile_test16_LDADD = \
> + 	$(top_builddir)/src/libcommon/libcommon.a \
>   --
>   2.55.0
>   
> diff --git a/package/kbd/0001-libkbdfile-fix-zlib-build.patch b/package/kbd/0001-libkbdfile-fix-zlib-build.patch
> deleted file mode 100644
> index 1324d0b53..000000000
> --- a/package/kbd/0001-libkbdfile-fix-zlib-build.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 488872421ef38215d2797f78497eb559d8eec32a Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@users.noreply.github.com>
> -Date: Fri, 5 Dec 2025 16:45:36 +0100
> -Subject: [PATCH] libkbdfile: fix zlib build
> -
> -Upstream: https://github.com/legionus/kbd/commit/2f9a4e56c2ef245fbe840677aad9d5932e17f50d
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - src/libkbdfile/elf-note.h | 5 +----
> - 1 file changed, 1 insertion(+), 4 deletions(-)
> -
> -diff --git a/src/libkbdfile/elf-note.h b/src/libkbdfile/elf-note.h
> -index a0fd9e2..d3b8d5c 100644
> ---- a/src/libkbdfile/elf-note.h
> -+++ b/src/libkbdfile/elf-note.h
> -@@ -26,14 +26,11 @@ int dlsym_many(void **dlp, const char *filename, ...);
> -  */
> - #define DLSYM_ARG(symbol__) &sym_##symbol__, STRINGIFY(symbol__),
> -
> --/* For symbols being dynamically loaded */
> --#define DECLARE_DLSYM(symbol) static typeof(symbol) *sym_##symbol
> --
> - /*
> -  * Helper defines, to be done locally before including this header to switch between
> -  * implementations
> -  */
> --#define DECLARE_SYM(sym__) DECLARE_DLSYM(sym__);
> -+#define DECLARE_SYM(sym__) static typeof(sym__) *sym_##sym__;
> -
> - /*
> -  * Originally from systemd codebase.
> ---
> -2.47.3
> -
> diff --git a/package/kbd/kbd.hash b/package/kbd/kbd.hash
> index d46a60a80..83b45b0e8 100644
> --- a/package/kbd/kbd.hash
> +++ b/package/kbd/kbd.hash
> @@ -1,4 +1,4 @@
>   # From https://www.kernel.org/pub/linux/utils/kbd/sha256sums.asc
> -sha256  fb3197f17a99eb44d22a3a1a71f755f9622dd963e66acfdea1a45120951b02ed  kbd-2.9.0.tar.xz
> +sha256  6e5ca4f8d76ee9e3a8db700b667f13e12aac9933828a64e1aaad93d26be9b479  kbd-2.10.0.tar.xz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>   sha256  5a16340fe773f422144b436df90319114a2884933c56e9be6fad642e59be5e1f  CREDITS
> diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
> index 6e34a45ba..12e638200 100644
> --- a/package/kbd/kbd.mk
> +++ b/package/kbd/kbd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KBD_VERSION = 2.9.0
> +KBD_VERSION = 2.10.0
>   KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
>   KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
>   KBD_CONF_OPTS = \
> @@ -14,7 +14,7 @@ KBD_DEPENDENCIES = \
>   	$(TARGET_NLS_DEPENDENCIES) \
>   	host-pkgconf
>   
> -# 0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
> +# 0001-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
>   # modifies configure.ac and src/libkbdfile/Makefile.am
>   KBD_AUTORECONF = YES
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
