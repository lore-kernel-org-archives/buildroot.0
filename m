Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26649C8303C
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 22:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C86F281786;
	Tue,  8 Jul 2025 22:25:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0TYLFo--duK; Tue,  8 Jul 2025 22:25:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4E09816EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4E09816EE;
	Tue,  8 Jul 2025 22:25:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B4D169
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 22:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC845606F2
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 22:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id moFM9IOjxg9Y for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 22:25:31 +0000 (UTC)
X-Greylist: delayed 909 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 08 Jul 2025 22:25:29 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 301DF60803
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 301DF60803
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::61c;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=lhupfer@xes-inc.com; receiver=<UNKNOWN> 
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on061c.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::61c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 301DF60803
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 22:25:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=M5UdhB29yAJyeKp4WO6ysS67RFfH0D2m9IIW8gJpf7iWhVcLZOXRJF3pCT9LOWBUVhILnINz8cSKLPusHXKworVRYwdTgt849A3ls+b/h69elHDFFsxEWoCcO51Q8c2cJT5Z0wyI5j7QokzBzkBSmmoQyZQi10i7m+D7lvOtd2Q7CHtCpNYmNVNWD3KcKVaPsajFfjYAvO7uq5LTx8vC8UXhJv/hJA8g4NEL/YQbaQsm2qugbmbMltT4P4IhxGALoMSr7C3XjS1G2Rv+O6tzlIi2IhNCXSBnK8whZZsQny+DmsQYRENzfmQN2jTuI3MyKcfTYMbKKExw6Iw38mv1GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8cNKo3/OPGwD/lXACGArecDQSvt3pjY7Atq0tL1dBs=;
 b=WDrAsvSvNhPVoBRf+xCCkPfEFhM7GIq7d1JZ/oTA4KybK/IjKyJQ9EsvEbh/qnsIdbB6IeR/QXQ5L6kU++xvVfv+RcDyFe6j3+6FCKzT2CStRiKDxA6XvrClEPyXX+NVu1+ju0551+hFOuE5Z2/H8LYFpXvx/Mvzq4RERa0rYKVBmekB4Rie/APqvNzwp4z5bXnd401FamjoeL59ntnSCSsfreTEx4yNjEGe8DQIBxuYcVK/TJc0l3i8eJX1Xv+UtSnjwQldIBRzEu4djL/zjT6y5deFE6UzNaZMzbZE+3G184vijA4mfuzq5RGpQGGiy+xTIXVrZaVVg/EJxtDocg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from SA1P110MB1536.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:190::19)
 by PH1P110MB1410.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 22:10:15 +0000
Received: from SA1P110MB1536.NAMP110.PROD.OUTLOOK.COM
 ([fe80::1add:dd0f:5e6b:3406]) by SA1P110MB1536.NAMP110.PROD.OUTLOOK.COM
 ([fe80::1add:dd0f:5e6b:3406%4]) with mapi id 15.20.8880.029; Tue, 8 Jul 2025
 22:10:14 +0000
From: Liam Hupfer <lhupfer@xes-inc.com>
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH] package/python3: select host Python 3
Thread-Index: AQHb8FUU6wjpppEmtUeebMZUw6q4ew==
Date: Tue, 8 Jul 2025 22:10:14 +0000
Message-ID: <rchbjpupc56.fsf@xes-inc.com>
References: <0682724078f4516c3f7992d4c16588a5d1381013.1731702127.git.lhupfer@xes-inc.com>
 <9b44f888-b884-4de8-9737-a16bf481d1c4@mind.be>
