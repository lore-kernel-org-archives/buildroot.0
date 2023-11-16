Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09391C197A0
	for <buildroot@archiver.kernel.org>; Thu, 16 Nov 2023 10:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E5BF83123;
	Thu, 16 Nov 2023 10:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E5BF83123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B9LQRhIciLj4; Thu, 16 Nov 2023 10:20:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F4F883112;
	Thu, 16 Nov 2023 10:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F4F883112
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED54B1BF32C
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 10:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FDE0830E3
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 10:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FDE0830E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P0TAybIP2Wp6 for <buildroot@lists.busybox.net>;
 Thu, 16 Nov 2023 10:20:48 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77325830C5
 for <buildroot@buildroot.org>; Thu, 16 Nov 2023 10:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77325830C5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sl/ms4tdfWQK2Vs9l4nevvlGYPNReSgmNMaCtWX5m2Uke5MiO1eGE+zZaCtVoJ6AHVf9Cpnv24m8kYCyT9N8uWLQVKQDeM/gUyZBKc6uUAM7hB01BD8vj3hccb0L9DwjTabWdiQLtMkGjvDaXuVGl3laNLzLGKR7/Oz1BNr0mvZrVE+okXBFQKD9l2U8rK3e98xNjTJ4gdHtgUI5/NM8+80nDmLFRJ95k8ksHPyZW3k2rpufs24wGGBuneUY1iyZYhJ/ARmCFDW/1c8HJqUP6Jn4Ka/KhU+Tel25SV4skoXnOyqFCcvZJRssgqFfzeom0GiewG9sNrnN8RO1NDS6Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePTOGo2iy9r1ym5qy2Ov8Fe2dljWaA9bh/xEN8+Qv8o=;
 b=UV+jS6ttV40olGNzTuGUqpE6WiOr4DRUfiQmesqItV8jNwlSv4+q6VRpdoKADTqiwHd8tODeyaYhj1TVKQPf1OTRuQUxVIguUC+2sZtjxsd0FBhRLObnUFxSdHfKXv8o1c1vh+S5mIGdloMLP3ryFbHchYrjQy0mcnrF+FoLNisgmNbdUXmKR8lP7E5FYGTwx52mfWzYynmWi1G6EY2scpk2G8oGHSVR6kGoFPiu9EAm/qstrOETliaQ0CB4Ro1HXClqUpaO/Ob0DBbQ1AXOr0kChYOZJdH2HEwHXl5T+X+h+2CyAZ1CZCaNXxr0Fgi91r1I53VL/SCjBQ0GGFGtxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by BL1PR12MB5031.namprd12.prod.outlook.com (2603:10b6:208:31a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 10:20:44 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::cd8a:4814:157c:bbe]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::cd8a:4814:157c:bbe%7]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 10:20:44 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH v6 03/10] package/newlib-bare-metal: new
 package
Thread-Index: AQHaA0qXU55l7C7pwkan+EbiGTH5Q7Bj6Q6AgAGBHmCAAAKNAIAAGPkwgAAGH4CAE+RT0IACZ+6AgAEJChA=
Date: Thu, 16 Nov 2023 10:20:43 +0000
Message-ID: <CH2PR12MB5004D2C28BD2A2DF2B983C98F0B0A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-3-neal.frager@amd.com>
 <20231031134317.4ce2349e@windsurf>
 <CH2PR12MB5004C8F27820E2EC98FC5232F0A7A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231101125048.01553f76@windsurf>
 <CH2PR12MB50049049609F6BE2EF07D89FF0A7A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231101134205.GC114892@scaer>
 <CH2PR12MB50048B7684BF4AB7C79CC87DF0B2A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231115181243.GK996011@scaer>
