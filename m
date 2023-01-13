Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26258C54EBE
	for <buildroot@archiver.kernel.org>; Fri, 13 Jan 2023 13:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8408821A7;
	Fri, 13 Jan 2023 13:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8408821A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L4CMrqw4xcBv; Fri, 13 Jan 2023 13:44:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED970821A5;
	Fri, 13 Jan 2023 13:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED970821A5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 906AC1BF31C
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 13:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6636A60B42
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 13:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6636A60B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hdh2-BtueEJr for <buildroot@lists.busybox.net>;
 Fri, 13 Jan 2023 13:44:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 380E260AAC
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2069.outbound.protection.outlook.com [40.107.6.69])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 380E260AAC
 for <buildroot@buildroot.org>; Fri, 13 Jan 2023 13:44:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWy8PXzn2SSD3GBnrZH3kBiSFkjOZ82okzlMhISuvrfFpTA+g0o0B6p63lFqJI7rRDUF/oUuYk9JgAoE09sY0diHS2lSqzrX97f6kUEaenqdRf8ptnXiMhQGi6Tl+f1J+b+cjusZZ2jM2kwFE4vjRXWOsZPHt0wK+8mX7HbyLRlX2h2ph3Ua6QsIeqJobSUu5j/wJUtlzHqU0nMnr/6YX8gLml3XjTOC53drGkfUQfNWd0jYoUT8lUeCNeqQ7zkEpF7xfhzYXSQoJb1NictfjH53d14wanoA2oOAQYYI5IIocJspZQs6IGSJPjAKP/3vE1w3zUN/MyJTC6pZ7vRhGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdLRn56NCHRwLR0uzNCBAyZO5mSJuhgogPZEHTHdFUQ=;
 b=d4lFUrk/R1WMfcuJQoe2knxosbshsLDVnGLZSH8FvYSa0h1bhx7OqXLfOKulZynYCrJ508v+OVi7Kv2/EIuVvrkEh2WUEc2R7MQ5/z+YMPCV/KkKXelIILY4YGAfXm7GHcyKeusP+KNglaqa03A1m7q5lCgcTG4Uz9rGlw/Plr4lsXQ4AjSIEj4pYVmdXi6fk3jhvNmHAXrMqwxB1yKez4UitWBwfxEBNyRsq5MzLSSQprxkI280M79Rxmgnt24krmNCXTh0Bha2g6htt/XnMZMalJAJl6coNZj7m/KbJgD85m2Qhvg9TUecip8p9Rv1y3NBXRf5lw8UD+lAGVt/9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4bf::21)
 by DU0P251MB0868.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:3cb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 13:44:29 +0000
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::7431:a93b:4795:8236]) by AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::7431:a93b:4795:8236%8]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 13:44:28 +0000
From: Nicolas Carrier <Nicolas.Carrier@orolia.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: package/lpeg: add missing LPEG_LICENSE_FILES
Thread-Index: AQHZJ1UowvInTjlyiEWQcVGwsVPIsA==
Date: Fri, 13 Jan 2023 13:44:28 +0000
Message-ID: <8ef2e2013a5e486034e602157d91b1de0d1ad374.camel@orolia.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3-1+deb11u1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4P251MB0612:EE_|DU0P251MB0868:EE_
x-ms-office365-filtering-correlation-id: 318ae822-36e3-4221-383c-08daf56c4af6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mCp5kGYrcQjf7tnq6lanUwdCnEjGNb7TJb7URd6mVF+bHNJjewWJsu2th0T7JGpMtp0N/y39HIi/Wb//0jC13L4RkofDEk/yVzZkwmThes52EOpddAjXlgcnhSLC4182PTjBv5mqyChvobSEDy+WDQEQds3po27FlgRycXsSprEvk0i2PUTrTFl+Eg8JeAmThXw/3K/SBawp3xJdyjNXM5vu1qzRK5p/I6ddjpiN3bOKMqIjorwkf/fGBmFsLuCaKH2RzLVzh+C25AWq1pePSWgH+pMMhQuHJ1XFJk/QeAGStAAWWO6Sf2MiO/GDIbsSX4MIiqmJ+jtFOcraqMZruEo6cwsa+NFNdgE7RJYb/V7qM6bW29K6X3vLOzhrFnG4I1WnmSrglrvydJOfC7rPkT95N+d+3HKCqXe9KlIwW0jSXujm3kOhYj1tMLXRrFGwIhMz/exrByJQt3nIgH/1VAUEIJUpWtwHcvlPXExQNlI/3GDyzm4yRZ0/7kPwFC6dFuq+Is1CAGitFx/GmDG94YAIxxbLAnIJbzjDZjKje3cxY6B+aLv3SDyZstTWbW2lpjsf41aYSuAvifEJwotQrT3bZnGpKl3DtMAEPtAOxBFbYwpfa2xgr4aCru32aBRycsxvsXgQU5Rw9kmh0WUogwlZdNzDSOyoM1qMKcXPv0ztQ4WK2h2ULbpt/5bxP+kTXmfUaDOMe2XGKBcQm+6x4g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4P251MB0612.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39840400004)(366004)(451199015)(66446008)(36756003)(66946007)(41300700001)(66556008)(8676002)(76116006)(64756008)(4326008)(66476007)(86362001)(91956017)(38070700005)(6916009)(122000001)(5660300002)(38100700002)(8936002)(316002)(99936003)(2616005)(6506007)(71200400001)(6486002)(558084003)(2906002)(186003)(6512007)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDFtVmFTT1FEdkhUMS8zdHJRQzJlbDdXTmtWUjMzNGQwYkRCZ29HMUFZbGFa?=
 =?utf-8?B?Vk40elM0RnpQdisxbG8xNXZ3c3VNTE5HS2JjclJPRVZGR2ZwK0d1TWVhSHh0?=
 =?utf-8?B?aTJUcTA4SVRaWjIycmtwMURNVmJ6SEsyeXRtaGhySUJFZVVtV295d0oxQkNw?=
 =?utf-8?B?R0d3TnpHWlhFV0NreGwwNjJyQ25wWFFodHFYbFE0RUxydCtKaGRHbGZOZzBm?=
 =?utf-8?B?OTZlaTZxVXdBMElENEFhMkhrMlo3V0p6ZkJYNW1idkVNYmphcXpaMExPVmRu?=
 =?utf-8?B?TlViS3h0UWtOR3pwY2QwUXlra2FXYit6bjlwTnpBOHJSWVR2SWFBNmR5Visw?=
 =?utf-8?B?cUR0bjNpWEVvVS94Rll0UmdIZkNDUkxLWXh0SFJlNnVXODVTcHJaQVcveVFp?=
 =?utf-8?B?UTRKS0RVZEl3MUVNZSttN1N5dXl5NEg1WG9BYXRlc0Q2d1JuY3Y4QnUwREl1?=
 =?utf-8?B?Y3JRVmhqcnNpb0tLT254ak85N1VrYlA0ZUtHMkYrbExyRzIwRGFnb0Vwc1k5?=
 =?utf-8?B?Q0JIQ3V4NmNPTHJyZ2d4Q1llQkcyRUlmb2pVQVhFMjVZRlhxWmRrZmx0NWsy?=
 =?utf-8?B?cEU0bnNWVktqeGxXNWQ0VUNoelIvNE8xRm1tYWNtbWVKMzBVczdPcC92M2x6?=
 =?utf-8?B?Z0lqWGpwU0xlY3c1dFg5TC9leExXQ1dYZGJYckwxOGtHcjRWK0M0ZXRveFZ0?=
 =?utf-8?B?T3dCVCt0QlJjMWhPbFdNcVdyZk9OMjdUREFtNStwa2dYZUc4TmwxSlhhME9D?=
 =?utf-8?B?Y2locFlvd3BCb0NRT0JMaGhRWkI3REt3Q1JSdUR2eHNjb3RpVGVvZTl3RzVY?=
 =?utf-8?B?c1dkamtqS3FzaE1kUUZLSjEzeXVJaTVYTEF0cjlNenhjZ01IbG5mbDJoamh1?=
 =?utf-8?B?a0FwRnUwME1PTUFUaXIzU1k5dmVLTG5wWG11RFpMMEpTZmZzNzdnTTY2eUhs?=
 =?utf-8?B?bFZoSThmWmVhekgxYjFFWU5JNllIaVVMMUo4Z2s4YzdiUmJyalBZN2dVYXdJ?=
 =?utf-8?B?Tmd2UGo0MlU4SmRiNjlLQ09JeWlub3paSFRhc3VtYUJybmYzelZ0bEh6RXRY?=
 =?utf-8?B?amRyY1NaZUhHRXdpNHliL3MweU5PZ0hlZzR0NXl3cjJRQjNQR2JSMFh2SUJk?=
 =?utf-8?B?TzhLMXc0TWx2bUdwaUZuMmg1RjJlR1IzVWJSM3ZqWmNjSHMvemIwSnFMSUpT?=
 =?utf-8?B?OGFVU3BvVHczQjhZajFGVm5lK016dU9XNXU4R05ZeDJLbzFjUHZTS25nRVpq?=
 =?utf-8?B?Y3dGbmFMYjJHOTdtUXBueUk4UkxLR0c4cFdETTd1VFRCUzdzY0VhTGROZzlm?=
 =?utf-8?B?Nm41UXRPWGxCYTRLdzdYZ2VqTGpvTy9BS1plT2kxODU4bkkrbXBDekNOSWo5?=
 =?utf-8?B?MnFlSFZDcVFDRGU4N1Axa2JuK0Iya3RteXFLWktmT0J2bCswV1ZxNkh4TlFP?=
 =?utf-8?B?Q2FUc1huVTFhdDB3aEJrN0JWR1pBN0svSG5XdUVvYXJHQW9iUnRTeWpFTVJl?=
 =?utf-8?B?b1BBN1JhUkJZU1ZYeFpTd2RwQUVFanYwS2F0WHN0TFpYVmw5VWVTYmE2aDdN?=
 =?utf-8?B?aDg1eVo3eVQwcTE2VXV0YkFxdkp2d3pTN0NpWG9aMldiOFpnNFFFTTkycCtF?=
 =?utf-8?B?WXBpNVc1Z0ZramdsY3lKbVh2WFBkMXpMOUMrc3l4T0FQek9oYlhRUUZ1aFg2?=
 =?utf-8?B?RGUwTzlRcEY5N2JuZ1JnMTc4VHBpcmJRbDBhczFJQUlXWVZ3c2UrclRtVFdi?=
 =?utf-8?B?R09kdnArUFFVYThsUXcxY0FMUUdUK1BuTXJET1JVZ2lNQVRUMWF1Q0QyS09n?=
 =?utf-8?B?eGlxVVkwZStlakJKR2JIazRFQ2pjTFpwendTNFVXVUtyRGJwQy9ITjhsT1NT?=
 =?utf-8?B?WG8rdGsxOFZDeGtSOTRnT2drUzFGSlI5ZUk4WXZwWTZzS0tkNEdtTUZmam00?=
 =?utf-8?B?RS9nWXY1bVNTZmYxNG9CTmlBdzFCVEo3SzJ5REtOQS9VSU1YNnNWenRTRFNX?=
 =?utf-8?B?M3EvNjhtd0tSbXJXNWJmUkVFRUtYWStLZU5sRWZDZXI3eXhPL3M2QjNyUUJH?=
 =?utf-8?B?MmxiVnV2RmNwM0thallocHlYcldTQkdCVmZ2WTBYUzRjcCtZSmFaVk1ZcXkz?=
 =?utf-8?B?U0I2Z2NFelNZcUJYMDhESFdsMkpmaUdkVWdVeURhbU50QTN6ZUhDbm5vbEwx?=
 =?utf-8?B?b3hYaDBraHVkRUM1Y211S3k1QUFXQ3pwdzZtMFBxUnZwQ1JWQS9XMTNGT3hx?=
 =?utf-8?Q?DAHCMjbt/fSFCDuDHCQlYWlVIV+AUTM56ufcBNizP4=3D?=
