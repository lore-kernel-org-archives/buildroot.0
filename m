Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D05C021A1
	for <buildroot@archiver.kernel.org>; Tue, 11 Feb 2025 09:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E11AC413C5;
	Tue, 11 Feb 2025 09:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1sOOk-xAbnGU; Tue, 11 Feb 2025 09:53:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FDC5413C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FDC5413C8;
	Tue, 11 Feb 2025 09:53:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 633906C
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 09:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D65860C19
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 09:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O-uMBW6FRgzm for <buildroot@buildroot.org>;
 Tue, 11 Feb 2025 09:53:40 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 11 Feb 2025 09:53:39 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D360160B77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D360160B77
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.42;
 helo=esa4.hgst.iphmx.com; envelope-from=prvs=13030e94e=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D360160B77
 for <buildroot@buildroot.org>; Tue, 11 Feb 2025 09:53:39 +0000 (UTC)
X-CSE-ConnectionGUID: ICKkfsicQLao2dSFVYaapQ==
X-CSE-MsgGUID: GiRPDd+1SLmOmXcJWgZPqA==
X-IronPort-AV: E=Sophos;i="6.13,277,1732550400"; d="scan'208";a="37552069"
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hgst.iphmx.com with ESMTP; 11 Feb 2025 17:46:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VuGahkeb1/ryRw0yOc3DMOwdM0zgz/BQ9fZAe4F9c+/7+1/vfTtEvBtxgiuu7ybVBGV1DhYbCxTNDHLKkRsHRYknp9mA/eOH1bBlzZM1yXkptxkegINP1UKdrla2RAotSPchjSy6yt9DZPjngCzv1sCrtND7HowvGE6epnZD3j395XUYEKCWh8BmPVfLHE+klxNvHq3qI38AL26rYcGsltge+SaHJI6FKnPXf3+6EuGmmnxvkNt04CPjkqOcjGxeGAzLumV7wZ4zVBPt9loUSiJaf0uDXSgxIOTZ5YZgXUzSzbuz+QWFyXWtrOxn3fHKvCe5zZfkjcTDRDG62gDDsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uhxa/RgyTi8qqA96HBh2XJG3En+rS9BpfkeROVli+Qc=;
 b=U7BVM41Wu9mVXw13UypuSVRqafgGflTJkeVeT6tIn7Jc6PraYs7JnI0XBHt5/SrO/2+rN+Stjm/4wVK8vZPC4uzABXyft/EZHFYiUe8DFfocHQ0ptWMzILFNRcg3jU9c9wA1up1Ec3VHWDyoYX8OEJUcfr1OLzsSSfIMvdGSbe1Rm5x/XgQ4zeROeEXbt32YcIUi8BQo2DqtY3aLmlc4ygAG8TeYpTrtzdgVutkoO8PHtY5ZCCgPWLTJXDAgr9HJf6h1F7+t8CAs4WhoEk9AZ6/BIsPg2B0rQRwwARcIK41dzqxxH/jEgFGQj1ioXOef4kkKEo79D2Y5rF0Pgovtcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by MN6PR04MB9358.namprd04.prod.outlook.com (2603:10b6:208:4ff::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Tue, 11 Feb
 2025 09:46:29 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%6]) with mapi id 15.20.8445.008; Tue, 11 Feb 2025
 09:46:28 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Javad Rahimi <javad321javad@gmail.com>, Marcin
 Niestroj <m.niestroj@grinn-global.com>, Sergey Matyukevich
 <geomatsi@gmail.com>, "linux-amarula@amarulasolutions.com"
 <linux-amarula@amarulasolutions.com>, Julien Olivain <ju.o@free.fr>
Thread-Topic: [Buildroot] [PATCH 1/1] boot/uboot: support System Control
 Processor (SCP) firmware blob