In-Reply-To: <9b44f888-b884-4de8-9737-a16bf481d1c4@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB1536:EE_|PH1P110MB1410:EE_
x-ms-office365-filtering-correlation-id: 61a31727-d205-44dc-5f3f-08ddbe6c3709
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|41320700013|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?WjVBbkRxOFdxNGdYbTAvY2lvYThsOWJYL2ZCeFVpTGFKWkg0bS9TMWhIWkNq?=
 =?utf-8?B?QkdWQlpDQlNycjFWQkxINkdGOHdaaG9oMlo4azNmdjNmM3k1SXpkN28wblN3?=
 =?utf-8?B?ZFcvWlBxQnFna0NDM1FmQU55UFcwcGNsN1J3WVBPc3Q0bldKL2JaZ0JJR0l5?=
 =?utf-8?B?MXFYbzJ0TzdJalNjSHRWbVg5ajFoL2pBNmxvcmJhd2pqVGZFWktSREtDOHps?=
 =?utf-8?B?RFc4aXZpL3E5cVNNT1RraUtiK3UxWmtGN1oxKzIrenBMdFpCMnE2Zk4yZ3ov?=
 =?utf-8?B?YjFHR0lVT0lka2IwVnhFS0MzZ3VoQVB5U0szaTJQN3hUU1BlWnB6R3ZpOFRZ?=
 =?utf-8?B?WU1mUkRaV0RwUmptSnUvbm1raHN5YUViZjBrK3RFWnhsMytGY3IrMmZ6T09M?=
 =?utf-8?B?VlJObDJrTkhLc2l3VDdpZUhiNUMzUVBlSnI5Z1hManNWSEowcWF1S2s0d1Uw?=
 =?utf-8?B?SHhQUit5djZ4eUVDcjhNSzN1bEJYN2h0ZUhLeXpqUVluRVVQczh4WEFpR0Rs?=
 =?utf-8?B?TUt6RFhESkV3cTNzdVpVNmM3WFBMWU9zRkRFdXhYS1ppWnRpYXVxNUpNRWFt?=
 =?utf-8?B?ZHgwWVVVRkVZOGEwalF3QWNPUGtHRlZBT3dUMUxnYUtZTTkvRGtyc2hwQ2Yv?=
 =?utf-8?B?d09VS2lDSXQ3aWMyeW5XMUNubzE4WlJqK0ZDMG1IeGVNaXZsRU80Q2huamFG?=
 =?utf-8?B?d1dQRENCVWhGUmN5SkFQYTR5WFV0c0J0UXlzbDhNY3h2TEQ3blpMTFNnNURu?=
 =?utf-8?B?N3plMmQ3eGZlSUxhcDIrdnNQN0ZLVW5xZU5weS9CdndRbWVWcjdCRG9mMCs5?=
 =?utf-8?B?VkcwcjV3YkJqTUdxZ0xhQUVpZis2eVpIbXlCRm1YQzBqRWowcExFcDdjdHlX?=
 =?utf-8?B?REY5SW04T01KSUs1bk05bmtZWkQxQWNDNmQ5T0FVdFJaVDlMZW8vSTRHVHIv?=
 =?utf-8?B?aVlMT1QwY09mdms1bHZpZ0I0ZmhJZkpubmhmZEg1VG9aWExQZmd6UnpNYUpW?=
 =?utf-8?B?aHVkN3FWcDkrMmxxaEZIUXZrTHR1WEFsczdyb3l0cjJZM0lIQVIwQnkvdTZl?=
 =?utf-8?B?bU04NXprcFVUMnNRVGkwYjZmZW02Z0J1Zlc4dUVHN05rcUNuNExoTmhFNmlO?=
 =?utf-8?B?M1F1dDJmMHU1VDZOa2g0TXJGalZCekpCTHk2bjM4b2V6d0hTWGNjeVpKOWF1?=
 =?utf-8?B?cXFpMW9aRWNzZmMvdXdsWUNBUGdhc1JlaVY1T1BEWThmYlhvMHcvcjNvV0hu?=
 =?utf-8?B?MS9IenZEWGFNTmEvUGg4RTJNQXJ2TDJTaHA3ZG1PekQ3T3F4bFJUbTVHT0RL?=
 =?utf-8?B?RENJVXYzRlZtL1VpSld2bDBBalA1VDM2bHhSUVBJNkpXV1JaRHdMOXRrQnBO?=
 =?utf-8?B?eVMzUGJQVnhpeWQwS1pyakUxam10SUNEdVV1QXErcTUwWG5WdXBWc3dhVFlJ?=
 =?utf-8?B?OGE3UmxyQm93SlBWanBhaC9WbSt0bmFON21ENHd0THNjYlUxd0sreTZFcUdP?=
 =?utf-8?B?TWIwOVRzcDJzcWJzU2prbHA0dVlXa2QrRkdwQnR3Tm56ZkwxYnEvMkNVYTkr?=
 =?utf-8?B?Y1drVXp2S1R1UVpyaHlLWUpPZyt4MlBrdTVjQWhjclZzMmtGa2RFL2ZOZlgy?=
 =?utf-8?B?cGdSUTZ1eHhCZXk1STBaL3BwLzZRQ0d6elB5bzlubzBOT29Ccmh1aW9YT1Ar?=
 =?utf-8?B?RkNadlg5ZWo0anc0MGJIdHBscjhZOEI1QlBPR3BYNHpRbk5pSksrMFFwZXBx?=
 =?utf-8?B?Q2JvWG9MQU55MnhFelFFR1dlcGhKWWpiWlBUVSt6Qk4vd2ZiZWRONUZ3ODdR?=
 =?utf-8?B?RTdDZ1BwQXlUcEdBcERWK2lEdWRkcU9rMnREdGxtb295djlzM3FMMC9RbXkx?=
 =?utf-8?B?Ti9LbTBvQjd1SytWaytSZkJtem16clMzVHZnMko0QWpXbGJ2NEVGYXFpc2x3?=
 =?utf-8?B?dXBZTWFEWEJycm5pZzVsVmlmVVRlSzkwZ1lnTTN0d1lLWHFxVkdRMkNnVlNa?=
 =?utf-8?B?OVZDTzhSUlFnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1P110MB1536.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(41320700013)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHdLeHk3Z2JWS3JTc2RyMjJudmRwZVhMSjVVVlRtODg0a0lINnZaZmdyR2Y5?=
 =?utf-8?B?Rlo1R2t3cndYbjdTSkJXUlFpRjZrMFpGM1V1RkM2QlZjVHpjOEd1VGZ0K1Zh?=
 =?utf-8?B?cVdtNTJoQ1BhSjZ4VHdnM0xjMDhKY01yUXFtSW1yM25FcjJPK3BNVVA0ZVk4?=
 =?utf-8?B?Vk0rQk40YmN1cWlrT2FubFN0dHdENHFSMFRURURSTnBVeXc2U1ZtVThyaXVS?=
 =?utf-8?B?Q056aU9kSWo2YlQ0L05lME9BbU4ycGFPNGZWR0dLWkxEWUVxemNJSzlhVkRE?=
 =?utf-8?B?alMxS1l1d2tiSktpUENrZGIyN2dOQnIvT3Q2L0d4eWVFSzJaUHpzVitFa2Y1?=
 =?utf-8?B?ZklTbnp1WklKV1dmTXdZTHZ0WHEyK3p1ODdJSmxmU0duaENqN2g3dWV6eUdj?=
 =?utf-8?B?bVFhOHdlTTdURFRhTk9Ua2ppb2Z5S1dYUGJJOTJNL3VPWHZCU1EyV216OCtQ?=
 =?utf-8?B?bFhJZ0VYZGVnb2wyVGU3MWN5Z0NVTWxoRFVQZVNjcEoxNDJ4RkRoOHIrVE1x?=
 =?utf-8?B?OFdLR0lJbk1jRitRcUVtSmpDVVhPMjNTVGJVekt0eVFnM2ZVdzg4dzNkb3V5?=
 =?utf-8?B?VDA2b2dHTTlVekllQmNtcHFhdGhsUTMzUlN3bkZhcGwyNWdJN1hOZGNwTEpK?=
 =?utf-8?B?MnVSL0E1UVRWVmVmMm1FRXBFRXNtNW5PUy9kSkpzcXJEZWJRQkpwWjM5V0Nv?=
 =?utf-8?B?STlDeC84bzh1UW9nRDJPUmx2KzU4WmkrQVh0dyt5ckpPSjlZSkhkbmJHU2Mx?=
 =?utf-8?B?YnJSNzNrcGZJV1RjVjU2QUdLOWZpaVJGQm5pdjBrNUVCZE9zUWxVTmQyTFMr?=
 =?utf-8?B?V2d5UFdNZENjTkFGZGMvdFJieWg0cGxBbnJyY3V4Wlh5TFg2SGM3bUw1UkpS?=
 =?utf-8?B?djBBUW5WbUIzZWRFY2xVVUwxTDQ5cENyS3VWZlA0Mkk0dGFTRjM1QkNnSmNN?=
 =?utf-8?B?NlZyV01RT2NNZUxlYlNILzh2aUgrSUJDTE1XcDd1MUs4KzQ4REFTVERlcm9j?=
 =?utf-8?B?SzFIbDIvMC9zaVZ6anNiZmpmV0NVdktZbytaOXRtRWtZcldqSCt5RFdReWJt?=
 =?utf-8?B?TGdYU2oydFJLT1BmOGowakZPQWZHNWd5cHQ5bENBekZ6N3p0N0RnR240SjBm?=
 =?utf-8?B?cU5SZzF5dlc3OC9EQ2h1ZGJ6Mk1KRlZuSWNjcWpiRW9IUjJ3azFyUTVEZE1q?=
 =?utf-8?B?VkJZdHdOTHBHSTVtbW9NZXhaeHlCbnFQRGJ5NUxMaXorRDZOSys1bm9ydnph?=
 =?utf-8?B?OFVOUjg2OTNDRVJzVUJHVFovZkQ4dVlGY1BYb1YzMlAwNjlrOFRWZFNBS25j?=
 =?utf-8?B?N0FCUU5haXBZWFBpWUpYWUZzT2tzV2YyK2pQdXVSNHIyYlZHN1dVZ2Q5T1NZ?=
 =?utf-8?B?a1NFVFpqMWVVUXFiTFNrTFZNdUNjK2Y2TzhKYzY5ZW9lU0owdm9mQ1lkMGZu?=
 =?utf-8?B?bEVCMEZURlBRejlDQVR1V2Rnb212THUzaGtIK3ZrVzk1a1J1eHBIdWRFb1VV?=
 =?utf-8?B?eVV6OHdxQitEejllMlQrNkZxc25kS0lYMjR0VGQ5Ny9JdlVPTWFlekZJakhj?=
 =?utf-8?B?STNFdEJBUC9reVUzSVltTWFuVWUwaWVYRGJGSzRYTUZ6WnNBOXZKdVhvMytC?=
 =?utf-8?B?TEVtekR6KzdISkwvU0ZmZ3NBOHpULzdCR3RPbDdDdXZqQTM0TzczUFNrRWZu?=
 =?utf-8?B?b3VwRGlWWHlLL0h4MGdHTEZ4M21XVmdldjRpSkVyTkQzeUJJTWMzamhZUi90?=
 =?utf-8?B?aEg0VFI4WnVYMlV4RG04cnJtN1BPZnp4TUpNY0tWT28xZTR6ZDNrUU91bWty?=
 =?utf-8?B?dGg2ZWVHZFYvK0IwTnRVdnRFZldVQ0Nac2hncVRJTmRRTHAwQXFWVm54SFp3?=
 =?utf-8?B?U3ZoSXVuMkk4ZGtmbyt3R1J0WjZPbm1lUFhrdXFBUURwY0VzWlBJQldDcDFN?=
 =?utf-8?B?VDhwYjJCak5TTUM4RlNyUmhJM3FOUkhMWTQ5SXUxNXp0U2FXQ2lZdm5nZ2dq?=
 =?utf-8?B?M242SDBtUm10WUlwZDJEZEZzMFB2N3g3Nm15MDNLaldxcXJodnF6bWxPVVc2?=
 =?utf-8?Q?e6UsZ5?=
