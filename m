Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DACECA0EE4
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 19:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F356341296;
	Fri, 15 Aug 2025 19:04:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGGgmHyBo3QS; Fri, 15 Aug 2025 19:04:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DDF341277
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DDF341277;
	Fri, 15 Aug 2025 19:04:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7662A196
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 19:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6551E41277
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 19:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ypxbxyk4wXbI for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 19:04:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2406::608;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B5324128A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B5324128A
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2406::608])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B5324128A
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 19:04:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZsRNnCYd1ZBcx+Y5WW9xj/p2uRmpMokwdTZznwl+CPcxM452CfHs2P2xguNg12g1T7dfU/d7TYTQ3lNqHP3CxqShWr5KR9nmhfa7cpcimSAkAerhHTRVsYpBi4bnCRO34muALXtjs3u2PjDzEWF5gUO1Mtxtx5ArwJDBkzjPV9B6eLrVv2kzxFofhnJv6EjKMZlED9hnFD6Iv8IZdllbGiv3HteJABzMRI5xsx2eclokIGxN8KJ7HXoyQQrlBGrb0XWXjeUDL152i3aLMiPMEqbTHgO2T5XhG7GWD+nbqUPw54xJRsVcAjyKXZFmopzFHtLRrmlxgyxZRA6fV6Qfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pAVtKQ3djCf0tQ5zoePvirI6Xv3LrFOfc8xK2UqTtQ=;
 b=QuLECJzLvhrm6bS3b528nod65VOvZbk0yzt9fslh2p+Czryw0iafJhaxkt7yBOI3NYTYNcB9Kk86jeRzsjwfvU1b/ziC6Dnrhr+D4Fik90WwVHGHXF9NZeWw2YfejZbwLrXxZRu6Boo45IGqtSCCKxauBG/Hn79tctblq2bPC6oLwYP2HDEtdk0GQmmiEC06dlNwGLKBorkddMgwaThM86XR1yTiID5DjSuPbskgFaXeTgHVdKgnXleHC8z7t9I18qKF44qZokCh7lnVwxfCvUkMxhPDjpNuvYuL1XXLFkaX08P+XqF9m3dEuDtO8aXjqZ7xHJOIr2catI1Ru1+BjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by SJ2PR12MB8875.namprd12.prod.outlook.com (2603:10b6:a03:543::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.23; Fri, 15 Aug
 2025 19:04:00 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 19:04:00 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Julien Olivain <ju.o@free.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>
Thread-Topic: [PATCH 1/1] package/gcc-bare-metal: bump to version 15.2.0 to
 fix build
Thread-Index: AQHcDfk7NJeQg2tNQE+twuWibsCkgrRj1zYAgAAXQfCAAAP+oIAAFqaAgAABS8SAAAJhAIAAA7hH
Date: Fri, 15 Aug 2025 19:04:00 +0000
Message-ID: <SA1PR12MB561519AC36BCB510FCDD3C0AF034A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250815152737.588503-1-ju.o@free.fr>
 <20250815173050.1cc70ac9@windsurf>
 <SA1PR12MB5615DBECDFACC784ACC244BFF034A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <SA1PR12MB56156FBEE60B08B4CF6E47FEF034A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250815202925.42d1667c@windsurf>
 <SA1PR12MB5615109970A6666176138370F034A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <20250815204234.695f6fe0@windsurf>
In-Reply-To: <20250815204234.695f6fe0@windsurf>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-15T18:55:52.0784173Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-reactions: allow
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|SJ2PR12MB8875:EE_
x-ms-office365-filtering-correlation-id: b6c8a6ae-e10c-47e9-fd77-08dddc2e7e62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|8096899003|38070700018|41080700001;
x-microsoft-antispam-message-info: =?us-ascii?Q?2Pkc6VdeoEqtekYSwSXW/tpNp83LTfLcte8aiQbA3RjxY1vIMmEdp6B34bBi?=
 =?us-ascii?Q?4O3VoQb/gudQeXq+FUHmPwsnE64RGWGjE8Hp+kGj+5d+mfeUtapxz2Kns00B?=
 =?us-ascii?Q?lUMrguKyNfGATVqI+UdTPYszq2FnQHKU1LeTzvxW0nOFoWCaG0rqhCLcFlGG?=
 =?us-ascii?Q?qNLtvPwgtGWkTfqBAwS0rSPg59oL5RGXWzaTe3Jwfp0MfKel+DYCZuovAx8X?=
 =?us-ascii?Q?Zz4OE8pYF8n2qgeSrA2gBjyizvuYGlcvLcCQqTpaM6y/DriUL/CJxW70a6zl?=
 =?us-ascii?Q?oyYoJsYRtxEpCQ0bicy7DoQ9b4zAWk4lGX0FrlmpqEirgG9nMzBLwMpLjpgC?=
 =?us-ascii?Q?llQhF7TnG6KeCGbgRoE6r88aQnJpjaRGGhMN9QGJVG77aeeK2MQEp9ue51NQ?=
 =?us-ascii?Q?Mm8c/7yEwbywwDAHCfYUhyoEmPIX+fnFCGhttkPuFQhr/6Ql/J+qo2O7dXiX?=
 =?us-ascii?Q?LtKAudf7sj3ULk/bX3ZvOCk+v0DHqrWDXKfw8UPXmZDCLkb8q56eIOzCi7Pa?=
 =?us-ascii?Q?w9uSjL3DmVUm956sYBxXwfK2PmGcmttoGNDbpUV5auKWMyJXUYSxtvjl6Qgg?=
 =?us-ascii?Q?hbEgp2WTp5j64bjxk3XNec8XR3796FH6cZb3TDoXjzpxRuXckxqnb2BXrVlI?=
 =?us-ascii?Q?Z/gLbyx0bp0p3KvcYknSJ9I/oSEMLDX1wWrN1seZJ0E1WfK1iplE7ezhrTAy?=
 =?us-ascii?Q?ZQ375KfsQYQ8dLIyfxzDE5K0Z+ZTnUt+oyJ+OSJ9kRVyg+eQ0dcsFp3LHJST?=
 =?us-ascii?Q?QbREdbb5hwKgKWyIX+tueot0TnzbZ5Na4ntjzndcUCgreBT5LdxCDLNe4gEk?=
 =?us-ascii?Q?4gAJjvnV/CtJgBwxTwxSNxl7UwLVw1zQuAFt4fC6qwcaqtpj7LA/WuBD5Ynr?=
 =?us-ascii?Q?bdX03wWRiF7aC0DHyJ+MEO76wT45p3GdmYLe1vfRwDo31/o/dUYBB7nJsziK?=
 =?us-ascii?Q?ySUX75Dr9aCR4OgiFW3ImGpnLNPbBPHYq5RzSM7Iaakqpe8uKaSEBYq11dvO?=
 =?us-ascii?Q?OiALzOGL7cxQ9w+RQiLtrTmaxK0lJDAxuIK5Nn/lYwU8sId6YdriON/+ANj1?=
 =?us-ascii?Q?VIga1kzfUALSk6GQJ6jHEB6AYGuxwGxYYBVr0VhqmpXs9F5bWfFjfXqsTMzG?=
 =?us-ascii?Q?a3SYjR+uef5junq8NEDzMXHx2W87gd38K0LiEc2NxRPvStubFXSLvT7aJOqf?=
 =?us-ascii?Q?mNlCMOEFLER+6+CMoNkAvufsTN2XEvFxUmHi2KBABmfir0LVc0NtOP8P7erO?=
 =?us-ascii?Q?FSUPtGTsErr3lxAqvxPzCu6S2EnEBPp+NTGpWlwshb59W0NZt48ODaxVT9Dc?=
 =?us-ascii?Q?t4kskO6MQRy8qpeuyts2CegPx9q/jmxLi0GNLjBBkhgcrHyHNSPh8+nHRXE8?=
 =?us-ascii?Q?jHe6xZDBAgJ2kpnuWEl0/et0IhSip2IfMOpWCrO7jXADVuMceUi+OKBXfihR?=
 =?us-ascii?Q?Lzca6jVJ1iuUiQmpaUjXvi6d2amXdZayxVnF/a/FOJm0NONKSO4tS6+sK9Eq?=
 =?us-ascii?Q?PQZ1KTgDYWN0OSjdmbehk9vEtrfbTJ2cuYlL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(8096899003)(38070700018)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9Sb01dFH2my2s63yhkTPooXyI0AsPaw0rmfueqYgDyVRY9Fru3OodMnREdqw?=
 =?us-ascii?Q?0EX2lU5FMBGw9vaXjYOiQjWJ99hW0eYCmQtYDEVJUc9wjNXztiRTn+YberI5?=
 =?us-ascii?Q?vUpoGGnFSPjrOZL1G9j46YL0UqVPwBM6FTjIv/sJ2k+X2MzLhoaB9hfx/ITk?=
 =?us-ascii?Q?QvVHl0TOuwYN5sHEjmuM8WhvHY8s39APvSoJ8TR8u3FatukJniy4zAHe08pM?=
 =?us-ascii?Q?MsZL1x/7M6eRb+Jq0q+wubXqp5+6K+tXRev5F9CFq5J9ZhxXOUJTBFxhncDP?=
 =?us-ascii?Q?1wzd/VY7Vvfj1ilftwg8dBusfoDs9lXJih5nFANGO0iLI2WvMIq5rVoWv/B0?=
 =?us-ascii?Q?rDK/kjp7PhSvzxS3ScqIHsVmipyWP5VGgx9tQCAx5SqLj7Xy9e7sZj4NSfUY?=
 =?us-ascii?Q?h+vmOQ3+mlILJaMmV4mxfgNcU9WNgO16js/aM7+i1vK4lB5YBMbfeUHOdlav?=
 =?us-ascii?Q?M1FdorjBoE65GyNqsJcZH34zA02UmRA5GaJMG0YA2LIXCXF7qk0cmlQYVpo5?=
 =?us-ascii?Q?01UwMoayZN0W1bOQIKFP4apMbyuqQZvuDI9VAT1XztJmpbegIMrocjQ15Yrn?=
 =?us-ascii?Q?o6EjttVKhyzq96d/CuD8hb8Xc59kt74NB9mTCKq392CSbwUNUMMW4YGrqP+I?=
 =?us-ascii?Q?gr2Lp9kJxfyNGWUJ4xbCVR/dZnVChcddgeeDSEHsi2RyPzWuQDd6x+NinvpY?=
 =?us-ascii?Q?8Z98veMY3mANt1v6lHNGvSMBm9XE5jifMzhARfAWalWrazTACMDefZ0WLMOF?=
 =?us-ascii?Q?BVYpdV1E7UQE639v1nNImA4V8vZ9fEh0jRGGR49MUYCOwsPFNhVHc/Oe9q5g?=
 =?us-ascii?Q?u6ateZ/s6gE2oc5Rx5G3jgTg3E8WixtcT7UF8LDVpz5geuLJU+TcgtoEmug+?=
 =?us-ascii?Q?ZXnh2r5XNW2BqTgurIAdToe0AzPfBe1M1INkk0k8E+hkpXFqI0o8EK11Nss7?=
 =?us-ascii?Q?coMOmIcwIQ9FcB1HKh2tb5IwEB0NWRJX2J1EYLm1MWwR8SFam2Ryi1vJoowi?=
 =?us-ascii?Q?RLtvYOtT6qR+aKMBb2odADUF6PVKji7H1WbrZexx5X0dbAS6NjPPnGaBSjY3?=
 =?us-ascii?Q?c4nDwsY+XXEAEz4ZrqkjfmXSEftMQLRhEyrt//3zoMjbrW0YvzAi3mMjYdTL?=
 =?us-ascii?Q?nNtO3A8FbiLP34lLl5oUa+gseHiKXNh9id6jTRLzWlsOP1M+Kr0cLd0YnTJc?=
 =?us-ascii?Q?l5M9V7LCYmVRj8YQbnpa6kCAwf9ulH9UkQLN25RVWkljyrxkl2i4zG44V2FL?=
 =?us-ascii?Q?/7VKMqWUgrbXFrBAwL+GzIaPz3x2LvFzPDT509dsFk9RkSC7BRy8NaS4r4Fw?=
 =?us-ascii?Q?mPfOK+NvM76zWZJRNH28OQTVY7xeyxjC05crUAAJQvQ+LDQzZY/ohN6TKlCO?=
 =?us-ascii?Q?SvFDcqn5dC9duFZlxslUZZXhCGE8zIoPxdp6SP3dBLcHAW6FnRxhlSZd4TZW?=
 =?us-ascii?Q?0kgncygoxI3jVq9RnQtViawSGN3foXptzZTyOui9SVuE1t5RPHlimrnOrQ//?=
 =?us-ascii?Q?4LeOnYc2UejKRw8xkmzvZZxFt+TLm2SBI4Vnoqi9oLubwDoGGvHXX0UdfCG9?=
 =?us-ascii?Q?6XymbIJJwKrr4fGwTiVD9jMqOnZxcZ7elQqsUZUekT3oHln34dFrFsFrDAZv?=
 =?us-ascii?Q?ledPuWamw71A/ijBNfHpkjjGSTfGFYkY6c8C0aGcwJR3?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c8a6ae-e10c-47e9-fd77-08dddc2e7e62
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 19:04:00.3121 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ic/d3oF4zGAGTbzYve4GLFBH9p9PwrH4q4Z5vPjC+ns6jLog8Tk4XXG3hk7avMOg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8875
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pAVtKQ3djCf0tQ5zoePvirI6Xv3LrFOfc8xK2UqTtQ=;
 b=PM81WzgGr1ZbbvUsojpdfTvWLA42V5wYIgJAMFDmQ4mPlv5OcNx7scmZwPlAOjSAAZPulehQaidnuhxszezvm1XdMk6o7NXe4a1USVwJzKqJLOCvw9MN6wUHl0ZwQ9lJ8IKJS7iO8VybEBGPMgSXWN2iK+u2cyDj5iOiCZF4tgo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=PM81WzgG
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc-bare-metal: bump to version
 15.2.0 to fix build
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Content-Type: multipart/mixed; boundary="===============6395234228391435698=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6395234228391435698==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_SA1PR12MB561519AC36BCB510FCDD3C0AF034ASA1PR12MB5615namp_"

--_000_SA1PR12MB561519AC36BCB510FCDD3C0AF034ASA1PR12MB5615namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Thomas,

> At the moment, gcc-bare-metal does not need any of the 3 gcc 15 patches.
>
> We could just delete the patches symlink and cherry pick
> any gcc patches we might actually need in the future.
>
> Then we would truly disconnect any dependencies between the
> gcc and gcc-bare-metal packages.

> That would be fine by me, especially as they don't _need_ to be
> connected. In other cases, we really need to have the same version,
> like package/glibc and package/localedef, so it makes sense to share
> hash file and stuff. But between gcc-{final,initial} and
> gcc-bare-metal, there's really no relationship whatsoever.

A good example of this are the zynqmp and versal defconfigs.

The aarch64 gcc version is 14.3 and the microblaze gcc-bare-metal
version is 15.1 (15.2 when Julien's patch is applied).

And having two gcc toolchains of completely different version
causes no problems whatsoever for zynqmp or versal.

The symlinks were only there for convenience. Why create a
second copy of files we already have?

Now we know the unintended consequence of that decision...

Best regards,
Neal Frager
AMD

--_000_SA1PR12MB561519AC36BCB510FCDD3C0AF034ASA1PR12MB5615namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
Hi Thomas,</div>
<div id=3D"ms-outlook-mobile-body-separator-line" dir=3D"ltr"></div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"ltr"></div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<div id=3D"mail-editor-reference-message-container">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><br>
</div>
<div style=3D"font-size: 11pt;">&gt; At the moment, gcc-bare-metal does not=
 need any of the 3 gcc 15 patches.<br>
&gt;<br>
&gt; We could just delete the patches symlink and cherry pick<br>
&gt; any gcc patches we might actually need in the future.<br>
&gt;<br>
&gt; Then we would truly disconnect any dependencies between the<br>
&gt; gcc and gcc-bare-metal packages.<br>
<br>
&gt; That would be fine by me, especially as they don't _need_ to be<br>
&gt; connected. In other cases, we really need to have the same version,<br=
>
&gt; like package/glibc and package/localedef, so it makes sense to share<b=
r>
&gt; hash file and stuff. But between gcc-{final,initial} and<br>
&gt; gcc-bare-metal, there's really no relationship whatsoever.<br>
<br>
A good example of this are the zynqmp and versal defconfigs.</div>
<div dir=3D"ltr" style=3D"font-size: 11pt;"><br>
</div>
<div dir=3D"ltr" style=3D"font-size: 11pt;">The aarch64 gcc version is 14.3=
 and the microblaze gcc-bare-metal</div>
<div dir=3D"ltr" style=3D"font-size: 11pt;">version is 15.1 (15.2 when Juli=
en's patch is applied).</div>
<div dir=3D"ltr" style=3D"font-size: 11pt;"><br>
</div>
<div dir=3D"ltr" style=3D"font-size: 11pt;">And having two gcc toolchains o=
f completely different version</div>
<div dir=3D"ltr" style=3D"font-size: 11pt;">causes no problems whatsoever f=
or zynqmp or versal.</div>
<div dir=3D"ltr" style=3D"font-size: 11pt;"><br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
The symlinks were only there for convenience. Why create a</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
second copy of files we already have?</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 11pt;">
Now we know the unintended consequence of that decision...</div>
<div dir=3D"ltr" style=3D"font-size: 11pt;"><br>
</div>
<div dir=3D"ltr" style=3D"font-size: 11pt;">Best regards,</div>
<div dir=3D"ltr" style=3D"font-size: 11pt;">Neal Frager</div>
<div dir=3D"ltr" style=3D"font-size: 11pt;">AMD</div>
</div>
</div>
</div>
</body>
</html>

--_000_SA1PR12MB561519AC36BCB510FCDD3C0AF034ASA1PR12MB5615namp_--

--===============6395234228391435698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6395234228391435698==--
