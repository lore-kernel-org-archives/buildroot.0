Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC15C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 00:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A79460884;
	Fri, 12 Apr 2024 00:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JyNGpK72bKKB; Fri, 12 Apr 2024 00:47:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 457F8608E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 457F8608E4;
	Fri, 12 Apr 2024 00:47:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B27BC1BF990
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 00:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9EA2822FE
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 00:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MlQJXQPBR_o6 for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 00:47:54 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 12 Apr 2024 00:47:54 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6481B81E0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6481B81E0C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.141;
 helo=esa3.hgst.iphmx.com; envelope-from=prvs=82512198c=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6481B81E0C
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 00:47:54 +0000 (UTC)
X-CSE-ConnectionGUID: +e3K/Lu6RUCPxUdEH2h2aQ==
X-CSE-MsgGUID: /GxpPJEVRSa/Uq4PTgsshA==
X-IronPort-AV: E=Sophos;i="6.07,194,1708358400"; d="scan'208";a="13633562"
Received: from mail-bn8nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.171])
 by ob1.hgst.iphmx.com with ESMTP; 12 Apr 2024 08:40:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCs43Pp81pyJ8NwKtAGKQnkxLKQccUYeEpyBeB/jRFcZVPrco4ZtkMwHG+dP+zsBKaS6Oi9RDTKkYwXUA8jzUp9wfjN6gi8JIChffuQmePtqo+ANg1BphE4b/5zSgLzc3THx2VEgk6RRaVoaXXYX8sEufs2f7++0fZMEeF4F+nyUGUXhZLGIqPu3KFLpv6P1nhxKBBngU8RzWmRjBHwokpChp8UMl2gIY6EuKrKWLwLS3hOulL3TeIgYQo+fi6hLQomzB/fgaYbv/83aF+zrP0MzWd5rDrVWEyNtYKv7UkWREnhY4kNWh9bKeERk42AzJWkjs691noAo5W8KdAT+fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2aW80H6d+4CGU8q4FvBKpcdGxrnYnU3DxwQ+CYimQ0=;
 b=HVYiRSvSBOdWqIqFCNeIH70JMO15G93PPscEn9GjCP5NTsuxcMsvY89M/7SRu/8qJktGTWuPyKKL2DWTlksk45298L6JiA2pZWG54BGS5r7CpUbIXRUzvloxJdUCVm/Zif3h8kjuhDSJN9DTcPZlUGRufCeB/vW5Z26ndYqfKgy1i77z/R4eWKGmu1JZBK7laLu77m+bLGCXFB+hmGixiC1gMogR9KtfRp3a46sp985O9rK4EhJBRcROB9kovJDm+VP8mKjFRK5i5r9vwLSZsqjX4pjlhtd/pQrWrxyVGzkbE+90deAExkQC4FAQZInXeS1rrPg6GJJPCu+HgSShwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from PH0PR04MB8549.namprd04.prod.outlook.com (2603:10b6:510:294::20)
 by MN2PR04MB6349.namprd04.prod.outlook.com (2603:10b6:208:1ad::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.42; Fri, 12 Apr
 2024 00:40:41 +0000
Received: from PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::4952:1e88:44e3:c84b]) by PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::4952:1e88:44e3:c84b%6]) with mapi id 15.20.7409.053; Fri, 12 Apr 2024
 00:40:41 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v2 1/1] package/spdm-utils: new package
