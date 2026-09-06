Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0D4C79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 09:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09085605E5;
	Sun,  6 Sep 2026 09:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dwqRckKgyH3i; Sun,  6 Sep 2026 09:58:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 34ACE605F3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788688738;
	b=XkaUW2aSai3u9hnIZGytFaQJrA7WHPNrEeEPmdD6/kHP1oMYO0Dq0f0OkTX0rnJQdAMU
	 9sFSsOFHuGOz1kAmM0ptDLF1+7Bz6Q7TYlgA6NN1Iqotv6/6s5KaIVjQ20y3PYGbRROci
	 ebwDbN63MFtlRLYimOJnOjuKqLIq2/g8OEqgDSD6FW+MMDbqN2SRY7qjotJsHTC5PxijO
	 K9ciqvBpFY1vix/KP5dgw/8oufVgnlsZAxC7AdXIY2acszYeOzKHYGUHp37FA+lxYrldh
	 HqQdqmTYA92HQ9J12heVLDLetHK6Cc1+LyMXrc05fWnQ4kxScroWKN8RIv0fd47wlBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788688738;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=fn2+FCdtE9xNXCKowXrwnXhwcb6oaqDnBZ+AvVQQ9to=;
	b=OQgTdE0I0FK4TZkFYAKShdkJC83DIF2tC1BRbOj9jx1i/KBl2OW184jtkT9rhZKMRA3+
	 7v+0JNEZvxl3qp3MX01M0lRJrBTEVOR6BCm4ttIE4aqtNlXXryfL8uiB9i7CAtYrue4QV
	 S+SjcY9dvf5U7v+Q12iDoadOLVCFx9IJ4dVK4zvGfgMdMW/94RAtvUB2lBn+LllJn8gic
	 pRRIYusYAb3s+T8Yi7c+iYygZGSQrEjTEuluc5jE52+dnkG3PgM96f48WWD10XWue2Rdc
	 Svg+oQeJns1ddQZIktruMhK0xaQp8SysyRIhGS4M8Hjso66k+Rd/j73U4rG1dHuab7A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788688738;
	bh=fn2+FCdtE9xNXCKowXrwnXhwcb6oaqDnBZ+AvVQQ9to=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VQxZqM9bLCiTpIgZpy6c9T+SEWW3Yqi3DrtCwttCGKadSihz6q0hgDlzKcBRVYLgL
	 +0UQhIqLLs+/ULobmVQ4L1oVKrsMeZr+nWsWvLELiqiL2fOlUI3cQT58U78vZ2NTuR
	 y0z9Cnt0atx4Swjif4/c3hWPqgkfxMtO45e8lGKwif1qKakCK9TiF+4joGQl1nikQl
	 ojpMCOr7CWCaW1QdUN68BWYVC3nRQAKe01AKQqbzibxj5/z2IlTo5Hq1Ploa8GvQyz
	 lgMsIrmrC2LP6AEqdn/Rd2oHBTPPm8mj4a3m4I38Z02pw91YBN+x0CwXGZST8zx3P5
	 +FF+gpDjDPAww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34ACE605F3;
	Sun,  6 Sep 2026 09:58:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C831A372
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB4C240634
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ktPqy-N4_q6 for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 09:58:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0032F40633
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788688735;
 b=aUgaEn2CLbp2h7A+KKqV26AwetzvqWdixPblWC3E1sUlrBCSig0PaAGsoPAj7wSJdLs9
 xAvKwZQLNz1W1iVsMOBmmQQ5LpObu7gI94N7SLxXklWiqfvR5p7D/IeryJvEd9GzfIb2Y
 XaIx6VdK2IQcZ0Bk3X4RQoD2Cc8ArXG7R6ewuhWItNAFyTx2b/997ek6NH0ZJyVegyCI0
 pXvZ9//yE9OzLkZLns/F0oIZnVxkiMirqD23kVfWOqbxK51FPj0aBJqWya5dc7HUBDuvT
 Nkn/N4HD/Zj08M8n+7UN+YvZTZdEm+7EzEkYCho3G/i4RnFqAwEfXqdelWQshehQl7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788688735;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
 Content-Language:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=e6W9rZ8+ksg++mg9UQOMVcyjOLglac7WOk6OqaYmBKU=;
 b=aIdyiqa4C5Zd/QyS3r+Y3Ky7HHWcqJD/jQ1AspOyIMF94coOkjRSltGCr2LXOa96oLCT
 wVs8BmDbKByzQigY/ztHbWOioPbOjwURGvYXyMeBr7Gqy+keRGUdArWyXHN2u6VaCOZ4d
 ItyQYnX0nQEsj1pKdtcdJymVqRiZPpP3biPsUk+7natJT8wE/Bcr8Kaf/LvIAeu3FB22K
 vLfEVk8/O8o/P6YoAesXd7BE4759JhzkiBaPsHBfAuHbMrCVQosPQd8/AMUxru0QYs6/D
 jjBLWET/gdya+dX0v2VSop6b9DRs5fcaP2NT0EKpaNN9HYPY0h+6XMKcUUSS6jO3o2w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=MjXpK6bT; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0032F40633
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:58:54 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MaJ3t-1xNnZO1l7F-00PSos; Sun, 06
 Sep 2026 11:58:51 +0200
