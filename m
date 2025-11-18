Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E0ACEE351
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 20:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59B9784516;
	Tue, 18 Nov 2025 20:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5oZnqWi0kjX; Tue, 18 Nov 2025 20:17:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AC4884519
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AC4884519;
	Tue, 18 Nov 2025 20:17:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4726A158
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 20:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38A0F6084B
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 20:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qrlnyd0Cn1Fu for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 20:17:35 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::62b;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 523DD60780
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 523DD60780
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on062b.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 523DD60780
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 20:17:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=h7PMUv0vlFNrOiESDzF5yQcrjRaHckxhs2WlH+w93kVkVGPbZK/rR3r2BDBuZJccl+Aic4PctWfqlS95WTEZzq8n38xUtMp6yZJXmEivmXcjgsU4t7tvE283KuMVlzHQYF6uKY/xarupdPbYuKwsB85HBTCP+1qqhlkNOdUoIEmNR5cpQ6Pg01D/7QZ2dNwnyc3W//AA8+t+nL2XIaw/Fp89sDpj+m+BcL6x0PKIimq98iP5ODZA1U933DIu4Kuwz2OH5/ofhM42iDX290DXnIsDozJhR5uLrcbk0EbTYLmlvNyAm4l6r4WrQlOeVpYXdH8sb5T4z804AtnoSMTziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fj95TYKk9scDtRSgf9ZHMFobXNC4jxMVbeq9Wn5xzE0=;
 b=OZE0fwDiTpyuqKnGQGE0uem3d8nBiatVfR32ucGI03Ugh9a4EXdC1bEGVkCaovBnj/zoOtGe61rj/YEJ+RKaHBxI2NHY1FNk6FG7qU09KTxlUNkgR6eSdr5fm30Eb5IZcXS6/jetitSr6pERXhi70xp0f/97hPhbgm02ibn0x1D0snyOwnQo+QL/9NEiyd0NNWmw1Ojh1/L1topDKgLK+ZghK2DIlMrGiKdvDsFvuUx5GwBFFZEMKoNteCpFA5qrzAHHG26+rL9Kfbh/QqxOmjKttwJFsFS+lG7GXy9ru48o8Txzqup/FewC2/HStw7A/g7VSfo1c8MOIB4MKCiWcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN2P110MB1496.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Tue, 18 Nov
 2025 20:17:29 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%5]) with mapi id 15.20.9320.013; Tue, 18 Nov 2025
 20:17:29 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bernd Kuhls <bernd@kuhls.net>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/1] package/openocd: fix build with jimtcl
 0.83
