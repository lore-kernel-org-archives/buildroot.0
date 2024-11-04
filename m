Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9353D1CA04
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 22:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3D7D80A88;
	Mon,  4 Nov 2024 22:19:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXKfQlrW7O4U; Mon,  4 Nov 2024 22:19:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A896C80A70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A896C80A70;
	Mon,  4 Nov 2024 22:19:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 773C3B8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 581E34052C
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7uPu54sxgmlw for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 22:19:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.144;
 helo=esa5.hgst.iphmx.com; envelope-from=prvs=0310cb42c=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C963403E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C963403E0
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C963403E0
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:19:36 +0000 (UTC)
X-CSE-ConnectionGUID: MOjjl0vlRe2mpdtZcDSRjA==
X-CSE-MsgGUID: tTg/ajUhSoeTFIc/jFl/lQ==
X-IronPort-AV: E=Sophos;i="6.11,258,1725292800"; d="scan'208";a="31734953"
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hgst.iphmx.com with ESMTP; 05 Nov 2024 06:19:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HAB5jfjj+lTkGIZNupLE0CuPuzC8zE4PZyJAZ/kOdXE724tv01napKp7l2cWt1ewMl42tjqpPtTJmPEyAmPs1luXD+jHFnQzQ9XYwQ3olBFRlSPd4FByvnJAloZ7QbajnPBZn9Vn/6A4PjT6s4HvUxcp8wjiBtUQgpyKPp/+CfGsnSUnmZ50yOvb+Z24XsuHo5lTh+TaWjrzOgs9Hbq543e9l7jicDR+PljBPUQPPEM93M6XbJffU0ipeIyhEJYagyW9+PLbd0LwWwbedflVyuVIx6k0sNVZtzogwLM/ypIPoqsNy0Tk/c5kGcNSY+pbqgJM+YkiWpzzN1JfUnSdEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2X8yY3QU8eEbQN3tzNbMbH+tCQrMNw7wPdZ8woQT2Ms=;
 b=B5EjM/+FCZMJNQzRYLE2ET9RHTCdZO+/aEr02hTb3ZSF2tairWnY7eGSrTJ5tu40tLl1ibHXbzftA0ZJjE3FBPJoU0qH5fP0ASpZIOWJDlpv4yYhtq0u5MLcrqT0G5DX/oR0fHWkaMHqR+ACXHVcc+0q9J7bHmJG/ZO64SnpL2Ti4JrhI+vdHktZ1HQGVskIILyULwM9NOo2LppBaC//mItF6gSxbsCgYUJafHxOvLQsxkcvhMMQUeahZqChgpTG63/lGNHGt3ivgEj6coJQ+/RG/Rp1z9sxciVtSIbIALJFrDrqxiGckkXVxyJo55VyB6Ak5xyKS1kr2UuZqqAUdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by MN6PR04MB9311.namprd04.prod.outlook.com (2603:10b6:208:4f7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 22:19:32 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 22:19:32 +0000
To: Brandon Maier <brandon.maier@collins.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Kilian Zinnecker
 <kilian.zinnecker@mail.de>, Niklas Cassel <cassel@kernel.org>
Thread-Topic: [PATCH] configs/rock5b_defconfig: add missing U-Boot build
 dependency
