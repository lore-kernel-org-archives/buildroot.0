Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99588C88E40
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 10:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62E9880DCC;
	Sun, 13 Sep 2026 10:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82G2TVk6Usv8; Sun, 13 Sep 2026 10:25:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 37A0780DF0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789295120;
	b=IaH6/hs1dbLfAbN4iRRze/l5cFnXPFKXLZBEtbcJxTGQmqKeNg6fmwxrYgfXkQCwyk3P
	 gurVpWR2RowKMmGgDwyxtQUG3WTOLkZPc/CfuqjN2b4kjHk940/FvlK+Y3gn1TKL3EkXy
	 ilSKESqA8lmWvdT2BmHzOqmdwueeBnBAlSPg1BJnwwAwkF3ESgoAbtr3IJ3t3A5B6qIcY
	 y6E96+wbFI9bIR+5Rr+E0GZrhVj9wKtfF2Q504k+MT3iHNMn7F84K8Nn9eYN00cPpOLlR
	 qFb5EMe6XEB+TGTFaXPqxnjDErOrOrkT8tKWPeqK9UmXaC5BiAsZOmt0o0cmWc5NT1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789295120;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=bYjzBq5/G8YCxy97NGKYRX/+4uju+xmyYByEicfODE0=;
	b=tI+s776tupbxYP5tJeSDwrrChgNThB8w0dDKULeUXxWk7yevEIjbtnOsBr+75EBhggDg
	 OlN2Z6sd5KiXzLVLI0NTlV6nxBHm07rPo+0uwrPri6mqOmIUkpMKtz4XhKLJ9O1pKKpwI
	 pqqos/8l8Umv3TaLErhVsPJGSsfC/20cujFU82di9VIPIDYVPIPTTNyp8k7nUcDdiZ+LX
	 ydaN8gek9aYGRidtW1WMwiaxEZaSjFewicP+XqcX6nJAeSwvoBk8UOR4vFnMDDz09FERe
	 hDx6dL1FopQ0n23o75yb3NhOBF9CwXlKF28nQYiHTq3tUIdgZsZTzrJ99Fd4qwyqNOw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789295120;
	bh=bYjzBq5/G8YCxy97NGKYRX/+4uju+xmyYByEicfODE0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=fOL7WbgwvZsnzaK/Z3G6YOoKH6xUkzCyMDSt+mYFCUxGvlByfnoCyEkt7DBLd36eP
	 gJSkbAN0dYuBpFipi/uiOO+2qyZ0l3hPH/6E8Ej/mxjcfgDW+NnmsSuhFolQO2z6+s
	 gOMOL8IqphHUiJ46wC0etkDloRe4ev/3yGn/Krq119cFFnsjZRfZ1j9+tLc9+dj9B4
	 71tIUPwHuW4DkpkTIZSaoSvnOdyMDKqjOPv1vPi7XFv4kzwX3hHrK6tZIux45E7UfF
	 uxfWaCS/xqm8pBzIwkhYDIDTDQFWw3+sZ+b/y5bmnAnPOI4y3qR4DDmxZWYSaXE61T
	 h0vm717Ifh01g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37A0780DF0;
	Sun, 13 Sep 2026 10:25:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AC35223F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9220F60621
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rral3TnlWIl9 for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 10:25:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C5364605E5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789295117;
 b=sP9t0JDgGlfoLdhMAnq6jQ1xLC+k5yrKK/Keg+9hxmRHV6x+S74C0DWJou4A0FEQSs8F
 2ig/eba98uDCDIDhauU0e3CX4o7UFZ4EnWuP2ToGYFy7I3Nba6euAD8ByKzopEhiTV8QE
 5esRqVTElpJ1SsvZbkOu64G4MhEFeZ0GuLTiTkDWzoGI4gKTSJ+FOdhUuq7LuEhTji5RB
 IEMiHWw+zz7hPgoHrrkF3B2yRPOMLTGn3lgmOczXsyYmj0PGpmNOHBkbIqyz0T4EgpJmh
 YswEHcXSl4Cf3BU25X3ihO25YoZeW5CG+KbsY5h8n/TA25PUD/eXOv2wY3hYMe17DUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789295117;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=5EWkuKwQr/NffhvWu+YVYIGl4W3feiZ3MbI3hmvSxek=;
 b=rRkzQEyBXVW7HBNrxUsZDRHAeh432U50Xj/AWdY/c7U/+DClUuB8tgZ0VNUInpzR4qkt
 gq2F8SvVqMwHeRJBlbd0R5PfCRW8l94uYf1RmdxMP8Qm7U2bAOqyCYzXEnZgVmAWYGjFa
 gxnxXSUUonHqKXQtI6oVxR5lsSLKnAuY3CwGAKh+VDrsVWQhL3Rdm6KR20v/tkPU4PLs1
 g/2F/WhZVKt8yjh/c+ZAqT9dhABaXSm3pCJGhFvLc2txf9WTFIVx9wbDuy9cRPViVrYrF
 w1c5QJdNEf9aE5JVeWEc1kimACpzwfCQEtLDS8gziSl0qM58C4IcFd41v1f8KpxnwNg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=muyAsHLw; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5364605E5
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:25:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mf0BG-1wcf2W0cna-00nLgG; Sun, 13
 Sep 2026 12:25:14 +0200
