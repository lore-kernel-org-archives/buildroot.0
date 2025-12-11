Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1DCD41C15
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 09:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6226760807;
	Thu, 11 Dec 2025 09:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nt9sReUum4dA; Thu, 11 Dec 2025 09:58:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 586206081E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765447120;
	bh=2S7h/w0l0kW2tTEBKzXW4H1ASl6Nq9IJCcu4hvs1AUA=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EzHtLjvgu3biXJQph+BHlAxv67AGMI5CvMhSZMUf8d3DDa+NMVRNigpUNinDmYOjk
	 3vqROS+diFRYZ9u4c28VUbmlZL3ynqLKCF1o7c8bwis85+6e/HsQKC4OMT9ge3pR/z
	 dVBFPFlt0rJqvBCzMDKZNT5YTCHOY+ux4vab+nTyVnVi5I11PAW8Oo1vcIQ/Aobp5i
	 U6ZLR6d65sTDGT8hjDYGpUGfxUIdBqJn3XYW8eoaOqt7JnnZX+nqpFBmB7lJtwQxFQ
	 v/vFkF0NIMsFwEjevUtOHG1Y2e3T5fFB+U0wcfWsDjYzUnyFzbxs3N+lUDx52ALxx8
	 dbibUtcbv7zsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 586206081E;
	Thu, 11 Dec 2025 09:58:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F272F2C6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 09:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3C6E84DFA
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 09:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6NnbnLSVDfL for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 09:58:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d205::;
 helo=ma2p292cu005.outbound.protection.outlook.com;
 envelope-from=brvs2022@outlook.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC9F484DE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC9F484DE4
Received: from MA2P292CU005.outbound.protection.outlook.com
 (mail-spaincentralazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d205::])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC9F484DE4
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 09:58:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLN2PWMLR5WNm3u/hqXdb2TGW9JwtHV6DwhO0nhKEW7H2NFm9+oQiQ40Tr2GSJfdwdQwj8PLkuyISzOocQRRnykhUVFWxmJZ+c5EQhCVcWr1/2XofGWYvwKt+WvtA6ebHmD80s0PGxC8oEFxjopHcyF3N5rUFJxLaXJXqUNFpDRQq3/MaIodseaepujNy+nlBRoaRqDVJJ7prKzVrBKTQ27dICjEylvbFjhUTd7CR/Op2QNlGwt1R/XTezNaCCJR4nBpqLTeKxsSAqNrTX8qc6vNz2npkcUWUkVxDvHVOToFhr+Rv131T7yTZaLEtJxXx386fOyIQkOPK3C9uQyZ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWd2Kb+DjpM2AInPyD7NUtC12ieJR/CQt8xgpYl0j70=;
 b=VkLX0NIH04VLzcK+svsMqLiyzrH+dJ4lPm2r1YHA2p0d3j+MVlSZvzlnpTJRAfO0i92ZhUeU/3Z9lmczAYKobsxDeZaOHW0SccI+qGW/fUF49/bOCBtWE3sh4WqHdz53+Ei6nK0bI3FEcfg8OXm9tbKaWtieFwQw8j/zqGOoBMnE3dEjlszbHziybHeNqIQU0J+Acd8IVedgc9ENi/62hQYNPY/nAiRnIFFB6JA5ADlIRMGZu3gBG7pwwhZ2HAGOpeUB/AlHWcaBIU0N5pznZt7R/i1Fv+2dA2Ju9VlqlYBnxcl8quujR9wrx9JpeGoaZWv2DxgtKDIGtzC/TabDzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MA4P292MB0067.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:3b::9) by
 MA3P292MB0110.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:1a::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.9; Thu, 11 Dec 2025 09:58:29 +0000
