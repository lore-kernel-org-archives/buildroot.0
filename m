Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE59CA5FA1
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0A3980A54;
	Mon, 28 Sep 2026 21:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9pqvhX1Q6L3t; Mon, 28 Sep 2026 21:10:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0DCD580A70
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790629858;
	b=NGd7i/nJ5Krg++RDD/8lJ0gTKs6x+YcoMJZhxE+KBo5WA7ABNywmIs4JJdVLClUaNujX
	 g7GjLXR76fxaEQzM4iWvESWHAIMqwhEcD6f2yK8wcor2HUhtfjQAxYIRvOO//Q/8orLrQ
	 lSNqbMNNR+LZDi77mzZBPAqmli3JBU4o6Ue/i2N7VUPxcsFg9V46aVSZdNnol68TT2wr8
	 pU9QmWabQN9r1OLbUj3gSnXVW+aZzHHjhKjoo5btYB5eap2mfjcyMp8+UmDZiiHYgFYzK
	 uGavPdl4uzj3v/w4To5CIDcxeuXUL/1btIdp3JppdmyRLD2ZKdff7iRTbufU/GVWpsA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790629858;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=QLQpHz7GPDxROTuLitwYrWkr19S9NEQ6IrvxlKURMgE=;
	b=NPDLxGolB7vEsKRZfEFGqHH35hWcbqmjdgeUkQD8qAml1b6hY9Ed3m3WdL3LK2tiEFE4
	 TsJM8ORnn8slbJUgMHdlEQq9tLPlD2Kg/kE/qbFiKu7HmCaNjgIOIcDyQ0uIxuGz69ESn
	 9pHnG2fFdHfPPd/wgjKmeVw96nXB2/E/Tjci7YiI6uMKxfhan2JterJl6QXxpgqzzh02Y
	 aeBPKUqjYwonW6xL6fJjQBroJ7yFV8n5Lh5BZy0C63CT3f6aIOGnFEiGdA3P+Z/FdXYCq
	 Bb3625Z6WT2Lj4cSHEYNKwToXtwmH57xPPHSoBSGCvCeo5zeBE554/b9lAsUnLwZDHQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790629858;
	bh=QLQpHz7GPDxROTuLitwYrWkr19S9NEQ6IrvxlKURMgE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oVDjjTCicXKFJXmfNpKKbF0WiJewD5tX1tApkivTF8oasjmYowWPKILqQiBmZbpwR
	 2qEkw6KqKCNllvz2HZecIpA1h3lp975bewrT+wiBKCFgybIVeoMylTNZPAzH4lw22j
	 5nRMWNIRcMlVLbmIgpopBVwww7o5+4wuDptFrX5TSzf7/Sy4BwdMc06yqRw80DcJ4S
	 frGSKXrC1mF2bSiOd1PMt8lb6KSPrWme9v11b+fjcRsUOcnzjCmfN6SeAp2X0bObI1
	 XyXLwM9Q8syOSAaT0XL7/U6hSKxlSj4Z8K4AaRyL2Cp+0qnt57gmsfIsK40BaUiv6r
	 yjJBDPDD09ghQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DCD580A70;
	Mon, 28 Sep 2026 21:10:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E25C161
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7C1D400B4
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qcfaQhATzEAy for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:10:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5F52C4008A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790629856;
 b=SOTFZv+ubl6zwNDFIGQr17Aew8JHeI33pvuL4ghjz3b273MW4WAZkMIRpV3CKGkK6frs
 bvlSZxh1zgTz1Mfo/EQ1cwUL3wu5HjOjwOZ7DwyNG7uj6j8uKbwb7DiJy6mUiVAfFKxuF
 LDLBqJpcSKym2anT+xrQU/zzLKJSPxZYGFFS4f9XKKr+kXu4AsXLLoYSz2pck6Cb8temi
 CdxH6yJrkuZMFaoXAgFH+A+l12fm/JjkyJAJ3LQPl8vmqSeO8AxAzf3GHKwmZtOTQ5Y5n
 XgFFqO0OMvhjn4kUGGUjvJVIiAHX/gt8dG1ARBI2F9ce9yuum8CAy2JmL0mA60ihAlA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790629856;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=/xNkxYV/+vLn7bhESWJsSUUKOFE4TRwRUaevSA1TSOE=;
 b=PzARzrdDe8ziKDua9UoRLalhsFFPSpViGtuaTAlY/1iZXEjjLbdcMgZKmpIXV1Gc+VGx
 MA/tSD3o9HH7VIjXYKAXfE+GjPiCxpp5Lt1m+N2kjgcc2QHAX04O4Kz35E2mSly0MgKg9
 BmrY/hQV+zewahaH+mJ8kz+mguL1NDPbujjyhQINJmNewKNTC9QLSLznOMjotqpoMm/9u
 dxUQzV/PIwambEMp8MSulU4D1F0zQ8RlVvbNrdudshivUKTXd28MOn04dyjUOhiDui6yn
 zQZWAMvJ1eC580kz1Y1uWavYgi6MpKX7ZD9BOcnm+fQM1n/BvqPyEJb888FS0vEJCOA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=c3Uz853M; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F52C4008A
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:10:54 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MC30P-1x1iFT38wP-001JOO; Mon, 28
 Sep 2026 23:10:50 +0200
