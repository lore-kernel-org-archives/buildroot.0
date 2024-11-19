Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED69D60D1B
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 10:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B0DA8447B;
	Tue, 19 Nov 2024 10:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h__ETxY-t9xy; Tue, 19 Nov 2024 10:22:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5465A85482
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5465A85482;
	Tue, 19 Nov 2024 10:22:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 486F427EB
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 10:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 368C06F62C
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 10:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EiCyHYsDi1Jb for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 10:22:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::613;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EEB226F602
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEB226F602
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::613])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EEB226F602
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 10:22:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9hiEeOSCH1DJKS2t76OoakMsDXOLG7HxMdsIYggSw/SZYhBKL0j0BJF5NTucGEIcCx2qkfZRmReFmf+Gyd3J9SvrUB8FCNTJ+t+/c7nV3w5s+exisvPk4x0GNiN0RT5oQjYaGSK6DVD+cj0r3Qu41j82WcFHqpC8fyEsisTp0Wqo1WsZejTI2id7cu8aZWeFGIPs+Bj8UKZvCBfkASa+3U9x+NLmToiW7dvUVEglPhoA0CPu47RcfarFitY3LC6BshG9LCMo1F9rMKBH2QE9YLK1SlnCDbfvaPi3DxIA9NcToab6Oj1d95K3ji3AFXjk5DKw1M01OfYDV6+omCShg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6KCrcurZYgchwF724LJwnM8b28yoRLZoS5OM8U/VjM=;
 b=MkWS2J95bMlXSoFlhTuHvPoBMOjaGzkslAwXpVLycyh/xfaqXSIDID7K8qOI2zvZyfXn3GMw6E2XPIRrbN8lSE8R2DAmmxxOkHFMGOFgL2Sln7HKTMtgHpODZCs3cs2Lm3LhoE5C5n95Q3THt+lPhX/5YitY0h1Hs/rfKy69Y0RBsApYRBsArEH1HhrhdGALsgwjaWwTwJRw6Y3G6ysUssZFgfdOapny+r/+2pZCLOC5xMtZ+MC0WCgezfcdFsjqu4gWYEDVkyJ9r+/S2GsFxMEPEXuPcDKraXsVugO1BbH5kEj6j0069Pg52OD+nrMrgcV62gJ1u505l7oFhjdXyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 DS7PR11MB6269.namprd11.prod.outlook.com (2603:10b6:8:97::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.22; Tue, 19 Nov 2024 10:22:20 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::3adb:8c97:94da:80]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::3adb:8c97:94da:80%3]) with mapi id 15.20.8158.019; Tue, 19 Nov 2024
 10:22:19 +0000
To: <buildroot@buildroot.org>
CC: <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 0/3] Fixup Update Gateware Feature
Thread-Index: AQHbJGw4c0nK8RTyLk2eugvQf5yxVLKqN50AgBRaKIA=
Date: Tue, 19 Nov 2024 10:22:19 +0000
Message-ID: <c707bc4a02f479becf23d5953daa489d97cd3b83.camel@microchip.com>
References: <20241022102426.220196-1-jamie.gibbons@microchip.com>
 <b942d8f6adfcd6de07b48bd2a1eb16177c7cf10d.camel@microchip.com>
