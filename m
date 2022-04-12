Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E756C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 11:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1704408C2;
	Tue, 12 Apr 2022 11:15:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3P42YRnOAKFY; Tue, 12 Apr 2022 11:15:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B475408A9;
	Tue, 12 Apr 2022 11:15:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 205F81BF865
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 11:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E4A460F1B
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 11:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com header.b="uyvMTtPM";
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.b="dqxh78Dx"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OZ35NyRawsDe for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 11:15:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ACD0860E95
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 11:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649762106; x=1681298106;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gry0IHRlF2pvq2o1PN1R9R2dGgC+zGRx44KGt/K1b70=;
 b=uyvMTtPM2on8jaatjpMWVeW2MJK+t6VOskK8zad0Yw8sDGIL3/t3fhw0
 sNNZcaQ0YL5TF1VlzdWpnCzfVNtdPhWAplOGGbMiP4XZT5lIQyhxHxXR5
 bz14q6LUsvQY97Zr6EYT+6lxD1HlIrFT1LuVvUsUxTOw7w2I1QDPvD5Zz
 lmROuhUcHcCzSy7df0nSee16RWbFVzGZVI58CxR9Xio2YWbUSDKeIXv6b
 SnsAUQQRXKphPnse7geHPp5ljOVeEtjSGGuYIRmGBsA9K4gF9AoFeKL3C
 9UG/Ju/vlxQzVEaZR1BX757NY3SWVqgsTPrh4vPRot1qSOSJcitRtORss w==;
X-IronPort-AV: E=Sophos;i="5.90,253,1643698800"; d="scan'208";a="159805486"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Apr 2022 04:15:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 12 Apr 2022 04:15:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 12 Apr 2022 04:15:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPAyjrkGlHvfKtNRbdA3uAPAThcIkAUKQwne3/S7MkWRWjgWKGrS8M7DGNNjwnKnrCBWg5CyNZrRKflApSQVLkR8oJvPijUw/RI0lVkgqVI8IfxpjwmKOobRyEyJzLrhooPOzwUErAZDccp7s/B3JY6ytnUQx8Eqqa0f5r0Zktm28GknSCyATn+MT1Ln0m6Pr1KhuWEKm1JPpxhC+flUmkg4MqkY+xXymm3ebEMPVL97abQxgk/+aZkweCSf8CiSjgLv52/TMu7TD6Tvj9xyfdhOnOoM+okD4jS8ov+PRGLrgOGyxeFH9Y4qp2Ls26rcyUoXOrU9eIAiG0e0yi64Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gry0IHRlF2pvq2o1PN1R9R2dGgC+zGRx44KGt/K1b70=;
 b=MXlNsdBM7yGGQdb0E9G4ia2iaPEPMZx9pM0OcN7tpWifw3bNBE5CJywnymsbm21DeuPvX4+SvpnMchTeyDasx8MfH9wJ1TT1j9TSrd3WflJSmWNxOCcLeuhuJebD0BJNNjcpQ8mLU4qjeMm6vP/tB2PtyzHW0YK6QbtvTRmhMGfGLyLXnlKAP6G6HDtI1/v5rNwh2NTGSvOXUWLrLNYEpcWgYrdQBY2NDLLkUCuxnCJ1EIIj5EtqM3WqVc0DwWuC2VynDaCQcZy3d6XbDK8mXZUtYGMu2r6gooHGdfcZdJwh32/kkTLGHCcxHBbYjPrgnPJkNq0VRYZ9oUctCcQkpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gry0IHRlF2pvq2o1PN1R9R2dGgC+zGRx44KGt/K1b70=;
 b=dqxh78DxQcxnsUvq+4NeRRmTXuXKd4d36oy0vehIlQIZDF9o/nBdD5lqo67Zj9syEZi/C4rfa8KG7aigTMtTqHmtOgw7dtGyUNs8LYw/ELWQhnJuDt5v01fkU5lOetWhdW774F7rcIR6oc1sb0bFsZSDyBzn58VE6Dt22GjxViQ=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by MN2PR11MB4318.namprd11.prod.outlook.com (2603:10b6:208:17a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Tue, 12 Apr
 2022 11:15:01 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2%7]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 11:15:01 +0000