Thread-Index: AQHahLFKJA9MVUO4kEyJU6Zmju/7DrFj2rMA
Date: Fri, 12 Apr 2024 00:40:41 +0000
Message-ID: <6649850400d8bf3ea8cd90508803e8461ff160d4.camel@wdc.com>
References: <20240402035140.71770-2-wilfred.mallawa@wdc.com>
In-Reply-To: <20240402035140.71770-2-wilfred.mallawa@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB8549:EE_|MN2PR04MB6349:EE_
x-ms-office365-filtering-correlation-id: 361bc4d5-1b71-4f02-a6c8-08dc5a892e61
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mEsgpPLoshSL6Lk2508OtaHdTBsfvTM35vaHxWbJVReM9uJHjyz4w5xsPrfN81wzOR8mBAsXmPfUrCC4asDRwyMZSS3hXQxUToTL2nV7CmDv3uw9BRRlmaPdkfDnb/eAOYaG052mcUPPLuZmS+PKosBeZIfadGzfIB9vBKpC3mafiD7dP8cYOZ453pRnSJCWNwIwKUB/+yPBEb9HFwAtLnq/qdLAePEnk+tA8cMRqHE74rP5umnH8XQ3EVX0qv2pdVrPQDWvaXE/xEVFN9DOTP8T+BVMpe7U1Yk522o1rhC/1xHMxNFwv3qXKnq/qwl7mKxGDIpGbZdWnuJp6tHC+LCR4f33++T4nAqUT2D8Dp8OT50OfCOgNHzwZAhZlSoB1z5DF9mBQgepOmBtyY2184uAv6CLlSXuZo5xV8LnLRV9hZz25QfYQuw39bUBDAt1zz1oS3JkaenyrSI+R3Q17pILrEcZFiANwVlW/kD885naAL0J9Ny90taAkxLJxBxjAs8zZgjB43sURyOPrJ/KhuZAM0y2gLGL8qGTpitLoSIZZ36bobzwlKFy773IHUQ1MtjR8tjrSA+BiTikKC800v25VKw3QnAb8EzURip3LTvYKLSfYFOWeX/JCQB4TtT09RY4CrC9rXuHOvsSRDWNYHSvNGcA3JKhWsqRenYJEJoYtyZ/utCvnztUDIiVk3S8GIF2OdU/WJUHuwnK6AIo31h14S84BBWFXE/6/oYlvWQvVfbnmJN+PSISjVvwqfeX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB8549.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2p3NXVPZG41Z04zT1lHbDRJQXk2ZDEvUGhqUTNITDRzMjYzNkFhU0FXbTdj?=
 =?utf-8?B?TzJPczkvTjJ5K3RYYjZQbEY5TkJjcmRObUFGdkh4NURtenJTNTlXUGNhL25K?=
 =?utf-8?B?UnBraVI1ZnF2alRBd3l0dHNhOC80dHVHTmJiVVkweUFjaldaUWttWU05R3Zv?=
 =?utf-8?B?UEVpdWdSYU1MSTFRMW40U2h0NVZaV2R5MFhkdUhaKzBYSGM3eU83cXl1QmlR?=
 =?utf-8?B?QWtZeXRmcFN0OHR3UU83UHlUTnB6MG0zR2plM2ZNeWcrdTVMVTdmQkpOc25v?=
 =?utf-8?B?REhhZHpQYjlFMUw2SWh4MkUwWFlGbVY0REJlcmxjQWJyN2c4eVNoY3FPWng2?=
 =?utf-8?B?b0tQeURqZ1UyUVExb1d0RERPMi9NTSt2TFV1Q0FCRU5pUUkvYWN5cXZzZTJP?=
 =?utf-8?B?bEZjQ1BNcUFWdTdPWm4yWTV2NUtRMWRqWUlzOGxzSklXaTRFK2t3b0pGUnE3?=
 =?utf-8?B?MlAxZVNtRHhQQlJ0WU9VT0dVZ3pvWDl5VGQ0OFJqUTE1NktNK002TmJzNHdm?=
 =?utf-8?B?Q3RCaWtTQnpSRFR3ejhxRGpVQWVES0tEa3VzZ1lkVHkvZ01oOXdham9hZUhs?=
 =?utf-8?B?NkZqSUlPdlA4aWlsTTV4L0VSS01mejRzT1I4NlVsakRDclFOMHlPRzhUSGR4?=
 =?utf-8?B?emRtajhZNXM2NWhDMW5jQWFTWlBkV3VpSWZFWUFpSTFwK2d4K0U1ZEtFOU9D?=
 =?utf-8?B?SE5DUVNSY0djS2h5M3RaK3Q3Y2F6cmJqa0MycXdLbThhMzFQdnMrZjJRVGJ6?=
 =?utf-8?B?b2QvNlRQSGF5aDZNYWlHTTBCWEZqNlhvK25td3FBVVcwR0JlYlNyTGEvSTVO?=
 =?utf-8?B?L3phVTNGaWRsQldIT3BqOVFjQlI1Y2lxR1hVdlhEMXNOZWhESzVIbUdQMVdo?=
 =?utf-8?B?Uys0ZkV1aGV0V1d6K0J1QitDVDZBZ3doNmhHZ3U5OU8yOHlhMGZJRlRaSHJI?=
 =?utf-8?B?bzZqTU4rTVNwWGF0TndFSjU1QWs0QWhGZEhiaDJMTzZvK0hXeFFWRUNtUzRN?=
 =?utf-8?B?K3dhNU9WUXlCSy9pMThtWlpLQk5mVTR3RzFoQ25uZ3dxb1VpMmpPcWVOeThZ?=
 =?utf-8?B?Uy9VL0Fac1VjR1hQLzlObzAxdFRyM3h5K01Fc1dvVjV3QjBRZjAwaFA1ZDdl?=
 =?utf-8?B?RVFiaDduZTdNaTY2ZWNuV1g2QlVnQ1dXQ0lNcTExMk4vZ05QWGJFajlWTklT?=
 =?utf-8?B?RjdTdGgyWjNjOGQ3Qm5DdmNPV2Y1SFBZdERUMFRlTjVJMitudmI4VWVhUmpi?=
 =?utf-8?B?cmlyblZmTkltRWRKc29GOEsxT0tLdHFKOHBYeTNISzR0dzU0M2x2OHNVdG1p?=
 =?utf-8?B?REdFTldDY3k2MnhpNGNrbFVEeHRjWkY2MDlsMTgrNitJMHVFWTlvTmRXNWhF?=
 =?utf-8?B?b2xwNVhPY2ZXWm9HVmVmVWVOZUlveHNxRkhJbXVjVFZTbFdrR0xsQmpmcW45?=
 =?utf-8?B?RUh0SFAxUVJzcEtKOS8wMEIrN2tJVFp5NS8wWmFYUmxsZk1mL1dYclVTd0lS?=
 =?utf-8?B?MHhobDlKUnl2WmlPdSs2T2dyMTRoOFdKd2dUTHkySXkzcFFrWXFSVlRtcEU2?=
 =?utf-8?B?SWRFN1RybzA4K3EvL2kzR3lnNnZmTnBIR1gwNld1Y3pzeHp4cEs1Z29NdmVL?=
 =?utf-8?B?QlBTeEVHM25ienJzeXBsUTY1THRCNEJsRkprTjd2MjlHNzBOUm5VMkRrcGdu?=
 =?utf-8?B?NDhobjZqTS82VFFyVHQ5S0hKTU45UmJDQk14Y0pOZWhoQUJobEowcTRITlFM?=
 =?utf-8?B?VlhraWNjS3gxblhDM0I5T1g2b0xHOXM3KzVXZXRML3MwSTA0anFncS9UZ1E0?=
 =?utf-8?B?dnE5VTc0bzRCYnNGTFB0NmNHTDh0em1wbnpsRVoyTGt2TVlMRXFjYUcrL2dS?=
 =?utf-8?B?YkRQbSs1L05YNVB2eTJ2VnRUY25EMnNmK0pGSXFxdkN0QStVZHNxVlFpWGRX?=
 =?utf-8?B?NkNVM0FzZEMyalhNYnhBM3ByWTNMbEcxNkgrbXRXOExPblp6TVFtUyt0eUVE?=
 =?utf-8?B?TXBPalVqS1BtWll5UVAxQXl4cEx0Tkg3WTNQeFpVRWJOL3NXNnIxNlFNaHR3?=
 =?utf-8?B?ZXVmTVZ1Z3JSVWZGREVZSGlyUXBBQTRWZEkrcTNrUUdtYnZ2ZTArMFBYZ0Zv?=
 =?utf-8?B?TEl6eXdNRXY0WmdsbHZoUmVwZXZDdjM5ZTZDNkF4NU5lNzRPK014emwvYW5t?=
 =?utf-8?B?b3c9PQ==?=