Content-Type: multipart/mixed;
 boundary="_002_8ef2e2013a5e486034e602157d91b1de0d1ad374cameloroliacom_"
MIME-Version: 1.0
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 318ae822-36e3-4221-383c-08daf56c4af6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2023 13:44:28.8800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zZiTZF5UrU36otW1jzEfi0BfCAQ//95+wV/2ZyuLPlSVAFzs8215M03zK/u3Zjgx3HjLKM3mHO5YqWV3/6Szjb/0/x8opOhUO2CRF8KQl6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P251MB0868
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orolia.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdLRn56NCHRwLR0uzNCBAyZO5mSJuhgogPZEHTHdFUQ=;
 b=S2dUd0uw5xyF4qbOmjjM/52dBS9YM0pvBLjqkmO39faAMLmuBI3/QLQ5U5btUzw8JHNEgMV31cG7a93FLD1323ej65HUfA+sy2uDGmErJe+h4XF27wYSjaHjcmFnyykXK7fOM7OvaputgNnQrNVneJXDwUTKP7FLLLy3g2LseVI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=orolia.com header.i=@orolia.com header.a=rsa-sha256
 header.s=selector1 header.b=S2dUd0uw
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
Subject: [Buildroot] package/lpeg: add missing LPEG_LICENSE_FILES
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--_002_8ef2e2013a5e486034e602157d91b1de0d1ad374cameloroliacom_
Content-Type: text/plain; charset="utf-8"
Content-ID: <441E84911BF83443ADC2BFD1D653CBBF@EURP251.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