Thread-Index: AdxYx3PJ8s5IqQmcRYydusv0o0m2Cw==
Date: Tue, 18 Nov 2025 20:17:29 +0000
Message-ID: <PH1P110MB1603BFC9DA473D5DB53D37589FD6A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN2P110MB1496:EE_
x-ms-office365-filtering-correlation-id: 37fec1f1-42a2-46a1-802b-08de26df7f7f
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|41320700013|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?20lhHF+CfcupDLYjJlIIycNoWCZxiesy3P+ZBHyLZemTdPvZ/FIf7D0VrQ6H?=
 =?us-ascii?Q?RtFUJAlN2qXDxz1DSghHZrZZofvFYHHMclBokrFpS9SJSWlPlSctppSRRTVZ?=
 =?us-ascii?Q?mrgg6k3CyLRmg9VUcN8/v9u0CwWQ5hl3kjOLO6zmAjudFf9qyepBKHDZVYHI?=
 =?us-ascii?Q?oDzE4bR/s6m2mJ465P6r3e1yqVi0IpGwPYr23KPJrUFbmE/f4Py2F+HwrGn6?=
 =?us-ascii?Q?l6AExHGgefw0p/3N6zmf7Ik1ihMph7S+g+/p4YCtbx3CvLVS8ulpbNXfjmMz?=
 =?us-ascii?Q?DDg4bC5sB8W/FRaojJm1Nynr0rZCSAb8/sGYjDqTdJvqu5Vpr17VVp9JOTWz?=
 =?us-ascii?Q?EWDhvkL+xXy5YU5CkVS4/ES+o7haWyeAYdIs9K23GJfmeqHB+sl866TldjqE?=
 =?us-ascii?Q?/feook4MFpAkB44KfTrbahgY1sITSKk7qgml7uQIie1CKw2NlWoBJBhK9UTk?=
 =?us-ascii?Q?x05kHbYnADJLleSNujiATYUMFV/cYQhJk0yz8rtjY5lhVLy//6Hymc8gLgjZ?=
 =?us-ascii?Q?3tl5cedITXxa9e3UK82Ddc6Ax1HdTZouOlSJuX+7tiRjhSnYYHbJHnd911L3?=
 =?us-ascii?Q?NWAFqJBmSIK2lknwmD473w2lb5HQqPmpx/vJJHkhqbmna74gS69TmHnpMiFH?=
 =?us-ascii?Q?GudW979vzRWgKMYoFtIdePID2u4fS171cXvRhWWG/GPE+IU853/84w+SiROe?=
 =?us-ascii?Q?WbDrDIH1Bk+I1uEYuirNOB7600hecryTyDwxiWGNsvnw0EZk8ZX7vD5VvtHk?=
 =?us-ascii?Q?xD2GpZtY/rBDg4DZ05DEYYzFFk1KV4vdk+uDTbN8Ljxche7bxmhWZw65P31J?=
 =?us-ascii?Q?24OKA9p6PJUhoRizZrzsQ9wVynD2uv3UybymoWn2QzDIKgHxgQ/eSVdIvVok?=
 =?us-ascii?Q?bLaQ92wEV0fYfDdqWnYUmvE/hHTSBS7HPcLYSrM905hoJDPZ608eYW7ZNfST?=
 =?us-ascii?Q?XmIJ7S9ucXqX2slIWWf8qtqJm9pQ1kLyBx4+Snwrcs9J4dV2Is8MqYGDn3Bf?=
 =?us-ascii?Q?42mt1tqFp1geOKd/mKiXlniOEogzak1hOTUT7idrg4vDcqm/A5UKBkMYfgWg?=
 =?us-ascii?Q?dKNsLYQMQcufmd2SC9FBJ+5QIaPWyDtUS+aa84kp/SqLvpmElKt7NFvD9MES?=
 =?us-ascii?Q?pngUlDUbKL0Nn7CC1yik/fa23DNN3OARUcqdJ10FDOT0pCqxK4CvOi0dZm3B?=
 =?us-ascii?Q?2CI/24/rWctf2b+QNzH5W9Br8bSBXTBJIsjoahsAGk3dd238PzBK9R0/itIA?=
 =?us-ascii?Q?XKOUkZ4KM/gmd6nmC3xDLiXnfUZuvz2LpnnHJn9mgonvLxxZl4wVD61qr0sW?=
 =?us-ascii?Q?pqhAEQHfOstnzWLBeRVa294Jp1gk7x7a/8kNjguCy4Mhqw5nl5IpRIH0iE0/?=
 =?us-ascii?Q?yCSjI4nyqBcb7A7nh5uHCwNM4fuH9WKqjJuC4AKP1oNhBGdtkyTLY7XooVG6?=
 =?us-ascii?Q?TIUMIfTE0dSnIdkXLpRwdf7YHNoymf2ib1zYGL9BNfuA+BG1ilzppF7q7KCv?=
 =?us-ascii?Q?YPAL7YR8p0YY8eMGp5q7QTqLoFDBinV5ONYt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(41320700013)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Pg5qqnTQeHhHKPUFyWUe+3deMTZOTBoPl+4LSeZ487qHEE8cOt1ZFhT9n7jr?=
 =?us-ascii?Q?eVe4/e+LMv2uDhOLElauvx07WTev296VBmCPbhZeAB3gPWpg0mIYmIBQzA8I?=
 =?us-ascii?Q?G+G3ki82cssckkdhCAbj5tCMFUz/E9u8X/GXejtSLiOrygVXIvkxWCsRxAu2?=
 =?us-ascii?Q?25cymyb52uyqzxoxIR1DzZpS77t8T6UTFy3yfWKAHOeZyrXBgshBTLF7H1tY?=
 =?us-ascii?Q?hN3uADHRGVbq/c3Ca7cfScSy2lIquqS2XOhVFQ1SA3yP2Ul/mi7PnjQV/qLH?=
 =?us-ascii?Q?lPnnpjKLjf2IC+F5MknGKlt8TNvMdimIlTvFSGzvBnzq5fVdDi68e/EE7pq9?=
 =?us-ascii?Q?z+ZYJaw0mW9hWLCONWtni+yE9ml6WDShL9k8sQl+Fc+moTdy27r2yt/299kI?=
 =?us-ascii?Q?75QrdIfmNncftZqckDdHK1KbQJCU+5OE8dnjeH6qHwD0flMtglqYcg0mNQsZ?=
 =?us-ascii?Q?XN1lyK4991FzOXij4G6FjN5Tx7pi24RGoYbd2/TAi2RGDb3H90Ql0yA6LEg/?=
 =?us-ascii?Q?6W9VEiu90Tv6Cbr4B5hxGPcOwW+Hqoz2Ys8SFFlLJ9tShhxmE0rcdvInSN+P?=
 =?us-ascii?Q?hj0lE4tl0GNjUF38MFbKyrBrgsckUP9wCcQU+3f9OCwyOPX6inF1lCmft7pU?=
 =?us-ascii?Q?sdPGayDq7yzbwy1imQnvfsLNE4vxAEA8TXOYzkgodfCj6Q2xF1Ems66e6TV9?=
 =?us-ascii?Q?OvsGCW4QQtX40OE1+zArtKIqfKtoxiz5P7lQ2ArP5Ju30iJtfsgptJUy/zrU?=
 =?us-ascii?Q?O/JE76z/GtB/+P1Axq1dVqF99j82m4icHZl3yUEveFz+d7wbEZfZI8w6oZrd?=
 =?us-ascii?Q?txy1X580x+H22832oUMDIMom5rpGkgNJ6j7E/i2W8vJeEs22khgQMGi2PPyS?=
 =?us-ascii?Q?L2sol59myPyomMdOJTSKpmdeMH6ikZ+2YI20gDQACoamPAdnjbh9JxU3Ekcy?=
 =?us-ascii?Q?KK5UQEsVjVoqHquBZXrr3LGNlyddZlM/AhXY1vD+hpYkyGTma2iGDgufziPW?=
 =?us-ascii?Q?jmB1YDEYd65AYT1SfNaQIrzxTNU/Ob8uRYBq+p4J6/TypxIuia+42J2TYrI8?=
 =?us-ascii?Q?0WUWnZZcHDTqkf4CHsbtpO+qw3gk5+m6oHSqVyU7G5f/ztE3/bPLQrdpyIfD?=
 =?us-ascii?Q?rOrcqgxal+tbi7D2Wgcw87OKHaImMfJ3FfUN67g58EV04XpzTljzFMo99Toz?=
 =?us-ascii?Q?iv89e6RPCuoH75v40AKnqJQrkxnZ3fR9c5NhzVCgVDTDFNX3No6os/gOfr9w?=
 =?us-ascii?Q?C93khu+301i5ch2B0Qe/iQNYn6FbE44a4YcyytWCU6Daa9Nm3gkqy//s1576?=
 =?us-ascii?Q?zatqgINhjUbFsmATSk5y2Vrgm6lcu9+LvpsRxsXI8XbyqIjGN47HAvMb9gpI?=
 =?us-ascii?Q?VJMKN0ZTnoUmT8tNsIN5ksVl7TyRh/flBsbb80CQC7jBkP/VOMNQw+QT6sDO?=
 =?us-ascii?Q?J5X1hzprPpgrwuuPZoiE9F6Y1kyhy/A8tJNbm6t0zY/TLQcan/8M3+AbQ7M1?=
 =?us-ascii?Q?dq/UN1SkZ8EbSGg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 37fec1f1-42a2-46a1-802b-08de26df7f7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 20:17:29.1637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB1496
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fj95TYKk9scDtRSgf9ZHMFobXNC4jxMVbeq9Wn5xzE0=;
 b=xnCzL6iMhnyajzvxwsOEk6RRoYlBVEmtCmAVwpOHOjAjODeuNyiXGLn2aVJ9PYq9NHIi9bx6Rp90HM9bJF3BIDcQwU40dwfd1Q+MihmhaEVIqNI5t8GD5SbJsT3jCjAECVmkgCbGdUsjKOprJizFuvwpTlvQyymHr3sXTPv0MmmgcdFYjEA16GKBQ1/vETFzz3+IPgVIj61i9wCzxltFV+m/FGRhDRZpSvK8e5698sA1mpeyFYhg+7MohBqdIMmmR9Fy2pmJhI+Uh8DektxyzFu4cZeo+SMnLhMgs4nRlxyaI1TDP/PwmY/hO0YeqzEjJd9tQIwCsuLlqCBSV8eLRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=xnCzL6iM
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/openocd: fix build with jimtcl
 0.83
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



> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Bernd
> Kuhls
> Sent: Tuesday, November 18, 2025 1:03 PM
> To: buildroot@buildroot.org
> Subject: [External] - [Buildroot] [PATCH 1/1] package/openocd: fix build with
> jimtcl 0.83
> 
> Buildroot commit 283821fc31c4890f141111cbc5994e36703c91eb bumped
> jimtcl
> to version 0.83 causing build errors with openocd.
> 
> Add two upstream commits to fix the problem.
> 

Just a heads up, I had to port these myself for Debian Trixie recently so this should be OK.

I will say that master should be pretty stable if there's an appetite to use a commit hash over a tag.

I was testing it for:
https://github.com/openocd-org/openocd/commit/3903c804804947f47820a7d0de736b0104738e7f
https://github.com/openocd-org/openocd/commit/0021ee2f5d515885c5f7affaf438129fbaf7c8a4

I was talking to the maintainers the other day and there may be a 1.0 version at some point but I'm not aware of an exact schedule.

> Fixes:
> https://autobuild.buildroot.net/results/f20/f20667f8fe159de6601a81a827f26
> d4f0382d673/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

-Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
