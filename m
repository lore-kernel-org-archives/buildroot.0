Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0B1C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 17:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 087D360B95;
	Mon,  7 Feb 2022 17:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ip-JXJ0hk8w; Mon,  7 Feb 2022 17:03:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A86760B20;
	Mon,  7 Feb 2022 17:03:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C26421BF2FD
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 17:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B104780C53
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 17:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LJ_DaWyLtCBx for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 17:03:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::628])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D84C80B37
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 17:03:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYR1nps5dDnR2BWs+RRVNDEdp8feEN+vfNqcJy+LE5ruQB457lIYAejKQX7LOGsTHQm5Tl6jGJamcVj5jsEbkEOEubeX2Q2rz/ayP7syaQkEGznmAQxytkwq/mOjWWqwfH+IvKy7XrsBvrFwkAd65l1sGg8+zY62lNZoHjF5qsLQx1aCA6ejWzcUytN94e7SFpFnJFspoDOJkB8jsi3LkF3RO9q+hBjfEcDlORUJAyEZfNTVFzuoSWS3M8qBWDsE2R97Rs6JsCa1ng4Hte4xBwtZyyvlK/PLxHYsw2iclt2SiM97pua3Yt8J3kFMW6m20Zm+T/kmyLQWo8b2x7aILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16xdKFMQ+Z1yyM8+iHISPdTHgtAZzdL2oQRFrjNhFVE=;
 b=fJl7G2zBQqATVkt+WpEKpRoAojVn4NkEfza6MDhZ8Vp3hSRu7OCllTe/v+6E84zuL6YCYa35FPdNxSkZBu0zEY6O/Cr5Ve0omUy2+Oe9Mod+d1yR9bL+BLER+cFijVd9yEYOarSaCywG9IE/GNOWo2Uvis6Ts5Quj1AvI5pO7kDhu0hlinCHC0Yp7l1r1YEU5h3xBB2pAOEHxDjc3fFe9DDvkfI4uq6Opab0iGvAJAzB00hOszYH5Zah4jrZ5ZaIZCJjPQhOxYg6AJpSLCSmXDPpkvdxKlVlH1KYlWGYofTyDS7cKKtsyd6miYYz7rL65gbPktS/MdJsul8xAEsO0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16xdKFMQ+Z1yyM8+iHISPdTHgtAZzdL2oQRFrjNhFVE=;
 b=KrAWnvvD0pOgCoZ5mZ/rNypWnBeklx8db/a91x0d0fgUMkv8g5gfpeeKpNBdUPUCgSmgALHYMDq51d2WGjRQS9NTeg3/U03ZrEtuwwPKpLzWqYrIk30QQci9MuhR0IPZrJA9NunZ1BNe87CdvlwEOia7dKHbNq3ib/SOToJRjsY=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BY5PR02MB6338.namprd02.prod.outlook.com (2603:10b6:a03:1b5::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Mon, 7 Feb
 2022 17:03:25 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93%7]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 17:03:25 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
Thread-Topic: [Buildroot] Xilinx zynqmp_zcu10x_defconfigs: two things left
Thread-Index: AdgbjfGkWVHh+j9fQheB50HkAzQTuQAGb/sAABRcuQAABPdHhgAE9RdwAABtZwAAAVpogAAHAYRg
Date: Mon, 7 Feb 2022 17:03:25 +0000
Message-ID: <SJ0PR02MB77586A616AEE69FE18916F15D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <SJ0PR02MB7758F655ACB4D148D78E403BD72B9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <0a82d8c7-a0c6-06a5-6a0b-788fd5c4a935@benettiengineering.com>
 <8be136a0-1263-3b17-0b78-b7d34ef146c2@lucaceresoli.net>
 <SJ0PR02MB775843B513EA2CAFD0FEBD82D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <032d657b-eb9a-2dc9-f60b-8536f1fc6c57@lucaceresoli.net>
 <SJ0PR02MB7758A5DBC6DD4DA837E0F47FD72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758129FFD78D128D3393198D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <16f4b7bf-546b-3bf4-c6a3-b711c8cfcadb@lucaceresoli.net>