Received: from MA4P292MB0067.ESPP292.PROD.OUTLOOK.COM
 ([fe80::87ff:9fa1:eee8:c2f6]) by MA4P292MB0067.ESPP292.PROD.OUTLOOK.COM
 ([fe80::87ff:9fa1:eee8:c2f6%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 09:58:29 +0000
From: "brvs2022@outlook.com" <brvs2022@outlook.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Romain Naour <romain.naour@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH] arch/x86: add support for x86_64 x32 ABI
Thread-Index: AQHcaoRi2BoN+uvezkmAZT/pFGSCww==
Date: Thu, 11 Dec 2025 09:58:29 +0000
Message-ID: <MA4P292MB00676659A30D80724F77DB70CBA1A@MA4P292MB0067.ESPP292.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA4P292MB0067:EE_|MA3P292MB0110:EE_
x-ms-office365-filtering-correlation-id: f4ed57b2-eb8d-400a-b301-08de389bd60a
x-ms-exchange-slblob-mailprops: P1EfU6pZOd8VPwDsmXmpSwyPl9aRR8R+bwO049O3KqOmN+KpcIHZvADdaEkoe2MYwgln0TL+aIQpcZo7H9559yme6uZbd9Fy2mHfQVoZh1pl0s/nBnB5py6Vy4Iz++BdsRI5BTm3A2XR7/v4LJjI3Rgzrxvb2nIACA1BVrClfCQ7X0YEgHw749+V43kGL7Qo+M18lm71fx0gGTY9RhbrRrQYHtn/PDZs3DfyWZRGh7tMnos22wskLPSraHbysgDJuX8EMi5T/IPgx2609ftiGSsT9IUkYS67s1noXfKxircmWiX4tMr7sQpjb26PsB9Xu83jCOdpsjiDmjaLvTCp3ODKdFjNx18OqpT2JaKv6c+oWdn9yERdcrjoQ+xGbOd6QY3GUmxfvlHM4GaYiHTUlflFSciV1c9ms2GaE1bbTBTJY28mEP+J1EqeD9xp1Qi0WUMOaqMq5I44HufnPYBPB1bkqcCfH1QdiT/H29Ul1YHSuNAbjZgt3dNxSk/Qw/IL003aZVp+CGiC+Wnhi5IleIAiIYvY9x5Ghep2HEPEWcHlPd44QOWXZjMJwvTR8VgysIiSkOSxR8tbDVNBzRMIpmOcz0C//9B4e/IC2e8wuy069ibL5MUCzluubsVzvD3OQY0Bj3FRHIdoFSU0GT4YmRD7r8zemUFZOD+gM42WlJ2pIQZIxFY1hu5k5WoJRpRDHu2oaIHiVlp+4Lby4tq/dOf6kWfbb6y7fU2q8dO0siNqrZJ8FxsYfn5tQXHexRT9Nk6I7/fVn2X2h5ocNdgKypVshiK2Dn3ClpNrzjWk+aBlIgAJUbr4kg==
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599012|8060799015|19110799012|41001999006|31061999003|461199028|15080799012|15030799006|39105399006|7071999006|3430499032|1602099012|40105399003|440099028|4302099013|3412199025|10035399007|102099032|26104999006;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?x2O1XSFBkLOJJ/lFR7mwbH1JjaapZ+Yjc+Z6xEcM7SaAikfrWReVj7cB6z?=
 =?iso-8859-1?Q?1rS/VJYNpmPq4BrpA+T07omH2j+h+mjtA/p4viI6JuWS4ydG/cEHFJ3782?=
 =?iso-8859-1?Q?OwaaRmrCpafDr8B6N8vJ/OKVZoo+WSkdjK1Aj21fX0rcFUfGPDRVxVgu2A?=
 =?iso-8859-1?Q?WlaiHgYKhwHS2s/6p6KuxL/X2Bm6yAuCXPIy9hmgOphWMS5vNFlrxtlpBv?=
 =?iso-8859-1?Q?x26qnFzssoXIUljZja71X6w6TW82ogLJudPwgU5yLIaoIN9fJcYcO/JbhD?=
 =?iso-8859-1?Q?Z8Rq2jn69JuUKnK6Ha/U1owJETESo6bcJcvnmUj3ujBszq1hDdxt81VCNi?=
 =?iso-8859-1?Q?d3LtQxtvVMBAvFINY5wmL633Ll+c3TcBCzUhokG6JUwEqHC+w3bZP8qlke?=
 =?iso-8859-1?Q?XFHJEkaiJswwHR9PtZyiLgnyWLxOf+2Ihs/m4jMFvRDCmkcLq1qMDRx894?=
 =?iso-8859-1?Q?fb3Q2cqOmG9RrowtHNXS7LQ2BLfIOROo2Zcrq1eQGp54AP2J47rvKX4GQF?=
 =?iso-8859-1?Q?M9Haxm58D3yZGuKw/cXFg6Bog2oy6pvmwzJBZOPE8+iMVuBxBejIN695OP?=
 =?iso-8859-1?Q?m3rIo5PVe88qh7qpQ0YvAlW12m4w1gGbiC4iF8neZmjwignX7x+DG5pQCm?=
 =?iso-8859-1?Q?R/qju3SR/vhCUJFaqDfqPrtQxZMFr5TigHK033uHc9iwnbtsboOnH1iQGk?=
 =?iso-8859-1?Q?s0yWBvM3kPI/DUrYS8BvAjRWoRHRLDy8Sx6Pj/w7xPvbw/CmXPeSilx6d+?=
 =?iso-8859-1?Q?rp/XaYMlm9gn956gOTSX8fOWUOJ2egT7dauXuPi4IYZcmC6nKx7Y5LhL5X?=
 =?iso-8859-1?Q?OTdHCAamPviXRhsYSeiw+Zl+ycpCtIPPe56zE68djrmPOKEznztT4sGFV1?=
 =?iso-8859-1?Q?7sQewNNOAQ6Q8hgziPgEUoqa6/PyqAIhgIma5ZOQSDFYlg642bcNYrF19k?=
 =?iso-8859-1?Q?oj0UyRrfokJT8BlJWzoOJVCoWJa3oCckokO3bE3IWFIuqJBNv7uJNHS+gZ?=
 =?iso-8859-1?Q?5VKwtE2sE1XLoA/U2N27D2yeiF0K4y7OISQx8I9096iNpTpjYmUdiwr8Dt?=
 =?iso-8859-1?Q?HpVCi/g4j56wY9ez9enohXyPtaFq155+o98CDjAM55vepKsL2CJJFQhLpe?=
 =?iso-8859-1?Q?6GBKxudPyx803BdkyXzI2mZpuX68PW6FPPs+uj6rU7oujR3He0sWY8/z5n?=
 =?iso-8859-1?Q?cveYAglfIcjtOiL2ttK98TgLiM5erdvPN43aXTNuw0UBsKXeo17Ywp2UeI?=
 =?iso-8859-1?Q?MyBcdDRFNHrMCv26bmipfpsXXgt8qgg3ShDt5R8R9HOPZSol1CcEgOH1uH?=
 =?iso-8859-1?Q?nocDlWDT3pFExA+UO4g9PtUz3JSgL1ZdkmP+haBD2iSNsmvMZtQ7VYqIJT?=
 =?iso-8859-1?Q?PHhTveAfoeg5wwvWOuKOR6JGViMJYT8IGk/lBfzkOli5IhWcHbzA79s66w?=
 =?iso-8859-1?Q?MHuyIEhmfxYIVvqmLPXmir31F05gwdiVsbb8udQ9yo0JKCqimOnVtwPT0L?=
 =?iso-8859-1?Q?g=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?X0mLLI5AUZRtsOZcuWOx8VFYhXSxeZN/0laVX3wSHdESc781Y76lWnaHlx?=
 =?iso-8859-1?Q?NGUVtijsVfYO/6gouqt+m2bD3wrAZ0T6cETnaa1yTPkMS0PO9yvwJGPxSs?=
 =?iso-8859-1?Q?LNRFhHOGpAXB2v2RB1dSGIDdCe4TY7SKaNbAlXkORhARVRDs8eyjGx0yDp?=
 =?iso-8859-1?Q?gOx6tOBznq43WXnChKKmHR5/HWJ0KD2NdcA7zglQyI8kBghtvkO+u9Sj1x?=
 =?iso-8859-1?Q?/5BrdbMpo36WX8OR/uGTN/Nw+Hm4mC0Zqo6t7h2UB2r2t7FBGnv5Pthh+9?=
 =?iso-8859-1?Q?Eqpyl2pI+52BGUAka3HLPOzK77uKLLX2ud4VrIJSM+QdTWX/pRe2oFNppD?=
 =?iso-8859-1?Q?XABS4Tv64mH92LDtZtyNp6/MpubE0uizji294aC2ezQg428/uPBj2/d3BQ?=
 =?iso-8859-1?Q?Cm+OwK8+FrNGDYUsN89nEsdOHQxK4qWBXmfMrE6t9BBFiKyh1wobLCL9VE?=
 =?iso-8859-1?Q?NtXL+5LvfikwdwKcJfwBHo4OD5an01Rsq8MCnzJgUcgdPY4msam6KZF6Mq?=
 =?iso-8859-1?Q?TT0QN6nJW8Wztdll2kcaP2386JjctVc1cSkGZ5pmOXN5liE7ZsSEflkCds?=
 =?iso-8859-1?Q?u3AisS81iWm63qn6LtuC5g684Loi5+HVQuphf2ppB/VKzOgjgDO4aYY8qv?=
 =?iso-8859-1?Q?rjhJxssnXyvA57nGIiXXesKj0gQ+y33hPJY7BCRGEDI87q7ip4pD5Z02b3?=
 =?iso-8859-1?Q?WnKLdU83XqJofNkIe8B0uDs53PtnFk85DUlYyde0pXSlw9beVcQ8tYrTwK?=
 =?iso-8859-1?Q?jsUJOXazZtRrUesjVzTvz4i3bTgsTeYKI4/dNxrfphKL1jnrxWSstPgmTy?=
 =?iso-8859-1?Q?7u1mK3X2uBy+kIV/zwXV7rVeXkx/eX2AflIspp8mavmgU48LeUIpaKYA/m?=
 =?iso-8859-1?Q?zC/lgU5ClLOXUATfmtJvpg4TKa5MDwpzsF89qXYnR0ws6I9yfuBvC6D6NT?=
 =?iso-8859-1?Q?vN2fUvu6zF076YeIlpQH/5vnhnsf/+xqwjLKFvNW+47d2LWRmTErP7m45v?=
 =?iso-8859-1?Q?6ePENrdyyA4+naMQ/OvjR2dccr5X5LzoU6Cvhriv/Hc24wfRRTay1JlKBa?=
 =?iso-8859-1?Q?WyfKPTe6KiN6sncfR73IEHrxN1aQfzD8JsnoooOQiQFkx1z0CiJcWeuI5T?=
 =?iso-8859-1?Q?ANaTtziRl+eV3vxwMkX+gJ2/jLK/1HTCuQJK+Gb8eyFH3FDJ3Gyod0xAd2?=
 =?iso-8859-1?Q?O3hy0qsZMTBdNXTR7dIg2T/VXTFfiHE67bSe480tFeGkTru5d4MHFMTk5K?=
 =?iso-8859-1?Q?Maia64h/tMa1DhC/v4fw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA4P292MB0067.ESPP292.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ed57b2-eb8d-400a-b301-08de389bd60a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2025 09:58:29.5275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA3P292MB0110
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outlook.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWd2Kb+DjpM2AInPyD7NUtC12ieJR/CQt8xgpYl0j70=;
 b=qZr5fT44gzwGfhl3Rgz+Yb+/VyTNdtfrHG5VZuofjtzAVDLtOzZr+4AYRGBU3IMMCEpfDhZTs3MginBKzovG1vwjWACXRDsLVCVUoXGOkrfGqqukfWFNygD4o0W98p64GmJXGGdVuZyQfpn7DgaI+huMEGKN6heARBNG1hNX+E/8NMu3cvlxqTKyeo768p6FCZiUk+GNYkHaFh2u7lDMmRPZx/yTJGj9Of2Swgy98OVsSy9JvCFxuhNET11OQ4C3ZVHGcRxkwhLDkRj1xZ/IFO9BsvD3qEhKPsED2aOVjD8hXXpoV0FlfBUcLFozRM59TDLEFJQPCk0x29/I7i4JyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=outlook.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=qZr5fT44
Subject: [Buildroot] [PATCH] arch/x86: add support for x86_64 x32 ABI
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From d9e20f4b358b08de6c01fbb1e7b605e01332e2db Mon Sep 17 00:00:00 2001
From: Trevor Bastion <brvs2022@outlook.com>
Date: Thu, 11 Dec 2025 09:46:09 +0000
Subject: [PATCH] arch/x86: add support for x86_64 x32 ABI

Add support for the x86_64 x32 ABI, which uses the 64-bit x86
instruction set while keeping 32-bit pointers and size types.

Introduce a BR2_x86_64_x32 option, update the x86 toolchain and
architecture logic to recognize x32 as a valid ABI, and adjust
the READELF architecture name handling so x32 binaries are
reported consistently alongside i386 and pure x86_64.

Signed-off-by: Trevor Bastion <brvs2022@outlook.com>
Signed-off-by: Trevor Bastion <brvs2022@outlook.com>
---
 arch/Config.in             | 10 +++++++++-
 arch/Config.in.x86         | 13 +++++++++----
 linux/Config.in            |  2 +-
 package/Makefile.in        |  5 +++++
 package/glibc/Config.in    |  1 +
 package/glibc/glibc.mk     |  4 ++++
 package/iptables/Config.in |  2 ++
 package/musl/Config.in     |  1 +
 system/system.mk           |  5 +++++
 9 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 34422c0d50..cc37de87bb 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -248,6 +248,14 @@ config BR2_x86_64
 	  architecture compatible microprocessor).
 	  http://en.wikipedia.org/wiki/X86_64
 
