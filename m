Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4ACAC05027
	for <buildroot@archiver.kernel.org>; Fri, 20 Jan 2023 11:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5DEA827A9;
	Fri, 20 Jan 2023 11:17:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5DEA827A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OZxhd_KtZr8J; Fri, 20 Jan 2023 11:17:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3524F824C1;
	Fri, 20 Jan 2023 11:17:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3524F824C1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1179D1BF338
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 11:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E904F824C1
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 11:17:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E904F824C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MyjCuyV-k4Lx for <buildroot@lists.busybox.net>;
 Fri, 20 Jan 2023 11:17:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E70782335
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E70782335
 for <buildroot@buildroot.org>; Fri, 20 Jan 2023 11:17:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mq0pxvV9ctKifbG4j+S6YcUgI+iNgmh8y7+BidDcZfaly+YTa843bg96prAYGUrwb0Na9QiSNE14wshvrRXOkgvMk6P8MP+PZ1fi7oyugP4ae+2bnhIcrCL7GYq/y9gOraMe3MApPrJo+08kDzaG0XdD4RRFu/6Rgi65PcZGA7e177RUydpcj1S3sOJx95Vcjw3noyQzBh5ChSA26jiBVatwxIm0hT5hIMUbyL0WNexcu/Q52KUriCQqPPjddp/+K4gKMEp3LipQCwoX7Nfr5Fv7tkUHkFSqFFaPFf6ZlE/zEZxj/rnUQG7ZSIHWSA7E56hT/eFdeJDy/tXKvd8LKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V40NIHpliiA5A3ykTujgddv3AMIrqE9LP7KDl8DzWq4=;
 b=DBVokCTfX/1HFXJjgMTQIlDbzbB46B7kKUsj6djFGa9IeyIU9Q/5aXbd1pncQ9BFWI54jnOJvdSNZwf47mXhJeklRE2Wo6d+kPkluRqbMogOpRonjJ8j9TqRZwQJJOtS5q3/M5L9ZZtYW6bSRgj3kTOJPsj0OYejcTCzzy4mqCeX3lnA0+ZG5uTJ/9qGZfNNHau+xhOmkG1BjReXSJXhcHyGd4kKLDuth+f4Yv3OTtqOA31GAhDXmA42DwaI101oLvMzWnQULH1mVLqkR4kiU/UolTXXEa73MSJJm55RNGSnEhY2iB4uVVlz6aUFUE6kqXJYuUDdFW0LYpqMtbLKRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Fri, 20 Jan
 2023 11:17:50 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::6b2:a11:b5b7:1e59]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::6b2:a11:b5b7:1e59%8]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 11:17:50 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 1/1] board/zynqmp/kria/uboot.fragment: remove
 unnecessary configs
