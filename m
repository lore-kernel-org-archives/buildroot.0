Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B95E63F3F
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 09:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DECF240302;
	Mon, 16 Feb 2026 09:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SxFORemoy5lJ; Mon, 16 Feb 2026 09:01:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48993401B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771232466;
	bh=nnyz6k/bLnaVhoDQNRbZVwKyoqEWMr+f9fpqeyvcV1c=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y8bQtBWAFqknlW5fFU8po65NJY6ODglli/O6Yrq62ar1WFv93gAIk7+d/gmCehFiJ
	 d6XAy7JjGPPS52JZbm0ihAvTiWrtVpw8Qdj8w4qz35eRM2F5Jfimm9aV7feYAttS2G
	 jJU9bymxdxcDmypYo1862q2pAPLA6dkyU4IlGXi9rSoepaPxKGBE4orbQcJlvij2Q/
	 RY2RWyQNaoO8sA3jGYaHl2RrCuLkEJj4gM+fbr6wLWROHNalpwBiaQy4y0ZQ/8bDYV
	 HeACTEfY6Hsy08/cuNNxVLc7wWfea5se3Ture37lQfAOjkadzLM/kCNuvtkQcJZPn8
	 zMdT9XTo884jA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48993401B8;
	Mon, 16 Feb 2026 09:01:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9213E35B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7365782664
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUSwHZOKpvAm for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 09:01:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::1;
 helo=db3pr0202cu003.outbound.protection.outlook.com;
 envelope-from=jimmy.wesolowski@mobileye.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0968C826C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0968C826C7
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0968C826C7
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:00:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zx5pnLvfr7kjqLR4NyPwn8b3iIs/nhW6hn9s8mSGegc8wXwnU102PvE/NCgKYzGhyN052RDrYU5MsM06f1b7vQSMTI/zIQytoELUDsuRDvAK00gwz7qP6Oh8TdlzUUzOx4HHbBF1PAOi2XE2AuQ1RQuPs8x7N3dcGRdEbcnP9+GkjLrSNsdiBkXhqvVBkZZri7YiAnB6bWcf44Ykl6c8DT+XwKTUQUVxTTLLlFzxhfL2UfMj4pCs+NPUgXbEcjW7Q3GSD4ZF4uYe2gq7M8fT1/IYvsknx/XV8h5LeaZctys7XOgaTe2Aai0KhDtFo5gaguLxuY5tGt89V31CQ7JC5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4cPl40/gYZBu/e+sgTXELKwKZIhP/AMLS3OvK/VI5A=;
 b=PSlsUIbU2eiSXLQFWRl9wpoP5N+B6U+fKEXKyLX8urCWj+ey60RCKOpP11+5rXINr7iQ1EHff+C3C8FAurc/ujIRKH3UGyZL+GD0ulPx1WB2mV1S7cNFaGYjlYMOAP36nYkcEwJci6/BqASsaXBhXThAT6TzQV7wHXexUZskfyED5vs/B/BvW7xCf78KxSAHBLOFJ/VdTEdclVSnNA3lTtWggc+xJ8rdkbdBzsXnYrDeESD7aCJGT8mVzqu395q0fLe9s/BqPTA94jFjIoylxgtgtFRTfjQFAxpFlmA7+cMB/VypPPSjBIuGOijckEkfzzGwrb9gUltKcyLNgBZytw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
