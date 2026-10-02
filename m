Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91ABFCA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 21:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF8F360DD9;
	Fri,  2 Oct 2026 21:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bx7QJdGhXJKF; Fri,  2 Oct 2026 21:40:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 177C060D98
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790977208;
	b=awYeu3i5JrZHWKYPMgksT2hgbeQ5g6tIFT40BRzCEQmOh6ouvz0Hcu5BdHsI6dyDeVgn
	 yUfawiG3RoMSxZk8tiU5/5Ho2DoYDp7FcYQzOulrf1dhYO2H1M/559T8YlMp4vu3Wkiwu
	 AP6eZSy+uvB4+wKru7PecJ0CUu7BWY0vw4q2wqbMx8PwcLJx1NuZvMZvQGBSgLyNpiZY1
	 SEXLyXNf+3GPvheE4E/X5UJBT/jVm3yjHyzh28kjcsYU9yVOISKf0g4XUfgehWfaSjncQ
	 eZP0SbtIHpxdRwnNy7FCMQdaAWA5y7zxmwPUdt3TiaVa6FFimGOrReMaED4pKZZPanw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790977208;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=3LQGC4XTQMUMcOe48csR7lK+0+xlpVzrYKlPmNuOJGw=;
	b=EeZnRrq5BWV0X9lxbr1Qx5oqGakAJlBsdhNzJAB9ubZrNt9Bhp7s3WfAa3ZhjZX+X+xV
	 lhnzuPfNNQ5DWrmdHdk8CbEutqevzZBxCPNMIaNR15OzD07q1ZpAW01Yn6CSWCPptjEY0
	 1jaFWs176+p6H+c7ZI3NTyRlq/11vxnnB5ygyOOs8yyqtyCHerQwK/DXormr2+RqLJVJw
	 1JoSyvoDpmXLwIC8/WXpqNVNp1urnHl4SuAXzADfduq1FWzsPRlkFF5UsaHbX4wPF63CJ
	 SCbckvELFwDs9pTWZX3sAYqZeVi5KB0n3b8HS/Mv3X0NfbPRQbX7LuhRAUDyxkI2mbQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790977208;
	bh=3LQGC4XTQMUMcOe48csR7lK+0+xlpVzrYKlPmNuOJGw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QDoltMHUdRqkWO2yl3f0q0tVdXbuuZk1qD9SovHOgs32zyiecHq4Ouv7ahDdNK4aU
	 wPcHqsJcT7+Wn7P00NwLob48B5A9/iN7Oauav2/P7qeT3vhGJi15Qa0UFT/FCofGIT
	 uWkB7F7fUQlqT9golXdlN3e+bxtTH/wyQ1mqtYg37j5sNVhhQHTVvUG7OBnJOQ6R7f
	 inyKH5FEJsU9GtIN4BJKq0xuA496F4xEO86SoXVvyrXsifAP9X0No/U/tTmOxaGzCt
	 1YvGa+Iy771VgwAYudjRhDtZWlsJ6tw+CJM49fiLtmg+F6+qLLxX/pca8JdSNcMGU1
	 2AKHm7AOSDK8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 177C060D98;
	Fri,  2 Oct 2026 21:40:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B60C32F
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 21:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00DF040C88
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 21:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQ5O43Jk4Kgb for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 21:40:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 567AF40A7E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790977206;
 b=SpDV/6XC3Fn7cwocgLlZPTEePV4atnauKzO5b2J2sYNyoGcYO/WflnyK+kwqny9GbZoX
 gdCttC6LNSlgYkAd4/wYSZIbUGDqKYoeW7mKqsXL16VVctKh+stP+BJAi6BMvAody23x/
 cRBgnqKGoUIkU5FgVIGwPZBEZF6Vp4CS9lXXnBiQ2RBxwuMkpeEXIpsw094+EgutmlZeA
 oyIjD3CrgH+qr/M6z82xdbFDLpy2u9XhZDaDbcAXc6IW4Ag4DhxLj+0lc4HD/cfeTwk9o
 xLOQJVyC1CPwHXZYnyBWWtnMm6qnNoyg/0qhc3Ub85u37n2HAa5MI8LuPigmg1bSB3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790977206;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=yJX4zLq685xK6sUkSMPpsz1yHi1+GS9DhLDUpgsbsUo=;
 b=iwBmzs4+Tw/So6vnNq9eK0y6G831A5Q29gBsEnNFjZUCLz1ZAqK9TEYMEQBWUBw3YAis
 jxaMXmaLMiFoyI97b8ROA4WzGUcgerPNbYHBt15j2tivOhrJ3RQmBvFpkP2tSFuR2GHVR
 AwEgXzkTYcrcc79C/T5T0tS5zz5P+b0XCmYqf1NuoqrgkADZVaVGvUuuofapxCGe5L4bm
 Cfvfag5PhX0UC49N+qoOA4Dw6SYrd3D+y5qlBXjPxbX/fAC3sIWxsVLRaXjuN39+j7t7D
 8k2Y0WCMLUQMfCGVuJNTMZbOKE7ux8LISLEuLHQjCfJrCCjS5Oll3LM7/vIAhd4Qkng==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=mrS1w7KK; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 567AF40A7E
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 21:40:04 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYvY8-1x8PP045Me-00UjPe; Fri, 02
 Oct 2026 23:40:03 +0200