Message-ID: <2fad4182-7b89-4fac-afd4-3ea277e5d050@gmx.de>
Date: Sun, 6 Sep 2026 11:58:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20260202150220.3996455-1-buildroot@bubu1.eu>
 <aaf09d64-a078-490e-8496-25daa2033bf0@gmx.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <aaf09d64-a078-490e-8496-25daa2033bf0@gmx.de>
X-Provags-ID: V03:K1:IOvnEIYDonX7zmhcdDwzpeZDd2La8yU+hMnebMXfhxaJFuk383A
 4PFlNycjB+Kc6N3br9oNNSi0qsMXnuKf4teZgci9b2qsxpYhLLR9/T0Yco1xKG/QC0Fmp2/
 TTHDOuIcNyg5PWo8ml91IfS/saRGTP+3HjCzGkpJNysqQv/oml0hOTcXhB/09N1zdJ1zldl
 8pQYt5QT1DDET/3qeSzJQ==
UI-OutboundReport: notjunk:1;M01:P0:TROmrUAl87Q=;3vhL863yr8xNCkqyzK86ZHC8eDa
 u4g9vG25oSH27an1nj3Vl/UjzFzQqQ1VZ7dZJmvOC8h9Yt+XprkDp+fP12Z7JLviUXtZ79MI7
 BBdbKFfbYHt1h+P9YVfDZjHkcp/XYPD9XxbeyuvBu/djjEo+MhscHdfQZ6ymAlSdwkNA8mgUN
 q8GDQ2UEepBs423p//vnCiFBIc0FpQTZA186SRKuklDf2hOESohbgEFRPb1YsdEAL1liIhUNz
 ZpQ0XQBx3qIhhMJ9cTtuCltThZ0tWsiGqrW09piUJ8gQRmQIAreIGRPjO+J08dJmRI/5+UOjq
 IoXdWd6lnl1H0sMuxogUM4UGCpynrnTpZbRtCozKlu67+jAmj6vQ9CKpfgHdvR4MMGjZyBEeX
 rQEcReVa4CxxQuqgzmD6Xa0AWwsRD5+xPtpSbucdXdPrt9xMUyZjRV5wqQwsgFzNkBsAs8iar
 lmxKe6qK+p9OxxCE4qrkC80jGwBq7+c0iG/M6Gym7dMS4IwcCVpzE+05frha018wdvNIGI1Tb
 xfCdIGWS8wsnXXPKvaSF3tc5uv0CMmSWCGqJx9U81hIoLDUD3e6hxM/TKzyK/qh7ZyB4qfSaK
 eu2WcKj01jVthnFh/1PV0kh/K8WtHWoUgL0EmyVHzYBJlncZWNrT4BSBcFoDnRctip0N4uPve
 atkzX7obhIZnIpi2a7qNYxk/b6aKA+L+wx6vzAk8G+6WbCxPnCE9+G2a3cZg+lDbiqDv7iIVt
 gsFtaQjoGSc6oYDDYSTpw57a4THwscuCZR2wUOY0bv0akL4pcUbT+ij2lrtr6IMiQgQOQqw0v
 BJ4SVSuvQLcK8hwBVp2BjhcGBmcIAPh94i11iFJjZDnZX1SWTblFFQ1BoJs1iOYUO6VJ5vMep
 UojJPfHs2QCLEH7Ua6I3ad/pIkMFZ7Byu4j2SawAe/NltfWcWW0Iu3bza0MqzwBg1yH3Le7+x
 Cf8rNjl5emiUat+M1ymXQFwkNUMkzV7Yg1iXRo+6eWFwG24Gv/PB94VA/KW95Z7k3Kb9SCfh0
 gL9ZjKM+MqpNsf9vQl/dY2CEoR8hHkZ8Dvy/o5zufS8FHpTy9Rx9M0L4dRYKohUl2exfFrTe/
 D7Yaw+KqtnuJmv0BpHLZ6XfdLmixhOlvUeRfF9lgKKp/YaEL0Rwq66ebeCvla0LRMKE9KQU0B
 ncwpQhLNxOFOaTNPS8hC7BHMiN3e/FvvJdBtxmriBVwTN2WKhl9ImK+TBQ0XKp0uCl6osTpkS
 l5VXQZT5k7xSS8JdAZ2k/IKNrhSv8ZS8BGPACibQINc0lw+EatSR/PsFdsuo80rVSwctmbGWz
 YeaAlRJL06fPa88dX3e2N3PVyz0yKJx+aojYzR/cVwP38W4vZ0swcedGaijmgRLSAuBhIqi2x
 KRsMgGvwD/uRMALiS5eBnS0c/NVUHGnPS0p4sulHpSy7aBVNNcqThxuElUlaVD7yDF4JztCPg
 peCmDGJj7F+P6knZXZFIL2nV3b2V33NXmm2cNokqwrUJz7gd+zL/e8iMn9sT6O5XPTv++IeD3
 pnA6Iqo33OlXCM7fwDmrh3qIuCaF1o59gU7tONuAOxP5jrZfoxtS75Y+jgV6cz2/ndo0Gfkcz
 fvDqwZ3YMzEblRDFodk71hobnX85RQv/RZXyld9MQR8BNfMWP2J4XOjgzUuKoikYfy8lRWMMQ
 v4JZH0+SjvEKaxPMufhcqu2m9l9v1MYyZzyp668rv/sgD5uYfFLziTUlT3Dw+LyyzzxOykyG/
 c/aMokfYSRDNCJa98tzJorF38cm6oTXFBoPC4zSTKzQPcFEVmDk4wLM8YezuO2ceJvPAZJ3ED
 NcEalFu9jGyDsOBEMKtlVjJwiThCOr9nccGiMUCqHGUUbi6J66iCfk+N8KCz8hVDwo44VtQf2
 KyRFLGDUzFWNCXkYnENBlJrCgN7/Dq4DixrIIQC8ce8ut76YuoL8LccXCOImlpC4ywMjKc/2l
 exceMde1TmxVtKZkle6CJQRlhv8aHlaKFWt8GSOPtxeEiM13+LTAGjVZ44+EshS8ucw3pUoFx
 knaAOXTLSsNXUiemuE3ewZ+H0/M8tYOJyeP6ZbKQfBl2ZYceQCvEsP/0hTXswGoVhoRE9dD0R
 /GDKLl9tfuKu7V+QGxC6sUgW1RxLOac0rgmDX4fogu6h5nTHXnTA17I6AsjPnEnFukqW8X4K1
 M6YU02lNwAIAKf5Vsk7U9d3lVJRcNyrJ+bG4UmtinZCeIy7GEk4Gce3ByQH3jq2I7RlceS8Zg
 AktFA0uY9s5nABrE2XABfumcdiXD6Nt/MCfefo4W6MB9BxD72pE7coe1n+o3gmz7ntUMCo9DS
 dx1Vt1CdP4pE9vEc5JD1s3cI/YCP/Jxp42pUD32hVAfUBM3fdP3MdK04IEntwvw1kU0eIoBYG
 xGyRSTBE8RbGDno8KGW1yo3zzVKQLn7zin9cukN8X5zOp+Tom835FM5xtke9rb6xRIkszxlzZ
 f8Jy/69mACaDhXd6LGtuep2tQ2OaVQeqo5k0Sm1f9S1ggJn9/Ay92R5gf3k8K/WoqU+RsbIqD
 iDQEesxux4nLCBdNhfVFfuTrTKYUedkOGyGai14I5pnGWNgRymtkZKnpnGak9d81nzAndu6eF
 vd3QGbkU/cUi1gwGMYIWO3eAH8AJLr7wgD+6zk1O8bQI8w4BWCILYs+7mjZbz5JG+Rm7BTCSu
 KF3ac72HmzogF8kO7Bdo4oJaJmJNSvHVqJXYaBR8jsP39XGfzgdRcBObxY0c95iqeDKmYYrL1
 +gcrzouk2v+G9k7ESwzXRKUjcDweVN4J2LRMNdf6NzJP13AQumhIvAMC4UU+APU0Wtqfnclcg
 syPak5Y9WEK9EUkHsSayFw8e+VllDMyqlHwinyHhuerwaxBOpVlDA+JlKJgRI0rmrVs/tS7H0
 vOoBAhSJEuSiNNABmNSP4NfaRB3f9nmGdxppMqF+4wbboIQ1O0u1oAh8iqehBnmvGv484DHCg
 xZoB58674UdRRU+yaHY5MeNruou6X3WOjlfRfH7ay1kg53XHULYj71NuC2Op32p0tljI6NNxb
 634L7umgSPSb5s5copVp4wxwvUGX+WCRKlLIhfJhEqZbuERCa6yO1ONqZ/zYRmdMZEIHQzTrd
 99qAZ066Zc1jNebrBpFoLblvWnGkV9lleSmT4xG5RFW19zmld3FBTM5YFb9SiW3CGkOvNeEL6
 EZb1SvYB3ApVu/b+e7PvmW0TBJiiRtMXlYC8mKH/NqT9DRLYr/O+eUBOzFUiyx4LITRvL9enh
 FmmIm/SZW7A9SmX6BDH4DXYRCceH/BvRzvhWsbdvl8o5qSsS7WjbYVssuc4N4U5ihqqnciAXR
 9eFd/+nsyiHq0ucvCEPRMSE2dh/MT4STSZ/nAmpHx4O9mGcVMxQmvMq/A2N9OuIj4l65Wod5l
 VYbTOMMIs5ZKcclfmo0neJq9hIrLqdsVQNBwSK/30sF0OuQXCOZDwegVgjCzjmi7JYl/EC28K
 ktE3HqbtyWxPs9INjb9HacISlfHGExAS2v+AmDvcpeNPMAv+uQYuoT8Kbohuhe+lZhx5VHRQe
 pUTS6CpjQ/Mi81YG6iu5sbLr+jQBu2LkC6oVu/ctJ4BzDPTM3+gd32NnlHAKJJB0Tp0Lry6Mq
 wNylDsttWUzVX9DxRs7JDWvEDdJ/46IvRenjDZjzcjn8xudWidlzlAHV0zi+xCtgTrHaCXWI3
 966ZPXAIbWgBfPRJ0WRLm4z5sG1wI6xg//11GNtrPO4YfDLBHybhjJ2Cd1vv/7ZgnrlRCl6br
 sNYa8MXjgiuxVTobHyh0Ofvs7BklqUrXdjF8A67pPVWxQgXimKYDtGCcYdiTe0qEWplVGZ0Iz
 bcA4L3GLnZu5bObAKTWPvnCNrnfHtVMnfCouyeBfVZg1pk8GDiDGMoTyTL61EyKlN0jvQtoz3
 RTAO3oMOll6UXl0YxIU9xNCDj7N0bTjV295bcyUD1cGGDM7R8xsV0Vz2X+a1Iu4MMB/CGubSF
 zQW+n7wFQS61QimbrAEy/wwpoILz6v6AbYeUpXSYh9cBMrRvN2WebSKqDzPsjzvdCaNVQBwUr
 5jd2kZCbGqX++sy+LLpFwqKu4Tc2wuKDmUIzdMiHMbNJNQFPAE7p8u4gzCDnymM7/j3TCCTpP
 CZHneyBDaUH4kZMeYfEqgBWa5cxJR+UNG6G/VWDcq8MuZlc/YPEE0xqJz4XBW7tvlwyg826Qh
 yCaqEYgZMhklTSVXVgyVb0nT+WvSHotW/4/rg7wJH3zdgOtJ5htD/5ifZdI+nDtou6MhOhrCo
 BIvL6j/1C8Djeq46CTVxvw1MYHS8B1eEZjfi1fLkAJYA8XmHx/ITgo9+j2pH80TF7G1cEBYCl
 Tg9Lzy0bZuo4h/8hGrCx+BIJGBSUgeA4+LH42XCtGA1XfuhzBWrJBQMgiw9LNdkA0JQB6bBEb
 hd8YVuF99j6JEcHb8Qc9HUDL5lKzvGIOIZBg2EXUFsCPuR1v4YsrpsDasT/ce0mi4U8vswVgq
 bYfCckUmgCCSZa2R/4Y0Fks7hACP+WSbjs6i92uX/1M5Q0EBBsYKoW8U/bHQbF3uWhpoJFBXJ
 VgVHzxPToNRGZjZVvcdAiwOpr1YLgwVOVZ4ydAZWK8JFG707fModTd6Y2/m09ecwv41GtHcLV
 0UYz7BsvyC2O1rbr6ezRtsBbx36A2PkG66COJGNjcrK+3RqgDUrZhdeoboIBjipgAtcXgfCyE
 L64A/r5q8Cn3V7RTSOqo4EszvQmtjoacr3FVQxfIgicS3Q2Jd+6i6ttixIvVAYqAzKVQtvweR
 zaRoWAYGUJQ8yu+sfWQsdIjPqkuHVLyr1wIffBk8VozhWGdEtRpaqLnfTfPba9DyZ4IM1XEZt
 2eZMCHiw7E0SkgZXjK1HqPMniq4ue0SyrWwJG3hmO/A9u5IZcMGpgFSZ8UCiB03dyX0lpOGBW
 f+VMzsS08ZYDfS3E3hIOnIerGOwt/53QVdiMAptDglL7c9FcKxhxbl9aQcYiV4SZMvDKLBgiS
 WWaf/XRVYltgYqM0wF9t3n1BNiEIPqWsCRE9lnbTam11Jhi46VIvfbIxiOSF39pLZbQOzYG/L
 qf2IkEl28J2LHZvblejXFtVFSANvb7sOts6nwZqovVuwhReqnkjH4yiZjqW9Xn8rkYkoG/sA2
 QYHm7Rz2O7cWNgZ/1+MrFLa0mCr2NCyzLGXcjxVeXdwkdllAHFreHospGwS/zPrnc6C+FE5Ky
 hXVLePs71mwIYd2Y2KWfpmA9TxLCoLl2JMw2cPbfFR7pbifBxPHC5/5oRI7cGsmhd0IjLcULb
 5N4Yj9i95fHXsBz/zdWaXVkJRL+cNxhTjOup54jPU9J7+Gf80HvD8KsfvvqrY86zniDoD1niq
 C0Uqgusgol8uKtgUwGisIUUai+YL6PnpCjrVuT3reAhVsUnQn7AfXVuYqP6VcU5U9TI7eXLAX
 x4+mn1qx/aOAlSLYbpBuyzwcVpXErzGqaWgA8TGga1Wx1gf0O9R9vaDc5N8kbQZ1iJ+uI3+ce
 qfG8mRi2zi/AlIZa5cn7f11vZfDwD28VK1+FAVntQ/Eox9lZuzxBMRsBa+P8HP+37b9MKy5Qs
 Q2MY+vjs+5SDA3iUC7R8/HTkhQzmFRHQotnr02dNXIBofxHfd1xQ40RshBinoD24oXA646Pqx
 uSk6uLCVSmRyv8AGweCPET69rGmU0MpEYrNV6ytiLL9dfkJPaJPSJ/b7n3io0YMfXK7z9nUsv
 91/UTA1jZp2Pq0Lxp8Z60kgIGJuWoPn0885AWu6yEMggyHDbCgHv/U9Fzv3ff8cjUXB6cENwo
 0goXmZuxvB+5FNA6Kv9rSQulxzFeqUc+YK02qZpxZpSA6mInU0APlUsgQV2Bpw9ST97Bliy1F
 j+pYofZV9xIPGNRENwpz7nRJdIb6HanNCP2XqCkwkqHm3tI4WlGPWCpZFMH1+qkcwJIljda8P
 vIkNS61aVNb0sr+Q7bx/Qk4UQh/BUKHHdYucKw4Io45romm0feUQvORm4xQLugUnXRnZxTshH
 ohMfAjxh4TNtKZl2HyAzP641MxBZabfY5e8FCZEQICAiLoIsIH/JY6fW/wpkBX0J3vV5RUbQA
 l+acVJPcKle3qZC/iJ0VJqQfYO5dVUv3S0IOdti1NN/0eeVZ27o/Dj/CWAfuk6hNk0yIzrwwl
 KqDAoJ0Gqny7LYaABPQw6jxFlx8ujOWH99IEjb5WAOHgJtcyzdC3EXKinBx9LhysbMC2k07ph
 5oauQABWch7U9me9WaB81v5NvAngQJiNcPH5gB88rF05sV152wHX+DqqYJB5mPV69DZy/8K9/
 +SFFCRoBaSKjx+2y6W9aOXoH3KtRy4XraO2pqTLyVV4tyCgVfkI5mJDEdMi5Fwto3vjRKm1bG
 kCX9wY61x0VPCFs7Ewo41Y1GI3SiczkLImA==
