Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E29CF6BF1
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 07:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33A7460D59;
	Wed,  7 Jan 2026 07:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zrlsfw7yPXDG; Wed,  7 Jan 2026 07:30:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B472360C27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767771036;
	bh=VXU7luwYveT7uExOOyomOkP7tS5b4v1mH7C8TkBocXg=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mC5eXddk7BaqOqE6m9fvmys39PjdyWv71fDKpU6IHTRp61JL2xo1Fu6j5THdy+LXG
	 h6Tq/rghA62fuGJtoA+gg/gfrlSwaIJN8mJczCoLz/kP/MpgzzCQS3rhfZSFwGruEc
	 n6saOPWoBeEhxm1ZZDCWKCIrhQp+q3S3FvDIUvLPgBJ0lT3ogpAcV+WJ5Yqd7ZhSo+
	 4DbCosyrfI2++nNU++dElDn26eo/eHteRP4uTbM7onOLSOGhRAHRcST8yRiNuIMKUB
	 1nZ5/4H/KE+msTGdYioAANyZLEhE2MZqDpraHfDKDewkVSL9yzepECsQHzKMsx97iy
	 FGwW4twbLDyxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B472360C27;
	Wed,  7 Jan 2026 07:30:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A6E47249
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 07:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98D7360D4F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 07:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qT3D6mxx7MsP for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 07:30:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c000::1;
 helo=byapr05cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B0AB860C27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0AB860C27
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c000::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0AB860C27
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 07:30:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cwGmbQZsbjVzhx6iBvvRZgHvR0uFqFzt8NnkcKRT7sZF8qf1VyZ8tF4Tb2sQ8RUUYWOs4ndnQASOzaZL+vEVY70wRLKCFSCVuFP8Xw9FKhRTA/SQgFu1VIHy+qZwcqTE6TCcVaTOv4/iTHi7KnEtTtxDXROG3f95+g4qcQWwhbrYzWGdtT3kxRpLcJjBPlSkLKkUkj2Z0yZKHWKqZP1k8yLXjH0dE0k1XEw0sScHcLjrhq1oSMYW0cLNR95phzz7ujS9YXysxRA9Fdxa50/NGU+QGdI7aVHKFSLfRqnIos1ECyF7ETr3xDjmLcXIXoB72rEpByLc3EK9aE2Wv/ltYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsBONIRHRhc8THHBR8A74b1vb6byLmuOcqxbRht/d4Y=;
 b=y+WxRZPaRPGZsv+EFOKUYmLHhMOBMrCefbhueiWqM4wvfekLVHJ9VHTr+ZrQopS5pCDa29C8EN9fcQVTstm58/Es/HUXdnLq1fK1r5fl4zg3rxSlqjxkvS+g4KJNkwvrNdLm6D1IUZvFLHw4RJMsPaUJdTNMjP63B0KigcGbwkRfbIzvviRMoATeLQAA3vCmNN7wqg/0Pr0Kp6NjDn93nHLqesJzxPtfM1EmKM9tH2OSGSxr5FVbMB0chqKJWmsk6qXy5IxJvP1iqFjnlvFR8/7f3bgCUxr+Ri7gTcd4tQsZIx37NKC8B+eFd8SJH+vS5wODORBLoyLDLU3IUCBXKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by CY8PR12MB8340.namprd12.prod.outlook.com (2603:10b6:930:7a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 07:30:28 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 07:30:28 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
CC: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, Michal"
 <michal.simek@amd.com>, "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v1 1/4] board/xilinx: add Linux 6.12.60 hash
Thread-Index: AQHcfyUN/1ieQlBBZEe+0O1AQV5BW7VFmF6AgAC4F5A=
Date: Wed, 7 Jan 2026 07:30:28 +0000
Message-ID: <BL1PR12MB5032010BEC440A0378517922F084A@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260106155630.2404514-1-neal.frager@amd.com>
 <20260106213043.5b2cf126@windsurf>
In-Reply-To: <20260106213043.5b2cf126@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-01-07T07:29:35.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|CY8PR12MB8340:EE_
x-ms-office365-filtering-correlation-id: 5cd08e8d-65b4-461c-6da7-08de4dbea1a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7142099003|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?IWLEohMYBbuIcU8IrwL1JNlvgwaWFBnLIWeVu2GthTERVg6vnH+S4wlW8Xb3?=
 =?us-ascii?Q?VQPBrMciyw3IJaBVWmwMsK2vtdxVg3yMMVuBE6/n9LGwj+39NvYjWmSlHF3z?=
 =?us-ascii?Q?Sm6Qye6RkONShq0l/Vq5p4s25GL6+SpLrp6FYHQhjvbUxVn3VuKMIQ1Ve0WF?=
 =?us-ascii?Q?CgP1blp1PIwqPjpvmf0zdvzwVK4NnbtPQZ1rLuoW72LL1/FUqXgEdZOYiGye?=
 =?us-ascii?Q?5yjzhEDOlAwzdxEyrRo9KyF6mlPop4aozYmFg3wTeurOYOk1bVn52gDPY6k3?=
 =?us-ascii?Q?Gg1p4ASnYIkaDoZB7lrtsIsez+8fDRR6r5+tx64uxIUP4AiuvATufn0xAPNf?=
 =?us-ascii?Q?k7019hIpKRV7RHEv5jiXZohocsGoM9SwYs6G8FT3MU9hd7MMZJXjb7gmNDsl?=
 =?us-ascii?Q?vAM8+FQElVvFOcr8egtLex+LeurXcTD2/DAD9hHg09r3tlgr3Sw04UI2ypD6?=
 =?us-ascii?Q?jfP7GSXSDpnhE2gyt19ch59SUAQSOECBM33ItNvGpmVmPxv20tPr37fZFY26?=
 =?us-ascii?Q?tYHjovMfs4U/K4UG6QLMwpjJZhbRuSC3E8jcTSXg6wI+9CwKAOwAZGJyEObc?=
 =?us-ascii?Q?AowsJS+PrRG5rxApgbWd6HG3nFtCGJFxaj3ZcFqDhSgO5MY5O29lgJCcZ7Lc?=
 =?us-ascii?Q?ojVDY6WvAJ4M4b4KCDWePlq8IJe97qZ59tEGNo7vLzLhC92YiFCBIhQuien2?=
 =?us-ascii?Q?olQ4pGKCRJo5wGp+Q5GXZgcJo4/57bo74aJR3pv+REByKo+OyJiyycPa43xy?=
 =?us-ascii?Q?4yVIZ6GOcJhgJEczwmRP/xSHrMI0M2uP0hHXmLzZWoSmcz6uXS4mVvAFQqk7?=
 =?us-ascii?Q?T5rhUt79HbjJHvAeyDWSkl1+H8AldggHM73nT0z9UAtPnXjMcqrAEZ8RR2iB?=
 =?us-ascii?Q?/rFNpGLrczAqLYdTO9MC0/6WxXq/TQHhOHnyCS73G5pUSRDO+gxVuV56vvBv?=
 =?us-ascii?Q?Y1f7iLiHHlQLpiepkDGZQlLW8ZC2yCWyTKmwSSzrguUOFWdfyr/G/dbk4qi7?=
 =?us-ascii?Q?Ct8wkeD+gDS9PrwV5nQpyTx7QbQ+JNtDvnWQ6mRTCg1IcC0wxlPgopmiwl9m?=
 =?us-ascii?Q?DaHI/PrbIPKx/dm7mnirc+Xfm6YJizyvKc0bQipXFxhoBVU9rLoeR5t3IWLm?=
 =?us-ascii?Q?Qu8QeN3hWeK3BLPpzQdgkGBoXLEUAFCXJjN6e8QObbfJXQY6ePNL2ao4qCPK?=
 =?us-ascii?Q?mapIPeo3ZZ3Y/KDKNSSvto5Bl+m9/BP7L2NUUYrosyoqfOBHT8/8cOM6/hBi?=
 =?us-ascii?Q?dd9yn3dT2txRMmehwpsE+gYiRFrVsxSWdtjDiUKuFdzpPSPYZshsdDvP311D?=
 =?us-ascii?Q?mIh2oEjHR/ozlwKxnvFKQSHs/mP99H0db5TPF96PS0nXbTPOoAPkm2Y0fqGh?=
 =?us-ascii?Q?OB6eRDbRUd3XlYpMOq4PH7KTP3YaLCPBMvs6oJX1vclb7J/ar5uXtfR/Jh5F?=
 =?us-ascii?Q?9IpELL593g3N6Ym/gkaSfzjyvRBNTjGQJholV8bepCAXS8u+7ceOSK1VOrx7?=
 =?us-ascii?Q?Zsnb4nnuZQAxL+b4Phv/kmd26cKOnY8MkIaG+ssv2zzN7hZcuugSojMt5QNG?=
 =?us-ascii?Q?lW3XpLV6VD1f2I2ozUU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7142099003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FGt4HuybkfwL82UCTc32ezYDLew54ceiF6D2/5vnVL6oOJX5vBdeH+IjHnH8?=
 =?us-ascii?Q?or5327iZ8NJRfjuxQzyLrRE3JvK2V6eSn4YAh9wHXJlNC8zUIHyDPyKwz47X?=
 =?us-ascii?Q?FJNpAhEzsfwhSjwe6+86/Sy61200Dgqjgu1bMFeWp5WiM5oJ5YON9t0dFEZ6?=
 =?us-ascii?Q?vefHfvf0owQmL6hm3ZzcOlO7YobBa3xKVKFvQUE2FzTUBRrwenas3cCOc7tk?=
 =?us-ascii?Q?8wrlESK/Q8fFKaxwAvc3yfJ9UcYkhBoq2TkmvBQv1ohwa15+F7t8+4J576ra?=
 =?us-ascii?Q?m9U2lQ+Ja3YY5JSkT0vr37ZfcI1LJTqEpx9OKu8nuNxj3p8lKuDdFNtEZ802?=
 =?us-ascii?Q?UkP45lCI1Bohs4PVTsGUR6DDgN6aUg7lw0NeA5hL9t5Hiuv2AYJHJbN/ewC1?=
 =?us-ascii?Q?Mfb2P60qAwzaovqRYveOnjcIkZdWrX5j5xsSeD/lm/E+w8D1tO++HcQntHdd?=
 =?us-ascii?Q?CKLcrERx3hhfuSOrQ0Fouv73XTCFYu4Tm5R7rbHXpCtsLnAeQPejZCg+3N1k?=
 =?us-ascii?Q?VcdldR/NdRQgDEnNMZTKGq2JYlcxkwn647+cpc9cFRxTj917li/p9sJi1+tW?=
 =?us-ascii?Q?XU0JbHe33oKY6BWegbyjZhMSuX4EDbSH1GPILuF8QhD4x/yieHCD8aW2Jg/k?=
 =?us-ascii?Q?/7koMb0Ib5AtCEC3SNhBF7LTTze9fxVXauyBbqc+o42GWrO09mmOefQMRXnY?=
 =?us-ascii?Q?1CoZJOrJbIzTQxXgU33CPM2g+Dp37B1bpXURvIuK5kK5bvT+drh7TeetAjWB?=
 =?us-ascii?Q?6U2f/lMOY6HwWp6ZF9DKPAzLkpkZ/EvHSbKsm0DGDMKdBShee1cr1ABbYchS?=
 =?us-ascii?Q?uddfemSJi+yBFQsgNhdcgM/WqAfJlc8n9Pq46zFqKBPdd8t3gPsEwPtYX6Me?=
 =?us-ascii?Q?1wrB4AMwzl+ZeQgn0Zxc9sJV+EbNH5W8fZ3LmJa+O1dkzAM43p3RJXZe0L2m?=
 =?us-ascii?Q?Fpo2T1WkGwy4E3wQI027ljeJq8Yz5YLXPYjAtUOsbh/5djYmjKTg8vskJj9V?=
 =?us-ascii?Q?FH7+nl9AGSpbQLsFmWQ/LmlXickmC5vUoCjZZqxi2iBgy4Z9Vm0fCoFHkRiz?=
 =?us-ascii?Q?C4rLhF3ozVxHY/YFi39GQkxtXedswRUl9i/fKzPRxxQatxlmE5I15o6oxQD+?=
 =?us-ascii?Q?xubyX9xQHdKthuWo/zklymVkjNJfZCsvTV/Jy1X+t4raYvB152j5oqy677+i?=
 =?us-ascii?Q?Ar4IiJ8lzb4tJnpP6hMCX0uNKxBXq+TIwilabxcOsKji2wCVdHjjnym3hBum?=
 =?us-ascii?Q?QovQwVQV2QXACndLY/MyPKnJ/LqHECZA/fAiFSALEIfbv7B6nYM8Sw//LmPw?=
 =?us-ascii?Q?7m+JtZqYIcGp3TLZ7aK9U9Ywpr+F17yqrI4DeFFMGdM6a/3NS09LQIovunAz?=
 =?us-ascii?Q?lTgh2vpuVcMoJwp6ekzY0ygfl+bmMH3C5OFD8oIFVxAEomZjGOQ8UgX8eXa8?=
 =?us-ascii?Q?KCn/JT8fG4pjUWpRcJvfzqZRCytRSMaweJYLnYAlcjNhJqes2Jbyc86lOfve?=
 =?us-ascii?Q?/a3bCuc7DM7fqtckvi2GSn6olzG8a+vC5KpXfUzUidFwtZntohc53pZmYUKa?=
 =?us-ascii?Q?KdJoW/WpsMuKtnUy9rUc9ZF5XJPH1csF3siuZpNApFTajw3n5JqBu8w7KSh9?=
 =?us-ascii?Q?9uS8sJJ916PqUPcFUnOpwuQiXArHs1XhCjhM3PfQfbIR4OCfmjT0QGFoQe4k?=
 =?us-ascii?Q?45JUCHtuBmAm8TV7aHhZCbQWRPRltvM/xrcLEa9BgWt0KNm8?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd08e8d-65b4-461c-6da7-08de4dbea1a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 07:30:28.4298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Da1q+V4l56Dw9f82ZkhVf4dUY447xfZGTX/7/Li1RWVAo1bMFFPwCY0eERMXto3D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8340
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsBONIRHRhc8THHBR8A74b1vb6byLmuOcqxbRht/d4Y=;
 b=EEJmeC6nILySAM+XuXNceDv167ah2WLbARlhJJJdON7JqP2DDG0Zm1QpLpkzCbaPnimxMwDwM7ku7HYwNb2wZfCGMVolWZgP1QYKI/s2FJZCjQsjf/d2i4g03nabaAvEmjEO7mEo2hWhMPHVHX712KWCB2E2Bem9TUwN21bm4Mo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=EEJmeC6n
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/4] board/xilinx: add Linux 6.12.60 hash
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hello Thomas,

> Add the hash for the Xilinx Linux 6.12.60 release tag.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Series applied, thanks!

>  # Locally calculated
>  sha256  38aec9ce252ed6a0b64d294d4d58bf51e25b249eefb31b800a5ce62cb084298a  xlnx_rebase_v6.12_LTS_2025.2.tar.gz

> Can this hash be dropped now? If all defconfigs have been updated to
> use the new kernel version?

Not quite yet.  I started with all the easy boards, which I was sure would
work.

I am going to verify the versal2 vek385 evaluation board today.  I left this
one for last because it is still quite new and it seems every time I touch the
board, I need to fix something...

> +sha256  444f573cd4438af1f5062fd69fcc82965a56068e6a25cd43c062a68398f90b03  xlnx_rebase_v6.12_LTS_merge_6.12.60.tar.gz

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
