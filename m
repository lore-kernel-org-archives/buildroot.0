Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64C0C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 07:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67BDA41FB4;
	Thu, 14 Dec 2023 07:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67BDA41FB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AXA8CTXwihI0; Thu, 14 Dec 2023 07:10:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7765C41FC3;
	Thu, 14 Dec 2023 07:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7765C41FC3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 582741BF28E
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 07:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2D2F60E4F
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 07:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2D2F60E4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NivKpeksa8G8 for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 07:10:43 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::609])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71E7A60E2F
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 07:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71E7A60E2F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGgRyXvEu+O5yDkEew8cCJH25Ak8PGAZKZg5I06KnG5EikSuaxsvHAkbPSB8wJjhY2TIG3UU7SHSyrsvgI19in8CbvxHsViRvEk1BtaBbwZ2Ze8aoVEdhrSq5ZhOB+G2SuQDdnBKZhAL736n2sD4/vc2NuX/d3h9cUNdF8VoqGzhGhpeBr23WHWPNgWKVMMkE68dREqserFXpiMc0cQTN3pQ1S5CR5LHcH/SeQ8IkOPe8RxQnuSnYKGdP1WDLd03kisVnc776iGBnZ9e1ir/9LKny43WgkzeaR15ItAOIYI2PUNOzVOEjzJqXhbc8dSDeVdy4kYO5U+xnavKxcb1vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzpMkPLTJYBxkaHBziVzfDPz943IghB7S2rcNjvuwlI=;
 b=GwQv7oyrUnfvuUwxxIouPXXJYDCs2DhyURDVxwKR64VeASNIwO66zU3LOdCBJ9dWjkaKlXBQPKz7s/9wWk3zBFDD1TGPPAw+4g0uedGOWfZkjLpnk/EwlITAbqlex3n2nm/Q75HnEQ8KLv84iLXfzqO8Vw+HrMtq4O+jL1enSIz/MTF5Pr11vNPPm16aoFhcZuO4GzuFF63PBXQrvrTggHm9EL6Ary1G6EYi3tXOTG7brkxPOeGMsJoEVgOc6XTtiu+vFbwoGajhLOE9yL9McP1vE2eSJcY/uSK1MkyzDkHIGdGaRd4pCd8K2pHPHEB5aQHXlOg12O/h/QZXXaftmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by BL1PR12MB5270.namprd12.prod.outlook.com (2603:10b6:208:31e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 07:10:39 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::cd8a:4814:157c:bbe]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::cd8a:4814:157c:bbe%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 07:10:39 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v8 01/10] package/binutils-bare-metal: new
 package
Thread-Index: AQHaJoRsxU6mz5uOtESx1TgKL/L3BLCn2nkAgACQB+A=
Date: Thu, 14 Dec 2023 07:10:39 +0000
Message-ID: <CH2PR12MB5004A76EDFB561312927A1D4F08CA@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231204073443.1543587-1-neal.frager@amd.com>
 <20231213232854.5242117f@windsurf>
