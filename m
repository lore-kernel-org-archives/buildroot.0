Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E045EC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 09:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8CA440624;
	Sat, 17 May 2025 09:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id veh95nECSTe4; Sat, 17 May 2025 09:56:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF4B9404DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF4B9404DF;
	Sat, 17 May 2025 09:56:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CA4B223
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4308140445
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id je6NMqBgh10g for <buildroot@buildroot.org>;
 Sat, 17 May 2025 09:56:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::610;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3F4CA40175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F4CA40175
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::610])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F4CA40175
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:56:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rbjb5lQG/VgOe7AIT38bbi6hkkimD/NzhhwsG2T8UphdGke0pvnNDmXclNakuIVwlcaECgvEgM3BCJ64wMVDEhMjUvkWVTuUYPDx5xJ3/DWsSNWfzP+fMc9EXPMkAtcQP6z3VYMk9G0CTSqp3Wt7z5YOIBRkGAOwBLqvzC+cYkMgrhv3jpTeAj3nGRtt6Rtwrke2XOtDsJFXr8enLjEWD8lMl4dbmjglh7yWkwa8IEiibhe9B14ucV+aiGD5B+BpHhRgKkjTCxhWVEL//csu+8e3TEe7e4gMJGExigMAmUwxAcMqEjZAsMR0L37wOoL53oUQMz6aMs5VAbEoTt51Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVhm79muC2ajPxaqzwyEINLddlN48dl0IKvx7P7Q2N4=;
 b=TgYiBJJ4ohuah9v6JvKbkXYsaoPz0r+9mx2GgGUxe/vfYd/0Sh1lgLzV2JfcrX/10AZPmP9who8/C8YyXQ628x4cUD0DrCTa5pH0VgtDccem8LuzB3qcqz8z05c+/tcb2MzzLDcvJjeAqmp0qh7ngLkT1nVGuEituCsXGfom9xlcICr2zGuQi8JFZPMnQFEBh0V9ZNSPeLNbiOaEZFd5GENiF442oolmxftd602OyhFdCT20Zwt/zwoAQ8c4E64lGHUsQHMr7CGyHHPNN4rErWmVjDFpbvy65olMCD+VR9hVYJlMwpAY+7D+946S7DvYZkxp9bvGnhkPlUD8kM3f0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by CH3PR12MB9024.namprd12.prod.outlook.com (2603:10b6:610:176::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 09:56:45 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%5]) with mapi id 15.20.8722.031; Sat, 17 May 2025
 09:56:45 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v3 3/3] boot/xilinx-prebuilt: install pld.pdi to target
Thread-Index: AQHbqT9Jn1aNIra4xEmNRAVItAzyk7PVIlIAgAGuPCA=
Date: Sat, 17 May 2025 09:56:45 +0000
Message-ID: <SA1PR12MB5615200423F63150D516864DF092A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250409110455.3850790-1-neal.frager@amd.com>
 <20250409110455.3850790-3-neal.frager@amd.com>
 <20250516101330.3de79c77@booty>
