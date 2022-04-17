Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C9DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Apr 2022 06:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 472AF410B6;
	Sun, 17 Apr 2022 06:50:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tL7u5p27zaGD; Sun, 17 Apr 2022 06:50:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAF8240A00;
	Sun, 17 Apr 2022 06:50:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E86C11BF3FC
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 06:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3BD8408AE
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 06:50:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qvwHEF9_6EIO for <buildroot@lists.busybox.net>;
 Sun, 17 Apr 2022 06:50:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::627])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE2A2400D0
 for <buildroot@buildroot.org>; Sun, 17 Apr 2022 06:50:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJd6Pz0rQpTz9g108SE/4x45UL8Kmt76o0W5siNTPGDkeqFH+Sy//dFwaCEmF/8uHdhqDltJ4dITYBwVGa190JHvy3M9Kjn41Rlol+Iqg6yyu45uUVu0cjyzFnUVtda4y3JHANCts+jM7H1YUcmSfa+VHv0vqwnTRIFBIYveTCYUomojdUrxT3vXEIi1jIuukCVpIGSxZpULcAwUzMNNo5jaRClnys7OQV9eyBDMLmX/JQg3sRzmR9RNp7Af09JymrA5iGQPSoN7q6TtAlBlmjTk6NGj7upDFw0jQxtEsjXE642W1cPkhjxi4cYqsUCyuNhYhVs5cpidqoxU8qBQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuS3zo/CNYoyOUMuoxiGb7teG8se3sViuAP9MIV9td4=;
 b=gACeP+rjEc9cDaGjDJc3MIMTbKvG/4WOVetaTUpI7EeITD3Ei9U/d49bOHoMilKmxST3X4U7A54APF1lS6oCRahAjOyaguaFsIn72ODdDRZG2v4/eQUGB6zIHq7RJpNRMSDknJ54r/PCrCq68H3CQkj97c+sh+J8z7lgByVd2dgvFH31si07n5Vf9s/EkxWgKPsbvmYAoZW9s5c6Y75819DmgZo74A+DYqhglmMndo9Eh5H/VeDXILK7QE7RWBoer3yxSABqY10bbF5WYcnMZk5m6nkekuPT2LsJweAgN8NdTZ08c5TOf2fXLBieIX/T3FpUjC6jMc/cAbgr9KOFUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuS3zo/CNYoyOUMuoxiGb7teG8se3sViuAP9MIV9td4=;
 b=pQSk/a1k8fUy+u7B5dkppT8SF/xyt3MPg3UkLyaz+zKrSuD9Z5RlNpnd3QJZlFt2Be3KOpoaxNN8S9z3YWH9ZDu8+BCU4+G8TNgrZWA3DYlk362DYirYRkMefHjpZQG7YpXR2EiZBYfFIFAcsk+mbuHyWDvcgY6sTdYV2E8Zlk0=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by SN6PR02MB5248.namprd02.prod.outlook.com (2603:10b6:805:76::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Sun, 17 Apr
 2022 06:50:12 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::61ac:c1e9:f4ec:156c]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::61ac:c1e9:f4ec:156c%4]) with mapi id 15.20.5164.025; Sun, 17 Apr 2022
 06:50:12 +0000