Message-ID: <45791279-7410-4d35-882d-f78274e86a89@gmx.de>
Date: Sun, 13 Sep 2026 12:25:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Fischer <mf@go-sys.de>, buildroot@buildroot.org
References: <20260908083512.83180-1-mf@go-sys.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260908083512.83180-1-mf@go-sys.de>
X-Provags-ID: V03:K1:/boRsO8I2jISjpKALraYMkbOw4HHwA86sMzOaOlSLyqKySWWbHF
 HpqRBvRbek6Y1JrRTmZ0RpVHDjdUCeVxV0pJinmSXUmPJNgp0ageZ5Tfr8WifhqOvCkQJ5b
 8yKdzFGm2KwwSpf4Uh/uogY2+VJ4sv7mNSalb1M3d42LKvadmHZq6+pIXfHnxg9BzH7kvMy
 CsGVV2n+1yUGclHvaGDIw==
UI-OutboundReport: notjunk:1;M01:P0:TEUB/8COxyA=;6SGGjOBN8+TOCFz9f45k4VxGUY4
 FYJ5yhSedMKaSDMxv+6etlOOonam/R6W886CsF0RcGoDE55sYmpD8xFNfUFMP9WWNo601iVrY
 yNOxtCiYBNFOPHDjcLpk3rj3SJRX1rTQuQqLCxdVhRCiTWoKvbi4UpnGzf8vatXTd7kqymm3Z
 ypXqFD5gu8+4F60KaD/XdBYIJdXIodG6JfAmy26F1B0AVWhSO5A6wYPz6yPZWSshPz/pk6GrY
 b/ndImapB+8bJcx+D4TQpL8a8xRLJyKnVFAmmCw3Oy4bmlRqVdm+A8Q4gPW3aNFMErgu4t98I
 szG2dcdlCvPtQD3COMTzTGsV0Ig35j7Vgrjt+i24YBn2oeRnirQIlJZzADvCiEo6mp/xObI0/
 HrwkxHsp5NxO25+jKn4ep9Q/ZfRu+5McDiSnLxd2T/H8ptRkZVLfQ/4UsUeG4wMN3yUrs8HYH
 CSm9T2CcpWT0YE7rZ6r2RFLTTRJP1aoNn4Kr/AKwkdA3oqQ+sNxzMxIH2z8bobNh0tnfR1I27
 63zn9hNUpSm8ncLE6g2f0kZz1ZMQeTiSnA/gStbCyv2yyrogVGiRnEX5hJzR1DPevQ/SHMHPP
 N86AdIt1eJ8eMquUJmOMwpshl7KkljEfnzFZL7IJgVz5hTQeplbSs6G8/j0dZ1rzOwKe0b/RZ
 89YJkitTDQjiW3U2pMrf/XdjzpIzw4hTYzNOjTPAtMOUPxUGXvQg9DJg3c6SAUu74YgxA2dzB
 5iqtH1SmhtNUSSsEdh/9OL4ndtTMXH4r3M3mi257eOhP/qSKudpdKWXKvCoZO+QDexjd7tefX
 eNrPDROKXFV/pn+Uk+WtzY4SzYWM9G11v/53zsF4msJ7uNYmv28xen8AC2GChtXMwdYyM+idH
 umRJepTQ4kIYlmmw26dpGcq3mDwZsSM0nCH3jsbc5Du2ppRNPmqLt4rMrHoaX2ryxU3vkyO5P
 KumEemJB4eb7gpqD2lrDlwiN9HzHA010StrfpRsIGyw4JVjCi8HBhK6nif96ljfeAoS41FiQU
 gNgt4IQHFFMMW2scFGLlROyRi9IxLLJ3hqYPleWMmBm7q4nModHKIwtOoEFiAW7qgyFRV7qBW
 U0SrqFcmEt30etvwNcsua8W8rV9srNTuIoCFJ7Me8X5hVHmaSa4jt2GLt9YLi69dch1uPF0GE
 T78/nWbI6XmhM7UPnIwkSyuHmvRtEKeDR/Sm6UqhzYowsUDPq7dc/p9tego/HiS9URziZLc+r
 IOkuJOuNaSmJAuXljPk0fQ6jEEHRfacog3m3YOzd5Ye7THjOLg1uVkBN4UX1AV5+AJD1+1vKi
 7KTXWxV/zRnjht+dzKNK3jm3JXS05Mlg5IKwFeYPAmS05JdyhKo95oTulOKtMpOqFKkI7VygV
 9zGD3l7mhBpN/sGz9dcU8Kj8oFq/aToG5Jext6HL1pPQyfwZbP+cFifSzr8C1OyY2TnZZmOBr
 Xs/wrWJ+38WGrR8t7lgTNtrXGQa1HeMc6WrU7Fx9GisWcGG1OJtUR0sAWyP60H4HzdoiNWXIL
 BxRe9wIiKC7tB0r+94imP/dponFswxhixbnkzWYV9vRs03E5Tajxa8iXE9dlkEjtfx9b4bmwB
 CwfrjyIn5WqGMidrkcK4lf0Z2H8ByhKauOK1o8mOSsuTnMyK+Cov7uJ1vKxkdcp/kXeNza9Jg
 OYeM7az3SnwXDlNuyHS964XzGsyHWQ++AP1WmZJJ1OTE6h8MMM5TdadwOsfkX9fgqncLLCgtz
 duBQF2xA0VS0HnTGq/oaz12pwKjRHp3l/rU+EvEbfLUh9MyP3y/yHRl4LNL0cL2XrAf3SMQKI
 oZpaMmfq9WYiNkq+B+FZ3vlFWypmB/GLkYRzZVUQLdQ6j3Jqe+AhLDTGt35GoTefyo+gI61tY
 aPenbNzPChGmKASRBhydehrzwR0SX2BYUhb1gQ+Qt7tb3y11skZeLLlrTwoc6JGiHPvQOa8Ak
 isiqvFbOOdOyyq1H91yZmbMry2Wgn3gaMMQxwehBiM4LJOn5mipQqB59eo+S7BhgbT1bKnRdi
 zQSUAX1cwIQpnxT6HEGOty6ApiWdiHZZua5N2lt5lbr9rqo0xr0rk5WX9tNWZAqg/uvuw/nlr
 dbUNrSF4SXZfUVDdcKbktEJgwlSeq42Ig/RPdgpwL0JFNRrGC5PSecIkfUQAIdoeHByaomCtr
 padFema4g21Ka0z25KE7N3WfXlOwO3NCWYbCRlBHJBdrF1uz2rWmqr3TSPoAotyA9X0EpA+TL
 Hobe9D10JBSObC6OidTKvF3AVA51bCRazWtwIdLn38ThIVadxFeBJrT/lLYD6N1hvZxMYqzlA
 GngZSdPYFsE0hXGBKApq0SxrCB4HfhH2bHGGFUw5jM/oVCpniVMggotIKsy9Zv4gZK5A6Ckx7
 Lnsf45R8rt70e0fSpY2tlkoyDdeEp2MMxpG/MPs7FZEqdjVVProMkHrcstqvMUtsO+ubfVJ7o
 iM3CmVXHsy+n1l3fZXHpdyOcQUJ8htRa4c388922NzIiCKtbTkPVTOleM0bI5N2/PYpt6RyCw
 nQkDGsFSaMmHtml9koK3C2rS4+r7jDOxAbNa/OZ/PMfbLE0ABDIZCpPBhp68Iro9bPtz3w4g4
 nvFLxd6Cj27rGhrlXDhrMwknPxJWBn9nXPhFRR5ajEyVDWD+Er1wDXl8JlMbT6/Bw/MXK7Ufj
 pG3MVOton9kWfe6Hs4djQ9mRKxFS3BnKMUzJnkqkruGI/XDmYUeu7AMIP6n5XA682wZH70ZvH
 IznRZPVFc5um/hJpYRKcpg5QHepuJJqjJe66ww9UfvURqO79Jf3u13SPP6eQr+cXBKq1tXX/+
 90N1CoZHjehPnxFashXwSxAz7HRm++ehj3SdVwBwNiKemnc9M/zOT47KQasyUv497qQdsR9dk
 KIbGIgAUzbmE5dby0CWZjoK68a3myds5rBeocDFV4R3OOSQhMYc+tHBabiOLmyaNceos16tcW
 l6lPNrieFefKeqaOJca/VKFrYSQbNvUr7QuC+fMTRIJKPckQkP9vsWAh1FLbXrjs3sMMf0Qf0
 XJPXvquN7OzKyILTuOw/K9EURH9rseOlRy2a6BKq1ksTSVPtewVqkr3AGCEpAGYFpFSnN0GTY
 fuZ61Oe2edSKy27Z+6lW7Tco5jFTagUyOB3JoavuQECADe5lhg/EU1yKNOi6SJyI1C2vRfz9r
 FSNYrIY3P7yG2yHJyJhGIx9M091pO7JdJiJeVACD5JBT6xz1elb8+qzUNrsDxP8iwaK2nHxA+
 oXCib6gybmJoVAhWZg79pNVQCbdn6cu+VPhxQo25EnZVe202YiJKRNtcqwZrQgoIkiOml6CLl
 yMs7ujk3x9e/b15G1pKwqtRDtKBdFm0RKtVCfMpMczqlZDfu8vSmiScfRKRtmqIeXSGeh/3Ve
 JKLo8DiDr0eysJo8r6S1weaBO7Jzc4lBjyd4jCnqW0uTo9HPasaS+KrkSztJb4XfHInlidCUq
 PnPJkCs0t9WAJnNhaz/Q7dpyG7qZ77SiSfa/yDbD2SYbrBMgtU27vHMSSd0E9oE+jv/hxNEPP
 ZtL3+2F658wSxbrl2hQXhMyVNHjU0w6mCHRdc02p3L7Oss7Du4a6adi++0U+F8NoML8KaDw8Y
 7XEMaAjdi24zR8zLUGjcrwiUpwtojH+XXPXecC+XrEasRERYnnlBIrGbIiwjwhDRHCrZgsrF7
 dYOdRMCukgkQJa8mOeLEGNOsnWBZ0/DPYSnUuYZYFgEbyoW88rijqfmBwCaB2LlRITi1oIDYJ
 9DvfTQNbj3WiaVD0dzUmDqHjh5UpYZQ+B2YkaJbD5Jf3/6iKgtXryw3K3v0wkhrclDa7Fenzv
 ihxHEoHn6iZ6NtjdD+wBAumA46THWUn/LAPrJK+qys/Q78Bdy+ujehDovCCPUplPjA7H6gmsC
 yXijI3e1F+ZFDhwiqLOYUv9mJFLlia/4qIHBv6I2yT1ljB8luj83GoIot13XuuNbGhy7dM8mf
 io+6IRJpBWthnMCyvn/sRCOyRwqm4x/gjT43DJC21+BkDAM9M/oC91zduuZDlfLCE1lGXOV2M
 NKbeQ3kfKHUAgV80UHtZWQ5ckdV/qvw6+lafnOOS4H4ngRXaqhd72bb1YVYc5wECjsbvRNx0+
 JDgM+Qhxs/TP446oA1YIQtAF+tbItfH06oT7EEtMSnVqvaJWhIOhm4SYC1mLTqTAy7Cfnr4bm
 SGRP+ccyaFrnjGeErxwW2TReXhm1e3yaZqEp+PX5UAWetMGlDyFkM2tb4xu1o4ytIzmDFjV57
 sfL/ATmC8XC575/Q1ugWELsvTQBr/jz7SbzyoGPzEpqTQ3W68lIgt3QI5W7v/StAn+Ruvc7Pc
 wD+ZVn+S1rfzmAbZ7oG0iDnI06FFx4cyTzkyDdNdGIv/UgLT6D9axiPc0XEq0q0BPhyw4jXfS
 lscVien1QyfRzhCilmuGfg+rurLKEGSy5xDmFPwdWBqxGBLq8ts+4+TMfC8qGpO4HbkWRB8Ew
 FjYpt26qXQPDBcS1rf87Px7/YrYThMMoWGuSC1/hZv8qecGgVq1rdQbaD433l4siu0erIRrfC
 F4lAYHfpAhJWNDltehqv3OgT1RMDKElRG8CCbFzmUOB+m3ozRE2VLGUAlv4wfXB6oClIPQTlu
 +4vdBfGp+G08AYG0nVhgQlFQFKT46w8qHRSAeHrSB5okBUCToM+nlOohdps2sfwx4Xnd+EstB
 Co65Zgoe/nV+3OhclHkXWy0SPGSY3XfSvuzf5LWqcUUM1gaHQto8NCGXa0++Ri/xcsaKDgsKu
 K7bxLAbCObfKD6mIW9V48hJVIe7bEqGYc/0QKOozawT/GA72hPsDrpPXeY2tKAVEOXZGY0I3q
 eKHuTdgcQZACZrpNZn7LA2iSMuJsBFg1cabSKGlAxDlQ0+N89mOcTZMh+KC0pXiU/onE9m4XG
 2AwgLy9qpCGnI4uu4Lst0gigVDahU+76X30doaQI6WGZtzmHrOuNd5dhwaEPyAch1bt8Bvw9U
 ulC7ObArucdnKuCRNRdVS7mVAyPoOiHQZV1dyIvtGs7/Wx0pmmhCbEU0un0yMLEe31oSQhIIi
 SmVjpseYqGHeTHrpAqv3tNULjaIGSDrHvJaIYhwSaBq1eMDMEpGBMSHf+1+q9qVGn1n2pS8yI
 TtB6sYwb6ig6jEDO553MTgrdwZtyMDwTFYHEkGu+901LRI8sAlyGSX4bXg/SmJ3sS3dLKLjfj
 f0HmdZKzdBJnZKMsDGXZMli9wQaZavtX+X2FyJ3qZfQ/SW1Jj88XKQD2KR7I7cRNi+bc4IVWb
 tLgd8v7m0TyyZkIo6Y+IzB8P7yuIXcU/M7pfeZsPT07oW9iYYSrVFzB9RIawGEnR6O60b7OnB
 N0TqYSbUTQwgbUbDISW3Ra9MLHO2kOxqVP9RHy/a3KVjJXJUSf2lEw9G4A4cjB5ARMrtxztno
 vLE7Ck18vCI9bw2cmuu+LdxPIOnVm7xWcRr+WnhxnXNhExmBARqzhIHa5qsSRp/BtlpBS0OdH
 ou+5YVl5TWzxqLjTRcDfnW/mG5zUwoDIi6bAnJxTeqzIImQjlYHSkA2OWxGqHdz6q4sh4KAKI
 C81QvlPW/lPzDZW0yAIx2yjk8EAjcWI1vPKnpGH20i+JrSk1t4wnfh2ueEtUvdZeQXQx4lKdy
 7qkGQ/O24lpE+BXU6Y1Lt37n78L21RFPWhvJRZQZFtiiACcq65cbn54VTUoA3U3yARRELMDq0
 MoGIbcXHHDPZjZtr7kYKzeHaXo8I2u7gj0vRhpYcATCwWTwYuTUgOTnpZk9qMfVmNki7E5LKS
 B1wIQkrSmDEApR6N3jvogTFD7osaNd8d6EDkjWVlRnlWhRG9lIGlzG6/dHv/Q+xChbxZT9iuL
 gcBhmnn9Dx0PVQsupBuAKijj3d1KtuwgoSYdUi0fNiF714uRtBfRelVM8+nrXlWJI7zsbuNEO
 Z7KZ57pP1Y2l+UJeA5L2NZF7UHEA0XGtaB8xrRlCvnoxWca3oG38a9qIM3O0Ed2MWKgqXHklB
 wceNP+Ald6RghHm5EiPM8FNow0o12e15vjijq+XEc178OqNrLLWAqvFUL3iS73w5d5eUCTwks
 2ra5tEzQ/HbbuWRgU8m3GldG8mwEFcSxovlz/q8465fC+aurF30R2W3QMttn7IYssDhab9sNw
 sgMn+VlZFbHzFiJDu6DzwnE+2r9uh1vqPIcn8U64V1BgyTbDE4+F+XVzNBotqyOChpzjO3H1W
 j7I/1EJM/x1/LDWxgMBvnCQRdJ0Lwz8jX0pCxbgN9uOiV+OJ7MdwmGl3pGnn6/3IEeVloBU/p
 25I9D57hUBeSbPAKoke5OVQgdzLSxlLqYBjRIp4pbQS15y2EEKqJ0ns5x0HvGvM+wkhpHX6zc
 gJVBXG35yTNK27DF4bplJEFyM0PVl7pfcVg==
