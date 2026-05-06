Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0975CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 17:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B97160EB8;
	Wed,  6 May 2026 17:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsIr5w2zOy1V; Wed,  6 May 2026 17:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6969360EB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778089796;
	bh=GbQ3gbqbxWPEgQXOpmS2ZM754sHZZCEgpCXQRq0KKEA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oNTXgWXkRbVqxAQB+EEn7p6gGLGq5BBDf/ADpYG68+X6HDbQG1xtQgic/ubxGqfaO
	 AqlhfFeLcfuKyRmfI6iaXO1OxyvlsVCqDNozzSViwi9nyET1z5YO04MIa9Nrwwq4kH
	 surzd8cuz3LKVxtVfeabenjr6BoGC1esocDzhOjHSsYZ9wNjxDFpHGcEHnOZwQuR+P
	 CCIaiMFtrgXj/grKDmhhOhqyUtvLyABgPY3GwluXrtX324r6ICL24E7DBZjG6zmxoT
	 iD7FoQTITTEAyQhZFBkNrkvcykTZJR8pWsaP4VOBaMd4VOs/QUsrBlX1pQlHFXQKUD
	 lDktwW7hfGucQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6969360EB4;
	Wed,  6 May 2026 17:49:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ED4211B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 17:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 206794063F
 for <buildroot@buildroot.org>; Wed,  6 May 2026 17:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88IX82DL38Ex for <buildroot@buildroot.org>;
 Wed,  6 May 2026 17:49:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BDF5D40482
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDF5D40482
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDF5D40482
 for <buildroot@buildroot.org>; Wed,  6 May 2026 17:49:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5mGB-1vDfTI1yjj-00qr2C; Wed, 06
 May 2026 19:49:51 +0200
Message-ID: <325e5bfb-48f8-40e9-b1c6-6081dfec116a@gmx.de>
Date: Wed, 6 May 2026 19:49:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>
References: <20260426153334.1026982-1-fiona.klute@gmx.de>
 <5db0b73a-7fed-403f-bc7d-22411a71735d@rnout.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <5db0b73a-7fed-403f-bc7d-22411a71735d@rnout.be>
X-Provags-ID: V03:K1:eV/vu6jxZ0VgyEuoQOxWaZKnaKfbNKyuqznZJi/ak2Bu8fYn530
 ppPTX0xF1t2O3pi9M90rmHKUnHhD3W4QTvfrtGBVRYbbT1QU028dnDHr03WHeZp014IIXJ9
 joqGbNaYlT06Wkh7te6z9r40kSDYEcYW/taZE8tq6WMhen0USw5j1uQtlFwija23UDWijI+
 zr385u39sbU7UFPDtEi8w==