Message-ID: <ed2554ae-8946-411d-9380-369455c5f347@gmx.de>
Date: Fri, 2 Oct 2026 23:40:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>
References: <20260929183607.1849293-1-bernd@kuhls.net>
 <20260929183607.1849293-35-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260929183607.1849293-35-bernd@kuhls.net>
X-Provags-ID: V03:K1:zY1i+tcDhGxDEcC37ebJbuVClYUaCPOPz0zHplFigqlzyzptsvc
 yOdTfDrlyJGolX3jwbwbetpofAN8zUtUVLW5JiRYhsOsUjmYzEI+mF1/K8fX8Bvw1T+SkZN
 vlsf1fS7F6drIQeQXLBfek5l2gPrvIpfYdFWdxrt8EdHe//A39OC4JGx8BNYfa1scq/g07t
 awo8Dzdq3bvZ+0TwuR6kg==
UI-OutboundReport: notjunk:1;M01:P0:p5oJfuhg3YI=;ZMSG629gcuP5rpoEwXPEQ6TChaz
 WJcJ0bi7cBojVpc82v7IyMZR4xH7/yfflfGVbVzxnhkwRiDc8VGyMT1ONmM9vrQrgfV6C2Abk
 8A9bSJj22wCsE9W+RnPQD/Esk2iih5lWBQunBpPMO9vxBXHtJn0pVg4GrUUBnGlw4duTBVm+e
 EEW9LT/ZQ+v1xgd9judPSaHM+3fLRfW34lVwuoL+dh7XRjRNfh+DfpF0iu+1BdUp1PeDIG1hi
 dbLZBFczNaMjeyv3DPF0xbiX45Ge11RqDA0M8KH9wPEPO0qqRKUFOcNFfO3DC5SYrtxoDljO+
 ACZa3faV85RQrNelp9rlu+7IEi3Q4ME4ko6CVOxMd3YZ11NXw9E+1aRnpiqqd2cX8AauSmvaD
 U1b7z8Dg9Lxwrmsd3zqA81AwAnfcAFBWEeX+SL8Kd1pIW87WqREAuKRai9O+33nQP4/Yj80LH
 6il0RAzrxtM7NG2RTEpK98JnnMtR7s6eirZKETpulF1xZSCkEOjdu2rEdMGXY+UvDqD4xhuBq
 5LMYa1qvNmCbZjxirMiIRUyUT05w2ZIMynEsxhyzoloKHCkuaPYHTProUcP61fy0tSyfTTDcP
 DzlhUkupJIJ0dn/u226PmNheHFda+GOPlVi1qw0G9QQRfBYBL6CEogI8XFGJHfzLGQervKpTU
 dhDXvbR5KcwnAapV5ecw3c6ePu5+c/p8Mqzi8nEY1xk9XryE6yf0GMszZJudeRWQpIoCW5Zr0
 SiPpbFXUsnua0kkvPM7jeGw6xBblzz4mu5kVyWq1KR5v2JRMDHNbsj5YLxebWqRASuqOVaaIG
 MjszRXK91RLx+6Bg6c8Y9BqatxKptQXIerbUdO/aWprwnK4WekFEXRLtvXO3CddxeCb5WJSNI
 Cbu9zeUxO9kSWSOGCuR+tWof7eRFxCYQjHZxxbxggI/HtmCA2BLuKQ5z8SAEkAKasfgSSraFZ
 FENCwo1dI2UgZrAXVXjo+lTCxG9RmEI3zNhtdv1l1IuDZaE9PJ2QB18RLJnRHMQ1HgT1utko6
 qXQ84pFSUvh/LaOl0QBm62WK6juiPntOcSBoeazswy9fGc9usfOZqVFbaDYog7LhBjbemWRQ6
 LPYEOwCGFRGOXo1OsrZRqL5SITEieX8Bo0x0dwhjGltpnVZulDcIjb7K2oD3xQacmJJdwNoFg
 jR5lrAqBzHt5NKIVCeSM+PFaKVrw96Wx04cLJ1EsGf5e0BPxSQ4V1VNapLvJdetO92HjJQt71
 VAgNPndyfnS4r9WaglGHIuvo2E+ynLkqxjGSeXyH+RTXE4TucgQYeCEmmYA7IjuUqxsebAVBr
 JNcvnLhA3zawxUitXc4ff/ZmuoCeVOIvXwU1wr678Yu7YomsXGcufpAfJgU+mJuoAJuG9vXi8
 XyzahLt1Jc/ZOSe0kXN0psZI6MJg70QqOMUaH1K5IhPIy4rwfI7dAN+3qaHKePrlmxLTgzNZb
 KJ4yZ9vYmqE2j/EHJBnfqz5nXI5L+UjaAvtgABCOmd/2XuFlB7agMcJssi5WmKqNRAWaV3sPg
 EXuvLS+8qqdFkwAVRdSe76h0T/p2KlQOpLbSOWHqJnUrus1Mjj3wTcohYQka8bqfjQdvj8o2V
 OF5Bh2yyfWT2qYdUdqXagkq4fWYau6uHN2ZUixY+5afms8h3B/Ekxdz90IvxA8TT9u9e3Q7Yn
 kbSBfboZ1RPwBh9SA1Au4FAeFFoSrOCJP6YZU8jXHKCarYu8NXl4F6QWlsiQYtKNZsWtCa627
 BgGCAlo+4cvtPCdBfhbl+H7343hP94tYfAmYtg85pngRPEH1hSG5sdRM8WtHptZPJqT+T6Hl2
 EXJS3/nitnYNuC1dZLXljreEprKvvr8DWgLYfdpdAtEF+9y5uPRItcol/69F5X/l9YJQPgpjf
 zPfNOSxvgzJjoLvobfVNY1DsCjK/lTAJ9wm43uYTKSLk17Cd/VlvhBRj0AelX08Tf0cI0Q++1
 7CI+7llspFiFC34q0joaTBMedwjxj0RLEGlFOb3TwVcWVA2kMn7IcdBuRd0p2S3JVkYSOltbD
 KmHDeHqLKhP8FMeknsMfPSzXFFMvNVA7xSsjPMLrwETgiwDZGzetAziJrJU3odmfu+dfL3LgR
 H6yyzZB0iLbEGJXHIc+gRzdGGqIYT85HB0sYTtI9HW6hAJv7zI/AvzJA8XfTITAK/KjWzzA8a
 +dbaewS7hFrnkN+Zxovfa5Yc4AS+dFr2MwBm6t+jxkYiUSIenkr53eYc0SA72r7mmGe4G/379
 tn6cR+QZY28q2oqtmR35ZVMCAQ05BZxp4ayN+RENAWAInIA2LMojszVkelOUbHP2A7UaMwSZG
 sbkj6K5eumKNaOtRujBJtn8AosD+XqDLGyCDvv82li+B0z98aEDxnNRjL0LCAJStBdcng52cQ
 N0ux2bVkzachOWwc7l5i7vlYFsvm+DO6XR89cW+b63W8iCy1dah21583WPmRlWRcuLb3d5LW2
 O2erSlQ3k0xhs655V2uAvbuCA85PACw/nen5zp9JzPMqQZf7nnqQl+5IrbCR8jnlw8dAap5/g
 kCKFINcFRexsP1gbd1sVzF9Arecm90U9Gmd+XQBBBl8WmxxLu1NoG3A+rCBKC6h6SFwkOrvB0
 PDoPj6pF9FLt08n2Pn3OVpaP56DTs0bMx8+84fKiQM4+ELOUItFskWJZKXbWiAnRkYdRkzsM2
 E4pwooaVIskAfK3MdAx+EGkxw4gfULlMUnRh551guZ8Ucr0fs4cuRNP+dbR3pIwBOpNytLTb4
 3IGUHNy8V07C+c/QX0B1pz1M3gjsZyHXjTEPKft1EyHoqLchg1mOrwovFKSdbtjf6PVuuv88c
 62X0Vxb8uKzwsYG8ErTXkEJ2HzsxX/BG3QJOakLGWtkOU3TizCpaSO8uP5mC3tb0OYXtbLzJm
 LIZ5adFoTDJ2MojucHRBpbFUT3E39JNqvQd0SiOow+50TO6sULx+JTSISk5vJLd2k1PMyHeNo
 OGMDx8cdJ1YgX3aXryQ4bYfN7+y8a+fvGXBgQi6J5xzcMptKt6Pux7exEsX4w8vA3b+Aa5rNg
 LzhYmzcUsssNLxDF/rcsK0KOoe0pcuXv1gWDkjr/uQKeFuDrQsYc4+6ZGwu3KzlkwonkeX1lz
 RR1dRHNylTcOjzB1zmpCd09q+wFBYNS9+UTT/zDgRNayhDeESd2LNGAsEgK5oGdVx5uaI4nH4
 zMxsWqTeOy4PWdMr/ftGmEcrPM6II/1KAYY6V0gm+LFKLVSsBuYm5lCEFEkr8PFYniTTz7SQG
 NbMjQdwM+m1guhplSQBRe1YLe+FjdrmHUa2nulo4GrrwWGi8KxR6duXaphOMDAF+rMQKPPN3y
 /2O/bnvoYSOG71yN0JS7q6a9XJLsFWiVGqJxo1EDZj3HM3acQQZFDIoW5mWamQNc+X7MzZAG1
 OVfdH841y/ZfPWKRD+cWjCurEBKm1tWOssw5Bvm5Rdj2rYfCaxS2Hb3dcphq4qNw+D7iw3v+v
 E9YFoIRiU8zJUpPbiWqSiQlqS77k/4+qGlek+F9HIET2IkJNUPqfFEF5YXeLgqEz2XrfKkbAN
 xBL0wOKu+MTX4h4exMgIIYxxeTbg9wwQtPC2s43W9SBlw4WFgExJiTrX0TLTvoKp0Ko2kZVvT
 gzRTRqKZajDYHdLWVByRfroQNAoMdRcg48EhsX3EngRGZN2tnTc73Tf9IjxDdPxm3PUTIFRyp
 3u6159m/EpLBrlbaiVNpY4YLb1xR5lqFyo9x1iDaGwJFyyO0+XEd0uQ/hZwbdpuYvVbo9cwzM
 ZMitrqYArNwANUv4n7Aujwc3YlowdvNuEm9UA7pWego3Nqp0uVnRFITdmDuGlq59NveXs7OU9
 ZEBt/6eJL2fnPcBgAMPqi0w+BFfy8kCamE9ovpf/4/o7SfjXWfTXO8Z5bAlvBpmI550lBuZ8/
 jL8zs615BMxKp0NR+qYMdWSppKzZfKY4L4frgk7i0F5elvGE+eZi51cWOUFyyDJx5nC+9LlO1
 n1xjFXVjy8sclMxosBniqDWf4TE9ZapgykCKi6r/Tmo4s4xKXJqVtX+msdeN//3olT2ymJYOH
 7T+qISu1KiTi4C2qlvN8nTTx5yf+bSQcaVI78niZucmOXIlCNUz3n7hHIVUfOCnde06+mU5c+
 ugunlzuJK0qncLYNLZG20/etC61dmsTffRNHCZ5BUiC+QF8O4TOPzvZn69arMjHYtMqf9EsFW
 9HRXUsJCUN77vuR20+ukHlOFSyhez3QXJrkig2/HXn8UposqtIcq36KZnvklrPWQYRQI4CK4J
 yYRzlmlMLG6efn9bqc4liu2ipuklOE+rU4wG9In+vTObFhFaAS8B/HXAq7dR2U0va0/nfblBT
 ci+ytf51CMWxjdF02ad4h88soEs2NENRTLFpOUjeH7aQmjZGnxptJGkQJVUtapdhFCg28SuoI
 8O1wGKfZOe3Q2ccgZgGGAG+3tKDt6QIaCarb1FIH2YbTgrxQq+AZSLWomOiQiK9I1P0RVuOrS
 SeyHOIh+bYlVjZYFFfW7tex4AgcA+4g2eXmdbXqsWXIb3ohIbysUmMzp6TqBo1EBWjJGDdbM/
 ilCFy9DtMg+gdHOlEUZbNzolX5oZfrB40a1Z5SEp/NvivrQDgylugMeuZeSe7ghJbhkwDbZHX
 +FH90jmisLjAg28iq2wT3X6793F794WAj/sToXqatWMs0liGDw2QpzPJDkuK+8NrlXHpec198
 LkV5Zvs1+6pfLH4LSThgBFAM/UoaMpt1RBS0TeUEw3k78pUQSwq8xToXORNVv3Tm4gFzreck6
 PB2XrY+pLlhL4HXBJvZIw9QSg9YqgM2dB3VZkEpKv4i/RnBhLx7kvDqhznsNXz+7RkmkMrLWa
 BjzfWnTGyGoyfPcdJbBIM7PSqcg5z6lOywe8i4yUbbRxvChc38xfsvJUkUpJNOh8VS+jzUUhR
 AKjvOOeUWRI/50MW0zgsDGU/WBpdGFDaex7YsxKzdn+uPbN4+E4JTjAYtAkXuh5zgRNrSK/tS
 pfPob8MM3M68OJfdei0fYsKpQWzoydbLtUKAJWXY8KtASwJNEzEvBlC0Hgu9WDiEClQdbVNUl
 Sp+a0Owg35E2svSo/jcPNtoTtXpej6K7aULuAa5VZoTxdozdFkqvgfUoX/oAJlf9s2ymPFl5t
 WHzNTXq4Sptxhs9gi9ks1PtXM0cdlZVZp+reZ9mLc6zaTTdl7Jc0LK/05kq+xoOcslc1G3qIi
 jNOOvnLLOQQBK/jgjMcGFu8j+MUJ2eJE3htPlPGWoELiiu7MjcdfPFUJEZtsRKe248WXQyUJS
 coXNeIq+5emZgE70oZfbtRJEyRHhG8foLT68awNjNSRigs9/vwDakft2b2b7OAxluonwFVsdY
 D6h82dBGM3asaA7P3ttP9SZGao8QZAhl3z7hKr3PNXuqFZZtZQ9mB/uDyaMBjRDrlkpPRRUhE
 3bOEuEvjZQtBNGU9EfyPWxKXsquOSOWne+IsCU1+4H0Av9gn4nwzdPbGASRTZiGUM3cu7b1hz
 6KASvoAQhqj43bc//IB+1rctf7qik4ZYBhTcY1KuAWEyk9bdbOLzRmXesxSf4o2Mtky0b1b2u
 jFOR756LgJ7isk8PQQyyUZfGXagfokeOSaeWBZ/vQlHFEdFchfYmISoqjm0w7eON6TUT03IFs
 eXGaPy3dKI1hxRiH7NQx6jUXsmFJtoyrSPzlvPURyIThRipHrZYo5ByPJ4hRkfd1iUmgNT3P4
 lI1JT+KtfvY1Pz7cZkMEXTWwXxI2vRZcNCqN5TUClcS/P/rkDH64QE3x0wMuTpA2BxlJUJxVl
 dU4m5Yw3YtqfkOEk0qridlIJfL98PU8l/7z/1KZO0xDxcXlDLZfV0sL/UNt9HDObwWPfVciBO
 PdoXWtgAmYM7ONm3PGG0qBGueNTAFRVm/ZxZdYb6d6Optt9GiLSCwMu1XVmt0yccgwU+W4XUB
 Cef8HDIbhozDxyl2vyPRONoPF+DB/c/Xk2Ii77xFgfxdHNh2SHTcFcuBgCdQevQ96P6XsnYz0
 aFxRuC8S5hCQs8GNx8ggtQIu/KYWjJlQm7blDKGHiFX8qvMkhYGSH+XH8gT0y/RdLfgZlHynm
 RztEoojDB8fgoLG1oY7SKeSlTI51T0tHVi4pN8mAsyGaHyj2XUuThNZdsAdcQiCgoM5LCrOFX
 QC0d8GYsgFmSeQJ2/1bSwnoV5L4sKbEtNnJOOuz5BvHv2igherasKUbrO8QTAcVnDqMIJvJN3
 0iq9giAc6k/54Ro11SKEGcREblasTeCK/+ISMNzzr6UkmaaBA7KKLuuBlCUEEyPMDzJqu9Jrv
 muF2Wsqe0RMgxSEXTWZjCbWO6PtHDEnMgNdpMNOynfxeyD94nGcR4gxDVROp35qs5kPxHikMp
 FW14U3h1/4QXqXYshCDeFXJoprD8LnnT710nMzkDEfAq5xCFDbVL0J9z7ziam9WLoZ9KQKa+v
 6GEuprgs0bG0zhW98eLlsv42/1wMObPr/sEp+HUxMvYGjQpF1fkXm6zQJy5d6Xos/R6yzpIHA
 9I/LqhA6lGeL9OYGI9czqWcUBocE1UoeBeNUOUGYhPHadll8lAhFthu1PavnvQVjnMES8hvQt
 HyXHwfLQ==
