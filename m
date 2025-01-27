Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA43C02188
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 19:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CBC340904;
	Mon, 27 Jan 2025 19:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOPLw_owyPPI; Mon, 27 Jan 2025 19:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CBB7408F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CBB7408F0;
	Mon, 27 Jan 2025 19:00:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CAD60976
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 19:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8D88408F0
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 19:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IvCCmfzI0YmY for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 19:00:30 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::60b;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1A3D0408EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A3D0408EA
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on060b.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::60b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A3D0408EA
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 19:00:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=kn3Dh/NUszFQY9ixjdlhA2gO6CYFAvChb+1Fn6sBF8+Mdo7296bUaxQ4TT73qnkO9SXjR2Ili++qbiSFRuhpGeEzOwi9yS9tyNJ2Rk/7Zs/Zc+I8dDcFeYgdBHFPy4N9T9+zE+HAJHA5fE0JBvKVqeo8jSgK4qHeI8aop2rRCFwQEooHMCgxBNUPjwBn6IM6AtWslrE4LqNOb8+gRt+hqQEtSj/zE+yP8dvLDyP4joecY3B9MF8yV8buyHzJeOCGAV1Pkmg/hZ38Yx7BDr7jqlMf/TquEg2smPLVeJaULAlB1n/Vp7gGHCfO0dqOQFTbi1IZ6XP5Wo8lK/+bleJz1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQBvVVb6GkzhfWyt2Uh6A3as9wvlUTabxZMBJ2oOZ9k=;
 b=O9CqQRfqHhGJ4kWxww4NgBLpDIgJRn4N/zCeSQY+EdFP/qUSlkWzWPF5d3EpZXy8y38x98xUYjOpn0dyOfzRcgKetiG7AShlEtnnuEi+5ag12tJ4EUCr3nMb//ym4x70TgBWD10hpCz/XYIuV8GMH2ExlVVtDKjiooLuIeYZkvEGujfnLefw8n/DFLX+VWqfgfmK/tn29fR6Q0zbvYB4++kS289GkZid0D4aZnD8xi8ax0iz/NTgJ6VZU9ufYBPV9lmTd6oEny/d0ZpM3lR3Au7vBc4rvh2wzXUNdNQglaoYBIuEXaBrvFEkEHGrtzlRKohjR6xExcIPOwAB4iYsuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1018.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:176::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 19:00:23 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%6]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 19:00:23 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Vincent Fazio <vfazio@xes-inc.com>, James Hilliard
 <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, Fiona Klute <fiona.klute@gmx.de>
Thread-Topic: [Buildroot] [External] - Re: [PATCH v2 2/2]
 package/python-emailproxy: new package
Thread-Index: AQHbcF2joT6BU2KgRUaMei6IUFAaD7MqlyJAgABgWAA=
Date: Mon, 27 Jan 2025 19:00:23 +0000
Message-ID: <PH1P110MB160385B98649E2BB575A957A9FECA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20241211191630.1414970-1-bernd@kuhls.net>
 <20241211191630.1414970-2-bernd@kuhls.net> <20241229221255.2138fc09@windsurf>
 <e327553b-93a3-44cc-9b70-48bab7497067@gmx.de>
 <PH1P110MB1603B3EEB73618CFAF45272D9F1FA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <25105903-5086-463e-847b-d4a392f0cbd0@gmx.de>
 <PH1P110MB1603F80585C666F0A6C9336A9F1FA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <048fbeab-8e9c-474f-a8a8-8921c09b26f0@kuhls.net>
 <CADvTj4pBcw1BjMSwjvzKS0ULq2CYu1D40aVZ5hQ5_0gOCbnJRg@mail.gmail.com>
 <PH1P110MB1603A238B985432DAF856CF39FECA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB1603A238B985432DAF856CF39FECA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1018:EE_
