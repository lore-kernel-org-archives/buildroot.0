Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2AECD4F26
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 14:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C398F6F880;
	Sat, 20 Jun 2026 14:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QLs2AzUq6wqe; Sat, 20 Jun 2026 14:38:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E623F6F886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781966325;
	bh=fZUeZiV228XoomGLFaAaEEs5hXtU3pZpWMCHR6yH7DY=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=oMtN+QXzKW+ZFYzyNZI30Mb8BSSMCXo1Yp4mOUq3BU/GehLSeZ8ISbvqQD9Pq9WT0
	 ttDQHco7b2j1r4PtRxWbS8K/NqO5aEdpLXMgUjhj4iPK5QpzxQmR8dGIaIcTQJ+B9o
	 bNrw2MbE6s8NBnrvhZhiQ5wEYF5/BY39YAX/Oco33bIHlv3tL2W9RoVOieRziuo23R
	 suLYCTKHQK/TzCGeLcyhd6W2rDc07LibsCGUBSH5Yo1oc0jTqWRfKin5m8eTl36C3e
	 IyIOlCqhI34LpwlhpE6pg81XOZdRWBPhfp8VGQMC8q6KoQ+oviNuKmbvEXFXRJ4k96
	 wALqpV3zf/pLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E623F6F886;
	Sat, 20 Jun 2026 14:38:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B5E1E2D7
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 14:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6C504EDA7
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 14:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VmfEnewD8xtu for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 14:38:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 69B584EDA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69B584EDA3
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69B584EDA3
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 14:38:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MF3HU-1wPwLX0EnY-005B5f; Sat, 20
 Jun 2026 16:38:39 +0200
Message-ID: <633c638c-6c16-4a58-ac58-64debf49ccce@gmx.de>
Date: Sat, 20 Jun 2026 16:38:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260618064220.335254-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260618064220.335254-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:o5dEplbTgWUnPdDooJ9jiRuJeafrrxolE+Pcc8brZMho61ED5lL
 Upmu2kf+N4+vTpItd14mDZN5BUcKE0ZTY/hlmcgyUK7CDbik6U08l52DvAkjBmhONmu0q9B
 ZJkcwKg16+LstsQRgqNZEqxzXPC+dS9Y9izJzg65A0uWIoGPVTCFh6i/JUATXR48wUe0fn/
 eTeI0Pc+I1+FH55AFFWBQ==
