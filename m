Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C60D1CDC6
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 14:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9431183279;
	Tue,  9 Dec 2025 14:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rm4bkZRTPy9V; Tue,  9 Dec 2025 14:50:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8914E82F49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765291815;
	bh=x+D1zgGou6A269BxNQRQqaz+Tdf66gxzVUxQ9QaVqDI=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ITuCOx3v7oAbfZToetQEzamb15vJqk2eb1hFv01EiJIiAbjkTmWwLQFnsuZ4/0ueg
	 5dac8l3Uh98+mbqxVDyzlCUPaa0hA99ZvKrUaCGk0ge7EmhGA7aK/eey5TiWEKz7p9
	 bZTdQcC5Z0V6mSdvCnmzdVCDysrSf30ZMGa+oCAHbLuFhPDcYhxAYExRuoQeX4tRHQ
	 1cq4kbYENKFyrtErVck78rRDfAXWJ8ot3iyJ14iKqNd8xWT8o1HkpjwyhQAaa+1ykZ
	 +JkAaQtP0D30fT07j9Si6N7iMElzeSu2QSBGkvmGdE+E1R79BmAvK0NpriY4gNzj9p
	 QKaPf0GopgyWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8914E82F49;
	Tue,  9 Dec 2025 14:50:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67592E7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 14:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E0CE4010A
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 14:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zqY3mXDISNRY for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 14:50:13 +0000 (UTC)
X-Greylist: delayed 2616 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 09 Dec 2025 14:50:12 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AC44940366
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC44940366
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.158.9;
 helo=mx0b-00230701.pphosted.com; envelope-from=alexey.brodkin@synopsys.com;
 receiver=<UNKNOWN> 
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC44940366
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 14:50:12 +0000 (UTC)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B9E0YlA2023411; Tue, 9 Dec 2025 06:06:27 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4axb6fnwvx-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 09 Dec 2025 06:06:26 -0800 (PST)
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 586D840352;
 Tue,  9 Dec 2025 14:06:25 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 9BD60A005D;
 Tue,  9 Dec 2025 14:06:24 +0000 (UTC)