Thread-Index: AQHbLwefGJob7kl4Hkm8Bb0DpNpk0A==
Date: Mon, 4 Nov 2024 22:19:32 +0000
Message-ID: <ZylIdJDiWnx-YKq2@ryzen>
References: <20241104-rock5b-uboot-uuid-v1-1-0f2f34d87778@collins.com>
In-Reply-To: <20241104-rock5b-uboot-uuid-v1-1-0f2f34d87778@collins.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|MN6PR04MB9311:EE_
x-ms-office365-filtering-correlation-id: c4b0a8ef-826b-44ec-a814-08dcfd1ec22a
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?hTB7PUsmSWZzbKx6VyZNugRK5mKoY27gTPbDG2DGyLEEoN8i0lfnnY/5m+q6?=
 =?us-ascii?Q?e1OSvXQ69VH8XK5YEOAyxxPcA086xSYs6E1+c2hwMou3BHtPzT4EeKNv3zx6?=
 =?us-ascii?Q?j3zq3TCMucfzullCPrkjdMcC2Od37NfvZ1HccuZ4xbEaYjbN2Vzl2HW9UyRW?=
 =?us-ascii?Q?IAB+9+AdE0lOufuIavo1N7XoqZzF/4kmgGEKT+SD59+eYK1iUD8E3T0mSAZa?=
 =?us-ascii?Q?9l3WmxycMKmgDZQ/aV6is9bALjdNJ+KZcMUHoDUy5EdvB2CKQksIafBnLkgh?=
 =?us-ascii?Q?n85ITPrJxGMzw6JpEkzJGUmgDtpWETthsJ9NW7M1IjHta4rAi/rX/u/TYj4y?=
 =?us-ascii?Q?cWXhYJAEdPXx5r16MCbCqiCu4s7caYTSxbx/RGGWfEsMLtke0zaalE2Dlavi?=
 =?us-ascii?Q?cZKgO5ixFrjq3Ex5GvMjFn7uVE+WhkRiwwNxjyJoYgskopc4KxVaz/VBaCzQ?=
 =?us-ascii?Q?rDmAfIMPve3HXh7s4PlKXhF7ImDWRrl29bYPkLHYSNY9kdP2cqjsWn4ojhf2?=
 =?us-ascii?Q?LGSSKFjJj23XJNkqY460Ifrj8hJBjy/n67tYSQpYt1NKuk5DbSYf+enkJr61?=
 =?us-ascii?Q?teoNC10//y1vKCfntHCcAunEoa4qN+0NfscumGPYzvIGSsxoP2ufNRgSSEU8?=
 =?us-ascii?Q?XDo4Ru3KhY996fTd7VRah9Q+7xyzoOH5/Mlu1T855Uh/FxeMkn/VerdEvz32?=
 =?us-ascii?Q?mde0UmtS4XqJV1eZabHLvCpZHE6548dknaN4wAk8tOJks4yKBAPLTG1P9khp?=
 =?us-ascii?Q?qnyd0OD4ItaEqIP3Hz6lFxQDQsXQ06clCFiHBZ35JgDT+gUc4vVjhWvl0N5f?=
 =?us-ascii?Q?/UTeM4cBrTnkYzBhcWZy6ezy2Pnh3xZvl7GTnABfEw4mqik+uXhQ7I+I4AAp?=
 =?us-ascii?Q?TF+aKKNpmSqRB/0uvj9D7+mTPjGdvdGf4lIHIT5iUqgGipJVdl+UNdxDKwaH?=
 =?us-ascii?Q?e7ZBibebT/o5rwATaZMOtsGyMjGEfetSYpAtdtUudM7nlHtev7zuYixlFJUF?=
 =?us-ascii?Q?mtGxsDyGy4B5ELbvhgI58mjLDzw43ucDs9H45rT/Q2l2mDIbafrqERZBJZyk?=
 =?us-ascii?Q?jf01qDI0c21Hih6OQWG52bvS5eVdoCgw3mHlDSBOMUUjG1oPj5bO3fuVPrLT?=
 =?us-ascii?Q?l3aON/HijVy/dzUi4f6r84qLRLyfiNpBKjUqN9TH6xHCgOBk0imur8DW/gJF?=
 =?us-ascii?Q?66bMbChyBk0jcu4lCukHDkaEkstKLPpK+HI9JJWpbxUHNG0HueZxQcju5Uxl?=
 =?us-ascii?Q?zZTSoec48mQiieS68W7gFKu+OC8nJxyHEnwwxUIOniFREi30qdhKuBVZVW5+?=
 =?us-ascii?Q?KU1O1IvgczfzL0qnHH0s4VaKgAWLvZN7bae4bDUARZWrU7yO/pNm/FFDjg0v?=
 =?us-ascii?Q?EvOB8so=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0lZ1pdo0E//WZ0pOhkAaBTUuYQs2HTMKBl6WXAaqI+ZhhR8q+U/SsYpP/5FI?=
 =?us-ascii?Q?QvkDBMQG6vHm92pSby40VC+JPnxFvhIWJIdXMyaIS05bPq/o5yA7H0/SIUJ+?=
 =?us-ascii?Q?eaEHrINyoA/C9BbX6PagQEF4o9IPhPlM/OwN+4WyzOO+2Sm3HqxKOrMsrNRZ?=
 =?us-ascii?Q?L84Tot5/gGBZ9uKvO2QEnLIdtooQAV5h3J0IG8g9y56ZOJeBy+An705q4wC/?=
 =?us-ascii?Q?2ttMy+eO9iDJue/epWfxzJSMqz9quwEjjyCwqh6pFkjQPeyZL7Cqv12oWTwD?=
 =?us-ascii?Q?bmt1HYbNUsjWOf90oU/KG0yAJHtg5ZyBeRjVcZX8Rq2pDT8RdPsMjD8wsrdp?=
 =?us-ascii?Q?JllMtmNwhnm/N4C5OTRAvq7FBVRwO+oi5vwBT7HAZ1AA0arPJ71KLoJItE9h?=
 =?us-ascii?Q?ZwJWc3V5TTAg3XMHxNXQzoArzOI7XImEs1kOqja3tH4VjnH5h2EAQC+X+865?=
 =?us-ascii?Q?LecccOkVrlPDAdwWJQAhbChCu3XP3+BpiJpDCQJVd6pGcODFPpBUU2MBcxq0?=
 =?us-ascii?Q?H2E06wajm0fB6+4DNvwX8qwoZx7jdZVttjOJphi33rgNPSGXKPoqUQ8sIjWg?=
 =?us-ascii?Q?0yjCRaHp/sQhdTo2X3AVbXvGuNtq0ntairtBsTi4ORl1r2kGedobjSGVbKlt?=
 =?us-ascii?Q?taO0ay0S6Ytzv2sEOcfGNBiTuX6WgPJmTu4n3EjIBZMUvoJzlzbGd/A7bRCf?=
 =?us-ascii?Q?b11sTRMUnmkjQD5UsBiek7ZS5at6hNDC8AaNCryF4ptII/Oo/6WoYCtM9blJ?=
 =?us-ascii?Q?RKkKTqbs2/NCcYLnRaP/I9xm9tIbjLsKBDdC0smhtEEoa3rBpRdnYTR/djbm?=
 =?us-ascii?Q?cBX8ruIk8bUgkttCw2f86q7biir0/S8+CZW0ucDQydjunq7t9PSpBNEYTgB5?=
 =?us-ascii?Q?ymliDO7tqOXvU26xzIOZR8fW53LX3gENSon+m9o5OOtakSj+PLlnYD2uC+6V?=
 =?us-ascii?Q?EZ4VEaiJuNSVKabQAD/VHlBmG5xjtj+OTQkXQOPMZpY4uxyUQEuiqydjsdWe?=
 =?us-ascii?Q?E6xoM+vlBJtVasQ2FUT5a8TTJp3HLeVhtvNGdcELkZYM77PuwesOARepmHNP?=
 =?us-ascii?Q?3Rjt+K10nvbxm33ksHAqNXVGeKRWhhIPsWSoWNABNmMYWqcalyVbuhakofVa?=
 =?us-ascii?Q?GkKxSXvsT+gLhNHOgIqzI5UgMVeyB7vUZtUOIXa7uviJ5ITTZQaUS5GJZE5/?=
 =?us-ascii?Q?2G5yaWs+aXdyndlmhEaPqHdHwrIzVBpI4uwRykZX81fdyBax7SCjK30yf5yu?=
 =?us-ascii?Q?XNm2IP408EI/BGRyKehAA7TPMdKUk7Ueg+y+bBcTZ34w9/33i3qMd7B5T1vZ?=
 =?us-ascii?Q?SlqyYEBTv8Rdt+X0EfLs8EXl+IS9pmfR88h20H51oTgUC6TScmNVCa90eP6w?=
 =?us-ascii?Q?WF2jsYCJN+0EOMp6dxO1buT0OY7mWBQAAfuqq2zFaAw7ivAISIYhFcXRG8Ib?=
 =?us-ascii?Q?2FlpnwYS2spcUHf71dLztCr22SaaE7FI4bkfpveoZX2gfglNIpgI6t9rU67k?=
 =?us-ascii?Q?/QgDmeWhC5rMaotaaoQD2oHYLBy/WdEDykazpoBgSLey7u7QBNrTsAGM5US8?=
 =?us-ascii?Q?qs/ugu6Bh4GvByNsc6II/BQDz1gbpi2x8e487EfSgiv45L7Mg7woxw2sjSF1?=
 =?us-ascii?Q?KA=3D=3D?=