Thread-Index: AQHbfGgeIWGf+9VagECBtuYRdrcM77NB2tOA
Date: Tue, 11 Feb 2025 09:46:28 +0000
Message-ID: <Z6scc31LdTE21rU1@ryzen>
References: <20250211093349.2153008-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20250211093349.2153008-1-dario.binacchi@amarulasolutions.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|MN6PR04MB9358:EE_
x-ms-office365-filtering-correlation-id: efe2b5d5-43d0-4493-63c7-08dd4a80f4e9
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|15866825006|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?GfuSU8+jrCT4BzD/GheQOGOAg+/BETPwtShnm1Tad0HlBWF9nL1zsl1y+M9l?=
 =?us-ascii?Q?S4IO2eIjdcohjY2mYVl2JzFWBwP4tjMg8LL/Lhl/MYfjZTgLF9UA/9l81RL2?=
 =?us-ascii?Q?NYsEXj79svaDrZWykTjxszUPg62cI2xt/L7Yz0mlaedsF5t5rhQqt274c3Nw?=
 =?us-ascii?Q?3ZEG4KRDhnnCnmJJYc0LWNiYpbPoDvqk7eDtVcPAFrxO/2p5vAE5sHTJ9MrH?=
 =?us-ascii?Q?AbFNnia6TuR+9QZF5S5fmEAjoIq2/fpbjE6bPLuzjkAQUxNzVgkmV1jtcY0J?=
 =?us-ascii?Q?oRNRkFRvBEeRJtgOz2Q0SajfSCLRVQinCNdBVgGTnGdR7LzcbD0Sz55gu+GB?=
 =?us-ascii?Q?y0KFIYO7zm+V1gYFn4k/ydFZdmcYrliKgbcjgR8jMIiYhupE4O8iXU4pCnfk?=
 =?us-ascii?Q?2gMGMmY5UlEGA9jUq9yVGPKhcrH15LpfjT3vKDEZU+u7MPwtpVvci6rrvIpD?=
 =?us-ascii?Q?+vJLf37vPsqaYs8km+XNxuMAjzdGlZn4gy73aOYXqeDHKjVb+Ex5+bTKanU7?=
 =?us-ascii?Q?j/xLAlKvPRWigxCPCpRsTPWnt/ynhjbFOgWkacOT654gqwb1T9MvkR+bE8X5?=
 =?us-ascii?Q?hjYxtfB4zy8Zor4dDrLNB8PZBS17ui7rbiQTRX8CbA8dqoy3waxJbWqvSS9b?=
 =?us-ascii?Q?blGny5dwbYhKl4OOUZOAep4Db6Bsbrw47H3jTJcLC60S9Fdeb+CWZMnedLLg?=
 =?us-ascii?Q?fzG9fCOc+wR9XLtHJR3ZmywZ+JsDH4E8q77/gS4E/sPcpbRmDXV4edfHJ/RH?=
 =?us-ascii?Q?ocs4MnUj0ok/itkbzdWrqtBXodkDhGP/jquvMwizBOJJMy0O4wMgEvCCrT2Q?=
 =?us-ascii?Q?cWaRX8Mq+57dUGhr+6R/qJgj3ipijLTVs7QNGKZOwcgwU2add+dUuN+y4PaI?=
 =?us-ascii?Q?fdE3XjSDl9jbvYlZU8sU9iWExukqaShXO8nybq4ZVGgWc2p5Moe2n94mpR3e?=
 =?us-ascii?Q?cRNhVGc2He9Y1g+nwT5w/h5seHsV7op+CLqPb4CJh6Rl7cwi2NVtA8a5ybcn?=
 =?us-ascii?Q?hcU4xjPX/kL6ZOAipiTThyNkbVN2KpfjXNHZMhmZFklMaSPjmY5HIRMn0EKe?=
 =?us-ascii?Q?Uwv9fFHP26N0gcyY+rLtPIi5ZN4hZ42gd4OmwVqy8D1ggbPtOIBPq7foc8Ar?=
 =?us-ascii?Q?oremewrhhDr5SkoTG3TLa6xLr0LPgAEjBf3r9L52LNlUqVem7bjQD3AfZVTz?=
 =?us-ascii?Q?UW8wCN7qxJBmA6+ELUnFg3LKo1dA540abSq1Kmoc8VpZb/nWQlXGAhWK5xj0?=
 =?us-ascii?Q?DcqiqEigsKBGF/e2k+DVekBBPjkmlWXp7TMr0NvjGfkNMKTazmT//nUCp6Af?=
 =?us-ascii?Q?hydVg3Npyg+t8aR1JdFjmL6bkEdW71XQpW+mI2prMBK9sUc/IJIuSP0kWoNC?=
 =?us-ascii?Q?ckfu2AK1LBXWT4ES6eywrW5jjpwEUtOWEzv0ejhFBitusjUW6HzXqrhpKNxD?=
 =?us-ascii?Q?p66fezDHfQ+7juROlS2o3SafMES2Uhb3c8yeoqLuuaQlvfwp+CfaCsu2cOsc?=
 =?us-ascii?Q?in/s/DkyJcgvaSU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(15866825006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QwgGD/jDk+3cDxSYYR43tt0vzDApnL/O4Hl6odLmSlyiiso8e4sY7PDY9nTX?=
 =?us-ascii?Q?F9HZHPjaDVQjY3O8X7fqKXDjIWWH0prZtq5q8LrOiEJplCv+4dX4qRvA2cEk?=
 =?us-ascii?Q?+48S37hWxIpvuZ10BmmcRvycZ+MlSkOUnkgJzEY2iZ7S4XJh8V1PBDGHQ/YQ?=
 =?us-ascii?Q?exB+V7biq7hfzbL4LlQnGfk/46uASTXB6NsirT+U0IMxiShgW5iqf3uXD9uT?=
 =?us-ascii?Q?T/UtvrjO5PfT9Swj4KLRcYAoUt67G1j0x/FFlwdlNImeC7UZYyNrFCN6qZhv?=
 =?us-ascii?Q?QcnTE6Odf8DvPYYc8NmtaYnpvLmvHy0ncNSLMvZeYC5NvluqgTNWvpCt9jwu?=
 =?us-ascii?Q?sOWU1Xfpd0kwiPCEU95vOIQKm+c5UZ9zd4yMGcGr+wSZt93OjDKC5jWKCi+z?=
 =?us-ascii?Q?2RxH4bLcUFbl5DnNMVpxN1THkz62Jk0Vikp8E4gFpe8y9oUh/VZO2AiDIOtz?=
 =?us-ascii?Q?3NTVh5q5UqRJUvQ6XnMWV/685OBTzFewPPiwHPA2IKrcUphdJpJFx539lkKA?=
 =?us-ascii?Q?7BBNLKZWTQy7snklC0EP6CnicmJjN5x8dFFOukPAtgBToQjA3I5lrhCz3MHp?=
 =?us-ascii?Q?ZohGaDa7RSb39v1hg1X7gawO6537A56/2oyD7IxOmt0EI2mG91ZV6kfoOtlb?=
 =?us-ascii?Q?hnCLHa0Xxuz3JpqFus2JNjZowrYWACwUZxm5k/Ss+NL+bRCNShhJs6rNCSJT?=
 =?us-ascii?Q?JxXwr578dVVwRADRnldR7rXd3O699U3MabD7rhSYDndTzTk7GQI7vM2xcSNh?=
 =?us-ascii?Q?/HDDfcsl3oueFXYg1hj1qMLHLBYoU8f7KE/FKPRawlpFvlmL1Et2W7Icl4W1?=
 =?us-ascii?Q?FiXX0AsQNMA2YYk3KkeF4xIUEUjV7JnQDCcGXNJDSVDtnJfi6wmcHrLcJyRL?=
 =?us-ascii?Q?K58p9WRkmeUg2K0ARXAFIcpqQGyBxNgU3mxEfWCTII0GRVsv2n4zi/fpaJ0v?=
 =?us-ascii?Q?ai6ahKyNrC9+/4tGrQM5zuKzRyAD6lW7XrWMRzT5CSfE/6/Ya/wyPWqjHPoV?=
 =?us-ascii?Q?hKG8mkYmrIJ2xx2HUcYaZ6NSmNr7+cIaQVGTH5IRlAxFxBEa/ZOIXiYlcC6G?=
 =?us-ascii?Q?7LiuKo10FOMyp+7kQxduKxztOkt6QUSeYOhafRNShZw/bMKZQUxOSQxAQU2F?=
 =?us-ascii?Q?vnVHK4RJ4Lj4AFRMJvEFyXSfvcnbPEeOHhybhXM7teNiOknvhCoWN0zjJjwk?=
 =?us-ascii?Q?WMnnYYU/Af94GM2EYOK75rBwCZs7jxc+7zrleueJEnXGG6z+wjjoFX2v5bDl?=
 =?us-ascii?Q?Uyg/HGN0A58O8IOYLxN68CTomp9OQ4LQXt4udYgrVK8BY7AUV35TR//9gadT?=
 =?us-ascii?Q?71OJqTQID1e8zebjruXge/hDbmfdUVH5uziHNCmbAWLCIFl7jcaLUxAb53Hm?=
 =?us-ascii?Q?u5NcYIBmdB9pPPIzB5sj8ET3glz4lUim12BtmEL6VBYsTAkNRX6nmlmYOfiu?=
 =?us-ascii?Q?OFMOGn2xKZSNcPxPmDo+Lh3o/ftG0cJa3sHJkoQC0WiQ3hWk+iOsGQMV9/ab?=
 =?us-ascii?Q?ftZcrdnTvlDzA5eW5fVaIU9NcMYpnYsO6lS/SMDL1YWhH3dyBndf9F495GlS?=
 =?us-ascii?Q?KwFP+0z6rnc24lXmL3czql+zXTannpWf67s0lOmU2F3iLzeB/3vBpl3rUTaH?=
 =?us-ascii?Q?pg=3D=3D?=
Content-ID: <1FB0F9A4A521E245A17DC25EDDD03ABC@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: TtcqOjedNDzB+Anwz5NO+wu7T26zC2XT0+7X03Lag8/3zv/tBwhhlpgF+P9Pu3hqur0UpkRmBHHY6MTyp388Oj6xe2F+n4+b0Rj3JJBn/0lwbGNO6fLYJaTn0wkwAXPT+leG+oPXB1+/l4lLW1gZ6L8nXxqMZ08Pk5O1nhOvxyw2uSRjqRMqo6vt+ueWsw2rqj7rU7AMLBq1dP3LcBJT2yZXYmk8nGjPoCd6UUVtBjjok/zzreNI7bScOckkli/9ktpSO2QYREDDdOOTj/jU4y/244w4dIH5ScL40EGdcCGQByWPDMSMmzyl34YLmL5/x3VkGO+d5OKMmdAfCXw2/S6amZexsWIwnSO0SFkvixUz4qQweCMpGbdiFKrWXeBLm32izWyIsSkvktf7yukAIVkKe3Fi07wOd4zHdf4cY5ICqRyYVK6yJPVehWXEFHMRlpwFCPABv1RsjSNIhdfL295tlkd28NwnjkGgIRwgGpoSTLM4MOrf7SedLbG37GVGCyYZMtM6eWex++OANecT515TBhmlp3BOz76jmceaeLgu/BouFGpDFRSch8n5ecCL6TtXGNi8Cd9pSf8lO2KllCGU8LCiuOGM18GstHjEUo2R8JLVs4xo1unJl5zdGXm6
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efe2b5d5-43d0-4493-63c7-08dd4a80f4e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 09:46:28.1285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2QjjpJgLDsZbWNNsXsNxu0sjdg9dlJkK+ZdFxHOxlQvXxFQkReeOOWmGIT5YuDD0W3gDoS4sFsJrljlZZlj0zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR04MB9358
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1739267619; x=1770803619;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=cEk/frdWy+KiKjEBuK0aHLjGbGas3ULjObw/HGtna1U=;
 b=muS8UW3hjUNYmmdsHOwinJHKhfYUFAOzuLpCQE3sVMBVy6aXkFzog+mM
 pufDC8cN2bcLpELgRKFT6NBzXy5hleowI2/Bi+90H3fekoEE7lgwiXicq
 QlwItnhxziNxOh/4oxtkTex1JvU1vdidXs0EH7wsTWr7Y/NbFI55VRm0Y
 anq5lPR3vadK+1yGJRwBcPgZYF6+Kr4vCOyJko2f5dKhVrzTiMtLxx1gE
 imuoslk70puWTVxh3M+xeFVLOKvJYnO1IB40TZV/LxgzieZzyGog34rB6
 DUdbtN6Z3sH9Nh/rxtCY7x5AvegdyCV2vNpn63yQY2dBFpwtodDFDdqBu
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uhxa/RgyTi8qqA96HBh2XJG3En+rS9BpfkeROVli+Qc=;
 b=Ue0iuCBv9PB93S9cL3fQiJdSa460hZED9azEZUqgGHlQczkRG2NLqQwvO10nvVVD8uOp1rWBiGV4JxU37CoX2jZsg+a4f0qotjRVA67ly8BiEcpiucRbhgyrmSfc94DxjBqf0gDURn/kqaqnK/3UVZDJ45H/ltLvgohjrUdlDX8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=muS8UW3h; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=Ue0iuCBv
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: support System Control
 Processor (SCP) firmware blob
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Feb 11, 2025 at 10:33:49AM +0100, Dario Binacchi wrote:
> The commit 4bce3270d680 ("Config.in: timeout earlier when connecting to
> download servers"), among other things, adds the connection timeout
> parameter to the default scp command:
> 
> config BR2_SCP
>        string "Secure copy (scp) command"
>        default "scp -o ConnectTimeout=10"
> 
> Since the package/pkg-download.mk file exports this command using the
> SCP variable:
> 
> export SCP := $(call qstrip,$(BR2_SCP))
> 
> and the U-Boot Makefile uses this variable as the path for the system
> control processor (SCP) firmware blob:
> 
> cmd_binman = $(srctree)/tools/binman/binman $(if $(BINMAN_DEBUG),-D) \
> 		$(foreach f,$(BINMAN_TOOLPATHS),--toolpath $(f)) \
>                 --toolpath $(objtree)/tools \
> 		$(if $(BINMAN_VERBOSE),-v$(BINMAN_VERBOSE)) \
> 		build -u -d $(binman_dtb) -O . -m \
> 		--allow-missing --fake-ext-blobs \
> 		$(if $(BINMAN_ALLOW_MISSING),--ignore-missing) \
> 		-I . -I $(srctree) -I $(srctree)/board/$(BOARDDIR) \
> 		$(foreach f,$(of_list_dirs),-I $(f)) -a of-list=$(of_list) \
> 		$(foreach f,$(BINMAN_INDIRS),-I $(f)) \
> 		-a atf-bl31-path=${BL31} \
> 		-a tee-os-path=${TEE} \
> 		-a ti-dm-path=${TI_DM} \
> 		-a opensbi-path=${OPENSBI} \
> 		-a default-dt=$(default_dt) \
> 		-a scp-path=$(SCP) \
> 
> the following error occurs:
> 
>   BINMAN  .binman_stamp
> usage: binman [-h] [-B BUILD_DIR] [-D] [-H] [--tooldir TOOLDIR] [--toolpath TOOLPATH] [-T THREADS] [--test-section-timeout] [-v VERBOSITY] [-V]
>               {build,bintool-docs,entry-docs,ls,extract,replace,sign,test,tool} ...
> binman: error: unrecognized arguments: -o ConnectTimeout=10
> make[2]: *** [Makefile:1126: .binman_stamp] Error 2
> 
> The issue was already present, as the scp command was being passed
> instead of the path to the SCP firmware, but it is now detected due to
> the compilation error.
> 
> Adding the BR2_TARGET_UBOOT_SCP_FIRMWARE option allows passing the
> correct parameter to U-Boot, even if it is not set. This also requires
> removing the SCP setting from BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS for
> configurations that previously set this variable explicitly.
> 
> Fixes: 4bce3270d680 ("Config.in: timeout earlier when connecting to download servers")
> Suggested-by: Julien Olivain <ju.o@free.fr>
> Co-Developed-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  boot/uboot/Config.in                   | 8 ++++++++
>  boot/uboot/uboot.mk                    | 3 ++-
>  configs/olimex_a64_olinuxino_defconfig | 2 +-
>  configs/orangepi_pc2_defconfig         | 2 +-
>  configs/orangepi_zero2w_defconfig      | 2 +-
>  configs/orangepi_zero3_defconfig       | 2 +-
>  configs/orangepi_zero_plus2_defconfig  | 2 +-
>  configs/orangepi_zero_plus_defconfig   | 2 +-
>  configs/pine64_defconfig               | 2 +-
>  support/testing/tests/boot/test_atf.py | 2 +-
>  10 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index f17f932c9e95..6087534fee2d 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -744,4 +744,12 @@ config BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
>  	  List of custom make options passed at build time. Can be
>  	  used for example to pass a DEVICE_TREE= value.
>  
> +config BR2_TARGET_UBOOT_SCP_FIRMWARE
> +	string "System Control Processor (SCP) firmware location"
> +	help
> +	  Location of a SCP firmware binary.
> +
> +	  If not empty, holds firmware for an external platform-specific
> +	  coprocessor.
> +
>  endif # BR2_TARGET_UBOOT
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 2796b0a31010..18997cbdbe26 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -176,7 +176,8 @@ UBOOT_MAKE_OPTS += \
>  	ARCH=$(UBOOT_ARCH) \
>  	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
>  	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
> -	$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS))
> +	$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS)) \
> +	SCP=$(BR2_TARGET_UBOOT_SCP_FIRMWARE)
>  
>  # Disable FDPIC if enabled by default in toolchain
>  ifeq ($(BR2_BINFMT_FDPIC),y)
> diff --git a/configs/olimex_a64_olinuxino_defconfig b/configs/olimex_a64_olinuxino_defconfig
> index ad446ea18c82..b63ea51bc6d3 100644
> --- a/configs/olimex_a64_olinuxino_defconfig
> +++ b/configs/olimex_a64_olinuxino_defconfig
> @@ -29,7 +29,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
> -BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
> +BR2_TARGET_UBOOT_SCP_FIRMWARE="/dev/null"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
> index 46d04b34c845..d61ffd0f5f24 100644
> --- a/configs/orangepi_pc2_defconfig
> +++ b/configs/orangepi_pc2_defconfig
> @@ -33,5 +33,5 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> -BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
> +BR2_TARGET_UBOOT_SCP_FIRMWARE="/dev/null"
>  BR2_PACKAGE_HOST_GENIMAGE=y
> diff --git a/configs/orangepi_zero2w_defconfig b/configs/orangepi_zero2w_defconfig
> index c2030b05c20a..64c06d42315a 100644
> --- a/configs/orangepi_zero2w_defconfig
> +++ b/configs/orangepi_zero2w_defconfig
> @@ -37,6 +37,6 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> -BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
> +BR2_TARGET_UBOOT_SCP_FIRMWARE="/dev/null"
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> diff --git a/configs/orangepi_zero3_defconfig b/configs/orangepi_zero3_defconfig
> index c6aa9c991a6c..78c7d6daff00 100644
> --- a/configs/orangepi_zero3_defconfig
> +++ b/configs/orangepi_zero3_defconfig
> @@ -38,6 +38,6 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> -BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
> +BR2_TARGET_UBOOT_SCP_FIRMWARE="/dev/null"
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
> index 2b7ad2064d96..73b18533a28e 100644
> --- a/configs/orangepi_zero_plus2_defconfig
> +++ b/configs/orangepi_zero_plus2_defconfig
> @@ -45,5 +45,5 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> -BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
> +BR2_TARGET_UBOOT_SCP_FIRMWARE="/dev/null"
>  BR2_PACKAGE_HOST_GENIMAGE=y
> diff --git a/configs/orangepi_zero_plus_defconfig b/configs/orangepi_zero_plus_defconfig
> index 48c8e993f020..c6eee1d4115b 100644
> --- a/configs/orangepi_zero_plus_defconfig
> +++ b/configs/orangepi_zero_plus_defconfig
> @@ -34,5 +34,5 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> -BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
> +BR2_TARGET_UBOOT_SCP_FIRMWARE="/dev/null"
>  BR2_PACKAGE_HOST_GENIMAGE=y
> diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
> index 8975f3b1a211..f719cd9d2fef 100644
> --- a/configs/pine64_defconfig
> +++ b/configs/pine64_defconfig
> @@ -29,7 +29,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> -BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
> +BR2_TARGET_UBOOT_SCP_FIRMWARE="/dev/null"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
> index 6142dd36c12a..d00bfa0ff931 100644
> --- a/support/testing/tests/boot/test_atf.py
> +++ b/support/testing/tests/boot/test_atf.py
> @@ -25,7 +25,7 @@ class TestATFAllwinner(infra.basetest.BRTest):
>          BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>          BR2_TARGET_UBOOT_SPL=y
>          BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> -        BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
> +        BR2_TARGET_UBOOT_SCP_FIRMWARE="/dev/null"
>          """
>  
>      def test_run(self):
> -- 

Hello Dario,

here:
https://lore.kernel.org/buildroot/a023971c7c8bfa4826a9a8721500c7ff@free.fr/

Julien said that it does not need to be /dev/null,
and that it works fine with just an empty string
(if the default is the empty string).


So, shouldn't you simply be able to remove the:

BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"

lines from the defconfigs, without any need to add any
BR2_TARGET_UBOOT_SCP_FIRMWARE="/dev/null"

lines to the defconfigs?


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