+config BR2_x86_x32_ABI
+	bool "x86_x32_ABI"
+	select BR2_USE_MMU
+	help
+	  The x32 ABI provides 32-bit integers, long and pointers (ILP32) on Intel
+	  and AMD 64-bit hardware. 
+	  https://en.wikipedia.org/wiki/X32_ABI
+
 config BR2_xtensa
 	bool "Xtensa"
 	# MMU support is set by the subarchitecture file, arch/Config.in.xtensa
@@ -433,7 +441,7 @@ if BR2_sparc || BR2_sparc64
 source "arch/Config.in.sparc"
 endif
 
-if BR2_i386 || BR2_x86_64
+if BR2_i386 || BR2_x86_64 || BR2_x86_x32_ABI
 source "arch/Config.in.x86"
 endif
 
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index f9b32130b2..bd7aeddc6a 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -36,7 +36,7 @@ config BR2_X86_CPU_HAS_AVX512
 choice
 	prompt "Target Architecture Variant"
 	default BR2_x86_i586 if BR2_i386
-	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_i386 || BR2_x86_64 || BR2_x86_x32_ABI
 	help
 	  Specific CPU variant to use
 
@@ -723,10 +723,15 @@ config BR2_ARCH
 	# i586).
 	default "i686"		if BR2_i386
 	default "x86_64"	if BR2_x86_64