In-Reply-To: <20231213232854.5242117f@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|BL1PR12MB5270:EE_
x-ms-office365-filtering-correlation-id: e536a42a-a24e-4889-1b14-08dbfc73c6d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MgBOFoEegPKibc2dVl3Y+8nBUNXw5dbhGAYqBpqn0qo0tmq7r3aENTcAo+ydUiu+reVr+V8h6ymKEbQKrGMBLcdtZAZyeXjZ6r2fDlKRLukf6G7JcIkQOdIK3jLy9fZeis6wojiWEL7pp3Vt3qRYlk8WOD6Q6UaxTife1K+DZw6CIsa6hEoU9R7v28eny1ESHCgOk321L+rdMAz0+f5nw1Lln1MsSxhu2ec6/AHHbVEU8+M0pJ3mRegKBQ8/nBgQIqvZ1mVUQatTQen5/9bPW+mE7REvyOfgR7sCuch1l22w+o2mS72hVO3daSGeyIfcq7iRqkp0MU+oy3gykfppajDjnBDsr0X8MIP+I+RyF54TFJ6aWwV7R0qsifnBwoxCfUKak1D9X2SyK2hFB0l39D6LdmEGannoQdXyDuTRa4HqwScOZtjUuzRbr65l8Fn3X9E4KNyMXUigKY5bCQZ+W5I4zX6+hzsBr+6yLZIbteq5U9NRZLhBa8CWH9iIcOndMuUsHxFM4II1LXKcOVJFqXk3KB2o6+4RsME2MV0XlaKGQ/5aV1j9+6YUD5LXWNvaY2mjNYmtnimSDWNUNu6KFU53glL19oWJFcoqnksG842tGKLaf3LW1RBuUWYxQiWmUy/APNAMiBE+gFjKupui9Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(136003)(39860400002)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(7696005)(6506007)(71200400001)(9686003)(38100700002)(83380400001)(76116006)(5660300002)(52536014)(4326008)(478600001)(2906002)(41300700001)(8676002)(966005)(8936002)(6916009)(316002)(66946007)(54906003)(64756008)(66446008)(66476007)(66556008)(33656002)(86362001)(122000001)(38070700009)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8xDkGG9gJS5nyb6w+GDSED5m/SoKL4J5CqA7GKGA+Volutlv6c98zsN3z4YV?=
 =?us-ascii?Q?oT8V/TzhVjVVvi3o6x6GJW5A9aTgQsltWcD5Tw6Guf3+8EtdhnEktSrMFy80?=
 =?us-ascii?Q?ym5XoVS7hfwdq15uZa1asNvO1go5ukU4HnWaQ+O6JZ1Rw8CNbZYl9qi+0aDD?=
 =?us-ascii?Q?JTZo+VY7aWOxxjZitUWQIu1ESSZSOuqCbN+HFISQBExrZxxiIvvdOkqFNHK5?=
 =?us-ascii?Q?JvMX4u+8fc9loWaSjDUMU1MrAbIOTErCR9STYyFj7NJVGZpHJpDXMwlZ8v/V?=
 =?us-ascii?Q?0htxBLZajkDmZzKjPy8nRmEqBQ9h8MKHuUSDnct1/L4uTa1eeJrvnwizRpXb?=
 =?us-ascii?Q?MCIUYL34gs59OkC0jnVe3LjfEBFVRaNUqWYydw5ePUfB8zdrIvluLYHwTHtt?=
 =?us-ascii?Q?5SIXEPjMGojE1NQElL/5eAgVYeQG0AeARDZTcyyTqyl6pvoCr66qZObGySaZ?=
 =?us-ascii?Q?JaRz/k3DSjazwXzigbx3x81B7EWrJ2ZObPURpeaaKBYkcRyJNDVpbAFMCoUG?=
 =?us-ascii?Q?KKjf3lcoTpVI95Y4RzjLo0B48zeV0Ymqe3cB1p8kdcJ8Ujp8JPGXb8JU83aE?=
 =?us-ascii?Q?ZxWA7hLxpX9U0BG+6iFD6EBLaxuDT3fBK7W46SDiob5FDFU6jPljqQrdNHLj?=
 =?us-ascii?Q?lBytbADfnAnhRzxkkW4Jrs4UysERN01hSAHTyUrxzIiY3jI5EKToJIYecSw7?=
 =?us-ascii?Q?fjAPw9ZSf+1+qQFf6ZdsWT/qoDsqCCj25BglSQSfyzpRZomYIo0Yeu5z2706?=
 =?us-ascii?Q?pXfxhaG45ROWzWZcLXfdQqZky/USRgckGo5+5MixT3ytpM54gIMXc3Q5kg/i?=
 =?us-ascii?Q?GRz2SkLHDqZHpMgluIEYGws8LXFZwfXZYleoEX8rV+9IgewtubNKnIEwZX7X?=
 =?us-ascii?Q?EP8BwTksJwUga63I+2vcWoXGgt+yQW89putm/OSy+FEGoyctUvS+36TjzJav?=
 =?us-ascii?Q?yZUHe5jQkicICTKYqqCdzWYVOTW8j9VSGvy2i0DlkR7yjwXqVEa1TCg6iC1V?=
 =?us-ascii?Q?5Zh8JdtbCLlZDo1bertZd6JbB9d5qUTXQLb40sqtya2VpTFNTxU+/jtzHlU1?=
 =?us-ascii?Q?NnfOBADC6l8DsvLVFUqvG7E42q1guieLVILXsBNTQe4XSQYm4cS1Qz0P5jUz?=
 =?us-ascii?Q?BOe4RBJdLQKan7zxl0YX2/Tr30E/r7jdwiiy0UtceJCMfvKIoZTP+0+ObcLZ?=
 =?us-ascii?Q?BFTF7ju7PlrusvRRdL8cH5yeKQ4lCyyuUDH2eJ2W+LH8r07Cl6vfUlfpoU1p?=
 =?us-ascii?Q?FBt5/UtLlpFsFCGkDTCcdW9f6Blbwvgo9WHDldhAfPg2x72B6uqqJWSktX+4?=
 =?us-ascii?Q?zWR9lp5JM7Pzl24R9SwBxSRpCAqJeQi4Ey47OP+hXfpOX8JymMBa+FhfIj2H?=
 =?us-ascii?Q?fcL8QxgGQpPgmlACcPlrOeVqT9H52uyM3M2TIYmTZL0HW2DPXJQ+4cm17y8S?=
 =?us-ascii?Q?anSduTnAn+OEjyOtpWYBzJCoLtEfBsgATwhBvLjHj2C5Xldz3NuJpXq2XXBG?=
 =?us-ascii?Q?GYgvNY0OVHOhMk/CYEwghwo54Seb1mw3zEKrW+MwAgqp/yOSkyfkxcOxNTGU?=
 =?us-ascii?Q?ELsSsH5w9zmc/8/nDeFlsWBM7nUfOVHq2hIdbEBykgqOZd8FVjwHhhft3bi9?=
 =?us-ascii?Q?PG1QfBA8uAKHlMYlKAPSFqo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e536a42a-a24e-4889-1b14-08dbfc73c6d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 07:10:39.0554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B/vfXUglSOTmUrUZaSvcWQm7sk9wmE6YzcVgNIbXZTptXG7m12HXrnGXPZfmIKgU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5270
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzpMkPLTJYBxkaHBziVzfDPz943IghB7S2rcNjvuwlI=;
 b=4qne+QYY93mchHMKSTKM/fCtoMpYBsYMlVwmXkwEz3PvJimCDgZcMO3mhZDOfBX/vzrFoiZdcpGH1koBopexa1N7WiF/jlWkzLuhyMuI0396ElcvTfeL2fBEMDbzjIRGmqEsDBPVM5gaCVHbCFKrd+IvgoXennFBpCj2Zsg/GcM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=4qne+QYY
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v8 01/10] package/binutils-bare-metal: new
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
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