To: <peter@korsgaard.com>, <fontaine.fabrice@gmail.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
Thread-Index: AQHYR0JpgDXy8yOndUCgsHWNqLT5WaznqG2KgASGI4A=
Date: Tue, 12 Apr 2022 11:15:01 +0000
Message-ID: <d1a1ead3-98a8-35fe-4c4c-e7fd3f02e058@microchip.com>
References: <20220403100318.2581647-1-fontaine.fabrice@gmail.com>
 <8735ims60b.fsf@dell.be.48ers.dk>
In-Reply-To: <8735ims60b.fsf@dell.be.48ers.dk>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfd94b42-7d5d-4021-6d40-08da1c75afe5
x-ms-traffictypediagnostic: MN2PR11MB4318:EE_
x-microsoft-antispam-prvs: <MN2PR11MB431831094C835A5FC21DD3C8E8ED9@MN2PR11MB4318.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r5uNjUhPHVWeZu6vkZdwZKOz/PVNgcIhaYr8hN4AmwVdXj1CFwOS2lfneeTgYwOS1IwfrK1Xqjgd576642dmr8xpMrvpix4juvyfwhJHq+Mbtup1n2orc6UStPLkcW9qAuHQr+PfR78PGrDAEBpSEFBBxyEvWJIYV6ukNaYB9l+WqsaxT30MoY1BFrKy/tEN2HJNG1hooXbnbH2jFSW8knv5u1PY24u49cVb9asT5JTVbEvyFDqWpvlqQyPv2R3T2TuuV++ongxXxcyNPNNE44Ci3dRsRazoo7Jv7+E85b9HqVpHe9DkyuTHfQUhjikTlnLmJLv2P3cCtEjmouHV3hSLwCOIP6P52/TT1pAp1Z8CrhA1nYHe84WI2vNiwjEL+WFGASxlOJa8yo2rcS1OazrvibYHT2IwQUZ8pSHucrb/3nepK4+Uo7lSYB01w3mGcTIwn7qDNU11MKzvb6oh+9wKWHlhIs3mPXBGU7ejyCWadaC6gWUbryVIzbQ/oqfKAeYKY673DDWu0rGJxo0LgNtmCXG0Jo6F4hpI/occr3iyjpL4DSahQIUYOsSQSSL/jYtPTKOLpmLalSzOYRJLOLF14oojqXv2JrVEmcFyK7HOnTRdTtT5pl2Ky6puC9anPbWJC4i69rhR8HsbBhI+N5HkUxBMe75kxSDWXboO21Da4HwJfnxhk0/rG1jMDmq3paznoK8d7I/siOPXnlNRUh3G6pVqyIG58dRvLb5UDbNNROrE6IJ5sVITIc+5zG5CGzRnP/oHSXYoIFuql2XTnKrdldPAS6JYVnsf9looAslfZniFO+5dodGIPGtaxGsl79KP5T2PCDOVylQd00s2BvKhqH8v8QMouVd37qsK7xg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5384.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(83380400001)(316002)(8676002)(66946007)(64756008)(66446008)(66476007)(66556008)(38100700002)(4326008)(122000001)(91956017)(966005)(6486002)(8936002)(86362001)(110136005)(76116006)(53546011)(71200400001)(36756003)(38070700005)(26005)(186003)(2616005)(31686004)(2906002)(5660300002)(6506007)(31696002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2VPZHhkYlEvNzQwdzNDV3lFOVhNcUlnQUFrWFE0Zm5HQUlOd1JIQjBzbFZR?=
 =?utf-8?B?WVRxL1M5bTFRM3ZuNUNOaVpPalVEZWxReWVxcHkxZkxBNW4zNUNVUmprY2FD?=
 =?utf-8?B?TE5UNWpTKzY4Z1hwNi9KUVVLVk1BYnRoQ2t0YkVKQVhnSnowd1FRQTJna2VU?=
 =?utf-8?B?cDI5TDVqVk9OUzVMRVI2NVFsbkt1dDZxZnc4OEZEQitvZUsweVNLalJkVXFx?=
 =?utf-8?B?Wm1hbGdMWHNWSXlRbmZHTTZPR0FWYS9NcmdvdFNTV1FqVEYybnpmaU9MYlA0?=
 =?utf-8?B?ajRlaDRoS0Vnb0xheXl3cmNmT2pzUEpEREtacXVzdWxpNzVwMnMwYWd5WEQ3?=
 =?utf-8?B?UDZtNW9BWTNZSDNhTHptTCsyUXNOSTJjNXE0Uk5JL0ZOZmRXVGRwWnlKNHor?=
 =?utf-8?B?eHlkdy9ZQzRMWElTZ3hvdVRBOC9KZksrSEdqeHNUZExVQzZLeW1TckRidlh1?=
 =?utf-8?B?aWg4RkxiUE13OFZmUm5PWm1TQ3NjMDFUdXRERWFXMmU2eXdrSnFTM0dVRkZi?=
 =?utf-8?B?bVErWmxmaU9Eam5GanUzR2s4TTNDUGpOb3d4MzlodThYc0lRNUYzVDZNaGJ6?=
 =?utf-8?B?YUE1aEtlaTlsYjVFTVpUVmFVQmJxNjFPYWZQSUxwR0RZQ2FZNXFVWWlTN2t4?=
 =?utf-8?B?UEJoTUxTUUE0aEVYbmU4UE9FRHlOWGZYUEUvRTlXOUgySGpZTjJDNzBPK2py?=
 =?utf-8?B?eCs2K2YrWjYxZWlBUVBDOEhTVG1WMkpqNm5kaU1VVlpoK0xRYU1hZFlxQkNO?=
 =?utf-8?B?QUhMY1pkOFA5Qm5YNit5QWlRWTNRQ2IwWks1MEliSWpLVmV1THkxYm9jbGR2?=
 =?utf-8?B?a2FKdnBseSt3RGZwaEhhcVRBM2Rvd0FmM2x2bS9wMzJucW1GcDM2TkFYWVhs?=
 =?utf-8?B?N0Y0ZWlSMVhOc1d3Ny9iVzVIbTU1Z2ZwQlJmQkovUkplam9yb0JrNXo4RXdB?=
 =?utf-8?B?S0ppMVRSdFZSZ0l5S1ZqTlBEOXQzN2UwNlp6L1U5WU9VTUtRV2wwTUNzaXpl?=
 =?utf-8?B?OVJEcy9Ed0FEeHZaOXc0UW5oYXEwU295UHhBT0gxazZ6SVJObTN1L0dKa2V4?=
 =?utf-8?B?aDU2L1hpb0JZZmEzWE9sZ2FibFoxL1liUzV1aGdNaHJlV0Q1NlgwTW5vNzdt?=
 =?utf-8?B?aVBKai9saGVDNlVqMXBSdjZrVFpCMXZhZG1jQ0lhSVVFVFdiSldRa2JPczBk?=
 =?utf-8?B?WEVZeTVTSDRTc3JuS1pleGVxN3k1TVpWcnRxMlVTaGNOd2cyYWY3akdTVzZE?=
 =?utf-8?B?ZFVySWVoVlFEVlVraUVkUWpYRWdEUUFKVGM0Wktva05laXVhUDhNOHdYNGp6?=
 =?utf-8?B?U2ZkYnZoc2VKMkd5eHVNOGpnQlhGSzBQL3Y5bUM5ZkVOcnQ1MndVRmFJU3FP?=
 =?utf-8?B?WkxtV1hLMUtkN1lmL01ENkZBUnpJOFRNUDF5YmU0U29rdTFHK283MUgwaktr?=
 =?utf-8?B?Uy9vZzZBNHVIUE1MM2dxUnlwVm9PejA1WWR5QysvVklsZDRyMGpoV09Ibm9H?=
 =?utf-8?B?RmVxYm82d0ZKTzBDQmFpWTBOUzdDYVlWVkl0MVZySGk4WDNVcjFYWnJFR0NE?=
 =?utf-8?B?WG5mbzY2Rlkyc3pTeFRPTGxHVW5LazBHT3hJYnhGMkh4NUdqRjQ1WEkrSFFX?=
 =?utf-8?B?OXFRV3UxZVdwaHlJV05aR3FjZEE0OVNxRG5veXNEclNGMWU4Z1dKakltWTZV?=
 =?utf-8?B?NGVOSU11RFNNQ3RVVlF0eFNUZWFEK1UvaVdlYjFDSVp1WkFROVpHQnpxanRT?=
 =?utf-8?B?KytOeU5aTGpiTWZ6Uy9OV29UOUJZMkJYK0N5TVZ6TDE3VnhvY20rcE5VMXZ4?=
 =?utf-8?B?amx3eTdkemdyaGFFejY4aEs2TmtFS0FuSVprUEF4ZWxBZFhEekUvVytGMTVB?=
 =?utf-8?B?TmwrVFVPQXhYb25jQWFWWW9lYmhxSHkxZXUxMzgyL0hUUG8wVHlvMEFHVnkw?=
 =?utf-8?B?MzJHWCsvdThWd1gweWpaUkd3S0hpUmVLenhHWGxSazdKbFE4L2RvRnd0U05S?=
 =?utf-8?B?aTl1R1dCL2JzaTl2dEtqMW5nbEZvTlI3SkplZTNlazVwcmNXVjdJR2lUSTNq?=
 =?utf-8?B?VDJjNGpWd3MzbGc5TjB6Z0VWVEpFdU9WeDdSamxMenlNbmovQkhMTEYyL1BU?=
 =?utf-8?B?V2JwemxTWXNxaDcvbmJvOFRTUWZTd0I0aDZ0YWR5THZ1Vi9VTkRkSnhJcDJ4?=
 =?utf-8?B?OXIwZlZlZWJjWk8yaXFYM2pOTzk0ZGsrcEFHWjZNbTRYazVpbzlobEdvMGdl?=
 =?utf-8?B?R0twbGlQUG5tUlRrV1VvRlZaMXBPczRVekJzaTNsbUhrcmgxd0IyWTg4Mk83?=
 =?utf-8?B?TTY2dWlRdmhxekI3WGwzSHU0N2dIcU5keVFZUy93cVNVNzd4VU1mNC9oQnJv?=
 =?utf-8?Q?4ldEHAquctDudMw4=3D?=
Content-ID: <95CDFFEDA39A58459FB3838B16CB2FBE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd94b42-7d5d-4021-6d40-08da1c75afe5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 11:15:01.2740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fCcey/Hjw18zwDtNI8RfJmxfv8mQ51swOzpPhHrpChasJpT1bIt7T5Voo/Q31JERQrqx7Ztf/CH4pdrYMyiaGy3AAJfSBvIzlBXUg25sIe0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4318
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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
From: "Eugen.Hristev--- via buildroot" <buildroot@buildroot.org>
Reply-To: Eugen.Hristev@microchip.com
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gNC85LzIyIDU6MDkgUE0sIFBldGVyIEtvcnNnYWFyZCB3cm90ZToNCj4+Pj4+PiAiRmFicmlj
ZSIgPT0gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyaXRl
czoNCj4gDQo+ICAgPiBVc2UgaW50ZXJuYWwgYmluZCBhcyBkaGNwIGRvZXNuJ3QgYnVpbGQgc2lu
Y2UgYnVtcCBvZiBiaW5kIHRvIHZlcnNpb24NCj4gICA+IDkuMTYuMjYgaW4gY29tbWl0IDhhZGVh
ZWM4YWZhY2JjNjgwZWRlYmFlOTE1MjRmNjE0NDkyNmFjOTIgYW5kIHVwc3RyZWFtDQo+ICAgPiBk
b2Vzbid0IHBsYW4gdG8gZml4IGl0IGFueSB0aW1lIHNvb246DQo+ICAgPiBodHRwczovL2dpdGxh
Yi5pc2Mub3JnL2lzYy1wcm9qZWN0cy9kaGNwLy0vaXNzdWVzLzIzMyNub3RlXzI3Njg4Mw0KPiAN
Cj4gICA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9pbmNsdWRlcy9kaGNwZC5oOjkxLA0KPiAg
ID4gICAgICAgICAgICAgICAgICBmcm9tIGN0cmFjZS5jOjI5Og0KPiAgID4gLi4vaW5jbHVkZXMv
b21hcGlwL2lzY2xpYi5oOjUxOjEwOiBmYXRhbCBlcnJvcjogaXNjL2Jvb2xlYW4uaDogTm8gc3Vj
aCBmaWxlIG9yIGRpcmVjdG9yeQ0KPiAgID4gICAgNTEgfCAjaW5jbHVkZSA8aXNjL2Jvb2xlYW4u
aD4NCj4gICA+ICAgICAgIHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+DQo+IA0KPiAgID4gRml4
ZXM6DQo+ICAgPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9kMThi
MDA2ZGNlN2I0NjYzMWNlOGY0YzcyZmI5N2ViODYxOTkzOTM5DQo+IA0KPiAgID4gU2lnbmVkLW9m
Zi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+DQo+IA0K
PiBDb21taXR0ZWQgdG8gMjAyMi4wMi54LCB0aGFua3MuDQo+IA0KPiAtLQ0KPiBCeWUsIFBldGVy
IEtvcnNnYWFyZA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXw0KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0DQo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
DQo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dA0KPiANCg0KDQpIZWxsbyBQZXRlciwgRmFicmljZSwNCg0KV2hpbGUgeW91ciBwYXRjaCBzb2x2
ZXMgdGhlIGlzYy9ib29sZWFuLmggcHJvYmxlbSwgbm93IEkgZ2V0IHNldmVyYWwgDQpvdGhlciBw
cm9ibGVtcyB3aGVuIGJ1aWxkaW5nIGFuIGFybTkyNiBwbGF0Zm9ybSB3aXRoIHRoaXMgcGFja2Fn
ZSA6DQooc2FtOXg2MGVrKQ0KDQpDb3VsZCB5b3UgaGVscCBwbGVhc2U/IDIwMjIuMDEuMSBpcyBi
cm9rZW4gZm9yIG1lIGF0bS4NCg0KVGhhbmtzLA0KRXVnZW4NCg0KDQogPj4+IGRoY3AgNC40LjIt
UDEgQnVpbGRpbmcNClBBVEg9Ii9ob21lL2V1Z2VuL2J1aWxkcm9vdC0yMDIyLjAyL2J1aWxkcm9v
dC9vdXRwdXQvaG9zdC9iaW46L2hvbWUvZXVnZW4vYnVpbGRyb290LTIwMjIuMDIvYnVpbGRyb290
L291dHB1dC9ob3N0L3NiaW46L3Vzci9sb2NhbC9zYmluOi91c3IvbG9jYWwvYmluOi91c3Ivc2Jp
bjovdXNyL2Jpbjovc2JpbjovYmluOi91c3IvZ2FtZXM6L3Vzci9sb2NhbC9nYW1lczovc25hcC9i
aW4iIA0KICAvdXNyL2Jpbi9tYWtlIC1qMSAgLUMgDQovaG9tZS9ldWdlbi9idWlsZHJvb3QtMjAy
Mi4wMi9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2RoY3AtNC40LjItUDEvDQpNYWtpbmcgYWxsIGlu
IC4vYmluZA0KL2hvbWUvZXVnZW4vYnVpbGRyb290LTIwMjIuMDIvYnVpbGRyb290L291dHB1dC9i
dWlsZC9kaGNwLTQuNC4yLVAxL2JpbmQvYmluZC05LjExLjE0IA0KYWxyZWFkeSB1bnBhY2tlZC4u
Lg0KQmluZCBsaWJyYXJpZXMgYWxyZWFkeSBjb25maWd1cmVkDQpCdWlsZGluZyBCSU5EIGxpYnJh
cmllcyAtIHRoaXMgdGFrZXMgc29tZSB0aW1lLg0KQnVpbGRpbmcgaXNjIGxpYnJhcnkgaW4gDQov
aG9tZS9ldWdlbi9idWlsZHJvb3QtMjAyMi4wMi9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2RoY3At
NC40LjItUDEvYmluZC9iaW5kLTkuMTEuMTQvbGliL2lzYw0Kc3RhdHMuYzogSW4gZnVuY3Rpb24g
4oCYc2V0Y291bnRlcuKAmToNCnN0YXRzLmM6MzAwOjI5OiBlcnJvcjog4oCYdmFs4oCZIHVuZGVj
bGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgDQpkaWQgeW91IG1lYW4g4oCYdmFs
dWXigJk/DQogICAzMDAgfCAgc3RhdHMtPmNvdW50ZXJzW2NvdW50ZXJdID0gdmFsOw0KICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fg0KICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHZhbHVlDQpzdGF0cy5jOjMwMDoyOTogbm90ZTogZWFjaCB1bmRlY2xh
cmVkIGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIA0KZm9yIGVhY2ggZnVuY3Rpb24g
aXQgYXBwZWFycyBpbg0Kc3RhdHMuYzoyODY6MjA6IHdhcm5pbmc6IHVudXNlZCBwYXJhbWV0ZXIg
4oCYdmFsdWXigJkgWy1XdW51c2VkLXBhcmFtZXRlcl0NCiAgIDI4NiB8ICAgICBjb25zdCB1aW50
NjRfdCB2YWx1ZSkNCiAgICAgICB8ICAgICB+fn5+fn5+fn5+fn5+fn5efn5+fg0KbWFrZVs0XTog
KioqIFtNYWtlZmlsZToyOTA6IHN0YXRzLmxvXSBFcnJvciAxIA0KIA0KDQpCdWlsZGluZyBkbnMg
bGlicmFyeSBpbiANCi9ob21lL2V1Z2VuL2J1aWxkcm9vdC0yMDIyLjAyL2J1aWxkcm9vdC9vdXRw
dXQvYnVpbGQvZGhjcC00LjQuMi1QMS9iaW5kL2JpbmQtOS4xMS4xNC9saWIvZG5zIA0KDQovbGli
L2xkLWxpbnV4LnNvLjM6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkgDQogDQoNCm1ha2VbNV06
ICoqKiBbTWFrZWZpbGU6NjA1OiBpbmNsdWRlL2Rucy9lbnVtdHlwZS5oXSBFcnJvciAxIA0KIA0K
DQptYWtlWzRdOiAqKiogW01ha2VmaWxlOjU5OTogaW5jbHVkZV0gRXJyb3IgMiANCiANCg0KQnVp
bGRpbmcgaXNjY2ZnIGxpYnJhcnkgaW4gDQovaG9tZS9ldWdlbi9idWlsZHJvb3QtMjAyMi4wMi9i
dWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2RoY3AtNC40LjItUDEvYmluZC9iaW5kLTkuMTEuMTQvbGli
L2lzY2NmZw0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIA0KL2hvbWUvZXVnZW4vYnVpbGRyb290LTIw
MjIuMDIvYnVpbGRyb290L291dHB1dC9idWlsZC9kaGNwLTQuNC4yLVAxL2JpbmQvYmluZC05LjEx
LjE0L2xpYi9pc2NjZmcvaW5jbHVkZS9pc2NjZmcvYWNsY29uZi5oOjI0LA0KICAgICAgICAgICAg
ICAgICAgZnJvbSBhY2xjb25mLmM6MjQ6DQovaG9tZS9ldWdlbi9idWlsZHJvb3QtMjAyMi4wMi9i
dWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2RoY3AtNC40LjItUDEvYmluZC9iaW5kLTkuMTEuMTQvbGli
L2Rucy9pbmNsdWRlL2Rucy90eXBlcy5oOjIzMDoxMDogDQpmYXRhbCBlcnJvcjogZG5zL2VudW10
eXBlLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCiAgIDIzMCB8ICNpbmNsdWRlIDxkbnMv
ZW51bXR5cGUuaD4gLyogUHJvdmlkZXMgZG5zX3JkYXRhdHlwZV90LiAqLw0KICAgICAgIHwgICAg
ICAgICAgXn5+fn5+fn5+fn5+fn5+fg0KY29tcGlsYXRpb24gdGVybWluYXRlZC4NCm1ha2VbNF06
ICoqKiBbTWFrZWZpbGU6MjQxOiBhY2xjb25mLmxvXSBFcnJvciAxDQpCdWlsZGluZyBpcnMgbGli
cmFyeSBpbiANCi9ob21lL2V1Z2VuL2J1aWxkcm9vdC0yMDIyLjAyL2J1aWxkcm9vdC9vdXRwdXQv
YnVpbGQvZGhjcC00LjQuMi1QMS9iaW5kL2JpbmQtOS4xMS4xNC9saWIvaXJzDQpJbiBmaWxlIGlu
Y2x1ZGVkIGZyb20gDQovaG9tZS9ldWdlbi9idWlsZHJvb3QtMjAyMi4wMi9idWlsZHJvb3Qvb3V0
cHV0L2J1aWxkL2RoY3AtNC40LjItUDEvYmluZC9iaW5kLTkuMTEuMTQvbGliL2Rucy9pbmNsdWRl
L2Rucy90c2lnLmg6MjgsDQogICAgICAgICAgICAgICAgICBmcm9tIA0KL2hvbWUvZXVnZW4vYnVp
bGRyb290LTIwMjIuMDIvYnVpbGRyb290L291dHB1dC9idWlsZC9kaGNwLTQuNC4yLVAxL2JpbmQv
YmluZC05LjExLjE0L2xpYi9kbnMvaW5jbHVkZS9kbnMvY2xpZW50Lmg6NDUsDQogICAgICAgICAg
ICAgICAgICBmcm9tIGNvbnRleHQuYzoyODoNCi9ob21lL2V1Z2VuL2J1aWxkcm9vdC0yMDIyLjAy
L2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvZGhjcC00LjQuMi1QMS9iaW5kL2JpbmQtOS4xMS4xNC9s
aWIvZG5zL2luY2x1ZGUvZG5zL3R5cGVzLmg6MjMwOjEwOiANCmZhdGFsIGVycm9yOiBkbnMvZW51
bXR5cGUuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KICAgMjMwIHwgI2luY2x1ZGUgPGRu
cy9lbnVtdHlwZS5oPiAvKiBQcm92aWRlcyBkbnNfcmRhdGF0eXBlX3QuICovDQogICAgICAgfCAg
ICAgICAgICBefn5+fn5+fn5+fn5+fn5+DQpjb21waWxhdGlvbiB0ZXJtaW5hdGVkLg0KbWFrZVs0
XTogKioqIFtNYWtlZmlsZToyMzk6IGNvbnRleHQubG9dIEVycm9yIDENCkluc3RhbGxpbmcgQklO
RCBsaWJyYXJpZXMgdG8gDQovaG9tZS9ldWdlbi9idWlsZHJvb3QtMjAyMi4wMi9idWlsZHJvb3Qv
b3V0cHV0L2J1aWxkL2RoY3AtNC40LjItUDEvYmluZC4NCnN0YXRzLmM6IEluIGZ1bmN0aW9uIOKA
mHNldGNvdW50ZXLigJk6DQpzdGF0cy5jOjMwMDoyOTogZXJyb3I6IOKAmHZhbOKAmSB1bmRlY2xh
cmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IA0KZGlkIHlvdSBtZWFuIOKAmHZhbHVl
4oCZPw0KICAgMzAwIHwgIHN0YXRzLT5jb3VudGVyc1tjb3VudGVyXSA9IHZhbDsNCiAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn4NCiAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB2YWx1ZQ0Kc3RhdHMuYzozMDA6Mjk6IG5vdGU6IGVhY2ggdW5kZWNsYXJl
ZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSANCmZvciBlYWNoIGZ1bmN0aW9uIGl0
IGFwcGVhcnMgaW4NCnN0YXRzLmM6Mjg2OjIwOiB3YXJuaW5nOiB1bnVzZWQgcGFyYW1ldGVyIOKA
mHZhbHVl4oCZIFstV3VudXNlZC1wYXJhbWV0ZXJdDQogICAyODYgfCAgICAgY29uc3QgdWludDY0
X3QgdmFsdWUpDQogICAgICAgfCAgICAgfn5+fn5+fn5+fn5+fn5+Xn5+fn4NCm1ha2VbNF06ICoq
KiBbTWFrZWZpbGU6MjkwOiBzdGF0cy5sb10gRXJyb3IgMQ0KL2xpYi9sZC1saW51eC5zby4zOiBO
byBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQptYWtlWzVdOiAqKiogW01ha2VmaWxlOjYwNTogaW5j
bHVkZS9kbnMvZW51bXR5cGUuaF0gRXJyb3IgMQ0KbWFrZVs0XTogKioqIFtNYWtlZmlsZTo1OTk6
IGluY2x1ZGVdIEVycm9yIDINCkluIGZpbGUgaW5jbHVkZWQgZnJvbSANCi9ob21lL2V1Z2VuL2J1
aWxkcm9vdC0yMDIyLjAyL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvZGhjcC00LjQuMi1QMS9iaW5k
L2JpbmQtOS4xMS4xNC9saWIvaXNjY2ZnL2luY2x1ZGUvaXNjY2ZnL2FjbGNvbmYuaDoyNCwNCiAg
ICAgICAgICAgICAgICAgIGZyb20gYWNsY29uZi5jOjI0Og0KL2hvbWUvZXVnZW4vYnVpbGRyb290
LTIwMjIuMDIvYnVpbGRyb290L291dHB1dC9idWlsZC9kaGNwLTQuNC4yLVAxL2JpbmQvYmluZC05
LjExLjE0L2xpYi9kbnMvaW5jbHVkZS9kbnMvdHlwZXMuaDoyMzA6MTA6IA0KZmF0YWwgZXJyb3I6
IGRucy9lbnVtdHlwZS5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQogICAyMzAgfCAjaW5j
bHVkZSA8ZG5zL2VudW10eXBlLmg+IC8qIFByb3ZpZGVzIGRuc19yZGF0YXR5cGVfdC4gKi8NCiAg
ICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4NCmNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQu
DQptYWtlWzRdOiAqKiogW01ha2VmaWxlOjI0MTogYWNsY29uZi5sb10gRXJyb3IgMQ0KSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIA0KL2hvbWUvZXVnZW4vYnVpbGRyb290LTIwMjIuMDIvYnVpbGRyb290
L291dHB1dC9idWlsZC9kaGNwLTQuNC4yLVAxL2JpbmQvYmluZC05LjExLjE0L2xpYi9kbnMvaW5j
bHVkZS9kbnMvdHNpZy5oOjI4LA0KICAgICAgICAgICAgICAgICAgZnJvbSANCi9ob21lL2V1Z2Vu
L2J1aWxkcm9vdC0yMDIyLjAyL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvZGhjcC00LjQuMi1QMS9i
aW5kL2JpbmQtOS4xMS4xNC9saWIvZG5zL2luY2x1ZGUvZG5zL2NsaWVudC5oOjQ1LA0KICAgICAg
ICAgICAgICAgICAgZnJvbSBjb250ZXh0LmM6Mjg6DQovaG9tZS9ldWdlbi9idWlsZHJvb3QtMjAy
Mi4wMi9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2RoY3AtNC40LjItUDEvYmluZC9iaW5kLTkuMTEu
MTQvbGliL2Rucy9pbmNsdWRlL2Rucy90eXBlcy5oOjIzMDoxMDogDQpmYXRhbCBlcnJvcjogZG5z
L2VudW10eXBlLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCiAgIDIzMCB8ICNpbmNsdWRl
IDxkbnMvZW51bXR5cGUuaD4gLyogUHJvdmlkZXMgZG5zX3JkYXRhdHlwZV90LiAqLw0KICAgICAg
IHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fg0KY29tcGlsYXRpb24gdGVybWluYXRlZC4NCm1h
a2VbNF06ICoqKiBbTWFrZWZpbGU6MjM5OiBjb250ZXh0LmxvXSBFcnJvciAxDQptYWtlWzNdOiAq
KiogW01ha2VmaWxlOjc2OiBiaW5kMl0gRXJyb3IgMg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
