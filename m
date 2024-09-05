Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81286CD5BA9
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 11:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE54B8146F;
	Thu,  5 Sep 2024 11:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VODZatBuOCQP; Thu,  5 Sep 2024 11:18:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A30CC8148B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A30CC8148B;
	Thu,  5 Sep 2024 11:18:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4CE4E1BF3E8
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 11:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38DF7405B3
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 11:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sn3fwUm92Kbh for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 11:18:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.158.9;
 helo=mx0b-00230701.pphosted.com; envelope-from=yuriy.kolerov@synopsys.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2F405405AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F405405AD
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F405405AD
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 11:18:27 +0000 (UTC)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
 by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4859bAo1027454;
 Thu, 5 Sep 2024 04:18:24 -0700
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 41c1tfnntg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Sep 2024 04:18:24 -0700 (PDT)
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5D3D340521;
 Thu,  5 Sep 2024 11:18:22 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id AA3C4A0264;
 Thu,  5 Sep 2024 11:18:21 +0000 (UTC)
Received: from outbound.mail.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3614C4035C;
 Thu,  5 Sep 2024 11:18:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cl7Oh5RvjUCp6ZhD2XCGxA61Na51QZh+5dIWJq0dIIKfyWHaNcEEmJeJAxihEL0uhokeuj4W6C1/Z+SgOntHKf2otwFf2IDI1sxdyhj4R8SLrxvRe0QULWEQofwfeK2bGpkZ7apBUMOoke+qGNBrqBEi4iSWXmW/uuCtpEiIsWCB8wlxH30i0GcyZFoH3dQ5osrmll7fbo9Plk2mORsgSlsvnt4eR4ztOXqxORIwqKF60y2+/h4zy8OM1OaxuwTBa7eP7cWwJPHzxhDFDFP2KebekKH2MQRF2SLyhdY3HE6WC7GafOt/teYfNHpO3BrZzzOgV4fB5UCFxt9LELRx8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XHHOV/aeGuVn1ZqRi9z5IX+iX5//0YXx5B2ucGNgtk=;
 b=fUXfx0KPBgTY92jkbJE4X00jmR8BFGGBS9h7nR/opzlhE7HtI6DrvNUzyP35VH6RXIZPdRr1P04jXKM+DK0+DylNjfIwVO5RIRwlixQzM+y0VlszB61Vk/v3kYM8Z22Yfvawt3erOcZwn11FqV3Hv/k0XKOOgJs7TML4rbEmRAHy/qJnkpScmsxBb8my3yxf4vWUyZkNnxbKSyg/KvhvIX2SeH08N8iWUdMgrL2kdv71a8GFmgc1u1YPF4B1w8aDsQPSiaKsLYllW8wuZSN0LgJr/KO/WxLPlPTxTH2t5iAdlS+F9qSoNVKau9qDxtEESIJwUvDAsdP71xID60f7vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from CY8PR12MB7516.namprd12.prod.outlook.com (2603:10b6:930:94::9)
 by CY8PR12MB9033.namprd12.prod.outlook.com (2603:10b6:930:71::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Thu, 5 Sep
 2024 11:18:16 +0000
Received: from CY8PR12MB7516.namprd12.prod.outlook.com
 ([fe80::d8f4:4e96:1d37:2239]) by CY8PR12MB7516.namprd12.prod.outlook.com
 ([fe80::d8f4:4e96:1d37:2239%3]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 11:18:16 +0000
X-SNPS-Relay: synopsys.com
To: Romain Naour <romain.naour@gmail.com>
Thread-Topic: [PATCH 1/1] package/glibc: drop support of ARC 700 targets
Thread-Index: AQHa9XDDOWN72+6nE0iIlZ+42Gd/ZLI0+CiAgAAAZOSAFCabsA==
Date: Thu, 5 Sep 2024 11:18:16 +0000
Message-ID: <CY8PR12MB7516AD7110E0D8CCA0B074FFA89D2@CY8PR12MB7516.namprd12.prod.outlook.com>
References: <20240823152547.1023215-1-ykolerov@synopsys.com>
 <20240823173127.36b44786@windsurf>
 <CY8PR12MB7516DE5EC9BAF13631235DB1A8882@CY8PR12MB7516.namprd12.prod.outlook.com>
In-Reply-To: <CY8PR12MB7516DE5EC9BAF13631235DB1A8882@CY8PR12MB7516.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7516:EE_|CY8PR12MB9033:EE_
x-ms-office365-filtering-correlation-id: 588c7326-9a07-4c25-42e9-08dccd9c707f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?yp1AKLzTVmHctAlxyu/hP+KjBlqoZNeZtj/X10gXNyncEdN1wKLxFaNNS7?=
 =?iso-8859-1?Q?MT5pRBM/QVJ+uSNooWyvFzX8E6JP1/8AtBGxa9qnQ2tMN3KFVcYK68a2Pn?=
 =?iso-8859-1?Q?4fvY7d+AfzhJ/bmH8IdCQVbX+sqhlTu4RODqamjK9FR/fyU1rPTRmawZAd?=
 =?iso-8859-1?Q?aURul33ibUVX5fLM46mkd9NTshLqz5q2ulsjw57mq5KrXSU7WpdgMi+Uka?=
 =?iso-8859-1?Q?eIVr543qry9O8pWqEZrffURGvbJ8waloeEM6EQDm8SlWiysFUKkLTH1QWM?=
 =?iso-8859-1?Q?bFPSRVecS/L/GTCc9eSCCQ8vS9gnSAnFCpyCDrXjNJNZtFpHGVSEVvcR1z?=
 =?iso-8859-1?Q?DOTodWw33R3Gkc8/O9nV+uFxZoq6XngKvXxCJ45pVXYS4vMZoA3Bsw4rcO?=
 =?iso-8859-1?Q?kQVrpaJ0x4tnj49UBQYGgAU2qr5bsHTuHfui5qkmUbmiI/waY71IF0UuiU?=
 =?iso-8859-1?Q?UhdkoT+HYcTvKE4+nABCkje7i/goYGab3IH0Yl+v94yoESjJUyxCHvHN1t?=
 =?iso-8859-1?Q?4ZHI3IJ6RNDCiFnmOKWNrJHUH4uUh0FeR6tvmPsBZsN6vaL1RVS7AzQshV?=
 =?iso-8859-1?Q?zeIuPLAqQIT8mKXRfjaGQfpEAbOotSMSnvkevTT7IUkugdgBb+vCjSchYH?=
 =?iso-8859-1?Q?YQ+PYYQAQhUwA4tebbW486cPS9oHxWwwGgUSbjWPbVVcPp8T27NCcLyedt?=
 =?iso-8859-1?Q?1pCGHCwVJHYQVTKCns5ckFfdnkI40g3t6IBzNS47u68GodKC/D3J8eOJwQ?=
 =?iso-8859-1?Q?oHDqxxzLTzq/Vg+Ex4A0a2q9pXQKNENHlW/gnRdSD2dvka3uwc26lsGzTA?=
 =?iso-8859-1?Q?67f7tBL8i0r8Sq68OZq0WoMUFDN50cWIrA1+oUGFlEYotjFGc0A4dvOz4a?=
 =?iso-8859-1?Q?QMNHhpWGmnJUiX0wMAnpzOqpIh4G16jynG//kgyHp+vyi4oWDF8QZ7cjHE?=
 =?iso-8859-1?Q?EJtQ3vlSCTGdbeETypVJaOr4BW0vsvEzXXBe30LFDD8UdREgPcJP3gaC0j?=
 =?iso-8859-1?Q?lkNZbfSgOQIR/3OfFEui8jkTesUg97E9wAUucUl5gsAXt5+OvmGvZ+Smv1?=
 =?iso-8859-1?Q?fdWdKT0uSsp0CBtQlKE7MnB9IqbcplXFCzi1ejB1qSMFE2qyF0QLhf5RMX?=
 =?iso-8859-1?Q?qWU76yg4n1RAzW41KT92OGVUwa8v31e9mXlVAC1sxn1wTd2/JnMg9G0R+u?=
 =?iso-8859-1?Q?AaXYusCDnqtkv0ZGfSnVR3AWlEfdN4v11YSZ5nSjdMC4lxUwf5WgLWyjfl?=
 =?iso-8859-1?Q?4DZ9IVt68/9/eo1POOXChn1AEuu8F+xgF63ezJ4B/ebjt8T6FbkaN8p6Dx?=
 =?iso-8859-1?Q?p3C4c4Q40E2iZ7AcLpQzq6eg/f46eVoRqsx4kXa6dDn7zFwOpaP9x+N8YW?=
 =?iso-8859-1?Q?/sIJJjkIigxmtXPZoqqEy+Us91u/A8QQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7516.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?T5C1XWxTLp6cXYBGjOZ3ObQtc6AnvQtrdeUp9+NkjaCgRC0rk9jKjhsi0i?=
 =?iso-8859-1?Q?CYqEZSuyfGgs0X3LCMHoKVPyVjbMyULkyEP3Fp3Qzo6ATnHmfUcqaso0jn?=
 =?iso-8859-1?Q?WFGeBG6WUmLPWDZlDk1f9kzUmVaWMiHiYYuYWuPeMb5mMYt+/4dD4J/Iq8?=
 =?iso-8859-1?Q?gxPOcy856C87Px78G9JJ+dN2qNdxgrNKLENwSjAJ54hGapD3fyNdTPh4JP?=
 =?iso-8859-1?Q?zotDPMoE+oPEIpTPaSC48HmOtcqCYNO15vgzyGD6FxEhYyjxVMJBpLk23p?=
 =?iso-8859-1?Q?AZi4veKH0OMZVagdGdk6huTXWRTwPIB4Q3HtdSYY8Q9yBrFo9HGe4kuY0n?=
 =?iso-8859-1?Q?a0qHS6c1IJ9dNS93RKQe56m8RxdBV1BpMYyLkWR09Whavsh/rOrrsL4aQq?=
 =?iso-8859-1?Q?H3Gcnma4QRn6NYf0bFnpCxrQd+5JuIr5/4AUTp62M2ex5k+kXHxZppLEdQ?=
 =?iso-8859-1?Q?ZadnSvVIE7HZPcO/S8+I75HbdarfAwB6lycsNlr0pvarWd7BFY/Nu6UQYb?=
 =?iso-8859-1?Q?ay5xQYnHeNv2fqDMTkaJLWZbyJdu5oKKvzF+AJF8xYtCKiDGVT4wLC5t72?=
 =?iso-8859-1?Q?RBY52UXLVuFNBwWdGkPELNT0SHYwQqpiLh2jjp8KY+gBkEB1/MhVRJfptA?=
 =?iso-8859-1?Q?x1j4qxDf7xdcZ1moZeBqS6Lv3KAxDr4/AWuXMl2aoK0ej4Jx9y/kMnxKv9?=
 =?iso-8859-1?Q?S8yTqxBekLfnikIO0nmPyrosg/5igQxRhiPHb2MnZyye6kyLwcr77vcoAs?=
 =?iso-8859-1?Q?G1DqyZaGcK5EAtbfskmTMF5nAeCjEEoOeQcGqi8tQ0DAlIK5FfmihEpbAO?=
 =?iso-8859-1?Q?S4swzbAbaBtM+AH2oxTOP8ThR6FyJuIePBmdRc2dnQ+ckU2CUrXm1nabPU?=
 =?iso-8859-1?Q?neZMMEbJfjBqvmOs1HMAq035lZzMa4Un8jhBAwhMr3A8MoDn94CTwiZTxN?=
 =?iso-8859-1?Q?vQO+R1Hc4t/ySnFb9JOGY2hK+Uz4v5HxJT7pJ8KgmYLI9zAxR3ZB+nHHQ2?=
 =?iso-8859-1?Q?zzmlarCtXR+27xDWXmglKOBKfciLxhugtFPP3TT+9dSXKv7QEwuM5hUFQT?=
 =?iso-8859-1?Q?WzMZ+cjauhWdklx8Qim12jMK+uKJndlF1/ewqJuzD8WE3iplcuk4j/xytn?=
 =?iso-8859-1?Q?dRjjovhVTZkYawbDYFSXGm3hATNkvsbqZbAMnycqTEmVy57pZPD4EdDft6?=
 =?iso-8859-1?Q?mlPoJ9oVAHapZFvZQrJeUsCMCG3RYOGOBhItaDUm055Gthe8BsMfVE2BST?=
 =?iso-8859-1?Q?z1OC/2yadurO9YwkVSnuTfqOFy25B8Doont1uPvX3ciwE5+P0vzHoEpNVH?=
 =?iso-8859-1?Q?A1kNbe6e2K1QGN4hFQnfm+v+GJdGQPSbSpbnZ8/T0V4oC2Vw16L1jjLvS8?=
 =?iso-8859-1?Q?onKO4AiDw8HRD72x+G31c/kkISNJhpGWyyORiP5yKUnOXcZZDtBvDubeQq?=
 =?iso-8859-1?Q?bVQHpen3oLCU2DXhC6NRIw2qK2Jwfjb+6I7q/XkTJZBMgIK4rwJEKDoTlk?=
 =?iso-8859-1?Q?GYTbrVrOp/7UOamYnZOFsOmUtL1wR+8El+CH7aIdlPOX4mqAb5A/AfPZ/7?=
 =?iso-8859-1?Q?55TnHPblvmCRcoW/+ocJIumSBqUg798zxlwHcnWnX0FxGSsXI+06j9Vd7s?=
 =?iso-8859-1?Q?/LOQ7rZ3cFxCsyB5DZqOqbBPk8xxkce1pq?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 94en2P8zLiQD+XAlLmHzmEyqqiugeAGiRhdqcilVRO/lfOH2/M5UZ3VBKkK4QzTvPe3jZifaFJ7GwTK3QXxMdBpWNEs+M6l4aYrKWHcEOnBA85baviL/K6+fsrRhyhqfOkJW0dOtP62hRWYR39cflf/UgU2SShGMZPVP/LdE3FBihOdFxn3u32Jdd3KkBnd6tNNPOkFrRzo7RFru1Mm/CrSg73XrrvuMJLumzgQzdWb6/cw1Mbidk3AjZAtnSFbDcyTcPmT0jcNvl7DekGvZThxXeDBzU3+7b28LcrTHKXqe3V9WUtrziS6XYdmxhzHMwxXh5wPqn3ZjeLqHJM/IeTO4aNRflKq91iTKTtVYM56AYrXSsFtSclVvfUHB1ilx/7Vh6guOlYFxV74/qvaxGYde1RHFfq+PPCR42hMTZKw659UCGF8IKr8dCKcPqx4jPqgzZLUaQw07ug/ucEIEPaoXgc0AYy9iFbQu1na9UIklxC95WetWCxJVuJdW/Nr7ehAOvN20SLWyN+23UyzTTvYu3cLuwiohDSMVGHK+fFYsZjmgu+GQ4b55SFzi1pTTOxF9x8Uy1IIaIyMjEKRjxsBRmZUSnZHJYJNKC2zXC2iAm3CblO6KWXylMsZZ8MggDymjW/O7aQgWdomPvhnObg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7516.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 588c7326-9a07-4c25-42e9-08dccd9c707f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2024 11:18:16.5450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B4L+a1BFZMNpOEbpdGA9nv0kwrJw3R4xFih9ktFd0tLNEYEfKScRgPdtI/UdooYL8Ifpqy37LsePmugQ/LwQqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9033
X-Authority-Analysis: v=2.4 cv=aYAzngot c=1 sm=1 tr=0 ts=66d99380 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10
 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10
 a=YRHvXXt1AAAA:8 a=P-IC7800AAAA:8 a=pGLkceISAAAA:8 a=jIQo8A4GAAAA:8
 a=BoJB4dgYAAAA:8 a=W4FKIdMWFRNrSTBkde8A:9 a=wPNLvfGTeEIA:10
 a=tdlbvnJM15nTszQW9e4A:9 a=9sf5ih0RCQmp_PSU:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=9bw_jnHfPby8klRCszyn:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=Lf5xNeLK5dgiOs8hzIjU:22 a=zGR_d48pMUbmtCY1HACo:22
X-Proofpoint-ORIG-GUID: jMV5qDG1iUtbBSwM_1MQfoxbNp9YpxDX
X-Proofpoint-GUID: jMV5qDG1iUtbBSwM_1MQfoxbNp9YpxDX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_06,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=895 mlxscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409050083
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=pfptdkimsnps; bh=3XHHOV/aeGuVn1ZqRi9z5
 IX+iX5//0YXx5B2ucGNgtk=; b=mKrhwTs3tZQHXV+/2Yu9qDwxRTK27+wfhNHGT
 ktfNmZ3mDbVFE6t7Sql6WrWIJUv94dQtMrXPd6ev5mP+SATeiQT0YHWPfkJNsC/Y
 QEnNFRZ188VNkNzRVRjISYggDLm1NQxZt4pFVf302Wn0SbrOu/g8SU8ZfzTi4vqr
 oN0McpVq+8gtIervngtNRpsajnnFzpcTpHXocfYmY6gyCvCBRtVyaj+1PfPTC+93
 sFxrNM6xh6oOYXvnSHNz78Z/GQXfpDPtZG/EKM7ceIjGhRhQVTU+dibsXL1tSiks
 K4g+iuc99XW6Q3iIGhkbbU9nchAQGfyCutJdSPHmg65SKuIzw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1725535103; bh=/9jfXvetytfmO74YII3ejf5jvggqbu4dvVxqL/LR/PA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=O82T96cd1HOgin7BMHodOgGsUyXEALjPac6RblVPZRc5qceULFJAT9x1s8r4HVYYe
 6EW52GSeTihV3YQfoM1hNRwxtAukOPbSLN0z62wXa/hdGnv1rg6MOu8+a46BGCI2w2
 Y/3vVaJ2Fosm5DPAdKELRNg9F0N/vStH3VKUPtiL4yOK23DXXJRLJxGfnzIfDiy4K2
 NUKsagIEZ7JyPk9oEiN9ykgu7SjzGQbsMh6RIP9LLKCd8y/mdUAxBVhv8hnwN0JrIQ
 Kv3VForP5wKYRi683o52Wtxl5h5UvxQJKJ7MEJ/R5Obc7Ndete8HX5tTAKv9qLsMxO
 Y+Gx3Y2NL1pcg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XHHOV/aeGuVn1ZqRi9z5IX+iX5//0YXx5B2ucGNgtk=;
 b=c5/eWO7f+bzU5NtvMOQaVMduL94a87ND6ZDSrxtUIvSh6IPUMv6hkwGEgR/OnU5GTV8CG6L++VSIHRp3xoZa0H+3n6kwa+rIahQaaKocbephQiV+9HAoTPZv+0a1PBl438AlR3CSVvnIDzCQ0QO5jeigfHqpBc+7g/WQb0n94ck=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=synopsys.com
 header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps
 header.b=mKrhwTs3; 
 dkim=pass (2048-bit key, unprotected) header.d=synopsys.com
 header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=O82T96cd; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=c5/eWO7f
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=c5/eWO7f; 
 dkim-atps=neutral
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: drop support of ARC 700
 targets
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
From: Yuriy Kolerov via buildroot <buildroot@buildroot.org>
Reply-To: Yuriy Kolerov <Yuriy.Kolerov@synopsys.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6093618266645739523=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6093618266645739523==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CY8PR12MB7516AD7110E0D8CCA0B074FFA89D2CY8PR12MB7516namp_"

--_000_CY8PR12MB7516AD7110E0D8CCA0B074FFA89D2CY8PR12MB7516namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Romain,

Could you please look at this?

Regards,
Yuriy Kolerov

________________________________
From: buildroot <buildroot-bounces@buildroot.org> on behalf of Yuriy Kolero=
v via buildroot <buildroot@buildroot.org>
Sent: Friday, August 23, 2024 18:49
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>; Alexey Brodkin <abrodkin@synopsy=
s.com>; buildroot@buildroot.org <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: drop support of ARC 700=
 targets

This patch excludes glibc from libc list for ARC 700 and it makes all glibc=
 based cases irrelevant for ARC 700. So, technically - yes, it fixes that c=
ase and this one too:

http://autobuild.buildroot.org/results/fa9960365bd54872762d5e959b98882b86c5=
e956/<https://urldefense.com/v3/__http://autobuild.buildroot.org/results/fa=
9960365bd54872762d5e959b98882b86c5e956/__;!!A4F2R9G_pg!dzH8QzUDxf7Q-VMTKJDZ=
xIKlUGMAQSEgCOztpMHiEidRaXX7aSZYD70SZcCLvdQofXmvia3v4buPSEknxVnQ-cpX_5yU$>

Regards,
Yuriy Kolerov

________________________________
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Sent: Friday, August 23, 2024 18:31
To: Yuriy Kolerov <ykolerov@synopsys.com>
Cc: buildroot@buildroot.org <buildroot@buildroot.org>; Romain Naour <romain=
.naour@gmail.com>; Alexey Brodkin <abrodkin@synopsys.com>
Subject: Re: [PATCH 1/1] package/glibc: drop support of ARC 700 targets

On Fri, 23 Aug 2024 18:25:47 +0300
Yuriy Kolerov <Yuriy.Kolerov@synopsys.com> wrote:

> Synopsys ARC 700 family is not supported by glibc. Thus, it is
> necessary to prevent selecting glibc while configuring for
> that processors family.
>
> Signed-off-by: Yuriy Kolerov <ykolerov@synopsys.com>

Is this fixing:

  https://urldefense.com/v3/__http://autobuild.buildroot.net/results/9f0a4d=
69aed71a840b1c278a9623c9687207ffc6/__;!!A4F2R9G_pg!cDvQnRyK92Nee5maM5oKWn-p=
EzTjL0ar-y73sg2UoRflnc2H1_UJk85aKzyydm0RacFILeBCseX9W9XdLdUFCB2rOgQLENcE9Q4=
$

 ?

Thanks,

Thomas
--
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://urldefense.com/v3/__https://bootlin.com__;!!A4F2R9G_pg!cDvQnRyK92Ne=
e5maM5oKWn-pEzTjL0ar-y73sg2UoRflnc2H1_UJk85aKzyydm0RacFILeBCseX9W9XdLdUFCB2=
rOgQLHqKe_Ek$

--_000_CY8PR12MB7516AD7110E0D8CCA0B074FFA89D2CY8PR12MB7516namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Romain,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Could you please look at this?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Yuriy Kolerov</div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;buildr=
oot &lt;buildroot-bounces@buildroot.org&gt; on behalf of Yuriy Kolerov via =
buildroot &lt;buildroot@buildroot.org&gt;<br>
<b>Sent:</b>&nbsp;Friday, August 23, 2024 18:49<br>
<b>To:</b>&nbsp;Thomas Petazzoni &lt;thomas.petazzoni@bootlin.com&gt;<br>
<b>Cc:</b>&nbsp;Romain Naour &lt;romain.naour@gmail.com&gt;; Alexey Brodkin=
 &lt;abrodkin@synopsys.com&gt;; buildroot@buildroot.org &lt;buildroot@build=
root.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [Buildroot] [PATCH 1/1] package/glibc: drop suppor=
t of ARC 700 targets</span>
<div>&nbsp;</div>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
This patch excludes glibc from libc list for ARC 700 and it makes all glibc=
 based cases irrelevant for ARC 700. So, technically - yes, it fixes that c=
ase and this one too:</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<a href=3D"https://urldefense.com/v3/__http://autobuild.buildroot.org/resul=
ts/fa9960365bd54872762d5e959b98882b86c5e956/__;!!A4F2R9G_pg!dzH8QzUDxf7Q-VM=
TKJDZxIKlUGMAQSEgCOztpMHiEidRaXX7aSZYD70SZcCLvdQofXmvia3v4buPSEknxVnQ-cpX_5=
yU$" id=3D"OWAffdea886-5eab-e8e6-9834-e2104020c189" class=3D"OWAAutoLink" d=
ata-auth=3D"NotApplicable">http://autobuild.buildroot.org/results/fa9960365=
bd54872762d5e959b98882b86c5e956/</a></div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div id=3D"x_Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Yuriy Kolerov</div>
</div>
<div id=3D"x_appendonsend"></div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<hr style=3D"direction: ltr; display: inline-block; width: 98%;">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri=
, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;Thom=
as Petazzoni &lt;thomas.petazzoni@bootlin.com&gt;<br>
<b>Sent:</b>&nbsp;Friday, August 23, 2024 18:31<br>
<b>To:</b>&nbsp;Yuriy Kolerov &lt;ykolerov@synopsys.com&gt;<br>
<b>Cc:</b>&nbsp;buildroot@buildroot.org &lt;buildroot@buildroot.org&gt;; Ro=
main Naour &lt;romain.naour@gmail.com&gt;; Alexey Brodkin &lt;abrodkin@syno=
psys.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH 1/1] package/glibc: drop support of ARC 700=
 targets</span>
<div>&nbsp;</div>
</div>
<div style=3D"direction: ltr; font-size: 11pt;">On Fri, 23 Aug 2024 18:25:4=
7 +0300<br>
Yuriy Kolerov &lt;Yuriy.Kolerov@synopsys.com&gt; wrote:<br>
<br>
&gt; Synopsys ARC 700 family is not supported by glibc. Thus, it is<br>
&gt; necessary to prevent selecting glibc while configuring for<br>
&gt; that processors family.<br>
&gt;<br>
&gt; Signed-off-by: Yuriy Kolerov &lt;ykolerov@synopsys.com&gt;<br>
<br>
Is this fixing:<br>
<br>
&nbsp; <a href=3D"https://urldefense.com/v3/__http://autobuild.buildroot.ne=
t/results/9f0a4d69aed71a840b1c278a9623c9687207ffc6/__;!!A4F2R9G_pg!cDvQnRyK=
92Nee5maM5oKWn-pEzTjL0ar-y73sg2UoRflnc2H1_UJk85aKzyydm0RacFILeBCseX9W9XdLdU=
FCB2rOgQLENcE9Q4$" id=3D"OWA6f09e362-b139-8ad9-fc98-5f5cef5d2eea" class=3D"=
x_OWAAutoLink" data-auth=3D"NotApplicable">
https://urldefense.com/v3/__http://autobuild.buildroot.net/results/9f0a4d69=
aed71a840b1c278a9623c9687207ffc6/__;!!A4F2R9G_pg!cDvQnRyK92Nee5maM5oKWn-pEz=
TjL0ar-y73sg2UoRflnc2H1_UJk85aKzyydm0RacFILeBCseX9W9XdLdUFCB2rOgQLENcE9Q4$<=
/a><br>
<br>
&nbsp;?<br>
<br>
Thanks,<br>
<br>
Thomas<br>
--<br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://urldefense.com/v3/__https://bootlin.com__;!!A4F2R9G_pg!c=
DvQnRyK92Nee5maM5oKWn-pEzTjL0ar-y73sg2UoRflnc2H1_UJk85aKzyydm0RacFILeBCseX9=
W9XdLdUFCB2rOgQLHqKe_Ek$" id=3D"OWAa0e92900-734c-dcf0-d585-10f4046e24e2" cl=
ass=3D"x_OWAAutoLink" data-auth=3D"NotApplicable">https://urldefense.com/v3=
/__https://bootlin.com__;!!A4F2R9G_pg!cDvQnRyK92Nee5maM5oKWn-pEzTjL0ar-y73s=
g2UoRflnc2H1_UJk85aKzyydm0RacFILeBCseX9W9XdLdUFCB2rOgQLHqKe_Ek$</a></div>
</body>
</html>

--_000_CY8PR12MB7516AD7110E0D8CCA0B074FFA89D2CY8PR12MB7516namp_--

--===============6093618266645739523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6093618266645739523==--
