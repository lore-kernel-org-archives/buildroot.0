Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B5AC4332F
	for <buildroot@archiver.kernel.org>; Tue, 14 Nov 2023 05:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDC4841763;
	Tue, 14 Nov 2023 05:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDC4841763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 82Ee2n0jv9NH; Tue, 14 Nov 2023 05:47:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 218F14176B;
	Tue, 14 Nov 2023 05:47:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 218F14176B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB1D01BF2C0
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 05:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A72A281F7B
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 05:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A72A281F7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qeiImcDoPJX5 for <buildroot@lists.busybox.net>;
 Tue, 14 Nov 2023 05:47:32 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::602])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 612AA81F74
 for <buildroot@buildroot.org>; Tue, 14 Nov 2023 05:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 612AA81F74
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Msdo7rHhElbjUZNHOkQrVxW6Wd+/dsHdySFONS0hBjLbHX1tVmxN5AN1L71MY+a9AQY0251KX5gV0UCQ3bypje3OUrZsQc/5T6bx5wUuGgxT5yjs6XyaOEmVy8jQfFDgj2JPTDnUiM+7T1TL6J5Me6H2l/NkaZaCLI/Z5123GiUQ1UcASV5J+ra8BSWWs6SGvU0veDWZRnVPYk5FFHnojtcUQ/DcUtX/67GV8M1XhzyZuhj5HwZJSEIofY17sZ9933ZZVYzdu8Mg+FB2H/Crzmkn0ITqGzUGOm7X+CfBf1XEfZUTL921Pe+09o4rxcFJVIXG5VXZ6QxC1jUMGjf38Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBD8CB+3hEpy7ftwJrFE9p3aDCx8BTymPR+OPkYJAbw=;
 b=M8QH65qYVhVEpjOgMJs5EwVdylFZqRrWnpKNxi3A0Ecd9JWywRHMHqj5ddZXsysXT1G00CoQZfQCUCYiVae0nhfs6314hlNpy1yN3F006twf+/kfyTTz2gI3dxcscC8rs22lpdEUzsDKxq8XvsyAOI4bBiMww8qfiSSHy5fcHmaFqCwA62226OV+GQuaf3mLwWx4HxSWe2iwO1CCWxV3xFRH6Hi2DSVVPAxDll/cefs6CHsge2HJGF7QJ97BoJACg5DvBVvMJGKbCipX/4nwAdTzVf1Z5H9eXcYqhPvD6oGDcP22337cFDOLt6xAJpbslCGB555rE35bj74+oOllJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MN2PR12MB4469.namprd12.prod.outlook.com (2603:10b6:208:268::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 05:47:28 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::cd8a:4814:157c:bbe]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::cd8a:4814:157c:bbe%6]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 05:47:28 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH v6 03/10] package/newlib-bare-metal: new
 package
Thread-Index: AQHaA0qXU55l7C7pwkan+EbiGTH5Q7Bj6Q6AgAGBHmCAAAKNAIAAGPkwgAAGH4CAE+RT0A==
Date: Tue, 14 Nov 2023 05:47:28 +0000
Message-ID: <CH2PR12MB50048B7684BF4AB7C79CC87DF0B2A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-3-neal.frager@amd.com>
 <20231031134317.4ce2349e@windsurf>
 <CH2PR12MB5004C8F27820E2EC98FC5232F0A7A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231101125048.01553f76@windsurf>
 <CH2PR12MB50049049609F6BE2EF07D89FF0A7A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231101134205.GC114892@scaer>