VGhlIGxwZWcuaHRtbCBmaWxlIGRlY2xhcmVzIHRoZSBsaWNlbnNpbmcgdGVybXMgYXQgaXRzIGJv
dHRvbSwgc28gaXQNCnNob3VsZCB3b3JrIGFzIGEgbGljZW5zZSBmaWxlLg0K

--_002_8ef2e2013a5e486034e602157d91b1de0d1ad374cameloroliacom_
Content-Type: text/x-patch;
	name="0001-package-lpeg-add-missing-LPEG_LICENSE_FILES.patch"
Content-Description: 0001-package-lpeg-add-missing-LPEG_LICENSE_FILES.patch
Content-Disposition: attachment;
	filename="0001-package-lpeg-add-missing-LPEG_LICENSE_FILES.patch"; size=1204;
	creation-date="Fri, 13 Jan 2023 13:44:28 GMT";
	modification-date="Fri, 13 Jan 2023 13:44:28 GMT"
Content-ID: <42AB7D2B1E63C848A48CC512C283C13D@EURP251.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

RnJvbSAxMjAwN2U4NWQ3NWRhZjk0MWI4ZTgyNzQxZTE0ZWUxY2I5YzYxODkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBOaWNvbGFzIENhcnJpZXIgPG5pY29sYXMuY2FycmllckBvcm9s
aWEuY29tPgpEYXRlOiBGcmksIDEzIEphbiAyMDIzIDE0OjM5OjUzICswMTAwClN1YmplY3Q6IFtQ
QVRDSCAxLzFdIHBhY2thZ2UvbHBlZzogYWRkIG1pc3NpbmcgTFBFR19MSUNFTlNFX0ZJTEVTCgpU
aGUgbHBlZy5odG1sIGZpbGUgZGVjbGFyZXMgdGhlIGxpY2Vuc2luZyB0ZXJtcyBhdCBpdHMgYm90
dG9tLCBzbyBpdApzaG91bGQgd29yayBhcyBhIGxpY2Vuc2UgZmlsZS4KClNpZ25lZC1vZmYtYnk6
IE5pY29sYXMgQ2FycmllciA8bmljb2xhcy5jYXJyaWVyQG9yb2xpYS5jb20+Ci0tLQogcGFja2Fn
ZS9scGVnL2xwZWcuaGFzaCB8IDMgKysrCiBwYWNrYWdlL2xwZWcvbHBlZy5tayAgIHwgMSArCiAy
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHBl
Zy9scGVnLmhhc2ggYi9wYWNrYWdlL2xwZWcvbHBlZy5oYXNoCmluZGV4IDFjY2FmMjQyYzQuLmY0
ODBhYzY0ODMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbHBlZy9scGVnLmhhc2gKKysrIGIvcGFja2Fn
ZS9scGVnL2xwZWcuaGFzaApAQCAtMSwyICsxLDUgQEAKICMgY29tcHV0ZWQgYnkgbHVhcm9ja3Mv
YnVpbGRyb290CiBzaGEyNTYgIGUwZDBkNjg3ODk3ZjA2NTg4NTU4MTY4ZWViMTkwMmFjNDFhMTFl
ZGQxYjU4ZjFhYTYxYjk5ZDBlYTBhYmJmYmMgIGxwZWctMS4wLjItMS5zcmMucm9jaworIyBjb21w
dXRlZCBsb2NhbGx5CitzaGEyNTYgIDJiODBhOGNjZTc5M2UwMDhiYTQzM2U1ZTAxODRmMjBhY2E0
YTY3ZWM3NDE0MzlmYWZkODZhODc0YTZhOTFjNDkgIGxwZWctMS4wLjIvbHBlZy5odG1sCisKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbHBlZy9scGVnLm1rIGIvcGFja2FnZS9scGVnL2xwZWcubWsKaW5k
ZXggY2RiMmU4MWE1Zi4uODJjNzMzOTA0YiAxMDA2NDQKLS0tIGEvcGFja2FnZS9scGVnL2xwZWcu
bWsKKysrIGIvcGFja2FnZS9scGVnL2xwZWcubWsKQEAgLTYsNSArNiw2IEBACiAKIExQRUdfVkVS
U0lPTiA9IDEuMC4yLTEKIExQRUdfTElDRU5TRSA9IE1JVAorTFBFR19MSUNFTlNFX0ZJTEVTID0g
bHBlZy0xLjAuMi9scGVnLmh0bWwKIAogJChldmFsICQobHVhcm9ja3MtcGFja2FnZSkpCi0tIAoy
LjMwLjIKCg==

--_002_8ef2e2013a5e486034e602157d91b1de0d1ad374cameloroliacom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--_002_8ef2e2013a5e486034e602157d91b1de0d1ad374cameloroliacom_--
