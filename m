Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A173C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 06:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 899584188A;
	Fri,  7 Jun 2024 06:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MXUmS9JhDYw1; Fri,  7 Jun 2024 06:29:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D58041679
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D58041679;
	Fri,  7 Jun 2024 06:29:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 620791BF4E4
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 06:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A382810E2
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 06:29:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jmtM3Ak8aDqc for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 06:29:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::600;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 11373810DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11373810DD
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::600])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11373810DD
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 06:29:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjQUa72RXd0FhD4JeVtz7dDrngnff5QeKFXpdZlUxuJIxJNg3mCeYYIYKcgHmADzg22+9X6ZRubHjqydLIq5h+R+V90r3OnbUeahqeWLflKIeD03bCJSKCXel6Rwewuc4kRbJyUWzef4PfFTixyEFEutgV/ODuMDqYcrRVm+pfmizM73ZPDbOqoppQf8GMlZUwhghVOw/1tFpyOrMfekQc9XhX3DUHl9tq4Am+G06MVFMNq+krlgWlDRdIYgRUwku1i3/hjcIrefwdgoFd4DXMbDEU0SLNNiGFgmQoBsr1OBchv6ARF7gyQksXaoIDim2aZm8IU5ASnmBrfrbWLTGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ql2FPkElrTocN2cZhYiYToEusHb7fxydIxjqzybkLMw=;
 b=b8RtjBc5AVVYXtFQhsb33n+YWE2qYPS8luCJ1vRfwOf5gixqR5VmeZVJt6+4UUk8Ii/kB0rmw7qE5dO+q2MtgE9WlmJdGLjzs4V2xP/si7a2ZCtpOEBMXeUXypP9u5LWPV38mymA8Ww162QC8F1d/2hJ/qAB1fvmxsMV5jCxsu4rQStL1N8gJHsxfuNA42pGCK24DYRj0Mey0n7SUWfAKYm98rY5+TC4IVDqhfxGDtkrO3nte56FIs3jdKCZMKch3dWsNfcv0h1WgoYdReVd40heiBabBRCRCh3TlEpXtQ+x1Cl7MrSyjlmsTh4/wvUbWzeZVSgjbRdk50CFPa8DzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MN0PR12MB6320.namprd12.prod.outlook.com (2603:10b6:208:3d3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 06:29:05 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 06:29:05 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH v11 1/6] boot/zynqmp-firmware: new boot
 firmware
Thread-Index: AQHabgdsbJU4KQHfH0ygy96cgtM5wLG7jVIAgADdZWA=
Date: Fri, 7 Jun 2024 06:29:05 +0000
Message-ID: <CH2PR12MB5004AE1927F959BAE019D620F0FB2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240304074140.1537910-1-neal.frager@amd.com>
 <ZmHt9EUdlvHV30CY@landeda>
