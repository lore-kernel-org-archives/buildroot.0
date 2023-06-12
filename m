Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9270BC7EE25
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 11:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 120A181ED2;
	Mon, 12 Jun 2023 11:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 120A181ED2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ttZ6j030cTwo; Mon, 12 Jun 2023 11:51:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B2C881EBC;
	Mon, 12 Jun 2023 11:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B2C881EBC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC4131BF2FD
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 11:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D25DF4026E
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 11:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D25DF4026E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-zJxo0SfXDS for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 11:51:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04C7540012
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::60c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04C7540012
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 11:51:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGFZpngKO0822txy7tHkTgi3ReY8giUTiEhcc9F4PzDraFGosZD4Eab5/iZ0EZgq14mSNTwlHUNpb0QD7jqALz0PaZhdgw8lp8WCGeUP/mjaIOlvZL4eiDl9lDqGOmtGxhK9okqwzeKgIpp8Xz8GWEnno1F3cQI4rGA09TrzqximSjgr51eMN/luO5Sv3cjkw/4G4ZaeiNeRH9fs1SUQosI3M+kF/S1EI/rPdenqsuSdeaVhLQ8fx782R6iTjEVuwbr6g4LJ1lXMtyRcgVBfTAZcb1pW3qXFaKn3Un5lxwx85+zhOCka1QWgSON5pCKvi94i0KWre3suOZTE5kOMdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88PpMdbk8JgXXQPjVMhXeYEPcsRT8hlieXNRRtZHp8U=;
 b=EZR4FHGe5YswsDzZPGIKMasUvzDocpDBtod7PVAyQ70yAl1orHS5OhTLll3kauwgQG+Cb946o/32t63hGjr95pKjPc0/ksN8IIV8jJ8Qhb7Bf0r3Bq7A67AKJ3VAYKwwztUECIo33CsjJVRYEnpg7hpi39o/fjvcMBcUvbCG8PGhx54UTkkgu65S81/BCoepG0aZ3hbfA6EHKg5yt2+6QY55fm+J1irL8NuPQDK1kyM8iv+no+cVz7jjsUgIfUO6Bg9gnJwLDsdFxVMz/xXsXAREE/IijmW0fnEXInbg5LGScV6IRRoAhTr6LA0Xkyjx6Q+UIpbg/nQ6TRp95UV3ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH7PR12MB8015.namprd12.prod.outlook.com (2603:10b6:510:26a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Mon, 12 Jun
 2023 11:51:32 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::aaf3:7258:e6b2:6ec0]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::aaf3:7258:e6b2:6ec0%6]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 11:51:32 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 1/1] configs/zynqmp_kria_kr260_defconfig: new defconfig
Thread-Index: AQHZk7FNmf5aUGuSHkeT7n/TSbG9Qa975riAgAs6NyA=
Date: Mon, 12 Jun 2023 11:51:31 +0000
Message-ID: <CH2PR12MB500469FDD86DA0562288801FF054A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230531111602.1623985-1-neal.frager@amd.com>
 <20230605102349.40a39b17@booty>
