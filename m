Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4874CCA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 10:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00ED3605C6;
	Mon,  2 Sep 2024 10:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgBOn80bPhIq; Mon,  2 Sep 2024 10:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D905605E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D905605E6;
	Mon,  2 Sep 2024 10:57:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD0821BF279
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 10:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A991740187
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 10:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rkmiG_JVBlru for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 10:57:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.141;
 helo=esa3.hgst.iphmx.com; envelope-from=prvs=968e9b7b9=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7224F40141
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7224F40141
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7224F40141
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 10:57:51 +0000 (UTC)
X-CSE-ConnectionGUID: 1gvf9yvjTEuU48gJUbUqxA==
X-CSE-MsgGUID: fcicJl5CSDecDIWmod5fkA==
X-IronPort-AV: E=Sophos;i="6.10,195,1719849600"; d="scan'208";a="25725025"
Received: from mail-eastus2azlp17011029.outbound.protection.outlook.com (HELO
 BN8PR05CU002.outbound.protection.outlook.com) ([40.93.12.29])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2024 18:57:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpxO6v+NDrTstj7UG9q89W0yJ/yjkQ4RbLWnaQVWKVBSJtxcVYnWUSWGfM1ajNqBCu6DO/1MUs9+TJdfjV0p+afo7kRdISSQzOSQlN46ZPxPrRS7aXKJmIFIjYd6GdOZ4rdaKPMVexnJgH46WFCdwfbkYYfY5HltVGsrT4ZBU8YOQHhYO3v3f6OQ11lXWoz4K4DwPBaU/s+EPY+FCZE3GJ7oLSkZV4vN+z9b4HY71ZEHdZWQHG3hVuu3AIF55r0jlBavmulkqeIz3uSjsJwgo8mmOCywylkkVAUQtvoBTE/mc0cA2iVROAXoP8KwwtOVmCRSNr/pWdXJqSSW3I9RAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPF3PjinSh5To95SH59KL0yj3FBwujUQTSidM5Bz8wM=;
 b=lVpygeQIOOLANJY1+2gX8ggRp4AdjASr0C3fm/EHolYCgIFgTO6BZcM5MaCpR4nrMu9pY/roDHMl+owyUeydK5mmNDR2lEAFMg5J8q7fKu7DQNWIsqoyZH7zfr72XvS+crheNRvN3ujK+8Dn+il8MmtrPl4GSvM+YQf8Dy8JD92TolvC3+d2qWV2vETaj3bDeneCsu5odmfWQQRhgUT5qIguCEUppCjqOL31nMNwfAtHyL3QeFyXbA9g0kFccMi6DBlaAI+3YC+IYkkIp0XWkCWq8rILvzNgtHa0xVRLVP9GsAeO6n176uoSc6PqISq7Lb9SoDlum9d9EH9yyO7J+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by MN2PR04MB6351.namprd04.prod.outlook.com (2603:10b6:208:1a3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 2 Sep
 2024 10:57:47 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 10:57:46 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 1/4] board/radxa/rock5b: use PARTLABEL to
 specify rootfs
Thread-Index: AQHa+sZSwOF3S0VFzEC/tk5chBjVerJABX2AgAEol4CAAyo/AA==
Date: Mon, 2 Sep 2024 10:57:46 +0000
Message-ID: <ZtWaKGNPYPHMNPBJ@ryzen.lan>
References: <20240830101327.2000179-1-niklas.cassel@wdc.com>
 <20240830101327.2000179-2-niklas.cassel@wdc.com>
 <20240830185613.1d568c17@windsurf> <ZtLyeSzV6TYO50jh@ryzen.lan>