In-Reply-To: <20231101134205.GC114892@scaer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MN2PR12MB4469:EE_
x-ms-office365-filtering-correlation-id: 8a57fe30-e144-4113-ff2f-08dbe4d52fab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YzQzyW49o3wxcWhSiWabRXObGlRmQ12i56AuBTGLiwQ8022xS2R3Iay3bfiZ5d5H6mfJ6HjSCVXX5FDuHII3Cs6pppHFmjygeUsOA/4u8N8DBb/iOdg9VUYgEEqElM48Y0NrY3i19fhEntfMJIe6SA9uQk34iHSmn/cpiVELAWwHRP5vRZRKCzw+/J1Y297GYlgX1Za1deODNpLki0pWjzQsfS08wxnkKQu1m2XM1vhiXQP2eJ6rTG/Eh04IlH69r0w822Ng8TjM+WzZRDB7qWsKRSxN2KOrz/i7RHglyqJU8W8trLRsvfVK8u3E2YthlxiY2PXOCC6X66pTrcfhZ5/Y5h48y744r9Hw9AlsKYKBZ0s+EFQ8tmZsi43IPElH+LdtEPkdBlpMEm20a/OwySewmrTgcJZwcEa4dd+MeKbpKSmXJuLajB9lAaDavOqzKnCGg2Ctlaq4HArffz4q+WjOYws+MPjCx2kQhe0deYv7BsRGoA2JpP3237T3qqqJvERsmmrdhiejQkAr2kZK1LMnHLgkt8S4yU52EdSeh0cvVxGOaQGM0Tn+/hShICxwfbrmgZluKvRjXeCc4dC1T0SGHRq6aNXKCeY5ec+TntL0z7PT/iE6XOUm8XCRy9HO4b4cu6Y8g6RtHusEIjmJLA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(5660300002)(52536014)(6506007)(7696005)(71200400001)(966005)(478600001)(4326008)(8936002)(8676002)(41300700001)(26005)(9686003)(66946007)(66446008)(54906003)(316002)(66556008)(76116006)(66476007)(6916009)(64756008)(55016003)(2906002)(122000001)(83380400001)(38100700002)(38070700009)(86362001)(33656002)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVo1bDd3MXc0Y0VoSUNuMldCc2t1Mnpsc0djektyYWFhK2RsZzlORnBEOXQr?=
 =?utf-8?B?ZElwcStEZlB0b1hnRGEvazM0Nmx3dXpON1cxS0VoK2swN0VRb1NHQ2JKcFM3?=
 =?utf-8?B?b1JpTEpnWlU2R2RYNnVJdUx3RUs4SHpVU2hnak1SVEJKYWxVSTBUZTNEdlpi?=
 =?utf-8?B?REx6Z01zMkxORnRzVUN1Q0xuSlFUOTFJeDRIWExMSDFHSkxsUi9Qc3IwZXM4?=
 =?utf-8?B?UXBISGZlMzdSWjhJWTNjQlJHU09wblRabHg2MnJjYWo0SE45TGRRZVN1RHQy?=
 =?utf-8?B?OEVLVWpKWk5aaU0wQlQzNlZqOGZ6WE9teGJ4cUdHNExHNkc4Z2hKRzlSRGQz?=
 =?utf-8?B?R1NvbHpMb0RLSkJ2M0g2M2p2SW9CVnFsdGw0Nk1YY0tWYVJQQU9GN3AreWhn?=
 =?utf-8?B?U0tGSnNVT2JoaTcyQ3YrRUwzM1ZrT3RheGprK2JEejhWekFiV1ZiNXNqcmZu?=
 =?utf-8?B?WDRXbm9mLy9SbXV0d2JYcDdRKzFodzdsaVo5NGZHc29uLzdkQ29QYlZkL0t3?=
 =?utf-8?B?bFU4ME1PSlg4d1dMREtFMEVGcWVNUXhKODQxWG95ckE1Q2tiSU9TeXlxVTN2?=
 =?utf-8?B?Q2ZJR0xTdjZuZkNxK2FjNEFkMzhzeGJPRUlub3lzTm9wcEdEank1VHo2cUZQ?=
 =?utf-8?B?alllQnNld2FKMThES29aQVNtM1lLbklJcEEzR0RaazRpZWZweWhPaU9XandY?=
 =?utf-8?B?bElZNDBaWlk0MjZERUhHMHZoV21zQTdHK3JnTHhLbzI2OE0rLzJsOUVnTDNZ?=
 =?utf-8?B?MFNIQkhkWGhlM2VOS25xUW5Kamdwa0lEOW8rUUdZdmRVcStNdUpJK0paMnZ2?=
 =?utf-8?B?b0tzRHZlbjc5T3dlUUJvbktFbjRGd1BSeXU4c2ZQeWJON3FaeDd3cTZjU1Nv?=
 =?utf-8?B?dTZ2N21ZbVpGcFhmbFUrZWJncmMyaDNtd0hpZ2hub0VvUlhCN3ZveTBJWnhv?=
 =?utf-8?B?R3J1ckRiTTROWXY3MmZFOTdORFZXVFF5OU1xNXo4RkZCdFJTY2JTWFFwSVcr?=
 =?utf-8?B?cnFPMEtHR25pUzh3RTZLOEl3OVl6OTVVTlBtTHd1T2dGWmJnTGE2VVNTWjdt?=
 =?utf-8?B?LzRyWloyVk9NYWRLNVhHaXE5UTZPOVV5WHJlK3R0dzRMNWxDWTFxZG1kTDJQ?=
 =?utf-8?B?ZGx0L3lZVjk5R1F3VzdjWTFSNGMwejRNN3Y4VHd4ZDVMTFU4QVlZRDhGSHhn?=
 =?utf-8?B?bXJFVGszdmJMeC9YOVJDL2dFQWNEQlVTYlVKdW45Zmp1VCtIWmxBd0N3ZC83?=
 =?utf-8?B?bmQzbTd3SEpBSUZvTnRkMDVCLzZkdWdMM1c1bUtGQ1lOaHVYRndtQ3ZuckJs?=
 =?utf-8?B?bE9oWWQ1anN4TTBLWk1xRTIrbklIZWNSQnkxVmhxbVB3dWd2KzQrc0t3amhu?=
 =?utf-8?B?cy82MXhlSXVFRU5HQzF2YlNYU1pQZ0dwOXFlV2lMS3pDaTkzOFF4NjIwOE9K?=
 =?utf-8?B?ZnVYQWN0cHQybk0vMm8rdGxtd1RQelRQTlNGQlcvZVFKWXFpODV3a243TGhu?=
 =?utf-8?B?c1RiYzN3U0ZyMHdBbVZHWTczSm16WXBEb21nUDBETlYvdWpRUlZ6ZC82N0ow?=
 =?utf-8?B?bTFacDNMSVA5U29TYzJsOVRKZnlmdU0raFQwQWdONzloa0h5UkJHMmUwYUpn?=
 =?utf-8?B?RzdiREhsRGhSNFBEZzV5QXhIOXBlTE9qb2VDVTNEU3YxWWRNblFzRWo0bXA4?=
 =?utf-8?B?cFphQUVzSXRCRjNzS1JqNDVaUk9zUDV2T3poMDBZbWRVOUxaaWRSWmZUNTVZ?=
 =?utf-8?B?NjJ0M3Z5ZHZ3RXkzU2pTV0hVVE1NRXNLbVZZMDhLSm9QVTcyLzdIOHNvaTJs?=
 =?utf-8?B?SmlCWVI4UFh0YXdLU2lQRFhCQVorUWZVc0lyODh1ekVxUzBiUzF4OVZnZ2R5?=
 =?utf-8?B?LzY0YkhUMFZPekhyRHNLc25iOXJHVGw5TURwcTIrWFB1TFJSdTRUOFNJVlVR?=
 =?utf-8?B?TnJzZzRLTkZ6c1VvV21TbXF5amxqUzk0WHlCVDNWRFZPeE02anlkQkVMc1hp?=
 =?utf-8?B?eFNqOUFTaVp0bHd1S0dFZWpWUlJmQTRTcEUySGdlRDVyNXVXTE5vOHdybTlJ?=
 =?utf-8?B?eE5kKzhJQkw2YVhYS0Q4VVoxZDBLVzEwaEk2VGNMWko1YW9QUzAzWldjbTUx?=
 =?utf-8?Q?xcRA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a57fe30-e144-4113-ff2f-08dbe4d52fab
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 05:47:28.1995 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CO7IZXJ4Gs78ZFpUuj5hh3Mc6C9Yn/DAQjG+kW4JZNUvDct4RgLYcQzLu9jDSZrg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4469
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBD8CB+3hEpy7ftwJrFE9p3aDCx8BTymPR+OPkYJAbw=;
 b=m+mHSnFcPwFfk51AlgKpcycxfHM2AuSMa/7LmarQHhLO13KX/o8KJzs1CQ9KqU0Fwqvd7Qvyj5IKcVWMfj7/EWhzhevf+sVLkVGdAtW2oTr4pZsZ3Qpz3oep2cM6lTQS34BK4mXkIIq7laNI7cIdhr9fkbmD5cx2E6U+pqAQDY4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=m+mHSnFc
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

