Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41E5C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 08:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E52483A47;
	Fri, 13 May 2022 08:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pd4FpCD6tdTv; Fri, 13 May 2022 08:40:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84CC083495;
	Fri, 13 May 2022 08:40:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E89B51BF332
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 08:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E50ED60DED
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 08:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x6Ec8bxJ1nPi for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 08:40:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::613])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98BD46070A
 for <buildroot@buildroot.org>; Fri, 13 May 2022 08:40:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxpQGRT2rGwgV2TUIqzYV5C+Sn2J08VSSRn3/l0uprg2mVFjFwSgG+J5Z9wPGxOlS+sJSbW52p14fAgLpk3jTVpTMdCf9MljHD9yHkETpT/WbFio3coj6c7fqtSAUHxNZEKWCDKuTSGjrmuaAWkkzmovwHeheCSGdMhkC/Vdf06nmNnXnQms8uMGbzCytNHhW3Y8Kk+gQ3f8DT96xHhCEJVxgVomd6XioyDZ7NQDlDHdfxZ7BHSATX4EAQDblKIafix7VSW7cLH+eBD3Pq7Df2ziJd6RhDWFVk5fdSsb8IWJUMSq1NsjqkGFRzrz8KWf7FBJMqx7oqT16jSXtbdmHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emEO5koFpfxjSUbFduU8ynWsx5hxTPjjAmHIvK0AM2Y=;
 b=naYlIjKdT0ML9OEiTaJZZdHeGzw62ub5Ov2TC0OoE16yH6a9HLDfhZ7XebjQH8ruyJNwnnBDNcvFLAswaNXTFdG3qfCTto4Y2lwdBMNwofGJjhGT3nea9Gh/XEFeaajJ8JpBw/vs8if+tfuD4wM3MHOA9ef8b4zB2cr4W6zB97FaSVyzbyvvLjleEb9qHzhFSVUrn60rAiBCkWA/SyTKdm0tERMqerGNyCNWqsON4Msb0xI1hUrIy0vbujFwIWatP4moMiK4CxQVfSlCHGv9U3VIbzU+jlGIlTyg/+CE/c6Sx6sPHJharWHxInoI076GO7scACP7r3ZN/Dy2RmlgYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emEO5koFpfxjSUbFduU8ynWsx5hxTPjjAmHIvK0AM2Y=;
 b=o4X7aRVAUTj6OQnZHTaN/JfcmeVIl7N/JvMYbo85sceL03E06YmynZRxMjaw3jM2OsJI5PesvudZPIQlhKj5evJVlyfcd6sFHHbJ+sJBkFh3RLBn4xHekq44eNWDY4BX9NzSfIgOKQwVMB0Q3NDhS5xY0RbwfONBtMVYtXt8YEI=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BL0PR02MB4947.namprd02.prod.outlook.com (2603:10b6:208:58::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Fri, 13 May
 2022 08:40:13 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%5]) with mapi id 15.20.5250.015; Fri, 13 May 2022
 08:40:13 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, Peter Korsgaard
 <peter@korsgaard.com>