Subject: Re: [Buildroot] [PATCH] package/libconfuse: bump to version 3.4
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

Am 08.09.26 um 10:35 schrieb Michael Fischer:
> The backported fix is dropped, as 3.4 ships it:
> 
>    0001-Fix-163-unterminated-username-used-with-getpwnam.patch
>      -> upstream commit d73777c2c356, released in 3.4
> 
> With the patch gone, LIBCONFUSE_IGNORE_CVES is no longer needed either.
> 
> 3.4 also fixes three robustness defects that carry no CVE:
> 
>    #180  isspace() argument fix, could crash the lexer
>    #182  stack exhaustion from deeply nested sections
>    #187  null dereference on an empty comment with CFGF_COMMENTS
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>

Applied to master, thank you. FYI, I've added a link to the upstream 
release notes to the commit message.

> ---
>   ...rminated-username-used-with-getpwnam.patch | 43 -------------------
>   package/libconfuse/libconfuse.hash            |  4 +-
>   package/libconfuse/libconfuse.mk              |  5 +--
>   3 files changed, 2 insertions(+), 50 deletions(-)
>   delete mode 100644 package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
> 
> diff --git a/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch b/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
> deleted file mode 100644
> index 44e15468ac..0000000000
> --- a/package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From d73777c2c3566fb2647727bb56d9a2295b81669b Mon Sep 17 00:00:00 2001
> -From: Joachim Wiberg <troglobit@gmail.com>
> -Date: Fri, 2 Sep 2022 16:12:46 +0200
> -Subject: [PATCH] Fix #163: unterminated username used with getpwnam()
> -
> -Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> -
> -CVE: CVE-2022-40320
> -Upstream: https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - src/confuse.c | 10 ++++++----
> - 1 file changed, 6 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/confuse.c b/src/confuse.c
> -index 6d1fdbd..05566b5 100644
> ---- a/src/confuse.c
> -+++ b/src/confuse.c
> -@@ -1894,18 +1894,20 @@ DLLIMPORT char *cfg_tilde_expand(const char *filename)
> - 			passwd = getpwuid(geteuid());
> - 			file = filename + 1;
> - 		} else {
> --			/* ~user or ~user/path */
> --			char *user;
> -+			char *user; /* ~user or ~user/path */
> -+			size_t len;
> -
> - 			file = strchr(filename, '/');
> - 			if (file == 0)
> - 				file = filename + strlen(filename);
> -
> --			user = malloc(file - filename);
> -+			len = file - filename - 1;
> -+			user = malloc(len + 1);
> - 			if (!user)
> - 				return NULL;
> -
> --			strncpy(user, filename + 1, file - filename - 1);
> -+			strncpy(user, &filename[1], len);
> -+			user[len] = 0;
> - 			passwd = getpwnam(user);
> - 			free(user);
> - 		}
> diff --git a/package/libconfuse/libconfuse.hash b/package/libconfuse/libconfuse.hash
> index bb968f7a52..19453828d8 100644
> --- a/package/libconfuse/libconfuse.hash
> +++ b/package/libconfuse/libconfuse.hash
> @@ -1,5 +1,3 @@
> -# From https://github.com/martinh/libconfuse/releases/download/v3.3/confuse-3.3.tar.xz.md5
> -md5  a183cef2cecdd3783436ff8de500d274  confuse-3.3.tar.xz
>   # Locally computed
> -sha256  1dd50a0320e135a55025b23fcdbb3f0a81913b6d0b0a9df8cc2fdf3b3dc67010  confuse-3.3.tar.xz
> +sha256  36bfa3928f9c323914c7c8317e8722cb22f41db69d7c9d4c24b4689fa955445d  confuse-3.4.tar.xz
>   sha256  dc3ff4b62f851dd2e94a151061ffeb7d28ddfc880a442068dc5283dbaa927306  LICENSE
> diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
> index fff684a55b..ac3866f746 100644
> --- a/package/libconfuse/libconfuse.mk
> +++ b/package/libconfuse/libconfuse.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBCONFUSE_VERSION = 3.3
> +LIBCONFUSE_VERSION = 3.4
>   LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.xz
>   LIBCONFUSE_SITE = https://github.com/libconfuse/libconfuse/releases/download/v$(LIBCONFUSE_VERSION)
>   LIBCONFUSE_INSTALL_STAGING = YES
> @@ -14,8 +14,5 @@ LIBCONFUSE_LICENSE_FILES = LICENSE
>   LIBCONFUSE_CPE_ID_VALID = YES
>   LIBCONFUSE_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>   
> -# 0001-Fix-163-unterminated-username-used-with-getpwnam.patch
> -LIBCONFUSE_IGNORE_CVES += CVE-2022-40320
> -
>   $(eval $(autotools-package))
>   $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
