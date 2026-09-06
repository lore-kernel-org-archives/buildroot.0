Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D565C79F8C
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 19:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5975D605DE;
	Sun,  6 Sep 2026 19:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6I9p6UgOFkWm; Sun,  6 Sep 2026 19:31:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6CB22605EA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788723079;
	b=VWxPKkUk4YBo0uyr3jU2e9iGxmWJvBX0oX5fXPA1mvlFPeYPqK+gXQ+g6J5j88gTuYvQ
	 Q8quXFbV6YYt45L5/IsnWdXG/XlBZGdLUJ11AOSVxgYFr2FdFk1Kmhx+y/m1OWuauQC5A
	 7J7IqF5L2ysMHg43fp17bWtbNcKOVGG4BNaRKGEb9+WwLp++CqCAQTXsE/EZ1JxYzSTCY
	 WKHwTMT3KC9GEAl/NHYS7mq1deGGUNo5uJoFRC5UeudPLvR5XQsaXqqP3LTonPWxGOtBg
	 pUkMnBdRwNeuNBfl+KXc1KZXf9zka0ow+abcf9OQwhsuDkjMipGwVuk/vv8tzjn3rEA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788723079;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=GzD9iedN8uwhjG9B4WcYK1xoral3vQ4Hrbn39A249X8=;
	b=dI9OREGICBZAoO+Bh9Bk7zacOmHBy+AMvor2201Zq5hcNBrB/8KwvRrLwhsvbcsXUVzN
	 t4s8hj+IR8eVaUL2tpNRaNdbSnVseVyJu3OENDk2sEYeUIyCbTX6HALSx9H6wREUk/Gns
	 ePHoAYUtZQ18kTXOp2a7pKUHhJyQ8G/dWCc94DHk/EENIQee+GVbxDRFRvnJ8poWdVJYB
	 XoRM+1w8y+4v/ELkRgjOhImkwnVM6M+QUoBVLluZTL+kBFWS2bMg7Pemx/ULlusu2Aj+x
	 +U8LhYY1PIsYyYqf965nG7ErUim8WUknm53Ln34T0sxWf6j/RJ2sxXQ+Vu4i+RpxggA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788723079;
	bh=GzD9iedN8uwhjG9B4WcYK1xoral3vQ4Hrbn39A249X8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QIQq7OLI4yx5ZlCJo/3kMTv7CmPA5EdO+wYjyXR28+JXTEaWk8co+Q0RMtvAyBBBo
	 4QEfUusy/j+Rwr2G03olrRvxwef+k5dwFGIunz8yqpksmEeC/YY26E9fTY90RA+GYt
	 hfu5UodCgKUyLbnn2KCv6GF3EuZUooN6BYvY61n/GHfpatNcDMp7d9m+FTCFtB7U3E
	 S8FQNsvOhVWWSaNyTA0mW95PpCdDcKr0AJSt03tauobAv04XtiiPdbb/pFqKo9irHg
	 dZrpzCA2V/T0DB+AD5MaTHQyxOcC5eb81JcVx44ZwfOWH4JvS/eOAZ5kkF3fNMEf3r
	 HHQ0MHw9E+YeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CB22605EA;
	Sun,  6 Sep 2026 19:31:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2284D970
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 090164008E
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i3gnCx7kGUEO for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 19:31:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4725540079
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788723076;
 b=ZPfKCzVYsVRfGb3xzM2OMdzXom4/hOTPTX18IiJ+o5mastyYr1cw+Vx/WM46HM4ec3g5
 uhvoZ7q+sMxKSwRTo2HhF7WU74khAQadeKuXb1GAD0SRpS5rD61/dBH/cQLAEJUmDmbD5
 hJp3OAc/4qS+hMADpYHrXnSozF2NszzjvVQj+tTzJkvhC+maaFeb02ZJNvYIi58lIknrS
 mto7y8z1Sk9aKYcYCul39i2WPSPuP4ZuktSDCVk73OL8GeJ8kkSogjQF5BHvxzWdFWoOz
 CDt+qiQ/GgXKn01ocJkD2rXiDDJe+Yz1oZ5TPUvLbskJmsS1uo/EosL4qeMa9ntT2Fw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788723076;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=iA2z8xSQLDi0bEuTd7NHOUaNw9zVIo6fmKAU8gXLBx0=;
 b=bEoJd/rzmYQZ7KmneWzbE5bupqpuRyYRAi5oTb/rgVlw/osPlP++2Wnvqyh8hbnXgEih
 oQzqLajMlJGhPGFvli2Sl43KXciXKLhO0Dx4FaNi6Pq2rlxDnvrEDC5xKNXKu14C/C2WJ
 tU7s1dMnLxgpONJZByHfngah/MZZY9KWRqsdk7Jxgvy6nzfDSXaqz1aUfAoZFbXanbjYV
 dyTqunKHqlE5sRHocL/tCQ8P+4fks9knihLaYSQ/Lk8YmCVNlGke5FzxgL6UMgjZcXRXP
 3PHhC+KF1y7dmc3vRG1a3DyfmB//J5S2r24PlH27ACIlH2LESj0KDF27eoylb3SuYog==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ANT9B7zc; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4725540079
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:31:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWigq-1xN6fQ1Xb6-00MR25; Sun, 06
 Sep 2026 21:31:12 +0200