Thread-Topic: [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig: transition to
 tarballs
Thread-Index: AQHYXwIELEy/0Pm99UOOfHYHNJ8zuK0OSCO6gAAGK4CACyHP5oAAHg6ggAAnsZCAACrQ24ABfTcAgAAZeWeAADjQu4AAk5KBgAAxKwCAABaNAA==
Date: Fri, 13 May 2022 08:40:13 +0000
Message-ID: <SJ0PR02MB77589186692C36CA8975DE4ED7CA9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220503152425.1069617-1-neal.frager@amd.com>
 <20220503152425.1069617-2-neal.frager@amd.com>
 <87h7653i8q.fsf@dell.be.48ers.dk>
 <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com>
 <87ilqccu3k.fsf@dell.be.48ers.dk>
 <SJ0PR02MB7758738449EEBFE4991D7973D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758FE7F237530275606A745D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <875ymcawvb.fsf@dell.be.48ers.dk>
 <56c3feaa-cbd2-eaa9-7800-cd2102fa8545@lucaceresoli.net>
 <D9EEAC86-D8CB-46E0-A019-B0F792B0511C@xilinx.com>
 <874k1ua6mw.fsf@dell.be.48ers.dk>
 <B695963F-1D4C-4D05-B152-54F424FE025B@xilinx.com>
 <200341c2-809e-8d14-686c-8bf838a15df6@lucaceresoli.net>
In-Reply-To: <200341c2-809e-8d14-686c-8bf838a15df6@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f84ab86-641e-4dbf-2275-08da34bc3275
x-ms-traffictypediagnostic: BL0PR02MB4947:EE_
x-microsoft-antispam-prvs: <BL0PR02MB494750BC021BAC09B3FFA1F3D7CA9@BL0PR02MB4947.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BiCaCkzAV1zBUMKWZA3UZWv+uQm8b0RtfriJmKE1WMzyka7K9XKM1aEgCSvqaqk0OxfGiSa65WtYCtvcOHfsTM0nDqI8KGOZdG0Wo+PCcKfJ7dYrxT5Kg/Ow1v9RI7NZKGRDRe/dgf1MB2Th945PmmE3vCwbb+mNcBSVknE0K3o97qmnYVkOqb8T/trQ/XeqXGpu0Da0oFlbf321UBAJ88qrPjm+3GLzEzq+ya1Dzw9ozQURM/oup+F+scIwdwkzqrDwmPJh55v0qyU7r4YCj2z2HwWsEhPBtaW3gYvucgJwtd8M5mk0jn3J3vmNPbdSJWR1rfp8XezwWfB27WJyPagSk6jQNdScQFL67iMjaThsRBuI4ZjY+ZKiAxARpM9qfa/JeaUtFt9ny4N8ZXxYNoWZheGoD4hsrlrhJmRnLszSLX/lAh8zS0o1UKw6q0HL0NHxvhcxTG6/L8utwqaWuavmwAaj1TO1iE9uVpavqpCTToCEzedx3CzwSZcVkPZwwdvjW8WxNvTd3hks/06l60j2P+gMUWHkqLeh7cSx/rB45kLRSnFkp5CtCJJNM7+CMWxfSSRWoSJkLjy1mjCRUR4Ov+wCOBELmBcYtepVOnDmAZmyB4LbEwGRbAY4/v/HpVZ6Z0PiaJVg+6rQKCQHCaedDmVZmDaqJYU4br0kF9WChK+BdvGtn9l05TRNrA8Ij6O7ZFtaVBL4INx+jvAjkbJ6X4tBJy1N1HZZGsY+BqtZRpjDoWpfAnDQ2akcGrDPH4PtPiGn8jrG9TlXa/W7zIlo2jy5bkxP1PTWQH9FoWE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(66476007)(66946007)(64756008)(66446008)(38070700005)(76116006)(8676002)(66556008)(66574015)(33656002)(55016003)(6506007)(186003)(110136005)(5660300002)(71200400001)(54906003)(9686003)(26005)(38100700002)(86362001)(8936002)(83380400001)(2906002)(122000001)(316002)(53546011)(508600001)(52536014)(7696005)(966005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUNucFpvcVJVbkt0VlhYaVZKc21LcTdtRUtUVHlNcHRWVXF2YVdzMnQxV0pY?=
 =?utf-8?B?dWdMZ2x4WlZ2OG1BYTlGeXpXMndmbWxwK0c0N25kZVRBRG5LYyswSWhFVmRC?=
 =?utf-8?B?ZTlUaTAzaGYvT1psVjNpK3pVQ1lpVGNkYzgvdjQ4QnZ2SFRxOVRHbXE2bWR3?=
 =?utf-8?B?Qi8wMkZKZW13WDJwTm5ScmxVYUE3YXltRVNkUk5mOWNpN1FqRGpqNndjaVpy?=
 =?utf-8?B?OE54OUlxR1V6SXNCbG9wS1dHZllkZHNKNFJTdjNTTWpNMFdES1R0UlFmeXdw?=
 =?utf-8?B?ZEI5MDNranlObU9ocFU2T2o0REF3T2JtT1phYlA4eUxrWENqWHpmQzJEMHUx?=
 =?utf-8?B?czVtZUVwenlpRTROSTlHaExmMVhXT1JCSjcvSEx6UXk4OWFqdmh5WlQwWjdY?=
 =?utf-8?B?em9iS3gxMko2NE90N3FXZUU2MHRDM0U1QitONDJxZENXN3NSZ0R1eTZRZW1X?=
 =?utf-8?B?emJISWQ5eElXVkJKYWtEUFVwc1lKUTFrbHFwUEgzcWV4bS9EZ1JlYm15Y05B?=
 =?utf-8?B?Q2VMbEI3NnI3b1JFQWh2ZzgxM0FadU9Fc21ST0gwSEpHMnBkbUczT09vUFkr?=
 =?utf-8?B?TGl0b3B2enE5SU9sRDJYVlc3SDJZK1NCRlNIMVpreTl4YUlraFN1UEVwTWoz?=
 =?utf-8?B?T2tMQjlvRW9xQXN3QWNrVlRkZ2FyUXd0WnNPT0tTdS95TEpNc2t2TUQ1K3Uw?=
 =?utf-8?B?dnI5WC9aUmJtSXAxN0dxTTFOdUNFU0ZqWE1ndDRjNXVLZDdHaDd3RXc2SHFH?=
 =?utf-8?B?b2FGQWYyMzZKd255OXdqSE5tcnFEdjFxa0h2eDduL0p3VCtOUEtPdDhjTU5D?=
 =?utf-8?B?UDdHZW1Qd0lrU0xzMFRNbXV0L2dYWmdDN0V6cG5temNGVUZTcXZuYlFGemNi?=
 =?utf-8?B?MW92MXlIS1RJSE1RYUFNcEpNWkpqcFZYVFNyNWpTUnREWmZ6Y2phanFGdUM3?=
 =?utf-8?B?L3gxSlBvL3lkYUI4R05PWW1neFN0T2FoNUZwdTh2d1p6cVgrSnNlbHRNUjVE?=
 =?utf-8?B?S1FlQzVTYWZMZVh1MTltaWtYZWVFbXRmV2NOMmtiTTUzejE2Yk1BaXBZTGlE?=
 =?utf-8?B?azJxUGROK3h4Z2loK0o1TWZSbDZMbVQ4c3RZd2lFQU5CWVAvempLMW96U0Zt?=
 =?utf-8?B?VFAwZnh6TUVIcHVxTmlCa1drejUySGh2ZkNiL3AyYTNVRFA4bjBIdllkeFRp?=
 =?utf-8?B?SmRPanlkeDNXWFlXZ3RLeG1RL3F1RjlNbGpwbkdua0pJTjFYWmgrL0RxSzZV?=
 =?utf-8?B?L3NkOXpiQkFyWVBOaWhBVERxTTZhY1NPUFR6SlptVE5nSE5ka0FIVzlqYmth?=
 =?utf-8?B?WWpyWjBnQTRLZmZnc1phNjNuN0Z0TEo3cTdkRmo4cFBFZkQ3OW45ejYrbVR6?=
 =?utf-8?B?UDRKTFllUVA2YmpEWnYxVUppUndxL25QM0lNUTQxSWExTnZOejh2VU41L0Jq?=
 =?utf-8?B?ZzVlekxaMkdmUTFvaEdiUkZWTVVobFBueGJmdDZPTVhoZjduazFITUlDNFIy?=
 =?utf-8?B?Y1A2UDZleFVNU25NL0dZYm5iV1YrT1UrakpQdE5jOW1iZzdWdTV6Ujl0N3py?=
 =?utf-8?B?T3k4MFRNcHZ6K043b1FoVmR2akFDdStnNzk1cUFiMTBuY3dMOWxhdHNYN2Fr?=
 =?utf-8?B?TVhIdEIrV1U1aWFRUDBjamdGUEVieFdGZmVnV0xkOW1HcVVHN2JIMGFhc2dI?=
 =?utf-8?B?VGFUKzlkNGo0Y3VDMmZqcjV3SDV6R2VsNWhpNzd2MW1DNTd2YUNvYlVZOGhR?=
 =?utf-8?B?dU81MXgvWnBBcGhJSjljYVZsMUNHaHdrcG5ubDhmTkNsTWJPc0NNZ0FiRS9D?=
 =?utf-8?B?ek5yMTFrcHJvdHBCMmpuTUxkb21ZWXZGMDd6eEFFZ2tLdy94b0tYajlKdHkv?=
 =?utf-8?B?SDZTbEdERHFHSlI3V3ZEWmh6dVk1MktobjN0VEZGUW9iNVpsUjArNEtIaDhU?=
 =?utf-8?B?d2lOSDc0QWh6NkxNQUsxQ3d0YTdPWGQveDNqOW5mMmJ1c2I1SW9TN1ZqOWhw?=
 =?utf-8?B?U3VMVVBiZmUzaGhHZnQ4SncrNFJUWFVIT2czN1diZUxFN1p5S2lneG9oeVUz?=
 =?utf-8?B?TFFTa2ZhQUdzRjZJRStqdzQwUFRNYkZkekhhVXYwUksxMzFZUG9nWlNIYUsz?=
 =?utf-8?B?K2ROVWpQS0pHVnlBWE90aFBwL0hpZUxBTkE5QzdyazFycU9EL2hzRksrZk5q?=
 =?utf-8?B?R2F1b1FSMmhWUVdQT0NJRVEyQmtYNWhESy9Gc0RBQnhJa2FWeWVHU0pqTFFF?=
 =?utf-8?B?WWNXc3lsR3dZNjQwTVFLaEo0bVlZMGZmY1Q1eDlRQk9wYjNqSHNSQUs1bUMz?=
 =?utf-8?B?UHl0VGJHWjJyZ2RlelF5b3duQWY5TlMzQnhXYWRYbVc5TkxnUGFwZz09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f84ab86-641e-4dbf-2275-08da34bc3275
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 08:40:13.1067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nLk4d/aj4Pzu4/H4mWRNH3TurF3oD4jqXwi6aF4w7Nqu5d7OoNqcisRqnzRD+zFngHwjI6tDQFxQECCjj9Fc4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4947
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig:
 transition to tarballs
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Michal Simek <michals@xilinx.com>, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVjYSwNCg0KPiBIaSBOZWFsLA0KDQpPbiAxMy8wNS8yMiAwNjoyMSwgTmVhbCBGcmFnZXIg
d3JvdGU6DQo+IEhpIFBldGVyLCBMdWNhLA0KPg0KPg0KPg0KPj4gTGUgMTIgbWFpIDIwMjIgw6Ag
MjE6MzMsIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gYSDDqWNyaXQgOg0K
Pj4NCj4+IO+7v0NBVVRJT046IFRoaXMgbWVzc2FnZSBoYXMgb3JpZ2luYXRlZCBmcm9tIGFuIEV4
dGVybmFsIFNvdXJjZS4gUGxlYXNlIHVzZSBwcm9wZXIganVkZ21lbnQgYW5kIGNhdXRpb24gd2hl
biBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZyB0byB0
aGlzIGVtYWlsLg0KPj4NCj4+DQo+Pj4+Pj4+ICJOZWFsIiA9PSBOZWFsIEZyYWdlciA8bmVhbGZA
eGlsaW54LmNvbT4gd3JpdGVzOg0KPj4NCj4+IEhpLA0KPj4NCj4+Pj4+IEkgaGFkIHRvIGFsc28g
cGFzcyB0aGUgLW0qIGZsYWdzIGluIEVYVFJBX0NPTVBJTEVSX0ZMQUdTIHRvIGdldCBpdCANCj4+
Pj4+IHRvIGxpbmssIHByZXN1bWFibHkgdGhlIHBldGFsaW51eCB0b29sY2hhaW4gaGFzIGluY29t
cGF0aWJsZSANCj4+Pj4+IGRlZmF1bHRzLiBMdWNhLCBhbnkgc3BlY2lmaWMgcmVhc29ucyB0byBu
b3QgcGFzcyBDRkxBR1MgdGhlcmU/DQo+Pj4+DQo+Pj4+IEknbSBhZnJhaWQgSSBoYXZlIG5vIHJl
YWwgYW5zd2VyLiA6KCBXaGVuIEkgaW5pdGlhbGx5IHdyb3RlIHRoZSANCj4+Pj4gc2NyaXB0IEkg
ZGlkIGl0IHRvIGhhdmUgdGhlIHNhbWUgbG9naWMgYXMgcGV0YWxpbnV4LiBMYXRlciBJIGRpZG4n
dCANCj4+Pj4gd2F0Y2ggZm9yIGl0cyBjaGFuZ2VzLiBJIHdvdWxkIGxvdmUgdG8gYmUgaGVscGZ1
bCBidXQgSSBoYXZlIG5vIA0KPj4+PiBhY2Nlc3MgdG8gYSB6eW5xbXAgYm9hcmQgbm93Lg0KPj4N
Cj4+PiBXb3VsZCBpdCBiZSBwb3NzaWJsZSBmb3IgeW91IHRvIGp1c3QgaW1wbGVtZW50IHRoZSBj
aGFuZ2VzIHRoYXQgDQo+Pj4gUGV0ZXIgaGFzIHByb3Bvc2VkPyAgUGV0ZXIgYXBwZWFycyB0byBo
YXZlIGFscmVhZHkgaWRlbnRpZmllZCBhIHNvbHV0aW9uLg0KPj4NCj4+PiBCb3RoIFBldGVyIGFu
ZCBJIGhhdmUgemN1MTA2IGJvYXJkcywgc28gd2UgY2FuIGJvdGggdGVzdCBhbmQgdmVyaWZ5IA0K
Pj4+IHRoZSB1cGRhdGUgd29ya3MuDQo+Pg0KPj4gU29ycnksIHRoYXQgaXMgbm90IHRydWUuIEkg
aGF2ZW4ndCBmb3VuZCB0aGUgbWFnaWMgaW5jYXJuYXRpb24gdG8gZ2V0IA0KPj4gYSB3b3JraW5n
IHBtdWZ3IGJ1aWxkIHdpdGggdGhlIHRvb2xjaGFpbiBidWlsdCBieSBjcm9zc3Rvb2wtbmcuIE15
IA0KPj4gZGlmZiB3YXMganVzdCB0byBzaG93IHdoYXQgSSBoYWQgdG8gY2hhbmdlIHRvIGFkanVz
dCANCj4+IHp5bnFtcC1wbXVmdy1idWlsZGVyIHRvIHVzZSBhIHBldGFsaW51eCB0b29sY2hhaW4u
DQo+Pg0KPg0KPiBJcyB0aGVyZSBhIHJlYXNvbiB3aHkgd2UgY2Fubm90IGNoYW5nZSB0aGUgenlu
cW1wLXBtdWZ3LWJ1aWxkZXIgdG8gZG93bmxvYWQgdGhlIHNhbWUgdG9vbGNoYWluIHRoYXQgcGV0
YWxpbnV4IHVzZXMgYXMgdGhlIGNyb3NzdG9vbC1uZyB0b29sY2hhaW4/DQoNCj4gQ2FuIHlvdSBw
b2ludCB0byB3aGVyZSB0aGUgcGV0YWxpbnV4IHRvb2xjaGFpbiBjb21lcyBmcm9tPw0KDQo+IElm
IHBldGFsaW51eCB1c2VzIGEgcHVibGljbHkgYXZhaWxhYmxlIHByZWJ1aWx0IHRvb2xjaGFpbiwg
cG9zc2libHkgd2l0aCBzb3VyY2VzIGF2YWlsYWJsZSwgdGhlbiB0aGlzIGNvdWxkIGJlIGNvbnNp
ZGVyZWQuDQoNCj4gSG93ZXZlciBJIHN1c3BlY3QgaXQgZG9lcyB1c2UgYSB0b29sY2hhaW4gdGhh
dCBpcyBzaGlwcGVkIGJ5IFZpdGlzLiBJZiBpdCBpcyB0aGUgY2FzZSwgdGhlbiBpdCdzIG5vdCBh
biBvcHRpb24gaGVyZS4NCg0KPiBUaGUgZXN0IG9wdGlvbiB3b3VsZCBiZSB0byBmaXggdGhlIGN0
LW5nIHRvb2xjaGFpbiBvZiBjb3Vyc2UsIGJ1dCBJJ20gYWZyYWlkIEkgY2Fubm90IGJlIHZlcnkg
aGVscGZ1bCBvbiB0aGlzLCBlc3BlY2lhbGx5IHdpdGhvdXQgYW4gaGFyZHdhcmUgdG8gdGVzdC4g
OigNCg0KVml0aXMgYW5kIFBldGFMaW51eCAyMDIyLjEgdXNlIEdDQyBjb21waWxlciAxMS4yLjAg
d2l0aCB0aGUgZm9sbG93aW5nIHBhdGNoIHNldDoNCmh0dHBzOi8vZ2l0aHViLmNvbS9YaWxpbngv
bWV0YS14aWxpbngvdHJlZS94bG54LXJlbC12MjAyMi4xL21ldGEtbWljcm9ibGF6ZS9yZWNpcGVz
LWRldnRvb2xzL2djYy9nY2MtMTENCg0KRmVlbCBmcmVlIHRvIHBpY2sgeW91ciBtaXJyb3Igc2l0
ZSBmb3IgdGhlIEdDQyAxMS4yLjAgZG93bmxvYWQuDQoNClBsZWFzZSBsZXQgbWUga25vdyBpZiB5
b3UgaGF2ZSBhbnkgcXVlc3Rpb25zLg0KDQpCZXN0IHJlZ2FyZHMsDQpOZWFsIEZyYWdlcg0KQU1E
DQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