In-Reply-To: <b942d8f6adfcd6de07b48bd2a1eb16177c7cf10d.camel@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|DS7PR11MB6269:EE_
x-ms-office365-filtering-correlation-id: 32db0791-425c-41fa-31e5-08dd08840cae
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Sy9NcUlxdlB6bSt2MWl1aXRaK2tTaG83SkhqT0NVWGdOOWNQZCtBMHN0MmFU?=
 =?utf-8?B?aGxrcEMvYmMwKzVVWHpIVUhHK2dVUHNsV0ZtcTZYWTNyWmNCRFpteW9GYlVO?=
 =?utf-8?B?VDVEVTdIWDBkNi9IaXcvZ1BJMkJJVWQraHVTVlJmOTVPOEluc2VxdkErUG1U?=
 =?utf-8?B?VmFpZVNqb0hzNFE4MFhqdjZyYkxVZTRhRVAySEZCSjBFbGxYcGpzSEZDSjcv?=
 =?utf-8?B?dlZPWXNQSTIrUnloVVpPZTRwVWZ4T1Fsbjh5RFMyN1laZU9VeFVPVVkyWG1J?=
 =?utf-8?B?QnhZM211emllRjBzSXpFNllubHYzNEt4czhmV0RMVU9tZGZyQTUrUHh1K0ox?=
 =?utf-8?B?eDJSbklUdXZsTmN4dURZdExUS09jeFFIalRZVlF5ZGZocjdSZ0tSNlgxWnlV?=
 =?utf-8?B?UXVGVnVYL3UyZktRWGNnMFlBejNDNWpNYWN2OXJZTDg3OEdGdE50dXBsaUVY?=
 =?utf-8?B?eVJVZXFOS0NJVUFUQ2NUQXVRMVBnNXgyNDFobzN0Rmc5Q3Bpb0NJWFJDREhW?=
 =?utf-8?B?YUxOaFlJQjErZVlLc0JlRngwUTlNcG9nNkY2ZENlaW9HbFNXeXA2a2t1MzNY?=
 =?utf-8?B?ZVB1bHN5WHd4c1ZjVHJEQU1tdmNVTXhKMjczT1RQVEpNQ29PT0JIQ0h2Z3ZL?=
 =?utf-8?B?M21zRWsya0tHMEJIMHhnLy92NXI3bVRWK04xL1lTUy9uVk9weFpLV3V1Vm9t?=
 =?utf-8?B?MjNTS0p5SWhJN2IvNWw5YWFobC9pSG5DeGVTOUNQVU83am4yQld0MFBVTWNl?=
 =?utf-8?B?elNtNmFCYmhzVXF4eGZ0c0ZKWDl4NU1GcXdEOUx1bjhlOGNWZ0hKbTBXaGVY?=
 =?utf-8?B?QU1jalM0QSttVWtZakVMTys2YmhxOS95WC91Z3Q3RmVUMDdLRU1kL3JxZHhS?=
 =?utf-8?B?ZmRvMk5wRTBBVTFEWE5ackU5RlRUZHpnWmF4TFQrUnI2SStkMWpzQ2hXSUZu?=
 =?utf-8?B?WWlhWG95c202RDJNRkpoRnQ1U3BtQ3NYeG5PeVBzOEFwUmVhTFgvZWhKbUZR?=
 =?utf-8?B?dmVTMG9UeHE2bUtWSkU5TC85NnRrNE1FNVhqVks0S0lLS1NFUFRXVkIwNjhP?=
 =?utf-8?B?QldEaC9VTWMxVnRoemhwNWpnR1gvdVVwWWM0cjI1WHA4cXRQTWRzeTZEZ1ZK?=
 =?utf-8?B?M243V2hxMVFCMXJ4Z2tUN2tWZHV4SjkrR1B6Y1Q0MFdBVFdiRkQyMWJqeE9n?=
 =?utf-8?B?TW43ZEZmQzEraGRJWDF1TzVhMnlsWUJMYUtUeS9wRlhRK2x1eWo4cUh3ekNS?=
 =?utf-8?B?MUxKYmJ6aGJoT2JKTGlydG5QUm9LUnYydmpzdFFBWGEwUFRxWWVTTkF5K2Z3?=
 =?utf-8?B?UDcyUVRaQUZNQkE5WGxwWFduaFNBYVFvV3RwQzRFUGNIVzNiL0dTbGczeGVy?=
 =?utf-8?B?QUcvMDE2eU9wdFREWEZnMUxFMzJ4eEFwbDJqbDJDdk1ZTkg2QUVKUlc2ajlO?=
 =?utf-8?B?WXd6RCt4VS8va0YxdDdkdzh1d2w2TDNNSXZJUXk1aCtjd0JKZGs5T3hYUWQr?=
 =?utf-8?B?MEQ5c0wybnJBMXRqUmp2d1BkTTFwOGpxNzBxblAzeTh0dzUxc2VyQWdveTRE?=
 =?utf-8?B?NFI1Y0Z0SHM1MjZ2TC82bFovVmxyc2h2d00ySkpSdWt0ZHNDQXUwSHJ2VTJj?=
 =?utf-8?B?ak9CV3ZpTWw0VkJlWTd6akdZa1JHbFhIQmNmWE1hZThWYmRQTGozZ1FuTHNq?=
 =?utf-8?B?OXJMbjJWVm1QVFJHdGluRStlN2VEN0doeGJGdGNpb3JuWHMzN2RMZ2hxSm80?=
 =?utf-8?Q?vn47TU51n4AHrLGVO58PvLyF2LXPXozJVGjrREJ?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzRjWnZndnU0UVNTT1BnQjlaL3ZnSkNoVFp2aEFleVQzbTU4UkFNR29KdnBq?=
 =?utf-8?B?WnVYZUo3Y2xZUGx3aTZqdG1xVTFvMitRUVNJcElMb1hpamg3NmRqekRnV1U3?=
 =?utf-8?B?T0pxMkpBenVmM0Y1eHYxS1J0MjZ4b3BtZmxMZ2FTazRrbFNrRHJhUU1UYk9w?=
 =?utf-8?B?dVZEcVB3ZXNYNjN6UHc5SDhhdkUrbFRqT1NibjVMMnExSTkwNVR4VnFCWDhy?=
 =?utf-8?B?YWJabGx1cHRkYjY5WGRjSWJCeHB2M20wZURLTnR4WjlOczZnb2dua2kxMGhC?=
 =?utf-8?B?Tno0N2lqd0Q0eGVlK2hrWmF2a0R4MnZ4NC9XWmQzOW9VZjVXaGtBM2hRbWk2?=
 =?utf-8?B?ZHZlRERGVGJrYmIxYzRtVlFiVyt2a0t6ZG50ZWZEOWxhY1Z5WURsUVd4MThC?=
 =?utf-8?B?dWE4dWRlNVJzb1E4YjNaQUJoMFg1Wnc3WkRRcW0yQUt0U0xKS1U1M2JMYWJa?=
 =?utf-8?B?OXFyNVUvUGxrS1JRVFlxdHJvVFM4NTQ4azZBU1dxR2oyczVCWkliaVJnM3lk?=
 =?utf-8?B?ZWV2S3AwRHkrWkJwbGdWRHg4b3JkdkVic20xM0xldC82Z2lFQkRiUEdmaTNs?=
 =?utf-8?B?TUhaUWQ4aFY3aHFRYmg2R1dEM1FvYk92ZEc3TnZhSjFtQmlSdSt2MEE2TUdn?=
 =?utf-8?B?SkhHMXlMMnAzWmNGeVJuOS9RZUdxUzJkdVI5Q3FsbDFkTS9sRW02blhkQXUv?=
 =?utf-8?B?VERMWVZleFhGK0U0YklETTJwb3lqUVBidDBQUFQzdDN4UUhpVUlPVXcvbUdN?=
 =?utf-8?B?ajVadUU4N1VCWEVhSTIvZjBna1NrZFNFQnBZbE9UbmFVTjNHbUZFSmFrck9K?=
 =?utf-8?B?MWNtWS9FM1ZFWDlTaEpWQURxSVp3WGFHcFUyUFhhOEtIRmthbU9VV1dQOVFN?=
 =?utf-8?B?STBUa2VqbXNVKzQwKzlYSTBwM1QvbjJpQ3I1WXQxYm9iM002V21rQmNaZWZi?=
 =?utf-8?B?TElwNFRtS1dCRnlLQ285TkNsNzhWcS9rOERqT0hLUE9VYmU4SzNoRTR1b1VN?=
 =?utf-8?B?OEcwQUlOL1h4UUJ0ZXdhZVNtcEJrNDhMZmR3eFM3UUlXT09QQWdpMC9TME1S?=
 =?utf-8?B?aHBFeVlpRExFN2RJT3ZsTVpYdzFzVGFoNVF0U3BGa3dBc2duSHFRT3FNRWpI?=
 =?utf-8?B?YkhFT0Y5UnMzUEJNanN3bk5TQVJ2VzBrdHUvakZYZ2lVT2wzNllVZ0JPWEU2?=
 =?utf-8?B?VVQ3b2R2Q0tOMmRzSFllZ3RicjlyejREamZtT2cvZGhSaXU1bitIN2lpekYr?=
 =?utf-8?B?cXZHYU4wRk9OeWtMbDRlUEZNa245STNQZkJ2ZEVpT2xZR2ptMXFtZnpZbmhi?=
 =?utf-8?B?SDNMOXlXeVppWk04VzNtMW1hNW5NckQyU01RSWZva0tiWU1zNklPTjBwMDNQ?=
 =?utf-8?B?dDE5RWlBUXBCT2liOWdkeW9jNzQ5SjZSdmZZaUI0bUFQR2JLT3dwRjR0Zlhy?=
 =?utf-8?B?R1RSY3ZjdzFwaSt5VTZxRUh4TktObmRENUJ1cTBBb3lqOUMxU1V5c0ZTMkhO?=
 =?utf-8?B?N2IvV2IzK01QVG9vMFpCREVXMk5wNURUZzd6R3RRc3d0YmxuOUkzVUlwbWhF?=
 =?utf-8?B?Ykl2NFB0Q3JnOXE5WjdDang2Njd2T2RJYklVWit0QUNjc0wzcmRlUU05WHRI?=
 =?utf-8?B?TE9KZDJjbnpFYzdqN1piUFRlenZBdWo0dngxNmV3UjZVQ0t0ak5MdW5LNEMy?=
 =?utf-8?B?SjVOaEJFZUt6akdXV1lMWVY3bWVESlJuODF1em9yQU9PY0ZMbkVmSjNYMG9X?=
 =?utf-8?B?dWc4S2ljQzBvUWU4akhVTE9TZ3BYd0F5b1ozdkFSckE5dVQrQkNEMGtiZkZY?=
 =?utf-8?B?OGdyb1RKK1pjaEFXNWwxMEVpbTNScDZWU2tjNGNZdHFDVWhOK0xoMjNvL2p2?=
 =?utf-8?B?bDdkUk9ndVNJMm9tSEQ5V2tJd0Y5VnhKSU9YS0x3YXBIaXFEWXdVZ2JENGNY?=
 =?utf-8?B?Um8ydDcyYnVDVW94ZmxqZGhYck1aNUU1QjNhamlRMVJicldYeldzNVkyUytn?=
 =?utf-8?B?dmoxalhoMEhkU25nVjNrK2lVQyt4YzFGTnphQWx3dkhwdWJlT0ZvdFBsTFBi?=
 =?utf-8?B?Y29sTmFDay9hSG84UE54em9FbmIvTGdvdVdUMnJlN29sTUlWL1g3UnNodUxD?=
 =?utf-8?B?SDJmUDZUUHI5d1dHYll4RWNwQlBUZnlRenptSTN2dEVIRjYyejdDT2VLODZq?=
 =?utf-8?B?UWc9PQ==?=