Received: from DB9PR09MB4987.eurprd09.prod.outlook.com (2603:10a6:10:2a7::13)
 by AS2PR09MB6264.eurprd09.prod.outlook.com (2603:10a6:20b:5fb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Mon, 16 Feb
 2026 09:00:54 +0000
Received: from DB9PR09MB4987.eurprd09.prod.outlook.com
 ([fe80::646a:ffaf:f0a1:cf9f]) by DB9PR09MB4987.eurprd09.prod.outlook.com
 ([fe80::646a:ffaf:f0a1:cf9f%4]) with mapi id 15.20.9632.010; Mon, 16 Feb 2026
 09:00:54 +0000
To: Peter Korsgaard <peter@korsgaard.com>, Fiona Klute <fiona.klute@gmx.de>
CC: Fiona Klute via buildroot <buildroot@buildroot.org>, Julien Olivain
 <ju.o@free.fr>, Guenther Harrasser <Guenther.Harrasser@mobileye.com>
Thread-Topic: [PATCH 1/1] support/testing/run-tests: specify multiprocessing
 method
Thread-Index: AQHcnl2n7nkwSesMkkGDq4mVWvT7aLWEN9yAgAAZqLqAALYXIA==
Date: Mon, 16 Feb 2026 09:00:53 +0000
Message-ID: <DB9PR09MB4987AF416E2EE547BE59868EF66CA@DB9PR09MB4987.eurprd09.prod.outlook.com>
References: <20260202141045.1913969-1-jimmy.wesolowski@mobileye.com>
 <a062166d22db6b02629b21913b366fb2@free.fr>
 <81e91ea4-20bd-4786-83f9-5e3810f52cfd@gmx.de>
 <87bjhqpd6c.fsf@dell.be.48ers.dk>
 <55c29855-c3a7-47d5-ae6e-a16062a418b1@gmx.de>
 <87y0ktoe8g.fsf@dell.be.48ers.dk>
In-Reply-To: <87y0ktoe8g.fsf@dell.be.48ers.dk>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR09MB4987:EE_|AS2PR09MB6264:EE_
x-ms-office365-filtering-correlation-id: 0835fa1e-bca4-46b3-7490-08de6d39e40a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|41080700001; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?WlIYExKnRptvp4AoUb0bHPyI7SopR+Cqu9MeURos1a7n6sI4yeJ24GgXhE?=
 =?iso-8859-1?Q?S8YS5ykT0gLEoeZXG7zc/ino5vfZ7yxPfd6VsJnXt8RxYAlQpLGaS3wner?=
 =?iso-8859-1?Q?AnlSNO+0/PXr5XS95CsbjQvnJmr/1YZHmQGmIfmjvCqyVAzOMXEH5jdKf1?=
 =?iso-8859-1?Q?efTcPaWAHXrQqRTc0c5AShUVAYcR68MLYEumKJaC02jsdBkZweG0NlP8Qa?=
 =?iso-8859-1?Q?TLyJhcEmXcIQ73xC2qjMnpf4U/rTb3LZRNdYV3JxM2Fl7ydtqPylWd8evO?=
 =?iso-8859-1?Q?Tbe7TSut/8vGwcirCw8NEYIUTmfpmJIyYXRpycA+xYAyN4B5J2RYWvOVDi?=
 =?iso-8859-1?Q?EauHFpMLIOe2ym5kHg/18Pov82npCVG+cyNbX7vFq4cj5WSACdhXxli4nE?=
 =?iso-8859-1?Q?U/TMswpOaQxfcOJvEf3/XccEPoznCUWcXU5vp801vnakFg6WXzwoZBd6T9?=
 =?iso-8859-1?Q?nFT1YIHPNc1SAl2RAYpaSgaMhdyHBxFYlT7GN6a150m7Kep+oULVaVgN8M?=
 =?iso-8859-1?Q?fzn6Cbc5SJzl5CbMi9sDUJrO6JPBvJGS38NT7fBheNJ0n96WnA0e5u8SXN?=
 =?iso-8859-1?Q?tgJablwe5kL/Ve0fXt4Neyl6mt17iZ2ENiwaqukDY8+90qo43cuivQ2Dlz?=
 =?iso-8859-1?Q?kLghFyZOOR09kpRqFb5uU5QR+8CZyNtrvEFKpI3bFbYzqKc767t8Vj6rUq?=
 =?iso-8859-1?Q?FhuP44YqRloHbLxdPgHA3btn8YHPJH6Aetn41IUWSGXOG0c9BLAep+7QH8?=
 =?iso-8859-1?Q?LiRQ1x1e7ajSiW3fNKTbFK1Ial86gbqFNOxPsSE5iOpKSBbXgHLgiNMhmV?=
 =?iso-8859-1?Q?paZzYNY97t0DCgWkdDNHCZxtFqUfx3RTpat90/jICoAlypk5fLDZDhfx76?=
 =?iso-8859-1?Q?gIpLB0OKOAhwJY22ODHl26uV5oKdCHZLI/zhYbdyfIhSFSN0RI8L+EybxE?=
 =?iso-8859-1?Q?Y06RO0ilRk10lFbnVPLA3ifQH1e3pWEcsx9sFjHrAo/EiJ65bCxVpw6NhS?=
 =?iso-8859-1?Q?dCHA1kFS9tRoRkmpdAxNP3gfkAG6gSV2KBODHpkz41pGQYusf6dVF1jpxe?=
 =?iso-8859-1?Q?kQGs/OMb9hZY8O7gEaGcv6QQiB1mSNZ9S/duFjVOryScMzprL+jR0SYmMT?=
 =?iso-8859-1?Q?jhjSl35h2bjMeMhzCn5dGYZ5pZEFTKQV1uSkaZLwEIk7nJx/5rHBoF9+5J?=
 =?iso-8859-1?Q?FhtapeytmsVT/H316YHXGTSw/kgQ/1KXXc87T5m3wZm/31u7URvQF3GjQJ?=
 =?iso-8859-1?Q?lwHEIl6miD8eBcSpCi3CP5bEuHlAl5twdzyUjdy+GbhOYFkHAsx9uYbxFT?=
 =?iso-8859-1?Q?qk7D0HNwg0DO1Gcjt9AJI9+ISh5nie/kN+AIGI+7dG7/+5SybnkYYMUWNw?=
 =?iso-8859-1?Q?dsd4KDCsPcjzeblXTAa5E7D+DYANFb5i4BbUjkO0//cP753TVG6EaiUSqW?=
 =?iso-8859-1?Q?62WXT4rJ0gCJl2BFZ+7WYttZ9TAthp34OOOoC/9yL2ed35Xp7YgkrRgvPt?=
 =?iso-8859-1?Q?zggWzj5RGF1EvPVfrfjYku6dSxO74USzgHMl7ncTCsFA0rj5d3rgd1clVG?=
 =?iso-8859-1?Q?NL+hIOK7O/MUT420Z2Uhx2L2oaIHex3ucImws8IbqPWTAlghOd9PzS/l9+?=
 =?iso-8859-1?Q?Zv2bXODPPL66bj196L2rdyoUsOu7My/wte2ti+Ojdq9M/OgEIZwLl2VbEJ?=
 =?iso-8859-1?Q?D38uqTWRdR8NB19nfhY9QsDgYz1FHiUh3SY1e8mIKot3w5YuUacFaxUQfA?=
 =?iso-8859-1?Q?BU1A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR09MB4987.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?EeSHDK040ntbFL+Gjl7CAwrp3bVZcgvr8MkJaf3KuSZcXgpASQ7dqfV8V8?=
 =?iso-8859-1?Q?vPSEYEVI9LGYb6bWz+xVc+IZ1vPFtnUnaLf58afVlAyvrvhLAy7RVu2Nj7?=
 =?iso-8859-1?Q?UViVPBK3112hFR43qEJg3KaIs5iR2BfCPYoodZVjB00Z1+xzYE/42CKo4+?=
 =?iso-8859-1?Q?wOdoGtf00umYuelDVTAkJ4gpsnQCJbHfK0+LQuiN/+FFeluMJgM9kfLuv4?=
 =?iso-8859-1?Q?XxHGcp5FejP8itQSV9Fu4BvsvOxdTJqaxuQZkd+cRLtwwuGGn9JZNYuW9r?=
 =?iso-8859-1?Q?8raRD6MIDG6uCzO7IwPgLt5Tap53FYxA+41dPeruhRLEIFG67r8kTLSkkH?=
 =?iso-8859-1?Q?Ztu7pUPuK+zBrvzECkRIJ8ovAwzaUMW9qNQAClX3vPa/pVRcCu1+UQxJup?=
 =?iso-8859-1?Q?r8Ajs2MICY2UpRDIz5sp5SzAGi7wlvndaS9qhNS+zgbOrCKUDAKQWPhFBb?=
 =?iso-8859-1?Q?fdHzBXdjAFkyQbCWxUSsA7DR6tO7EUkalOlaSm4XG1BHjMaJX0lJMX+YEi?=
 =?iso-8859-1?Q?exJtfsMqWBgHFkpyhGHE25Jh4KD7z/Ed9vFJ12r/DjEfa5RNm7RgprKO7k?=
 =?iso-8859-1?Q?rA2zScEsWFiiwdHrob08tEFRwIuPQ3sQFtA2CcwnOsIcDRMaJZJhOPy/H0?=
 =?iso-8859-1?Q?HXD08h89L1AmQpNqnAzA+82yAnqw4dx4M3i7rChshVy/Kksd0JNjTODiVl?=
 =?iso-8859-1?Q?nODFlUlseQxOUHhH4KhF3NbsVhgFXMPyXi0XVpzl0rzummLSrtUco4SANR?=
 =?iso-8859-1?Q?6f5pzLPUFn188iggpRBX5OUHQZWz8YN+0v5kOGjpZExx6QeID0jVKs5X/X?=
 =?iso-8859-1?Q?LAz/6+zS+QFL+ChK7IgShqIQlgmN/90xq0YDtHJwORzwKqjStOaUqgTUK0?=
 =?iso-8859-1?Q?msmfyAILU0dqWf5vm1ikubZaf+lbs5enbkpIyy7/mFcHQ8sXxif6v6YjtL?=
 =?iso-8859-1?Q?l6HckKZuCJRpE8opULSIrEIfpS8+iGZUvl0vuh5aInvCZv+1zYmSQgkPNb?=
 =?iso-8859-1?Q?QTnaY69GrvaaIree8QiiLkpaesMJi3kqveiswbVQ2/IY9aZfE6t9sRon7H?=
 =?iso-8859-1?Q?b2ZsayFIFnm0GVidstIPfyqxKQ/bSwSRYF085cXO7W3bH5A8mZQ2k635G0?=
 =?iso-8859-1?Q?wulM6AWukSfNcIqDUo84hqVUxPcTdgJhOAjqMPqY6Zm4rqra5BjMTzhYwZ?=
 =?iso-8859-1?Q?uUllAOiQsMLksKIY+3tFJprBaUfUBaZufG9TqCL72mQqOCtZcF5hl5iVWv?=
 =?iso-8859-1?Q?ANXBWVPv6LnvtEroxpuBVgTdcg9MnPqnUaA3wyozCaJvnQqFgZWIMV3iHw?=
 =?iso-8859-1?Q?0JGtWN96dxaYW+FPR5EEcd+NmleqpmA88lHNXdJgzj2cGx3Vrazona1Bhy?=
 =?iso-8859-1?Q?AqFMawkZStO2+wJLrfNf558KIKmhRRBSnnFMbV+LuJbZzpApnfItCZGj4B?=
 =?iso-8859-1?Q?BNR30tqZlooCx2rPLSvSEOGyzXddYQPJo+aWJJBodu6QXMj7+6V0SFwBPR?=
 =?iso-8859-1?Q?pmihvcrrt+LLlIvl31/AItOy6cIEWuFv+jk1aVuuqhntDNVbRJHtVTTeCR?=
 =?iso-8859-1?Q?P/CSPQ7AU0vBH117969VRK7B/5gkxYLjVP9MC6tCXh3aHZ0jqDmNH+5uLv?=
 =?iso-8859-1?Q?Ko68+LF94vXt+RpbV7mCSmGSpJIyJG+NIR4KnPWs6rl4ZjnqulPz5NeH+D?=
 =?iso-8859-1?Q?OY5LjMgBWqX8+RDotThs9ll/XdAdr4eP81FD1Ly6n3+qg0jb1Wb5QApcP2?=
 =?iso-8859-1?Q?qjlknRWM+t63+stZ+WUUBeI2vSijjcmImItxQgwv6M9Oix?=
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR09MB4987.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0835fa1e-bca4-46b3-7490-08de6d39e40a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2026 09:00:53.9481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K0j8ziZQ7E7XpGCSDAahzzykPgDHwDEKTV3EvwSkYbDHyFM2uLKbiHKRf0aF9bnNgnZpJDGfNvJ5eI9a+3vDPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR09MB6264
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mobileye.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4cPl40/gYZBu/e+sgTXELKwKZIhP/AMLS3OvK/VI5A=;
 b=MmOM/FXPz+PD689hFvwcuN+3+GztxK0A4BKbNUVRRn0ah8xkB0HQcrWHuAeMJZRW2A/pDnUQUfDEMNVh/TMt2pD4AtGN2LRvKpo0E37dMyP3IExIGwKIxfjw8CEMebt0QeK+ktN59buSfFaMo8tQdu2WwL9IJeE+xGQUhXsZA94=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256
 header.s=selector1 header.b=MmOM/FXP
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Subject: Re: [Buildroot] [PATCH 1/1] support/testing/run-tests: specify
 multiprocessing method
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
From: Jimmy Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Wesolowski <Jimmy.Wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona, hi Peter,


Thank you for checking this change.
I am sorry this broke Debian Sid. I should have tested on more
distributions.

 >> I've tested this with environment variables and it worked fine, though
 >> I'd prefer something that allows type checking, and doesn't require
 >> setting a bunch of environment variables. How about adding a little
 >> dataclass (or serialize/deserialize functions in BRConfigTest) and
 >> using an environment variable to pass the path of a file with
 >> serialized config to be loaded in BRConfigTest.__init__()? I'd
 >> probably use JSON because it's easy to handle with the Python standard
 >> library.

 > Yes, that sounds good - Care to send a patch?

I recall that we are planning to move away from Nose2. Do we still want to
invest in fixing this long term?

 >> Another option would be to switch to a test runner that has built-in
 >> support for passing config (like Pytest), but that'd be a major
 >> change, not a simple fix.

 > Indeed, that is probably what we should do longer term, but not a quick
 > fix.

I can try to support in that effort, but as you could observe, it
could take a while for me to find the time.


Best regards,
-- 
Jimmy Durand Wesolowski
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
