Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5F6CA5FA6
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 18:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF9B140567;
	Mon, 28 Sep 2026 18:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4gaS5Y15h2Z; Mon, 28 Sep 2026 18:58:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 95E5A4055B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790621903;
	b=rJJS1cS7nzdRti7lwWVlQSqvnmv/MKmdUHrMw33dXvxIHKPiadUTHBRdrZAqsoMPw7IG
	 rf4L5bl2czQsAbvuELVGeELfoNzn9Hm9cfQMYJielJCGVJj/9JCZ3ZSTTtlqixyJGWdHJ
	 jgzDvp63s5qrARDnvVl8kAn0k6XOdQNwaPDR5evJGV7/6Db7itGTqw/Zs21j9WOzsIogf
	 iEQVMwwEC6Xr22dtlJ1g8ocZ+Ws7sSL2N/OLQOlRoE8J7RFgFbjEWnqCHMdCttLna2lhN
	 OxgWDpVNQpmFZaX5zitGXK1M02OIAM4QGqF5xncTw8ojo9AQgpUXt1WDEfmiBr1aIBg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790621903;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=PRzrN1zgoKn3ETeb2dczUg8U3yd/EhQSoJVCxkuwKko=;
	b=OWpFn8rStEPNKsZzWfBLgtqqRHTGxlpf+VIkGVlHvW23gpvxZRtDSdT/4Ez8HRe8AJaf
	 7H07Jx02Ojq2inlueqaImSy9osiFUphlpx0NwVx/L1v44YzbtN0Yy4EyAcH/GwgvU6U+i
	 VTspcSoU8oSF8H5yaNIgWZP0V38SAspfxIjvCAuxBwQUmGlDTmeUnmbotSKTPz139VHS6
	 9JKLYptk8CPcefH4QswpQ/iZpBmO2wJ5c2/7FIXUIJRnih7oXjkVKjseah8BhuGbacwSH
	 mEKsCLvQ3VVytJKygqj19N72sASwQbkpS95quZC1rNBzzcDLE4qIVm+KybanU6xi20Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790621903;
	bh=PRzrN1zgoKn3ETeb2dczUg8U3yd/EhQSoJVCxkuwKko=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WnjQG4nJ2QX4BcC/oZGufJQz+HrDal6kv19xwHQjBW4w/YM1Y2SErUdupU622cNAu
	 orqALWtv4UCF1RU9sDnVGQJogArPTJsRjQkY3hXe01TcKe7oIQN2xHYL35Tfa8lFwq
	 k33Iu9HhvE4LVOvYMtD843i5Fg2zGgOVcWGdyMeHXwHpgAIuqT4HSPy0fas3q4SrWC
	 Wf0mGEpgMOrL89X1esQR+70laumJn4jyjWhpTmFDDxaLbfbLuSA3U8QEClwSpbanai
	 EyvnoSN1UriLK9TKCzuD/kn5zHTZXnLrsHvNVmMa+/dLgm1qbS2skhQAgmaJZK/Q3P
	 N6qSs8x1sG12g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95E5A4055B;
	Mon, 28 Sep 2026 18:58:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E7E443A0
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 18:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E452580AA1
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 18:58:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k17JpT3oBv16 for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 18:58:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6F87080897
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790621902;
 b=d5ogDhgZYRmMee6pBZhClOAYPmNmCFyjUIpF5TDDVq203eXwMDu9ddAVEW7UgLSGKG+C
 Ww1/kvAvP69m+5uZKs9SGQFvYdG/IpI+YkiM27SrO2TJHHtUJrhMjrh4LnDJBiHA9YzVn
 snVEY2X/bMfSp2VzpzoIpB1pbhhyTHi2NOSC9+94E+fg4N5cyVigQ7eDOZDyJeMfTWd4p
 S5GHR+Ksjcvl/LxN0aCWqK6I7g0lnmPaM8aqisMvbsSR9fN6Jlr60r02qllLbJaD7DdxH
 RmaZoYlotGdioRZb2Dm9kYXocwuxvh+3xo+gFFI4cop8bG0Z7C0z9NDlmwRxN38MhtQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790621902;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=6IAmfWMA3tttiILQbrOR88HHIpCr8XCMXIYAjHrM9+M=;
 b=LNfN+V+fcmk75l7eiWX8umVHHrxCr8umXHaETi6Wb8NrbqwdJ2sLxn38voWRy+WNRUQS
 y4OLVFdG6y7KmKxEjO5pkFJ2YX0C0kwhTqvBYZZ2KJsNoXHuY27p3sHp3rJgnptstYjKI
 XQZazX17dTPDqJGiWQQzwBIxGqt2PiJz57kPsNlDlxArrO+95qo2e4Exot5yacsdu+8Re
 Zz9E7In4ayAb+zsu9Cf3UbH79+oKC6ipZcIn5CMyJweLbwgpYW/+ch2IGLgg1+jYH8pGd
 DXofQ3wLZE7pXWe+c1xW6C0hxw6p2dWmzaZvopn82RkKq5USiMwJLbfjmnQL0Fn2fJg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Zll6wVmb; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F87080897
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 18:58:20 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrQJ5-1wPVol05yR-00kCbN; Mon, 28
 Sep 2026 20:58:16 +0200