Message-ID: <544f0eaf-bc44-45b1-8863-26d2adc6fff1@gmx.de>
Date: Mon, 28 Sep 2026 23:10:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org
Cc: John Ernberg <john.ernberg@actia.se>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20260614155328.304282-1-j@j-ernberg.se>
 <20260614155328.304282-7-j@j-ernberg.se>
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
In-Reply-To: <20260614155328.304282-7-j@j-ernberg.se>
X-Provags-ID: V03:K1:5WGg6NZFS0BFMAAZDxdX84b31cwAsPfzA63UCux2Uqoh6dJMHvT
 4JvX3B3AqtJ2Ur7wEsjS3WYtQaQktnHCjngyeV65QkWm3AFgdOCsgy90R2Jj3/d1vrlFWUo
 geboIOnAr3DTNTRr/bjpOwQ4ygNBqNDuKU21tN2WHG1kYmeDFSgzJN5SiK+rfERMFUE7vHW
 mFyvQB96vEH+smDx5YYJw==
UI-OutboundReport: notjunk:1;M01:P0:/mxqXbzmc5E=;/V0ch2PtmeWMt40Jo4H+2Sln93x
 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
 FyI/4ZLHY/CNdAZnw==
Subject: Re: [Buildroot] [PATCH v2 6/8] package/util-linux-libs: Do not
 install to target
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

Am 14.06.26 um 17:53 schrieb John Ernberg:
> util-linux-libs was introduced as an intermediate package to help break
> circular dependencies with util-linux, and therefor only exists to provide
> more basic versions of the libraries util-linux provide, to break these
> dependency chains.
> 
> There is no need to install these to target as they will never be used
> there.
> 
> Under all circumstances the libraries are built and installed by the main
> util-linux package.
> 
> This only solves the confict for target, the conflict will remain for
> staging as that conflict is much harder to solve.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: John Ernberg <j@j-ernberg.se>

Applied to master, thank you!

> ---
> 
> v2:
>   - Add a note that this only solves the conflict on target. (Arnout)
>     (see RFC discussion for longer explanation)
> ---
>   package/util-linux/util-linux-libs/util-linux-libs.mk | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
> index 6716a656d2..d434a8f461 100644
> --- a/package/util-linux/util-linux-libs/util-linux-libs.mk
> +++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
> @@ -24,6 +24,11 @@ UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
>   # 0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
>   UTIL_LINUX_LIBS_AUTORECONF = YES
>   
> +# This package is only used to build other packages that have a depdendency
> +# on util-linux libraries which in turn may be dependencies for the full
> +# util-linux build. The libraries that are actually used on target are built
> +# by the util-linux package.
> +UTIL_LINUX_LIBS_INSTALL_TARGET = NO
>   UTIL_LINUX_LIBS_INSTALL_STAGING = YES
>   UTIL_LINUX_LIBS_DEPENDENCIES = \
>   	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