UI-OutboundReport: notjunk:1;M01:P0:KYR1KOcE/0c=;SFcqa+QXYdmDh2Rnd65Iy9HxkXF
 1/LYCgQ6045meTo1C2RmIorUjakVcY1/pVk5wcawcBskvJ3IAaB6o2dacCGraK99jpHxvsk9F
 lkz0COrb4jVZvmXiPGeAUhRsck2QaTtsGRQ9sNKpoHEdjl/dzXy4+q3WHmbig304E5N6gB9lC
 210HTtgM/QXncFrq2tjFJw3LIEhuPOC65RtcTCr3bgHXQiKoeNG39NgvnVjRgmMv8M+WXdUq4
 F/ZDd4UJhDHIK0VSq8d3sYpYPC2B8yQpB3VGlmuzVVSvHI15vw2wxejvK/xtFsdebxIyiZKqd
 zljlFs9QeIptUd/2MudvQugtiZozYXAw6m03mTxcKEKpvFHcu/9JkH/Cv58xLgnxz9LTsmosQ
 RmpbAly95EMqb1rKTzQ/JoyITqfZ+j46zGJncghRLnIyirWa3tjSLdeCZGAXQRjYm24XfHISR
 gpWEMo31bOlIq1Ro2b+cl5mOoPoeuqEGTK1nYs+adUZalN1m96WW7PeA2/kbVW4yCX3I+/l7Y
 l9O3P/hCIigg5T0VCzczwRlmzL9OvqEaNhyGRo9xU914Ineo8FJZaJhesCW0K6VEbXNy49nZ1
 Xd5UANPEpm4l9AkmWVn9OLTsHEU6kmRltJLGovse1anuRuSLg4M+Yc0iHo9rNekry+oM4xear
 P/MoULsNC/PLrwtIIuRvhRHYGe+Mxz5Ce05AL47g9IIEbadMWYpSdRjffrqIQkIz+uu01zaTT
 8eYzS1TjBCBPk6vWWu2PQOC1EvAguMxmwRT6ONHQMvUvOWYbpIHnviyb5ar6nDhJ8GVD/eWAs
 Iw8Q8PusfRxXNyS0UYKraSuVwkebpLGMaUW5eXogowm/DhKnfhJBc+E8aJfVh1P4aK7/CFtfV
 C9YEbZLDEeRNLQzpSqamh8/diwojrFEfH/MjrxUc7eqgab+wb9kszjlNb/yvYwSfw7O4Ra9tl
 CbegbQB+rap7tbk5MwRO3w5nNKzBZbyug/w1n7NEOM5mhKUB5L0+IHTQVfk6+/FyAoT3i4pAJ
 wfwCxMifM5uiQ4XbXsFyKFB3OfxHa7LpUpluvRZBmoV/4jY1jnIxdJhutdDMNq1tjGE+uH2EC
 9TkRu+wIYunLejTj0WSXeOujXsprb9HybwTarP1cDeesp2gD+DPMCv4nkEiKuLUHrBAUW3ocH
 uP8DGg5C0TvsMQ3t6QE2fm6i3Fm1F9AmCE6ZjR5znr0wdNZvlRk7/HdhBpfl6u5qzlnZm3zkP
 m7Ys07uYFGrHzA/tG7tmrs2dJs3am6Z5dAoS6VlkFPZq9dodPxiHBHbdEY5jcmHCGG08adviG
 K4KFu9zVaau8LKwmG6wVT4Gai86ywg4hkaToc8IonRD9+VqeBQ2v3YPeNkPa5DE9TVODjjR5+
 3PNyy3UcIMM5INX4DF4mBCUqcfTdWva1HW0oB/msS341w+kFnhVwZKHAQGEvM4Y4LKIdPpzQT
 nHcPfm6LXN6Hx+NrxLx4+nUttjMUdI3v46rXDdoYDT5bZNcSTzSM0focRJ9fXIpKChCv3BicM
 bpSBt0mEMETzjvwNFYH9ZsKGUndDNoR2ffV4MUZyarNtSt8pge2FBgjKcbOgQ5w4S777SS05T
 +7kPKG0dAPvHOIij1cDNHOyWTIeato7FQDj3SpJDX3P2fUL9MKmayZcUKGj1CHrs558dPfvUI
 jl6DtR1w5yiqJjXGqX4by2hQsSFj3H0b6JcKnU4Qm0MKd/Z/wfmpg2mYlaUdD07gyPBhZhv6M
 XdIx1cmUBaj4l6sVJyHTqfYBZdIJNhLC1hxPXDStZuUT2fnezJHi5XDMlYXJKuc5PN9/JshdK
 J/OjxBrUSDlNLREeh+WS1tvzcmk/fIXKgUR3gv+IQUm4dfIl1JcIWnwO1A/soCt8+POY7gIvx
 XVcp9BGzgKRwknJjG7KOUgLiHZHuMgZxrvuyQtvvHSubL+cUcfHvwqVdA8WcB96TAD5tKyA3p
 ncysLdEwsdg/Cqp7f4GBql+8rGZcQfLiN9QuJwGYi1iOoUMwI1lRm5jl0F6KPM2F7yAWfBLpL
 MInXCifz6leseOV+sBYAxnQ3K9n1cdOO8h1ErFrNDb+34jbppo/ii0IeiyvGaH9Ybf0YqseOz
 YhrD828KWYckBjW47R69ZkGtueZMBxnGkrma/jzv2yvU10E+QbX58Rbfjzevtn2nLXAKmJi2x
 MDu0TXBpWzRI+r+DaIcMwXDFIvFHswQ9d0Qc8sxCIEHMvNO/WCQs0s41kc2RiHHSn9+eXwP13
 pFvD8Og54mJtvcXc3V/AQdhQf7JDStDDieg7KRiW83eludRrAS/uM44odW/TTwkVP5ldku4t4
 AcH3ouKIpyUWOd+olmJV/sC43knM7x/ZCl3e/NpoDMEdOXbBofTK8L20ySeUsDE03jwnhVjW6
 jyGnQDsaST5sJYprKGJsr7+IcAv4hmqY9YOOw+F+UV3jD/bYSX9GWa7kNdDNvIiivfQOJ/X0z
 exLPVztPXAx5yUcOBr1k9QrzPkHlgy4dia+QhPiBbKTAZPwtG9CqnnwibRiU9+hRBbB3qY15o
 iIpggepblfsmuROTYPtHRVcZDLjI0gqr5vVzowLFcsyoByRUouDjMXbLQj7yuII7ggQMjZ3P+
 /zWkneOsJP+G9iFgMB8QwgkMqepbgNojqD1bGWKzH57Y0O2ab2EsnL6IoFYzbtLMgTJvFNYes
 Ge2jvGMSHuSs4xY64YiQhJcDb95k61+4ONUoVhop6biAUPUteqlJOd6E1TDz4Dp1VaXcj4GOB
 NsogRhCr0Nd2U2SHYGpo7uBSzq6DAvbVdW/sVfufbrKTQoqbD6TbfTiTjzeYPc0Iujm1Ku5cT
 pEtdIQgaR5bkO3+IzYIZsv15hQgwbq8wTFX2XxkqgzBdFJMtb/funxbac1Veakajw/tJr/bq5
 W2WkE0M2EZDoLh5MlOCnKNPRanjaV7MP4TEmH/fbfQ6MlvihhMpTxkUzJgdaxzT1Rw9LDPYer
 6oFznIUBan+lLAB5lTCSx6uh5oLSzga/WpqP4Irt4rpgLg0fcp9aJ6g45Sd09gZf19Wy2C2wG
 ORMsjyfte8Xrag2g+xttEGx+UiFbC/9OVlbv3tnVcbByryU6jBZwcnHlI1yZSmuP/D+Kxdvt5
 r7p5NUkMdJd8o6QHi3qQGHtpsNlwep+7BA3CLMHXHQ7Lak0cHEAS5Jh/Ckz15KVAbSr+Ym/SQ
 y2YvcIHbAvkxEivYaQHf/kOBkgL1d75xNauvV4OGpkuQFaauLGVSwyUqMTjm0/2KxGMDNVJO3
 FfGfynOiN7dCZxEsErUlDrGFWMpgN00gCwVsidHD/WmFYZcJcMx5ugQV1tYNUUgKq8vCpn5p3
 002GPpDCZLIEhlolbFSwh6coB52xjeAXrbNSe4vkmqHxZMk2rW/SrlInx1etLSvNrH7iDBeyt
 7DRdAvNsXj5+lEKuK+voScfFWnVULn1qV90K0OTCZ5frD9dvt3gXYLbxc3kRmh7057X6+ZPCU
 mBqk8a/OFV5w07EosrsRbsSG/vVpv4DeJu1/MFcv/WLGhMEGGFDuXxiMejmju1R68dMw3WcmS
 1t96JKhhgHHM0DPK/lH/HYBIEcGaMbTVpWHccCtI1BAzNBBgSQNr6H1DtBVZl3NZ0Y4+wQLb2
 AqR6C9jZTRVrx1mbnm47dEydEal68lrQPpsI8Ae7YwZhzub29eUb5JZkmh69LcZ7MWdX3yPJK
 7mfZMmcAHBJkcYSWPkYR1oJ4OPyghf2vbEsMKp4/CovMdmU3yOqWADgESCDavo72Y1g/P66UT
 miSY4Wm0vGO+m+pOxWnB/nmt0Y/XzPZuTiP5xjUj7WezcE+w/qN0Lu+cwegbGyF+ZrSDi/sZn
 FKhKg5phJCt4VbdKQvszXo90tHfOu5SKXCgZFv3We1oQqyFXkC4ZKbci+Emq05TqdzIEozFSF
 tjIa6K0JEmZ8pyOyV2/szLGVQ29kk5wWcxRZeOKAQg59/9PDtPa6bWMUSDwmV2kv6yIxrzICu
 wggeimXWOyRm0kaFPPeV8jmZ4ObzMPSUCIdV3psoEGrUzMxJ+QcrSGtHx0zWVfbcczRtQZa4B
 e6IbN/2y71cW+zdfx1mHaXpZFYwpXZ05krI5NvAJmv3bB2ilNpoFuqr+S0g+D98OXXrMAmMPP
 Yre7M0EZgRHnGOfWOdaCLFyVlh60iUFqJ61rqLp7U6sxF7H2CcYAK9lxPiIvwMduxVkz9yhI1
 WRG8q8bvq8JRuZardkMQRgU+78n4+rtt/tWUx/N+xjVHF0EfjMvfBSNwfCQD1IB09ji1akx42
 AJRGy08Lol/vnOqvZIZtkY9NXF1ie64E3Wtq6FAh1q0b7qXI96iwgZ/MUSeFXSpD1nRDcEzhL
 YiYF9MbAJoeK1L1v6VzedUanOkYgcsbGrINQBlXkGTt9KFz97f0/JGi5t01rgoK8ieZwuOYul
 DYLT/say1n8WXDYvwU8l3iM2L7cHiQl+is3Zg2Eg/J2X6XXTWYmvp32MfLkDak+9ohLuJiMDQ
 22TQgJAA34r0K+HF4lvIKgmXGeM84sXtEgU32FGAgbAXTf1UZVSROKz88yS7F9PCCgNh88Exe
 AVqQ2sWjIp2w8F1mrY9KfJ9O/tPdtMW3uIQZ43/EOhYrgP1g7vprGMyLw52ZIDfrkffiHEO0E
 2rogdCdNhylS6sMjm8urQc9wcOKinb87cN72a8xObRhuwpbli6MJH8Ac/09Ed5UxaAMm2qCUE
 3o7MDVM2zy8QBS48OOhy1BAnooWzPLLToFhi/L45oHDGj6fbjKxgRLJlJOJMCia60njZyynVo
 Wj+I2busR9mKwUmhUURHmHbmBblT1x4K9pkCjuL4xjyXxq2wpXpiVvdNgLRwmAcDIPNh9U55u
 RnFrwGXZ4yxaJU/daoON5Gm2ln14l6jSYLadF8oSlG9c40YRRu+YauFNDmpyqz4NwSNXh6Xk+
 8LM5e0/TnEpn2DCoXC33gkJiIXmrGOKDYAQqwJ+R6Nv+vzCiyYu2WN47E7jhSJmAX4zP3oLHK
 6iXJUjUY31T9iudzoppzhJNxIbxv2ibYer5sTMM6usvjVNAvoKBto8Z0TTkjyK3hp5VMLdPyx
 /Y22Z5YEG02YibEYDmHCbQFZbF60/oufGWT3r9d+eA9MCroUhh7Da8GP2T5UcNY5/qaQ+hoKZ
 2DSVUDJ1Wk5UAN4g3gRyya4qVdSo6s65R0yNOeoJPkHunvv5AjfkHF2UEGvKy2hhNjmu24Gye
 +ZpigrFIAurk+psXi6FzVfdIv5WQNCKcLQpZaEXk//HR0q28hLPh9cax6iP+qntaQEz2easMq
 9uP0fddqSRPPjVLHUPHs6RW6aC+DZiQcAEPgkTiMBaiZW4uCchKmaxc7GC/lrfv2iXhnqihUl
 NSZmRHJNpN5ATDKUZuQaVxi3HBjB1AcRQZJA57Fsn54g2vBvbX/UhXWuhn5mJIegHQFM3e6Z8
 nXWJAeo7cm+iM9eFFIlyrUpg4+0db3YA4yN1jBLmLZu9KBN5p5/x/eFspCZj63MRzTNVhRP1I
 GvyW68ek/trCeYyE5kl2ucRe5nTBa0Lh1bmSm421QutbO1HNAPgPaR9Ix0xOKBZnaypJ3BhHJ
 486Pb6PCB7XPF/+aax2c9YV0n9ArpP946j94Ii5VNumIMkYqrKhTcHDgmdriQV7q00N8HG3iz
 ceveaIIOB9o4JIQ2HhkaauyNKmEN+0js54rkcLXJozEzqJPhmUE1NE51tstqg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1781966319; x=1782571119; i=fiona.klute@gmx.de;
 bh=bDjekJr/aB4I30Roi8gaza963iUSQp91vjkTr0x37K4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=kxVAIqyzFt07Amb8zLljo/ARzEEUHj074RQIngDviYj3yYBC+sGS0Zg+RSk5hTrE
 r82aVSl+0ZEG8uxzKrjTZVSITfwja7cYVya1kb8l8LRn/1BmYNKFnae6S8hfvQeQa
 BsZLCFwUvGW7pUeli/vg96nBkd1hWvQozjGTjAat94nrYPjQvThx4ludTx+6OkFUC
 zoL4DRwpcMjtCPpNuqf/QmYZgvXGMCeCUzaiXIFDjJP04pQL1Lhdj6doCB4pV4M0d
 HY0c20tEZ5mf4cFMkXrlmbDRyMLUxkpDFcMhpV0bPzYvzTxC0Ikzbv4gkq+OaqoYq
 S/h23hQD5pNTf0B2NQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=kxVAIqyz