> Unfortunately, by making newlib a target package instead of host, the 
> buildroot infrastructure does not seem to like that newlib was built 
> for Xilinx MicroBlaze and not the expected AArch64 target architecture.
> 
> Below is an example of the error message:
> ERROR: architecture for "/usr/microblazeel-xilinx-elf/lib/libc.a" is "Xilinx MicroBlaze", should be "AArch64"
> 
> Is there a way around this, or do we need to keep newlib-bare-metal as 
> a "host" package to avoid this issue?z

> You can use _BIN_ARCH_EXCLUDE, see the manual:
>    https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_with_specific_build_systems

> However (but I haven't read all the previous reviews), why would that file end up in target to beging with?

> It is a static library, and from what I understand about this bare-metal toolchain, the goal is to build firmwares for co-processors, and those are alwys going to be statically linked, right?

> Furthermore, newlib is always going to be a static library, never a shared one, right?

> As such, it should only need to be installed in staging/, not in target/, and thus:
>    NEWLIB_BARE_METAL_INSTALL_STAGING = YES
>    NEWLIB_BARE_METAL_INSTALL_TARGET = NO

> And then, the check-bin-arch would not find that file, because it would not be in target/ anymore (and thus _BIN_ARCH_EXCLUDE would not be needed either).

> And then, thinking yet a bit more: it not not even need to be in staging/ either, as staging/ is for stuff that actually runs on the target's CPU, not co-procs.

> So, I think the gcc-bare-metal package should be configured with a special sysroot, and newlib-bare-metal installed in that sysroot, e.g.
> somethig like:

>    HOST_GCC_BARE_METAL_SYSROOT = $(HOST_DIR)/$(GCC_BARE_METAL_ARCH)-elf/sysroot

>    HOST_GCC_BARE_METAL_CONF_OPTS = \
>        [...]
>        --with-sysroot=$(HOST_GCC_BARE_METAL_SYSROOT)

> and then:

>    NEWLIB_BARE_METAL_INSTALL_OPTS = DESTDIR=$(HOST_GCC_BARE_METAL_SYSROOT)

> Totally untested, but this should give some hints as to where to install stuff.

I finally got the time to get back on this, but there appears to be another issue.

When I use the following for installing the newlib in the sysroot staging area:

NEWLIB_BARE_METAL_INSTALL_STAGING_OPTS = \
	DESTDIR=$(HOST_GCC_BARE_METAL_SYSROOT) \
	Install

I get the following error message:
/usr/bin/install: cannot create regular file '/buildroot/output/host/microblazeel-xilinx-elf/sysroot/usr/microblazeel-xilinx-elf/lib': No such file or directory

This is because newlib tries to install libraries to this directory before the autotools runs the following command later on:
/usr/bin/mkdir -p '/buildroot/output/host/microblazeel-xilinx-elf/sysroot/usr/microblazeel-xilinx-elf/lib'

I have a hack solution by manually doing the mkdir in advance, but this should not be needed.
The autotools should make all the directories that are needed for the install.

Would you be able to look at the pkg-autotools to see if we can fix this problem at its root by creating the lib directory from the beginning of install_staging?

Thank you for your help!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