Message-ID: <9b411265-2987-4691-9947-8b729051439f@gmx.de>
Date: Mon, 28 Sep 2026 20:58:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
References: <20260928182454.2165278-1-fiona.klute@gmx.de>
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
In-Reply-To: <20260928182454.2165278-1-fiona.klute@gmx.de>
X-Provags-ID: V03:K1:bmYCn9NuXFmn5ih919u+irng2lNHUUEgM6DH8YmnQduSCOahjad
 yHaqpk1IuaswxzyvQVQb27Iasp9GMgLz6QL3OvLeLFaWf1IUDATNJlwHLy+E96iw7CluI39
 x8KBQHAfLXi17a2OLvB9GkGVJJEtJ7fhNKgpIWKAr8GuSJLRpUbYMWx44qFgLGGmXcbhAAL
 53V4rP2BQxleQseP/Dcdg==
UI-OutboundReport: notjunk:1;M01:P0:UVxB7pabdGI=;SeDoqvvGHHhus9ByUxBvBjRGW6z
 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
Subject: Re: [Buildroot] [PATCH 1/1] package/bubblewrap: fix build failure
 if kernel uses localversion
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

Am 28.09.26 um 20:24 schrieb Fiona Klute via buildroot:
> Bubblewrap expects the value of the assume_kernel option, if set, to
> be exactly three numbers separated by dots, nothing else [1]. If that
> requirement is not met configuring the build fails.
> 
> Buildroot sets assume_kernel to $(LINUX_VERSION_PROBED) since the
> version bump to 0.12.0). However, the expansion of

Whoops, I just noticed there's a typo here, the closing parenthesis 
before period. Maybe that can be fixed with applying? :-)

> LINUX_VERSION_PROBED may contain additional suffixes, e.g. if
> CONFIG_LOCALVERSION is set, or localversion* files are present (like
> in CIP kernels). So filter the version string to ignore any suffixes.
> 
> [1] https://github.com/containers/bubblewrap/blob/v0.13.0/meson.build#L94-L104
> 
> Fixes: 4cb6193d2eca39b1bd79ff4867c842f507f692b8
> Fixes: https://autobuild.buildroot.org/results/e7513e4730000e46b13bb9cf25955ebd3ec5fb71/
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
>   package/bubblewrap/bubblewrap.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
> index dcc3c23d7c..a58d7fd143 100644
> --- a/package/bubblewrap/bubblewrap.mk
> +++ b/package/bubblewrap/bubblewrap.mk
> @@ -18,7 +18,7 @@ define BUBBLEWRAP_LINUX_CONFIG_FIXUPS
>   endef
>   
>   BUBBLEWRAP_CONF_OPTS = \
> -	-Dassume_kernel=$(LINUX_VERSION_PROBED) \
> +	-Dassume_kernel=$(shell echo $(LINUX_VERSION_PROBED) | grep -o '^[0-9]\+\.[0-9]\+\.[0-9]\+') \
>   	-Dzsh_completion=disabled \
>   	-Dman=disabled \
>   	-Dpython=$(HOST_DIR)/bin/python \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