x-ms-office365-filtering-correlation-id: 68dbfba1-7433-47b5-c562-08dd3f04da5a
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|13003099007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dytZUzE4ZnZ6anlmNWkybEEwaWF2WW5KSVNScGpLUGdRK0tPUVdCZERhUGV1?=
 =?utf-8?B?Z3Z2UENhT05razhSUHNlc3cyNXNiVkVDVUg3VS84SElPUjduZENLSjVoUis3?=
 =?utf-8?B?aGNrU294dkY5cUNsVEFuRlR0eEZjQ21HZ1ZSbEdnMlJhU3hDSG1KK3grank3?=
 =?utf-8?B?emVGa1lnNU51VUxDdFRYS3ZuZmdzVlRPWTk4d2tZSTRrV0VnZjJQOFltamJr?=
 =?utf-8?B?bENYdEk3Tk1NVGxPWi9VazhGVlpxWVlDSHNkQUVhb2gveDBRRHRzQ0w3d3Qy?=
 =?utf-8?B?R3RaVHI4OFU0dVhpc1VOMG1nMXFNd2ZhU3I5VjBqVW9TZzZOdXRaQXdjREd2?=
 =?utf-8?B?eVZ4UGUwQlRPb09SbTQrVG9pM0NBZVh1dVJDaXpETHUyK2hlZ3duOXhvaEwz?=
 =?utf-8?B?MUhCRURuVGo0OXR6cXFtWC9mZmduMXRJMGY4OFg1bzZQcGVIWVZma1JtMjF4?=
 =?utf-8?B?TjA4aDQwMDBkVVphTGwzRWlBaW5iMWQ5aFdFM2NHa3VrMzVpR2NTSm5UYWti?=
 =?utf-8?B?bjdUM0tqU1h3eXVFdWk2ZE9UTDNPZmVjbkNReHd5UGF6MHNxOTdkcXVrM0dk?=
 =?utf-8?B?eGsxaWdWM1NBSGZGOXZ3R0FtdmJ1cEw5QUVlZ0pqUFZGOUlMUWIyaXZqalBG?=
 =?utf-8?B?blo1bVNodEU2QUR6T2FsTDBGb0FVZENXaDJseGRDdHdUSmcxZ2NvVDN6SmRk?=
 =?utf-8?B?elloTlpGY2U3WHo4WXNEaXlYcGRQRnlzRGtValRyLytvaFFQOUpYZjVtODVE?=
 =?utf-8?B?QVFjb2ZpZU1TRjFGcldLNE0wV202MUNYdEtwREJrTzlrR3UxMGFhNW9KdmV4?=
 =?utf-8?B?MHNrMElMeVZCNXRWMDkvc0EwTFFPbGtzb0lkd1dwbUZqYlBUdGxMVmRad08v?=
 =?utf-8?B?Uys1RXpJbGhUYkZCM2ovc3ZwVUUrcjRrbGlHbWs3QXg2aDNoOVZKdHFFQnN5?=
 =?utf-8?B?MStjaVhjNVVyYUVlUGd1OTJsS2FQWkc0QmxnYThYenFYZEFscnZnNXd6RWlW?=
 =?utf-8?B?NjhEdTVobndhL25YUitNakd6RkhMS1ZtZDR6OWRWdi8rSXdvWWF2UWVvTlkx?=
 =?utf-8?B?SS9JWVZEaVAyOERsYTZsWVJTa1ppQW80cDNFNHdxSGFKcjNDQ2kvSzNzRFpi?=
 =?utf-8?B?ekczTTFNRlBhOTlFT0YrcnhxOFRXNTc5QVg2OTNyTW5sYjd5UWpCclFRdFZt?=
 =?utf-8?B?QmZwNmZOdXJIc1VMV2lCUHkxRTJCR0xCbFk1eTNFNGdUcmdDY0lSZU9IcEVC?=
 =?utf-8?B?elcwRXowbkswaENqaUdjcVd0bFV5MXEwL1JVN2prK2RIb2d0bEg3NE9UM1Ri?=
 =?utf-8?B?UkdDZUo1VmNZWTQ5eHgwSFBXOE1jRzI3Y2o0akZCbmpZcXJSMzdwUGpUdzZ1?=
 =?utf-8?B?VVNSeVZlT0lKZHpCTmpmaVJ3ZTZjODZIcUl0MElXSENLT2UwR1kxYXhyS3JR?=
 =?utf-8?B?RW9jOWY1b1hhTWtuZzJYeXdsaWZaS3FqbFlmVWtQY3VaNmh0MERwUnAybXZU?=
 =?utf-8?B?RUVOVlNMRGNUMmo5SnBaUGx3bzR1Y2VaWU5DYnlIek1YY3hwSFovWHJDeTRa?=
 =?utf-8?B?VlFXZGJ4ZjFKcDVsdVR0N09Bc2RDb1owdmNiZHNUeFFpNkMzbk02RFFDd0FR?=
 =?utf-8?B?TUthSnVydlhMTVJTSlZtNTFvbERvM3FvSDhESmVZMmdsdEl4RFl1ZjlTQVVO?=
 =?utf-8?B?aFNJcTlhYjhCVlJqYmx3Z1BkSTQrV1pqTzExWWI3MVdZeFRaeWMvTW8vNXJK?=
 =?utf-8?B?cVJ4ODFzWWEvNU1nT2JmU3lmTTByY08wY1BoY1ZPOHhRVTF3Z1hKalQxSU01?=
 =?utf-8?B?SVV3UFJEMTIzNTJ4QUxJK2dscnFaRTBlZ2lnQnJpcHoxTFpJWHBuaEFTYWYx?=
 =?utf-8?Q?bd6VnBcHNwXWS?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(13003099007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0s1VmU5Q1BjL3FDWHkxL015d2xIODdoMThKc0l6RUlaYW1sTU5KM29uZ2FK?=
 =?utf-8?B?MG14YU1PYUY1bFBvTyt1dDhHRlpSS3MvQjI2SVljUHFZaWpsMnkwbkhVUzJx?=
 =?utf-8?B?bitETnBPRi9JUm9OcVVTQmk5STBwU2xTWlBuZ2pLazQ2QWUvRElicEc5S3pn?=
 =?utf-8?B?SEdQZU9RSnIzRG1BTmdoV0ViWGxpd0cxS28rbHZmdXRUZ1hCNTRjUkxQdnRI?=
 =?utf-8?B?blRGaVlSdFNycjRnRGYxaEFkOFIyejNzVGJDOWlpZDlXaEd3SDNTc1hyMGZY?=
 =?utf-8?B?ckc0NXpUWGNkZEwxZXV3Ti9VQ2dGMUU4N2wyTU83V3VDTExMVVVhMnd1NWdn?=
 =?utf-8?B?bndjZzgzVVhDNkFRTm5VRnJ3OURqWmhsZ09uMDFDejdZQXpoVEkwRTVmbHdW?=
 =?utf-8?B?Mk00Uk9MdDhyQXVHUENsK1lEU1p4WUl1clE0WEo1amF2aEhCNEw3c3RIODQ3?=
 =?utf-8?B?Y25KQlBIeXZXdm9GZzF6enRmMFhYZFhpaDhLMG03dnpnQi80ZlVpZWRBMXlM?=
 =?utf-8?B?dnNWMWpJYXVSKzdQN0dtdTBjTUo2SlRicnlDcnYzMjdZbVdMWU1wWVAvbllr?=
 =?utf-8?B?dmIycXYvWDBMaisxQXJyWUFvL1JMdlZmVXJva0ZVK2prUGNHTUdzN3kyMGVu?=
 =?utf-8?B?VmZaWWNHOTNrNEdqTzB0bi83ZHpKUTJtQkFkK1NvOWI0N2g0ZGJjbm42R21q?=
 =?utf-8?B?WXpsMnlwN21aUUpoVENyb3BMckRUY0JHbTBLdDlJdzU2eUZ2alRpQ1B2SkZM?=
 =?utf-8?B?Y3JUaEVhYjRYblg3N3kyVkVGeTA1a25RdW9tREFZZFhXVFplSUF2Q2NiMmU5?=
 =?utf-8?B?ai9raXRuTDVWZndGRmMvMzJyRmRIc0F0VCtNeGtzbVRuVXNXc09CdkZOcDNz?=
 =?utf-8?B?WjJkQkRNSWVLWDRHelJ4NWw1S00rOENKVU4rTUtOUmRwTWl3NkNRemdaNTF0?=
 =?utf-8?B?Z2hHdHEzakNGOTRCa3dVQjhwYm5CbnBDU1VzSU5KdURNTm5saHhTbGwwNjBv?=
 =?utf-8?B?OWZEV0UxcXpKRHkzdGlWMU95ZzFyTndSZC96UHZjK1B4YWI5U29OOFhvUEtw?=
 =?utf-8?B?YlVMRS9nTUFGRFN3dGRYYVVQNitNNW5walFYOVFsTGpVMU5mSU8zUFVoT0E0?=
 =?utf-8?B?cjRhK1hXTkNJTDc1TlN5b2tYNThpZjNOOURBN3hFQ3NnMW9pV3FTYXBabVE3?=
 =?utf-8?B?cmFGNjRGbzFUS0I1eFp6R3FaVkpGWXoxb09jK01tVloxQzlhMlFzdStOak4w?=
 =?utf-8?B?Q1hwRGVMUUZDa0ZPT3ptNkpmU0o2V1UvR3QrV29hQnZHbmdYZUY4djZoYStk?=
 =?utf-8?B?R2pud2RxNHFWdVNidEVWMktBSnA5V1IreC95eCttdGNCSnNQeTZlWkx3d2xa?=
 =?utf-8?B?Rm5aZWtHZy9mQUF3b1BqdzNabi81anpuUFA4ZUdYRmczdGtmYkU2UHFldVcv?=
 =?utf-8?B?MGtZdnRqbWRhVCszTC9Cd2RpUE1pVjB2NkFTclJXNFBja3RETWhFNTBTY3JO?=
 =?utf-8?B?djVHdGlka3B3a3hZZ3dXVGtrWVZIdFpTN3VqdmNMbmd4ZTNmR0xENGIzZzZw?=
 =?utf-8?B?VXkxZk5lSUMxWE4xZW1VRTcxaTVUd2Exa25URjFXckZ0QzU5dG1zcjNMNTZ3?=
 =?utf-8?B?K05XNTVnN0ljL3RFM3NLcFBnMStJNUFuVlEzMGNyVW9CaTRUMFhudjgvY0ZF?=
 =?utf-8?B?ZmxPNGkvZUVGUnJnRC9ISHR0U2UyaTVvcHU3YUhuUHNVanc2Y0lCTDFOYW1z?=
 =?utf-8?B?SmZ2Wk9QOUtZa2ZscTNIdFA4b2FNSkJoV3BsZEVXMVM2bDJjTmVUMEZDUWJh?=
 =?utf-8?B?WTBMeHNKOFhPbElkV3hNcWtTVDVmQ2VqaDZQVW5oTXZuRFBDUFVVSjdTcnow?=
 =?utf-8?B?MjFoR01EL0lOemNEeFNhTXVCWmNCV0NIbytvNjZaMm04RzBFOUluUTQzSkVE?=
 =?utf-8?B?bTE4QjRHSTNUNjlqeEFJNGx2TFJ0amRDZUJBV1h0VHBHN2h5R0JvQTI0azIy?=
 =?utf-8?B?aksxQTlkbnlRPT0=?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 68dbfba1-7433-47b5-c562-08dd3f04da5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 19:00:23.2175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1018
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQBvVVb6GkzhfWyt2Uh6A3as9wvlUTabxZMBJ2oOZ9k=;
 b=5xNGt2QH7qFDfYc2kVfoMFDwQKQiDOppvzGb0CXDZw+lL57FpfS3nYvxMcvsJGRkEQVK6FVEKIVQW1nteZ5XRNUopk7UNEOoepp9Fnk+q/RoC9ZpOz/NETM1ACIEm5q2Lczd/shtbCI1Sno6RFBNwqStpNDxW4oesZwBhCIAVJ/DCTPf3KHKBNO+dIlFjj9nR3MjJ0HMQ5dvZGZ/vIGdDEuwD+LLo1Se1FS77PZU7WCXu92FDBkx61EXdU8V0X6FeHH2WxvfH0DJlv3iSd4knRGUyO3kbplNl4ZDJDreovZARogLe/g5AMr2t5Gtmlopjt28/fiykjVvBeUcis6tag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=5xNGt2QH
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - Re: [PATCH v2 2/2]
 package/python-emailproxy: new package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYnVpbGRyb290IDxidWls
ZHJvb3QtYm91bmNlc0BidWlsZHJvb3Qub3JnPiBPbiBCZWhhbGYgT2YgVmluY2VudA0KPiBGYXpp
bw0KPiBTZW50OiBNb25kYXksIEphbnVhcnkgMjcsIDIwMjUgNzoxMCBBTQ0KPiBUbzogSmFtZXMg
SGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+OyBCZXJuZCBLdWhscw0KPiA8YmVy
bmRAa3VobHMubmV0Pg0KPiBDYzogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBi
b290bGluLmNvbT47DQo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnOyBGaW9uYSBLbHV0ZSA8Zmlv
bmEua2x1dGVAZ214LmRlPg0KPiBTdWJqZWN0OiBSZTogW0J1aWxkcm9vdF0gW0V4dGVybmFsXSAt
IFJlOiBbUEFUQ0ggdjIgMi8yXSBwYWNrYWdlL3B5dGhvbi0NCj4gZW1haWxwcm94eTogbmV3IHBh
Y2thZ2UNCj4gDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZy
b206IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPg0KPiA+IFNlbnQ6
IFN1bmRheSwgSmFudWFyeSAyNiwgMjAyNSA3OjQ5IFBNDQo+ID4gVG86IEJlcm5kIEt1aGxzIDxi
ZXJuZEBrdWhscy5uZXQ+DQo+ID4gQ2M6IFZpbmNlbnQgRmF6aW8gPHZmYXppb0B4ZXMtaW5jLmNv
bT47IFRob21hcyBQZXRhenpvbmkNCj4gPiA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT47
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnOyBGaW9uYSBLbHV0ZQ0KPiA+IDxmaW9uYS5rbHV0ZUBn
bXguZGU+DQo+ID4gU3ViamVjdDogUmU6IFtCdWlsZHJvb3RdIFtFeHRlcm5hbF0gLSBSZTogW1BB
VENIIHYyIDIvMl0NCj4gPiBwYWNrYWdlL3B5dGhvbi0NCj4gPiBlbWFpbHByb3h5OiBuZXcgcGFj
a2FnZQ0KPiA+DQo+ID4gT24gTW9uLCBKYW4gMjcsIDIwMjUgYXQgMjo1N+KAr0FNIEJlcm5kIEt1
aGxzIDxiZXJuZEBrdWhscy5uZXQ+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IEhpIFZpbmNlbnQsDQo+
ID4gPg0KPiA+ID4gQW0gMTMuMDEuMjUgdW0gMjA6Mzggc2NocmllYiBWaW5jZW50IEZhemlvOg0K
PiA+ID4gPg0KPiA+ID4gPiBJZiB3ZSB3YW50ZWQgdG8gcmVseSBvbiBzZXR1cHRvb2xzJyBkZXBl
bmRlbmN5IHJlc29sdXRpb24sIHdlIG5lZWQNCj4gPiA+ID4gdG8gcmVtb3ZlIHRoZSBgLS1uby1p
c29sYXRpb25gIGZsYWcgaW4gdGhlIGJ1aWxkLCBvdGhlcndpc2UgaXQNCj4gPiA+ID4gYXNzdW1l
cyB0aGUgZGVwZW5kZW5jaWVzIGFyZSBhdmFpbGFibGUgd2l0aGluIGhvc3QtcHl0aG9uICh3aGlj
aA0KPiA+ID4gPiBpcyB3aHkgdGhlIGhvc3QgcGFja2FnZXMgYXJlIG5lY2Vzc2FyeSkuIEkgdGVz
dGVkIGRyb3BwaW5nIGAtbmANCj4gPiA+ID4gZnJvbSB0aGUgYnVpbGQgY29tbWFuZCBhbmQgaXQg
d29ya2VkIE9LLiBJJ20gZ3Vlc3Npbmcgd2UgZG8gdGhpcw0KPiA+ID4gPiBzbyB0aGF0IEJSIGlz
IGFuIGlzbGFuZCBhbmQgc2VsZi1jb250YWluZWQuDQo+ID4gPg0KPiA+ID4gdGhhbmtzIGZvciB0
aGUgaGludC4gWWVzLCByZW1vdmluZyAiLW4iIGZyb20NCj4gPiA+IFBLR19QWVRIT05fUEVQNTE3
X0JVSUxEX0NNRCBmaXhlcyB0aGUgYnVpbGQgb2YgcHl0aG9uLWVtYWlscHJveHkNCj4gPiBidXQN
Cj4gPiA+IGJyZWFrcyBkb3plbnMgb2Ygb3RoZXIgcHl0aG9uIHBhY2thZ2VzLiBBZGRpbmcgIi1u
IiB0byBfQlVJTERfT1BUUw0KPiA+ID4gb2YgdGhlc2UgcGFja2FnZXMgZml4ZXMgdGhlbSBidXQg
aXQgd2lsbCByZXF1aXJlIGxvdHMgb2YgcGF0Y2hlcy4NCj4gPg0KPiA+IFllYWgsIHNvIEkgZG9u
J3QgdGhpbmsgcmVtb3ZpbmcgLW4gaXMgdGhlIGNvcnJlY3QgYXBwcm9hY2ggaGVyZSBzaW5jZQ0K
PiA+IHdlIHdhbnQgdG8gbWFuYWdlIGFsbCB0aGUgYnVpbGQgZGVwZW5kZW5jaWVzIGFzIHBhcnQg
b2YgYnVpbGRyb290Lg0KPiA+DQo+IA0KPiBTb3JyeSBJIHdhc24ndCBjbGVhciBoZXJlLCBJIHdh
cyBub3QgYWR2b2NhdGluZyB0aGF0IHdlIHJlbW92ZSB0aGlzLCBJIG9ubHkgZGlkDQo+IHRoaXMg
YXMgYSB0ZXN0IHRvIHByb3ZlIG91dCB0aGF0IHdhcyB3aGF0IHdhcyByZXF1aXJpbmcgdGhlIGhv
c3QgZGVwZW5kZW5jaWVzDQo+IA0KPiA+ID4NCj4gPiA+ID4gSWYgd2Ugd2FudGVkIHRvIGF2b2lk
IHRoZSBob3N0IGRlcGVuZGVuY2llcywgd2UgY291bGQganVzdCBwYXRjaA0KPiA+ID4gPiB0aGUg
cHlwcm9qZWN0IHRvIGhhcmRjb2RlIHRoZSB2ZXJzaW9uIGFuZCBub3QgcmVseSBvbiBzZXR1cHRv
b2xzJw0KPiA+ID4gPiBkeW5hbWljIGF0dHJpYnV0ZSByZXNvbHV0aW9uLCB0aG91Z2ggaXQgbWln
aHQgYmUgYmVzdCB0byBkbyB0aGlzDQo+ID4gPiA+IG9uIHRoZSBsYXRlc3QgdGFnIGFuZCBub3Qg
MjAyNC45LjEyPw0KPiA+ID4gRGlkIG5vdCB0ZXN0IGl0IHlldCBidXQgd291bGQgc3VjaCBhIHBh
dGNoIGJlIGFjY2VwdGVkIGJ5IGJ1aWxkcm9vdA0KPiA+ID4gd2l0aG91dCBzZW5kaW5nIGl0IHVw
c3RyZWFtPw0KPiANCj4gSU1PLCBzaW5jZSB0aGlzIGlzIGEgcmVxdWlyZW1lbnQgb2YgdGhlIEJ1
aWxkcm9vdCBidWlsZCBzeXN0ZW0sIGl0J3MgZmluZSB0byBhZGQgYQ0KPiBwYXRjaCBmb3IgdGhp
cyB3aXRoIHRoZSB0cmFpbGVyIFVwc3RyZWFtOiBOL0ENCj4gDQo+IFdlIGp1c3QgaGF2ZSB0byBk
ZWFsIHdpdGggcmVwYXRjaGluZyB3aXRoIGV2ZXJ5IHJlbGVhc2UgKGhlbmNlIG15IHN1Z2dlc3Rp
b24NCj4gdG8gc3RhcnQgd2l0aCB0aGUgbGF0ZXN0IHRhZykNCj4gDQo+ID4NCj4gPiBXYXMgdGhp
cyBhIGJ1ZyBpbiB0aGUgc2V0dXB0b29scyBhc3QgcGFyc2VyIG1heWJlPyBUaGVzZSBkeW5hbWlj
DQo+ID4gYXR0cmlidXRlIHJlc29sdmVycyB1c3VhbGx5IHRyeSBhc3QgcGFyc2luZyBmb3IgdmVy
c2lvbnMgYW5kIGZhbGxiYWNrDQo+ID4gdG8gdHJhZGl0aW9uYWwgaW1wb3J0cyBvbmx5IGlmIHRo
ZSBhc3QgcGFyc2luZyBmYWlscy4NCg0KQXBwYXJlbnRseSwgcGFydCBvZiB0aGUgcHJvYmxlbSBp
cyB0aGF0IEFTVCBwYXJzaW5nIGV4cGVjdHMgdGhlIGF0dHJpYnV0ZSB0byBiZSBhIGZpeGVkIHN0
cmluZyBhbmQgbm90ICJjYWxjdWxhdGVkIg0KDQpUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwg
bGFzdCk6DQogIEZpbGUgIi9tbnQvZGV2ZWxvcG1lbnQvZW1haWwtb2F1dGgyLXByb3h5L3ZlbnYv
bGliL3B5dGhvbjMuMTAvc2l0ZS1wYWNrYWdlcy9zZXR1cHRvb2xzL2NvbmZpZy9leHBhbmQucHki
LCBsaW5lIDE5MSwgaW4gcmVhZF9hdHRyDQogICAgcmV0dXJuIGdldGF0dHIoU3RhdGljTW9kdWxl
KG1vZHVsZV9uYW1lLCBzcGVjKSwgYXR0cl9uYW1lKQ0KICBGaWxlICIvbW50L2RldmVsb3BtZW50
L2VtYWlsLW9hdXRoMi1wcm94eS92ZW52L2xpYi9weXRob24zLjEwL3NpdGUtcGFja2FnZXMvc2V0
dXB0b29scy9jb25maWcvZXhwYW5kLnB5IiwgbGluZSA4NywgaW4gX19nZXRhdHRyX18NCiAgICBy
YWlzZSBBdHRyaWJ1dGVFcnJvcihmIntzZWxmLm5hbWV9IGhhcyBubyBhdHRyaWJ1dGUge2F0dHJ9
IikgZnJvbSBlDQpBdHRyaWJ1dGVFcnJvcjogZW1haWxwcm94eSBoYXMgbm8gYXR0cmlidXRlIF9f
cGFja2FnZV92ZXJzaW9uX18NCg0KDQpBbHNvLCB0aGUgc2V0dXB0b29scyB2ZXJzaW9uIHJlcXVp
cmVtZW50IGlzIGluY29ycmVjdCwgdGhlIHB5cHJvamVjdC50b21sIGlzIGRlZmluZWQgd2l0aCBm
ZWF0dXJlcyBpbnRyb2R1Y2VkIGluIDYyLjYuMDoNCmh0dHBzOi8vc2V0dXB0b29scy5weXBhLmlv
L2VuL3N0YWJsZS9oaXN0b3J5Lmh0bWwjdjYyLTYtMA0KDQpJdCBjb3VsZCBiZSBhcmd1ZWQgdGhh
dCB0aGUgdXBzdHJlYW0gcGFja2FnZSBjb3VsZCBiZSAiZml4ZWQiIHRvIG5vdCByZXF1aXJlIGNy
eXB0byBvciBhc3luY2NvcmUvcHlhc3luY2NvcmUgYXMgYSBidWlsZCBkZXAgaWYgdGhleSBqdXN0
IGhhcmRjb2RlZCB0aGUgYXR0cmlidXRlIGluc3RlYWQgb2YgaW50ZXJwcmV0aW5nIGl0IGZyb20g
YF9fdmVyc2lvbl9fYCBzbyB0aGUgZHluYW1pYyBhdHRyaWJ1dGUgY291bGQgbGV2ZXJhZ2UgdGhl
IEFTVCBpbnN0ZWFkIG9mIHRyeWluZyB0byBpbXBvcnQgdGhlIG1vZHVsZS4NCg0KVGhlaXIgcHlw
cm9qZWN0LnRvbWwgZG9lcyBjb21wbGFpbiB0aGF0IGl0J3MgbmVjZXNzYXJ5IGFuZCBpbXBsaWVz
IHRoZXkgZG8gbm90IGxpa2UgdGhpcyBjdXJyZW50IGJlaGF2aW9yIHNvIG1heSBiZSBhbiBlYXN5
IHNlbGwuDQoNCj4gDQo+IEkgd2FzIGdvaW5nIHRvIHN1Z2dlc3QgdGFsa2luZyB0byB0aGUgc2V0
dXB0b29scyBncm91cC4gSSBoYXZlbid0IGxvb2tlZCB0b28NCj4gY2xvc2VseSBpbnRvIHRoaXMu
DQo+IA0KPiBJdCB3b3VsZCBvYnZpb3VzbHkgYmUgaWRlYWwgaWYgaXQganVzdCBsb29rZWQgYXQg
dGhlIEFTVCBhbmQgZGlkbid0IHRyeSB0byBsb2FkDQo+IGV2ZXJ5dGhpbmcgZnJvbSB0aGUgbW9k
dWxlLg0KPiANCj4gDQo+IA0KPiA+DQo+ID4gPg0KPiA+ID4gUmVnYXJkcywgQmVybmQNCj4gPiA+
DQo+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
PiA+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdA0KPiA+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcNCj4gPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0DQo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnDQo+
IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