Message-ID: <12d9ffe9-3f75-4819-94d1-59c970ae0ca3@gmx.de>
Date: Sun, 6 Sep 2026 21:31:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Daniel Sangue <daniel.sangue@sangue.ch>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>
References: <20260905122040.2054789-1-bernd@kuhls.net>
 <20260905122040.2054789-2-bernd@kuhls.net>
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
In-Reply-To: <20260905122040.2054789-2-bernd@kuhls.net>
X-Provags-ID: V03:K1:jDyS6pneL6hoYXJ4ck6nQQtVx42g2h9Vt3dJy1eqs6jO6V3l/si
 Byi3l0Ic9hEcvB2xLD5KbznWcuOLEWK4K2aKkNVpIoQxhs1vji1AWvmlK2jlQSUR7BdQxWw
 JFPSTMZ/e9Qz1SNIl2MdZMc5sKS7kuZ25fR7RYOd/F2FFaRC+WevvPc88Mn5tgIY6Du7sxo
 SOBUHxTK+WlCR/Z+O5WhA==
UI-OutboundReport: notjunk:1;M01:P0:taFA5mI6LwU=;43pjS3LhdSaqzFyXRnG7NuidOCw
 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
 Ybf0nNfg0ME/ZSe3uevaq8zT9Q==