UI-OutboundReport: notjunk:1;M01:P0:jk2MUf4L8I0=;TXkUfzXOSjQpv5xiBXK+H86yMpG
 2M2qpSmNHudQxzMyt0PuYOCei3nGzdER7rRYOtpGAwlc3A6LVN7kgecxwYOaITS0ESVIQNTB1
 7vUOAstq/k8kENyeIgkxAR3ShTjXz+6Uj97WXfXWQuz1jmAe3UFiCN9vGmQ3H+Xm/nSeZo72c
 nNF8TJqDdeVsI1nq9BZa7ZI29a3azJezsV89U5xALvcyroXI+5rH145MiVb0Ojg3pppWlAK4y
 djl0ADuXllKleyr6oTUgsyBLEkuguk63Vdxh8UehmmEPuVH2K+PI59H3s1dvS+kcpQ4avHmyi
 EW6bZuNF2TCYiOVUrHMtOwD+H2N3Sr2KFDPnGTnPLHg0uHub+HFy60Ft0Tllz64tB3kmRgODO
 4P1FIPhsGZfyib3XC6TUay2RLNwRnWxzA7W0gxRoOMNkc3j1bgB7oUEiEf9s8gWJy+hXkUUeQ
 ElKqxzNgoTnIg9ydWHVWiD12YIMkdfElh+9RiM8hjzywcy/CI62A4JE3//aMXTujErMlrRSBP
 twRsD1SyLapwS/q/EYMSfWhSkeIy6/lXo3E2C85O41Ki46YFr/dAn2mKjy2l48iGjyR+jGpQ1
 lS5Esd06B8rtF84TqEHiflr3W9/FP1PoFaWrKk4wihvZ9o3c4UEApn3WwUf1GeDI1facOenYU
 pjGiAhPaJmqElHhaHgWfg5F7ru7aWA4zUJNi+u+R/WicDzy6W0meLR/5Tv03f0C6Mxrmak7cV
 mtJjs/yrxQYLKXvs2zJevAc6Qjp2aY01LbjYkLl1n8s/m+ePyTu1pyddNk916El/q4jhYTz3d
 31yFm5TM6WLJDf6pbNQP6TK+hpiW/jn8QfHfT2fWyExNnTXILc7ADXWsE7EESyzhphrhBb2+0
 nm8ahThUuedg4dDNaQOZKqXvI5p0zheoTrQohWs/2iKtO2jUkTlNMg//+pSkIE7rEIZfwomLl
 eZRUm9SqRvbjXDmG/X3LDhjfHGOcY77cIqUTNBbzFSK8yosfYKgO7DuvUB4y8IsRDnlP4Jmwg
 NdGgpxVqBaFbiild4JEyPVBA7GOXCDcY9qXNN9TI6j5XCh6vtlAvDyYLe9WRz3ad4ulbLgv76
 VD4/J3E7G8/jUvshfhaA7SoUAfzgxMgq8FJkLFYnejn+LgRw2Uhfi6tPW9nXf0j7hzmCr6EVN
 0AFYO9sisuDF/ryUVn3EHLXp3TOhM7TejS0qL7nMbSYAhxRQ54rSvH3izFbDKWmThqhZwAv47
 Y57j5hhD/oq7wob/GvV1fyvQMFl8ndalSJYKZg/hH6+OsuegSpuh1J/H7OFRbK8daHgwC9HpI
 mHsbTamWnnjpRfTTpvcyLkTIXN+vaQRNUigA2W7ytnHM0GoJxQsHpjAhEQhNfULvxThqyWWlk
 j1peARAj2CBRmi4Dk6tfYXtO8KftM+ar9nzVszZefNwJhz4asonE/WlMZ/UYqK+OjRPS/luPo
 J5uVSUYCyYfP23PR7tF/GNVFO9x5hVD2/f7SudnT0sFQfRsw92Pn1TO+E8otw8TN6j4hDM/Bd
 +Ukz541dmPIhIbxCZEFatCAu7xrLgi/hfdqOo4fuVlLhDx/GfN3NC91gX3uqljY9VE5wwq+QB
 G12MmHj+U5KHSINS87DDD3orEL5ib4JKWuClMdNHTWaM6XMckLJG4CoaRi9ZlGHdm25/R2gDD
 txi5AgHdpb4rCYKBTjjc+4++HQXEQvkv2sp6+fMrLX2xlSqjxUEASZBqqRVhG3yvnwuRY5vFL
 vHjh9FmlLjHKfxcF3McWaasWrdYyyEc75UgZWmP469FXuVLtNrUYN1P7V0Z7LfzbBUcozmUjt
 jMIJYC3/khqwA+zhBQsc4NgR4QQoJCBKUuoiXYYtl/Hj+HiD1i1VVgrUbP6FfRW0gdEjnAuDx
 8+KWIGVEt7xZYZVCitWpf8cDUblHzHe98+pz7XF8F0rS3eUta42JT0Y2agU2pt3G287CsvwRm
 7P9bd9qrzw/uCopUOCta9pvCkr8Yw1bHRC+caol9PYLd4/HTbhyZg1IlducPliWTdwscBGHEQ
 2Nr9Vrbt7shoBDyH3+kHAy6F7g6Uq1GAcsnfDgzawfqVAcCBr+x42uOhsg81NWPaFCOgIk544
 2uLHM723knkIfV+CkrSB14fTIorQk6psnM0mpw9tKjODml9nvrnfgypUWa7NIklsWX1FyOkWG
 uQpRLV0Lz7ZlIfTT3Sei8ySsNWhBS949ENBquwdbdK65ucPcUiloT6K/NhqVz7iZhTUkMgamF
 C/Zg07V68J/hDLHF5EeVLJh5wko/YrDnrx4qVaCK1uhadnAASTZDgu6lcH/QBDLyuVAmQNxXs
 V1M3lxZ3XRbSgjxC96IFTF8kP1rNyiMSeXedmaMcRcJtTp26rfD3EMXbkzV7NoKZzRfg83u9u
 VfUGk3axbmHfpkr/hL1JmOSGhwENPdBMf5zzSHBAvv5Oq8HwRmjgA++zpwKX+6jP2BJAW9z4o
 TaNmS2hw73NatEJs3Ag+7e5dOHohJnHVljhWtR0QMiUs1AUb847jzTtH5hbS2bJlLb8E3vYSu
 E4EtGBprnbY9uMypp81MQWwtmitzXGaILaZyShB19pXg0AJQTse5kLV/lDw77RCdKxwwDafmI
 sr/EV+OQ7638yb7VOx0QVe3lEArW6dfraI7yrzd7jNY7jweZYyfnBpnfnQ8qCBhI+3XbLSubO
 YBXHBViezwVuVicmN+S3CxvnPckJQQKR+UAtCGR5vnwgc2CrfyLRRCWx7xg8DIK95/CYF0ej5
 4f4MybXkW2gdq3yeutyX4SMCZl/8GjAL2/pz8YpEBG2gO90vbEfwlJTjh/f6Y8JtCVCmIMmpm
 4YbXSOGgv3C3GAvnC+kkZm9UfX958f7QrgqnsYzec6PT0a45nGuP31A+2dlTRORQHRtXZ/OJ5
 PtsNm+hZbeZc+h+1unkWnLGYqkzZACzdroP3JdkqFvUakiybsiA653RdkI/oob+pWkGxF+RYg
 KloWjDc4J/BU6g4hcbheWawDECKxLVNhNbG8BRJZEP3MEtcUbc5G05bHgT6vXRUMSy8vpCYdO
 P0hznprMD6wYamvFU2xsbXnmVowoBtri2izU3ScETlqFGVwPo1RA1XqY7EUSPbJkMP1bx4t2y
 KM++a6KaIkrNW+EmZ798Xn9Y7BzrFXzDnB93vCTL+oX2xZfbmiEREdMARHRckb4Vr+SFE8JJB
 +gw0Oy93n1p3ibueMxkFrFVZzpDDM3yqM8dK3R8eqwWSJYI4KpwuaKK1Om650L4Xd3miricCv
 MFNxKYO+ERF/N+ne4Z7TyFE8wFPcpoVxfTJZwEt93XffyESnEGFQTFA/6+JavosRk8uPQYTfj
 guaMP/3ZT1zUYXSGZHFeHDIZ9IQY4hZAjARiSjrwJLSQoVsAPZyqMr8CIfSbO0kXPDcsra4zB
 Wv4P1uN1FjOZDKrbUViErCZHnfrwOpOGuHlAZgGw2fszuFSdtvy2zvrxknCrY1ewqnxi8IpHl
 ztMeNVW6ZdfAvQ9fBQNg8g3mSQXAvhL5SvPZnrlGfsVTRYr2LPeVltSY94sAbVV+4gckr5ctr
 7dTxIn4rOu5UuZZ9xGmd5M+atAAXKQ/LKBJWbAEv3MTJ/cZfmHdAxcrZd+dmNrsZDbL+gGwLf
 iiRj2QietoEIDZXpp9sGz0nVsSyJZc5xuNiICLNvBZnCi3TAwIqbjmetAausCU733XA5vDD6T
 D5zg/SQhCjb4a+P7BgepL7exlsgdlraNOKksp4T+qSqln2dtoWsD8wsIl2ED+vRMeQb6aPe6p
 PCICLSRrbxUaWQuUbhu2krxTqdsfArZTrZ8lC6tYl4OacwzY178JGT1aasu1j444NHzxxqs57
 hBLLDU7RqtOFhrj44Cxro4LG6xLlgGUsrAUHAsl2+468xkYCO2SYbUErCDQRegfOlDwwsLm7y
 SPeiUQHAr/JMDDeI4l5Q/WyEoyw6VqxFbUOyt+odwTgOX+r4zfKMuj6IAnb+Jq4zQIs1IyIBG
 YJaRUCS8XYk1h9XXC9AHcwDjk4WKF7zc4bZ00Nh0xBCg3JN/atA2yyUnLtjHA6u+rT7aoYoWg
 0cU6kPjtUiQu2R5icrcpO3mlmSsVgnsj5WsMmPWlKikmUZkNmQPMqa9p5m5h9cDSflfSOPhzH
 CCJlf0N3MxMzXRnDBXVYT/anDEIyfgfefa7C41QgnspiDbkoKk9BkHYmxCDhs9R/bg9d4wgwt
 UiID1T2iGYWPovWBuOK8rcwU+EwYGu19dOMDTLDnfShcxonbVnYA0kXRJgA8KPxpnVoFjIvrK
 3zwZg0Ecwljq4bk5YFhDBc5B9WEvLWWfHVjpSJiTQjENvIsxIVtYhRRYC2uvyMTWFGLXW1Pfj
 Uff4q5hktxFJTGRhPHR2of+mkONHCeubC5hPWD6622zhinFpnbKsG6x1ucMe9LMO43hj7cIql
 XTdyUjf9mNqIuwFB7H6qefa8ygZrEKhvoa2HVbfQDLtic/kXJ7o6d/V9wBX8dfaf/ifnbL+7d
 Hp1zNim0xo0CKNZC9jxShpY2D3udf7nC8vGaT4iDArVjP4maqctsXTn569BgIdPzkYh/rIrlw
 FJBP/2kKfVCJ8xTxgaxM4uyEEaLrYUtZxyP37wAk0nh8a1MeAE5BMQS9CaBNuT2TZC8hC5Up4
 Osrondard6gUuBzlNcE/55YD7TqaW7/vb1Zy5Fo4vdxAvpz+nbpBsDMjrz0+TY2uQMYPRPCNY
 0Bsz3rlctXV41CGFR62Wq3XH9XvEp5avMDakDU4BstOZXT29tya3eTbNrc/hdku9g1Zw83Llm
 MRNekjMTjF+4LWwiXekHRsH61E9BuPUb6nVdwjlw1HC2LtmsP9oQe6yUq7MUI/+AGOaMlKoTy
 SA2dJucxhNjBIei8ELNPMu71PXKIQfJ4MdMvzX9h7Vzur45JDIWIRK1c6UfKDC7R/iJ5xUc+D
 kR4cN7MCswvUyWUTpHGZ+Vp7ywTYy9SU3bI5dEfplZMG/R6tAvWbKLEgbT81HzXxyMv+dhUCs
 30chSlEinNbo3ei7RkkQTcSL/xHfStix2qgjxNtXnNBk9RM7Lciae1SpLu1lGNRj8K3k/UNtB
 4IMMf8hM7yvrsmqnQ+TeZL3/7G27QkTt0r+XyMD0hVaOvw5V6mDKo0XHHD3ELNX3M/N4jsFzc
 Ip3IjhU7WpbmZX0kOyPIwqdx+17wJ+HIeyEcqccaySFzyGmWaq5JHbhTJsy/fdpzQiRcA8mhM
 iSI+Ct/EHZK3pDLoS+Y8YuG1xXLOzP3VJmqhrYdrhMCfq8IIg/j36imPQ0IcDZmBbXrUzunjg
 Lbvdqd86ivPq2RaFmgd+uHZbjvLzgwcaLytAGGOpvPjdVn7D9XAY50AYan2TI4yJxPfliAxWN
 Pi1oEKSbk0B8zB1dI8RAAsh8/tnh9SuEpIs30kDEHtt+QqnBQUIrZiB98Grrd3JQTfYQCGOsD
 VO7ErrYvmLwWjB8WuDKXhdRfqwpJdwV3hGj4SbdRAW2aYXyFwdyGeTPb3A3TQbLK3nH0UjVbw
 ikhdbFzXTfoVaWg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1778089791; x=1778694591; i=fiona.klute@gmx.de;
 bh=1T/MaK4ufmRoGHSWKRq11gsYJ6oHC0NUu2xo48UIELc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=boiB6WBjxHVaT82YnlYYOWkuDA3R3QaVydTSXtHrRVMltcGLEBlzrA1ZdDEYNWtX
 0Mv+ErjZh6k/vQuHPHgGtPswNHZdxRfSIWWgFKgMpL1LxM/7L6mqE4seCDQqyc1v3
 bmsOTl41+7a2QSbp2Wer+f1weBENBcD02CZHrXDXB4NVzEc89SAc42dDzTqA8c6pg
 AL9XY/xowl1Cfbrd5uSAZPK2M/v939jlHJ94pj05SjbJRMP7ZCSFQVZyPv6MFsNXw
 FisIuYTVZMIGEBSZlDqycV8GaJUlWUDvDqwn/XOHhy8n087obXx1raXmOilYT+/WP
 GWSeYlX5bhauj8ZVeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=boiB6WBj