In-Reply-To: <ZtLyeSzV6TYO50jh@ryzen.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|MN2PR04MB6351:EE_
x-ms-office365-filtering-correlation-id: 1065e572-720d-406b-5a5e-08dccb3e1416
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?q1ILgjnplqpVYp5Xa7y99qovhuSSk1NFtLi3dIe1VAHtmuhSsoK+soi15uyQ?=
 =?us-ascii?Q?txgLYKBfZrPmTAP/ycJp3kMUEUne9ewkycMGKGZ+qcGZr05eyYk5n6G+HXM3?=
 =?us-ascii?Q?8QkVCNPPLBPw5NH3C3/xFcV9d0S0oRdNTjxKg3x68p+JuztTWKHqiT9U+Kk/?=
 =?us-ascii?Q?YfveuZjIj0Ob/yqwmQLT0MdDo0zbWWIwHEVZOQJheJ3CfuHlU8QCmIyQmFuZ?=
 =?us-ascii?Q?OgOXeEfB6viIsgQjSXbOMvUZ9W2VYyVx68EH2IHhgTcbrlbiOdjxv8yC9xcs?=
 =?us-ascii?Q?DEa14/qLxNaXRgmQ/h1M1bhUTFets9u7P3edYIFV/dVT/cB1HhIbec9R8xef?=
 =?us-ascii?Q?aT3VDlpMizchXPB5A+E6p/5vFTD85uGcl06pz4u/WKr8p9QNq0luX96QDX/J?=
 =?us-ascii?Q?OmeIiZstZOdfNuoKYtyu303IdgwFbV7ceyaWHevFtPLNyJfakgI0NB62lMbD?=
 =?us-ascii?Q?4I+RTOObxgENPRh4F1ifESh8Rc8qU+76v5yxR0uj+VnVG5H1CvBm9qsdebIF?=
 =?us-ascii?Q?2Gn/qlBHs5UEEFwd9Nj8kqk50NGV8m9lbaMPBTUOgaqtmoubYuivvhN3Bm9u?=
 =?us-ascii?Q?H48eFjBDXd2Vqrq0ati/KnOtAGVLs/2Ot/hs1lbIP1fysGxpzwGHYvYuH3q+?=
 =?us-ascii?Q?honGwDDFMfqvjuWAMoyZDpHg+y0CI2DYikYXe/RvXrqZQPgSqLn0m9f1ER+e?=
 =?us-ascii?Q?ZYvYKUxVDFCZQkbKZKSi/Ytc4620B513ff9Ohhz57lb8GEJ8YcmTFQijIz+D?=
 =?us-ascii?Q?Qx6iwKa1pKoBAUI2+er9RFWY+ZInKbRsJXerL2APxrMPPTK9RTBasIqsnleH?=
 =?us-ascii?Q?z1HcZGLsAF1B4I2LyqKcnh/6Q/yyD9wqSw/dsEoe1uixfw4QNZX48piWblbG?=
 =?us-ascii?Q?TaimkCKDoBwUBH+hZIs2LOMKWWi6xXLYNf3zqC9VJHDensATcnevJkIwY9fG?=
 =?us-ascii?Q?f8gsnDochYzJoKwmkR/ix2kYaSSpXsq32QGbeWcXvp9c4RisfAH9XrKhq3MI?=
 =?us-ascii?Q?8dSzh8ogkDXV1oqBcOnPaPLQavyDjmudBCJ5Wi1NLENkZHCUjUVrzoB/UjCz?=
 =?us-ascii?Q?sH+SHnEXVcZ29SD41cEBdYdm020rKKXzzOb7YM7JLznneHXvB46VtejZDIfX?=
 =?us-ascii?Q?RFRmugptwcrdt7xnWs9AeLVn9v4sH585tQ4EWZPpx6L1aBlK4mntRbJj/l4S?=
 =?us-ascii?Q?ROj5eI2FVaiXi4TX2Ps0fCw/jAArVqToyCFtYGcqS0Hz9tv8Cedd/ojlhmqb?=
 =?us-ascii?Q?3k3JW6fFHLD5zNLTbwkpqL4vHku9rfs7TBS7qfr/rcXQ/28Z+PyBdQrhq6ma?=
 =?us-ascii?Q?Dvuioaa9r0Rw183Pb9BR3OM658juYEmJ1mvEzxseluLvwVgBMoamtCmGw0Qp?=
 =?us-ascii?Q?sFUyRXgTqy9ndH21nWwPPo3ZTqerVsOAI6UbAZg2TkSyzfg4QA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9OaUIiBarOUmzMM5hC6I6wfOpBVdLAjY4bq1qg0OPqEWSUHTRi2Q5V8/d/jf?=
 =?us-ascii?Q?Eax7fSQVp903pGK42AcZ5Py0wpXy+xqM9J/EYzyN//HlSX9NMJCVMjoqHnl7?=
 =?us-ascii?Q?Veb2kMJsQ2YhHDSoK61aztgA/c2qb0LlVJ0w+nTGMZ0tyxHS4OOe7a4Wuq9l?=
 =?us-ascii?Q?JXuL9lUODBClcwC0Vf+Hw/oEkI3ghT8UxI3N6L/pr1uNeRfuW4H6lAhtc1n+?=
 =?us-ascii?Q?/W/E+e7TGDl6ZtpyG14iYS5U1LH9nkBrofd9ejS+JeBQCTVJoHMkCOpObN5b?=
 =?us-ascii?Q?y1mLHU2j1/RvkztajpfQJtV9IlSXJskj2ipRAuzdpXt7g/r5nCEm3hlii4K4?=
 =?us-ascii?Q?ihzm8sML0w4zcskZeP8EKBJFRXf0HrUhl9V5Fks8W+YkL0s53HFViMrY4hvG?=
 =?us-ascii?Q?NZbDPdh2Q7yldEdCbWNiAAmvarHz5t0bAqQxM/kxrEK8+j3GAg5JAQHGqrxR?=
 =?us-ascii?Q?m1MaIpfWxE/pgC9pJ8wVmZgB0G4JqkWYkXb9kYLnlUSb84c5Snp+Ipnrm2Z5?=
 =?us-ascii?Q?VJHpbD9LWqBuqCjJ4csyau8s8h27PRSuQTljCBcLwXdcE2R6Y4qSpaFKZE+E?=
 =?us-ascii?Q?5lXh8ipDiXlFH1eKws4knJy91n+uX9y66qLjAgjnp+nYxUeT3ceN8WIdMnTx?=
 =?us-ascii?Q?hegwgJOQSw0gXel/8QX3HiG3+gd8IFC36aglEw5fRo62E8VsU4rLi0S89e5U?=
 =?us-ascii?Q?Nt4vBsn5bYYxunMaiY/c77w/XusRPmGzbbillfTotHq+KphNDBFdrTvCedxv?=
 =?us-ascii?Q?pLdMp2GnG5zAp59CLH3Z+C0v9a2j78hmGfCPq8B093gnzKbfvCAdFFile0Jb?=
 =?us-ascii?Q?bJeKz+M6UZShKjqkfrKcdSulvZ0QA6mU8KTZB7gfhkw4OJAsGNusMloYyc6n?=
 =?us-ascii?Q?m8J5tKHqZbqWnTooY81pD8vmbonJeQSsJNXnrlTrr6nFhCgt5IVZFWGmwTIJ?=
 =?us-ascii?Q?Nx274+lDdHJ/aFDHSYb04nIQjZ2tkDFuONgeG34N1VrjYEXBXcWpmrBm1VBZ?=
 =?us-ascii?Q?lDpKxrS+Qi0CZKwEdqq5WCOGPakITODtmCy7By9+szXpfbROk2m6BEmZY6by?=
 =?us-ascii?Q?ZDvHD96fY5p7tNosPocoSF/K5OUT3Vdn+mjhKShbxLI2dAU/M3MpLduOgQ4a?=
 =?us-ascii?Q?jnTLQsyeqe6Ybg2Q/nKQvIm5ssU7z8hEpAkgQSJlLcbspTD20IS/VjfuFNvo?=
 =?us-ascii?Q?LpOgdgZq8Yg9lUtK8lcfnPj51fhA1ATJWM7X7gEQVK7AyT9b02+PbYZLUbSV?=
 =?us-ascii?Q?CuyHkHA+6/+/l+HPCGKZXiyiNg+vtrpRbZ/qbHtWZs0jCf84V33eAYn+ku2F?=
 =?us-ascii?Q?RSzJzLTmkY/aB0Kpc9DuwiaMN5HJo1eNmLlBytARISxlvo8WHO3j6iqaMF3K?=
 =?us-ascii?Q?lrGCXqFkuaKEEog55dudWMDejehRCDK0VNKFUWTfC2NF8oTUzqzeHV7gCuh7?=
 =?us-ascii?Q?qtQVhRyDbt2OnOyB9bQX1OKj9TMNnoHDOC0iqwW364JEylpUp+I9BwLxbT7i?=
 =?us-ascii?Q?wEAyWwHrM3sB5wrZ+8FQCqgXIdYGKWtl1zUr/pyBgGiGgYtLhnTrqCMlaSef?=
 =?us-ascii?Q?U0WLJ5hVDSKynnT1VWE83zQN1dAFa9m1c30sCFeMmp7rq/cb4FOpjM3R4aF+?=
 =?us-ascii?Q?oQ=3D=3D?=