From: Neal Frager <nealf@xilinx.com>
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: Xilinx KV260 Support
Thread-Index: AdhOT7R9yeLH/m23RF2Ss8U5bJOKdwDfxEMBABYnV9Q=
Date: Sun, 17 Apr 2022 06:50:12 +0000
Message-ID: <EC86C191-5390-4082-9B9F-896268B5345C@xilinx.com>
References: <SJ0PR02MB77589C6E412691B171FB0527D7ED9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <87ee1w7pjg.fsf@dell.be.48ers.dk>
In-Reply-To: <87ee1w7pjg.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 006ba5be-a09f-4ec0-edea-08da203e858a
x-ms-traffictypediagnostic: SN6PR02MB5248:EE_
x-microsoft-antispam-prvs: <SN6PR02MB52484EB69BAD813DF248A9D1D7F09@SN6PR02MB5248.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VnYizsVXJOmDHxVTFmieKOuyTxyxpBIiFsae+q+P1DG7ThrYZItCL9llpG4z3IVhafYL0F5S9Lb2EmmI1Se2p93cW5Q1DIGyESGc6+kOcaC/H2irl2ti5E27kPpsu5cHVExu9kpTFs/J3naXgEegPa1LDsMd+qZs7UpdSn9NmZPycRTaMsOpe7KNL6ytsDHPl1MXSr6rym8NI3V3VQIb4KjBRwlpSpUx658XIc1HxrcTEXSooMuHT9fxEMwjzRQE6Ez21nP49Ou5ie8ifnck2d+OsRqPBnhqYz9OKb+OkMRwDGEvrok8FlEW9oHOKpGPsTduhk9jSzu5hyWwpXLGbk02odEQrVQpu2MTZhTWMLS5gz6/6YyG1fNRxFvFVJtxIBp9jPl7RD84akLrTApegSNDUOJL1D2blvwn6dw3LnYSrapjwSEiuKXV3ElmnQ8miqPtr+pwm4sykeiDSR15IbAYKhTVl6gZhrlf1u50GZ2ilqrDrlxBELGZbU7/bmwYl7/1gwmSjxT3wPEXKemeDXeIqUJEbaTGgmFvm+hVQ6WS8KSY9y/Wus0HEf3kKh/f64ePhOm4q4WYS4CHvlBkPuwcL1XZZQ+kXFMTFhY1JfWko4uUDASWd6uKBHuxMPhPDjmAcc+xPIK8BKy+jLPeKoHu1T8adHtCgg02gstudLUQ7NRU3j6026eROyoLRWXs0jvKY0pXcPwZ6gvJhAQk0MHfDvM+Z29SnaR2p96SWsUt86IlKqUuyN2PUaputnY6G966aUzCc22lSNuEANiymGgIZHbVFhHatwqOCu++cXHCM8FyBiAC0SiAc5Rn4Tm9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(2906002)(508600001)(316002)(6486002)(966005)(7116003)(36756003)(38070700005)(5660300002)(86362001)(8936002)(71200400001)(66476007)(4326008)(66556008)(66946007)(66446008)(8676002)(76116006)(64756008)(122000001)(38100700002)(6916009)(66574015)(33656002)(83380400001)(6512007)(2616005)(26005)(186003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MS9PSlh0aUtoaWRSQzZvRm5ZRjA3T0RzUHJvUFBEVXZLSXZvNjlpZlUxeXlz?=
 =?utf-8?B?R3FtK1NxaWkrQldzUVhVd3p3TjRaUENCYzZrck5GNi80T1B2QTRKK1YrMGlx?=
 =?utf-8?B?UXk5blFkSFNGdTZLbGFJTXg5MmR6c3ZGYlhxd2tvMFhIcjZidFphSHFrb01w?=
 =?utf-8?B?MWdjK1o3am8vdEhQcE5CWlNSVkI5QjdOSms2R1crUDdla0hKdWNKMUNEOW5E?=
 =?utf-8?B?Mm5qNGU5WFBMMjhNeml4bThkQURkSFhPMjRKSmxBajRjWTdHc3lxeW8wbk52?=
 =?utf-8?B?d2hUTzhkUzRsODh3Wm5VanY3eDFJNWp4YmlaSEtqVGZwS2VOUlI4ZDVYc1E3?=
 =?utf-8?B?S0FYSzE0bU5BYlZHbkJpQTVBaE9pKytJajhFTUxzN0lrK2tRNUVBOW1VSXhQ?=
 =?utf-8?B?a0kzekVIT2V1Q1Nqbkx0OCtTdnVSb3lvVElibXRuM1Q4bUJyaFhFaFQ1K2hs?=
 =?utf-8?B?amxjU29icUR6WDBtb3J5bTNnZ3hMUktrSjgyWkhSVzUySE9oSm5CSDJZRTNi?=
 =?utf-8?B?blFQcHc0SWkyb0U4MEp0dC9kVnp3Y2Z1RzNERmlaazFtcHRpK1MyR1lmYmFa?=
 =?utf-8?B?ZkJzOTQvNENUSVIvTW9aZWllQXNJZjFIRGxaVHdOODBqbE5hamdML1EzZ2tF?=
 =?utf-8?B?QWNxSDE5UHFuZTM4SS9mWjZCSzdIU3llNHY1dmJtUW9SREQxbDI5akdrejQ3?=
 =?utf-8?B?RlhjbzRmelpZM3ZkRmU0UW05YlREM1l5Y0cxbzI5Q0ppSkRjRWcxcm1kcTBy?=
 =?utf-8?B?b3VCSEoxZmh1ZXJ0bVdBaXUwVks0QlZwaGNSL2ZERTk5RXJGMkl3T0JNeUZO?=
 =?utf-8?B?SkJJWUtKUjd1cmtoeG1SQ1FlbUtDdzVBeGpnc0o1VE1MMG56elF2Q2pGeS9H?=
 =?utf-8?B?WHhVWlVHWFRkZzVUbG5VU09hN0toVHZmUjJiaTVxbVN1NU1IQ3QrSFo2UTlu?=
 =?utf-8?B?S0RrNjA0YmNpaUZwQUNxRmtRbXJXR2t0aWJyZGt4b2JnTStEOGtyMmZVTEpE?=
 =?utf-8?B?WWl5WmF0bU1IblBRMS9SRUNBK3NBUi9zZVpKSmZJNUFwclZPNm1pbEIxVXZG?=
 =?utf-8?B?Q3V5VFY1bWQzNkpmQjk2L0dwaTlYLzArajlsY0JOY1drNkNiMUVkUVZjOEt5?=
 =?utf-8?B?MGY0aHFHWGVFYk5CVE00cE9VeitMdkFPUzdhWUVUc25JMXhjRk1GbGpoMElk?=
 =?utf-8?B?SVJVMVpCL2krYjFySFJLZlIzUXdsYk5QUkorcHlXZlc0Z0dIYzVGeXNSOHh5?=
 =?utf-8?B?NDlCZGdjQzNmMGw1eWprSG5CWVlkbkhybGNVRE01bnM0aFhicnlLYVJUQ3hU?=
 =?utf-8?B?NGcvYUhvTEp2cHVFL0pIZGd4K0JScXIwRTlFQ3cxYWFFTXhrQ1JER0RNWjM4?=
 =?utf-8?B?NFYwUzRkNlZEeEFBYTJjL3gxNlE2ZGFHRkFPMHdFYXFNbmdKbjZTNHFtNlBi?=
 =?utf-8?B?aC9VYlVoVVZnZnVJUFF3Nk84Nkd1L1hkYjVaQzcvdFZTYlhMaFR1VUpTeHF1?=
 =?utf-8?B?aVNOTUcreDdSNnltZ2U1TXZyRmpHYTVGYW5BK28wTFM2WWc5M1g5ZUFFaVpJ?=
 =?utf-8?B?V3Y3SWlvVGRhQ0I5L2c1bTNnN0puYk8wR1RpQUd4NS84MjFCR3FoTDdJNGMv?=
 =?utf-8?B?V1Z2WlhRUUVrQmo1NHNQaXZtYU8yUVdNcFo4OUwraG9Mc0NrWkpsTkIrazdj?=
 =?utf-8?B?VmdKaCtQMEU0TXVHTEpBbEFsc0M2bXNqdFQ2blNKNEtaTjdMWTZrKzNnV21n?=
 =?utf-8?B?azlRQ3d3eXMzUlg3anFWUG5GelJRS1lRN2hCeG5hS2dyYnR5akxXU3gwcDhS?=
 =?utf-8?B?bDBvdlR6S0w1Zmg0LzhNSGMza3p0c2tGR0VNYm1naGVHZjh6QnVDcGIySGxV?=
 =?utf-8?B?VUQxSThYTjIzcDdseDdiSThEclo2dEtnLzlMYWlCTEVqdEJUdlh1MWF0L25O?=
 =?utf-8?B?bkd3clFWUVlZVCt1dnE1cmh6U3B1K0RPMFhYUm1uNnR0UXFVUVl5UkZRbzNv?=
 =?utf-8?B?anN0WVBnQUI1UVM0QVFvK1ZFN3ZiaDAxSkhmNUU1OVY2K1A0cURoeVJyUmtK?=
 =?utf-8?B?blV3Mzk1SjY4bHUwcWtwTlJmTWFYcDhXVzhRSktUWW5peXlQNVQvd3IwZTBh?=
 =?utf-8?B?NFE5cTB5RjdvQ3hEV1c1RjNYZFF2a2NaU1J1NnFPeStJeWhvZWJOYUFUbU1s?=
 =?utf-8?B?SG1NckxlVjUvdGZFd0hiNU1LMWhqN21YK2lIK3F1ejRpQU1TVmdiMGFsbHZh?=
 =?utf-8?B?QkR0d1F4OHhvdVpVb3JHZi9WcmtqVjM4WXZqYWpmb0FpeG9WcWFzK3Y1V1l1?=
 =?utf-8?B?eERRN2xRVFJTZkRUMkZpRXJWdXFLT2VJLytnYjV3amxtZ3A5NTFLQT09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 006ba5be-a09f-4ec0-edea-08da203e858a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2022 06:50:12.5788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZdFuB3P9Zj3q3+/oWLyqWby2ULeUG3Zc7H0ppnjtO6ufPyM1FVPCQBhSfRlbR3LA1MuFI6HKrCAUf425+wII+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5248
Subject: Re: [Buildroot] Xilinx KV260 Support
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsDQoNCj4gTGUgMTYgYXZyLiAyMDIyIMOgIDIyOjE1LCBQZXRlciBLb3JzZ2FhcmQg
PHBldGVyQGtvcnNnYWFyZC5jb20+IGEgw6ljcml0IDoNCj4gDQo+IO+7v0NBVVRJT046IFRoaXMg
bWVzc2FnZSBoYXMgb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gUGxlYXNlIHVz
ZSBwcm9wZXIganVkZ21lbnQgYW5kIGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBj
bGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZyB0byB0aGlzIGVtYWlsLg0KPiANCj4gDQo+Pj4+
Pj4gIk5lYWwiID09IE5lYWwgRnJhZ2VyIDxuZWFsZkB4aWxpbnguY29tPiB3cml0ZXM6DQo+IA0K
Pj4gRGVhciBidWlsZHJvb3QgY29tbXVuaXR5LA0KPj4gSSBhbSB3b3JraW5nIG9uIGFkZGluZyBh
IGRlZmNvbmZpZyBmb3IgdGhlIFhpbGlueCBLVjI2MCBTdGFydGVyIEtpdC4NCj4+IEl0IGlzIGEg
bG93IGNvc3QgenlucW1wIGRldmVsb3BtZW50IGtpdCBzaG93Y2FzaW5nIHRoZSBmaXJzdCBYaWxp
bnggS3JpYSBLMjYgU09NIG1vZHVsZS4NCj4+IGh0dHBzOi8vd3d3LnhpbGlueC5jb20vcHJvZHVj
dHMvc29tL2tyaWEva3YyNjAtdmlzaW9uLXN0YXJ0ZXIta2l0Lmh0bWwNCj4gDQo+IExvb2tzIG5p
Y2UhDQo+IA0KPj4gSSBoYXZlIG1hbmFnZWQgdG8gZ2V0IGJ1aWxkcm9vdCB1cCBhbmQgcnVubmlu
ZyBvbiB0aGUgaGFyZHdhcmUsIGJ1dCBJIGN1cnJlbnRseSBuZWVkIHRvIGltcGxlbWVudCBzb21l
IG1hbnVhbCBzdGVwcy4NCj4gDQo+PiBIZXJlIGFyZSB0aGUgaXNzdWVzIEkgbmVlZCB0byBzb2x2
ZS4gIEJvdGggYXJlIHJlbGF0ZWQgdG8gYSBkZXZpY2UgdHJlZSBvdmVybGF5Lg0KPiANCj4+IDEu
IEluc3RhbGwgdGhlIHp5bnFtcC1zY2sta3YtZy1yZXZCLmR0Ym8gdG8gdGhlIG91dHB1dC9pbWFn
ZXMgZGlyZWN0b3J5Og0KPj4gQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9InhpbGlu
eC96eW5xbXAtc20tazI2LXJldkEgeGlsaW54L3p5bnFtcC1zY2sta3YtZy1yZXZCIg0KPj4gQlIy
X0xJTlVYX0tFUk5FTF9EVEJfT1ZFUkxBWVNfU1VQUE9SVD15DQo+IA0KPj4gSSBuZWVkIHRoZSBi
dWlsZCBzeXN0ZW0gdG8gaW5zdGFsbCB0aGUgenlucW1wLXNtLWsyNi1yZXZBLmR0YiBhbmQgdGhl
DQo+PiB6eW5xbXAtc2NrLWt2LWctcmV2Qi5kdGJvIGZpbGVzIHRvIHRoZSBvdXRwdXQvaW1hZ2Vz
IGRpcmVjdG9yeS4NCj4+IEkgaGF2ZSB0cmllZCB0aGUgQlIyX0xJTlVYX0tFUk5FTF9EVEJfT1ZF
UkxBWVNfU1VQUE9SVCBvcHRpb24gYWJvdmUsIGJ1dCBJIGRvIG5vdCBzZWUgaG93IHRvIGdldCB0
aGUgenlucW1wLXNjay1rdi1nLXJldkIuZHRibw0KPj4gSW5zdGVhZCBvZiB0aGUgenlucW1wLXNj
ay1rdi1nLXJldkIuZHRiLg0KPiANCj4gQXJlbid0IHRoZXkgZXF1dmFsZW50PyBFLkcuIHRoZSBv
bmx5IGRpZmZlcmVuY2UgYmV0d2VlbiBhIG5vcm1hbCAuZHRiDQo+IGFuZCBhIC5kdGJvIGlzIGFm
YWlrIHRoYXQgZHRjIGlzIGV4ZWN1dGVkIHdpdGggdGhlIC1AIGFyZ3VtZW50LCB3aGljaCBpcw0K
PiB3aGF0IEJSMl9MSU5VWF9LRVJORUxfRFRCX09WRVJMQVlTX1NVUFBPUlQgZG9lcy4NCj4gDQo+
IA0KPj4gMi4gQXBwbHkgdGhlIG92ZXJsYXkgdG8gZ2VuZXJhdGUgYSBzeXN0ZW0uZHRiIGluIHRo
ZSBwb3N0LWltYWdlLnNoOg0KPiANCj4+IEkgYW0gY3VycmVudGx5IHVzaW5nIHRoZSBmb2xsb3dp
bmcgY29tbWFuZCB0byBnZW5lcmF0ZSB0aGUgc3lzdGVtLmR0YiB0aGF0IEkgbmVlZCBmb3IgYm9v
dGluZzoNCj4+IGZkdG92ZXJsYXkgLW8gb3V0cHV0L2ltYWdlcy9zeXN0ZW0uZHRiIC1pIG91dHB1
dC9pbWFnZXMvenlucW1wLXNtLWsyNi1yZXZBLmR0YiBvdXRwdXQvaW1hZ2VzL3p5bnFtcC1zY2st
a3YtZy1yZXZCLmR0Ym8NCj4gDQo+PiBEb2VzIGFueW9uZSBoYXZlIGEgZ29vZCBpZGVhIGZvciBo
b3cgSSBjb3VsZCBpbXBsZW1lbnQgdGhpcyBpbiBhIGdlbmVyaWMgd2F5IGluIHRoZSBwb3N0LWlt
YWdlLnNoIHNjcmlwdD8NCj4gDQo+IFdoeSBhcmUgeW91IHVzaW5nIGRldmljZSB0cmVlIG92ZXJs
YXlzIGluIHRoZSBmaXJzdCBwbGFjZSBpZiB5b3Ugd2FudCB0bw0KPiBtZXJnZSBpdCBiYWNrIGF0
IGJ1aWxkIHRpbWU/DQo+IA0KPiBMb29raW5nIGF0IHRoZSBEVFMgc3VibWlzc2lvbiBmcm9tIE1p
Y2hhbCwgaXQgc291bmRzIGxpa2Ugc29tZXRoaW5nDQo+IChVLUJvb3Q/KSBzaG91bGQgZG8gdGhl
IGNhcnJpZXIgYm9hcmQgZGV0ZWN0aW9uIGFuZCBhcHBseSB0aGUgY29ycmVjdA0KPiBvdmVybGF5
IGF0IHJ1bnRpbWU/DQo+IA0KPiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAyMS85LzIyLzExNg0K
PiANCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrLiAgWWVzLCBJIGNvbmZpcm0gdGhhdCB0
aGlzIHdvcmtzIGZvciB0aGUgTGludXgga2VybmVsLg0KDQpOb3cgSSBqdXN0IG5lZWQgdG8gZmlu
ZCB0aGUgY29ycmVjdCBzb2x1dGlvbiBmb3IgdS1ib290Lg0KDQo+IC0tDQo+IEJ5ZSwgUGV0ZXIg
S29yc2dhYXJkDQoNCkJlc3QgcmVnYXJkcywNCk5lYWwgRnJhZ2VyDQpBTUQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