Content-ID: <1917EA01A3811D4E85BA9623CF6902D6@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: KZyb5Ql62kPWvALc5tD7D7L6wg/LLOKryI0nQd0vI8gioKYQxZMVK3s4/VyUxrN8NK8JoFAevvSfzxHrk3SzJp4WX5l6CUpjssID7arGBQ5LmxUqRPZcZMg4QPitj7tCjl0I9lAti+IkUla5Rj+eMrg5/v/0QpyBg1ZzLr+yGvWINV7CALizzGOmD+EoPQlDcyTGxY2Pupi1bc0+MrOEB1q0F4WVKQQvbzeEA7g2RbkyJr/jzulUz23pM1RINZJdj7zj5c4G0TCbAB/KRREAwK/QPnimhtibZcbDtwOWYMD7uR2dUo1R2JxLrxod+o74rHQIFsczgeOHMtcp+7tedjnS0nxA0Zya3brIgpKru2GQTCpzZJwBf5ynxCzbhJu/6iajRKSYZY0V5BNxX9LWTbPRmgSiaUPJczG5Pj5AtLuguYELgx//c+TP5M5h+L5B3lY2DHCWuw0KDcbvk7Qpequhjdv9KNfQjLS9T5ltiLN0SbGCK2MBWZM/8OQSFsxk/cy2tiej/S3cVkc4MINImdyYb63wPzC+7LfQtiMfaS0xuTw1CGISoh03nD1sCDhd0KCdRCjsaZFQNUpl9Qsv7GG1F6jswQDpoZc8bUQwcLrnxEB88+zM3PG3dpayIhQB
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB8549.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 361bc4d5-1b71-4f02-a6c8-08dc5a892e61
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 00:40:41.4342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A9unWLhRpScoHMRiOrN5AOplp390xHli5x+71YShY3NEBt9mHu5box6NFQqVX2q1TmXP8bQ/91O4hHh8Fi2NYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6349
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1712882875; x=1744418875;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=K2aW80H6d+4CGU8q4FvBKpcdGxrnYnU3DxwQ+CYimQ0=;
 b=bIUqDg8obCe23cgGrDVCDSMW2iruej9X45ZaUU2VOB1htEysvzCf8+ge
 N+bq9U9/D4zZTcj3pXxSdbtQaQ+6//ASfB16n7qA9MmjFL72vVq5GakMI
 856t8LDDcP1GvqSLOuAvDKf3QDvrQCn7ZMVtj5r/h+bVX5mbGBgyK9Cx1
 aZ2yFTE1PiIX/Knn1ms3ItOCEhP8t03q/dyIUw/qIImh/4gy9trIYYSQK
 SzBOUnjrkvuuHSBXjAFW9Ff6weeJmmwWcQBCdWtQbesA97w4hsyiuOcfd
 ytYVQeuAeV3pHiG3uh2G4U7x6pCl/X7F6y11jdqCkgAgzzV4pmcXEFB0Q
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2aW80H6d+4CGU8q4FvBKpcdGxrnYnU3DxwQ+CYimQ0=;
 b=mMkcz7OE883nD3xDgzebwmTee84eQ0rlIEy/uh2KfnX9EkcRw5jGUTUxz2SsXC8A0FO1IDRzmJdij5N5UdNXQhoTbyQHmMfYwgB6qmAA9iMoHiiPjnKg4QKGfgHJmfTsnmvGlevFEbiwnB7vw7BvYTb3pxLJrc2CCr+rLhVhatE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=bIUqDg8o; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=mMkcz7OE
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] package/spdm-utils: new package
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
From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
Reply-To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Z2VudGxlIHBpbmcgOikNCg0KT24gVHVlLCAyMDI0LTA0LTAyIGF0IDEzOjUxICsxMDAwLCBXaWxm
cmVkIE1hbGxhd2EgdmlhIGJ1aWxkcm9vdCB3cm90ZToNCj4gU2lnbmVkLW9mZi1ieTogQWxpc3Rh
aXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBX
aWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3YUB3ZGMuY29tPg0KPiAtLS0NCj4gQ2hhbmdl
cyBpbiBWMjrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIA0KPiDC
oMKgwqDCoMKgwqDCoCAtIEFkZGVkIHJlcXVpcmVkIHB5dGhvbjMgZGVwZW5kZW5jaWVzDQo+IMKg
wqDCoMKgwqDCoMKgIC0gTm93IGRlcGVuZHMgb24gYHVkZXZgIGluc3RlYWQgb2Ygc2VsZWN0aW5n
IGBldWRldmANCj4gwqDCoMKgwqDCoMKgwqAgLSBOb3cgZGVwZW5kcyBvbiBgbGlic3BkbWANCj4g
wqDCoMKgwqDCoMKgwqAgLSBIb29rIGRlZmluZSBtb3ZlZCBiZWxvdyB0aGUgaG9vaywgc3R5bGlz
dGljYWxseSBzaW1pbGFyIHRvDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb3RoZXIgcGFja2Fn
ZXMNCj4gwqDCoMKgwqDCoMKgwqAgLSBSZW1vdmVkIGNhcmdvIHBhY2thZ2UgcmUtdmVuZG9yaW5n
IGFzIHdlIGFyZW4ndCBwYXRjaGluZw0KPiDCoMKgwqDCoMKgwqDCoCAtIENoYW5nZWQgY2VydGlm
aWNhdGUvbWFuaWZlc3QgaW5zdGFsbGF0aW9uIHBhdGggdG8gYmUgc3lzdGVtDQo+IHdpZGUuDQo+
IA0KPiDCoHBhY2thZ2UvQ29uZmlnLmluwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgMSArDQo+IMKgcGFja2FnZS9zcGRtLXV0aWxzL0NvbmZpZy5pbsKgwqDCoMKgwqDCoCB8
IDI0ICsrKysrKysrKysrKysrKysrKysrDQo+IMKgcGFja2FnZS9zcGRtLXV0aWxzL3NwZG0tdXRp
bHMuaGFzaCB8wqAgMiArKw0KPiDCoHBhY2thZ2Uvc3BkbS11dGlscy9zcGRtLXV0aWxzLm1rwqDC
oCB8IDM2DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiDCoDQgZmlsZXMgY2hh
bmdlZCwgNjMgaW5zZXJ0aW9ucygrKQ0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3Nw
ZG0tdXRpbHMvQ29uZmlnLmluDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc3BkbS11
dGlscy9zcGRtLXV0aWxzLmhhc2gNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zcGRt
LXV0aWxzL3NwZG0tdXRpbHMubWsNCj4gDQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5p
biBiL3BhY2thZ2UvQ29uZmlnLmluDQo+IGluZGV4IDQxMGZlMGY0OTMuLjk1NzJhODg0ZTcgMTAw
NjQ0DQo+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluDQo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmlu
DQo+IEBAIC0yNjk4LDYgKzI2OTgsNyBAQCBjb21tZW50ICJVdGlsaXRpZXMiDQo+IMKgCXNvdXJj
ZSAicGFja2FnZS9zY3JlZW4vQ29uZmlnLmluIg0KPiDCoAlzb3VyY2UgInBhY2thZ2Uvc2NyZWVu
ZmV0Y2gvQ29uZmlnLmluIg0KPiDCoAlzb3VyY2UgInBhY2thZ2Uvc2V4cGVjdC9Db25maWcuaW4i
DQo+ICsJc291cmNlICJwYWNrYWdlL3NwZG0tdXRpbHMvQ29uZmlnLmluIg0KPiDCoAlzb3VyY2Ug
InBhY2thZ2Uvc3Vkby9Db25maWcuaW4iDQo+IMKgCXNvdXJjZSAicGFja2FnZS90ZXJtaW5vbG9n
eS9Db25maWcuaW4iDQo+IMKgCXNvdXJjZSAicGFja2FnZS90aW1lL0NvbmZpZy5pbiINCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2Uvc3BkbS11dGlscy9Db25maWcuaW4gYi9wYWNrYWdlL3NwZG0tDQo+
IHV0aWxzL0NvbmZpZy5pbg0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAw
MDAwLi5iOTYzNjU0NTFmDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvcGFja2FnZS9zcGRtLXV0
aWxzL0NvbmZpZy5pbg0KPiBAQCAtMCwwICsxLDI0IEBADQo+ICtjb25maWcgQlIyX1BBQ0tBR0Vf
U1BETV9VVElMUw0KPiArCWJvb2wgInNwZG0tdXRpbHMiDQo+ICsJZGVwZW5kcyBvbiBCUjJfUEFD
S0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRTDQo+ICsJZGVwZW5kcyBvbiBCUjJf
VE9PTENIQUlOX0hBU19USFJFQURTICMgcHl0aG9uMw0KPiArCWRlcGVuZHMgb24gQlIyX1VTRV9X
Q0hBUiAjIGV1ZGV2DQo+ICsJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTDQo+ICsJZGVwZW5k
cyBvbiBCUjJfVVNFX01NVSAjIGV1ZGV2DQo+ICsJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJT
wqAgIyBweXRob24zDQo+ICsJZGVwZW5kcyBvbiBCUjJfVVNFX01NVcKgICMgZXVkZXYsIHB5dGhv
bjMNCj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hBU19VREVWDQo+ICsJZGVwZW5kcyBvbiBC
UjJfUEFDS0FHRV9MSUJTUERNDQo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfUlVTVEMNCj4g
KwlzZWxlY3QgQlIyX1BBQ0tBR0VfT1BFTlNTTA0KPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9QQ0lV
VElMUw0KPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9FVURFVg0KPiArCXNlbGVjdCBCUjJfUEFDS0FH
RV9QWVRIT04zDQo+ICsJaGVscA0KPiArCcKgIFNQRE0tVXRpbHMgaXMgYSBMaW51eCBhcHBsaWNh
dGlvbiBkZXNpZ25lZCB0byBzdXBwb3J0LA0KPiArCcKgIHRlc3QgYW5kIGRldmVsb3AgU1BETSBy
ZXF1ZXN0ZXJzIGFuZCByZXNwb25kZXJzLg0KPiArCcKgIFNQRE0tVXRpbHMgdXNlcyBsaWJzcGRt
IGFzIHRoZSBiYWNrZW5kIHRvIHBlcmZvcm0gU1BETQ0KPiArCcKgIGNvbW11bmljYXRpb24uIFNQ
RE0tVXRpbHMgY3VycmVudGx5IHN1cHBvcnRzIHRoZQ0KPiArCcKgIFBDSWUgRGF0YSBPYmplY3Qg
RXhjaGFuZ2UgKERPRSkgQ2FwYWJpbGl0eS4NCj4gKw0KPiArCcKgIGh0dHBzOi8vZ2l0aHViLmNv
bS93ZXN0ZXJuZGlnaXRhbGNvcnBvcmF0aW9uL3NwZG0tdXRpbHMNCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2Uvc3BkbS11dGlscy9zcGRtLXV0aWxzLmhhc2ggYi9wYWNrYWdlL3NwZG0tDQo+IHV0aWxz
L3NwZG0tdXRpbHMuaGFzaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAw
MDAwLi5hYWEyNDMzMTVlDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvcGFja2FnZS9zcGRtLXV0
aWxzL3NwZG0tdXRpbHMuaGFzaA0KPiBAQCAtMCwwICsxLDIgQEANCj4gKyMgTG9jYWxseSBjYWxj
dWxhdGVkDQo+ICtzaGEyNTbCoA0KPiAzZjA2ZjA4NzIyMGIxMjYyNjJhMmJlY2Y2OGM5ZTA2YTU5
ZDhkNjEzODE2ZjgyYTE2OGM4MTA5M2RlMDg3ZDFhwqANCj4gc3BkbS11dGlscy0wLjMuMC50YXIu
Z3oNCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3BkbS11dGlscy9zcGRtLXV0aWxzLm1rIGIvcGFj
a2FnZS9zcGRtLQ0KPiB1dGlscy9zcGRtLXV0aWxzLm1rDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+IGluZGV4IDAwMDAwMDAwMDAuLjQxNzZmNjE4NzENCj4gLS0tIC9kZXYvbnVsbA0KPiArKysg
Yi9wYWNrYWdlL3NwZG0tdXRpbHMvc3BkbS11dGlscy5taw0KPiBAQCAtMCwwICsxLDM2IEBADQo+
ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIw0KPiAjIyMjIyMjIyMjIyMNCj4gKyMNCj4gKyMgc3BkbS11dGlscw0KPiAr
Iw0KPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMNCj4gIyMjIyMjIyMjIyMjDQo+ICsNCj4gK1NQRE1fVVRJTFNfVkVS
U0lPTiA9IDAuMy4wDQo+ICtTUERNX1VUSUxTX1NJVEUgPSAkKGNhbGwgZ2l0aHViLHdlc3Rlcm5k
aWdpdGFsY29ycG9yYXRpb24sc3BkbS0NCj4gdXRpbHMsdiQoU1BETV9VVElMU19WRVJTSU9OKSkN
Cj4gK1NQRE1fVVRJTFNfTElDRU5TRSA9IEFwYWNoZS0yLjAgb3IgTUlUDQo+ICtTUERNX1VUSUxT
X0RFUEVOREVOQ0lFUyArPSBwY2l1dGlscyBsaWJzcGRtIG9wZW5zc2wgdWRldg0KPiArDQo+ICsj
IE5vdGUgdGhhdCB3ZSBhbHNvIGNvcHkgYHNldHVwX2NlcnRzLnNoYCBhbmQgYGdlbmVyYXRlX2Nl
cnRzLnNoYC4NCj4gKyMgYHNldHVwX2NlcnRzLnNoYCBzaGFsbCBiZSB1c2VkIGJ5IGEgcmVzcG9u
ZGVyIHRvIHJlZ2VuZXJhdGUgaXQncw0KPiBtdXRhYmxlDQo+ICsjIGNlcnRpZmljYXRlIGNoYWlu
LiBgZ2VuZXJhdGVfY2VydHMuc2hgIGNhbiBiZSB1c2VkIHRvIGdlbmVyYXRlIGENCj4gbmV3DQo+
ICsjIGNlcnRpZmljYXRlIGNoYWluLCB3aGljaCBtYXliZSB1c2VmdWwgaW4gdGVzdGluZyBhbmQg
ZGV2ZWxvcG1lbnQuDQo+ICtkZWZpbmUgU1BETV9VVElMU19JTlNUQUxMX0NFUlRTDQo+ICsJJChJ
TlNUQUxMKSAtZCAtbSAwNzU1ICQoVEFSR0VUX0RJUikvdXNyL2xvY2FsL3NwZG1fY2VydHMNCj4g
KwljcCAtciAkKEBEKS9jZXJ0cy9nZW5lcmF0ZV9jZXJ0cy5zaA0KPiAkKFRBUkdFVF9ESVIpL3Vz
ci9sb2NhbC9zcGRtX2NlcnRzDQo+ICsJY3AgLXIgJChARCkvY2VydHMvb3BlbnNzbC5jbmYNCj4g
JChUQVJHRVRfRElSKS91c3IvbG9jYWwvc3BkbV9jZXJ0cw0KPiArCWNwIC1yICQoQEQpL2NlcnRz
L3NldHVwX2NlcnRzLnNoDQo+ICQoVEFSR0VUX0RJUikvdXNyL2xvY2FsL3NwZG1fY2VydHMNCj4g
Kw0KPiArCSQoSU5TVEFMTCkgLWQgLW0gMDc1NQ0KPiAkKFRBUkdFVF9ESVIpL3Vzci9sb2NhbC9z
cGRtX2NlcnRzL3Nsb3QwDQo+ICsJY3AgJChARCkvY2VydHMvc2xvdDAvaW1tdXRhYmxlLmRlcg0K
PiAkKFRBUkdFVF9ESVIpL3Vzci9sb2NhbC9zcGRtX2NlcnRzL3Nsb3QwDQo+ICsJY3AgJChARCkv
Y2VydHMvc2xvdDAvZGV2aWNlLmNlcnQuZGVyDQo+ICQoVEFSR0VUX0RJUikvdXNyL2xvY2FsL3Nw
ZG1fY2VydHMvc2xvdDANCj4gKwljcCAkKEBEKS9jZXJ0cy9zbG90MC9kZXZpY2UuZGVyDQo+ICQo
VEFSR0VUX0RJUikvdXNyL2xvY2FsL3NwZG1fY2VydHMvc2xvdDANCj4gKwljcCAkKEBEKS9jZXJ0
cy9zbG90MC9kZXZpY2Uua2V5DQo+ICQoVEFSR0VUX0RJUikvdXNyL2xvY2FsL3NwZG1fY2VydHMv
c2xvdDANCj4gKwljcCAkKEBEKS9jZXJ0cy9zbG90MC9wYXJhbS5wZW0NCj4gJChUQVJHRVRfRElS
KS91c3IvbG9jYWwvc3BkbV9jZXJ0cy9zbG90MA0KPiArCWNwICQoQEQpL2NlcnRzL3Nsb3QwL2J1
bmRsZV9yZXNwb25kZXIuY2VydGNoYWluLmRlcg0KPiAkKFRBUkdFVF9ESVIpL3Vzci9sb2NhbC9z
cGRtX2NlcnRzL3Nsb3QwDQo+ICsNCj4gKwkkKElOU1RBTEwpIC1kIC1tIDA3NTUgJChUQVJHRVRf
RElSKS91c3IvbG9jYWwvc3BkbV9tYW5pZmVzdC8NCj4gKwljcCAkKEBEKS9tYW5pZmVzdC9tYW5p
ZmVzdC5vdXQuY2Jvcg0KPiAkKFRBUkdFVF9ESVIpL3Vzci9sb2NhbC9zcGRtX21hbmlmZXN0Lw0K
PiArZW5kZWYNCj4gKw0KPiArU1BETV9VVElMU19QT1NUX0lOU1RBTExfVEFSR0VUX0hPT0tTICs9
IFNQRE1fVVRJTFNfSU5TVEFMTF9DRVJUUw0KPiArDQo+ICskKGV2YWwgJChjYXJnby1wYWNrYWdl
KSkNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