Subject: Re: [Buildroot] [PATCH v7 34/66] package/ca-certificates: Replace
 c_rehash with openssl rehash
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

Am 29.09.26 um 20:35 schrieb Bernd Kuhls:
> The upcoming bump of libopenssl to 4.0.2 removes the c_rehash script:
> 
> https://openssl-library.org/post/2026-04-14-openssl-40-final-release/
> https://github.com/openssl/openssl/blob/openssl-4.0.2/CHANGES.md#openssl-40
> 
> "* Removed `c_rehash` script tool.  Use `openssl rehash` instead."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Martin Bark <martin@barkynet.com>

Applied to master, thank you. I've extended the commit message to 
mention how long c_rehash has been considered obsolete.

Best regards,
Fiona

> ---
>   package/ca-certificates/ca-certificates.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
> index f5675b754d..0f88df3eec 100644
> --- a/package/ca-certificates/ca-certificates.mk
> +++ b/package/ca-certificates/ca-certificates.mk
> @@ -36,7 +36,7 @@ define CA_CERTIFICATES_GEN_BUNDLE
>   	done >$(BUILD_DIR)/ca-certificates.crt
>   
>   	# Create symlinks to the certificates by their hash values
> -	$(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
> +	$(HOST_DIR)/bin/openssl rehash $(TARGET_DIR)/etc/ssl/certs
>   
>   	# Install the certificates bundle
>   	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
> @@ -65,7 +65,7 @@ define HOST_CA_CERTIFICATES_INSTALL_CMDS
>   	done >$(BUILD_DIR)/ca-certificates.crt
>   
>   	# Create symlinks to the certificates by their hash values
> -	$(HOST_DIR)/bin/c_rehash $(HOST_DIR)/etc/ssl/certs
> +	$(HOST_DIR)/bin/openssl rehash $(HOST_DIR)/etc/ssl/certs
>   
>   	# Install the certificates bundle
>   	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
