Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2986C56208
	for <buildroot@archiver.kernel.org>; Thu,  6 Aug 2026 22:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C31A408D5;
	Thu,  6 Aug 2026 22:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKDvpgK4jevS; Thu,  6 Aug 2026 22:03:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7531F408E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786053833;
	bh=ydXftMDJ7LmZkr8k3oFvBxOYKOdJbzCS31o9neNNWRo=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ppV1kcwHWjIE7u4WuEXSyiCVReHOOHoVQZyeLaXhQfFXdpP8Rl7CSVjbamWqU8mG/
	 YI/Qg4DMBdIlB1bvgNFnFycah/1rBT+OrmJ7s8vnWQuspxX0kUixFqDTH0TY9lC4Vk
	 /AlLiq6LdNDCJFStIjoWS/wRMsPvyrU+lqlisbQMyPBLPKnHKoOoC7XhUMCRqnmgE2
	 38TVDIE6guin1bnwd39bMHdJ53qLXBNJu4tjQAuEC97ALlxKFUKGe9KYPmwLnI0ywZ
	 9GYZqzlbk8BhnaAQWCnNDWw4HqE20wg6qpRCYBMUtWLR/OxvMRnUWA5rGLOwve9CC7
	 Ah4lbQpC8ofMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7531F408E6;
	Thu,  6 Aug 2026 22:03:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F1C41392
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E320F408D5
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iQF8gseMCG2O for <buildroot@buildroot.org>;
 Thu,  6 Aug 2026 22:03:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B25D408D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B25D408D2
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B25D408D2
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 22:03:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8ofO-1wwCgc14rO-00u4eM; Fri, 07
 Aug 2026 00:03:48 +0200
Message-ID: <fd603fbb-27a6-4d55-a62c-90cd23ca365b@gmx.de>
Date: Fri, 7 Aug 2026 00:03:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260806210833.3852-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260806210833.3852-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:2XJdiyD9rp5B4K+5JLdr/kP/J5Oy++wl1F5LB28LPo0cr/LnomN
 R1uPRN15ijZ7MmP2VKqUVI61ud+wlRUG3Bdf3iWvs+qocgVfB/YXCUj4p6pd4vAt4pbtHnZ
 XgMJnrLPnQBzvKkRANqvBwviGziUIDIj4YHgDuEyZVp0C9n+3R+T9IRoYlsc5WF2eyi/NKS
 HTq8yoPFWcl72VKc5H4eg==
