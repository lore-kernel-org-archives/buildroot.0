Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B23CA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 18:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2CC4814DC;
	Sat,  3 Oct 2026 18:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTs8fDVhTFIL; Sat,  3 Oct 2026 18:59:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8962681357
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791053989;
	b=npFIgl2Di9NETzpV+wHrZnq9wymiEGaTPlK9ZRWAhCC7ahPR48qKHPXkE3eiaUcBPQy3
	 x1KYNPetE8A0FO0Kedu0nqwUyRy+Hgu3t6xCPPUPZxKlsfqNWX+VPDoBZWMCbAjrWypE1
	 TT1u77w6mk79OL7hpjlalgzuzczmBo+BCbJzwp4kfSirVUYCnPlzb0kcnys+c74Mz/Hbp
	 OTsWuL1d2HtPlPNiX1u8xKBbpkfnoUdlzVi8CAUTcISxn/URjjmVXwOvjtT48b4dJ9Oqj
	 uRSZwjc+F4liuuiLUUtAJvTJ0C3RGN5+7jgrno0PaEsKILlIUtdXT2CY5kyjeDgWEpg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791053989;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Lj3dn6tvXJyGyOqKNCfzW3TjmNzUycTsfVsLUE7Qxc8=;
	b=JJjhbCd/BNa2V985tSk00Wtdu3He4F1I/NiKV3KzL6oZrPFpZSh28aReOPmp0ze4Tq9z
	 ZmPhrD2nnHuHneiXQ5maEvxun+8TfW2avx1siOO5maxz6sacu4zXB4Y2kiChfc/zXrOta
	 EMyGEsj7oFNzF/YBAqMfW+LJxiSwl03FqAl2F88OkjJ6K7fQZHNihYsO6eibGFWL1/9cm
	 FF5hqrjXkcHvelBBKS54vWYKxyPYlA5/0dg92crwC+/uQ2cUBDXRwpP64kV1brZ72dAFJ
	 M2Trj2pCCfJx9uA1SXlHOZbOYblCCvW1m3d/EIWOdlsaGKIZ5WGB0aop2e6Tzq3Z12w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791053989;
	bh=Lj3dn6tvXJyGyOqKNCfzW3TjmNzUycTsfVsLUE7Qxc8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fxU1Mr/GjtvTyfI7+lqmeQ9UNUacoKs9yB/pdX2WUj8qjmvUExRnwfTjJHnPIh+PU
	 pqrD7gMHTk9AUUekDyHYJdteHlhotZbVmijDL5WvrUlOzRJw6wiU1eeGuvAVGgOQBQ
	 5QcZGFdvbGvPdGLl85Ps427sveuiPJ16AtLAcMf3uirm6UZFhia6vlN9YrsyBJ6sAg
	 F7NeXPjJ5yAD6XQPhKqqeyMU+xfoaZTweVjcW/hAVH8+YxAQkCsPWwAHqfP9cHQvJu
	 RZ0GAYpyuT04Amvs/aWYGGX/d2hFjdRO81bMGTlwuTIWEBeruYnCUA0YCWLWvkoQE7
	 P5hspdjHrnipQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8962681357;
	Sat,  3 Oct 2026 18:59:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A9C1263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B34B60683
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QyJFnRsBxaky for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 18:59:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D63F960681
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791053986;
 b=aEB1havuT2X2fINCJQWCyGzLS6btciDhBOqpFrfOzC0Y6I/lqMWD2w/z7nKJ7ENoo3gL
 XuW8O6auaB/cKZuPWVViF9xCa1ApZdvyPRFcDygS4zOhnapFdkmErlQi81yD4kHkn0YRC
 5Bg3gpWke5NStV7Zst6p5xOYcfq7PR9PMz66NFoz9Z8zVuKUp6oVV51Su35ZdbOR6IGd4
 AmTqysHn0jb+c2GYLCOVUEthTR7it/Yf77LQ1maA0YagGDhTkkGnlAuYRg2FizfDTC8tC
 t+eD65LFVzrzCZMbre5DGqkAvfrespWi4o81uowVl+N8V+v2O5Av2BHXZRYUWNcvf9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791053986;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
 Content-Language:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=mWOb1wN71Wl8nBHaZ4wnLTz+X5kjNo8nMaAlBbnDRB0=;
 b=pF1s2itlmVoybQHWVtg0YU2Ybwq8uOPejHVlZieREVs/OeucgSUXLu9Giij1nom8OhQE
 9pEMH4awbH8gRy31u85CY5rtWksMoX5NyVBfaRPL9uPdCLIMR2ygiJrt//yqDwz6RLIJY
 EkU78ZYynyWOKO8QPVul9uQ3htF1Y2wYDVAdGSdzFYBosCSr59QCH2J74KNl4RVT1yFos
 RshSEi1/F/Qzn/REr5se9tfqa/xc28OTXUb4r1UGt10NmmZtIEn6WmYhhXUupYf/GcPDI
 JM4Rf3hIaOfXgnhhWxuAsHBWjkmyQb53lfgdWb3eVVFWeDYfvUfs2yWOgpUf/F6zQ5w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=R0sxnFAs; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D63F960681
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:59:45 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGz1V-1xQZci0sDr-00Esqb; Sat, 03
 Oct 2026 20:59:43 +0200
Message-ID: <5221c263-3a22-4487-bdfc-b6fad65a91d8@gmx.de>
Date: Sat, 3 Oct 2026 20:59:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot ML <buildroot@buildroot.org>
References: <20261003160713.1350799-1-bernd@kuhls.net>
 <asEp-UvwtZnTyfY9__33610.5728916422$1791044172$gmane$org@windsurf>
 <pan$688e1$f7d25450$3dd59207$f0732914@ID-313208.user.individual.net>
 <7a895576-8ee9-467b-bb1a-6cd8f9a61e76@gmx.de>
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
In-Reply-To: <7a895576-8ee9-467b-bb1a-6cd8f9a61e76@gmx.de>
X-Provags-ID: V03:K1:BcZIloWXIOiM+FSJA+/QZd2cCGKYWzf4PowMQXDhxLWvNXqU2q/
 4AqTzPgzvLsoCtESKMWK0oKfuBl4eNF3F9Qbo1eeqz9NThzJ4Io9a0szMFqeKhZ+gtgGABL
 sJJcpZf1Jn8vjO+tJefJqZbQm6y3Om19GE+pXWxK+qiXvtgxpfWj4ihrCXFlBzKw91HVMLx
 0q36CgBCPthjnIE7VTKfg==
UI-OutboundReport: notjunk:1;M01:P0:I4vw1jUeCqg=;IIvT3Qk4nLcL2KpAq6ZCXlymRoC
 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
 r6TvmzsihdPSyovFVafgMJYTCQ==
Subject: Re: [Buildroot] [PATCH 1/2] package/python-scipy: remove license
 file
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

Am 03.10.26 um 20:40 schrieb Fiona Klute:
> I'm not familiar with the Scipy code and so can't vouch for its accuracy 
> or completeness, but all the "License:" values given there are SPDX 
> identifiers, so assuming the list is accurate and complete (if not, that 
> needs to be fixed upstream!) you could just gather all unique values 
> from there into PYTHON_SCIPY_LICENSE. :-)
Slight correction, there are two entries that don't have SPDX 
identifiers/expressions, but those look very much like simple mistakes. 
I created an issue for that [1]. ;-)

Best regards,
Fiona


[1] https://github.com/scipy/scipy/issues/26345
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