In-Reply-To: <ZmHt9EUdlvHV30CY@landeda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MN0PR12MB6320:EE_
x-ms-office365-filtering-correlation-id: f355ef48-444c-4d93-db3e-08dc86bb2148
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|1800799015|376005|366007|38070700009|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?VVJqQ1VhT0N1TWpYWXVnUnhESnJMdEg3c1NjYXJhcGllM3NmV1NrYkJRWExq?=
 =?utf-8?B?SlhaSDZBeWRRMDRKVyt4Yzg5WHh4bjdkYW1rQlRQZ3VDL3I4TURXY3R0dGtW?=
 =?utf-8?B?RmpWY2lIOG9UQzRaWTlTWTRzQmZYWjN0bWdQRXFWUVZIK25YWXkrU2MzV3lj?=
 =?utf-8?B?cHZGdSs0bXkzbkt3VFBHNnhXSVZnQUtyMjQ0M0dMU0FScyszNlp5U3lDeFFX?=
 =?utf-8?B?bjViQTlFUUNrKytLWW9aMy8ydUhPVS82TTRyWEFCT0Y0VFVOL1pqeHdkODlj?=
 =?utf-8?B?ZDNja0RycGc1Z0RDdWJZT21FVndUa0RYUU4vb3J4QzQ4VStvV1pRY1dMTFFM?=
 =?utf-8?B?d0s0N3NuQTlWTW9lNXVCSTFCcW9qMDg4aHdFQ0ZiOUZEbWdqeVRKTjBIc3Vz?=
 =?utf-8?B?U2ZMa3ZiTG5OSkV4U2dUbWp4YUE1QnBBekJiR3ZtRTdtY2Y0NzVKamxRSm15?=
 =?utf-8?B?MTVYbEJmV3NZVXhkN3VhWHF1K01ueGN3TXoyMEVNc1FmOEgwV0xFSVc2cUV2?=
 =?utf-8?B?SEoxY3FyUU0wQ3FodEUyV2ZKdXlqRkJ3T3R3NkhYNFhWKzdrMGhrQ09qQXcv?=
 =?utf-8?B?bnhaKzVkMEhaRzV5Qm5LUXpnS2RESmtYVXdubTQrUmJDR2Y3MkM2TDJwcTls?=
 =?utf-8?B?MTc2bjIzdHRyYzJMT2YvNVdGdGJWbS9DYm1CVUFBaEFUUnZSa01sRjE0aFV4?=
 =?utf-8?B?Q0FSRlhRUkxFOVV2ZWlOdWwwY3UvL05PWlBwWDl1eXFzdGphc3pYR1VWMVND?=
 =?utf-8?B?K1RWL2FES2I4b1Bqd1NGV1cxOHg2b0RZdGtlUUJNc2NRM2J3TzhrVE44N09M?=
 =?utf-8?B?cFhBTVRud002VElaZFFsVWpaOUFUaVl0RVdyMDB1WWo1YzcvZ0ZrSjByVk11?=
 =?utf-8?B?TG1zUStkZGN2c2hsMXU5c2RLVkpoNldtUi9oQlZuYll1TjRXQlQ4MHVGaTJR?=
 =?utf-8?B?V2pPK05XM0JCUHU4TFE3N2k1ejlvY0R2b1QrV2dNbmc4dUhvNERQUkVWb2lp?=
 =?utf-8?B?eHB6alJ3U2JnMnVpVHpDdDBpWXgzZDVSU0xDdnlqYUNkU1lNZ09XTklGUGhk?=
 =?utf-8?B?SkJoTmlURXRvb2trS2gyejJlTFV6Tk5zMmVocEJGaml6K2ZMWElaWjhENkhV?=
 =?utf-8?B?ZDQ1Z0wvMWRIRzcrbUxpTFVBbjBtbEF5Rk5YTFB6WmgzL2ZDK3A5TkNxdS9H?=
 =?utf-8?B?dUVJSjhFSHhZRDA5S1lKSFJsLzErbUFFRnhPT1kvL0R1ZXJuR1lOSXJIazlF?=
 =?utf-8?B?QW1ISjUwdTJVb1RRcDNLVS9pWTZZeEVmajZLN3MzajFoOHo3NUlBSW5mdlJE?=
 =?utf-8?B?MTI3amhaUDRPZGtFQUNpSVR6M0dZa3pOdTdLdDhtVHl1TkhqVkh4cDM1ZFMz?=
 =?utf-8?B?d2t5SGJVM3Q0MG9zclJCeGZ3allkaWttdGgzRTlhN0NHYzNUbWRjbWZPcWkr?=
 =?utf-8?B?V0JnTkROVHVTOVRCUlU1MEN3Snd6Q0J0TGxDYXd4M08zaXliUmNqUnBCbmVx?=
 =?utf-8?B?WjFPWWxuZmNvcFY4R2FFbFM2bVlKcEc3aHY5SkxVb3hvdVh1VVp0bFlNeDA4?=
 =?utf-8?B?VVUxSytOYk9jYzJPdDErblA0TDJHUWNpQXhXelpsSmNqZHJET0h2L0g5TWZR?=
 =?utf-8?B?QmVRRWhRRGx5ZGpqTUU0SWkvT0lXdHg0QlV0dWFmRWJwZVBKaXZOWXZkTjhT?=
 =?utf-8?B?eDFSMUhLME9UN0ExVktEMm0rR0xqZkpFSlorbUJwam4yaVU2MlRZbmZRMWV5?=
 =?utf-8?B?TEVHZFlsNmJ5dFVFS09wTVRHSkp4OXAvY3ZBeEY4VThKMzBhN2x5UG9kMTI4?=
 =?utf-8?B?dnFtczJtc3c2Vk9DQ1FuQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWlSV2gvUElJeEgwWFJ0cDY4UUIraWVIUkhXeERSVmtVU3djWEQ5OVljd2k2?=
 =?utf-8?B?UHY3NlZRWnRCQ25YcFJaVmM2Yjc0RjNzZHdwQ08vVFNScnI3dUN6SXpvdmUr?=
 =?utf-8?B?VDBOb2dGTlVCZ1lmYk90Rmh2QzFZZU95NVR5bUlZK3Mxc1RZb2IrNldxU3VN?=
 =?utf-8?B?NC9CY3IvQTM3enJFb2VmbGxiUCs3aWxVMUlkTjhINldYUFVOYVE2dEgvNkc5?=
 =?utf-8?B?bko0ZjBSQjJkR0tVSlh2WSswdzRvQ25SR3ppeW11Um1qWnNHWUV4dHUyN0Zy?=
 =?utf-8?B?ZlBUcW5SdFkwc3gxMTBlaVc5cEZ3RVhEekRIWnFKTFFMTmphYXdjSndMVCtG?=
 =?utf-8?B?ZmtXN2ZoaURxME5kcFA5UldXSCszSzZNNDdmUE9iZURGUy8xanNRTWhpU08v?=
 =?utf-8?B?cm5UQ3orelN6c3djczVUZnhqRU1sL2IxcnkvK2ZMVllIazlJcUtrSC81WUlF?=
 =?utf-8?B?VzVaN1k1OWowVTh1M3pCV3Bmdi9KK200NTZuYmtObnNyWjh0U3dPUEJ0Qld4?=
 =?utf-8?B?WnF4OG1RaEdhS3R5ODViR3NpN2RMQ0VDL1c0dWZHbFFQclRFQWFPUENFRWNa?=
 =?utf-8?B?N1N0bmdPMXJDU0JlcEd6Zko3ODUzZFFpUG0rYUtXSnVIVzlaWG5QOVc5Q0dq?=
 =?utf-8?B?L1dDd2VKdTJqNDcyZE80VmZpeDV2WnhGQ0NBeVdLaVpzLy8xK3YreVphcG5i?=
 =?utf-8?B?S2luRGNyOFlQaEFyV2lmQWpiSk1jZmRLQXhlNjE3eVBJTnFva0RBdm9wT0dL?=
 =?utf-8?B?aEJrdXR5WktqbTFYUU9jeVV0QTl5SVhYUXppWitFUTFFODNsWWRRZk8zZi9I?=
 =?utf-8?B?VDdEeUxzWlZjeURhR09Sb1hqSDJUc2Y2SnJIMjAvQ0RML1BWQWtGbjFKejN6?=
 =?utf-8?B?eTRoS0lzS3ozNjJpSDROUmtuNUJCQ1FFa2hETGNOclk4ZVRlaWx6aFlXdnpa?=
 =?utf-8?B?cnB4a0tWa09jM1VYQ3B1Sk00Y0NISnNDbktqUzBwMlJvRWZPcHNNQ2VWb05i?=
 =?utf-8?B?K3d2cUk5QUJBWng0Y3hFWVIzY1dtVm10ODFTZys0RjdiZzc5QTN6dnFPU1I1?=
 =?utf-8?B?UkRWSzJWUVd0NHkydHNaRG1Mdldoa1IwWkVuMU5scnV5MTFFc0YwdnJmT2to?=
 =?utf-8?B?amc2ZGtWK3d3VHBFa0toVnduYWk5ZEVQdUxXdzZac2JiaE1OaTF1eWNVRkdG?=
 =?utf-8?B?cVFNRmNTVUtRRCtXS0wxNU9ScHhzZ3UycHRYajlRNU45VWVNcU9YWDI0M1hU?=
 =?utf-8?B?cEEyQTdKd2NxaE1sQXJBNHZtcjhNOXRNRHZ0OHJwOEJ2T0NwdS9vSCsydVc4?=
 =?utf-8?B?Nnc4bG5DZTlKUkZiak5ob1BGV0Fzd1hBS3ZMTUpLdkJyV2VUZ3IwNzBLeitN?=
 =?utf-8?B?cW9FNUFkSDBFTkZBU29COEZrUVQwUlEzbjZpdjJGVWlXVDduL2FyN2Q5dlhK?=
 =?utf-8?B?SnlsMmRtZHZNSUJTcld3d1VXWjVwUXdzajBYV1ErOWxFTGNtVEZ0OE5kS1FK?=
 =?utf-8?B?SG5KUEJjSFBnbnFNMEZCK0Q0ZElDN2djNjhwOFA4MUF2ZUxWZERQSnhNYng0?=
 =?utf-8?B?Q2w2YUFvR0NjbUJRSE4xRit0WitmcEtNcmtiY20wUklFWmI3dEJJdHBjMFlu?=
 =?utf-8?B?NDh4ZjFyclFPUHUyNGlDbkVTYnFMUXEzV3lHR3R3UmVWMmRrNnpnS093cXl4?=
 =?utf-8?B?NzhGUG1OL1pDUmZOblhqSXRlRmU2VFJhSHZzeDlFbFc2QTFZT3F3Uk5UUDQv?=
 =?utf-8?B?Sll1c0w2Q2F5TlNWbk9uZUJzM2hYWXFSdjB1a1lLUzQ5RGwyanRKdFcwbi9L?=
 =?utf-8?B?Y29Gd2ViNHZUU3NnbVV6VjBGR0JqT05XNk5FaWk0RHFTWWI3S0pITEdYSVIw?=
 =?utf-8?B?NWVWZmJlVDV3R2xIdXlVcHlEWXJaMDgwUDltQVdLZmZjbjl4RlNadHhVSXk2?=
 =?utf-8?B?dkVqTnJyOUp0dnZ0ajk3bjl6T0dSVkxVRS9oMk9TL0lnTVBPcWFndFV2SkhR?=
 =?utf-8?B?eHB1YWhlaElhMUlGRy8raStpbWYwd1d4TmEyaHpQU2RXdXNGSFRqSU00d0Nv?=
 =?utf-8?B?ZjdodXRWMkVDcHl1OEhuc3lSYWhEaVFoWDRTRExJMmxkTWZGRUppS1pUcmYz?=
 =?utf-8?B?TmFna2w3NDVlSERIeFdFZC8zclBJYXlQRk1NRzYvcDI2QnNZNWFUTUtnRkRm?=
 =?utf-8?Q?ptHhsFio54485Y3NYdMTChs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f355ef48-444c-4d93-db3e-08dc86bb2148
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 06:29:05.5079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gMcGr1I1PzBOJxkuk35N482eQno33ATuG25KQ4DlRgaeMeMZ6yx5ttoD+N2xfRZf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6320
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ql2FPkElrTocN2cZhYiYToEusHb7fxydIxjqzybkLMw=;
 b=Ny3e4iF9vpiIfIRFOB2eALwUCj7hDEp+o94dzVs2p/K8hcNEPOeyvDNxxEWjNxEkX1joxgSDS3LqU3lld+xdrlj7nJrHEiCP2yMnetGs74XLP8+1TRd0fDoem6Q+ZDv2/S7bLeoI1UJ4R2dsvJNY/uMWMnN3s//ouglHKO/vr1w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Ny3e4iF9
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v11 1/6] boot/zynqmp-firmware: new boot
 firmware
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Simek, Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

