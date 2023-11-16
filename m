Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DCEC197A0
	for <buildroot@archiver.kernel.org>; Thu, 16 Nov 2023 11:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A2EE42707;
	Thu, 16 Nov 2023 11:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A2EE42707
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AeQddhYnN9m2; Thu, 16 Nov 2023 11:32:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BD10426FA;
	Thu, 16 Nov 2023 11:32:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BD10426FA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B74601BF966
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 11:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CBAE834C6
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 11:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CBAE834C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qhha5__wTq7w for <buildroot@lists.busybox.net>;
 Thu, 16 Nov 2023 11:32:50 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::605])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D8FE8345D
 for <buildroot@buildroot.org>; Thu, 16 Nov 2023 11:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D8FE8345D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLVWxXLc6s+VXpRWWJsmWLq+1hk+zkP9tpEnbkhhNMkEvxg3qs2C67kKQaoswxWs+LaOD4WWxEn7QdkFWp/Me10vG+DJQjb9F2eBVnwGY3n1vEu/X51hD12y8LYzpK63lWfioAf0bwoSx5h7HucDcpg9FB0+ylBMKmQUL4q5Z7R3DlX7UVYZ6GgA2Hhxm5HI/os9FxNY8x30OBlXDulB2qgEvEBhVRlOoW4bdGzd9sUy9xy+llTr28TjghPy9bk5H7UA3grnPXZqThz4BVGHFr+QRi2A0fjycFPVv0UtakjT2QSCN3+NBREynVrvjxvJQKCxqRrUE7WAeRCPpqoDvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHDjxhejrrjmm3buU9YvHIwxmb2UVG28JdL7I9DTEFg=;
 b=Eh7JODGIE5NesFCdxX7gVu5x6iHmWvyCFuP154rnKS6jr/NOAaaonXZ8rlt/6dLtmdxzeEpeUhHF0/MNavW65Mcfia1s0BLBN70MVsy0eHZkIIJl7+jN+1+RZpepjx1/ut3i7ouifFx6ikUKGDtSpninFNxAvCAHt39jF95tO3GaAoOZ36ESYABt186XmWERLEtkDqyre7Gv2/8pOBvP7xYHxDhlz/ueaCC6ZhgvAd3i5DB1PkivG44A937R/HbS5o5aANRL4eBf2iURaxDn+NQP8Hw72w+Tla26HGrhJbBUdiv9HEqkUPW0Z1L00Gxzws0WGtJLbmyMJM25c8Yo7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MW6PR12MB8950.namprd12.prod.outlook.com (2603:10b6:303:24a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Thu, 16 Nov
 2023 11:32:47 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::cd8a:4814:157c:bbe]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::cd8a:4814:157c:bbe%7]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 11:32:46 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH v6 03/10] package/newlib-bare-metal: new
 package
Thread-Index: AQHaA0qXU55l7C7pwkan+EbiGTH5Q7Bj6Q6AgAGBHmCAAAKNAIAAGPkwgAAGH4CAE+RT0IACZ+6AgAEJChCAABjI8A==
Date: Thu, 16 Nov 2023 11:32:46 +0000
Message-ID: <CH2PR12MB50048F4E5E239037B162BF83F0B0A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-3-neal.frager@amd.com>
 <20231031134317.4ce2349e@windsurf>
 <CH2PR12MB5004C8F27820E2EC98FC5232F0A7A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231101125048.01553f76@windsurf>
 <CH2PR12MB50049049609F6BE2EF07D89FF0A7A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231101134205.GC114892@scaer>
 <CH2PR12MB50048B7684BF4AB7C79CC87DF0B2A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231115181243.GK996011@scaer>
 <CH2PR12MB5004D2C28BD2A2DF2B983C98F0B0A@CH2PR12MB5004.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB5004D2C28BD2A2DF2B983C98F0B0A@CH2PR12MB5004.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MW6PR12MB8950:EE_
