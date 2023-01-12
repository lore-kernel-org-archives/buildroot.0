Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E26C54EBC
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 09:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CA294032B;
	Thu, 12 Jan 2023 09:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CA294032B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PpVag0OgKmgi; Thu, 12 Jan 2023 09:22:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AB4D40120;
	Thu, 12 Jan 2023 09:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AB4D40120
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 236ED1BF3DB
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 09:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1A8C81854
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 09:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1A8C81854
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4rtg2CwP-gcG for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 09:22:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A19E58184F
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2078.outbound.protection.outlook.com [40.107.8.78])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A19E58184F
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 09:22:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPD6uyiSZo01+OV9So13yKQ/v5GFt0a4GgvDVkxE6y+Qcm1Yq+XVOIgZSaO2t50vOtbZwDetgM8hcw8f3RFO1JLRkn/3AiBuKqF6jcS/Dr4AZmGQpgh/sfP2aVtMJqTq6+Jy1w8dUhEGgEmDeV5oC1+hmAhCqdUUgTCj6Df9SfAroEMoDcMDp0FeK0wp/Eg8oyqPHTaUefvn9CvPxW6tVdVKWGls2qQ3oC7fnfAROf4eeQ9zix4RtC090bfJyuLH+d2WpXV5NhHqRjex09nXNosKJM1EsCGxwR32s80kbdunghvihS5MSzwSzllInfDnF8E+x6ih4rW1VkKgQdCt0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyKDKkhE6GHaDB8ZlnsQ51iUyLZ7Xo+LuslIBrqJWdY=;
 b=lzyDX7poffHYrxtDxDOi9TI3w1wCJYXSTIfi6yh/QdtlOn9DvNLjXgwUZUHsKaNu9WbhE4v46QJ/k2iY2gT3y8gZpJ2GusdfjKukFL1Cm5kMwcNQWvH2EUGoUc+tsUM4v1lmNNSjt1ZXq/nM+VQMaPpt35g47Tf8yXkYYWRQ4cxq91sBKw9vXQS08Jb0rqOEqwRNe+5SQQiMO1nv+LoecoMvOkjWdxt1y8eTZKNXJi/LfL+OCnSrt144eZu1AGmESvjDik/F7XpSqyn9Mta4XSv7YW7z2+PWNr1/V8pbQFse/PfSx6EPoP+xSl80JIHR7vuKEBcn/lSwa3L0DLfSfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:32::11) by
 AM9P190MB1026.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:264::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.12; Thu, 12 Jan 2023 09:22:33 +0000
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::4b1c:f113:ed46:3dda]) by DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::4b1c:f113:ed46:3dda%7]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 09:22:33 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 2/4] package/at-spi2-core: bump to version 2.47.1
Thread-Index: AQHZJmasbJ4pjGa2XUuqMPccU18SGQ==
Date: Thu, 12 Jan 2023 09:22:33 +0000
Message-ID: <DB6P190MB0488FBAE6BC0065533825A7F9FFD9@DB6P190MB0488.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6P190MB0488:EE_|AM9P190MB1026:EE_
x-ms-office365-filtering-correlation-id: e01d4de1-b125-44f1-9fb0-08daf47e8951
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +XsD/tT+xgh5Pz/wVwB1i2Qpy8azYP5fkov9/pscZ1gQ5b4xu8s/DY85N1JMd33Q+mu0obqQVrF4qHp411VW4WTJfAaZCD/fGcrIjxz+TlwQwIb9JqXzARV9DAvX8tkJteZ2f/UgJvSv1sSm+dg2IFDEB5WlwQJDCVjvbvAf8oDVXraL1we2WPt2je6Mjh4fceBszinEjWlj86psnXvlyB+Zn0Pb6FZSkhP1OXg4FNcOYJYO5lAmLyqzOwoDZJLSayXVrggRSM06YUzAEHjMa5A/sxH3RKUjQ8u2aPbh/c96Mu6lxtG7T3YsxA4i98eNnz+cEc/eXN2KS8trng8ZMdUPKhoKO6QGoB87LWXex0YRIVcRY8AQWHES5TIslOudLoX/ySa78tF7Qt/fGaD0DJyWyk5FjCLNEvjmMm3XLA1+RaumJrfW42b5gHgt9HS9qW7QOUGqZF771xmF6CdPJO2eusVU5ZGvK/4pjsuZQWAP9hW0kROD5+4eBuB13YZeD+7vPzvKEs00XVQy+83kuusXr0RO2vep3qEjPeMS575zOzfge/Ro91XKn8IkT7s5uD9BuSgWWd+5i6HTQzODklEp5ZxG57maroCalraQhjJ4gfthLLxBP6QIHNPTEX74EDq4S/5D7kc9VSdSscuVSeN9xdBAUXD6SJ+8u89SEWQtMBLX3s7DZhIS6zRkqGFoXYvJ3JS+z78Bsse0F3fy3B79sSzFkedLdLMsteTlj9Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6P190MB0488.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(366004)(376002)(346002)(396003)(136003)(451199015)(26005)(966005)(7696005)(478600001)(71200400001)(76116006)(91956017)(186003)(316002)(9686003)(8676002)(66446008)(66476007)(66946007)(66556008)(6916009)(41300700001)(6506007)(4326008)(64756008)(83380400001)(52536014)(2906002)(8936002)(5660300002)(38100700002)(33656002)(38070700005)(122000001)(86362001)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SGRzb2pIUGR0RWJCb1RSTlJrZ2IxRVlaL25MQ3hqMnR3cmtRTzJzc1dUcHBw?=
 =?utf-8?B?bFMxQS9mVW5maE9LWjlxakNhMWRVT0JiTURla1Y1UXBqQ2xFOGNmcXN3WTJ6?=
 =?utf-8?B?aU82WXdvUXNtbXNHeGZuejNHYnNpSExjdEVMekk4QkdYcGI0VEdGUGpMcFZN?=
 =?utf-8?B?TmlhMUhTaGVVUWVPUGNpRElwaktuSkVLWGx2Y3hldXZIekdLNU5GdWtaK1pZ?=
 =?utf-8?B?V3ZsaXlyVittcW9PNC9scmNtZXIreGloK3RsTWdYdVVNeUpyNCttaHZybms2?=
 =?utf-8?B?K2RzZ1BhTEQ3SS80Um9CNE9tc2ZYZ0FIQ0ZveTF1Sm9IM0JMQmJVZDBzM2tW?=
 =?utf-8?B?eS9XbkZUdmhQeW5TbVNYQ2c4V2c4T1JRZDdULzdsbEFRNTVHZ1VtSkZSWlJj?=
 =?utf-8?B?YmpqZTcrT1EyU1JBVE5CTklQNFFXQVlqMURGQWk4Qm1Ld3VjaS9kcnFYckdP?=
 =?utf-8?B?cFM1eDgvd21KS1orUXhkS2tiWkZxZUh2M0ZBb0dkMUowd25PVmljc3hMZlZB?=
 =?utf-8?B?LzhJUUdMVTl5UjY1cGhPdkZkaUwvQzhFN2ZJd01hRzZ5L1RsZFJVQU1mY0Ns?=
 =?utf-8?B?d0VzTlNLbTRiaEFUWE5SRm5jWUlsUkZDL2xQOFhLTml2ZkZTQzZPMThETVRx?=
 =?utf-8?B?VTkvcmJ1ZEM1b0c2UlQxL0xVOVlOVFI2WXNHSGxHQkdzczc0UW5iUzJwcTBI?=
 =?utf-8?B?dk5RcnZQalJZbjNWUzhsN1ZuakZSK1Jsa2MvdnhZM3hmQkQ0WVJZZG9tMHI4?=
 =?utf-8?B?cEFCTTczLzhYalY1ckpOQnM3R0I5T25jNmhpU082bnpHSEU0ZEM0dkNlc2FK?=
 =?utf-8?B?MXZMVy9FMFBJR2JKWTI2Um9acytiVkIveWlhYmVtYkVXU3d0T3BlYVMvczVK?=
 =?utf-8?B?VkFrenlsZmV2K2t5blhjRmJsQlR3enRWL3NNMWpiWUVRZkJmZlFnQTNjMHl0?=
 =?utf-8?B?Z3JxYkRYR3lvbDhSakJFc0VIQjFCRWd5R0s1V1B5dExLZFVLNDZwZUZuNXhq?=
 =?utf-8?B?SnNwRXZpUE5jSWpmZW9CVkhmWEFvd2ZtYS9ENTU2VVErTmlGcHZ3RHFtWEhS?=
 =?utf-8?B?ZWM4WWN5Ulk4R05kUG9WM3IxdGExKzlvMHJaUGhpWlZ2bHhycm10UytGeU9v?=
 =?utf-8?B?cDlSaDkyTWR2OTMrMHpiMTFobHlrQndrRHhoNTZZR3o4Zk8rdXRlSkhHcDQr?=
 =?utf-8?B?a2IzQ040NFE3SFZzdk1nWEovdzFpY3ZLNEV0VGNQM0JUZWxlUW1TS3Zkb1Z6?=
 =?utf-8?B?SitGQVlqNDBLWjYvejRxMDNEL0QrN0tpZVVudUlrMUFaRUdFaWxVR21vV0lJ?=
 =?utf-8?B?akRMS2xkRzdLOUhvL05sbkZXQ1lhSkZmZHdGemNtNmlOVlFnRXBGbXRDNy9P?=
 =?utf-8?B?a3VZOFcyY3JLRnNGdGkyM1Q5V3BvRWdzNE1JK3AraHdIWkJJWHQwS0RCZ2Vt?=
 =?utf-8?B?Q2NQQzhnMkNIRE45azZoMkxrUUJVcWMwQlhtWVpub2hxMWtSd3dxMlFPb2M5?=
 =?utf-8?B?L29wUEEwZHkxNzZNU2ZGQlArcllsRHE1ZXhCRkxZTDdGTjd1NFl3bjFPL0VM?=
 =?utf-8?B?THFkYkx6S0tuYXFTYWUybUNNaFNjNFZIazZ3ZkFHaUNQeTNQNFM2dWlXWG5V?=
 =?utf-8?B?L1ZjUDJiTHJkNFppa0tHQkFjRFF5ZzBYVEttdm9veHkxMlJPZmE5WklEZGFF?=
 =?utf-8?B?Z2RIZmJ1Ryt0NGFwZGdmNHQ2bWVpd2k4d2VDa2RUQTVhL1Y2MkoxdkJ5NFcy?=
 =?utf-8?B?d09ZMlZnQjRqWGlEV0Y2ckppNlVYSUpJTHZEdXZOQUlXTXpyWVI2dVdjNTI0?=
 =?utf-8?B?NzFSRW03SnJnMVFnVXM4RGVBdmR4ZXExNmk0VEtKSmZvUFc4QzJoRXh2NXlK?=
 =?utf-8?B?QUhLK2pVMDc1YzdSMTd4Mng2cUF5bStrSXYzdUNKY3VMZlVwS2o2dWYyT01F?=
 =?utf-8?B?R3ZQL0VpOWpTYmk2SXJNV1NDaTJobkNCZlpaN0RGdGJJeXdXYnF2Z0svWTEw?=
 =?utf-8?B?TjE5QnR2dHQ2NVp2dnExanllSURyMWdWVWhWU2dEeFQ0eU5pTy9WSjBMMUc4?=
 =?utf-8?B?MHlQMFJYOWx0dUllOUNjQXJYbm1OcjR1WXN2TEVmdUpERjNxWWNvNzI4NGZI?=
 =?utf-8?Q?jrOQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e01d4de1-b125-44f1-9fb0-08daf47e8951
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 09:22:33.2918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J4/1SlpD5iaLddzLJwYg9W5VAAXBU6Yx+4ur35zYB2Nd/QMCtU7U+TzGejZOrS8cDr1N6AaSFH1WmKmz0VCyPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P190MB1026
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyKDKkhE6GHaDB8ZlnsQ51iUyLZ7Xo+LuslIBrqJWdY=;
 b=XQpvaX+oK59U1+SA8awKRzxFWjG6Zz5tWikNMOFu759eYMj08OUsz6ggk1U4U6BoZmWx4lGaBV3gEQ5uW4DioLaDX92qxIN5MDHJWuyUFf8HI1/N/mnCDNqbWCfLgqq/ZxToWFW2zGqlJYuk8gf4QvYNQAcG2Vj3mITntENDOVc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=XQpvaX+o
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 2/4] package/at-spi2-core: bump to version
 2.47.1
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

aHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2F0LXNwaTItY29yZS8tL2Jsb2IvQVRfU1BJ
Ml9DT1JFXzJfNDdfMS9ORVdTCgotIFgxMSBpcyBub3cgb3B0aW9uYWwuCi0gbGlieG1sMiBpcyBu
byBsb25nZXIgb3B0aW9uYWwuCi0gYXRrIGFuZCBhdC1zcGkyLWF0ayBoYXZlIGJlZW4gbWVyZ2Vk
IGludG8gYXQtc3BpMi1jb3JlLgotIGF0ayBpbnRyb3NwZWN0aW9uIG9wdGlvbiBhZGRlZC4KClNp
Z25lZC1vZmYtYnk6IERhbmllbCBMYW5nIDxkLmxhbmdAYWJhdGVjLmF0PgotLS0KQ2hhbmdlcyB2
MSAtPiB2MjoKLSBObyBjaGFuZ2VzCi0tLQrCoHBhY2thZ2UvYXQtc3BpMi1jb3JlL0NvbmZpZy5p
biDCoCDCoCDCoCDCoCB8IMKgOCArKy0tLS0tLQrCoHBhY2thZ2UvYXQtc3BpMi1jb3JlL2F0LXNw
aTItY29yZS5oYXNoIHwgwqA0ICsrLS0KwqBwYWNrYWdlL2F0LXNwaTItY29yZS9hdC1zcGkyLWNv
cmUubWsgwqAgfCAyMCArKysrKysrKysrKysrKysrKy0tLQrCoDMgZmlsZXMgY2hhbmdlZCwgMjEg
aW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9hdC1z
cGkyLWNvcmUvQ29uZmlnLmluIGIvcGFja2FnZS9hdC1zcGkyLWNvcmUvQ29uZmlnLmluCmluZGV4
IGY1NmM1YjkzYzQuLjFmNmM0MjE3NzcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvYXQtc3BpMi1jb3Jl
L0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2F0LXNwaTItY29yZS9Db25maWcuaW4KQEAgLTEsMTIg
KzEsMTIgQEAKwqBjb25maWcgQlIyX1BBQ0tBR0VfQVRfU1BJMl9DT1JFCsKg4oCC4oCC4oCC4oCC
4oCCYm9vbCAiYXQtc3BpMi1jb3JlIgot4oCC4oCC4oCC4oCC4oCCZGVwZW5kcyBvbiBCUjJfUEFD
S0FHRV9YT1JHNyAjIHhsaWItbGlieHRzdArCoOKAguKAguKAguKAguKAgmRlcGVuZHMgb24gQlIy
X1RPT0xDSEFJTl9IQVNfVEhSRUFEUyAjIGRidXMsIGdsaWIyCsKg4oCC4oCC4oCC4oCC4oCCZGVw
ZW5kcyBvbiBCUjJfVVNFX01NVSAjIGdsaWIyCsKg4oCC4oCC4oCC4oCC4oCCZGVwZW5kcyBvbiBC
UjJfVVNFX1dDSEFSICMgZ2xpYjIKwqDigILigILigILigILigIJzZWxlY3QgQlIyX1BBQ0tBR0Vf
REJVUwrCoOKAguKAguKAguKAguKAgnNlbGVjdCBCUjJfUEFDS0FHRV9MSUJHTElCMgot4oCC4oCC
4oCC4oCC4oCCc2VsZWN0IEJSMl9QQUNLQUdFX1hMSUJfTElCWFRTVAor4oCC4oCC4oCC4oCC4oCC
c2VsZWN0IEJSMl9QQUNLQUdFX0xJQlhNTDIKK+KAguKAguKAguKAguKAgnNlbGVjdCBCUjJfUEFD
S0FHRV9YTElCX0xJQlhUU1QgaWYgQlIyX1BBQ0tBR0VfWE9SRzcgIyBvcHRpb25hbGx5IGZvciBY
MTEKwqDigILigILigILigILigIJoZWxwCsKg4oCC4oCC4oCC4oCC4oCCIMKgVGhlIEF0LVNwaTIg
Q29yZSBwYWNrYWdlIGlzIGEgcGFydCBvZiB0aGUgR05PTUUKwqDigILigILigILigILigIIgwqBB
Y2Nlc3NpYmlsaXR5IFByb2plY3QuIEl0IHByb3ZpZGVzIGEgU2VydmljZSBQcm92aWRlcgpAQCAt
MTksNyArMTksMyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfQVRfU1BJMl9DT1JFCsKgY29tbWVudCAi
YXQtc3BpMi1jb3JlIG5lZWRzIGEgdG9vbGNoYWluIHcvIHdjaGFyLCB0aHJlYWRzIgrCoOKAguKA
guKAguKAguKAgmRlcGVuZHMgb24gQlIyX1VTRV9NTVUKwqDigILigILigILigILigIJkZXBlbmRz
IG9uICFCUjJfVVNFX1dDSEFSIHx8ICFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTCi0KLWNvbW1l
bnQgImF0LXNwaTItY29yZSBkZXBlbmRzIG9uIFgub3JnIgot4oCC4oCC4oCC4oCC4oCCZGVwZW5k
cyBvbiBCUjJfVVNFX01NVQot4oCC4oCC4oCC4oCC4oCCZGVwZW5kcyBvbiAhQlIyX1BBQ0tBR0Vf
WE9SRzcKZGlmZiAtLWdpdCBhL3BhY2thZ2UvYXQtc3BpMi1jb3JlL2F0LXNwaTItY29yZS5oYXNo
IGIvcGFja2FnZS9hdC1zcGkyLWNvcmUvYXQtc3BpMi1jb3JlLmhhc2gKaW5kZXggNzY0ZTRjMzY2
MS4uNDUzMWJmMzk2YyAxMDA2NDQKLS0tIGEvcGFja2FnZS9hdC1zcGkyLWNvcmUvYXQtc3BpMi1j
b3JlLmhhc2gKKysrIGIvcGFja2FnZS9hdC1zcGkyLWNvcmUvYXQtc3BpMi1jb3JlLmhhc2gKQEAg
LTEsNSArMSw1IEBACi0jIEZyb20gaHR0cHM6Ly9kb3dubG9hZC5nbm9tZS5vcmcvc291cmNlcy9h
dC1zcGkyLWNvcmUvMi4zNi9hdC1zcGkyLWNvcmUtMi4zNi4wLnNoYTI1NnN1bQotc2hhMjU2IMKg
ODhkYTU3ZGUwYTdlM2M2MGJjMzQxYTk3NGE4MGZkYmEwOTE2MTJkYjM1NDdjNDEwZDZkZWFiMDM5
Y2E1YzA1YSDCoGF0LXNwaTItY29yZS0yLjM2LjAudGFyLnh6CisjIEZyb20gaHR0cHM6Ly9kb3du
bG9hZC5nbm9tZS5vcmcvc291cmNlcy9hdC1zcGkyLWNvcmUvMi40Ny9hdC1zcGkyLWNvcmUtMi40
Ny4xLnNoYTI1NnN1bQorc2hhMjU2IMKgYzZiYTdjMTYwNDM0ZWRlYmYwOWQyOTM2OTMzNTY5Yzkz
NmY2ZWM5NzIzMDE3NjZmMmJkYWM1YTRkNDE4MTUzYyDCoGF0LXNwaTItY29yZS0yLjQ3LjEudGFy
Lnh6CsKgCsKgIyBsb2NhbGx5IGNhbGN1bGF0ZWQKwqBzaGEyNTYgwqBkYzYyNjUyMGRjZDUzYTIy
ZjcyN2FmM2VlNDJjNzcwZTU2Yzk3YTY0ZmUzYWRiMDYzNzk5ZDhhYjAzMmZlNTUxIMKgQ09QWUlO
RwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9hdC1zcGkyLWNvcmUvYXQtc3BpMi1jb3JlLm1rIGIvcGFj
a2FnZS9hdC1zcGkyLWNvcmUvYXQtc3BpMi1jb3JlLm1rCmluZGV4IGYwYjAxOWMwZWQuLmU5OGU3
Nzk4ODQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvYXQtc3BpMi1jb3JlL2F0LXNwaTItY29yZS5tawor
KysgYi9wYWNrYWdlL2F0LXNwaTItY29yZS9hdC1zcGkyLWNvcmUubWsKQEAgLTQsMTcgKzQsMzEg
QEAKwqAjCsKgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKwqAKLUFUX1NQSTJfQ09SRV9WRVJTSU9O
X01BSk9SID0gMi4zNgotQVRfU1BJMl9DT1JFX1ZFUlNJT04gPSAkKEFUX1NQSTJfQ09SRV9WRVJT
SU9OX01BSk9SKS4wCitBVF9TUEkyX0NPUkVfVkVSU0lPTl9NQUpPUiA9IDIuNDcKK0FUX1NQSTJf
Q09SRV9WRVJTSU9OID0gJChBVF9TUEkyX0NPUkVfVkVSU0lPTl9NQUpPUikuMQrCoEFUX1NQSTJf
Q09SRV9TT1VSQ0UgPSBhdC1zcGkyLWNvcmUtJChBVF9TUEkyX0NPUkVfVkVSU0lPTikudGFyLnh6
CsKgQVRfU1BJMl9DT1JFX1NJVEUgPSBodHRwczovL2Rvd25sb2FkLmdub21lLm9yZy9zb3VyY2Vz
L2F0LXNwaTItY29yZS8kKEFUX1NQSTJfQ09SRV9WRVJTSU9OX01BSk9SKQrCoEFUX1NQSTJfQ09S
RV9MSUNFTlNFID0gTEdQTC0yLjErCsKgQVRfU1BJMl9DT1JFX0xJQ0VOU0VfRklMRVMgPSBDT1BZ
SU5HCsKgQVRfU1BJMl9DT1JFX0lOU1RBTExfU1RBR0lORyA9IFlFUwotQVRfU1BJMl9DT1JFX0RF
UEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZiBkYnVzIGxpYmdsaWIyIHhsaWJfbGliWHRzdCBcCitB
VF9TUEkyX0NPUkVfREVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25mIGRidXMgbGliZ2xpYjIgbGli
eG1sMiBcCsKg4oCC4oCC4oCC4oCC4oCCJChUQVJHRVRfTkxTX0RFUEVOREVOQ0lFUykKwqBBVF9T
UEkyX0NPUkVfQ09ORl9PUFRTID0gLURkYnVzX2RhZW1vbj0vdXNyL2Jpbi9kYnVzLWRhZW1vbgrC
oAoraWZlcSAoJChCUjJfUEFDS0FHRV9YT1JHNykseSkKK0FUX1NQSTJfQ09SRV9DT05GX09QVFMg
Kz0gLUR4MTE9ZW5hYmxlZAorQVRfU1BJMl9DT1JFX0RFUEVOREVOQ0lFUyArPSB4bGliX2xpYlh0
c3QKK2Vsc2UKK0FUX1NQSTJfQ09SRV9DT05GX09QVFMgKz0gLUR4MTE9ZGlzYWJsZWQKK2VuZGlm
CisKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfR09CSkVDVF9JTlRST1NQRUNUSU9OKSx5KQorQVRfU1BJ
Ml9DT1JFX0NPTkZfT1BUUyArPSAtRGludHJvc3BlY3Rpb249ZW5hYmxlZAorQVRfU1BJMl9DT1JF
X0RFUEVOREVOQ0lFUyArPSBnb2JqZWN0LWludHJvc3BlY3Rpb24KK2Vsc2UKK0FUX1NQSTJfQ09S
RV9DT05GX09QVFMgKz0gLURpbnRyb3NwZWN0aW9uPWRpc2FibGVkCitlbmRpZgorCsKgQVRfU1BJ
Ml9DT1JFX0xERkxBR1MgPSAkKFRBUkdFVF9MREZMQUdTKSAkKFRBUkdFVF9OTFNfTElCUykKwqAK
wqAkKGV2YWwgJChtZXNvbi1wYWNrYWdlKSkKLS0gCjIuMjUuMQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