Content-ID: <13E3C521974418429835373F66D7971F@NAMP110.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB1536.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a31727-d205-44dc-5f3f-08ddbe6c3709
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 22:10:14.5057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1410
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8cNKo3/OPGwD/lXACGArecDQSvt3pjY7Atq0tL1dBs=;
 b=o6GNc/UMBtzJf+xyFHpPprOMCVlo3vnPKko3OcLiX86aUcXrH2rkn4kfzoj6QCplrn6U0+5yCBfJwp0hNsAd+VEVT9d70T0maDfRzQvPMdI41WbMqxwT2y4dzZ+YsnfNMmGIEcScZOmAa7LWLOMnPxWZd58ydMkoDOnE+En0j0Hv8IueMNultvrIv6Nt7+MHOMJL6bvGWJ0g3PXxbrfDVXjhTXpzMEmSBEFjzkevseyIIA5Gi97HPEf1aPRnEMKYzHlqJODWbnb5hEzKbBFyGOIYRc2xlkFOZYTi2G1d/ib+9lj5orqQf0kAsWi3Cv0oOP1DeWNDgHOPPGq9vNkfmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=o6GNc/UM
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [PATCH] package/python3: select host Python 3
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

SGkgQXJub3V0LCBzb3JyeSBmb3IgdGhlIGRlbGF5ZWQgcmVzcG9uc2UuDQoNCkFybm91dCBWYW5k
ZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gd3JpdGVzOg0KDQo+IE9uIDE1LzExLzIwMjQgMjE6
MjMsIExpYW0gSHVwZmVyIHdyb3RlOg0KPj4gQnVpbGRpbmcgUHl0aG9uIGZvciB0aGUgdGFyZ2V0
IHJlcXVpcmVzIGhvc3QgUHl0aG9uIHZpYQ0KPj4gUFlUSE9OM19ERVBFTkRFTkNJRVMuIEhvc3Qg
UHl0aG9uIGlzIGV4cG9zZWQgYXMgYSBzdGFuZGFsb25lIEtjb25maWcNCj4+IG9wdGlvbiwgc28g
d2hlbiBCUjJfUEFDS0FHRV9QWVRIT04zPXksIGl0IGlzIHBvc3NpYmxlIGZvciBob3N0IFB5dGhv
biB0bw0KPj4gYmUgYnVpbHQgZXZlbiB3aGVuIEJSMl9QQUNLQUdFX0hPU1RfUFlUSE9OMz1uLg0K
Pg0KPiAgIFdlIGhhdmUgcGxlbnR5IG9mIGhvc3QgcGFja2FnZXMgd2hlcmUgdGhpcyBpcyB0aGUg
Y2FzZSwgYW5kIGl04oCZcyBub3QgcHJhY3RpY2FsDQo+IHRvIGRvIHRoaXMgY29ycmVjdGx5IGZv
ciBhbGwgb2YgdGhlbSAoY2ZyLiBlLmcuIEJSMl9QQUNLQUdFX0hPU1RfQ01BS0Ugd2hpY2gNCj4g
d291bGQgbmVlZCB0byBiZSBzZWxlY3RlZCBmb3IgYWxsIGNtYWtlIHBhY2thZ2VzKS4NCg0KSUlS
QyB0aGlzIGlzIHRoZSByYXRpb25hbGUgVGhvbWFzIFAgZ2F2ZSBhcyB3ZWxsIG9uIElSQy4gRnJv
bSBteSBuYcOvdmUNCnBlcnNwZWN0aXZlIEkgZG9u4oCZdCBzZWUgd2h5IGRvaW5nIHRoaXMgZm9y
IGxhcmdlLCB1bmNvbW1vbiBob3N0IHBhY2thZ2VzDQpsaWtlIFB5dGhvbiBtZWFucyB3ZSBtdXN0
IGRvIHRoaXMgZm9yIGFsbCBob3N0IHBhY2thZ2VzLiBCdXQgSSBndWVzcw0KaG9zdCBQeXRob24g
aXMgbm90IHNvIHVuY29tbW9uIGFueW1vcmUgd2l0aCB0aGUgcmlzZSBvZiBNZXNvbiBhbnl3YXku
DQoNClRvIG1lIGl0IHNlZW1zIHRoZSBLY29uZmlnIGludGVyZmFjZSBzaG91bGQgZXhwb3NlIGFs
bCBwYWNrYWdlDQpkZXBlbmRlbmNpZXMsIHJhdGhlciB0aGFuIGhhdmluZyBzb21lIGJlIGltcGxp
Y2l0IGluIHRoZSBtYWtlZmlsZXMuIEkNCndvbmRlciBpZiBpdOKAmXMgZmVhc2libGUgdG8gdGFr
ZSB0aGUgZXZhbHVhdGVkIE1ha2UgZGF0YWJhc2UgYW5kIHZlcmlmeQ0KdGhhdCBlYWNoIHBhY2th
Z2UgQkFSIGluIEZPT19ERVBFTkRFTkNJRVMgaGFzIEJBUl9LQ09ORklHX1ZBUiBzZWxlY3RlZA0K
YnkgRk9PX0tDT05GSUdfVkFSLCBvciBzb21ldGhpbmcgbGlrZSB0aGF0LCBzbyB0aGF0IHRoZSBt
YWtlZmlsZXMNCmRlc3luY2hyb25pemluZyB3b3VsZCBjYXVzZSBhIENJIGpvYiB0byBmYWlsIChv
ciBldmVuIG1ha2VmaWxlDQpldmFsdWF0aW9uLCBpZGVhbGx5KS4gSeKAmW0gbm90IHRoYXQgZmFt
aWxpYXIgd2l0aCB0aGUgQnVpbGRyb290IGludGVybmFscw0KdGhvdWdoIHNvIG1heWJlIHRoYXTi
gJlzIG5vbnNlbnNpY2FsLg0KDQo+ICAgSG93ZXZlciwgaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2Us
IHRoZXJlIGlzIGEgZ29vZCByZWFzb24gdG8gZG8gdGhlIGBzZWxlY3RgOg0KPiBob3N0LXB5dGhv
bjMgaGFzIHN1Yi1vcHRpb25zLCB3aGljaCBtZWFucyB0aGF0IGEgcGFja2FnZSB0aGF0IHJlcXVp
cmVzIG9uZSBvZg0KPiB0aG9zZSBzdWItb3B0b2lucyBuZWVkcyB0byBhZGQgdGhlIHNlbGVjdCwg
d2hpY2ggaXMgYWxzbyBhbm5veWluZy4NCj4NCj4gICBUaGVyZWZvcmUsIGFwcGxpZWQgdG8gbWFz
dGVyLCB0aGFua3MuDQoNCldvcmtzIGZvciBtZSwgdGhhbmtzIQ0KDQo+ICAgUmVnYXJkcywNCj4g
ICBBcm5vdXQNCj4NCj4+DQo+PiBTZWxlY3QgaG9zdCBQeXRob24gMyB2aWEgS2NvbmZpZyB0byBl
eHBvc2Ugd2h5IGl0IGlzIGJ1aWx0LCBzaW1pbGFyIHRvDQo+PiBsaWJmZmkuDQo+Pg0KPj4gU2ln
bmVkLW9mZi1ieTogTGlhbSBIdXBmZXIgPGxodXBmZXJAeGVzLWluYy5jb20+DQoNCuKAlExpYW0N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