+	default "x86_64"	if BR2_x86_x32_ABI
 
 config BR2_NORMALIZED_ARCH
-	default "i386"		if !BR2_x86_64
-	default "x86_64"	if BR2_x86_64
+	default "i386"		if !BR2_x86_64 && !BR2_x86_x32_ABI
+	default "x86_64"	if !BR2_i386 && !BR2_x86_x32_ABI
+	default "x86_64"	if !BR2_i386 && !BR2_x86_64
+
+config BR2_GCC_TARGET_ABI
+	default "mx32"		if BR2_x86_x32_ABI
 
 config BR2_ENDIAN
 	default "LITTLE"
@@ -804,7 +809,7 @@ config BR2_GCC_TARGET_ARCH
 
 config BR2_READELF_ARCH_NAME
 	default "Intel 80386"			if BR2_i386
-	default "Advanced Micro Devices X86-64" if BR2_x86_64
+	default "Advanced Micro Devices X86-64" if BR2_x86_64 || BR2_x86_x32_ABI
 
 # vim: ft=kconfig
 # -*- mode:kconfig; -*-
diff --git a/linux/Config.in b/linux/Config.in
index 10024bef38..569315a5d1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -250,7 +250,7 @@ config BR2_LINUX_KERNEL_APPENDED_UIMAGE
 
 config BR2_LINUX_KERNEL_BZIMAGE
 	bool "bzImage"