> I had a quick look, and there is something I don;t really like...

Thank you for your review.

> This patch adds a new boot firmware to buildroot for building the zynqmp pmufw.
> It requires the toolchain-bare-metal package that includes a bare-metal
> binutils, gcc and newlib which can be built for the microblaze architecture.
[--SNIP--]
> diff --git a/boot/zynqmp-firmware/Config.in b/boot/zynqmp-firmware/Config.in
> new file mode 100644
> index 0000000000..d68ec2cf6a
> --- /dev/null
> +++ b/boot/zynqmp-firmware/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_TARGET_ZYNQMP_FIRMWARE
> +	bool "zynqmp-firmware"
> +	select BR2_TOOLCHAIN_BARE_METAL_BUILDROOT

> This and [0]...

Ok.  Feedback at the end.

[--SNIP--]
> diff --git a/boot/zynqmp-firmware/zynqmp-firmware.mk b/boot/zynqmp-firmware/zynqmp-firmware.mk
> new file mode 100644
> index 0000000000..383d888fba
> --- /dev/null
> +++ b/boot/zynqmp-firmware/zynqmp-firmware.mk
> @@ -0,0 +1,33 @@
> [--SNIP--]
> +ZYNQMP_PMUFW = $(@D)/lib/sw_apps/zynqmp_pmufw/src/executable.elf

