Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7928ACC6B0F
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 14:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 266FD600C4;
	Tue, 13 Oct 2026 14:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CM0Zsu505Ntw; Tue, 13 Oct 2026 14:15:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 20E26605D4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791900957;
	b=ILMME0AMVshv9dnPF2pS/TYtvqXpw9djpKo6Ua6Zh6IlB0qL0sIcUgN21OQczurK5B7M
	 FSNreGaZ0AmJNfOIFHiVt5NZ4O8UNDtCwEP+ML2kPtdkzDb4pWGlPf2kk23ypZmKWtsxT
	 FBuAR+1oWWLIq2BAwtAQZ7Qas1fZPatBAKkFU3q2kBKTmX49300z5/rTPXyBzvK4NdXrP
	 Z4FNnqkeofHRjDFe8/DHjRP0VJOMlcVSg5SDYMmGuwTQ/lBmVTuLyna9ldDNAfQ+cfOwL
	 2yaGS4H36c2iECFh48tj2hLbKHs75pWOcnOoCVqgMuLuIOaNwFIEfCTnbqgNshB6SSA==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791900957;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:To:CC:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:msip_labels:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3auYSY05D5X058FoXT37it1ZxQ711vAmNFB6XMR5vXY=;
	b=ktL//6ubBfAXJhaiTWHYizyXEc2fw/veO7p8fk6tnvogwRCayl+/8nJ7925YzPspFYOv
	 7ZKiAJvuWyqYNjYA/Z0U2/BzZIhiwtVlg9gEmFT6iZyHsi1sgXgsSoquvowDDQQgdbmLn
	 W/Z10RB5k+sHyp/X86TH97+4HHVACTLPqfBoyiIfE5Ns6Fl2oJMEVjYHV3OE69sosQsnj
	 pFOa9eQaRhVc599NzAojgne0Lm1MpvWa7ZjnfMyeZ73nK/zfRXipgoXWMzmFQ0ZmXTBQM
	 tzhvDFRFxg9KYQtM47fkijmPrRzQ1V1ALYr3A8szSGvTp5wDH6Sgx+oO0ee/603hRWw==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791900957;
	bh=3auYSY05D5X058FoXT37it1ZxQ711vAmNFB6XMR5vXY=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RizRl1O/OIXiGtuGaF6d//NRfEDq1ZCLcvAc9j4HCRmQJDHvbHl9WzHPSzjAPC2Jb
	 yPKaOauV6sOLYjMQT1NJQgqNventVNa/D0eZqiMV/J3GShRxn61Z9/YvVBQ27oHaMB
	 Cp91Z1LNXr9kQ4vRUh6YwpxjAjtHM03bLrSuQTSGTKTNoDygwma3djUIRhD8t6AJYW
	 gC+saPIPFvTbZhBXwAZWvJlgwFxqvFOMYeE8CxfKFkdq6/pnCA3CjIbQr49PJu4yWe
	 KWmwOyAMihRbQjjJhU3rTTy8njueo3WYwpg9grjdSMaTRG6y1VSv7htzd4kmLKGSBr
	 DhPd6Y6kG07gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20E26605D4;
	Tue, 13 Oct 2026 14:15:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 56FF7788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48F3080BD1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6VQsm_kTQHsf for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 14:15:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 89501809BB
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791900954;
 b=ieW73hzklM6Rhob91m8W7I8+pm6njBOKF5CuUSwup6/c1vVJc+VMC8Glqs8PIe7DLGnv
 WaT70E+P/Y6Sh7a7+dXpyyJw9qkAfmUFM0qD1fs58youVq3Q9D3VzmIU7gx9QBbmf8orz
 2JtFdTNKTV3gcHmXSE9ImvrdbKiWm0wSM1AuyntsDtOGRdKVIxsUNEiI9PWVgK53Li/3D
 P7G0r4456Lomz9ThnV3KnoUp7SJO0bTmS4mzMZrR8vDZgVjrabOZ+g2qEryk2uidYOs+y
 kMCzbWqUjnIvEVvN+cfRZbG7rR8EwjMaZycmZBwOdP4S28eZhFKsMl7Y/iEpxTmGPpA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791900954;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:CC:Subject:
 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
 x-ms-exchange-antispam-relay:x-microsoft-antispam:
 x-microsoft-antispam-message-info:x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata-chunkcount:
 x-ms-exchange-antispam-messagedata-0:Content-Type:
 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=v1k9zpitPI/WFDxKCNtX4l3E5fL8n6v0Rg/I1nQoHQU=;
 b=eAGE9HgP9m3g7cjE84q/kW6sUegSU0fwMOtsWx3eJx1kvpJtGd1IAlZcpFAd2iWmivtx
 3RGt+tqWhbm0+F6Gmacngpc7NFtb3gVJJZmVIpeL0///q/zTPB9kiHbgbXSZmgSX1aMQ5
 gbElbXb41j7Q9vZ2h6k/fqM9Iycn288rRmO2KOAL2r3zJGEgCfcwYPtuoAr+pxGZYS2s7
 X8Hn6JApkfqH7zXFTjmPMJdkOY3GvnKhiY3g1Wy7hKZARBOYcuqJpt8vTssB0kwhP+Jtm
 08emdGyqKujNOtfo6CJMl4F0jmzXf+kAQVgT/YVGfbg8Kx19k4h+P40bxaPZ8vcvklg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=pass header.from=amd.com;
 dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=yUdN5uyw; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:c101::7"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c101::7;
 helo=bl0pr03cu003.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c101::7])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89501809BB
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:15:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZd17CazzqVKImAS7oLU7j+Ts31NFRHkxEX0VyljMfK2cEgKv9otfFo0ots8+YkETC+AfTSIgDx0lqhDRh0ug5csIwmbqknOjghkbYw/FtppYU7eoUB1ksujyyANzOkPOLF9oGuMLYkYkRpzCFI6fniOcCpNMkzqzH5VJHirqswDG4i7PYJxtP23gPtjQa8FHsfV7YZT8t+CvTTadgL1nEWLBXA83qazNJOFyTsJwhfXw9XeXOtiwhs94MMNpPyQNsOVzTzumGcstTtww+U+eEwHsGLUtAKfuOwYSR3dKc1ye1GpTzI6p8zCkPcaPABRqVdw5s3RSWjZZa18BFEIVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1k9zpitPI/WFDxKCNtX4l3E5fL8n6v0Rg/I1nQoHQU=;
 b=o4Ul0OWsg04FVNtHO3ZUAk7R5RnC/kuLnKtMnXyT98vZWpkN5DRezFLDDMHRcVj1VNgy160NPTMqHJjWOY/HqHLAyWc8MNLCn+ynd0a3GNIOTrHMljtTddRypZIRoqMw8mnBZ5+i6lKpBxQSOMgBkEiXuxGDtkcLcL3R2bXiEBA+FWbMMfvrUdnEvvCYpSsrp9XUvL1zG2+dy6nWYR30o9aqwkQdFVHh9K/NEOyJbhZMFGt8APs+zUkmyKIP+THwhegTVqCnY19THCg8/Rid1bjyHCPxbevm8Va8bnedKJiBZBLaJInn1Xd/HWDBnecQbJrbMLZSB4uqUA1hZCnsjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by IA1PR12MB6436.namprd12.prod.outlook.com (2603:10b6:208:3ac::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 14:15:45 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 14:15:45 +0000
To: John Ernberg <john.ernberg@actia.se>, Titouan Christophe
 <titouan.christophe@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "alistair@alistair23.me" <alistair@alistair23.me>, "Stabellini, Stefano"
 <stefano.stabellini@amd.com>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>, "Saleab, Micheal" <Micheal.Saleab@amd.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "matthew.l.weber3@boeing.com" <matthew.l.weber3@boeing.com>, Matthew Weber
 <mathew.l.weber3@boeing.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "brian.j.wood2@boeing.com"
 <brian.j.wood2@boeing.com>, "ju.o@free.fr" <ju.o@free.fr>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "arnout@rnout.be" <arnout@rnout.be>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, Michal"
 <michal.simek@amd.com>, "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v6 1/3] package/xen: add custom version
 support
Thread-Index: AQHdUaImp/TBmX38EEW+xC1VEkv1g7b49PaAgAKZyICAAAajcA==
Date: Tue, 13 Oct 2026 14:15:45 +0000
Message-ID: <BL1PR12MB5032341744BBFBBEAF4A49A8F09E2@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20261001124057.1941988-1-neal.frager@amd.com>
 <ff2b41ff-0c2a-44c9-8938-cb39cfb5ca7a@mind.be>
 <90acb039-68fa-449f-8210-cc7887fba92f@actia.se>
In-Reply-To: <90acb039-68fa-449f-8210-cc7887fba92f@actia.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-10-13T14:08:30.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|IA1PR12MB6436:EE_
x-ms-office365-filtering-correlation-id: 598090da-102b-4a3b-2bc8-08df2934792d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|10070799003|23010399003|6133799003|10067099003|18002099003|22082099003|3023799007|11063799006|4143699003|261009223027099003|38070700021|56012099006|41080700001;
x-microsoft-antispam-message-info: eiVWBSWBdQkgD0/GPg59/jUkOU202MXDXWbRqUqDjRLVDQ+gDlMX5Tb/exBSQUDWayQi4Seymefb6DJc99MbBSFUIMkTvtH/K5vtFV00l9jqb1104Vn1vMlJPHIJ4cf7KuDCB/vBTeTy+EUQ/a/LVkzzXFxubSmdpP+o27RtvP0guWackgd7Vd/1LTxk0z///tWSN9/B3dYAfJtjte2zsPipLl8eYzpU9VDP0SntVBFtcUPsedJcT+dmbcbJr97SWRtEhMa3AWAQ0XPoC97TdppmfU+aq0oIYjxFICVNKzaZo1536cQPXsa7Wu+Wi7gJJHdV6Z6UddLQ3b2AjebBvhccn92l6xvXSHoCATEBNMp79RRQ7udwsL3pJWGGq0N3aqPc51ZwiiyKNqaWUR3TkchPT1tRpjsUDpJZPEa7MvKbpeG2xdtFsElscV5ex4aOKhF6EdVFeTH/vW2UVEJEY/ysC24VEaGRb1XvbUsSeNeMtoACNZLOLy6Cg8woL0p8OnZ8h31zVJ2N1QB/9TldBKcrHWendzl5tiOREnB5Q/cZTFrTFTtR3dr+NVJ7u1xVNbuHUQ2UBtO0v0JkjHTIEXwS7KpDI60zuDhxTLsmJP+xVv5q5ckiyXKhdUCcJjGccXACfv/oWTr7cQo+igb+sz2t2lfMrTiN8Bq37WwSG314FZXfKOZzxNKWtBxS+j1Z2OEKJSCopa7k/qjQuM9SYy4p16fwnjlRbO2BK2dbVqAip2wVJ7ZMFsYNAcuqVBjd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003)(23010399003)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003)(261009223027099003)(38070700021)(56012099006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTA2TGRIaTBnYjM1enBOQU1UTW1pZDlPNVd2czFHTWdJeit5Uzc4UkY1Z045?=
 =?utf-8?B?bTVwa3YrNVEyejBZWlpIVkdPWjliTUVZZEhQbVJMVjhidzhINXh2Yk82MDVZ?=
 =?utf-8?B?MldKVnNIRzhoWE5LUjc5K3pKRS9vVlplQVh6TUxqSFFVVlVMVERzc3A0NE5x?=
 =?utf-8?B?N05Xam9nWHQ1YXRDVjc0OUVaeEFyUk0zZEVQcmF3TnVuZk5FanRWN2VGQjNm?=
 =?utf-8?B?NFNSS2dJMUNtY0FxK25kdFZPcUthVGtrMkp0RVU4VjlUNVZsV3FicjA5UHRM?=
 =?utf-8?B?eFR6RXN2dENVYzByWHhUdGVRbzZFWHJrdE4wTjhpaGZPbldpL2R1K3E3Ky9l?=
 =?utf-8?B?Y3dkKzJMckE4ZThVNk96RUo4eU5RdlNadWtwaHdjdGpRbzM2U29iSS9VcThH?=
 =?utf-8?B?MHUvQXYrMkErRU92eVNmTUthd3dkcU1PRTJaQm1zbGUvTTcyM1Q3QitGRGJ4?=
 =?utf-8?B?RU1pcjFnQWsrQWtseWYybERtd1FZbkErOU1sMlovRk1VZ1FQbzE2MkZMNDlq?=
 =?utf-8?B?WkZCMW1GS1dEN1hkOVphVmlFOHFWaEdMYW0rUXRocHd5WE1vdjFQZmZ4a29X?=
 =?utf-8?B?SForLy82VTVxZzAzZG00Yk5XZGY5T211eHlQUEJKN3l3dlZPTzl2RWZoNFNk?=
 =?utf-8?B?T3J0aVJrWHl6a1ErZUVYcXJoMno5b0E4N3pDNlkrZWR3Q0lUbTNXVWhLdGZS?=
 =?utf-8?B?bUpsUEdFc1MvV3ZRMWFQTlgxbGdYcS9hWDVOOFNjTWNBSzlBQ3F2YTFiOWsv?=
 =?utf-8?B?L043My8wSjcvL3c4K1prUU8zbmVDRHR0NHVsbEV4QnRIQnlVRkdVejFvc1Rr?=
 =?utf-8?B?dDRkTC80cnNPZi9DaG0wMkRrK0J0VjJ1Y3VVcHlZSDlKVGs1TnFjYTU4MzNh?=
 =?utf-8?B?RVpGUjZWWFFqSFhTYXFsSkhYMVpYL2lYbCthV2IydCtxUEFWWHJuUHFUQmU5?=
 =?utf-8?B?TjdMTE5qRy9wSHFhQ3NFUGJQbGJ0OUJodVBvK0M5VXJjWkdaM1dId1hlMXlZ?=
 =?utf-8?B?ZTFsNGpNOVVQQ1FzRVJxelg3RXpWQ21DVXFmYk1qNytyTlNwQWdXZjR2KzMr?=
 =?utf-8?B?VFdXbWpMelowNnJSNXJHSjlVc2xNM2M5ZFN0RU1FT2RhcWRib21BWlRjcXRM?=
 =?utf-8?B?bWl2bjRPeVI4eExCQ0JON2RoRCtSWFl2aE9MT2FyblV2eTV2a3lBNzVpaTJ3?=
 =?utf-8?B?V0RKL2drNk9mNnZXNFZ3MnM2aWttVlFFbEhtZUdsd0dsWlBPSTZsRVpaeFlF?=
 =?utf-8?B?MnNhekIyUU8wR3NtelVhS3JCaHA0VTdhT2QwaUpsd09zRkk1ZDhjWVpDODkv?=
 =?utf-8?B?T25wQkxuOVFieVhQTzB3WU9BZURUK3lhaVUyWldqSWROTGM2Y1pYbjlwNHpI?=
 =?utf-8?B?RG52ZkpqQXlvSTN3Ti9weS95UW8vRWRSNkdIMjREY2V2RktlWTZiQW1VWHRo?=
 =?utf-8?B?YWgrSUNXUUtpeHJabjk3UnNFVU1neWR0am5FOXZBM2xiRld6U1dpeUkyU3A0?=
 =?utf-8?B?N1JUMHd1amJicUZiVnhuMnc0czFFM1hvenFnOEx5Z29UbU9KYjRKR2pER3ht?=
 =?utf-8?B?dEZCYThKUWFsdHovOExHNkFOZnpndEp6WlRPUHJBTXgzVXE4Nnh0anZMd2Vh?=
 =?utf-8?B?OVFLWXo4T1BOc0dYZm56cy9HMW1oWHVsMVVJTmZYeitHdThDWUJzMFYxWTJq?=
 =?utf-8?B?cDVGdnZBSUFQTFo1M1dLYjJtQlVISUMveUhVbWNRQnUyMjJoQ1NzbEVQQ1NO?=
 =?utf-8?B?UWsyVExTU0kxR0JpVEZkaHZ6UlN3VTFiNEJKN1dwaVhUdlhhODlhUFYxRjI0?=
 =?utf-8?B?N2N3cytHeWlTM2taWWVRTTFoejE1ZFo4RWRxMy9uMEU0a3I4L085aEpWK3R4?=
 =?utf-8?B?WnU0T1dSZ3gydkt1NlR1RGNjRXlCL3hFZFVXc2NwSjJLMDBxVDY2em9OWnJK?=
 =?utf-8?B?cXZWZDQ5K3VJVkhCT0l6cWtPSXF2bU1xY2NDd0d2RUYvNlF0ZWs5aVIrNEpH?=
 =?utf-8?B?UlQyT0pTQXArNkRjWFFWRDBHaWd6N3RGY0NseENwbURnU010TnBmQitBRnFs?=
 =?utf-8?B?djZOQlA3OXpzMnh0ZCt5TlJzc0U1UFF2TUpINEoxOWo2dXo1eHhTZ0tuYmVI?=
 =?utf-8?B?MktlZjhxcnBqN0ZMQ0NNYzd3TENLbnltZ3RzTEQ5a1E1SlVYWGZ6OFdqOFdP?=
 =?utf-8?B?NkpxRU1MSzloRlNCNFBtSFRLVHdiS0d3UkJmY1BOdGpZaFBZMjVKZkpabDJN?=
 =?utf-8?B?NnFkNHYxNEhmWlk3bGJtaExuUGtOOStDUld0aXNrWW1TaXRucndsU21OaEhC?=
 =?utf-8?B?Um9GTDloUEdPakJhYWNUSDV2djM4NVRIMm9Wak9VV2o4Mm1Vc20wWU8wcmlB?=
 =?utf-8?Q?LuSjYJV7e99T3AzKFR7jNgaUxlGKRVk+tloKh?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 598090da-102b-4a3b-2bc8-08df2934792d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 14:15:45.7540 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xpvjZhRfDYQaWEdBFH2kbDtBPBob1OQg/H30NfRYHvQ3wrfwbZ+cMf/KYeqD3Xla
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6436
Subject: Re: [Buildroot] [PATCH v6 1/3] package/xen: add custom version
 support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

AMD General

Hi Titouan,

> Hello Neal and all,
>
> (replying to this first patch, but the comments apply to the whole series)
>
> On 1/10/26 14:40, Neal Frager via buildroot wrote:
>> Add the ability to configure specific Xen versions while leaving the
>> default
>> version unchanged to avoid breaking any builds already using Xen 4.22.0.
>
> We brought this topic to the Buildroot developers meeting this week-end
> after ELC. While there was no strong argument against merging this,
> there wasn't any in favor either.
>
> What was agreed upon is that it misses a justification for doing so, ie.
> what is the actual reason prompting for this feature ? An alternative
> could be to package these alternative Xen trees in a br2-external, or to
> use OVERRIDE_SRCDIR but there might be a good reason for not doing that ?

> Our use case is that we receive a Xen git-tree from a 3rd party with
> additional features implemented that are not available upstream yet.

> We currently have our own Xen recipe which we need to maintain which is
> a copy of this one, replacing the download bits.

> We're not using the qemu parts however.

I confirm that this is the same use case for us.  We have some nice features
such as cache coloring that are in the xilinx/xen tree, but not in the
upstream xen.  Being able to use the xilinx/xen tree would be beneficial.

Also, I think the qemu is not a requirement for most customers, as you can
run xen on hardware without building the qemu and all the tools.

>
> Moreover, Xen has a track record of regularly breaking the build and
> requiring manual tweaks to xen.mk. For example, since Xen 4.20 no longer
> bundles qemu-xen in its release tarball, the bump to 4.21.1 required
> adding a separate qemu-xen package to avoid downloading submodules from
> the internet during the build.
>
>> To test:
>> BR2_aarch64=y
>> BR2_TOOLCHAIN_EXTERNAL=y
>> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
>> BR2_PACKAGE_XEN=y
>> BR2_PACKAGE_XEN_CUSTOM_VERSION=y
>> BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE="4.21.2"
>>
>> Add to package/xen/xen.hash:
>> sha256
>> 9c5c2ad0b4ab86ddd378f60ecc5b1ed53d36b436249ba27c86831003e1281fa3
>> xen-4.21.2.tar.gz
>
> Additionally, all your patches mention manually editing xen.hash to add
> a new entry, which somewhat defeats the purpose of the custom version:
> users could as well edit xen.mk to chose an alternate version.

> That looks like an artifact to me, it also works to place the hash file
> in the global patch dir.

Yes, the only reason why I put the hashes in the commit message was so the
reviewers could easily test each patch. Adding hashes is something a user
will always need to do for any package if they change to a version that is
not a buildroot default.

If you want, I could add the hash for the latest Xilinx 2026.1 release tag
to the xen.hash file as part of the patch set. Then users could switch to the
Xilinx xen tree latest version without needing to add a hash for it.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