Content-ID: <64D652CD3B84D44EBD37181155F8CB70@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: uaSWHhqoDNnuSCLx6LpuNLDocnQmp/dwZ//xF3YpBxKoEQ0q0mQ1xm9YmmlXolyvSE/Bh/FXm7vazXlbdU0LtgVb7SvRMeK12c4yAjk9XUJgSD4vzFwe5c1JtGdTg7x0y/BzEchScUFmJX1JhrR8pWjuV++b8gD2LLCUXoYH6rFzgHqS5LrUYRgkDAHrudrtfKyyFLd96sggRkXEb7RCshPyJvRvvJqHrXsZ7m+iU3CEA2gJpbFZ4gzI3XHt4FQQ2z1yOM3lMYVM2AGV+cxRmzPS7Yh5WljNTlSw3XoIn26oGBStACJp2oJGFL/ayUxa5pVjIiCiEj15ewd3wBncfCQR9bL0dAQOwgSc/GjLW8Dy0NDrjqVln8vUPguCFN/GR13veMSGZ7m/r756ahuaA5h5BFw+Ve42jDjz+JuY9Kq4nWU8N4vFt9kh1MYlHvJhmiJmZXbbsA+1wAkYKePqWF/N+t9f/sMEz5kT3txrosTp/GCfEOhZdHeLFjT4dkCcsPTjAuv9RJ61kvOlnYsIJc/VcqUo0iybXNBBkLwUTzX5vVXuH+y/EBynrno2e4oLGc3K3/pXLvRYC+McDknQL7NV6h/5sY/h5754544VSEoYh4MuLEkf2t6uEQaUGwZ1
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1065e572-720d-406b-5a5e-08dccb3e1416
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 10:57:46.4895 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A4dwgEKUFc+VCiHPaFR5Kv9dbWXUXZsMLOVP1LFpLpB9DlLDwlcomhPLGEe31jmoDyY7yh7cqeAV+Ikh8ZsY3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6351
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725274672; x=1756810672;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=xPF3PjinSh5To95SH59KL0yj3FBwujUQTSidM5Bz8wM=;
 b=Sn2J/dzQUhoFBGCs34xhfajYhJjvSQ8mScQwFWGVq0tKBMbn7weZRAKY
 gAfhPODALDSZq+4t7dZQ+AxiHnHNWBJUR57oCq1i5SyHDxIWN5tkcOxtf
 Xj1jgan5x074M6tG/67KSwBMEtjgmUe6Ok/+JvdrnanvNa9zw2YEtMbOd
 yLQe9okFiUOHcbldIv5qIMZRQR97vhhu16/84a0duvyZgUDpPsIZzzF/w
 pIjrqDUQPBhHHBkCVnR9tDVPQBQ3akm6gVyrYbAdRmALf4mjcL96PYdwG
 9eCgddFET+LGghiUY6IQTeuhWo6MWdgvXAZvugNIs46xGsPtcXT2H3GmN
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPF3PjinSh5To95SH59KL0yj3FBwujUQTSidM5Bz8wM=;
 b=KfWPNc4N3DhBDprrUMyvkKYX612lM3IQfb0WmmRXPqrRI8o/ll4Eoys+gz75y3Ht543mjT5SOzwukhQblgygzPstUPZxRxJi+Sv75mZ6qE7KaetQ62YEFl2JnwKkGg3139imgIMlXjFxlhNRfKKRZUMZi4COOwEpxDufqeA6lJ8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=Sn2J/dzQ; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=KfWPNc4N
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 1/4] board/radxa/rock5b: use PARTLABEL to
 specify rootfs
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Niklas Cassel via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Aug 31, 2024 at 12:37:45PM +0200, Niklas Cassel wrote:

(snip)

> I don't know of any reason to keep the mbr for rock5b, so I'm quite sure that
> we could change rock5b from hybrid to gpt.

I've now sent a new series based on "next" that migrates from hybrid to
GPT only:
https://lore.kernel.org/buildroot/20240902104433.2561797-1-niklas.cassel@wdc.com/T/#t

I also included patch 1/4 from this series in the new series, to make life
easier for you (so that you do not get conflicts when applying to "next").


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