Subject: Re: [Buildroot] [PATCH 1/1] package/net-tools: fix build with linux
 7.1
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

Am 18.06.26 um 08:42 schrieb Bernd Kuhls:
> Fixes build error
> 
> rose.c:41:10: fatal error: linux/rose.h: No such file or directory
>     41 | #include <linux/rose.h>
> 
> caused by the upstream removal of the ax25 and amateur radio (hamradio)
> subsystem:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-7.1.y&id=dd8d4bc28ad7252610d8e79c1313a2d1e3499a51
> 
> which was added to buildroot with commit
> 9530d74ddb04d5fc81f9054ec0e76fbcb2a1e7d2.
> 
> For details see https://github.com/ecki/net-tools/issues/69
> 
> Fixes:
> https://autobuild.buildroot.net/results/6c7/6c7783e3b6dad01b5dd725141ebed2b84242051e/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Accepted into master, thank you!

> ---
>   package/net-tools/net-tools.mk | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
> index 344abee8b3..e208a78e71 100644
> --- a/package/net-tools/net-tools.mk
> +++ b/package/net-tools/net-tools.mk
> @@ -32,7 +32,17 @@ define NET_TOOLS_ENABLE_IPV6
>   	$(SED) 's:_AFINET6 0:_AFINET6 1:' $(@D)/config.h
>   endef
>   
> -NET_TOOLS_POST_CONFIGURE_HOOKS += NET_TOOLS_ENABLE_I18N NET_TOOLS_ENABLE_IPV6
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1),y)
> +define NET_TOOLS_DISABLE_ROSE
> +	$(SED) 's:HAVE_AFROSE 1:HAVE_AFROSE 0:' \
> +	-e 's:HAVE_HWROSE 1:HAVE_HWROSE 0:' $(@D)/config.h
> +endef
> +endif
> +
> +NET_TOOLS_POST_CONFIGURE_HOOKS += \
> +	NET_TOOLS_DISABLE_ROSE \
> +	NET_TOOLS_ENABLE_I18N \
> +	NET_TOOLS_ENABLE_IPV6
>   
>   define NET_TOOLS_BUILD_CMDS
>   	$(TARGET_CONFIGURE_OPTS) \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
