Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5F6CA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 18:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 883F180A54;
	Mon, 28 Sep 2026 18:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IX69MqJIShwY; Mon, 28 Sep 2026 18:35:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9886680A56
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790620533;
	b=N+RPYLtxA0ROD7pMQWC3KSdlF9BKDGRy7mcOdh+tikxmxJF71LqzLMmH12rQ5raye1fV
	 n/RLuMZuSMHA2pIrPMZLtNLZiFy6HdsJArMqAudH+YpwSk9qYOC8VE2XYnMiVMh6YyPYK
	 ADxLwSgLZlNO1yZwGboa5B06/derFwT4dagKH1bC0WwBGfSENXAHx6NvmVNlxKT28afph
	 7u7xjQtbPA0ZxHn9Ts0PkX6XzIkX+8TQ7a0DCyzmqIGIHLjwTT6iYl9of7kuWOM6SQbco
	 NqOh9yjfdUSqI8D2yCKLWuNW1b3ol6ufyU8b5e+fp5UMdnxD0A3UWhZfeKuDfsZ1M4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790620533;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=LWDQF4E0bhmuEPpRG2+jyervtrEfDJk1yMOdFN8SgQ4=;
	b=RweWwpismT3foTeOzaRHW7LJaUfmvEY6VfAaq3XTuy2y5DFlXu8xjYezqmsoHd3UT4U3
	 szQCv7sr1ORjjpGLkX8htJFFtWi3mGnhS1PTElHzNWUdqPbTI2+Ri/w9CX6LxsOkXoCVp
	 74zs4PxKwnJQTzICgy6o135KXnndFgcI9f/ZxGHf8WpTjLbkz1oDhHrfGQkJg2U38rYdI
	 ME0EWzi+SFPgDnPNpcyU0Qq25oeIIPA09PZEfXAcat3pv3+LDtb6Vdou3CJRrwPT8w8NN
	 5RrbmxA1z2fRHrSdEEn7dR5Za55qSeKSSg0pJX7yB0Dn3Ujh92j6OuFSjaQ7LzhKW5A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790620533;
	bh=LWDQF4E0bhmuEPpRG2+jyervtrEfDJk1yMOdFN8SgQ4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Yt8ilBBoYy/DEukQQZP/j0OXmCT24gxbK7U3EzZkfrN5NdgPe2i9oKHyRh1A0F/xr
	 8vBIhwtVQSyIAYV61RogktgxDT7ZIJaQWI/ffXm6NKQ34EwSQvASWUe0E5AWnHITAS
	 2TNTkeRIrjvKFHhTS3VugOFNhckzVfzhczJPbDpN9bJtKVUdhR1hMkGRnoG8MVjITC
	 38p1srT8kISDJAdOJdVKoW99LqMGpiPqrAjklqyxfPVQQxvr3lRwMurAk3OX4CK9kE
	 emWp3Jwm8MhPVHBVozM+lR9EYcoveSHDa/ngfo7cXb+/QlCkOFx3nOlR+Y5DO6mWX0
	 kiNJ8rxZs4mwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9886680A56;
	Mon, 28 Sep 2026 18:35:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A121CD1
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 18:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 956B380A56
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 18:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0x60dh31ucW7 for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 18:35:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0D94D80A54
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790620530;
 b=kQo5O2SB5sYFxqHhG8Gn5Ji9blPABbbiEnFByOegXcJlkiJmPTk52+is+H7jCwS8snW4
 Lydut2Feadh+JfnjO5smtJvlmdmm8hlzb2NPO2fUNIwgF9LZzspBYbUIB4RoCF7OVDmp+
 8UTmviYw5d6LzXMx7PTGA2xgnRHNp8GLCfiWg28Ucw6SMZ2v2fiy1J00+GvgIdPD4aw71
 qPkSSrG3ug9bgi2NQxgnBeAljb7wC4YmY3AOVLEFc/R9EPIuarZ9Mwl/BJc7hSzfD07iV
 gfC/HqOJVPd3TK2HppDbNLd4VxMIRg1CDgcOXMYFWsuq3Vl6pYH/9mOrie5unM7sp1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790620530;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=9sqvSmwI25KSEz9abXykXziw0m+DlkO6BKcL9X2FwO8=;
 b=Bo3PRAmxWA6pSj9eZQrPbHfRyEzrwfal85ybS2gmecOJQJP0FlT7rtoTeDk//UL/Qmlv
 Cyfqs2Jp6LLNJKm8CFdd41VawD+GnEGuwZRX0f+dCMN1FW5hf1FojLqNBsq/3wfxY/cRT
 C/souMJZPNqVfTN7yDQLjvwJPwpzyfeBbSOCEY3n01kkoDb0X2R31JUVJjjA9tbddDiJ2
 d2D5ER0lX5RkjoVOFcX34TTo3iWTD0xxSzQ9f9aVDg7lsqKwvqsnJhZw+94unu5DjcRxu
 O4Wvl0PyVGJPeb0cQHbt1s7jK4myxY/B4ev70dgcpawtqF71FMXtZWRnZDuCrq1Wqww==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=sMmlfmh5; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D94D80A54
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 18:35:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MlNp7-1wSHK61KUX-00aMtG; Mon, 28
 Sep 2026 20:35:27 +0200