Thread-Index: AQHZEHcDhq4lw+QqUUKN7Nocob5DeK6nYICA
Date: Fri, 20 Jan 2023 11:17:50 +0000
Message-ID: <CH2PR12MB5004D7A6B10D39C3FBCC0E36F0C59@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221215111831.11956-1-neal.frager@amd.com>
In-Reply-To: <20221215111831.11956-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MN2PR12MB4408:EE_
x-ms-office365-filtering-correlation-id: f2892cd4-030c-4179-e649-08dafad7f765
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wP9hdcwkpQbqJCuqGDSPkS5JzXSCaYymQ91NmR5zEQffFnJJO6ZonIU60R/BULQC7uWGG1KAZU7ap+YTyKMbq7uEyPJX1I6ddwz7db9dQqTUgYmxXsTolxv6T1SAxbigNdZMGl9Jp4wT4ESlzdTPWk228fjkzvNuIyMddSthQvYxZLIhUqXB7xbp/AAPiX+PXJq9KxVx2dA05WQpQpsVwsiOEMs/pjGCZIdqfzjlFWJMM8op9+/mnWUPTHLk+D9Opxm1dSkX8t0eLxs1Pb3tNVt64ttzPIhPE8ycOMz9NZ92c8nVDhlvvUTeasgHjNU6AtzyVDm4FvDSYf+POxJTqkVZ2rwa+mird0vnP4xDeUZ3Us0bbRTUIzj/gtc90/9cvkqxbmfGfHBfaCSLjf1gB+xqAp+QntBXLnwT/vfTp3pTPFTYcu7MHlz8EXODIxAGs+/4v/SHTrbJmjdSPLsPnWrRUKcPfgtDlQIEk7DBYYuagKPdD7HuuM/WRlwLIdQjSy6zpyIWZDc6PIzDT7mTJugdM8ytQwlfNwfAl32KjYraE8b73NLxJ40Os+Ar0uFlZzdJ46kTkgYtP5VfC97mXv2cXKeU8tu35wlFchYj05IzDim9fU9VHZAWf4uB0CINOZb3RWTBU71KW91W4bO2z6MGWgvM9RjwaTpIk7rYQSkl6QDpVsKXq0x2cnklqUdqdUYzLI6FIknRySX7aznubg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199015)(86362001)(38070700005)(41300700001)(5660300002)(8936002)(4744005)(52536014)(122000001)(33656002)(38100700002)(54906003)(186003)(71200400001)(7696005)(83380400001)(6506007)(9686003)(478600001)(6916009)(8676002)(316002)(64756008)(76116006)(66556008)(66946007)(2906002)(66476007)(4326008)(55016003)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YEIcqwczQ/m6j983/yd76sAwt2tjTYGSW6hDCOzS7jiagpGAuCmdzsUieUZr?=
 =?us-ascii?Q?8Y3MRb+6faMHzTD1Crd+du0DJXa5fEyhTWfWPj3DRLe5GZl4/bxoRRBTs3xT?=
 =?us-ascii?Q?UWjTdO+hWVqUNJ2qqnuoqlzpjfHOW5LkHFqEX2mlX7EcuxKLIpPzTu2wxA21?=
 =?us-ascii?Q?cuhjdUKHBu61bMvStThYIsMb3/CJmq23r3C9biQvBPoa6X6AgoQWy1qQ5esQ?=
 =?us-ascii?Q?Db0+FMMXKtRZIzF8ZMhKDnSJJ9zZ26F/EZ2XcQOQYY7xRoxUrzgG1mqZYrOC?=
 =?us-ascii?Q?a0hJ0KOeWsuVFDKn+iwl0YcVepFpTtICoikGdKs66jTQgLOXjrvUaKVaNz6F?=
 =?us-ascii?Q?TsXV3w0cmZ5tQl3e5aoOKE8R8egFtTlWTj3+RLkUt+xsZcDYcwN4N+QqsNAw?=
 =?us-ascii?Q?mAa+VZFsGTKEYBMPGHDM/BzfONLbDaTuevReQJ+U21a0F4xwHWsXvT98gjOm?=
 =?us-ascii?Q?gL7+V5YRRgDkCXhQ5m+YyGwU5y11gnmyO7iTCr58YPKSGAU/E0pOoS1Avwsv?=
 =?us-ascii?Q?LA5aoR95QuqH6AmpWjU7DI6J6zlS6dbtq/R8JLa9QoyoXerLMyu+js81v9pv?=
 =?us-ascii?Q?Fu7gr09fFXKaQ6a/ZmFnMAYGmuhyH9JLhVv0lugX3mGxkKGhwHnNrMzqPTp+?=
 =?us-ascii?Q?HP5OquZ5gNpY27+/JDD4x7+iGn0VtzhRdKJWg+IEe5bDjpHDM3ERXz2+B/Op?=
 =?us-ascii?Q?JMNiMstuNa3nqf0QU2ZeKU71Y0ZPVskqb1ytCp0DcPRGpjAtBNahULNSosx1?=
 =?us-ascii?Q?WeXuDI14OC7zFpcsy7M5nZNpL9rLYsTe33mJT9fTtFarGLyaPh5Xa9ZBPCLE?=
 =?us-ascii?Q?QM+lj918bkyGNNDrvZjsf+CE1M2FXdFwAmQ/wkHSL3d7sauMutBCkB4JkA6I?=
 =?us-ascii?Q?sYAV+kBcBqKbL78nxrU8Aa3Q/pA2zLnaV2JFCHQIB/gP9dExC+ukx1x9MkJy?=
 =?us-ascii?Q?QP+vZpowgErMJwXKTh1DiZ4drrhQFqRGJPCq6CQyQ3vpvyYpl8hAJMp44Fjm?=
 =?us-ascii?Q?x6ZZUqCB4mqdi9edDQ2wsHeZluBd+Bw1V8fcO9frVXBTYtobjqhk7ko5AlMY?=
 =?us-ascii?Q?6A6GzbPIV3R2cinyxp07HrD49v8X/yfgPBTviVELH7Kq0LHirJrFsrjuHmWv?=
 =?us-ascii?Q?7AmQJrtC16EkNfj/8jteRQXsAedRuzIzjZ8P83L5N9UuapzMzhE6kf6hxYVy?=
 =?us-ascii?Q?GE3vTkm8hMZ15yhpboGGLyDlcNkzIl0lL6PaTBga9oiSaMHIFXG0GA/lFAL7?=
 =?us-ascii?Q?uf62ilihLggzbqO2wTUO5w6E+EzusmzgNbo4YLUqsMv52xadrFsIrWFeq2A8?=
 =?us-ascii?Q?YhG4Vw8OV0aRRjtlHRRP/BC/a9rwHtfuYs7qgs1qDsjM0nmNjRn27TZVhizr?=
 =?us-ascii?Q?iQkh8pebicBz4ULzQeOtScH7MOsn2VcyY/OkXpJHYdLWAweyzLjVcLJ9SYa9?=
 =?us-ascii?Q?zpoagvMbIeKdnbKNMVo0MnjeJNG5xvPEmTs77q4a1xny4zne8ZTcqkzXaTmK?=
 =?us-ascii?Q?5ZHonCBj3+xRI1ZwFeRzEYxXcFfYo2N1ARv7O5EAtrx7/7zQiDpNoseViR/X?=
 =?us-ascii?Q?grNdiYuHa7thIV86xbh26LFbeA8BP7E3WorcCjoh1Z1h5fZDBzagskrLkL8t?=
 =?us-ascii?Q?lM/dhnfn1Ug97ChYMiKLEDY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2892cd4-030c-4179-e649-08dafad7f765
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 11:17:50.1596 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zfd4UckC9KiuTTxfi/SeZ4dPC/fI90w3Pe1oFkNrFtwByW93dBzEvo9NXUaMZzyp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V40NIHpliiA5A3ykTujgddv3AMIrqE9LP7KDl8DzWq4=;
 b=FLcOvovXg+vjUmHt4Ar6WkFJ0Bl22Wel/vE8eDOd/MmjSSCq0dOW3l+57hJi20xaJ5f+fh8HZrM/uCTe+1uWYD0SoO8yb4Sdw9tu04887+B2nq4QoskUvVhr5V60k+3ucSCVf+3GfE/XPkeu+taPtFzKYe+H2tioVXjqEg7koJo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=FLcOvovX
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] board/zynqmp/kria/uboot.fragment:
 remove unnecessary configs
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone,

Just a friendly reminder regarding this patch to clean things up a bit.

Best regards,
Neal Frager
AMD

---

Reduce the configs in the kria/uboot.fragment to only what is necessary.

This patch has been build and run tested on a kria kv260 starter kit.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - CONFIG_DTB_RESELECT is no longer removed
---
 board/zynqmp/kria/uboot.fragment | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/board/zynqmp/kria/uboot.fragment b/board/zynqmp/kria/uboot.fragment
index 9e32edfb36..a6a262a562 100644
--- a/board/zynqmp/kria/uboot.fragment
+++ b/board/zynqmp/kria/uboot.fragment
@@ -6,9 +6,5 @@ CONFIG_PHY=y
 CONFIG_PHY_XILINX_ZYNQMP=y
 CONFIG_PINCTRL=y
 CONFIG_PINCONF=y
-CONFIG_POWER_DOMAIN=y
-CONFIG_ZYNQMP_POWER_DOMAIN=y
-CONFIG_DM_RESET=y
-CONFIG_RESET_ZYNQMP=y
 CONFIG_VIDEO_ZYNQMP_DPSUB=y
 CONFIG_SF_DEFAULT_SPEED=40000000
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