UI-OutboundReport: notjunk:1;M01:P0:jfVZBZ2babI=;diheha+7il+bwF/OUZ3GcH4L0/8
 L77hv1zKOyPWC6Qr5dFsBE3N+ji257cYdi/Q8Fmn2AG1ciE/ZRa014bYK0CHEarrt7aOcfrSm
 tpVheHCKLDPAYAZn0td52G6dtH7ssbnCEWtxXBSus1O8zh8mzH6CD86Ev+BB6B2oRktEu7ZiT
 csTrgHWjf1p/HcycGLS4u9c7Czam8u+KBTeICzIszmx2VarvA2wkQNNqqLWLnCp+y3mNzQZo1
 SRRy65jkK/9CFKpWHSfo9q+WyMSIIZ1e7j/8I6RicE1cG4yfPLwFnZdFmvGx4u+uKdvFR0emV
 9WVXHuDOCSicQ/xH1h5oyx3ue52Qu2nZxaxeakFrHkIjRdoHSgrah8IQo7dcquV7n9PUOA6nV
 B4bbuipu3I06Kkfgy5U9zGzDFO/w8NHABtH0mvvlbBCcr7BbOSVfu28e7gWkqojy8nQTJ1+L7
 9YnJWXeBM7mhMp+YePNod9czSfysIqCTvmJUMiw9RDPMfm7+uGOTegjk52MjKq82nxw3Z4MTw
 3rYWXhjkm+p9r+UIXFTu0vOud9xFUEeq1p7FHSA+vsuIsg5aeX2UU5XHC22DMidSWUmOI+pQZ
 9/mEZsgDsM3MLkIwCqPTAsBssLLSaMMG+LVeThc3QZPR0ckO5w0V5oPrkMEeUUQ27TepzW1k0
 XrtqN6RiyLE6FmL4i44GXC0FSKLrV5DpVd8z0TK83hkzDMGekVO3PE0uvNaYbP9XScWCgR7P6
 j7i2mZdPy3VeqsuW0A1L8idPIjfffKel7yXCfyRRJyyXRMeEshO+V2lhAHeHOKkATpgCVf7kk
 RMEeWrNb2tTYO+tkALFMnUAI/QyNQmtN0L+r31h6qw0P6BdsO7/9QhJdfJwcHnSjzq5PVCqqK
 Dq7+Om7McY2UNe+/sHcJOD5Dzpt4MmMhKP1/0REfHLLgz0+MmZF3k6nQAAOgIdarLqVuiFIzj
 9EvZl13NmQM0z7UyrENIdDsjaz4JH62m5K56v1VwDSHfWEBornsH+eobLr75zgOwU/mlsGo+z
 FVJCUZx3ZYhHwNF/4J7gwSEYTPx4SeEEiHSfkv+sYxVuIqWu5ZCH57XHKSGrMLO8i10W2Wth7
 wo6bud6QsndWsjKch/2CxTFMw3AMxZeWQHfyK5Kd/otens25jNeFzLsmHyvEIwZFNm0KBmQOc
 ffK+mSSWUW779zip2tBC4fAjLfzIq+/Vb3A/Uz6CkhfUALulHJGeNMdqPuU/nwxOIISmqgP7s
 BP3Q/jb66bjNt9rUvyIKj4VCWToYOocevgP0jkBkoBAROg7IxSMW/wS81tMhgh6df1DKjf4tm
 ZTbtFZ8yNgQG5COFoXZ7eRMCq9PoOrCMt6EttzPACMs2LC5IEOLZnckOsVCbHux16xgpaBtUC
 A23cN3SmLMT5xN7MDb0VRBCdktZRRvNkoQcNYEZv2jzxcZUiMVktTbyqh5ByHPav3KKf1QTge
 7wNLyocv0FaqOSU164h2eBnX6RNAtamr9PbCvFR1ousYGJkbAZ3gREzPLLaPmdYmAMIGv7bM0
 0dw5bGYzsBQ1cASka7JzxeOLKzFXDSy6wMB4131iOTfg0frSrNpfJf7tW3jDrtrrPiH+T7YY3
 HvdvrbNlIGulq3jRrqHx4CsACyxM9G5r0jgbSQRHGULLYHqmuS2s5eBBrWIONfSrpmuOkdc3h
 eBJ0i11Y2OrjKDwNcpL0sCjzRqU/Hl7PTCYpI8+DSiwffPExtoIXeDilmnYTBpgLyo7/e1l3J
 oI8HvZ1YfZmDr5WeVfpGNbwQLUBjD1mQuFvUyJBG0eKLR3ODTsjIDjbNl8EVDkq2CK8exNZzF
 rcsE2cB/g9o0fpQcLqzBAFCaRJ/mJpf4dX6EeTOYFMz3DVF5bEy4PEEQPFi/CeoHcUjIPb28K
 idTzxEbu2Ou5/l5RJfJzNIkN5DREnixPUEgiYv/LmgkvUSVMw6nf9WIF36kxxsTcLkXMNa2n5
 0rMttjJ5afrDohRn3x5yIrs3dtbLbY3Eae6a3X8XZi/udN12gzosrI/mjbhLkHIP+u6/g2HNY
 pDSbz16o43dz5Hr8IMIqJ14G1W/JSuCiWXw1ZUUhVes5GbGyk0q7UznzHN3YQfgqTHeATxnoI
 NeXxe+fkQcBKtwtwcQr6yDKmPCpF5B4t5WBqXgY5wluBHl5dfRL8L2B0/FhYCazeOaZRuqy8r
 AbUgtQyQ4jz9dwKmCUP6x2qfC3tOrbKkC4GrzfkIQmxdMbltPGbPUwJE/SGjCd1CE+TFU/z1z
 g5EzS7+zkbiSV7s7vxn4kYmlHBvLUOj0Cp4y/bwX1ONyIU/iQrQvVZdNUDRP/mKZoSI55eRBd
 YeLOqw8jMNaZ1thifp/PHxk8Bvq9b6/+eJX3ywYI5bpVmprjaPBr1y1XUXCugTPS6qNqf5wJE
 jfbO91KE0x4EJJZJpUQLcn9VeEWbZHZ2qLq9qnHVoywruNN1Bj4U9pFucPm0cXh0I3LBkqDlX
 b5vjj1Wh2+9nw3YlCOpLaO5wblMmtiOi2CNkQBJ7xONeGtaMzDNknK7pWVn8JMHMoNLX1J7a9
 dCSTzn1nmRwy/3aRoxVrhO6tSMHHmZQCF/wgLJQ/pmQo3/bGyqF34oB7/61dyLr+jmOBs2eP9
 F+YZP7c52TpRBZ36rVqDVlnLniFQ3vHg2aT655fFnxvNWMcYzfno9hGiPIm10TbZO4cBYRyK4
 zma+Ri9fweDSwI3IsXv2mHM5FQnitdquvjjpX2N77T9WhGEY3wk4HwQjUf9rP7DOXnQ8p6y4f
 rKBIpfZR59FQnv3xKadUaenm8E04303oNWln1yY1kQVM37faO7DjrLLatXPHaNFw0/xM30lt+
 t7SwaDHc+ol3Xx5ROix1UbkDPkmYDjKLgUj7Fyj1312lTNcPNvrnOgaPfBQn/MkUUmKVccPN0
 RrV9F/Th4fdmmQ8OhVo5IuYjU7YePdOpyydjVW+SXFhjhvDgnxakvlfyPMUIPheq+AzJkwr0p
 xbzQbspqEsI+enIbT9+miHQlXlBfz+RvQz3Fxb7yD+cYl/m0Cf2tovJYqWQc8n4emCiBsFEqv
 jyf90BfoyK2d06jTBuOhHZjvAuOD4jn3CxG3KZk9MrKfxDpTl9mlZVX54Duj+SCWVau7nUcIu
 1IGpHuQ3DG8bEAq4ZVgtuufHQ4JfMCWos1wq9bWhs9S1frKWVjZ0QwVgrLxPhsgI3KzylnV2m
 VnUZwfV5dqBJRV0I2jSULYoiWPkkFszyUOybuXAk0u9uzEu1lY6xDjPb0PPb9zkgEeb7lDeQs
 hagWukfX7SqRomesrBUWzzrj7j5kvTG+p19ljI78000GNfchzsju7Pd6oYR9KDDYoUazRwyor
 nRaKsHM5z7vXIHsnOOWO/Yx/rBD0/CO6/7cjrl+nqivnLsXM2t4U871210ySvNte2DKNAPZnp
 kwB/k4DcsqoA4QbMBC6WXzq2itMjPr7rwNQZiQdi8dfpWLTcy5g3EX7cX1v3tPv3VElVqf2fV
 WMiZjEzCczNrodUCbRQW5Mcn5opqNrGaTc2O1MWTaxjwYM5JdRt5QGXzwkfPSn11nfuBMVGxe
 oVEVpa06sxJtcm2ALll8XDgjcVexVnCwV3gwaLtgkSO3zMsyjcHNYkoQsstqVDtWN6Xq1FQa2
 eRYP8attgk/sqBIyccY3wWNXstlEVGwwFDhlCmkj1EyinSTvTWBZIIsYjeJB6ao0OMja5zTdh
 u5XXYdGFjeJh+sYpkuxeiBeGvrJpfrYaMfkNLshzTux+GpRjKZGKUlPfFcKqQo92oFD7TQpzQ
 d/FKlXkJ87Wc35VfTmgV5wGkAqz6s5/4QrKJV6uq4WgtgARwoBoSf1x63w/9+DrKZZ8c/Ib4/
 Ynvc94ThSMZHW/EmqVII/Y8Qeuq4tqe1uNOJJ+DosaPuIUNJBEn3xe7ILvfcpPc1fqxR4AEcL
 kR8vv731CjTzCQ5BUGghlIN6UpqF5F/yFzmqBJiLRvuRjZqmKO0Bc3HPltB1TOBRekcPL6D3f
 Ndrb0Dnz79foQ9QbVmAHvR/tHQVNkNkrsAdsQG2xX0XVE7Ceis7WacX4aZ2zeFGMK2BtHPM7m
 by8dCCPTcqbyYq5d07ODc2N7BSDzGdNrktWnklnvxKeQ9Hjpti3BE4jIahv/1u2Tw552t2zF6
 h+0CScRvKUetiX129znEQkt5KRE3X2NlwHFtSZz2uvsWwmK4D5cUUzksQlxAVWTV+6yM00NJ2
 gS/v9VXS3haLm4MT3StRN4KSTiwKEY5JN52LSF6hpP7syaUFVvVGh6XoMGNc+FQNGwgVftq5/
 6u1RC2nOGUGN+QlPy9gWpOxFX7y33tHJU9umGZTnWX9eiZDH+d+XHQtCH0RJI5JmTKANeeyA/
 vztBhXPu24bs0r3uqhT+R/GCTIBN8plHmpOw7oR9UO/jullv+1ue6mNJYO9wnxO3HImEkJLxn
 I+y2K5gvP8G+95ARs4T5ZMvqPX/0WPdf/0CNdBEtWVCoAqpw7SL9IUDBQZ0/qMNmygWhKLUow
 kj62Eg7udTHOyyYoAU9UU6Ga+ZBk8cY2rT/5UhbDj5TmLS940piYyOgGHRQ+eZeo5bpy0lBK0
 Qdz+l6v4W60J2zhaQ9RDF7n5Gxeys0bZg1Sy9wpSVOGPTKwisNQTAHWQIuB2RXr0Ei76Dv8d1
 6majyP1Xt8nOaPDgPCqcfMCJfOY7aF+uN8UYVyCxa7xDTd48VIsezbW4gcut1NicAuzx6/ODK
 Rv+ijpZ6fqHHeWi2sVYBZutFivCT/EB5/MbnjD04thZz713YANocSI3N08b7+Fz40NuZhD6Sy
 YG14xP5kGjIaiPPI8uVbzSK75xM1xc6l+jVEi4UlGmUozZytyvsefG0x+mEO3d77BbOc8FzpM
 citLFOuONQYgVBVSSowA61mbRZamI8FGvAKVY/TYBDkQdRWRbjHh7Xbo3GZuV2r7lOjV18Fuh
 C6XRf1CAxGqOhMYObPvD7/NzJgJ9Qcyt+SKpXkmTuU+tQA80y8OTdDWNcAq/RuAuPeoijFZOx
 ZWA/LuwKLjsgcx2TIn3hDgk07FlSLXZCQ2idUoI1nBOX48YcDsnLWdJeLLXvyY+gcnLZDS+Ti
 PWWtrJIpImMawvDOpIAlrbj6gH79JbEkLa//3/eTSVym8uGrP6L3+rafChRUYmLKDQMfFlOHX
 AZQJc4/bvRn8RCusI1bVx62XWtkI0ep1tD7XoeMtEUormfuFrjXCaK6/1UKEkVfRJXRCn4zlA
 /bvWqBcJIe6EVJ7zKupyKwouw1ODYLntUMa+HjcZDz13BQMzfcTygQMXvfXnTYtniFk8Vx+NZ
 TpCQBibv434DaJ6f2+g/aKw7fIHzzWmejJxexlCzlNO7479ZCd7gRbUrIaVGktX1aCaQkNYD/
 g9zEgNDAOAS7hCSybJql4zTEKxx7h1IHTDNPAP9M1uXcLhnhiqv/T+vi9Y//TL7pVeOHIW4Fu
 6emhEQ6SWzldc+5o0T7N0yUNb0iSlpsqnjCt5d7wxh6CrMjuYoe32xkhfUHFhOijGdRXy1Cx2
 PRsr0dGjLCHf1uAkH1qnCL8v5Khfs92K2mJgr5rnWh6xPSXMhj/lfPBXblAxME8/Rzfo0Pzsx
 z/RDOj+ainTqZCL6EV5a17FuyIyt9moC4gOUjwGzD5QKE4nNXO3eRHb8vlvtu5b5JY4n6CMjh
 cKYxxw32T1jySfLX4AS7mJZnSut/r7Uy/qyl6QPYN+nUODrRZ86AgOSG31WUzgBQv2XRtySCv
 V1LXAdSiS9tsedHngzs4MLYBkhccPW/xwfgW4xH5xsZrjMoMzA1QbFhC4kobdZ/1Uq9UOlOW1
 Fef+bYolMj+pJARjx31AMyGc0caG6TTRTe1t9zwha8+RfJ+udD5FOqCKK6ErRDVGfCsyIn57l
 +rKxiYmxgrJn0C+iNT49ng77FG/jwq978AUdax50IOp1XE6xjcqyt0p7dWEMaYuUBJ9HFd0Y5
 hC9QhcZ7s20SH4WB7XaM51/gUSfx4yydCAbq2Ha1sQ4wW1avY3hfDsqxcm2pJWlVZN+uMnXic
 eYCt22qhAyibpX+uBi1trOfa81i2Nc3q0edbEdCmsKXfi0Xvu2cQgzLmxwofpOSW0Dsvk6Lfb
 /tUQlCOVLHMoQ1uBnVov3Lm6++BxzF0f4OzfWqUNaTa0XnMXS1i2C1tGMu2PmSNCNAoCD53dn
 2Ha/SxX7+1vXiLtIg9Nj4mzi+vKDImP0fyj0cWenDULsvfikKEDk3nBiSanMIDXZbUR1Ryu6F
 GKxnhUPTog=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1786053828; x=1786658628; i=fiona.klute@gmx.de;
 bh=k6Q9tRrDFnkPw6nm2gRUF+3BgD155PSap1hCDrswy2c=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=F6T/PgOjwuMNBHDqy0JfhSHbcjjPU7CD8tDRUtJriFixbITq80EvZNVQW0CZlZVB
 vosKp4kRiN/r7nMIHlg5dBjW62WblyVZtmBo8oaVFbOQgzjovcAP3I0N1p2bNuZT8
 kO0s0DflcYnvbxsRxINjnPyiWMH8LZrMPQBRh1Q6iykC98bPwpdG+6Hr+mKfmK1Ya
 +8ywT1y0kl8HuKXID2jBUv0wUMSblgkG5emGBn7PVrLLI+XHyzZSE0nJQr1PkxqOl
 L030CRnQUvoMb4Wq8fx+ARn69daQLqfBcdoG8ekppnditwyr7Du5b/XZSejpTDR08
 WAOELNn6ja6uNAYQyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=F6T/PgOj
