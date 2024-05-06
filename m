Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3AFC25B5C
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 18:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36F6381FF7;
	Mon,  6 May 2024 18:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFxkG5C2NKlu; Mon,  6 May 2024 18:16:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 254E881FF8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 254E881FF8;
	Mon,  6 May 2024 18:16:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E94761BF308
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 18:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5958405D3
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 18:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KyC9Swc_bmAK for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 18:16:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B8E04018E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B8E04018E
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B8E04018E
 for <buildroot@buildroot.org>; Mon,  6 May 2024 18:16:00 +0000 (UTC)
Received: from pps.filterd (m0346906.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 446ESCsu021881; Mon, 6 May 2024 18:15:58 GMT
Received: from xusxph008rp040.rtx.com (xusxph008rp040.rtx.com [128.13.124.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3xwds4qmmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 May 2024 18:15:57 +0000
Received: from xusxph008rp010.corp.ray.com ([128.13.124.224])
 by xusxph008rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 446IFvGe011610
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 6 May 2024 18:15:57 GMT
Received: from UUSALE2F.utcmail.com (uusale2f.utcmail.com [10.220.63.41])
 by xusxph008rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 446IFu7K017171
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 6 May 2024 18:15:57 GMT
Received: from uusale2a.utcmail.com (10.220.63.20) by UUSALE2F.utcmail.com
 (10.220.63.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 6 May 2024
 14:15:56 -0400
Received: from uusale2a.utcmail.com (10.220.63.20) by uusale2a.utcmail.com
 (10.220.63.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 6 May 2024
 14:15:56 -0400
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.146)
 by uusale2a.utcmail.com (10.220.63.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Mon, 6 May 2024 14:15:56 -0400
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB1531.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:187::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 18:15:55 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::93a5:a91f:8d3e:a43e]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::93a5:a91f:8d3e:a43e%7]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 18:15:55 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Brandon Maier via
 buildroot" <buildroot@buildroot.org>
Thread-Topic: [External] Re: [Buildroot] [PATCH 1/1]
 boot/arm-trusted-firmware: enable verbose output
Thread-Index: AQHajR4iauiR3uCQLE6JRr+t4K06PrGIyTWAgAHeL3A=
Date: Mon, 6 May 2024 18:15:55 +0000
Message-ID: <BN0P110MB16737572D6105F0CEE0102F7EB1CA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20240412211222.26585-1-brandon.maier@collins.com>
 <20240505153959.14f8ef6b@windsurf>
In-Reply-To: <20240505153959.14f8ef6b@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB1531:EE_
x-ms-office365-filtering-correlation-id: 98f69aef-cf07-4c89-b5bb-08dc6df8922a
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?8S9zFSMUHkT2WE54bSP5PBwap5xq8LwYemSNaPv5RQxuxsrRihByn9FXTRsc?=
 =?us-ascii?Q?EbOFt/YqlP6BEUduPHMH6YgHI8V/yAfxD1eqRFnyFbNwsqJdILX8J+vJpMht?=
 =?us-ascii?Q?mEo4su6Z30JscNbcKX00l68XNOnER0QXujEBB+fSvAakReCHcc1TwRQgp+H3?=
 =?us-ascii?Q?Uh8McpXH+jjAUBnRHhw13EvO2S8gffZB/1vCy6saUdYDKTii4eCGWfCwfFDw?=
 =?us-ascii?Q?qmLqSQEFrUCsI4Dxv6vtSUGWfuT2GNLgumAtNSHvp/1yHq7gFPiWJPJpeHiu?=
 =?us-ascii?Q?7QrJ2iGCgEpzrryGlh2ycYm7409206MVFcDg4LdfAZEFrQBE1/MvS9JAn7bC?=
 =?us-ascii?Q?4cSIC31B7CJLe2FFfUN82EYc9YK1WmH3sweB/rAMqUE7/YEJOAe+V5eJJEJ5?=
 =?us-ascii?Q?kZZuzNFZkAkcNaqNUt9nbjyEr7LLdcoK7+g1VZO7HM0xZkKwCfEx/7aV0zNK?=
 =?us-ascii?Q?BPvLRcJQZMkRqLGy4r3NRWcX0hjcS0Lp4KRFL5huu3YjSkMQFeMpr6ooFKd6?=
 =?us-ascii?Q?CM65yquUq26KowT6/RT86R3zr0M4wdiw/OFSAJkM/ZAxKlRg/I1GOY4TQcuI?=
 =?us-ascii?Q?YLqwcDIjFUe+in5F38G/UgDVGy3LF7uQfi7FH4p3OhUMbEN6H7FoqD2vaDUo?=
 =?us-ascii?Q?EixaRjhSTqgs1uj/cOmauqZ2hsUGMrpz5AXPP6MaltKgpf3NqyQOuU1xYAmo?=
 =?us-ascii?Q?D5+mDdJ1D+HDA6KYnIse035j/yhb+j+sxeUQpsQD39FjJCPcEA4POWu0MCaL?=
 =?us-ascii?Q?+NR5ORVCcwC7ToSjOqRKi9emkaKikYI17K1Axueq85bFPpAUNTtxaKRxivyV?=
 =?us-ascii?Q?mogG//y1jw+HbjAvLcRHY+Z05uGYkEV7IPuHu0CGRdeyDPQF2mOHPPsTC5Mk?=
 =?us-ascii?Q?PMjb/McYfPCrP90NFYjZb2CBsX/CDyNpAoxAbZjBs1vndRoqBG/fzstVEiXt?=
 =?us-ascii?Q?Mxm754v2N6LTHX2o5hK0a+dVlLWAmKO6qVNdpItVEkYa79CqVtOFDq9ozOOC?=
 =?us-ascii?Q?hpFvbasPCEan7DoVZR4IAb6UkjaR89+KyN/qXnF8iVyreszXUfGMh2HeHDG0?=
 =?us-ascii?Q?4zNaKqFrZyb5jvWI2+Q3tr0I1DDHUx111cECItgmBfC/oyHxTXL97eyw1XIq?=
 =?us-ascii?Q?lOgyC4SNrpEubBUM7nyBn3UFtptXr+vsPAbL3xT3JbY7OelPVfgin5Uy5eNX?=
 =?us-ascii?Q?etYWLppsu1ljEbK5akNvQ8W3/A9xaEkwM/ZVZtUth4kH9SanF6eRTnYVF7rB?=
 =?us-ascii?Q?SS/CADNzKNkrcBP2FdE5SskQ3ECragWUDLta3JmglQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SdCHKtAFJCH6KCeJEHVaR+zGQ6lCXbFZoc5RBla1MwcphbgZlScZ7JAWJUE9?=
 =?us-ascii?Q?bxmPkT+G1+NQPhPshHf9Ab5Q58NVBr1t1Pp+78FSq2M3q9TYncHZB3bS53zf?=
 =?us-ascii?Q?72jO+KU835JGUweZbTzGSwfuGeBiv8CcdEtgaQN085xpGFAZPYxyy9p6OirQ?=
 =?us-ascii?Q?/W+balh8pUbuZiskcojbY9SLio6BWvSPGkUCGIFlp1yRexUDYH36qqKuQLrZ?=
 =?us-ascii?Q?cIPYwDFeqk3NLPjH40wXglBbH6Do0r/zVXBoxEdloESTrB/bfis78Knh5/ab?=
 =?us-ascii?Q?ts2y262ZCLV8R0k2fSWEklgojawiUBTGOUSxeDsnohj/SwntbOTG/KCFx/c2?=
 =?us-ascii?Q?dpJWRbZKjIHML+8z9xIjnr7Rf0E0Gb3Qrv2cwp6tBVvXpIgjdMD85SLhNpfu?=
 =?us-ascii?Q?ifnpabc4I6gxWQ51T0wq2R5PW/BDaJNB/QdIr3YuCD4X0xOdXJh5DZ398+04?=
 =?us-ascii?Q?jJ7wlkIRRwKoZWSbg33IWWTJVkLaFkSXxSGJsuVmp6G1rJF7th1DylUHxdS0?=
 =?us-ascii?Q?GkcR74P4+trgBYeEYN685vKYnYxcOJ3OGX6wtO4WxEzDi/aa2IahECw+bhi0?=
 =?us-ascii?Q?uNwB9fKhDsj4ZiuRXYmrn1ajfCQnWYRVF+Wdh8SLFlZhhqoY8+tr3eVd00Yx?=
 =?us-ascii?Q?JwWFEA/m6ajI6ob6+K6Gdbv2a3yAZsaRfQJA9UnSDKv9XPH+C0bICceUS26V?=
 =?us-ascii?Q?ZIPSmwNcSWx+vbgT8SyNPjk48Xr7m1q5R3YncwuZYHtBXIDT/1gdGa0gILNn?=
 =?us-ascii?Q?iJMhaudsLh7xeulwbkfE/1IF78hAwHkS73SgYRizxHgsGcYYKnSGIcBcLBaK?=
 =?us-ascii?Q?CZnxL6RzXZvXoevmBvEbjdi+h/6ushmV0R5DP3PHZTOOC8C9HEhlR+c2xMtC?=
 =?us-ascii?Q?W75z4Nz/uFHgGAAozfP/vZTERDkXqDTD25Fi3/FFhMoGMh01YSjDsFq6lSwm?=
 =?us-ascii?Q?q2j2rtFuB8yVCAVl3i7R5fMbc6wO82Gp75zLOCEL0P1hQDWXnSt4nwRgQyZD?=
 =?us-ascii?Q?VqUpcgpMq/A90VhU3DNHS01Vecob59uX9+7KYWoBriroFM00GVogP3YeOagV?=
 =?us-ascii?Q?xu7ZkROQIHQCDxW+rrlEBuk2O/kRn7yhJo+ABKv1rs7YglS7DK8t6XPkV7eX?=
 =?us-ascii?Q?tuLbNYITL6FqvgF7zslQ7hjPyXCht6WGZSyCaIdL8xv8MXI4TqtOaoSwuFz5?=
 =?us-ascii?Q?PsZ7g0ulyeB2E2kvYHmokqdKGgG8OUNs/Mk1IjQGehqdxVRSmgBlZCC1q7XB?=
 =?us-ascii?Q?Ryp2zeMmQm9rHcCoTKg2SLb8dt/MPi4QUul00eubMPzVfrKY5cD4K91ZJ7qT?=
 =?us-ascii?Q?hVrZnUghtrGX+48asJzbTcXMKW7yJVpODRr4vXIOT4tF7aM+P29+PfUWthcb?=
 =?us-ascii?Q?pT03nTnoUfk/8Dq4nOYLSg9yfQwkz1D/ax5J8CFhcqxwSzZdpBXoB2NfYWJi?=
 =?us-ascii?Q?WzAT6CoDb8FyTwogirATEV+AqQ7MVQwvTbpKv22y3kN+HImKOjj6c+/iLyui?=
 =?us-ascii?Q?fXCWJzHT53Jaq75t50iohfonhGTJTN3fccZ4?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=mpi/yhgg7+ETbkjVbtBPuum5L9Saxoq6EE5Jef9mVc19MJe3VuUA9MbY45+UV3mCCFr8oYjuW/GXwrNOTt2dziCEhzhPlyjMCMzL3QmTo44oxl7kQRxPrrkF4N5sa/1nNxqavH8Tq9c/8jVXmLA5mprVeSMgEhqRzhFeNjhrwdHd5W3t6r1oQx6/amdiEvQzT/cczCJdsgX6GCmIzL9CbIfepSFA6awGwi/J/P6fVOXAZY+50VTc+k7M0LQT5zNDhRRE9sXZZZlTa4oZgP8xMVQozsZKQDvDT/0rU9cBNHh3gFyBjp2t9PM0nxWQur8vsWIbs2n4vWI/FkCbqLq7iA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpNFNS6nyhBvX/SFuHWzbk+Wf80Jhexf8br4DBo8ZCY=;
 b=b/fKcqXennaITbgTwiQcqrqFF2/XPcZPQ1xez1gnIIw1AxzwEQ6l8RXntMr+yskerqKcRIupPzYvNCm1oca4qWElLKyM6MCzAIELYLF6wegFNRj8GO/59YGMAVObsUcAjJA5HkCHzAbPi2bCczhiSakwOp5VgiTMWGJeCzKUUMspKTamPahGcfMjWuNgs1jO3wYpTwRsejNSoakeEhrYcjufW9/gEDY+nwfmUeAGO5Qe1eFVvdPjTQo4VWrJgRiNPrtI89FSgyEB8jfJ5ElJHG21Pv4PbiLnUO/mNlr/jTOlEfGUvk4M14u/V2ZMbz/Z5bbFEteKWxDi/x+ngt5tew==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: N0/Q7O//enQAdZjp5vmlClm0RHzTis+G2CRQqr91nLInq9pgXN9PkhMPvoCPtTV/Cleff3eIVIoc9MCZTw4E/jgj+SY9GbiMp2Xl5api/SiHSSq8+eS2CbIEOCshmasxUKudcIEKE6InAkhn9bg1+vhpMOc2DbGToToZb57FfoGuFXIKe0pvyKqJ6+2qzkJi9+Mf6Gi5NW4jsDgDi5PRQoNgDtpKn2JJ87w0IB38p7wel1ewsrO1BYvFmeNp4/B9ngqu9OXFdTbKJ0/eGxQwj3TbnNt67fHNiu4IwSBh5is6PjpUXZGQ83qAu+pXeU9BrmjFbYmmsh9OAV3I7PRHAkvAj/QK7U/MPzeSMO5urQjyGBRXj7LU6ctr2rntPZ/l/qhRBsg2Oow6RQZwZzEm3OKE+alExHm0C1k/XxGd66AWStI98JTQZNc6qCjMFdbQIWSdpUg3yzi1WOn7wcDEC5Kb9JlQ94F4g1k9MhqUKJpfR/auJ6ULsPoTPAafsG7b0YXLe+xBX42XDlkUqaz04v0XlHpkc7nfIB6uZ7gu4WXVTKGj5nilxchfxP5IaBHb3v7/ENPN8XKwsXJodJkasCOp/dHhN0AJLX3wAED697g=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: 98f69aef-cf07-4c89-b5bb-08dc6df8922a
x-ms-exchange-crosstenant-originalarrivaltime: 06 May 2024 18:15:55.1167 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB1531
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_13,2024-05-06_02,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_13,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2405060130
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2405060129
X-Proofpoint-ORIG-GUID: ENa_2tauXG9EQQ5brt0X17Ta_89msVi1
X-Proofpoint-GUID: ENa_2tauXG9EQQ5brt0X17Ta_89msVi1
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1011 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2405060130
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=UiO8e1a1iwbgr8igFwnlGCblXGLqjAN6KzTFvWaUCmM=;
 b=bBTrAOVUOHJcCXWVf6BlOJRg9C8QN8pbpKolnreeNhHmq6nYFeQiG+9HFI5K9HriHPdu
 E4SEKIoPJW154xRjrreeVq0AvEvc7Ic56yqc8Gu4vS4y1igQKfcWy/g+GkNOX+4JljVM
 wiLh++OYyZkb5HHV9OqeAR15qQM4Zd4k5diRv1Uwf9Su0WV9+FVlvGChdjQ1DYwS0EQ2
 0QEWvwR6EPuAIvrjhe5BSiQPgI/Eimu9Dddkm8C1r+SbiR1KReaFzLiFJbnEKSQBZABT
 XauA5H3QznCYSkEYPdRYw5zdORe3/dh6roCqzjFSZuYah6Pf5adCeuXtd+022r9JoljX RA== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpNFNS6nyhBvX/SFuHWzbk+Wf80Jhexf8br4DBo8ZCY=;
 b=qY4Z4LNnxsw/bHpV2sB6nlram7BmplprYonqTReSR74nqelF1/bXQv12fBfMgtHa27U2DHE3/FkUZP8lanhkVYVywfY8EGk+MVe+48S2Mj1jFhjIm345fKaTDyioqi33rg6gs7IrbEsm4QFFP+PIAgkGTpdcv3EoB4PWeoVBYV4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=collins.com
 header.i=@collins.com header.a=rsa-sha256 header.s=POD051818
 header.b=bBTrAOVU; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=rtxusers.onmicrosoft.us
 header.i=@rtxusers.onmicrosoft.us header.a=rsa-sha256
 header.s=selector1-rtxusers-onmicrosoft-us header.b=qY4Z4LNn
Subject: Re: [Buildroot] [External] Re: [PATCH 1/1]
 boot/arm-trusted-firmware: enable verbose output
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: "Maier, Brandon L Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Maier, Brandon L Collins" <Brandon.Maier@collins.com>
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Sunday, May 5, 2024 8:40 AM
> To: Brandon Maier via buildroot <buildroot@buildroot.org>
> Cc: Maier, Brandon L Collins <Brandon.Maier@collins.com>; Sergey Matyukevich
> <geomatsi@gmail.com>
> Subject: [External] Re: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware:
> enable verbose output
>
> On Fri, 12 Apr 2024 21:12:22 +0000
> Brandon Maier via buildroot <buildroot@buildroot.org> wrote:
>
> > Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> > ---
> >  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 1 +
> >  1 file changed, 1 insertion(+)
>
> I am confused as to why this patch is needed: for both Linux and
> U-Boot, we don't need to do anything special, just doing "make V=1" at
> the top-level, the V=1 gets passed down to Linux/U-Boot, and they
> exhibit a verbose build. However, that doesn't work with
> arm-trusted-firmware indeed, so I have applied your patch which makes
> the build verbose also for arm-trusted-firmware. Still a bit unclear as
> to why it doesn't work "by default".

The Arm Trusted Firmware sets "V := 0". So, it only sees verbosity when passed as an argument.
https://github.com/ARM-software/arm-trusted-firmware/blob/master/make_helpers/defaults.mk#L291-L292

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://urldefense.com/v3/__https://bootlin.com__;!!MvWE!HlXPBqUpYdxO9EBr
> 6F_8rB0yD3ldsb16EmjTfAQs5jbjY99L7ck-
> fAeJmn2djFv43hmR8m6SR0VDEhCl9Sam9LQt0ZSPgxQ$
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