Received: from SN1PR07CU001.outbound.protection.outlook.com
 (mail-sn1pr07cu00106.outbound.protection.outlook.com [40.93.14.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id EF2E640352;
 Tue,  9 Dec 2025 14:06:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xro9m/wNfHhmf4CujshFC/6JfPF+e+pAZ3KrluG4Zzly17x1YWQ8SeIpjTOJTMf+sLv6/e4A4shom8zfgWzROPce4oZ+zdUdpFK08pIP4zjOCBZN2Xlz7KuSips3xFqK351mOYIMPujBLScSrIaHv52nqn2v8KDMsNB736rWxIIaRpNr/HGi7e0XT5aJgehYkeWDyaybQD2inq1P72I4cUBzBsBpJ8KYnPeu0NOpY6dHgoAIgQ5RehKg/hSvHQbP3C1Tb/Plv94NpXF/YMqyNVWF1N7Bl2tTf8mPIqFPYdI+PcTPMWc+X4NbZLENu9Jgv2sxtAKJ2lj8YQjc7wJdGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuwxT0m41Dpz5pyvmh9DtIVHpi5tzD1yqwvTFWimv9Y=;
 b=CrO+SxkpUgUJ9ikzU0NcSCgK0aAPNLOhxrjBQ5XVT9sup17SZK25zVcSLbZRC2UIn1+gr31J7rIt4ome4klmytS5AWUVa2JCQnKIkyDxQZ6I7WtimytLVdErciCuxWQz5d+q4vuUL65J4CKixD6FjxsOF2ZiH/jp1bEzqxYsQKRoLgVWXIMvreqRi8t95pcS1+10/nsBLycYohHVJNsdE1Uq0I5kJzhNEldv3tR0ZO38f7iyX932nmr4Z5VJf/c0bMmY/7xDR+76GEi8LE+Lc0EWBcUddTOcu6vaPU9+WHBLN7A6DGBVe9OOD276aP3d3l+pCxQ4ZKdoe6SEI+3aNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from SJ2PR12MB8184.namprd12.prod.outlook.com (2603:10b6:a03:4f2::22)
 by SA1PR12MB6679.namprd12.prod.outlook.com (2603:10b6:806:252::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 14:06:16 +0000
Received: from SJ2PR12MB8184.namprd12.prod.outlook.com
 ([fe80::f941:58e6:2825:d01c]) by SJ2PR12MB8184.namprd12.prod.outlook.com
 ([fe80::f941:58e6:2825:d01c%7]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 14:06:16 +0000
X-SNPS-Relay: synopsys.com
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Peter Korsgaard
 <peter@korsgaard.com>
CC: Thomas Petazzoni via buildroot <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>
Thread-Topic: [PATCH] package/glibc: only supports ARC little-endian since
 glibc 2.41
Thread-Index: AQHcaF8NlfbhDWIKhUOikgVjHU24sLUZSIDI
Date: Tue, 9 Dec 2025 14:06:16 +0000
Message-ID: <SJ2PR12MB818487232470DA4456967C73A1A3A@SJ2PR12MB8184.namprd12.prod.outlook.com>
References: <20251205212959.2082018-1-thomas.petazzoni@bootlin.com>
 <87sedoazgb.fsf@dell.be.48ers.dk> <20251208172339.4a6d24a3@windsurf>
In-Reply-To: <20251208172339.4a6d24a3@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB8184:EE_|SA1PR12MB6679:EE_
x-ms-office365-filtering-correlation-id: 646e280b-1cdb-4262-880d-08de372c1e8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?youJhsVd8sSf38SX1TX0d0IprmKOGKVdJ1keeMsVHrtdCSaKTWkbcSva8x?=
 =?iso-8859-1?Q?hPzMbUib0LYBOT8kqaEf44bkMYVsET/wZXC5ppTy2MU8wfUh0QMpf/7WxJ?=
 =?iso-8859-1?Q?rCXlDT/6zXmcsBxjhGcHx2tFRn4sL7Vuu7t1L6hLNS6Kk8tHKy7bh2nJOr?=
 =?iso-8859-1?Q?1tKkFcohjBbELs8xjUwlh+NL+KThyNcU6smiykX/7IAPZ8JNvYPwgc0QRm?=
 =?iso-8859-1?Q?lQczWjWgltbBRbx7YYs/1S6qazARog7dJcit2weDW96RL0jS8sXgmvWGTd?=
 =?iso-8859-1?Q?xQUaet8nVCbt1K37zyW/lGBU4nICiqFL4JKHaqYiK0ZBc0AJjYjITQ6pqY?=
 =?iso-8859-1?Q?+lApBoxobHuNDvpTzFUwqhj3vrgGDegS4yLlKK5Zfa6RksM//ReQW0ZjSF?=
 =?iso-8859-1?Q?3Lo4G5IAvH65mfzwbwP+lwrnxY3jxb6JwSqZghr3viznZJYc2CSJCJPYeZ?=
 =?iso-8859-1?Q?LdhI8uQkyqnCdjEQagmQebTzbto5OprBVt0CWmaIJVf170seALPBuKGHKK?=
 =?iso-8859-1?Q?pJSDR/rvj60qSPQdZn0y2U4bSmGQaRAucAeX1QZWDDJt994oPYnWA2xuwh?=
 =?iso-8859-1?Q?SSCvPMFKvRf45FIG/y23z2wysxD0Mz1ny632R3MsHBh2RzTWjLpi/Arln9?=
 =?iso-8859-1?Q?1pZbYfc0xOhUwZOEagX5zLq/5BodFT3rMGrLyFwKRJZt+ZHcFt0bEpiJhF?=
 =?iso-8859-1?Q?0xJ+r5i3AlJwpM5JfbANrlnuAIzICmK8yjxGW/PzjJXmmlWs590sxZSSjz?=
 =?iso-8859-1?Q?wv+XJYt9Sp08OX2T9gu69JKsXThxn7XiQqiMEfsWKeLBg5orFIvRpopHxa?=
 =?iso-8859-1?Q?D9Kb+p59bMzVimuVeWAOPL3mUQxEMhzYIulwiNtyFByooV16Kwkbefh0Ig?=
 =?iso-8859-1?Q?S6B3u11CeAs2BVCN9eyb6KVPibzRz+x0ykJTFp1Z4adOG4/iZ7E8D84WMq?=
 =?iso-8859-1?Q?HwytefCOSz1YG47VolG+UlYWhr3nT/jsfK6jYEzPUSTatYWX49aP/Xop3X?=
 =?iso-8859-1?Q?spyOVvEfJWKeU0o3EktP0mUQvOKFmQs4ncFfFk1qPpzUp21LmT4h5CM9uj?=
 =?iso-8859-1?Q?Bd5RyjRZ6fKXJsKbm+2i7bZKPutkKOoFMyShLvFxsJHUCdeIbHeTOftQnl?=
 =?iso-8859-1?Q?YqWhXhzi7yWQLScbthYKaLeXg0jsO4mH+1SH8DVY1HK3JHcquJ447uJoaU?=
 =?iso-8859-1?Q?m9LFuPxVT7Eh0+tZcMAiof8l+VEiNcj43+VRZGZqfm3AjCFA49OFsTCLYb?=
 =?iso-8859-1?Q?eyyew+gm2NLIvnt7hPV2l/7vgVufEtFx7BCYkYLTOSaL7lVtBNNsBC0Yce?=
 =?iso-8859-1?Q?WlGrb/KTUt1w2NP4TBknbeEJxxQtlJsBbb9t9SBWUHdF0u4MygvGoJmDM3?=
 =?iso-8859-1?Q?hIPMWQE0poFRGBIpduCxJ8OxgjShGxRoYXT63piOOTZn+uROizADAXGagm?=
 =?iso-8859-1?Q?PqN5NeXwNPfF8GdSehwOBnNYIzCGH7bA8mh8nFXkNc7nVRL3InQd06Tvy2?=
 =?iso-8859-1?Q?d/CkJrf1FElM102Lc1f++v++rfMyxGvHtyD4bxHahztK+yOfYXaGlrq79o?=
 =?iso-8859-1?Q?TdiX4p2K9fdT2FeBIAL3C6nfFana?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8184.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?24Jd5hfPTmcmrKzTG0xOCRYTRYXNrSo6QJlDkyz2p8x3hNnsKNBSvn4meo?=
 =?iso-8859-1?Q?cWpqV3dtzf536ZwUPSAxXAb0qu0AWrgQrb2wXAQx5yCSVgg9xwUTS39eiR?=
 =?iso-8859-1?Q?pHckxi211cDbUVSm7bG55yhEKUwm/P6BoyKipvvroSOSnTenqYvTqbYYd8?=
 =?iso-8859-1?Q?sFWEsb5o4bXVvNnGegiVx+DI2WUC89LAEv26Tbq2XgYcoDjGWZmXU90BdG?=
 =?iso-8859-1?Q?48T5VU1P2Khd/Rse0hQhZUQLO7K9lVPySMR8RztHI+kt6fiBL5VPDCWmE3?=
 =?iso-8859-1?Q?EvRWPupbtohUAEp3QrOPXr5H1IMes1j8m9Mx4S+EAWKKwGL1rxcjWl70UV?=
 =?iso-8859-1?Q?V/7Juot616Yy/EUqBylqSxPxhuyLcBailMyHlZ3mRY4GQ5FhhzcHcCaoQT?=
 =?iso-8859-1?Q?f0rZEOnaXAEJHazcOfyXhHHmF0OSGGMEIK1tu0d0dazL0GtKVNt21c3ZCw?=
 =?iso-8859-1?Q?NxW0/NyaAVaD1Oh6hfochEenzfneBl85WbRgxsJBGolwsf64aN/pWCiLdO?=
 =?iso-8859-1?Q?/fSFpxlpSxEI7rMsnTnV1WYMO+w36OjFIDrb9W/Bqr8uXqRsethhz+dTUe?=
 =?iso-8859-1?Q?dlgzy2RKbVm836QJnP3wipQRVSTssH8qeEhl6+2xQk1xU1VzzhiivfnZQ9?=
 =?iso-8859-1?Q?HwmNNz8lQqQ0R+4GbXiu1+mMRBvpAORnuhV63MdCPwUBY4YTs+XGpgCe5I?=
 =?iso-8859-1?Q?+mGhZpcC3eNdNZwPdtxzqfAj5QFTSj5L3iQgeGwGEuPhVh/v7rwrzk/+Xl?=
 =?iso-8859-1?Q?0F3F/h9SydyIwV+rTfR1AdP6K6JIE1FIk53f1E3LRJcYFEqfNwRAkr9b+B?=
 =?iso-8859-1?Q?z50lRG775YkkMxPSOYSNLzIoswyXbn7SN14Lr3GeGmsTMXISHiQIrU6NbH?=
 =?iso-8859-1?Q?CTljO1awPbhRBetd2KgzphN2pG9qZG4ASsIsLSrQn9YrJeQOFbGFxDL+fw?=
 =?iso-8859-1?Q?wUepzlcb07PogFmIJwooElTAar1gdPsLVNJVs+yCz8dgI03CzmClkNUNlc?=
 =?iso-8859-1?Q?SSNqb1bMCOa6zmaMr1ME/E1bOLpE3Ix78TPwyUsLQpEQrTfnFtzbNaGQkE?=
 =?iso-8859-1?Q?r561WtnID/9o2um0cuhLcoQWNtAGutfG2pBJeUV6h6QTMB67EuLM1bsHly?=
 =?iso-8859-1?Q?yOt0m6uFp5psRcO/Xn7GLsCW/Ir4bqerNS+3Y021a8arrF2w92XGMO5X1A?=
 =?iso-8859-1?Q?8in6enzxZU+cUsHNQJU9XLANINK2rtXIzC9738rxsr3ZyaVTF6MCPMC2Lv?=
 =?iso-8859-1?Q?Ufqz6sGKb2qan+jl59uC1i6dyKLF/s45U7XqYhy56quP2jCxzyrgLMNCe2?=
 =?iso-8859-1?Q?UTZAsJxABF1L8iO+TFSTrzZxkO3yQa2V99xsHkttjYGR+q5b56xZvgAB2j?=
 =?iso-8859-1?Q?pxHGwyzQM6oMYIvIZofyPCPY4ZqbDAqnClNqd+7lR/oHG3f05Og/2wtmjs?=
 =?iso-8859-1?Q?I8tDrezeUFdRHRJohbPSzP63SlJB4TjdYfleANKfoPCCi77dRICiokxf+K?=
 =?iso-8859-1?Q?Uw13VuP0h6Esqmih3IEB6POiVgOUm5Bpm6mAWngS1/TMrK5MjakLkb4SE0?=
 =?iso-8859-1?Q?edXLIQ+0ipN43tBdV5zGF7NiF9huWd6UHFrZEb+vnPtJzlyPbZaTJW/TJK?=
 =?iso-8859-1?Q?Mt25Jr76pKjDSikiPbnk53D0Vp7zgvGLbx?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: oqYQo7vNgNAQKXFRoZjqABeW/64cHpuugqXGa3NSDmJTTgauC6vVlrMqmTPNHBYVmx74mZ3c8oPP0ewEhdAyNfAkne3IwBiZ0h4gz0hn3NStxemqjmCFPN/zVJ7jvKqm2Xxtcnr+wyxcE6+vLkZB+7+JLnCd2dgj7gN4wbRIfPgJJ4Qf2F0ZOxrwe3AHD+MP/8wNJTRmOrA4V3uPciJXHngWtxj5Xuh3UxSbrLTpnPdv7lmHOCuUvWlj0toyGHsU2/YaBe0vO6KP6QiY/Ftspf6y5vnItpvN9h9wSD9SgLTdXHcxMgKvhv3KxGiBYypuK/E+T7g5S2wAemqbfb4A1JSB5KLiXNIouGFUS4YJe4AFB+gpP3risttYx47h+D6IvfQ6tR5Vy6pFsOrnjksGap7ji7ekZrOMtgoUanY44or45Q42ulNwPxGlJ7TQGUuDtZ5+z1cndFr3rJ/Ez37XrXO4rY07qLJLjG9IVlZfYpqwVCAwIFh0hE60R/UfYQJLLvJj+WISaUmUBMyBvJoqXFsVdWvogbhxcCShETVLE4JzvNDTe7cIZt0L1pAU9rf5S+G4NBxkomS32ctlLl+N5Vb5p+Dtuost74oDSfa7XlkAabwGy0LrXzrop5XY4gEOW79Q8YednHSRjx1DSPxm7A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8184.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 646e280b-1cdb-4262-880d-08de372c1e8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2025 14:06:16.3428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BGuXgPRwvPjD5ylYhSTs922o7jMf/SPoBYwfTXNtNlB6VFndC+We3B+kZnQ+cucLYHP1OEcBSj/xv6+zXWo7uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6679
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDEwMyBTYWx0ZWRfX2+OnSGM0TfYk
 MbZvViDKEQ4THWDzZhytLyv79qrUxoU4azUEELReiK9g8yYSf61ZOfMmWozX9EPmBSWLBa+ynKh
 ZadXzsjBH8f4jSsyZG9UpudlC98lchmR5my60ocWG301qV1L40ZUISqSo8qc/0Jbh6SQF/gLi7t
 EPkeuptCe4NofAiGLmwXP3XdMuveWD9Y+/5dGzesTLM79I+QbzFIOlzvKhjH1FcEWcZAzrso2qs
 5zX+TOTrPzcFTKsNwLW5ICjqwRZIrwiUloXOAfHqXIBvYNTNxu0Jqupciu3Whhu47w5LWDwFAZd
 fofnMGSmOdxY7icoD0gppRz6kBv2BE4K6Pkw+oie/kGTg4Rup3TZYtgt1kcamYF96Sol6iWCyN6
 RAAr15/kF9Qpr81se7VDEvBrAGTuPg==
X-Authority-Analysis: v=2.4 cv=G6ER0tk5 c=1 sm=1 tr=0 ts=69382ce2 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=wP3pNCr1ah4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=eddG-Y-mBUri54Zxoe8A:9 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: mN_6en1hac6Gu_B7VhSncjzfnnR9WWNV
X-Proofpoint-ORIG-GUID: mN_6en1hac6Gu_B7VhSncjzfnnR9WWNV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2512090103
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pfptdkimsnps;
 bh=UuwxT0m41Dpz5pyvmh9DtIVHpi5tzD1yqwvTFWimv9Y=; b=jcjYq3hVEu/h
 1FBnv80nMKAs7aOsMu7T5fIZQLA16Bak5NF3G0G4ujZB5wjs/qkDl1fPkQ+1BJjM
 zLTdeD1NjcVNlnt0ILbXHyQHlmFR2hnWYX/6T3AfBHbOjGDoINLsP8w+v3IcTDmW
 d2dkhqgp6sKK7UWZkPqziELIN027Z2j4pcRs/BF0YWawfFbGCCu8XZtpXV9Wppua
 8odTPzeg1dmT1GSDWjQtXHtdyKPTDmD0f3t2BYa8DxsHgklVRzgSIRJXdJjhH025
 uwBUVIy6jp03gruTO/1ilLOopyCzCbZjDTqlPE3E6OTSz/Givoz/49pbETnxvKHt
 qzc8YhszlQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1765289186; bh=UuwxT0m41Dpz5pyvmh9DtIVHpi5tzD1yqwvTFWimv9Y=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=bLGEfwFgOA5xLtIUPCTeK7NO5OK5mv6F/0rCjTsjKmdrqBHL1teU2G0rdas25kufz
 iUK1r8WbaDpsyerlnPiUwMBlgF1aR+Sn+Lg6cTzNJwHjE9zp77Ws+f7vteE5yCl0kp
 dxxCx6/y+2eOW9qRU5lOQkKjF6cWpm/RHUDVulkoYkuP8Zlos5lWrrCTE0HiU0pOWz
 5zSlby2uPwcJCFaFtQNc6KBwT4Aw5vrFjwY3/maiZcxulMQ3mYYLtlCaFEpB4pMfcE
 yBjiNSityNfVBJXC8PajDW72NnVpcYuPJ0b0WRbXHQxmeJ+bN64Erzr8CKnlSVWW3l
 7h2AlBwhSnkTw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuwxT0m41Dpz5pyvmh9DtIVHpi5tzD1yqwvTFWimv9Y=;
 b=asdUqLOJ1gFjtxqvjN2lI38ZSeWNeKB3eOkoIMQZk2Qly/nQHAB8+u6p+f19/eRsSlvxbbu8IEGxmikn7PSrxSr0ZGqeM8XE7hSWrCVBQo4eps+Im+Mr/5kMfYGttdu0CxIZalP1/fpahG+n88X7056h096xr6xvLxrL7PPdeLQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=synopsys.com
 header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps
 header.b=jcjYq3hV; 
 dkim=pass (2048-bit key, unprotected) header.d=synopsys.com
 header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=bLGEfwFg; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=asdUqLOJ
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=asdUqLOJ; 
 dkim-atps=neutral
Subject: Re: [Buildroot] [PATCH] package/glibc: only supports ARC
 little-endian since glibc 2.41
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Peter, all,

Synopsys ARC person here ;)

> > Does this mean we should completely drop support for big engian ARC?
> =

> config BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS
> =A0=A0=A0=A0=A0=A0=A0 bool
> =A0=A0=A0=A0=A0=A0=A0 default y if BR2_aarch64
> =A0=A0=A0=A0=A0=A0=A0 default y if BR2_aarch64_be
> =A0=A0=A0=A0=A0=A0=A0 default y if BR2_arcle
> =A0=A0=A0=A0=A0=A0=A0 default y if BR2_arceb
> =

> so I'd say no we don't need to drop support for big endian ARC as
> uClibc still supports it.

I think indeed, we may remove all the big-endian support for ARC.
Reasons are since introduction of ARC HS4x processors we no longer support
big-endian in any new processor IP, and even for older IP which used to
support big-endian it was rarely used... so basically there's no good justi=
fication
to spend any cycles on big-endian support looking forward in this project.
I.e. BE support in uClibc could also be removed if it makes any difference.
 =

> However, I must say we have quite a few ARC-specific issues, which I
> have reported a while ago to the Synopsys people, and there's no longer
> any Synopsys participation to Buildroot. So I'm thinking we should
> probably take this as a "Synopsys no longer cares" and therefore we
> should drop support for ARC.

> Let's see if they react to this e-mail. If they don't, it will be a
> clear signal that they don't care anymore, and we should drop ARC.

Well, I must confess that indeed quite some activities (including Buildroot
support for ARC) were deprioritized some time ago due to resource
reallocation to other areas which were not that polished as our open-source
components. But even though I don't think that situation will change in
comings weeks, support of ARC HS (both v2 & v3, AKA HS3x, 4x, 5x and 6x)
in Buildroot and other open source projects is very important for us as one
of the key enablers for ARC Processor IP, thus by all means I'd like to see
corresponding support in.

Also, I have some ideas on how to apply some more love to ARC support
in Buildroot - let me explore that possibility as we do want to keep
at least existing ARC support in Buildroot and other open-source projects.

And thank you for all the work and care!

Regards,
Alexey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