Message-ID: <4948b524-7666-4f1e-8a27-39afcb8ebcb9@gmx.de>
Date: Mon, 28 Sep 2026 20:35:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20260928074641.1017968-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260928074641.1017968-1-thomas.petazzoni@bootlin.com>
X-Provags-ID: V03:K1:3OAZjZCq6Fet3Y5X6i+X6Q6kcpal7qtrJVoW8asJZWwlJL7yBjW
 2lP99EIU8AQtl4sROH7tasRLmoHPvDpSDoskoWJlOena13z/oWWfZpm42Tu1MiAENA3dNjL
 qOUsHTJEqQDj//B4bOcrPUvE7kIo2FNoUpSnNXEIVnbAkMBBKBwlTLxpqetz03CKLzGEEFa
 oWE6zjwjy3bbMFpmsY9cw==
UI-OutboundReport: notjunk:1;M01:P0:X4jYfm3uU6U=;6cc7imwElKvoStTmWGXQisfrzIt
 O92tZREy9m7pvNcmeYho3PszgLZ2M9EYxD6Joptbu4TItwYe8SkVfV/WkaEFvRX2PKS1d7Vsd
 QrrjVuKKxtvYgCJjDoQI857AMZyjLHFWrNug1jXzyZATBkDtq+WX4/D5ShJK/hn7wlPCSueTt
 0RHBRbdIpvwT1FwHDC4meAhy2zJr+fYQAQ86dirdM3WXZIllmPTWBi+TBYBtO4mEVkJQyXW9h
 K9K32KQMXlbCaoaB8wyEqmzOb4gQSlvEcN2joA1B1Gce6eS0BD191kVZ8v6bnwYOQhVy7lY7P
 cDgNmfEgbAxadxHLoejZN8BaG/d9GuCgmoxrvjMACrCyUcm1+BkuG3LzqRfwOiS/w3jihUuCN
 BjQHya8NUg7IHkl3yiqzOA91faLM2kVEP57JHNZYdyFql9Wbsq4aawEca8+GyYRXt3o60T+JY
 m3XGVi5UoKq7Z4LcoHPNazNpkpLJrl8XALxLRlRsRpnl6hDinK9qfoha6b/N8Ai7vZhdTaPDQ
 7A60PHPNhMctG943D/NordoXXhlvYi98K8kZR3sJIcpaQv5CyCY/tGG0O28yzoPiUcJgoyvW3
 g5sk6TLw74OVt3MznUMOWjnjPWBck5nDqLyH0vJHAqGn4oHMhhZ7S6wEx/F4WGFnipg5pmapM
 71sgO6+dsTT4tkTOe44uvUkn55vS/YMf/n8tkCIz4uXIzRo1WG4HFAEwHCi4kRQMtfY2zHuqB
 FN0hyhufa3Gx6Uvv1oIu9L7677yzv832d5PhomM4I666DoqmtnSP7/wLAVFd6eA2YB43X76kr
 hpmb5wJdeSb5gmpJFXnew/ipi7gsG6kc+6/MUgBntkbHdaerUGzKNzpfJ+3eKGC+5UPoyvoBX
 MzOmTd7IUpFSC5zbFhYGfZFngCQIZOW5ZXMMBlHTK5eopDJEPsEDI9DBVZoaZ/kSoCEkg9k05
 g3QdHncFU5sF7QN+px+xk3eQsFMmo+TRqI4k902tUdaBCel2NTaFhyKj9hgLgbmatPe7kyNwc
 uuHYiHmFScEB5TSIwxGbY+B71hLOEQFFbbivECM3UMPQeaZXjQsfgu7VJYpFll3O+/IQgXt+5
 u5kp4R29LY2I+uL1Yw1xlBljf4RDSejWU9KesN0HtU840yHQGAEvCVPhwjwlreh5gH/gEAHYH
 6b7CSMsehI6deTSrIZSVOrTkmiVnV7AVMCKqaX+uGGT7OQ1dStw1rBrhj84XWLQ3plhIKaXwG
 mbItmLz0iute7ocOFv98D2uN5VYu422IY1Nxs9AA+Thqur1xkUC0cDgJ7WTXmhacw8T8iU68G
 FdZZm77RhMOZxypBdK88OO2NPw7WAVuO/5Veoi4om66RyNj3WRjPCGHCVS9rGXYPS1cf5c8Yq
 bv/qvepAhRmPc2FQuw0IPLUXPH4H3rFKXlt0wwGe0a2Q8TjtmQwOsJkVEl3Rm1GwVVG0oELOI
 Tt56t1Q+uu9MJqbaizhUy5nqWjnwkg88WF/6kLE+Mm7bcj/Pl3F5w+BWiEn6VYZF7l22qHgFF
 WvNLSWnZ9jidg/ttjutfHz0PJChxrjFz9cBlOLtn/9C3AEhVK/5++0jNY6qyoeXnXK9Wm8xsf
 lvbEKWgi468tBJCfOq+qZ01ooqDB3+K32xQw2SGAYw0DwHqHft+dIEUzNtJ+5V/EXq6fBcPPa
 aYXTI97zDC+vIrnYXnjv+cKH6IQP860O0KWMNZ6gTjboUBNZE5lBKncWt39PDirkax1BO1tfg
 vcgBAQSsGvwQEEolR3k8xR2EJI7qsRVCOM81ltpSTblj/ddTRxuEnsbgSY4MrcBAJmqjFLV3v
 cMI7HoSH2JzttIRr38ObQtplU4NQcWptrDBUuZCWro3hIuHIL6LUT1pl8ErL4BddDBpXo3zXl
 ZPiRh/mrl9QrBbFwaczmMVrFd7GnQqilzShetWL++W7afeZ1iEmijIa6t3menhY7QX3VKAjwc
 R+I2YpwrjHXecdcIwtk6GAWP9HGoNI/WPQMo859M6CGT7ooVPVKXT3NFutpBcwG/ZKpbLGfmE
 ryu6gOMjs7wXTT4aZUbEn1PDzbLKeq6XGp82UTqTAVOZNRdGY6bMrF+WYpMaudxyQP5JTiEp0
 UAJe9QhjG4aVgHfHeuc3//j6hFWCcBxbzK2PbHjixLx5YzaQC2LSXwAyKJo3X3+0WzTqekFX+
 wIr75K9x2xgd15wrAGWyqULt508Oellb59ZpI5dFboxNe4cQI7owftbM85fzvtEUUbve98K2e
 744pfdPj4+FAStC6H/zO8f+WvsjL7ipYvHAZOZWc/9UzBvDNWvtWUAqOCs6OuQQc5htoQn76/
 JjjZ2eGNNALt6VgGcniFqQDJOS4MTOTfj3WgHuHngbJtRQRF7am6bH/MihefImAxyNBI3Ejtq
 HKLFumqI4YTvTJCo5gTleSPCu09iXibxB0mvNPRLRCVnyC9Iq/yeICekO3oe6q/aIrljHzIsv
 nzUqeDf4mt4R+ItgDXsRW/2UQENahrzQZ0Am4PexhS1RG85QMfHQUYG8uouCCiXp4Li4y1WFq
 XW2jD52q7YDUNW2wis09A/J/f86UJhwsa/VHMbAytmYYANhILZAzEVgJc0OHfUY2Kmuv8HbR8
 DwKTthpvBzvcd9iD4SFHDSdo/TzNwW5/XnqTdPBiwNugbsYk9yYOSXjGv+LgAQVihchY4dhGl
 s5Y+yKv6SrIx4WH5bc6yilVTqqPSQ3P08O/DsfNdQVY6ScgWyXgTIJKWJKQKpO9eG5MalWacb
 5aQoGDMjXUu/YSzEOrEi3LjJux/5wsZNiTD3aTF07B1sM1YKzxI2ETU794oOUMSh8bGsDkUE7
 J2GSRYjT9fR/iMc0e58E+y8QzuPJ7M1lixTKZvYAc4TcM8bvHh32P2tiBVuYMLz9PzAH/EI1X
 /iSL4bukKqON1BoLZixxARZf/uHTvQXU9ZoZJErUkR0dmRr4tMPPcjH/bg6cGC7lo1NDKrucP
 R5T+Ow28W+uoJ0SeLdZyDueWTEK6EtHg94u0QWpad7AArrX0zmo4d9UdaHHn2q2vaq0vjAmpC
 8A7cu2IcYE7CDJzY57b/zcySvcD47xziDn2Vd6xpzLMlRocorf9nUDsndGFFpu6isggdWcrf1
 bGIv3mKQIE54ZfvyqfXFsEkL98M10jMGPsoeiY4qKnA641aRja5nOpMjq14fRt86iOqwat929
 SoYwlHIGgBDSLvcJvX0VUowl3UUGp5HtNEf1nmsueWx3FKLGgzpN1JHd5KlOtILNtV68Py47f
 FR7jsY4U946SE9vRnY+SbcIcOqPMuxYJa0wOH7tXd1i89m4lwmvZzK1ywnFWIU1z9C8STAaYE
 ovHWFlqe4bOxL2/7uaJuEmuVbMBbxt8f/ZlTmCVQ/5p1Lktbn6h3pGP1uCBev7jRZmcwzy+yS
 JxyT6TrU8yRGPUhpWVkORw7seIELyAxE5VegtZ9vmqzrw+PRlcqSWm5Xk+h9xBF+esONX9DRw
 PH53Pgy30V2XbnXbBp/7odaeRAYqvfE0ff5lVli7vOcWc038yqJxu5qXTXPlIo70ltaGgoqWW
 rK7+r0H95dJ29y4uHfG6zOsPz7KbwDavDr2uAjx8N2Q9wk1ygR1IVMj7t7ZaWzg25D4JBRe+3
 3oHpWfgzYVBphqMUIlJY+WPdaOENgUeyospANLrVjfFzAdzfjwdhfIyglsv/CywtqjiB1H4WQ
 FwKhUOHuE5MuzO9/eB1FytxxpBjxMhhNpzANZrw9pYr78LTCZFrrKrMeD2p8nO2XRRvvxGMot
 /CC7jVqyFvSdbYWw/OWxdRyedn5hyiLYTJTOl2rhSM2xjhejdOg3uSo6iRpt2A2ouShOuLyEe
 LIk/NzkgY3z49yiUHv5juMl/vU7uIPCY1UYPnQ+AeVDTL/mkPQWGEq3B2emm2NF79+Fwi7R1G
 Wz4fJ0WG3dXANcwcwfebT95nQs0cV/iGsKKWMySmRomdQJGN7PcAZ09m47zzM+ShjI6Dw/GgB
 5zl/155LJkldzA7DUJ/akH9tRwAHEacVtMJLetPN8XDY8B9dNTITl/A5at4c/uHlFP48d2SmB
 sx+aNJ6vkLwSYVKdCf640Aufc5rHaiIN7I9fNzmxsPhW2FzEbhOHtdeaBdZWq/jji5AnTp2Zg
 qKkdbAVNVURv2VFLmA5BMTRTPhyGqlK0dNk9Xxxfq1JxEKMGjByMdmhxaYw4COCpT2ndY9/IA
 niW3rsT8PJ0mrtynWosdLuTMmU0Z4oVIfM7Adl2K5tSf8iKvWWNo+skpY5/Y7VYkTGB6hao55
 yuU3EzxE/Rvm86z8Yv4EdQ2nYomUA4/rPbVjoqR5F1pRZYOMf/pmrUoH/Me2GCq900jNJdHcC
 n2BA01VXv9CccaKCyaZYfASOuvnWOZJ32haNlHQDMb/lXw4Bl1/CtJD9ClPcgx87vjDNUX7ji
 c5Z32TIIe1DEvU8mGX62qrcuGW23T2NuBicWjmp+/pwypmUP7h8huZ8OAplYqHRYDQX+2/uaU
 Anrn0eU4S2sFztw6p/HZqmjrYsr6fA3wThtkCIyxVsHrPR1MJRnAwuxkuRFxWKuDkpM9x0vT1
 L2Qv4zbQpcmp1JPvZD3CPauObzms+N216NWHr7N9MXxc6IFDyLCHG6BZWTE5jIdBjHBG59DMM
 pH+kwg/TuyzwkAjnqWRvlC21go+Hjp/DPeAGGaOlFxZRa6xkyzM3oHCT5uCFqBQ83i81QyHqY
 rDeDVU0mT9yJ1fTI+eenPgOHLH0XmWVbHG6vdKgdjREpmz4mJQHbHZJGLb9CUwL/HJNOpkEzJ
 0wS3rRfQ1e8580rzlin6J+hMzpOvaiPayDjvjzJHvN7eeuaX9HMb0DQnGu5r3G/nsKX8Zoik6
 pxa2iKi5kZgiZirLzr+dPdLIL4zxJTxmDrSHz8YgwCI9e3/H0nfd+DgN/aBr2rVr8B/U5VfV0
 7Q9jqfm6iX27kAuv5ysxSqOc5cdzdXlm1VaNzcrsmLW4wOBHH5pBkKqWL+hYLvM/7c5dSZHit
 H/bgrfz+yHzbmXOOia8KhxtFx8AbcXYaWOI0S5wW2zVmrK6cJGeMCjso8WR/hQMpvNCkDxUrz
 qwC/QIvDdHYoCwtwdqBe71Qk31jar3Oo2BKre+RdUUkRDeeKgpYKVqWWOdVbPMdUv1Z6ln2I6
 natpbBbWK34SUxBE/RWYk5iVwj01/jxTCSbzd7FDss3nxChGAL7leBLd4QMtcFU9D0oH9DN96
 25qOrBjdCn3qI2HiRtjsxo6xybXVVd9xQeG95g+bd0PNFq5Ml3ElZvw5yeYqZwOb5FXlyylXY
 s3QI6A/EjGmwLQiGl0FXBQvTyuO8+iwxXmxm57sgim4RiT5m+KuaFUu/Xy3yb/9JiM1Yo7zOh
 HRw+j1+I/e14BvL8JTz+ZAS9NY//HNR22318tDgv0OdLNdvMFXaPNPBsC5vnhW6P6YAtyChW5
 yzf8taVHt9BwZ9auZb18WkReYIuebt5A+yzgBccnsOjdj5KkxZx8PDkAXnYvgr217Z7nNn72i
 8t+DxK+8JdVNxRzDTLBEtDB1VCA8H3Zpqvc1LN35zzUMctGyq0Jq9iCHE2DOuyLSCIWS0rOal
 KaRGBtkZUV+WcDsuIvM6klAiT0AKzdLWndp4TlCFMzonbFH4XpLoQfTbSFJhRRU/9FzqpiBv3
 M/FzafN1n0jdA+FzJ0Mmf4qt04ZGAAVIRu55KwW78lx18Y/gxe2acGeOncrb9cbRifTbWpdtt
 l19WS+46xKV2exkKNaapMs3hkXsca+ztuOHeRXQpiCmrIYQMK2k33U9AMUSiqBFKzu1EMBQMj
 WFjS0ypiqq9WKWUfKz2D4AhCrU634v7rc9Xv84mfHQ4+JFyYaW6jZuA1Iz6nS8hw6GL2Cm0vy
 6sS72wGX/EvoVNHwEt4IX+67OdSpu9xCR8HPMTEHdUNWrmwFGBRZ0DrryPBGKjg7Bt7C/QXKg
 N9E06P93G4m2NrxQTEX91I/PqDPLXcTUoytaK94pNHNePBI67M0C0ddSzKHQR5Rk42sv/p/U0
 PQHeGSTCBlH1ld9/Yi1vu8Z6T+TEjbQeIkMsi9n+xACpvmCAtc5urPIDxG0NPyK+4/jnEYS3K
 hqZzv9G6TW/0Wckddy4VbRGL8wc7yu/6Bxul0FJ0UIxFAHKGCjdaYN83Cb0Ow8LFmmHNNHQr5
 yV2Ucaxaml8Kesc80SsDEyPFmJwjDCYtKmFkJXBRpWugjfPtqJWHP4V9jMaEhBZdXt542VPhI
 oTKrI+YCTuhRmOl+P0W4u5ehYvsvrk7/dhvEBjFeWnCmHy2LgJ9ErH4RwA/sBHXvYML7wjW/H
 T/THycH18aIdogiA5eKrpM/ciC+Ty+elkujlcCa/l0FEw/yy6SvYJg0XRGdMoFJhui6WzkEDw
 6R6bUWq3N7B4bWLcmIGVPxUj1TmuYRjCKNpDDQ2ZufB3QtxfBQwYJOMMiw/jkXCvfk9HJswVk
 cdSY3zVRDjT2kTa+3lrpuzQWCHTgTNPwz3ZEefA772xgNag=