-	depends on BR2_i386 || BR2_x86_64 || BR2_s390x
+	depends on BR2_i386 || BR2_x86_64 || BR2_x86_x32_ABI || BR2_s390x
 
 config BR2_LINUX_KERNEL_ZIMAGE
 	bool "zImage"
diff --git a/package/Makefile.in b/package/Makefile.in
index 5ebb5f9ba8..b9d991270e 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -67,6 +67,11 @@ else ifeq ($(BR_BUILDING),y)
 $(error No C library enabled, this is not possible.)
 endif
 
+ifeq ($(BR2_x86_x32_ABI),y)
+ABI = x32
+TARGET_ABI += -mx32
+endif
+
 # The ABI suffix is a bit special on ARM, as it needs to be
 # -uclibcgnueabi for uClibc EABI, and -gnueabi for glibc EABI.
 # This means that the LIBC and ABI aren't strictly orthogonal,
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index b066616a01..6642304644 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_sh
 	default y if BR2_sparc64
 	default y if BR2_x86_64
+	default y if BR2_x86_x32_ABI
 	default y if BR2_microblaze
 	default y if BR2_arcle && BR2_ARC_ATOMIC_EXT && !BR2_arc750d && !BR2_arc770d
 	depends on !BR2_POWERPC_CPU_HAS_SPE
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index a7727cbad8..a3fec13605 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -75,6 +75,10 @@ else ifeq ($(BR2_MIPS_OABI32),y)
 GLIBC_EXTRA_CFLAGS += -mabi=32
 endif
 