>    $ ./utils/docker-run make check-package
>    boot/zynqmp-firmware/zynqmp-firmware.mk:27: possible typo: ZYNQMP_PMUFW -> *ZYNQMP_FIRMWARE*

No problem on this.  I will change the variable name to ZYNQMP_FIRMWARE.

> [--SNIP--]
> diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
> index 6fe969357f..7d33a68c5c 100644
> --- a/toolchain/toolchain-bare-metal-buildroot/Config.in
> +++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
> @@ -2,6 +2,7 @@ if BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
>  
>  config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
>  	string "architecture tuple"
> +	default "microblazeel-xilinx-elf" if BR2_TARGET_ZYNQMP_FIRMWARE

> ...[0] this are smelly to me.

> It wokrs in your specific case, because all you do is target a
> microblazeel-xilinx-elf and zynqmp-firmware is the first package that
> depends on a bare-metal toolchain to be built [2]

> But nothign prevents other situations:

>  - user manually changes BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH to
>    another tuple, e.g. arm-gnu

>  - another package does sopmething similar with another tuple, like
>    riscv64-elf

> The bare-metal toolchain can currently be built only for one and only
> one tuple, so this can't work nicely.

> Instead, I think we should go another rooute:

>    config BR2_TARGET_ZYNQMP_FIRMWARE
>        bool "zynqmp-firmware"
>        depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_TUPLE = "microblazeel-xilinx-elf"

>    comment "zynqmp-firmware needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
>        depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_TUPLE != "microblazeel-xilinx-elf"

> [2] Note that we already have a few pre-built bare-metal toolchains:
>    - package/arm-gnu-toolchain/
>    package/riscv64-elf-toolchain/
>    So it is not unconceivalbe that at some point we will want to be
>    able to actually build suhc toolchains...

You raise a good point about a user building the bare-metal toolchain for a
different target.  I did not think about this, as I was focused on the Xilinx
use case of needing a microblaze bare-metal toolchain only.

I will incorporate your change in the next version.

However, I do want to add a note.  Xilinx has just released a new microblaze-v
processor core.  It is like a microblaze in that it has all the same memory
and peripheral connections, but uses a risc-v instruction set.

https://www.xilinx.com/products/design-tools/microblaze-v.html

With this release, I can imagine use cases where users will have a risc-v
soft core in the zynqmp and versal products, so they very well may want to
have two bare-metal toolchains.  One for the hardened microblaze cores for
boot firmware and another for risc-v application software.

Perhaps we should start thinking of a solution for users who may want
multiple bare-metal toolchains?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