In-Reply-To: <20230605102349.40a39b17@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH7PR12MB8015:EE_
x-ms-office365-filtering-correlation-id: 5fa61ece-5f0f-4dcd-b72a-08db6b3b5d9a
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CKtSnDOVIpeI66xMtzmXmfQs2ZKP8ZRoy/0Njw5bKrYyt9Ie/YIXOMWArZj/8p9StMOJBaf/qrCl5+ZzmOsjbacldQzqdb+HmUTPlAgYwUBsNPF/kxBa0Db8z+eBfz4x+zSOtV0PQ9LHHJqKu6+85qhWmricGlE/k/hIG+fH0Ste+3ezGqaOvXON/EIhmJfu1HQgFFUxzWRe4hq54vN45S2b//0M/KKQXKuYLd/H9NK3q548kF8ZFURfY7B+hSKFch2FqDxawxpxpYVQM4CZPQZg1Bk5/WDSOzBDy7kAaLyqHVZeqwaXbgbtgahOYR+oqXOB/hI6lmS9D2hx7/c8PBYIc8XtPkTr8O7IGommPbZSquB3rAHw+i8ZpyODuTIfXyaVJLcMoJmILv9mbDgRSDAuLStRiqcbA7glN8k5uPlpxZc5llxpacc4P7zC2OWFxF4/2WSkqR/QcsQgk8X880ZdjJg69QDIoqg0MC1w416dBaBI5m6zSBRMFQDaq/sYVSE7WaaTvfgjt53cX1FHmz2sI8mgOLnce4X5kv4yRUvRDAz4AnbNy3AjL4jgpjneWGA8lzNyHZcRLXqDnZyU8NUZn6SYQdLijcbS75UdOEncG/PTXHvYtdxZkFwfi2hY7xVOgux/YH3OiS63XVyfNQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199021)(71200400001)(478600001)(7696005)(66946007)(66446008)(122000001)(66556008)(2906002)(76116006)(64756008)(66476007)(38100700002)(5660300002)(8936002)(52536014)(38070700005)(54906003)(8676002)(316002)(86362001)(4326008)(6916009)(55016003)(41300700001)(33656002)(966005)(6506007)(26005)(9686003)(186003)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fW472TxCh1owpBBk1dL6y0g8vz+d7R+FMgqX3kCB4wZmC0aPoU5MRw9D6DU4?=
 =?us-ascii?Q?6M7E36Udyn78wLClwQoZy+t2tpdA68k6WK1PL7mWlnJMuWAFVsY4NtdqegLc?=
 =?us-ascii?Q?JWdlo6MzS/TKQztiFxRzJ+6P9J1Qy/LdOvbJJ79DNURqGS69EHtwDLjKoJRj?=
 =?us-ascii?Q?H+C8GJF0nHNnF4lgrNMBM6bEhLip7rSunJfOaLg07xDg7aGU7l60PzsFpwlG?=
 =?us-ascii?Q?yQz5y/mLgR/7EQ0sE/cMU0crNPB5sekPy9uOoEoWzGomOIaJB3x3g7trTfHg?=
 =?us-ascii?Q?v/tIyg2cw9iVAeVuWPr8OwQKh7i7VTQHxJyKEnLHSl9PJeyK0eNLqm1KaIhM?=
 =?us-ascii?Q?7nl9N8M3+KpYEUskHwvHOvbAcjlvfKGh+FQvg5FtehB11oF858xljypR5aoy?=
 =?us-ascii?Q?jgiR80229PuW/7uTAmSmK1aZKvNajQ+BA4by8k3LXJfqWlzDxk0iU4zE3/Uf?=
 =?us-ascii?Q?ZE90eJGBt4PB+hpM4v1qmbMsk+9w7uGoHLoDOsQVQkcNN6j3tVVikI9cTEcA?=
 =?us-ascii?Q?9jA996PtbhYhBGT49E2zaJlR+9g6dLbCu//AWQ4t7o+lYfcbWVxHtg6NbL1o?=
 =?us-ascii?Q?VuTWEFg4dgNyO9T/8P9pSgCXnPT1aio7Wg3jfH76oJOTorNDQ0BvFueivESr?=
 =?us-ascii?Q?oktUlrWp1LjfWKUyLMBZol1cxWRRE34ZZcWNKLoQYUqMzMsk531p6CbEK2Lg?=
 =?us-ascii?Q?/MVwKVAM+jBRkse6ZI/M8754Kgp/4WDF5yWSfTTKli4S7e/kYlyEgVVyU88s?=
 =?us-ascii?Q?EBjFoOu5QB3YgwE0XqeuOCnLyB4qXMwriupEdAFvB/EwIRFOCEw6BNcHyo6I?=
 =?us-ascii?Q?O09cJRDJX5dk0ugrOv83aK1VdkccvIm8dcGg173RX/vJ9Wc5i8zwKJZIG+AP?=
 =?us-ascii?Q?5ThtQ5UqlHmQKRvlqxy2pr6sN0bjg+1eC0GCGNnoDku7p4THtZ/Gg6aDev4w?=
 =?us-ascii?Q?s8FyVtZJjLHBaR3d0PiN9gw/+p58EqpjZp1qy+ZHEn3pGGo6BWWucTQ/OvTm?=
 =?us-ascii?Q?olOEq5hkYcIn8U+KPQrcYdNAVcJpJylTCmnV34a0C3PwJz0EdLebw8JG2aw8?=
 =?us-ascii?Q?wUCGBj9qQTqrSHpxXCMmVpX8iq7DHuw6S/RD7L0n9W/CHHJ8XX8+IN2PCXp7?=
 =?us-ascii?Q?6a+sXHov+v3munwkKSCM0H4ZCqp/8N/JAIXs9b8HBgplgUIYGXwZEm4+LlGy?=
 =?us-ascii?Q?huW9iToNJDHDHJVRfv6i8km64FkSx3lwu/RCENsMCZyNPqgDLoubClC7weQW?=
 =?us-ascii?Q?rsZgQCD+XiQoNGnVan3X/Tgf85RT1VIvTa3gNpg/1KAObGZmeAEcTnsjX/W5?=
 =?us-ascii?Q?MjgniIu7RVOj8LsVp2Et45UoyHKEkg/XFZQ6FSQenFHlzrOiikI/viHJ4lsi?=
 =?us-ascii?Q?ukKqtYkqeS6i38ORVcn2yHU7YyfPJQzRpKjzpx+e1eBwISEj5m7y9tgevEFT?=
 =?us-ascii?Q?SC3jv+F68K1RtC+2F7svaBN7J51+l2uKeQa058YV0pZ8LSRGqQS26RDjeE8x?=
 =?us-ascii?Q?cFBwp6u4sbWbOCexCevWUb8EAngkqHNnMRuDzys5+LwS48M9YyFFg4ak1hUA?=
 =?us-ascii?Q?gn628oeXJFaCX+gVt4A=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa61ece-5f0f-4dcd-b72a-08db6b3b5d9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 11:51:32.0314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ujMNN/g1STW9Vv596dXkAkZ14Bvmm2Qq+x8/Pr7kHFiKiZvSo8SRrGG85reNFFyi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8015
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88PpMdbk8JgXXQPjVMhXeYEPcsRT8hlieXNRRtZHp8U=;
 b=idnR5jzzteULo3L3A1WtWJkc/ZVHgdp+VsGpzLA9xb+/Iv7+hQKRWDMRB9TePMV37SIIQAl/3rnel/wooCY3Vqb5lrQ6lgvnC2J6R38WK/IaiB2Glx0nwPKEVTQhvAglmzAx/bshZ2RyF6Bf5xQpVnLRi7EbgFkIhKcVkQzu4Ys=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=idnR5jzz
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kr260_defconfig:
 new defconfig
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
Cc: "Bradley.Gamble@entrust.com" <Bradley.Gamble@entrust.com>, "Erkiaga
 Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>, "Chaplin,
 Kris" <Kris.Chaplin@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "david.evans@ebv.com" <david.evans@ebv.com>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone,

> This patch adds support for Xilinx Kria KR260 starter kit.
> 
> KR260 features can be found here:
> https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.ht
> ml
> 
> While the Kria SOM is based on a ZynqMP SoC, there are some key boot 
> config differences from the other ZynqMP evaluation boards.
> 
> 1. There are no boot switches on Kria SOMs. The boot mode is thus hard 
> configured for QSPI flash. A pre-programmed boot.bin comes with every 
> Starter Kit. U-Boot can then find the Linux kernel and file system on 
> the SD card.
> 
> Optional instructions for updating the boot.bin in the QSPI flash can 
> be found in the readme.txt file and the link below.
> 
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+
> K26+SOM
> 
> 2. Kria SOMs use UART1 for the console instead of UART0. For this 
> reason, Kria Starter Kits will use a separate extlinux.conf file from 
> other ZynqMP evaluation boards.
> 
> 3. The KR260 has a USB to SD card bridge, so the Linux kernel and file 
> system are found on /dev/sda1 and /dev/sda2.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Just a gentle reminder regarding this patch.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