Subject: Re: [Buildroot] [PATCH 2/7] package/libselinux: fix build with swig
 >= 4.5.0
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMDUuMDkuMjYgdW0gMTQ6MjAgc2NocmllYiBCZXJuZCBLdWhsczoKPiBTaWduZWQtb2ZmLWJ5
OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0Pgo+IC0tLQo+ICAgLi4uY2UtUHlTdHJpbmdf
RnJvbVN0cmluZy13aXRoLVB5VW5pY29kLnBhdGNoIHwgNjAgKysrKysrKysrKysrKysrKysrKwo+
ICAgMSBmaWxlIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKykKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL2xpYnNlbGludXgvMDAwMy1saWJzZWxpbnV4LVJlcGxhY2UtUHlTdHJpbmdfRnJv
bVN0cmluZy13aXRoLVB5VW5pY29kLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGli
c2VsaW51eC8wMDAzLWxpYnNlbGludXgtUmVwbGFjZS1QeVN0cmluZ19Gcm9tU3RyaW5nLXdpdGgt
UHlVbmljb2QucGF0Y2ggYi9wYWNrYWdlL2xpYnNlbGludXgvMDAwMy1saWJzZWxpbnV4LVJlcGxh
Y2UtUHlTdHJpbmdfRnJvbVN0cmluZy13aXRoLVB5VW5pY29kLnBhdGNoCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5hNTAzYTljZmY0Cj4gLS0tIC9kZXYvbnVsbAo+
ICsrKyBiL3BhY2thZ2UvbGlic2VsaW51eC8wMDAzLWxpYnNlbGludXgtUmVwbGFjZS1QeVN0cmlu
Z19Gcm9tU3RyaW5nLXdpdGgtUHlVbmljb2QucGF0Y2gKPiBAQCAtMCwwICsxLDYwIEBACj4gK0Zy
b20gZmI1MThmZjQ5MmNkNmEyODZmMzViNDE1Y2JkN2ZkMGY2ZTNmYWVkYiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKPiArRnJvbTogUGV0ciBMYXV0cmJhY2ggPGxhdXRyYmFjaEByZWRoYXQuY29t
Pgo+ICtEYXRlOiBUaHUsIDYgQXVnIDIwMjYgMTY6MzA6NDQgKzAyMDAKPiArU3ViamVjdDogW1BB
VENIXSBsaWJzZWxpbnV4OiBSZXBsYWNlIFB5U3RyaW5nX0Zyb21TdHJpbmcgd2l0aAo+ICsgUHlV
bmljb2RlX0Zyb21TdHJpbmcgZm9yIFNXSUcgNC41LjAgY29tcGF0aWJpbGl0eQo+ICtNSU1FLVZl
cnNpb246IDEuMAo+ICtDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKPiAr
Q29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+ICsKPiArU1dJRyA0LjUuMCByZW1vdmVk
IFB5dGhvbiAyIEMgQVBJIGNvbXBhdGliaWxpdHkgbWFjcm9zIChQeUludF8qLAo+ICtQeVN0cmlu
Z18qLCBTV0lHX1B5dGhvbl9zdHJfKikgZnJvbSBpdHMgcnVudGltZSBoZWFkZXIgcHloZWFkLnN3
Zy4KPiArVGhlc2UgbWFjcm9zIHByZXZpb3VzbHkgbWFwcGVkIGRlcHJlY2F0ZWQgUHl0aG9uIDIg
QyBBUEkgbmFtZXMgdG8gdGhlaXIKPiArUHl0aG9uIDMgZXF1aXZhbGVudHMuCj4gKwo+ICtGaXhl
czogaHR0cHM6Ly9naXRodWIuY29tL1NFTGludXhQcm9qZWN0L3NlbGludXgvaXNzdWVzLzUzOAo+
ICtBdXRob3JlZC1ieTogSml0a2EgUGxlc27DrWtvdsOhIDxqcGxlc25pa0ByZWRoYXQuY29tPgo+
ICtTaWduZWQtb2ZmLWJ5OiBQZXRyIExhdXRyYmFjaCA8bGF1dHJiYWNoQHJlZGhhdC5jb20+Cj4g
K0Fja2VkLWJ5OiBTdGVwaGVuIFNtYWxsZXkgPHN0ZXBoZW4uc21hbGxleS53b3JrQGdtYWlsLmNv
bT4KPiArCj4gK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vU0VMaW51eFByb2plY3Qvc2Vs
aW51eC9jb21taXQvZmI1MThmZjQ5MmNkNmEyODZmMzViNDE1Y2JkN2ZkMGY2ZTNmYWVkYgo+ICsK
PiArU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KClRlc3RlZC1i
eTogRmlvbmEgS2x1dGUgPGZpb25hLmtsdXRlQGdteC5kZT4KCldvcmtzIHdpdGggYW5kIHdpdGhv
dXQgdGhlIHN3aWcgYnVtcC4KCkJlc3QgcmVnYXJkcywKRmlvbmEKCj4gKy0tLQo+ICsgc3JjL3Nl
bGludXhzd2lnX3B5dGhvbi5pIHwgNiArKystLS0KPiArIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvc3JjL3NlbGludXhz
d2lnX3B5dGhvbi5pIGIvc3JjL3NlbGludXhzd2lnX3B5dGhvbi5pCj4gK2luZGV4IGM4YzA4YTQw
Li43NGQ5MjNlNCAxMDA2NDQKPiArLS0tIGEvc3JjL3NlbGludXhzd2lnX3B5dGhvbi5pCj4gKysr
KyBiL3NyYy9zZWxpbnV4c3dpZ19weXRob24uaQo+ICtAQCAtNjksNyArNjksNyBAQCBkZWYgaW5z
dGFsbChzcmMsIGRlc3QpOgo+ICsgCVB5T2JqZWN0KiBsaXN0ID0gUHlMaXN0X05ldygqJDIpOwo+
ICsgCWludCBpOwo+ICsgCWZvciAoaSA9IDA7IGkgPCAqJDI7IGkrKykgewo+ICstCQlQeUxpc3Rf
U2V0SXRlbShsaXN0LCBpLCBQeVN0cmluZ19Gcm9tU3RyaW5nKCgqJDEpW2ldKSk7Cj4gKysJCVB5
TGlzdF9TZXRJdGVtKGxpc3QsIGksIFB5VW5pY29kZV9Gcm9tU3RyaW5nKCgqJDEpW2ldKSk7Cj4g
KyAJfQo+ICsgCSRyZXN1bHQgPSBTV0lHX0FwcGVuZE91dHB1dCgkcmVzdWx0LCBsaXN0KTsKPiAr
IH0KPiArQEAgLTEyMyw3ICsxMjMsNyBAQCBkZWYgaW5zdGFsbChzcmMsIGRlc3QpOgo+ICsgCQkJ
bGVuKys7Cj4gKyAJCXBsaXN0ID0gUHlMaXN0X05ldyhsZW4pOwo+ICsgCQlmb3IgKGkgPSAwOyBp
IDwgbGVuOyBpKyspIHsKPiArLQkJCVB5TGlzdF9TZXRJdGVtKHBsaXN0LCBpLCBQeVN0cmluZ19G
cm9tU3RyaW5nKCgqJDEpW2ldKSk7Cj4gKysJCQlQeUxpc3RfU2V0SXRlbShwbGlzdCwgaSwgUHlV
bmljb2RlX0Zyb21TdHJpbmcoKCokMSlbaV0pKTsKPiArIAkJfQo+ICsgCX0gZWxzZSB7Cj4gKyAJ
CXBsaXN0ID0gUHlMaXN0X05ldygwKTsKPiArQEAgLTE0MCw3ICsxNDAsNyBAQCBkZWYgaW5zdGFs
bChzcmMsIGRlc3QpOgo+ICsgCWlmICgqJDEpIHsKPiArIAkJcGxpc3QgPSBQeUxpc3RfTmV3KHJl
c3VsdCk7Cj4gKyAJCWZvciAoaSA9IDA7IGkgPCByZXN1bHQ7IGkrKykgewo+ICstCQkJUHlMaXN0
X1NldEl0ZW0ocGxpc3QsIGksIFB5U3RyaW5nX0Zyb21TdHJpbmcoKCokMSlbaV0pKTsKPiArKwkJ
CVB5TGlzdF9TZXRJdGVtKHBsaXN0LCBpLCBQeVVuaWNvZGVfRnJvbVN0cmluZygoKiQxKVtpXSkp
Owo+ICsgCQl9Cj4gKyAJfSBlbHNlIHsKPiArIAkJcGxpc3QgPSBQeUxpc3RfTmV3KDApOwo+ICst
LQo+ICsyLjQ3LjMKPiArCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