In-Reply-To: <16f4b7bf-546b-3bf4-c6a3-b711c8cfcadb@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f31995f-f542-4bfb-8bd5-08d9ea5bc152
x-ms-traffictypediagnostic: BY5PR02MB6338:EE_
x-microsoft-antispam-prvs: <BY5PR02MB6338B4CE6422538A2DA088A7D72C9@BY5PR02MB6338.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Byd6cEN5SgUsCJdyTFyEWgACPW8iaXdwf1IyYvnqIhlD9XJCyIuFY69ZzbOH+r83n7325gCi/hFIMJNII31ZbkDu+43WKeKyE8cJ4U1F/BHLlpOVtOVCcAYh+AG8V3kLxa0vn6CJypNe1nWiaVHTSAt4+JdWmncNLvwaL775wAz2bZ0RGtcAzD1cwunrRUjiE0zmW0aZrhowEZagkkHL9zh3xZqualyJy8mhjM5kDCtEfLmfVSCzJVlSrcrEnQ2dts02dZEFSeTmsCvP7JYc89W3MR8hCFpYLzoR8O++PKtK6WGeTIiTcY/0tG2sY6AaCYmoqkxRpDEHETxV8+D1MTGpAByjJ8503X5fAaIhV9tzQUU2VFvg8504UmnasiEGNjxoKuj5oPlIvRz6D+D8uQ7sJX4V1v3mtZhLkEDHQlObhpUUhFbtqAp7lAIUoXa2SxfjLUafxbRuVFUcpKaHn/Xdyyk3yXvT+iuoV9TL2z5oBCss7XGR8KvvNvLCGRhN2ZUFQ1rWvVODtO7S5Q0+2mOjI/MvEoG5BprJH/4NboPJAAsGNDp9tQillZCsgGJOYjS02ecPV2dSwnMvUr3gH8TgNH+pTIMv+TIxge676VSp8MnvWATAZIUs65XH0PN+KVGC3FcN0qjWdyr/+eg4IS4o5tBf11agI5wcM5cLliXHtUTFBg1wWG3f7Jy1BkltnrFx5ouU/see+AdUo9SrYg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(26005)(38070700005)(38100700002)(86362001)(83380400001)(122000001)(66446008)(64756008)(4326008)(66556008)(33656002)(8676002)(110136005)(316002)(76116006)(52536014)(66946007)(8936002)(55016003)(66476007)(5660300002)(7696005)(6506007)(71200400001)(508600001)(2906002)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vk9JNjYyQThXV3RIak5GWUE4bmtDeUl0Yk1iZzVmemJjSDN4MEtUZ3UxZlpm?=
 =?utf-8?B?MWU0dCtBeWp5T1lLNVYzbktvOGVaOUZybjZoSmpJL3VlWFY2cmtlYy9VS2ZG?=
 =?utf-8?B?V2JKeTZkVU94TGMxQlJhVThUVFRIYTdFVG9Pbk1ER2VzditMc1BFOVBxcWVD?=
 =?utf-8?B?NDArZ0c4cjA2VzJIYi95RmlZeWVkbEQyZytITE03dXpOb0E5azRkRVp2alYx?=
 =?utf-8?B?N0R4ZXV2Q2R4Z0o3VkVGMy9rQklQRW5FMFp4SGR5QmEwcDdWT2NhZkNsU2lt?=
 =?utf-8?B?YmRKTGphakhGMUszUFh0M1dpVDZWN3hEaXRZTzRlTFQ2dWpTRHpNWmN1MDVy?=
 =?utf-8?B?OW93QmpMQUNueEh4WnB3ZkYrVWlXeEpCQ0FyWCsvcVJkUXloWnB1c3gzT2xx?=
 =?utf-8?B?VjlwNndJVy83ay9VQzNldEFOTmV4RU5jNUU2OHNpRkxDa2x6L3VSWDFWd29Z?=
 =?utf-8?B?cVF3emp0azlBVUVMMUZJdXNSdkVnNFB2cUQ3V2oxc1QzOTJmT0xPSFV5aUNv?=
 =?utf-8?B?bHdjQ3JGWGw2RzU2cWZLYThmTHhuYmVhUEJhOFBEME56bFE5Zk4zN2JLZHRN?=
 =?utf-8?B?REJpV2NMN3dmV09CN1d0bTkvaXRjY3pGKzl6U3FSL2c4cHNmMGk4TXJSaXpx?=
 =?utf-8?B?SjRKWllac3JLRTBseEVBVTFGUlppRUVjdi9aYmFrWS9CbFFwbWJpWWEzOUU3?=
 =?utf-8?B?Z1NKTk1PWnFGVkFKRkRhbVhzREdFZEdhWld0VGRxQ0huRkJ0ZzZHeTJINitN?=
 =?utf-8?B?dWM1YUNJVm5jaCs5aDIrVy9UemtWTFRlZFY2dFUrbEFKNzByVnU0Ynk0bFMv?=
 =?utf-8?B?THRzVXhmK1Uxend6NU51dVJjcjNzM05VWDJCSjd4RTlpM0E4NzVvWXEzaEtH?=
 =?utf-8?B?M0tsZ0NnTzZtTm43YllocTMyajcyMFpkSGpzNTRtTUR4bG52d1F1Q1o3WjVO?=
 =?utf-8?B?Y0VNYUd2NUhjYmQwOEdYQlpGOHdRdEtzd3RXOVlBV1hFVXJTbUgxVjRweXhx?=
 =?utf-8?B?SUprYXBvYnBXenRVRUMzMEZvbllRc1F0T1FiendDMTloc1VPNFJLREVGMzE2?=
 =?utf-8?B?VnU2MjFTWWxXVDhjT2RSYlpNMy9xYUlCelBTUWltMkVTVFJFMW83OFFVSEI1?=
 =?utf-8?B?VlZPdmtrZDhpdE9mRHR6a3NtWDVLWWtOVUdNT0EzYmJWanB0K0pGZWZuNGZa?=
 =?utf-8?B?L2JsTXVzT1BMR0t5RjRLK2JQTFlKV1pPQTdhczluV0pRbzk2VVlsWGc1QzJ0?=
 =?utf-8?B?cTZ3U3hMNmRCNjlXTE10REFiQkNoMk5nNFhUUDdoeEVJN0p1aWN3ZEc2U085?=
 =?utf-8?B?UEFzQllhWWtVQ0lZc2IvWEUvSEZJNjFEZ1pnUEpVcW9kYlViZjIvUGdlSmJ6?=
 =?utf-8?B?Z1l4T3NaSnd6ZnRZSEhudzU3REZ4emlLWGp1NzFiN3h2aE41TDZrdFNtSzJ2?=
 =?utf-8?B?cmltQzZEaGhCOVdGTTJzbDVOeTIzQ3grS0ZWV1hPZWFIM2tabTlvT1ZabTFV?=
 =?utf-8?B?UTltNDVjOTIvUHVnNVJTOUpLOW5odjM3aVE3QlFiNytUSUwvK0hZeDdSV1pj?=
 =?utf-8?B?dXpIU0lRcHJSQUt3ZGZJS3pPQjM0Zmd3WnhQRFlLdXZkT2x3dlgrTEFJVllR?=
 =?utf-8?B?enNFYnF1M25OMVN4TEtGanFIYUQvb0RNNlZoc1ZycXZWSWwvbFBpbnZZVEpo?=
 =?utf-8?B?dFhhbitpM0hYS2dDN1Q2UFlpSzhGSWlqbUdXUm1qRkhkQkh6WCtlZDFEbGJh?=
 =?utf-8?B?RmVubWF5OWFYZzFZejZKUTBEZE93YkFwVzQrTFdkRlAvbm1vOWd6aHV6Z1p1?=
 =?utf-8?B?dUFNSVZqeGlvbk9EeGk2Y2ZKQ3diei8yZ2YzQlltTno3WDVFN1o0V1NoNm4y?=
 =?utf-8?B?S1JrempTVmNLL1QzaG1nalpvQXUyZHJ3RzlsRC9URU9IejlwWjdUbVlza2Vx?=
 =?utf-8?B?NnUySUFZekh3cmY4KzNxbys4KzJKcWpwYmcvZnRtdmNqRmZlWWtmcloyRG9T?=
 =?utf-8?B?UXYxRGIwbzZodXNTazBYMXZNWUpzeDB3ZXpZRXBzM0Z5SElhcGlIYUVxT3Z4?=
 =?utf-8?B?K21KWXNDRUhZK3p4N3JtNFdscE1NZGZ4TFV6VEkxWUo3akwyZzVLZTluenJ5?=
 =?utf-8?B?M1NqVm1BWGFIbmFqQUxFWTBWbmVJSC83SHpzdkxJTzVjbDZjSEJBVzdNVE1G?=
 =?utf-8?B?L1E9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f31995f-f542-4bfb-8bd5-08d9ea5bc152
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 17:03:25.5346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5pdTkl9mNCms+XNreQAryv736iYVvE2VqzuqDs/7qMOQHbFWtTyg+V3+ZMpKEdzRHZzAvTEFCuw149gNqoh61Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6338
Subject: Re: [Buildroot] Xilinx zynqmp_zcu10x_defconfigs: two things left
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> Vitis 2020.1 changed the format of pm_cfg_obj.c. There's a fix commit [0] in U-Boot 2021.04 but as you are based on 2021.01 you don't have it.

> You have two options to use that fix:
>  1. use U-Boot >= 2021.04
>  2. provide that commit as a patch to the uboot package in Buildroot

> To go for option 2, you'll have to put the patch in the BR2_GLOBAL_PATCH_DIR, and of course _not_ remove BR2_GLOBAL_PATCH_DIR from the defconfig as you would otherwise.

> Hint to create the patch file:
> cd <u-boot-clone>
>  git format-patch -1 d42ab39f58e828c99a0cba6890e29986e87d11f5
>  mv 0001-*.patch <path-to-buildroot>/board/zynqmp/patches/uboot/
> Then add a "Backported from:" line to the patch (see [1])

I have tested the new version of zynqmp_pm_cfg_obj_convert.py with U-Boot 2022.01, and I confirm that is solves the problem!  Great job!

I now just need to figure out how to generate an vfat partition that has the file extlinux.conf in the path /extlinux/extlinux.conf.  Once I have this piece, I will have a version of the defconfigs that builds and runs without manual steps.

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