Subject: Re: [Buildroot] [PATCH 1/1] package/apr-util: security bump to
 version 1.6.4
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

Am 06.08.26 um 23:08 schrieb Bernd Kuhls:
> https://archive.apache.org/dist/apr/Announcement-aprutil-1.x.html
> https://archive.apache.org/dist/apr/CHANGES-APR-UTIL-1.6
> 
> Fixes CVE-2025-49506, CVE-2026-32327, CVE-2026-34191, CVE-2026-34501 &
> CVE-2026-34502.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you!

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/7ffe5d525f354be9be20f7c7abcf860b82f2547b
> 
>   package/apr-util/apr-util.hash | 4 ++--
>   package/apr-util/apr-util.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/apr-util/apr-util.hash b/package/apr-util/apr-util.hash
> index 7e2793cd77..b8fff95de6 100644
> --- a/package/apr-util/apr-util.hash
> +++ b/package/apr-util/apr-util.hash
> @@ -1,4 +1,4 @@
> -# From http://www.apache.org/dist/apr/apr-util-1.6.3.tar.bz2.sha256
> -sha256  a41076e3710746326c3945042994ad9a4fcac0ce0277dd8fea076fec3c9772b5  apr-util-1.6.3.tar.bz2
> +# From https://archive.apache.org/dist/apr/apr-util-1.6.4.tar.bz2.sha256
> +sha256  3e2ae08f40efa0c3701e54a954cefa08242de22a69f91a8ae44fc1e624ba309b  apr-util-1.6.4.tar.bz2
>   # Locally calculated
>   sha256  ef5609d18601645ad6fe22c6c122094be40e976725c1d0490778abacc836e7a2  LICENSE
> diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
> index 477db1c593..c11957bc56 100644
> --- a/package/apr-util/apr-util.mk
> +++ b/package/apr-util/apr-util.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -APR_UTIL_VERSION = 1.6.3
> +APR_UTIL_VERSION = 1.6.4
>   APR_UTIL_SOURCE = apr-util-$(APR_UTIL_VERSION).tar.bz2
>   APR_UTIL_SITE = https://archive.apache.org/dist/apr
>   APR_UTIL_LICENSE = Apache-2.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