Subject: Re: [Buildroot] [PATCH v2 0/6] Bugfixes for pkg-stats
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

SGkgQXJub3V0IQoKQW0gMDUuMDUuMjYgdW0gMjE6MjUgc2NocmllYiBBcm5vdXQgVmFuZGVjYXBw
ZWxsZToKPiAgwqBJJ20gbWFraW5nIGFuIGF0dGVtcHQgdG8gZ2V0IHRoaXMgc2VyaWVzIG1lcmdl
ZCA6LSkKCkkgc2VlIHlvdSB3ZXJlIHN1Y2Nlc3NmdWwsIHRoYW5rIHlvdSEgOi0pCgo+ICDCoEFz
IGEgcHJlbGltaW5hcnkgcmVtYXJrIHRob3VnaDogcGtnLXN0YXRzIHJlYWxseSBzaG91bGQgZXZv
bHZlIHRvIAo+IHVzaW5nIHNob3ctaW5mbyBvdXRwdXQgaW5zdGVhZCBvZiBwYXJzaW5nIGZpbGVz
IGl0c2VsZiAtIHRoYXQgd291bGQgCj4gc29sdmUgdGhlIHRoaW5ncyBsaWtlIHRoZSBpbmNvcnJl
Y3QgcGF0Y2hlcyBhbmQgaGFzaCBmaWxlcy4gVGhlcmUncyBvbmUgCj4gYmlnIGJsb2NrZXIgZm9y
IHRoYXQgdGhvdWdoIC0gcGtnLXN0YXRzIHN1cHBvc2VkIHRvIGJlIGFibGUgdG8gd29yayAKPiB3
aXRob3V0IGEgLmNvbmZpZywgYW5kIHNob3ctaW5mbyBjdXJyZW50bHkgZG9lc24ndC4KCkludGVy
ZXN0aW5nISBJcyB0aGF0IGRvY3VtZW50ZWQgc29tZXdoZXJlLCBlLmcuIGluIG5vdGVzIGZyb20g
YSAKZGV2ZWxvcGVyIG1lZXR1cCBvciBzb21ldGhpbmc/CgpbLi4uXQoKPj4gSSBzZWUgYSBidW5j
aCBtb3JlIHRoaW5ncyB0aGF0IHNob3VsZCBiZSBmaXhlZCAobm90YWJseSB2aXJ0dWFsCj4+IHBh
Y2thZ2VzIHJlcG9ydGluZyBtaXNzaW5nIGxpY2Vuc2UvaGFzaCBpbmZvIHdoZW4gdGhlcmUgc2lt
cGx5IGlzCj4+IG5vbmUsIGFuZCB0aGUgcGFja2FnZSBwYXJzaW5nIHByb2Nlc3MgaXRzZWxmKSwg
dGhpcyBpcyB3aGF0IEkgaGFkIHRpbWUKPj4gZm9yLgo+Pgo+PiBPbmUgcXVlc3Rpb24gZm9yIHBv
c3NpYmxlIGZ1dHVyZSBpbXByb3ZlbWVudHM6IElzIHRoZSBKU09OIG91dHB1dAo+PiBmb3JtYXQg
ZG9jdW1lbnRlZC9kZWZpbmVkIGFueXdoZXJlLCBvciBzaW1wbHkgIndoYXQgdGhlIHNjcmlwdAo+
PiBwcm9kdWNlcywgc3ViamVjdCB0byBjaGFuZ2UiPwo+IAo+ICDCoElkZWFsbHkgcGtnLXN0YXRz
IHdvdWxkIGhhdmUgZG9jdW1lbnRhdGlvbiwgaW5jbHVkaW5nIG9mIGl0cyBKU09OIAo+IG91dHB1
dC4gQW5kIHRlc3RzIGFzIHdlbGwuIFdlIGNhbiBvbmx5IGRyZWFtLi4uCkknZCBsaWtlIGEgSlNP
TiBzY2hlbWEgd2l0aCBkZXNjcmlwdGlvbnMsIHRoYXQgd291bGQgYWxzbyBoZWxwIHdpdGggCmFk
ZGluZyB0ZXN0cy4gOy0pCgpJIHdhcyBhY3R1YWxseSB3b25kZXJpbmcgaWYgaXQnZCBiZSBwb3Nz
aWJsZSB0byBhcHBseSBmb3IgYSBncmFudCBmb3IgCkJ1aWxkcm9vdCB3b3JrLCBlLmcuIHdpdGgg
TkxuZXQgTkdJIFplcm8gWzFdLiBJdCB3b3VsZCBiZSBlYXNpc2VyIHRvIAp0YWNrbGUgbGFyZ2Vy
IGNoYW5nZXMgdGhhdCB3YXk6IFRoZXJlJ3MgdGhpcywgbWF5YmUga2luZCBvZiByZWxhdGVkIFNC
T00gCnN0dWZmIEkgd2FzIGludm9sdmVkIHdpdGggYmVmb3JlIGZvciBhIGNsaWVudCAobGVmdCB1
bmZpbmlzaGVkL3BlbmRpbmcgCmJlY2F1c2UgdGhlIHByb2plY3QgZW5kZWQpLCBhbmQgSSBoYXZl
IHNvbWUgaWRlYXMgZm9yIGFuIG92ZXJoYXVsIG9mIHRoZSAKdGVzdCBzeXN0ZW0uCgpJZiB0aGF0
J3MgYW4gb3B0aW9uIChhcyBpbiwgbWFpbnRhaW5lcnMgYXBwcm92ZSBvZiB0aGUgaWRlYSkgSSdk
IGxpa2UgdG8gCmNvbGxlY3QgcmVxdWlyZW1lbnRzL2lkZWFzL2lzc3VlcyBhcyBiYXNlIGZvciBh
IHBvc3NpYmxlIGdyYW50IGFwcGxpY2F0aW9uLgoKQmVzdCByZWdhcmRzLApGaW9uYQoKClsxXSBo
dHRwczovL25sbmV0Lm5sL2NvbW1vbnNmdW5kLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
