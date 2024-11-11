Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74882D2E9FF
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 14:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 255536058C;
	Mon, 11 Nov 2024 14:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hm_0ILlPk7tE; Mon, 11 Nov 2024 14:31:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24858605A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24858605A0;
	Mon, 11 Nov 2024 14:31:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 987806C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94247605A0
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ET4_bkJeA80S for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 14:31:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.45;
 helo=esa6.hgst.iphmx.com; envelope-from=prvs=03875af56=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A7E6C6058C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7E6C6058C
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7E6C6058C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:31:43 +0000 (UTC)
X-CSE-ConnectionGUID: gL8kxsN9T/+D8w1RU8+K5w==
X-CSE-MsgGUID: t9B6rB7UT0mkpWAO2d/cuQ==
X-IronPort-AV: E=Sophos;i="6.12,145,1728921600"; d="scan'208";a="31131932"
Received: from mail-westusazlp17013078.outbound.protection.outlook.com (HELO
 SJ2PR03CU002.outbound.protection.outlook.com) ([40.93.1.78])
 by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2024 22:31:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MIZocgBZGymXkL8/ufd1x/RGBZ6Aj8aIh86Fh608B9e0OlRpx3fjsaOI4l27JDZSbA6CZjGM8gSDPT3txoPqSUIH8A7ZUwUWkcssj9sTdOi2pEsw4ZpMaqPmNBY7eFJ+rP0tgYE8PEs12LuPTO0Pzs5rzOLzWUrgvNPKHiOYxkCEaqE3HAWWGfR/f7npJiVfi/H0kCAQUKtvSHcl6CfwiVP/l5zYuPsyvrMaK55MktO14UIvxNbDpqzg18aHpmdIqcs8HJGsraWEysVkA6q9FsYZjsf5meUlKMqXpxfL3HpgIIRaGSLglzzzSQ0IYEsYBR4ikPkm0Q53y2P+4kyQAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osHmZfTfEXQBtSVk/zjHEJJtrN/fO5KdedW2o5D4wOI=;
 b=ZeORkJxcuSDcfPvBEeSk3nkjnmd7k1/0qpssDuK96wFPnvypOl+Jr1p6BgsxtsWnkHOdprSeQpBIaY/v103XCLxM6vmoEp66LauBBI+QC9v36S6dfr3ICJTOWjjdb0/jKXpuusgqOu+vdLCMHomCn1JYqeQDcdnSVc7Dpx86jAH0AZ1U8cs8IzPipjZOGhRCBewv0VIVa51471K/NJOOtwesZ+CA3CXhcx7TpX4uo310zhAZKptwdDhlPiRvyIi3liv/UWZw68i39OArnkx+w8gmlQLxXRpMyPm11FEJVbfT71/vF+I0oujkBbTyd9qA0T2VM0GW+RjZSHPbKMnmfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by CH2PR04MB6620.namprd04.prod.outlook.com (2603:10b6:610:6c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Mon, 11 Nov
 2024 14:31:39 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 14:31:38 +0000
To: Brandon Maier <brandon.maier@gmail.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Niklas Cassel <cassel@kernel.org>
Thread-Topic: [Buildroot] [PATCH 01/17] docs/manual/writing-rules: add
 shortcuts for genimage partition-type-uuid
Thread-Index: AQHbMvUNwdczTquLHESzK5jXBV0bM7KyEGmAgAAVHYCAAAFkgA==
Date: Mon, 11 Nov 2024 14:31:38 +0000
Message-ID: <ZzIVSTNPFHE_V3yR@ryzen>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
 <20241109-genimage-partition-type-uuid-v1-1-9f23180c7195@gmail.com>
 <ZzICaWfSt7aJ2y1B@ryzen>
 <CADwxmT=bajsScNg33csd+zBRBEkTyo3YjBiW553Tmr860MKzRg@mail.gmail.com>
In-Reply-To: <CADwxmT=bajsScNg33csd+zBRBEkTyo3YjBiW553Tmr860MKzRg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|CH2PR04MB6620:EE_
x-ms-office365-filtering-correlation-id: 6ec658aa-67b3-412b-dab0-08dd025d8d9d
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?L2ljaVdoOCtlKzZYbzBQS3hnOXRXYnJTNTFJSjZoMTBGSHJKZVNpYzU4V2JP?=
 =?utf-8?B?YzV5elljeC9tQXBhYTR2VWRjaHBUdnRKaWVGSnIvajZacVZ0WDFCbk9GMEpo?=
 =?utf-8?B?NitlS3FQUmRTd1Vtd2pDN3pjcFNvbzlZUkxpTGpWSGFYN3piY3lsQ3JXZnFQ?=
 =?utf-8?B?MXVvK2VZbXdXaWtnQlg5azJrSUozVi81TGdlOEZxWEpERldEcWk1MnduRkJz?=
 =?utf-8?B?dkVQTXV0VnRxYUdGZzNOYi9tQWlwWXRKUHlFSExrYXhxT0QwZFE1RDY3dWo3?=
 =?utf-8?B?aGpKVVFhUFFieDc3TTQyeU9xVXRQODRjRjluNGYydHo5bW9nN2JhNjIyMVVo?=
 =?utf-8?B?NGR6eXJoZWZDbXJXUW52QVpnSzAzTDRjNTgzdjJhaDQrdGNmOS9KUlBQNlhZ?=
 =?utf-8?B?WnM4eVJLbG85MHdYak9TRFZSalNIRm51LzIwWWtQS1VIQy94SVdWbUlhUGRM?=
 =?utf-8?B?eEttMUVxTCtUcDhINzhicmtvZlU2NXhzWlZmUmttSGVnNmVxZjRHdEI0MlUx?=
 =?utf-8?B?cUR1NXErZjJWYzc1eWMvRFV2cTdjblY4bmRnTmlEM0dHNDFPazBydkhhaW5K?=
 =?utf-8?B?dzF1bUkxZEU4RXREdGpEU09HelVkNXdIUjZSVFU1MUZPR05OZWxOS09DN1pD?=
 =?utf-8?B?QXNZVkxmQ0ozd2Zhek9FMVRhSFJCS3BRMGxvcVdjRWZMTGpLZnFTWEdJL3Jo?=
 =?utf-8?B?cExJVklqd1RkaFdUNXA2ZU16OGhYS3p5L2xvQy9HcVVjTjk3SkVvYU9aVmNC?=
 =?utf-8?B?dTRVLzRnVDg0V3BJd3YvUVhlVHZNNCtLeWlSMHpUYTQ5V2NwUjZhNEpFNi9n?=
 =?utf-8?B?Zk5JZkpVSWxxRmxzT28vSUdnbjdkTlRickl6eVcwalVsVU1OUkI1VlZ6ZWsv?=
 =?utf-8?B?dm1CWnFoU1ViNlNTSkYxLzJwLzJ0bzJMT3RMOTlUMWxoWCtXU3VlVVBhRjdq?=
 =?utf-8?B?VVlLaEVtcnlHM1AweFhTT3BBbTVKOVQzbzM3T2I1MUlYb3NxdmVIaVNxVE1r?=
 =?utf-8?B?R2c3Zm9jZkpZRnVNRWN0emFiV0haSEhSTmhHY0t5V0xlWFpFUnZIenhiNitT?=
 =?utf-8?B?TGxCcWxNcXBMVzhXR2xTZ1ExNktyeU8zbTZ0SkJpNTFPQ3FsS25UZllJeTlh?=
 =?utf-8?B?VFljcDViWHVOUkVhS2xEZ3FscHltKzlObU80SzJ6QldyRld0QXRveHZvNE1n?=
 =?utf-8?B?QWRQdlFUM0tlTWhJUmRIMTZyNzhMa05xRkhaUkpDZXF6WjdpNWdjRkxjVEpW?=
 =?utf-8?B?OTBva3AxMENqaWk0YmJMc1ZrTW16dkRSSHQrb2dJWjI4eDl3bHY3dDY3WVFt?=
 =?utf-8?B?eFBKbjNkcTFvSFhFemVQRzk1SGd3UUZrUjlDelBGSmw2cFlSOXZBcng0WU5o?=
 =?utf-8?B?emFTQzFzV2NQOTBlVXpvQ0IyT0QvOFUxRFV2S1hSaGtMdU41MWJkaVUzVGdL?=
 =?utf-8?B?RnZLaExHRytoYWZtTE91a0pzOUkvY3JBSEwxY1VpbHpsMFkzQnlydGlvbEps?=
 =?utf-8?B?b3VEU21kNGpWNVZQeWpSbVU0cW5talRTL3RiOG84OHFwRE85RStadXI1ZWNt?=
 =?utf-8?B?Nm95VXMrbjhhc2QxWStjKzJkMFNpbmtiN0VKVHREUXpqMmJoZnVSQVZFaDk5?=
 =?utf-8?B?MkhnRzQwVGdRSE4rODUxQmRsTWhoTFAybld3N3d6VlNEVS94QUFabzdiNHRK?=
 =?utf-8?B?cWpHRWp0b1ZkS1NCSDI2V3ord3IyOHRjUEYyb2pKOE9rSWJCdFRnamJHaHBj?=
 =?utf-8?B?WjY5TmlUNU9nNTgyckhlZDZwQmx3TlZXajFUMkFXNEhvdm00amJMb0dYSkNr?=
 =?utf-8?Q?d3cP5VGnuXIfuDTpsDVbde/xhucLqW3xNRNnk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFpSQ3hWN09zeU1yRmNyKy9DZG1QbisvMlhmY2pCZnQ0NmdrSnZJYTN2TEJH?=
 =?utf-8?B?a0ljRTdzb2JtSGFWVUJ5cU96SmpVeU1IKy8zZWtEdkhTNy9ZMGR6WitnbzRB?=
 =?utf-8?B?NTVZS0E5RlZDcDI4MmhjdGkzdUdTNGsyYUxnSGl3bVJyR1duTXFwWHVsL0RV?=
 =?utf-8?B?Z2tpWXNhbS9rckdKNm9rUWNuSFNmMFVIbjkxRDh5WnpPMnRjTjMyWFRVZnBG?=
 =?utf-8?B?NTVXUmZDN1pQdmdRSU15VStJWG9STmx5UHhvRVovcmVzN0Z0K1I2eWJsbGdo?=
 =?utf-8?B?STAvdTgvNnFoMml6ZnFodzEvSHFuaG9wWDhMTFZOeTBFYUJyMDNqa1lRTGdQ?=
 =?utf-8?B?RkJtQWNPTDF5V1ZieTdVY09mVnU5VVJRa1c5ZVVsck5xVEhKeDl2YmVSeVRi?=
 =?utf-8?B?WVpmV2NDNXpKSGdVeDlIMlV6LzUxNmtZSkZPT2dhYnBOUU94SFIreDYvRUdS?=
 =?utf-8?B?VHovWTFqM1lzeitRVWs0dTdzdHdBbW51MGRIeXJlRG9vWUprZWhmWTZuZjNv?=
 =?utf-8?B?YXNQZG9lWHcvbm9DNit0TmpQMUthaTh3YkhaOThuN2tNN3NqNDlZS3czc1Bk?=
 =?utf-8?B?N3RjeG9jSURGbkJMZTdRVk1ScXY1b0VxUnp5Z2dtSlBrWTA5RVo0b3o2VEFB?=
 =?utf-8?B?RHZoN2tTREJ0MVI0V2RHRnNGWDV1VkFHMEI5S2pHVm1mYVJxQ3pOTWxoSHZT?=
 =?utf-8?B?M0xQQ1c1Q0ZvTkt5c3ZvWWJESWdLSE5VcHZaUTBWYy85Zm4rWGowTGtPY01D?=
 =?utf-8?B?aE5EVmN5UWZ4aUlKVC9rRXpmaDhrOTN4dE9ZamdYVXhJUmxrdE00d2QzU3E1?=
 =?utf-8?B?N3p3VktnVTV3RmlYMEpjSmluVlNkMkdjM09hbG9tNjlDWUxySFZsNFFZYXVT?=
 =?utf-8?B?T2JNb241Slpub213NG9sNlhoWWF4dWc3bEJSZ3RaR1MxcHFxdGlONi9Xa25T?=
 =?utf-8?B?ZFVLVC9tbTJ4OGlEQUo2MVA5bnR3NVN2anljZlVWcUFhZFY3NmhsSEdLeHZM?=
 =?utf-8?B?NGhWeDB3NWZSYVdGQ0NLOSt6MWo3U1QvTEpPNldrTzZnMWRGZGlZbmhkUzBj?=
 =?utf-8?B?NU5qVkhHbHVuR28wQmg0UjlBMXRoZ2c2dkVNQ0ZUL2NkWWNZMy9UdjRSSnJO?=
 =?utf-8?B?d1JVS2NaUHZXY09pNm82V3NHMmhvTGxtWVlTZkJSdWI4VHpTRTJQZTNRZXJV?=
 =?utf-8?B?cUtnTEQzaC81M2dLMmpXUVFhVUMzK1Y3bzVseEtQb3k0dTFwekhsZzhMblJu?=
 =?utf-8?B?cmczZXNIUk1YUjZ3c2tHM0VrZzBCMUgvWDF0QlpYOUM1clMrVUV0cDJQWTdj?=
 =?utf-8?B?RmZNcFNYUGpSaURNeSsydm9EOEdySjhtNUxEZTYvQktsZTcvbkRZcW8wRFNQ?=
 =?utf-8?B?SzVRSi83UnEweVduZmdRaVBCd0dWOHlOYnFZWENjbUR5U3Y3cjl6RDRvc0RS?=
 =?utf-8?B?dHpvM3FNTVBGUzNDeUVUUlNJSjZFUDhNaFVwVDExTUFMWGhSUElvbjRsRkho?=
 =?utf-8?B?dkhYNFNNb2JvcStjK3F0U3BJTlY0UFB4cFV4Vm1zYm9nZ0MwS1NsUlIzeWJp?=
 =?utf-8?B?SnVMeHIzRzlLRVBWSkh0bXZTS0ZWdk9NWkc2KzJmeEtUeWtiTzNLWVRnZUpP?=
 =?utf-8?B?NDF1Y0NrZHliT0lVczhXT2JUeWlyQXR1aElBWXJXL0lIZnNCVjlLb25uK0RM?=
 =?utf-8?B?ajAvZkl1ZjRYTFp0Q0Z0S1FmMTcrRE01UnNRc0tLVitaaENBcEtBZjl5U1Y4?=
 =?utf-8?B?VUFENjFlWUMwTmtPOExxOUc0MHNUQXFmeVJWcDVGejdic2F0TVozWWdhbUFl?=
 =?utf-8?B?QTNWYlI4ZStiNDVjb0Zab1RoUjZscnZlVjRpVUR1M2V3cmVTQ1UzazQ3N21I?=
 =?utf-8?B?emJCUUM5SG9FZVpJQU9IRHFJWCtHaXFvYUgra3hQT3crNFVPbEVPZ1I0dWpE?=
 =?utf-8?B?K2VxazNtN3RYV25TVWtwVlFXV2JtUEVDdDQxc3VZYkdUb1UzQ0RiZTFjQTg0?=
 =?utf-8?B?L2pSOUlGYnMxZnFuK01najJmV1BWNjArdlJ0K1kvRFA0WEJzTzNTZHRKbkZV?=
 =?utf-8?B?L0djUldZQ25wdHJSeklqZ2NjUEUwTDBpMTJlT3NNaklVT0JUTHJ5ZytnMWZr?=
 =?utf-8?B?eUVrRHFrYjBDZTYwZmIwVGFKdzY4NTgyUGdmTkI0RS9PK3FwT2VzSThEdGw3?=
 =?utf-8?B?eVE9PQ==?=
Content-ID: <B643F38A3BEB144D8BF78844F0A91277@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: lo7LUkvF3T+fVb22EIMLjkrjl+e9GDSSfkSneYhwneIK/26kiUuNTGVP0mehO0y0goadvEyJaE8cx9XPpIESPEs1i3n9QAZwoB9Hm4//Zfro+Qv38lr3SgQ3Qvd41r0c3tyEGWXFRAw55kvlMtb5ju3qnMwk8KWPo4koxeDjBj/ijSoN42kv/gRXi1BlyTqLCv35mJmur0S9jC692KE2GVtRDmckqH4WSEXedEX894j//PcCIngN44wXYDUvF2G/wxblCKXMivNJHhGhTTorTuk59GIi0JM3tvQE5739qmN2WDYCr/DgeKjU41KMS96VEXW++wBKGc3N3Md3qosXeuaKVCum5PsmNlkIwtMVKPzCYzRmw/r+EphZkWeWaj1bLdf3ASgvGN7WJWu4Wxk6kbBsQsljcVwbP8rHa5omoOi4M2CYxAVBnhvVP5jlFQDwNVGvMtu/cGYWS7yR1w/NdqdXVKVVXdNqNhQaw/jzw0wP0+yXiFedwIjp87SeJfH9oC7TKH8lzQ4ZZV5m6MIJPHVNkk7Nixm5XpC+7eAuwhtkJcWRE6N/E2BEEujGM6EEwtjMbE5ROZGELj9mrERBH5ky/hVmOEywH5zyS7gQy3ntTTX/oEAA4fXPITOQKul4
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec658aa-67b3-412b-dab0-08dd025d8d9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2024 14:31:38.7553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i3hhEM5bsH9XNAE5KbDLCE/G0pvQZanOSB3KCSMzGOdH3RZ2Js+V7hsxfZ8+djhv2Pjob4se276mL1iAsjindg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6620
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1731335503; x=1762871503;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=osHmZfTfEXQBtSVk/zjHEJJtrN/fO5KdedW2o5D4wOI=;
 b=mWwS2L4dhqk9t9QOZQRCHgiv4E5tlZGLLihDPtY6WJ+FdBlCk4gliEhI
 fZoG1+yqqKcasgfgZ/fzGtTbHX611wVFU804WC9/5XPVtfC8Unync3Hy/
 YKMWlakeI0OwKW4+MDwbGiVZwk1ahSdkLWiQ+Nd5cQWo0xsRsfyjdDK3c
 KhP5Ie5B5PhGSZBUUU1KOolVn1WnxRinZnv27cPudisR+hLGIlJGaEIEk
 hfQiqxqC3CUn5h2X63bfLAHt+jRUBNYc4RsCsjYeDzh90aNiJzr7wrdnO
 E4OOqE+ALmn4DOYstZnVsimxPTV6vjJhrEDj5glEwG2NPwOzjX/2aubUk
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osHmZfTfEXQBtSVk/zjHEJJtrN/fO5KdedW2o5D4wOI=;
 b=ZUYk6cL9BwBQmf0cc5J97HfDVSKFkiE+8LKT59qOfHJmfK3qUPcJAeUY+fs4VG1hKmUkGPYwv+VpgWIRPcmpJEjMGvhgnkyAfQdzringt6p1BPjXTYnbYPOOFIhSjokFV3X0HyG680e3oiskdkwVZTnDHCQlI45Bpwyvf4Lo558=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=mWwS2L4d; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=ZUYk6cL9
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 01/17] docs/manual/writing-rules: add
 shortcuts for genimage partition-type-uuid
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBOb3YgMTEsIDIwMjQgYXQgMDg6MjY6MzlBTSAtMDYwMCwgQnJhbmRvbiBNYWllciB3
cm90ZToNCj4gSGkgTmlrbGFzDQo+IA0KPiBPbiBNb24sIE5vdiAxMSwgMjAyNCBhdCA3OjEx4oCv
QU0gTmlrbGFzIENhc3NlbCA8TmlrbGFzLkNhc3NlbEB3ZGMuY29tPiB3cm90ZToNCj4gPg0KPiA+
IExpa2UgeW91IHdyb3RlIGluIHRoZSBjb3ZlciBsZXR0ZXIsIHRoaXMgc2VyaWVzIGlzIG9ubHkg
cGFydGlhbGx5DQo+ID4gaW1wbGVtZW50aW5nIFRob21hcycgc3VnZ2VzdGlvbiwgd2hpY2ggd2Fz
Og0KPiA+ICJNeSBwb2ludCBpcyB0aGF0IHdlIHdhbnQgKmNvbnNpc3RlbmN5Ki4gU28gZWl0aGVy
IHdlIHVzZSAiTCIgZm9yIGFsbA0KPiA+IHJvb3RmcyBwYXJ0aXRpb25zLiBPciB3ZSB1c2Ugcm9v
dC0ke0FSQ0h9IGZvciBhbGwgcm9vdGZzIHBhcnRpdGlvbnMuIg0KPiA+DQo+ID4NCj4gPiBXaGls
ZSB0aGlzIHNlcmllcyBpcyBqdXN0IGNvbnZlcnRpbmcgR1VJRHMgdG8gdXNlIGEgc2hvcnRjdXQs
IGlmIHRoZXJlIGlzDQo+ID4gb25lIGF2YWlsYWJsZSwgSSBzdGlsbCB0aGluayB0aGF0IHdlIGNh
biB1cGRhdGUgdGhlIGRvY3VtZW50YXRpb24gdG8gYmUNCj4gPiBldmVuIHN0cmljdGVyLCBzb21l
dGhpbmcgbGlrZToNCj4gPg0KPiA+ICJGb3IgdGhlIHJvb3RmcyBwYXJ0aXRpb24sIHRoZSBwYXJ0
aXRpb24gdHlwZSBHVUlEIHNob3VsZCBiZSBzZXQgdG8gdGhlDQo+ID4gYXJjaGl0ZWN0dXJlLXNw
ZWNpZmljIHNob3J0Y3V0IChlLmcuIHJvb3QtYXJtNjQpLCByYXRoZXIgdGhhbiB0aGUgZ2VuZXJp
Yw0KPiA+ICtMKyBzaG9ydGN1dCAoZ2VuZXJpYyBMaW51eCByb290ZnMpLiBBbiBleHBsaWNpdCBw
YXJ0aXRpb24gdHlwZSBHVUlEIHNob3VsZA0KPiA+IGFsd2F5cyBiZSBzcGVjaWZpZWQgZm9yIHRo
ZSByb290ZnMgcGFydGl0aW9uLiINCj4gDQo+IEkgbGVmdCBpdCBvdXQgb2YgdGhpcyBzZXJpZXMg
YXMgSSBoYXZlbid0IGxvb2tlZCB0b28gY2xvc2VseSBpbnRvDQo+IHdoaWNoIG9mICJMIiBvciAi
cm9vdC0qIiBpcyBiZXR0ZXIuIEl0IGRvZXNuJ3Qgc2VlbSBsaWtlIGEgc2ltcGxlDQo+IGNob2lj
ZSwgYXMgVS1Cb290IGhhcyBhIGxvdCBvZiBib2FyZC1zcGVjaWZpYyBzZXR0aW5ncy4NCj4gDQo+
IERvIHlvdSBhbmQgVGhvbWFzIGZlZWwgY29uZmlkZW50IHRoYXQgcm9vdC0kQVJDSCBzaG91bGQg
YmUgdGhlIHByZWZlcnJlZCB0eXBlPw0KDQpGb3IgbmV3IGJvYXJkcyBiZWluZyBhZGRlZCB0byBi
dWlsZHJvb3QsIGRlZmluaXRlbHkuDQoNCg0KQm90aCBtZSBhbmQgVGhvbWFzIHRyaWVkIHRvIGdy
ZXAgaW4gdGhlIHUtYm9vdCBzb3VyY2UgY29kZSwgYW5kIGNvdWxkbid0DQpmaW5kIGFueXRoaW5n
IG90aGVyIHRoYW4gZmFzdGJvb3Qgc3R1ZmYgdGhhdCB3YXMgbWFraW5nIHVzZSBvZiB0aGUNCmdl
bmVyaWMgTGludXggcm9vdGZzIHBhcnRpdGlvbiB0eXBlIEdVSUQsIHNvIGl0ICpzaG91bGQqIGJl
IHNhZmUgdG8gY2hhbmdlDQpmb3IgYWxsIGJ1aWxkcm9vdCBib2FyZHMgbWFraW5nIHVzZSBvZiB1
LWJvb3QuDQoNCkkgZGlkbid0IGdyZXAgaW4gdGhlIGVkazIgc291cmNlIGNvZGUuDQoNCg0KS2lu
ZCByZWdhcmRzLA0KTmlrbGFzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