Content-ID: <A63C000763A3A949A8814EF27EE2A03F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32db0791-425c-41fa-31e5-08dd08840cae
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 10:22:19.7599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j1FON/Yqs8loQOd3zMgVaSuOrDA+cDCsQtJRZ3KBA2+bgGyGU74BfRNBu5BG87H1iaEa54cOMP73DIbhLByZ2GQ7frYEglN951hHYylkU7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6269
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchip.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6KCrcurZYgchwF724LJwnM8b28yoRLZoS5OM8U/VjM=;
 b=7IDtPi/Q6HuuK/S26H93G6af9/7LwR0rdqgvw9MATGKH+pXJHYYJF5ApPVa34NMDPWNkemwkDCAkc8puAcvCCLzyAueo311zzrV/v/r7M45ioajG0tthdmbS9OG+tdX4etvKO1dF9ceXsdrflGV8OTXppy1GOmddmueFO4sQ+o1cwJCy71nXzSdDedtgo4IGW8oZUxsF7wSQBpy8ShpDvbv8JSAhNS27unX9FmyrnIJtFwFVQ7U3iyxmH22M9kK9PRrReuPM+LCLagTe1C56gPE1uibHRCNkdEmOrC+FftptlkMvEDAOAXt3QwXAu8tW18pQYMI5BFj56brGGvaPHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=selector1 header.b=7IDtPi/Q
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH 0/3] Fixup Update Gateware Feature
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
From: "Jamie.Gibbons--- via buildroot" <buildroot@buildroot.org>
Reply-To: Jamie.Gibbons@microchip.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLA0KDQpPbiBXZWQsIDIwMjQtMTEtMDYgYXQgMTE6MzQgKzAwMDAsIEphbWllLkdpYmJv
bnMtLS0gdmlhIGJ1aWxkcm9vdA0Kd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xp
Y2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91DQo+IGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZQ0KPiANCj4gT24gVHVlLCAyMDI0LTEwLTIyIGF0IDExOjI0ICswMTAwLCBKYW1p
ZSBHaWJib25zIHdyb3RlOg0KPiA+IEhpIGFsbCwNCj4gPiANCj4gPiBUaGUgZm9sbG93aW5nIHBh
dGNoc2V0IGZpeGVzIHRoZSBnYXRld2FyZSB1cGRhdGUgZmVhdHVyZSBmb2xsb3dpbmcNCj4gPiB0
aGUNCj4gPiBhZGRpdGlvbiBvZiB0aGUgZmlybXdhcmUgdXBsb2FkIEFQSSBpbiBsaW51eCB2Ni42
LiBVc2luZyBkZWJ1Z2ZzDQo+ID4gZm9yDQo+ID4gZmlybXdhcmUNCj4gPiB1cGRhdGluZyBoYXMg
bm93IGJlZW4gcmVtb3ZlZC4gVGhlIHVwZGF0ZS1nYXRld2FyZSBzY3JpcHQgbm93IG1ha2VzDQo+
ID4gdXNlIG9mIHRoZQ0KPiA+IGZpcm13YXJlIHVwbG9hZCBBUEkgd2l0aCBzeXNmcyBhbmQgZW5h
YmxlcyBhcHBseWluZyBvdmVybGF5cyBkdXJpbmcNCj4gPiBib290Lg0KPiA+IFRoZSBSRUFETUUg
c3RlcHMgZm9yIHVwZGF0aW5nIHRoZSBmaXJtd2FyZSBoYXZlIGFsc28gYmVlbg0KPiA+IG9wdGlt
aXNlZCwNCj4gPiBtYWtpbmcgaXQNCj4gPiBlYXNpZXIgZm9yIHRoZSB1c2VyLg0KPiA+IFRocmVl
IGNvbmZpZ3MgaGF2ZSBiZWVuIGFkZGVkOg0KPiA+IMKgwqDCoMKgwqAgMS4gV2hlbiBhcHBseWlu
ZyBvdmVybGF5cyBhdCBib290IHRpbWUgYWxsIGR0YnMgbmVlZCB0byBiZQ0KPiA+IGNvbXBpbGVk
IHdpdGgNCj4gPiDCoMKgwqDCoMKgIHRoZSBgLUBgIGZsYWcuDQo+ID4gwqDCoMKgwqDCoCAyLiBU
aGUgdXBkYXRlZCB1cGRhdGUtZ2F0ZXdhcmUgc2NyaXB0IHVzZXMgYHN0YXRgIG9uIHRoZQ0KPiA+
IHRhcmdldCB0byBnZXQgdGhlDQo+ID4gwqDCoMKgwqDCoCBzaXplIG9mIGZpcm13YXJlIGZpbGVz
IC0gYWRkIGNvcmV1dGlscyBhbmQgaXQncyBkZXBlbmRlbmN5DQo+ID4gwqDCoMKgwqDCoCAoYnVz
eWJveF9zaG93X290aGVycykgZm9yIHRoaXMuDQo+ID4gDQo+IEhpIGFsbCwNCj4gDQo+IEFueXRo
aW5nIGhvbGRpbmcgdGhpcyBzZXJpZXMgYmFjayBmcm9tIGJlaW5nIGFwcGxpZWQ/DQo+IA0KPiBB
bHNvIGEgcmV2aWV3ZWQtYnkgdGFnIHdhcyBzZW50IGJ5IG15IGNvbGxlYWd1ZSBob3dldmVyLCBt
YXkgbm90IGhhdmUNCj4gYmVlbiBwaWNrZWQgdXAgYXMgaGUgaXMgbm90IG9uIHRoZSBtYWlsaW5n
IGxpc3QuDQo+IA0KPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT4NCj4gDQo+IFRoYW5rcywNCj4gSmFtaWUuDQo+IA0KR2VudGxlIHJlbWluZGVy
IGFzIEkgYW0gc3RpbGwgYXdhaXRpbmcgYSByZXNwb25zZSBvbiB0aGUgYWJvdmUgYW5kIHRoZQ0K
c2VyaWVzIGlzIGFsbW9zdCBhIG1vbnRoIG9sZC4gV2l0aCB1cGRhdGVzIG1hZGUgdG8gc291cmNl
IHdoYXQgaXMNCmN1cnJlbnRseSBpbiB0aGUgQnVpbGRyb290IHJlcG9zaXRvcnkgZG9lc24ndCB3
b3JrLiBBbnkgZmVlZGJhY2s/IEFueQ0KY2hhbmdlcyBuZWVkZWQ/IEFueXRoaW5nIGhvbGRpbmcg
dGhpcyBiYWNrIGZyb20gYmVpbmcgYXBwbGllZD8NCg0KTG9va2luZyBmb3J3YXJkIHRvIGEgcmVz
cG9uc2UuDQoNClRoYW5rcyBhZ2FpbiwNCkphbWllDQo+ID4gDQo+ID4gDQo+ID4gVGhhbmtzLA0K
PiA+IEphbWllLg0KPiA+IA0KPiA+IEphbWllIEdpYmJvbnMgKDMpOg0KPiA+IMKgIGJvYXJkL2Jl
YWdsZWJvYXJkL2JlYWdsZXZfZmlyZTogZml4IHVwZGF0ZSBnYXRld2FyZSBmZWF0dXJlDQo+ID4g
wqAgY29uZmlncy9iZWFnbGV2X2ZpcmU6IGFkZCBzdXBwb3J0IGZvciBvdmVybGF5cyBhbmQgdXBk
YXRlIHNjcmlwdA0KPiA+IMKgIGJvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXZfZmlyZTogY2xlYW51
cCBnYXRld2F0ZSB1cGRhdGUNCj4gPiANCj4gPiDCoGJvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXZf
ZmlyZS9SRUFETUUudHh0wqDCoMKgwqAgfCAxMyArLS0tDQo+ID4gwqBib2FyZC9iZWFnbGVib2Fy
ZC9iZWFnbGV2X2ZpcmUvYm9vdC5jbWTCoMKgwqDCoMKgwqAgfMKgIDEgKw0KPiA+IMKgLi4uL3Vz
ci9zaGFyZS9taWNyb2NoaXAvdXBkYXRlLWdhdGV3YXJlLnNowqDCoMKgIHwgNjUgKysrKysrKysr
KysrKy0tDQo+ID4gLS0NCj4gPiAtLQ0KPiA+IMKgY29uZmlncy9iZWFnbGV2X2ZpcmVfZGVmY29u
ZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzICsNCj4gPiDCoDQgZmlsZXMg
Y2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pDQo+ID4gwqBtb2RlIGNo
YW5nZSAxMDA2NDQgPT4gMTAwNzU1DQo+ID4gYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xldl9maXJl
L3Jvb3Rmcy0NCj4gPiBvdmVybGF5L3Vzci9zaGFyZS9taWNyb2NoaXAvdXBkYXRlLWdhdGV3YXJl
LnNoDQo+ID4gDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0DQo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnDQo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