> This patch adds a new package for building binutils for a bare-metal toolchain.
> The cpu architecture is defined by a toolchain-bare-metal virtual package.
> While any cpu architecture could be used, the default configuration 
> will be a Xilinx microblaze little endian architecture, so that 
> buildroot will be able to build the microblaze firmware applications for zynqmp and versal.

> Thanks for sending this new iteration. I finally took some time to look into it, as I wanted to merge patches 1 to 4 today. I did some good progress in fixing a number of issues, and my current progress can be seen at:

>   https://github.com/tpetazzoni/buildroot/tree/bare-metal

> Do you think you could rebase your changes on top of this, and see if it all works fine? I of course encourage you to review the modified commits, to spot what I fixed/changed. If you agree with my changes, and they work for you, I think the changes in my branch are ready to be merged, so I will be happy to apply them.

> One thing that still bothers me is:

> +define NEWLIB_BARE_METAL_FIXUP
> +mv $(HOST_GCC_BARE_METAL_SYSROOT)/usr/$(NEWLIB_BARE_METAL_ARCH)/include \
> +	$(HOST_GCC_BARE_METAL_SYSROOT)/usr/include
> +mv $(HOST_GCC_BARE_METAL_SYSROOT)/usr/$(NEWLIB_BARE_METAL_ARCH)/lib \
> +	$(HOST_GCC_BARE_METAL_SYSROOT)/usr/lib
> +endef
> +
> +NEWLIB_BARE_METAL_POST_INSTALL_STAGING_HOOKS += NEWLIB_BARE_METAL_FIXUP

> But I was able to find that it's due to:

> tooldir='${exec_prefix}'/${target_noncanonical}

> in newlib's configure.ac script.

> And interestingly, this issue had already been spotted in an earlier
> (2015) attempt at bringing newlib support in Buildroot:

> https://lore.kernel.org/buildroot/1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com/#Z31newlib-0001-configure-tooldir-path.patch

> I'm not yet decided on what is the most appropriate: your hook that moves things around after installation, or patching the configure.ac script to get things at the right place from the start.

I just made a patch which removes my post install fixup with the newlib configure script patch.

Below you can find a pull request to apply it to your bare-metal branch:
https://github.com/tpetazzoni/buildroot/pull/1

I have now applied patches 5-10 to this branch and I am running verification and test.  I will let you know when I have confirmed that it is good to go on my side.

Assuming this method works, I will submit the newlib patch upstream, so that hopefully it will be included with version 4.4.0.

Thanks for finding the newlib tooldir patch!  It saved me many hours!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