Subject: Re: [Buildroot] [PATCH] utils/docker-run: add NO_NETWORK variable
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

Am 28.09.26 um 09:46 schrieb Thomas Petazzoni via buildroot:
> It is sometimes useful to be able to do an offline build, to make sure
> the build works properly without network access, so this commit adds a
> NO_NETWORK environment variable to our docker-run script, which for
> example allows to do:
> 
> $ ./utils/docker-run make source
> $ NO_NETWORK=1 ./utils/docker-run make
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>   utils/docker-run | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 27c169db72..60a12455d9 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -21,7 +21,7 @@ declare -a docker_opts=(
>       --user "$(id -u):$(id -g)"
>       --workdir "$(pwd)"
>       --security-opt label=disable
> -    --network host
> +    --network "$([[ "${NO_NETWORK:-0}" == 1 ]] && echo none || echo host)"

I thought we're trying to avoid unnecessary Bashisms? At least that was 
part of the discussion for my still-pending BR2_EXTERNAL patch [1]. 
Plain POSIX shell for that check would be:

[ "${NO_NETWORK:-0}" -eq 1 ]

"=" instead of "-eq" would work, too, but it feels a bit silly to use 
numeric values and then do a string comparison. Looks good to me otherwise.

Best regards,
Fiona


[1] 
https://patchwork.buildroot.org/project/buildroot/patch/20260405185608.1357633-1-fiona.klute@gmx.de/

>   )
>   
>   declare -a mountpoints=(
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