In-Reply-To: <20231115181243.GK996011@scaer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|BL1PR12MB5031:EE_
x-ms-office365-filtering-correlation-id: f544bbb6-54b5-47b0-a13c-08dbe68db105
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Anuv/5+0755sxEfMJBlYD2H6qMa7RDykIoSIaGOODJ0RIK2h4O042ejxA9eT/7q2DiSaAYCZVL7HiHxk0iwI3MzYpEve8w+Lo/ocRfkmrkOQB+TBdNCAM11b4EBGn+y9EMHY1fhycI3VXm1GXmSz8rcMtYLHRzmsmj2Hh91Qj2eEabD+05u+Gos0KZYUEBgCQI9CF9xn63SvHcmgxZjGRbjJS2wohkPYJ+Sf1ZELYkVyE9IPkivleGg9MyYHjPJ0AEH8sw109z3MzP/BYf3ectvfp2lQYrOi47nQm3eIsbNiduBfee2/g1Rz1yFOUopAnvVbZpSauCt7/Q/ZA4Frn+hhb1DQuUJkLzdGgqp+b9PPlNPzt2Ny9skTWFzjlNaWLMNcO2ZWg+Rbh2hR5m1xnfp4qKnDTekTK3oyAlSB3Qp48bW061bODbsXxC8jZIKMZht/w9KFrPe9XNEe00blsIFOC1IvYGXefPBs1LCpJdcNmYcfW8wfH/bA2vYci+AdZiiCbXi8Jl6UDzdLntD7rdE0vxYL4AnO4POJCly+k5YDcWs1Bk1Pt/hFDTL1ZoNX8bWesWVdlja9zk/pSQ7vXkjv/8Me2/icncxgjVOGZmUQX6df1yn/3x3GONuMP85ABxjUN9x3WnSrQkROaORIVQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(39860400002)(396003)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38100700002)(38070700009)(122000001)(55016003)(83380400001)(9686003)(7696005)(6506007)(71200400001)(478600001)(86362001)(5660300002)(41300700001)(66476007)(76116006)(66946007)(66446008)(54906003)(66556008)(316002)(64756008)(6916009)(8676002)(8936002)(4326008)(52536014)(33656002)(2906002)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnFDR294OXVQQW5VaU93YmNER3JvR25ubHZIeU05SDJLMUdCNXowTkJPNHJj?=
 =?utf-8?B?TVF6cStJV3l5cEIwcDliTFkzR0JNYU5scExEOHg5cWxVNnhBT0dzS1pnNWRq?=
 =?utf-8?B?OHZkeTFoTFhCcTFKWmlmS2JYeVhPUCs0ODE1R2hUaWo2QVZIWWcxTFBFYkhr?=
 =?utf-8?B?cWptZzAvUE1RY0RCbFROM3ErajVDUjYzSlRNdE1iRUIwTXNnZEE2ejIxNmtT?=
 =?utf-8?B?ZW15cWxqbjdvUnBnQlhHMkw0aS9BSFExVCtQM25yL0dJa0RGL2V5Y1hzeGF1?=
 =?utf-8?B?LzFHUnRCcG9hNEo0WGNtc0VVb3F1QTRqekZCRkpUYW1Gb2RUMUQwdXJxbjZ3?=
 =?utf-8?B?ajJxWVJYUUd2VjMzVUhZcllOckZOWFBxRkhvWmIyWkkxNzZMUndsNzVHUFBP?=
 =?utf-8?B?K0puK0F6LzZ5dVJvQWgxMkFFU0Uvc1Z6V3BsUGhYY2MycnM5U2xOUjR2djZY?=
 =?utf-8?B?dVNzd1hPd1Radjk2NmlpNHhIUjZ6SGVycjRicktYOHJjZWIwQTFBUzVRazZr?=
 =?utf-8?B?MVRwZ0Z4MzNWMm1UeVlxL2t1VGV5bmp3UmQ0eHg3SllqSUk0TTZhekVtRHRl?=
 =?utf-8?B?UXZBREEzZ2RkQzQ0T1lueTE0VlVyd3ZUdTdHeDFrajVaNTRVUzNxQ2tERjNw?=
 =?utf-8?B?ZXYrbENxRmNhVDhZOS80a05jNmJhOForMmZhUmd5Zjd1b3B6Mm1TRE1INUpO?=
 =?utf-8?B?VkhBZzgvZFZTTlJSOG1rSnN6N0xmdERQUmcyYzdVUmlCeTNseStQMDJZRmxy?=
 =?utf-8?B?amlYTmtEbUtFRHh1dVQ1cEpFQWxjeUxjQ3dIa1RxOVBQdkJzOHc4NFdrRHdD?=
 =?utf-8?B?UCtxMjB6UVJBTjdBMXhKeHo5NjVBTUhvaEVaM0NiV0RoeWxmUlI3OEhaak5K?=
 =?utf-8?B?YjZHNFlrbys5V0hqVzJTVDk4dWZhRk5sVnVyOHByUE52SzNHUUlSajE0bkFO?=
 =?utf-8?B?ZitSaEVNQ2x6eFlmY3RXSEdsY2dsVWlxbWVOQ1hWSGFUb2swYWVzOTV0NFlm?=
 =?utf-8?B?VmdJT2FUQi8raTNHYkQ3OFBkeUdPRHZtaTZyMUhHZVdqUHN0aEZ5WWsxQUY3?=
 =?utf-8?B?QzZDaENLTUwzSklHQ211NVFBZTNWbXF1Z3ZYNDhDcmlLYmpFSmdKNnQ5emEv?=
 =?utf-8?B?NzVGc3piMS9yVTJZTnVGWVNmVk45czA2WFkzSm96Z3lGS2NINGpScmw1cXVN?=
 =?utf-8?B?bWhhWGljQmZNbFUrYXZDa1AzK1ZkRjI2SXF2Z2hJQ0RLTENhdVloLzRkV0Y0?=
 =?utf-8?B?SXMxMmF6bDExQ01tU3A3elJ6bk5YdFZEWHl0SEdNNVpSVmdKWDlkakRrcFU5?=
 =?utf-8?B?N1Vad0c2cXpNdXdKcnhmSGd1cTlTeEdYK2ljQnFienlYMEliMVdJSmRENHFR?=
 =?utf-8?B?MDB3cVF5cmk1S0Q2cld3aGJsL2ltemdtRFRSWGxvbEMyZDRJV2VMOEs1bitM?=
 =?utf-8?B?ZkRXcGluVWl5aS9IRUE2eEw1SjFTZFkwZitLWUp5RlJsOUg1NXY2UWZ0WHRU?=
 =?utf-8?B?MDZHcEZEZTNjS0lsd3RCNHZ4Wmd2TmdaYTJGcTZKb1hNTm12RkNuRnd0VStj?=
 =?utf-8?B?TENjRE0vend0Uk9HTVU0Z085aUo0UFphSk03TkM3QTg1WGtZaFhrNjF3UWNO?=
 =?utf-8?B?YzVyV29UK2dBTlkvSUpTVGtTS1FwcXhiTHBlZFhQT1lMcEtsTVA0NzVlTlNt?=
 =?utf-8?B?ZXFoNTQvOS82MnhaaitXcWJHa21zUC82eUI1ckt4RmlVNStFZnJKVkV3ZGhy?=
 =?utf-8?B?dlRVSEMxM0QzVCtmaW4yTi9nNHZ2VXhBTkIrSFlhUXdSWUVmN0FUZHJCZG9X?=
 =?utf-8?B?RThTWXh6NTUzQ3JFenVpUjZkaFkyZ0x5a2xFaktkcDZueVl6ZDVZdlpmTUZt?=
 =?utf-8?B?SlNSUXdYUEVzaCtyekZrQWdqbWd0akpuQXlQMS9UUFp4YVQ2Z0Z3MW03Wjl2?=
 =?utf-8?B?Nmh1bzZIRzNsekw2ODgxRWpOVmpGZTB3UnlsdFBlUEJHczlTanVDaDBRQmda?=
 =?utf-8?B?aUpoVERIanNzMGk2ZWdHc2ZpbG1jcmJZaGRJcmRZb2JwZHRvaVV1SDJTcHR6?=
 =?utf-8?B?NFlBZjhmQnNQQW4rZkF0MEdGNTNEV0xaYXpWZVEzYU5uUSt3MW1DWVdjT1F5?=
 =?utf-8?B?Y3VCSHpTK3c4R2VRRDlqaWhNT1ZQOEtxSVpEbHUyQWhGUXJZdnFhM002Qmtq?=
 =?utf-8?Q?a0xCNwI5CHn1pQmZMV4mQWU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f544bbb6-54b5-47b0-a13c-08dbe68db105
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 10:20:43.7415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QQIdyaBhKmQSgPZJvDnozpTzr9+e/RnFuKiv7N/1IQ9yB9oBVfHPYNziz+l+fdpO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5031
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePTOGo2iy9r1ym5qy2Ov8Fe2dljWaA9bh/xEN8+Qv8o=;
 b=NZFBKEbh/MZbYAs71J0TvumIo6VDggFueLkQU1FygK5VwxB4nbFsaKrh2rfFbXtxWtd2jHNpWym54HYqNVKyxSUuSMla0rnHc2RfMCMzWjxVVYuvtkSutdOYmxZf0q/lAASNDH8mg6Y4qhpQ/pEkb12vpY29ggm+tw3//677Z+s=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=NZFBKEbh
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