+ifeq ($(BR2_x86_x32_ABI),y)
+GLIBC_EXTRA_CFLAGS += -mx32
+endif
+
 ifeq ($(BR2_ENABLE_DEBUG),y)
 GLIBC_EXTRA_CFLAGS += -g
 endif
diff --git a/package/iptables/Config.in b/package/iptables/Config.in
index ef02c26242..e5a9b06152 100644
--- a/package/iptables/Config.in
+++ b/package/iptables/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_IPTABLES
 	bool "iptables"
+	depends on !BR2_x86_x32_ABI
 	help
 	  Linux kernel firewall, NAT, and packet mangling tools.
 
@@ -17,6 +18,7 @@ config BR2_PACKAGE_IPTABLES_NFTABLES
 	bool "nftables compat"
 	# uses dlfcn
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_x86_x32_ABI
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 	select BR2_PACKAGE_LIBMNL
diff --git a/package/musl/Config.in b/package/musl/Config.in
index 70475326f5..a35af97e15 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_MUSL_ARCH_SUPPORTS
 	default y if BR2_s390x
 	default y if BR2_sh
 	default y if BR2_x86_64
+	default y if BR2_x86_x32_ABI
 	depends on !BR2_POWERPC_CPU_HAS_SPE # not supported, build breaks
 	depends on !(BR2_powerpc64 || BR2_powerpc64le) || BR2_POWERPC_CPU_HAS_ALTIVEC
 	# sh2 nommu is supported by musl, but we don't have support
diff --git a/system/system.mk b/system/system.mk
index 52e810868a..465d8c62db 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -84,6 +84,11 @@ define SYSTEM_LIB_SYMLINK
 	ln -snf lib $(1)/lib64
 	ln -snf lib $(1)/usr/lib64
 endef
+else ifeq ($(BR2_x86_x32_ABI),y) 
+define SYSTEM_LIB_SYMLINK
+	ln -snf lib $(1)/libx32
+	ln -snf lib $(1)/usr/libx32
+endef
 else
 define SYSTEM_LIB_SYMLINK
 	ln -snf lib $(1)/lib32
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