Content-ID: <43A116ACAF31FD4993A38E6EE40F4162@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: cF1WbSbB2l1mW0gh0oDsboycDrkbpJvXvbeMbGAgwxrmV/56TCsfsRggU3884tbqIEfC8zGO2nXwKbOfcu1Id5u/bPNSsutGU1Q9dRCeetu/EtXxRgUoMacpxuvOQPN7jU/p2IMocpSe2+NgnnYDUi+aT3C2Zs60eYJP9UWC64vGYy3Vt9iQNFMvh3poG7nISJKwNpBO814ruS3L9F4a2nASimg/zk1/xKf9nKzYe4qbIWP0mtH6m4U48fJAx/Uu7xR7ewhTlRH+PkfwpQuwRgNslldfB1X4QRYfAA3YRlDerB1Z0bWQZB39j3ycDzf/j+I+/jswGc6IXlMo58I0oSv4UqSL1rrxpZRkdTbC48C33KQFgqYx9h+wXYKTswdcswIZ4JcAc1uE7PW7DHLxZnNIhh3QqD1fd4iRgjYdEF+Qv9m8cxSVqkrwygIhPubsf67IBEfYt842w67UP5csKLvFLrUXmdvaGs8V85cpymeRXCxZWOdIlsL4bO6IXJGazQzUxYWjOl+2bQF1Vx3QLaC252sm8QHSDigwYAp1H0Vn2tv5qqjvFEFdXPQT9xhz/mYfBhRz+2whkuP28AfujfKpHOCXJ3ZFjClCWeW0rQ+bjr31hNtG76dd9jB2oQ3m
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b0a8ef-826b-44ec-a814-08dcfd1ec22a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 22:19:32.8028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /o5gGTusHpvLsCmIqkv4ETSjYJe9donJvOA4ufA/+UbB6v5zDQ777LEs6T1TT4yP9/3sGbUIVdgU/Y3EGO4GkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR04MB9311
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1730758776; x=1762294776;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=LVrdMe9QtqMQC9N0rzH6HwZvXS2AzhWv04pg/k9kxKg=;
 b=lGUsD31Lc+eJ6akja6GjObDbJpo+QJO982advKrBHOmMvO7bIPhCC/4A
 TwLB7oRmmvzBTOVfqNa1RGD9rX7bR3kAfTQPsmu/Q1H4mdCYAapg/EwQX
 ZFxdRyDDILlGOorIgqp0w9+SzmxuV3x1iqpDGEOftF0lrmTbzrx3xywv1
 p757Xfcy5/8eaMVKaiSjLGlTi91+1P9jaP1phA/6sPxsCBbsdWjWAOVp2
 GuMuCmslICWp7anSzfxEJ9O1N83YZKhr3g/KK/Sk1dyAzFijJZVr0rgLm
 1pqywWPYbxEAtM1894kuQoH8pmR4MHvb2guLZFBa2qbTgheq3n52xKrP3
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2X8yY3QU8eEbQN3tzNbMbH+tCQrMNw7wPdZ8woQT2Ms=;
 b=dcoJ9lUvZeu+m2Porm2jWuYXoVg0EnyQZl5IL8XlomIPZ9KzdwBxznXpJ/uPg9S7oHiI2Di8MsAVcQNTQtuX1rzwOJj840z9Ylk8GniGqj5Qj9JFD+qOtqG9Q6rv17WsVvrk9FbaUNGBucGtbD5wf6qDqhHREAwUtX5soobmTAE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=lGUsD31L; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=dcoJ9lUv
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH] configs/rock5b_defconfig: add missing
 U-Boot build dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Nov 04, 2024 at 09:39:55PM +0000, Brandon Maier wrote:
> When building the rock5b with BR2_PER_PACKAGE_DIRECTORIES enabled, the
> following error occurs from U-Boot.
> 
>   tools/mkeficapsule.c:19:10: fatal error: uuid/uuid.h: No such file or
>   directory
>      19 | #include <uuid/uuid.h>
>         |          ^~~~~~~~~~~~~
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  configs/rock5b_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
> index af748a5d25a2b2be3f72d6d93d413be04c5a59a8..38b5aad206229f57925480820c94487b2db5365b 100644
> --- a/configs/rock5b_defconfig
> +++ b/configs/rock5b_defconfig
> @@ -39,6 +39,7 @@ BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>  BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
> +BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
>  BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_DTC=y
> 
> ---
> base-commit: d74a5a218fabee928abb347086648ad142f7d5a5
> change-id: 20241104-rock5b-uboot-uuid-7824f5d9f24b
> 
> Best regards,
> -- 
> Brandon Maier <brandon.maier@collins.com>
> 

Reviewed-by: Niklas Cassel <cassel@kernel.org>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