Hi Yann,

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

Yes, you were right.  newlib has an issue with parallel installation.  
Using $(MAKE1) or "make -j1" solves the problem.

Now I am encountering another issue.

newlib is installing correctly to the /buildroot/output/host/microblazeel-xilinx-elf/sysroot directory.

However, gcc does not seem to be able to find it when building, as I am getting the following build error:
/buildroot/output/host/lib/gcc/microblazeel-xilinx-elf/13.2.0/include/stdint.h:9:16: fatal error: stdint.h: No such file or directory

When installing newlib as a host package, the stdint.h can be found here:
/buildroot/output/host/microblazeel-xilinx-elf/include/stdint.h

And the microblaze gcc finds it.

When installing newlib to the gcc sysroot as a target package, the stdint.h is found here:
/buildroot/output/host/microblazeel-xilinx-elf/sysroot/usr/microblazeel-xilinx-elf/include/stdint.h

And the microblaze gcc does not find it.

If I simply create the following symbolic links:
/buildroot/output/host/microblazeel-xilinx-elf/sysroot/usr/include -> /buildroot/output/host/microblazeel-xilinx-elf/sysroot/usr/microblazeel-xilinx-elf/include
/buildroot/output/host/microblazeel-xilinx-elf/sysroot/usr/lib -> /buildroot/output/host/microblazeel-xilinx-elf/sysroot/usr/microblazeel-xilinx-elf/lib

Then everything works, and I can build correctly.

How would you recommend I solve this?
Should I be creating these symbolic links or is there a way to install to 
'sysroot/usr/include' and 'sysroot/usr/lib' without the 'microblazeel-xilinx-elf' directory?

Thank you for your help!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