x-ms-office365-filtering-correlation-id: 0895414c-1f28-4533-ec9a-08dbe697c16f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ECf3x9ROyqVCtI1rEdjSuFO+5se/YQS4CDVHAD0bd0c6okiamOJ5uYlqT2Gla2Kxqjo9oowhkIPhJfnaz6yAodJcIv1PMQTOGBIiNtmLIzXu1f0zpy5/KYrFzKT6jaBpFj2Nf38q70P1Tli/saWnHc0b+xkaTQks38vHQdEeJAt5CMhXUSg4IZZ5wDHckyR9kFqmK1UrklvYfn+FLLAyPp+o93PEpFRNXDgEuHOnyXcejrJPYTDi4uwNZwxbI1azdj+/qK92yZmpiSkhV5Yf7ZxMrhlaUI1XhcCfhWme2FwGrJbpe86AZwnfJ+YhSLzFRt/uvWI5fSjLPbNMkmHvrcr3LdvoBVszImWbOwcHmgit5YKQDhClzXZoVciB0A053t9KlPXRDWrCam87/wv+20Q81rXqklQIr7ZkTDYAUiE30+Ht0DwlUgtbEX9Oes0Xz++3B0PYVC6UuUAh4IA9PAklfFY5Z4az/tM1UKLscnhaApRJPuzF8owQI69tSYMF8cRtANjSSM9Ancufmf5H9poe1tS79y1dFAeb4pLWHBLzKyAcEPTXjV7mD/KR5GDdVrDbcELStdq8hxWOXxP6/Bb1Ao8EHlZER/ha6m5chxKD9ke+24+37FVs0yV2W/VSgaYUdX8VmknCxBHcYvjOzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(39860400002)(366004)(396003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(7696005)(76116006)(316002)(64756008)(6916009)(8676002)(66556008)(4326008)(54906003)(66446008)(66476007)(66946007)(8936002)(52536014)(71200400001)(478600001)(41300700001)(86362001)(5660300002)(33656002)(2906002)(38100700002)(122000001)(83380400001)(9686003)(2940100002)(6506007)(38070700009)(55016003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2xhTVdwL3B6WkhSZkFnSDZ0aXdhem96M1RjTldiYjhWT05xcXIyMVozdFR4?=
 =?utf-8?B?bkM4Q3lSL29ZM0dlVUg5S042NXUyRkRoV1RVV0RwdUxQT1J4NldSUkJ0VEpl?=
 =?utf-8?B?YVRNQXNSWU15MHJJbFJoRUprc0IxRjVLV1VxSVJ4NHRqSUtJOVJVajMvbjQ2?=
 =?utf-8?B?WWNiRGZsWEVjclkzZC85Zm5UaG80c21RclRlVlZqNFpuN2Q3NGVqVzZhNVZa?=
 =?utf-8?B?SExLa0g1alQxVHVxeFNUZjM3MXFjTlE2MFpLb082ODhrN2EvMHpIN29lVnZm?=
 =?utf-8?B?dUN3WStSZHhiUHlJdzJDQUsyTlBIRTZReDJUZ0RoclhmR05vb005NERnQ1RO?=
 =?utf-8?B?NUgrWlMveDVzRVB4c3JXUXcvcWJDWDRKak9aVncybkFVbERkMkZOcnZjMGJ0?=
 =?utf-8?B?VW16c2UzNHZlN01CLysxd1lRZ0kvWkRhM3FpdnlHd2ZZZGlPV3RHUUx4OGtX?=
 =?utf-8?B?VWE0VHJTL09oYTBwbkdTeHZqZ2VwN2ZlMTZLY1BqRUtaMXJWcnhnYisyaGZ6?=
 =?utf-8?B?SVdlbWZOc2c0QkpiNUEwTFoydHAwYTFRU2JLbW0yOUFpOUpDMnM3NVMzUU9R?=
 =?utf-8?B?ZkVpb1dhNHgxRUNVbjFEMVkyN0xMUUs0NVg0dllhYzd5Q1FIRFpISG51WWRD?=
 =?utf-8?B?d3ZwdzJBOFdVSkx1VFR4NHNtSzUwNUhFRmNkc0xhQytnMFc2ZzVWcXUxQXJX?=
 =?utf-8?B?ZldtYktoM09yaHlIQndzenhTcVNLOVFhdHJRc2pjOU1acVk4SFFMZnEwUVhv?=
 =?utf-8?B?eVZPSzhtVG1STVVoTUpVRnVPVHVMTlhwa3ErbE84UG9ZcVMxSmw3MUVMVGlv?=
 =?utf-8?B?VzM1Yk45VEZxK3RvWU94L1VkSXUxUGxPaVhTVHhjZllCQm5YSzdOWU1RQm5L?=
 =?utf-8?B?MUF2YU94RTRKOFJNY3U1ekwxUWJtaEZGeUJkS1huVXhvUklqNFIvNU5wc0F4?=
 =?utf-8?B?K21JMmpUSkZ3Qkc4VVpyN0VvaGVsYlQ5eUZVM0JhOXVRdjR5N0NJRm52Z2Q1?=
 =?utf-8?B?QW9IWE5hZmgwdWhxRllCKzE0dzJ4Sno1T2txUUZJVE4wN0ZCaGdadjkyY2Zl?=
 =?utf-8?B?UVZCcmxWbjZkdzhDSnBMYU1JNDJwTUdWZERQMWFZQWpBbUQ1WDl3eTd5TzV0?=
 =?utf-8?B?WDRyZElYKzZ3WFdPbk9yNzVGa0ZhMzBCaEt6VzBGVHFsY3lzQWNhVVFycTkv?=
 =?utf-8?B?UjFBZ3g1YTJPOVJ2d0pXWk11cUdrait2WUg0MkNFd1VaN2NhSFlqbGxKblZL?=
 =?utf-8?B?OWZHU1psZXYraHRBVG9McUx1M0VoMkZuNmt5ZFppd3FOTWNEM3N3Sy8yM1gr?=
 =?utf-8?B?bEI5ckhqLzFTelBHUmxydWpJaXlQa2lkVzRwVXBEQmdnWjBCVWtzaHpXRjRG?=
 =?utf-8?B?WjBhbkNzQWFRMDFldFhRbmlIQnJISVM1d1NGVWs4SWZFV3Jua2ZjTXpJOU5q?=
 =?utf-8?B?OUFRQjlobTdZWVpTdkh3ZVRVUGFkVmp4by9lRnlNK3VuL3I2OE5ZZEdMZUk0?=
 =?utf-8?B?UWFicXQyZ2ZjOW1NVmlsb3ZlRTdVQjZ2TzBUckw4b0p2bG5ueWpCL212VDZ2?=
 =?utf-8?B?TTFPYlZrbDlmdk1DNStaNlhJaGFBazlCb0RKTlRWTzhORTV6bHdIYXhvamI1?=
 =?utf-8?B?eWI5aEZFdlRMWjlkdUF5SXdKZCtqdVJnbVM0NFZxQ2JvZm92U2N3cnVVU2tV?=
 =?utf-8?B?K0dnR2lveFluZWY1S2tpcWc3bVlQV3gwazBNNGJWaVBrSzVDTG5pVHI4azc1?=
 =?utf-8?B?bVZMYW9Ca1ROeE1ScmRCY2k3SXQ3Mi9ndVV5VzFGeUlJbjN4TW82RW9pZmx6?=
 =?utf-8?B?K3FhSWxibzFXcklZak1sL2dRUHNkKzFNVmYrTTJodzB5T2diWFpkUVM3WXVW?=
 =?utf-8?B?UDl5Ylhrakw1ZnA2UkZxUzEycGVZUTBQM3NRNlpYN3B1ZFVNeHVRVHE4bjlq?=
 =?utf-8?B?RlFiQXZIcUtUSTc4RmNGYjB5eVhjRHcvK2RLR1AvZVZjRzdOeUlnZWJhdUNn?=
 =?utf-8?B?RkQ4N1NFc2ZSTWZVUEtBaEgzNEFab25YR2pobWlBOFA2YldaS3Z4eFo5MkUr?=
 =?utf-8?B?TGtwdmd2cEpFRmM4aHRZQjVaeUJZQi9MUERyT0hNWEs3T3dVWUJQK0RRazI0?=
 =?utf-8?B?TFhHVFpJR1hUVlpjRGVBVmRsUU43L1dBWFRUQUNjZEpVQkdyT2VMNU1JK0d5?=
 =?utf-8?Q?gKWDlQqOzSZ8VFhhaVuTZvI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0895414c-1f28-4533-ec9a-08dbe697c16f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 11:32:46.2235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XbVgcHJmRZEuHjkv70vBuJIiGUIAZPGYx2YlqMQIfzG/Sm09BNQQ7lwtPRJZ5yU3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8950
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHDjxhejrrjmm3buU9YvHIwxmb2UVG28JdL7I9DTEFg=;
 b=jZlOBGoOe125/wNGl2al+d/zJv1Oqg6BaSUcHRWCLFYUOqQcPzI5hV8gaMsShGFtlWSfPJkGmNjIjMfuE4n4v3d9f/6YxNU6hqgCweuxg8twKX28dEc4HrejuVMkGux8Ylw6zxMQxJIYpVBIH6n+KONqDMQhWO+yVxjOfBrkofI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=jZlOBGoO
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v6 03/10] package/newlib-bare-metal: new
 package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, all,

> I finally got the time to get back on this, but there appears to be another issue.
> When I use the following for installing the newlib in the sysroot staging area:
> NEWLIB_BARE_METAL_INSTALL_STAGING_OPTS = \
> 	DESTDIR=$(HOST_GCC_BARE_METAL_SYSROOT) \
> 	Install
> I get the following error message:
> /usr/bin/install: cannot create regular file 
> '/buildroot/output/host/microblazeel-xilinx-elf/sysroot/usr/microblaze
> el-xilinx-elf/lib': No such file or directory

> I had a very quick glance at the newlib Makefile, and it seems it might not be totally parallel-safe, especially for installation, so maybe:

>    NEWLIB_BARE_METAL_MAKE = $(MAKE1)

> Can you try that, please?

> Yes, you were right.  newlib has an issue with parallel installation.  
> Using $(MAKE1) or "make -j1" solves the problem.

> Now I am encountering another issue.

> newlib is installing correctly to the /buildroot/output/host/microblazeel-xilinx-elf/sysroot directory.

> However, gcc does not seem to be able to find it when building, as I am getting the following build error:
> /buildroot/output/host/lib/gcc/microblazeel-xilinx-elf/13.2.0/include/stdint.h:9:16: fatal error: stdint.h: No such file or directory

> When installing newlib as a host package, the stdint.h can be found here:
> /buildroot/output/host/microblazeel-xilinx-elf/include/stdint.h

> And the microblaze gcc finds it.

> When installing newlib to the gcc sysroot as a target package, the stdint.h is found here:
> /buildroot/output/host/microblazeel-xilinx-elf/sysroot/usr/microblazeel-xilinx-elf/include/stdint.h

> And the microblaze gcc does not find it.

> If I simply create the following symbolic links:
> /buildroot/output/host/microblazeel-xilinx-elf/sysroot/usr/include -> /buildroot/output/host/microblazeel-xilinx-elf/sysroot/usr/microblazeel-xilinx-elf/include
> /buildroot/output/host/microblazeel-xilinx-elf/sysroot/usr/lib -> /buildroot/output/host/microblazeel-xilinx-elf/sysroot/usr/microblazeel-xilinx-elf/lib

> Then everything works, and I can build correctly.

> How would you recommend I solve this?
> Should I be creating these symbolic links or is there a way to install to 'sysroot/usr/include' and 'sysroot/usr/lib' without the 'microblazeel-xilinx-elf' directory?

The below solution works.  Newlib is installed to the gcc-bare-metal sysroot.

Do you have any better solution for the post install fixup I am doing?

NEWLIB_BARE_METAL_MAKE = $(MAKE1)

NEWLIB_BARE_METAL_INSTALL_STAGING = YES
NEWLIB_BARE_METAL_INSTALL_TARGET = NO

NEWLIB_BARE_METAL_INSTALL_STAGING_OPTS = \
	DESTDIR=$(HOST_GCC_BARE_METAL_SYSROOT) \
	install

define NEWLIB_BARE_METAL_FIXUP
mv $(HOST_GCC_BARE_METAL_SYSROOT)/usr/$(NEWLIB_BARE_METAL_ARCH)/include \
	$(HOST_GCC_BARE_METAL_SYSROOT)/usr/include
mv $(HOST_GCC_BARE_METAL_SYSROOT)/usr/$(NEWLIB_BARE_METAL_ARCH)/lib \
	$(HOST_GCC_BARE_METAL_SYSROOT)/usr/lib
endef

NEWLIB_BARE_METAL_POST_INSTALL_STAGING_HOOKS += NEWLIB_BARE_METAL_FIXUP

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
