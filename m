Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD04CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8039660EF8;
	Sat,  3 Oct 2026 10:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_TNh_XRlJQO; Sat,  3 Oct 2026 10:16:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8F37B60EFE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022594;
	b=XApFtHhvFCzrBnqJ/1pwuqyx1KpCdzefYFbe7AnNF8+PsoFxngNwe4zdlWgo+H1QqNAa
	 uDscpff6fRQnzMJf06mfo8DOt48tOsNoaT5nihuVjqknioE3ARH9Sne3vvq+jhcWGtcYL
	 RwJ76ktQtFD/VM/Kc3CdVzmwcE7teA8x3JbwRT/Opc77yUjQUibmK6K/rfJwXZeXqYti0
	 B7qU+4DO+v9CbjGVbGqHtVR2dGtbJtbC3PeKxot+hpC5DlNn41XSZBSP6RJdr3BhxpB9m
	 O813WXLpuO+qKcCgEvdJBsOwH9muKnTnO6A5tZmqVtGYaZ+WgP5es2KgIUv79tXfwXQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022594;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=FUG+il3ubZD/wf66gZE1IvkPToMhDjtiPz+gCVcsvvA=;
	b=tP13umfJqVSbL0f8FFrQKV6Nt/yZzdMwR182Cc5T+FFlMe9T6hvMDsrkb7FHxMOWdMMW
	 FQEWE3wJT/r3CSm9l1HgRCZJic+w6P6P6+VjOQqYZnEZCX2HZNmMxGypeo+Yk6dzaoUs3
	 iVChIYOuD0H1qO5Ct9JiJq7HnUPxEzFE42IE8o9VIb/qrpHeNw2UHxMDSOjykCEcUNvLt
	 TGJq5S5W6nW7O8hj1l5tyRK4jbvO+F0oHO73xIDiULbeWh/GDLkPVzZ8OxUMYk/tvdC+q
	 egxaBLmmuvdTd/6mXIXN/a4iBkDeIg/V2n1kepyvK0k5GaClHfDcCL0VIzRuaf9WTDw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022594;
	bh=FUG+il3ubZD/wf66gZE1IvkPToMhDjtiPz+gCVcsvvA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PQr959sBtdKSbBjR5UYVmSyoS2cndLNX3hQSgJEhRGbQm2GhAF9R85nxLwVWxpOw0
	 A9TGj9LkoT7IaAHgtmVR7B0b28ibAcgBUy0WHkTvXqU8YAJXdXo4UHOtawLtYwV6sN
	 5RIM8yQFMgYwFGIOPkIBrQU6Awzjn3zKw+9hwS1l/K7H5aEm5hCkCUyagHvOK0D/jA
	 VyMupiUtSBLMZUZhmFk3k4wjnzk2pIQEMUuLM8aX0HG6Ozkq6ltAXKZGsk5M4CScuv
	 eQp1XAk7Chn00hFpLuRwyCiMMEjCtnhf2Gldc/lNX+omJB9geIb9vTZo5wAjqRTK1d
	 FXvNs7maHbGMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F37B60EFE;
	Sat,  3 Oct 2026 10:16:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 111BD34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB498412CC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wuV9ycUDGyay for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:16:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9E44941291
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022592;
 b=tC5MqtYCXm2uNsIlnx4KgPvXcLIn70/3bgLDt/MZBlzW6CCe5UfKsUrbFuBpBcgfVljv
 JO5whrW5y8iFy/IBZvWpbRIyVRLbr/QPczP2uz7hTtQCCQ5NkS9F6rchP2rT2MKoOID23
 UPhLVO4J0A5JSpZEPA07mvsBaNZGg6qXkIXgXePJFz8ncztmGvUb5TeHaeWECGeqDG7as
 w0nxZ0pBQ22U1lKZvlxcUHxSan9vsCK40WOmuyHyCawq7PZZXA49ZV7e6q0jRpO5vn6bM
 EvVcuKUb8miphEVXtBtLt/Lv8jO9fqAQouLMszhJ0RwXaN/Pw3ZpaBjmtGQDh5dNJhA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022592;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=UyfdM2I/DDuAqDimGoMed218qatsr1+6+wxsfRlmFGs=;
 b=KPraafhYbm/6aFm1FpR7MJVuW564cPfLcuxo5I88so1oi5HmM8UyNrP8Uxs6SvOlhD4R
 stjq0GDPNzGbBpRTVnMxgL08YMP7ObTS1dPEFWKoIAVh82iFJ6z5FCNv9gwTxhR1y6GfZ
 NBhJ/JJP7GP9CKsRd77fcVpEGoorrocbT0hT59EIPqAbfQ+pla7ZBuFQKJb3nmDHWvQYE
 7n6k3OuWj0Bqx7bMt7DdnBOfUVnYAHPE7TAe2XZkEgoR22a/SqhbuoP0klyvWRKhgbuWg
 7/GcpcHq3ixOM/8TqWoXR8n/MUVXVxvwIctLTcOPjkBudM7ETMktMGd20UpPjDDaZfA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=qR9A95gl; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E44941291
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:16:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MqJqN-1wreaV2i4R-00lIw5; Sat, 03
 Oct 2026 12:16:28 +0200