In-Reply-To: <20250516101330.3de79c77@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=0ea6c9d5-c069-42a4-ab99-e67e189a0a76;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-17T09:53:22Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|CH3PR12MB9024:EE_
x-ms-office365-filtering-correlation-id: a164e006-7af8-40e8-b801-08dd95292208
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?3yaknA16LBJlh5P3IA/5Egrm9YQXJEoXB+MDwq14C4FRtRZcumzAmHX67ME6?=
 =?us-ascii?Q?BxGm39KeB9bbME0SYVCdvC4+sq3Y3XRQ/PwQm3ZUlOxBF24k56JN15g829DD?=
 =?us-ascii?Q?oEr0tGf6TQX2F5xXV5nSyYBkn94gmqKQjwRyGeR9ryYRnUsB/AJSWqoZnI1u?=
 =?us-ascii?Q?oEWRJ6ViRG+0zqzhjiytFcAt0FTN7GFgqlEo8dlCwTu8Z3U4NaaTPlBfQFdO?=
 =?us-ascii?Q?uoWe38lu7+ZaseM2kt9ejWTpyDcOuG+BsynIWfglQ4W/KUW4FqwVjl4BI6lG?=
 =?us-ascii?Q?rXXVEPiegiHQjiGA5l4g5ij7jExAw6wCcyZZ9Y1thar+dgMOJG8HWiLTbu2a?=
 =?us-ascii?Q?ljVeRpKv97dnJ8tzSE60fDlwSPUYPh4CgomIAw3lBfSha5eZMGB2DgvNI1lh?=
 =?us-ascii?Q?F8MQBSW96xPIkIwAjRho6NaXtDCAzsV+d3Itr+2JVeR0mrVA70t6mbR3RWEz?=
 =?us-ascii?Q?I72iADljdEOK0iE0XCSRYcFjiee5nb6LNgiGb0CyTm6FVZ52SJC/A5+p2cLF?=
 =?us-ascii?Q?hqq4to1q1ZvUBixNEqGtFESOqaINP/WHo5qu0ZbuyrTHqeSBvpuKlM0tUFLE?=
 =?us-ascii?Q?TPz/ckizJSIrJIiYRQNuaH/AQtlA7nAeMRqGN7++FrTHe1Qc96BCLvhDZgJa?=
 =?us-ascii?Q?nHK4lBn6qZjHe8dNiSI382ehtafA+FfGNep7wlr6/cFJ/kwskAxv9xtdjSAC?=
 =?us-ascii?Q?gqSEdMcYK5MksTOo8RulBsmupNlhatc+RkDUohj+6l6hEHhP5nfki06etG7p?=
 =?us-ascii?Q?uo1s4slNn0UyBXXgHQ/aAin3qgx2j0pYHdsil27TWEjDWrzi7i1pgUFDdenA?=
 =?us-ascii?Q?Q6HzOxsbPDdfpMRq9pMaTeXTa7pJROYyqFKvx6D2r6AQ8XAopHH+0hBw+SKj?=
 =?us-ascii?Q?K7ouTQc3kdo5FkJu9RSItZicJFHVougzIzVmIWKBP0Qu5UEBYZq4uZybgbX6?=
 =?us-ascii?Q?iHtUxH/Y1zUlOPJFS+cqMH66F1/C5SlKxhAQqfume70hyPSWXjFClsBxq/My?=
 =?us-ascii?Q?5vnGg4+tLM+IHWN7CH1uHPIiUfkuNrMG8/PJ0qOSQuHEQ9a3nbXsdRXuhBQ7?=
 =?us-ascii?Q?Xxuq9KPa5bpi00ZTPbvQNZ3+ogx34k0mE36xRzC4Q9CzpBE3TJL/+tKNO6/Y?=
 =?us-ascii?Q?AApNLtd0vAc8B34OA4OSu5MiZowMOKuS3a1UjPeslN9tFxxlE1LX0M4T/5s+?=
 =?us-ascii?Q?+yPowvvP9DhYg83co0kVA0g3tgMhY/hzYz8CYsHwaEbQiHUOXMlGei+TsJJp?=
 =?us-ascii?Q?6WwAntCIMfFTp+fCl91rYGm6j5DiR2le4fJzED6Ck02RBYPbTCv5LczUY5fl?=
 =?us-ascii?Q?t/60oWmRmSjPlWkcvLsMrCJwGq3qpS6//Nb9MSSISCCODFRqX72uYpPHx8zN?=
 =?us-ascii?Q?k2quhLlmfRY4fgwxLK2xIQVwuaV85IszcmReLiaRmX1jxFV84+Eg14zUa6Ke?=
 =?us-ascii?Q?s96uFv1NUMMxYMao0aMKHyiWchBC3saf+pzBeCB3fB0Kd32ARnT/VA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iV5gHxQC1xrDsxcPeu9W0iJSCF5Hcw2RwQkzAsQ1fxr2o5vroXFgFrIllqo7?=
 =?us-ascii?Q?vypfi2t2Bp7fBbBZCDXnk74Au94oddAKhMXlJbhxSbNZzBZuHlICDMSR4Qzy?=
 =?us-ascii?Q?mk+DbXu+V5olsgCDXtgOXQaFMji4qyu4Dql4fR9gCjhrRC/AqAQ2Kn0y9V9Q?=
 =?us-ascii?Q?kZgUAR64Fn60WAUdWfOJ9IPfpu/g+CI7I58cuGmgMP4T6ueF9Llmyomxq5vf?=
 =?us-ascii?Q?iz7/DvGIUgVf5GR5gwtEFOScg6i4pAkXFxzwIIh7hMNVI5pKYFgqNXA+PMXw?=
 =?us-ascii?Q?vRcW3r4u8zmra0V8+WGJRk7dQDpZparye7awkcCnguqP8qjizSbREK8Gkpa0?=
 =?us-ascii?Q?mphGMzqvcVd47QUImrguAU7MQp6hESdfsI/NXDEnAiszVDt0XxRHWh0lX2gK?=
 =?us-ascii?Q?EMgeXRjtvMMZo49wtV8f5kjjKaBJ7MmwNlaLXWQ74YQ3Kn+cwx8b9XaBXcaW?=
 =?us-ascii?Q?lwlpOxGspSWyJ8iAt7VJPi32zlbWy1MgO7SyEaT81XvqwBlB6x9JH3pUdEgh?=
 =?us-ascii?Q?eOI/jxUM5u53aPTnLKCJxMl3hCMsPPb9sXy1MVtQxA9eN+Nhdny9i/dDYBGp?=
 =?us-ascii?Q?QR+2SAMU8yH30tkVeCrGrPH0TntCGicG2LlC1FIJTY5XHjrOVGdZ8tC8OA7K?=
 =?us-ascii?Q?fUS85tWfM1bt0kHkz9fTu1rTZGNMxhakN1oLaE4xKa7oGrv1Jx5ymHh2pDs0?=
 =?us-ascii?Q?PcCdffCIv4XTCITo43rUqomqa8/F1Dx6CzgTgbAjwndwo1b2Sg727HYHaNbK?=
 =?us-ascii?Q?mpTZefWFGIoDjpHeI97xzaZfU85fzrD7BdCEDGR27b2K6abfX6yVSeT/FEgP?=
 =?us-ascii?Q?DcpCSfpdd4R6jJcP6DvhTr0G7pqtR2PrKB+zxTGEZDxIcN3YNxQ28rjm5nnF?=
 =?us-ascii?Q?y2POPwCOx8W4G30wNDrR+fXA/ppQMTlsVm7pv0CxfRXaVloBmGhRdAFyRPhT?=
 =?us-ascii?Q?mxO4CFK+0uwMc+aUVa+eWY/tfS4lHIiwKb6vhhO7OsBIMGrWpj7IeYkjh78E?=
 =?us-ascii?Q?SgR474rqgDPXRbTxSuotWl3Qkqt2fPtwkLzl0frVHWEObGeTqpoADoN49wXy?=
 =?us-ascii?Q?ZYzK8rp4tcltx62336NjyUonLi1t5XJ27wtU0vhbR7DZqrdyNKgR0livCCQL?=
 =?us-ascii?Q?fBxWzK4i1RJ2/m2jzDjnFhbM3y5LR5dEjMV8Vo8758Zub2s76xBEgBKx/bh9?=
 =?us-ascii?Q?g2iFHyy7916UE3PwWh6GBpr0YlQyNgf0yBtclKsXwI/eIs3Z3DbYNDiD8iXg?=
 =?us-ascii?Q?tSyIgGF5B2qCwXb6GqZ9kbQ/Ft1mZ1FuuI32ZjWMC/HNhqelkrcBLcxXnFmb?=
 =?us-ascii?Q?9+OUfzSGa63qIORsEArrlIraK+8MpQOt7gTC4tbmsdl1wLmzwCEmkY0iRj2y?=
 =?us-ascii?Q?t0QQB4CIgFBfZvzAWzEILiNu4C7Go0roTG0BvogMoXM8fqWIDIPkH7K7S6fG?=
 =?us-ascii?Q?/bsnXbNz0psdTQj+2Zhaxj6/pRuGtvwRcDhGXLAV9kUOlrgDu6wlj/qbM2VM?=
 =?us-ascii?Q?pCr0gIYCaOh+muzeAOIHtloX+VzdKIse/ubc1sKvVqaYeiEtOhSISFScyeu5?=
 =?us-ascii?Q?NCkUEPaxkwsDR6HirUo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a164e006-7af8-40e8-b801-08dd95292208
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2025 09:56:45.3444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IMKhvdttZawKFaX7NpSJKxZFwgZIL6g9HoJLDoD69x7GpUzwkEfnBDUBV+R1zp/m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9024
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVhm79muC2ajPxaqzwyEINLddlN48dl0IKvx7P7Q2N4=;
 b=nN219p1uhZt/ecSyinz7lotP9vS2P/A3385r9/Noxov9BMYi1ZZdvsyVEJlWrK1B2Ykge0L9QYG655dTkw9TjlipQ7LiJcYct+fifbIuGc63KYcsDnwNdU2uAEXZo5iIFSPkH4Oa4mWD4fVO5/hJqb+FMaBEkZ/3X8cUPSbL3+I=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=nN219p1u
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 3/3] boot/xilinx-prebuilt: install
 pld.pdi to target
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "arnout@mind.be" <arnout@mind.be>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Caccamo,
 Fabio" <fabio.caccamo@amd.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hello Luca,

> With the Versal Segmented Configuration, it is possible to load a PL bitstream
> at run-time using the Linux fpgautil application.  Whenever Segmented
> Configuration is used, both the boot.pdi and pld.pdi files will be available
> to Buildroot.  For this reason, this patch improves the user experience by
> installing the pld.pdi file to the target file system for run-time loading
> whenever Versal Segemented Configuration is used.
>
> If the fpgautil application is available in the target file system, it can
> be used for loading the pld.pdi using the target command below.
>
> fpgautil -b /lib/firmware/xilinx/*_pld.pdi
>
> The source code for the fpgautil application can be found here:
> https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c
>
> Along with usage details:
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1188397412/Solution+Versal+PL+Programming
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> You are proposing to install this file unconditionally. Aren't there
> use cases where this is not desired? Also, how large can this file be
> for a complex FPGA design?

> I think a Kconfig boolean to enable this installation (defaulting no
> 'n') should be added.

You are right that larger Versal devices may have pld.pdi files that are
several MB in size.  Users may not always want an image this large to be
installed automatically to their target root file system.

I will add a Kconfig boolean for enabling this installation when it is wanted.

Thank you for the thorough review!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