Subject: Re: [Buildroot] [PATCH] package/python-charset-normalizer: update
 package url
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

QW0gMDUuMDkuMjYgdW0gMDA6NTAgc2NocmllYiBGaW9uYSBLbHV0ZToKPiBBbSAwMi4wMi4yNiB1
bSAxNjowMiBzY2hyaWViIE1hcmN1cyBIb2ZmbWFubjoKPj4gVGhlIG9sZCB1cmwgcmVkaXJlY3Rz
IGhlcmUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1hcmN1cyBIb2ZmbWFubiA8YnVpbGRyb290QGJ1
YnUxLmV1Pgo+PiAtLS0KPj4gwqAgcGFja2FnZS9weXRob24tY2hhcnNldC1ub3JtYWxpemVyL0Nv
bmZpZy5pbiB8IDIgKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1jaGFyc2V0LW5vcm1h
bGl6ZXIvQ29uZmlnLmluIGIvcGFja2FnZS8gCj4+IHB5dGhvbi1jaGFyc2V0LW5vcm1hbGl6ZXIv
Q29uZmlnLmluCj4+IGluZGV4IDYzZTA0YTdhMzMuLjNiMDEzNTcxNjcgMTAwNjQ0Cj4+IC0tLSBh
L3BhY2thZ2UvcHl0aG9uLWNoYXJzZXQtbm9ybWFsaXplci9Db25maWcuaW4KPj4gKysrIGIvcGFj
a2FnZS9weXRob24tY2hhcnNldC1ub3JtYWxpemVyL0NvbmZpZy5pbgo+PiBAQCAtNCw0ICs0LDQg
QEAgY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9DSEFSU0VUX05PUk1BTElaRVIKPj4gwqDCoMKg
wqDCoMKgwqAgVGhlIFJlYWwgRmlyc3QgVW5pdmVyc2FsIENoYXJzZXQgRGV0ZWN0b3IuIE9wZW4s
IG1vZGVybiBhbmQKPj4gwqDCoMKgwqDCoMKgwqAgYWN0aXZlbHkgbWFpbnRhaW5lZCBhbHRlcm5h
dGl2ZSB0byBDaGFyZGV0Lgo+PiAtwqDCoMKgwqDCoCBodHRwczovL2dpdGh1Yi5jb20vb3VzcmV0
L2NoYXJzZXRfbm9ybWFsaXplcgo+PiArwqDCoMKgwqDCoCBodHRwczovL2dpdGh1Yi5jb20vamF3
YWgvY2hhcnNldF9ub3JtYWxpemVyCj4gCj4gQmVjYXVzZSBvZiB0aGUgcmVkaXJlY3QgSSBhc3N1
bWUgdGhlIGNoYW5nZSBpcyBjb3JyZWN0LCBidXQgYWxzbyBmaWxlcyAKPiB3aXRoaW4gdGhlIHJl
cG9zaXRvcnkgY29udHJhZGljdCBlYWNoIG90aGVyIChhcyBpbiwgYm90aCBVUkxzIGFwcGVhciks
IAo+IHNvIEkndmUgY3JlYXRlZCBhbiBpc3N1ZSB0aGVyZToKPiBodHRwczovL2dpdGh1Yi5jb20v
amF3YWgvY2hhcnNldF9ub3JtYWxpemVyL2lzc3Vlcy84MDEKVXBzdHJlYW0gbWFpbnRhaW5lciBj
b25maXJtZWQgdGhlIGNoYW5nZSBpcyBpbnRlbnRpb25hbCBhbmQgCmRvY3VtZW50YXRpb24gbmVl
ZHMgdG8gYmUgZml4ZWQsIHNvIGFwcGxpZWQgdG8gbWFzdGVyLgoKQmVzdCByZWdhcmRzLApGaW9u
YQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