Message-ID: <695f3c38-8d6d-4113-a396-aca41ba14c45@gmx.de>
Date: Sat, 3 Oct 2026 12:16:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20261003070128.1295458-1-bernd@kuhls.net>
 <20261003070128.1295458-89-bernd@kuhls.net>
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
In-Reply-To: <20261003070128.1295458-89-bernd@kuhls.net>
X-Provags-ID: V03:K1:WOEGqydRU3IET5jI1uQMpSgSlB+/OsiCoOLm37wlGAsAsfPvcHp
 0v1nrkd+co7MH+XDybb0I4OBkRC73tiLQ7Dk+5kuR5qFfB6UrEOkxgbN3oKQjzc9lEo0FOA
 oPBmeDJHGsGoV+uhNzqMlV6v2sJ/LgZTNoIakdV7idAcqkaVCU3sg6rXmiuUww212Nig0o+
 RQIYisKKcYNW6GtwgXbTQ==
UI-OutboundReport: notjunk:1;M01:P0:Ca6wTpOEjnE=;p+Om56Er60OAqbmZ3Oe66n6WYco
 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
 M13YIiP6ASZ4/c3Cuun1eHnv3SsMykfhZomxSI=
Subject: Re: [Buildroot] [PATCH 089/114] package/python-textual: bump
 version to 8.2.8
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

Am 03.10.26 um 09:01 schrieb Bernd Kuhls:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Fiona Klute <fiona.klute@gmx.de>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thank you.

> ---
>   package/python-textual/python-textual.hash | 4 ++--
>   package/python-textual/python-textual.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-textual/python-textual.hash b/package/python-textual/python-textual.hash
> index a7a60f631f..1b7e9ade46 100644
> --- a/package/python-textual/python-textual.hash
> +++ b/package/python-textual/python-textual.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/textual/json
> -md5  c1831151f5fd52aa6f09c834e32df3b7  textual-8.2.5.tar.gz
> -sha256  6c894e65a879dadb4f6cf46ddcfedb0173ff7e0cb1fe605ff7b357a597bdbc90  textual-8.2.5.tar.gz
> +md5  dd6388bfad60ec1afa91d79b5b7dca84  textual-8.2.8.tar.gz
> +sha256  3f106a9fbc73e39dd266c9712432087de78a6d644084c7c241d6a25c3169115b  textual-8.2.8.tar.gz
>   # Locally computed sha256 checksums
>   sha256  94f290a762376dfdb7768e42070618b0abfd2a2799eab1b1c097816c3a39eb57  LICENSE
> diff --git a/package/python-textual/python-textual.mk b/package/python-textual/python-textual.mk
> index d7ada90102..7164f3597c 100644
> --- a/package/python-textual/python-textual.mk
> +++ b/package/python-textual/python-textual.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_TEXTUAL_VERSION = 8.2.5
> +PYTHON_TEXTUAL_VERSION = 8.2.8
>   PYTHON_TEXTUAL_SOURCE = textual-$(PYTHON_TEXTUAL_VERSION).tar.gz
> -PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/62/1e/1eedc5bac184d00aaa5f9a99095f7e266af3ec46fa926c1051be5d358da1
> +PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/00/21/39a76b01bd5eea82a04baaca7580e105d8c59450df03998345bb2cfb307b
>   PYTHON_TEXTUAL_SETUP_TYPE = poetry
>   PYTHON_TEXTUAL_LICENSE = MIT
>   PYTHON_TEXTUAL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
