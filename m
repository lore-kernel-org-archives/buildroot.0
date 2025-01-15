Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCFEC02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 07:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5C64606C8;
	Wed, 15 Jan 2025 07:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TlVneikRNOS8; Wed, 15 Jan 2025 07:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA62E60AE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA62E60AE4;
	Wed, 15 Jan 2025 07:11:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D2B2FB8B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 07:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B302A84773
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 07:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I0-f5UhbFpX4 for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 07:11:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::604;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8196583ED3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8196583ED3
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::604])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8196583ED3
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 07:11:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WqwdSp7R0iyw8O5c/ZcQRTBQ2XBmaS2b93FQOWIaJv76mGGUvF61IZ3svvUnEcU+BmsuNvTCBHv39AKHq+x75aYEtIMbATvCnjp75qwFf/wCfXVC1vCL9x8/bfUh54SQ2nHzHB8lnZ3QQYOqqFVohf+eGoK4xUJn1smPOt5oeBn9eEsnpbyBXJ/VBgzuMWtGLv8BiTAJ/WTOUT0jylJbW/hxjR0MCwmORBwe0Xov/qLWN++MwZH4UxbyDGeGOxU4w2ebNcKLMU44t3wbmP4XfcLmAHLV+XiNk/iVGStbFHwYGqWlPy3kpl+2gSiGMszFK+w/pvAGNXk1GRVQP1ACkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIlSP2Ia291NQDuSs7VfrN2oCjqjFZ1Lrjl3fJ/ISlk=;
 b=tlLHwriFfP4td8UzhXlw5hzdAy/iXCILeEN5yqRQZAuWLjMurajkPO0yCJK5/C1AI6AzRIdYGZXkRC9c+nfd9e3L5teawnMDqJnMbkTEdwqZRt3vueUqwnDJK1kTUntcTG1P3nyUbs8uxqwR52tvW7y+tHT7VzZ2qeK88M0C4pQHDCmkYsIp7zMRmr+/l6SNl7/6Sbjq2xltZxsAGl6yGxJzIgT7rv0aDQrcoYDVioth5wnF9uXojOCCXvIkplAaQB3myj+H5FpN3hVYluG4WcA0vRo+KG2+jTaJ5UULx1rBxX/kj2sHLaS8h2gjcVAuVUo6n99MVRA3A3u1uK0pkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MN0PR12MB6197.namprd12.prod.outlook.com (2603:10b6:208:3c6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 07:11:05 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 07:11:05 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/2] package/newlib-bare-metal: bump to newlib 4.5.0
Thread-Index: AQHbXQCefVnKVtXNyEaTwLvmanhcebMXflMg
Date: Wed, 15 Jan 2025 07:11:04 +0000
Message-ID: <CH2PR12MB50049B67D74A894CDDC6BF03F0192@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20250102102500.1420512-1-neal.frager@amd.com>
In-Reply-To: <20250102102500.1420512-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MN0PR12MB6197:EE_
x-ms-office365-filtering-correlation-id: f851b73b-703a-467c-45a2-08dd3533c6c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?76UoB35RtER6F/F6aOxdd/g+VDlRhQI88MrY1avmpxedF5DoOX4BGJFbcCh9?=
 =?us-ascii?Q?XXADNXKv/W1tZ20stybJzCJ0Ka8xSrpVh97w5JNN9UcoWHkCabDJKUfWY+hB?=
 =?us-ascii?Q?wPLBdCRJuFfjZQp+mrP82pCK74/NToQmrJDWvW7LlI+yHw4+4BQxFl82k4Kt?=
 =?us-ascii?Q?yZ9fNgKqY9CJYv6ouUTKv533a40v6VBe9xbjye2D5rm0pQCRaR3zmn2J75Qb?=
 =?us-ascii?Q?WFdfAbVw5NkvaMJBT8SYgurj3DMFP6+zkjW1WOIP912Zf0NUFKzbVLXybmDn?=
 =?us-ascii?Q?MpwWCjNKrRGsxIaB8ZBAuaEuuWX7Yq7mbznkoShWHOBIlhIhDkp2rbk2Oq2b?=
 =?us-ascii?Q?3A+ody6d2eJjhToCH9BOXQhEk3GUZq10grqgpUPMz0SUejoYj2bJeX2fdM83?=
 =?us-ascii?Q?09qvZKFoUsXGlgS8u5F+CBcWSkQ2jeCmSte2eJiyvLK+O+LbfYwBPQOdJrnW?=
 =?us-ascii?Q?KagwuBPvLtUp/TMXJShsVUI7zF6IXtjCuLYqCLEfQFiKJcnu5qrC7M2bZPcK?=
 =?us-ascii?Q?pp2YV6PoKCPVJAHRUaopNgyqPdqJ2X4ke3OP2fAhPDItIunoTJsTNFi6crbl?=
 =?us-ascii?Q?ipqwgzV+Lz+HDkmtaaoooyfnH3PU/D7qXzmEnDy0XJNsymfcfQKy793cFYdx?=
 =?us-ascii?Q?UrfO5o1c4dVfYBu0UGTy2QkgK7fs5H04wV1kmfVevfdiZsG3u9NNv6tAddCT?=
 =?us-ascii?Q?Df8x9lv1AhD3K7T2zLQADkvj9FQLvJ4YpcjricG+ruA31adZoOjC56AgCCj7?=
 =?us-ascii?Q?2PVJYkNI4nZKs8DW4OPG8qNX6Hhh5I0Sth8s3QuyvJC5KdMeLYPwgtUBm9BD?=
 =?us-ascii?Q?DLTC/A9vALGEjY0p5RCNxFOoPLuHo6CRTTZGTAEZFp3a5CvF70eSdhIeUMsT?=
 =?us-ascii?Q?D1Yh06putXTZGlJizZkcqMJjnzhgzlDlsMUwKUg59oRKjAlxIBd4p1/uh4Hj?=
 =?us-ascii?Q?a8Eybq3QFnDoDYxTq9CF5aMbO0T2WHG1gRorSn6wEUTlhUy+Hdry2kjpof+P?=
 =?us-ascii?Q?MH/hckf2L5FemasP052KPMVhZ7OkOKrX88DZ34Eib6ZQGG2nC2v249dpJFqi?=
 =?us-ascii?Q?SE6ppg0OhVslzMpKHSUuSepxP/FKmTt+JXzUft54O65Qou3RBpdkTSD/9oLH?=
 =?us-ascii?Q?AyQ3ZaiJi1vVLbC2F6bi9IscrwRPSBc5pXppx13EpAJ+ANzz2m4XU8mQrN8t?=
 =?us-ascii?Q?Fwvs3s1xyEAnInzdgi0PMhkUCP2t1B7q9m3JpSx/0C56DSU+wXzpwPW8E9Ao?=
 =?us-ascii?Q?VSSWN8xtBuyZacPRjeBQLlZ514zNmL4h98mUAWb43G05Lm4xh3grqAA4IyDR?=
 =?us-ascii?Q?KFE9Bj5dQ6cYtEODvMp8y3ndXjjI4VbIFt3yT6i8Xz8UpUUCgvnexil/7Xeg?=
 =?us-ascii?Q?LjMAFbrOuQzymUk7lo/7UmVDBUc2HG+mhYwv4tLv9hz5HSzFzfpjUIM6oBde?=
 =?us-ascii?Q?LsBk0k0EIYhfM43R8K19G8c2Qc4p8EdXV5RY0YvZVza8vwNuWhSg/g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?h5Fj7Ayc0tPuKKgRduVSyMRU0SUe/5e6Cc/jSd3RNG7Czk8a9rz+T2CVvDME?=
 =?us-ascii?Q?VibKjQtUuylVMs/LEy2HMSfx6kn0evDekvjA5znLQZcR1lZlkwUm+q4bwUrg?=
 =?us-ascii?Q?wx+IssYgbL4UFukdv5L64dqdcliFjkAxrEhbutp5WkdX84hwr4SEuXvEZ5cg?=
 =?us-ascii?Q?cwkw0M2u37vC2Ci8QILqxuBfzb1O5ZHr/rMquUbfNBQpTvE7mYZmc7Dvk+xt?=
 =?us-ascii?Q?/jph3YLjrSw97mN+Aw+Ab1Cgq3CgmDYcX4ue+wB+bwbEpBq9+Kw3Sz6YUw6q?=
 =?us-ascii?Q?gAnPr9dCsBUKYhdl1UnnHvDrcfy7Lz1syEatgC8NcFJ9O1+/EWXGmub207Nu?=
 =?us-ascii?Q?6+AD4CyYb+4QZmPtcht823GyoiFpsqE1reiTqHoToIn7GEJjlHbNyu89dDdK?=
 =?us-ascii?Q?ezJa8DNLpvlWAvYA/feoOVWUlmAQvKUl/S8gSd96zltxeOdWSlMqA3xCnoMH?=
 =?us-ascii?Q?aiEA0QvFOglaawhFU0J5cnSegA2snD+pt7mXhKCfBwAVYTe2HqPDp8mqLJr5?=
 =?us-ascii?Q?8Rt9IPRmSwi8lT/CTfBR+gSQPTnG01K8Czzey23J2LUa2ZAm2uw+i8H5W0lR?=
 =?us-ascii?Q?snBTedga45G3KqgSI/GIDAUEkTJEPztUTZf56JOzouG660Zll9Q+L/Dtwvfz?=
 =?us-ascii?Q?EjBvbx5waYDgECYSXjTXdrJ0fscceOP4aJ+wS4r1mmhvHRpVcv/1asqNEFLl?=
 =?us-ascii?Q?LchW4SNVIW5vWct28WUGbiMNtxCpuJ7Q4Kns3y+SobY88qTSscgu2pSVO+58?=
 =?us-ascii?Q?NiiTJMIzYp8+5+0SBw++oLEnbyRDT66sBOF8iLGtdljRq2gxQtcqQI6H6V3A?=
 =?us-ascii?Q?cQj2rBnS/xiluOL68ASar+VE93wqn2tbaTjcZAVI9FocO0STJ2wBrkGPz1pz?=
 =?us-ascii?Q?MhBEJBN6o+P7m9k0Cy9wlQzQKFbarbwaXpNNfg3QJAxFz/KlRIdPWptTLE3S?=
 =?us-ascii?Q?IhtK2+r8fuFxBlaHmFc8qJlBg7EcrBY4YaGXDgs+OMSz2+TaB822kE7BHG6k?=
 =?us-ascii?Q?tkWxF5Ft6K8gtTU+wFM2X7vuzKKPridFkLjEabzhva7DlXm3LMXb5Rbk7Vro?=
 =?us-ascii?Q?iGRXFJBA+oxypWYeGPXi0X4+++EAaDpbMK87uY5MMLzWsFZSqbdTW3qxb3tb?=
 =?us-ascii?Q?3hpbs/1EH5u5ade9mFv0YmBrN/8w8FWnqDfID6iQsWQoTMN19ZgAFYEQrxQM?=
 =?us-ascii?Q?7DkG21Gp1xHobrCUTVgssUemKGREJEDGtuGBy2bFRzYmWB9Ngen3qQqXp6Hy?=
 =?us-ascii?Q?SAo/wFC3QpM9qnELCgSj1xZqA76fz4erstbU0t0Zg5hWJIAh5sScI9Bgwk8q?=
 =?us-ascii?Q?7sY9JDaU+GbRS5KcNkaZEBs63ta+PcdIEISuYWGMDtguuT2SJtsaMUfPBT10?=
 =?us-ascii?Q?fy3i6uh443r9N11a3cI/hRzAc7mZFm/jj+puenW/itzdgO5MQalNIM2eYri/?=
 =?us-ascii?Q?XQiLDZkEFdr8g4Nqlarbjgyt1PQoRlXKdrix+sCQi5vh6YBsrtd2jqseSJSc?=
 =?us-ascii?Q?/ESgu/m3dFqQRLz38qnW8GVqZZI+Z44QqqEEzPx455YhBHhk8aPH4ffe2D/Y?=
 =?us-ascii?Q?MFgLTvoVfCnr/48SHOc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f851b73b-703a-467c-45a2-08dd3533c6c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 07:11:05.0290 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OXOdWO7Qj/LAJSBYksT54EW/kQeOWsHpWbYymfsj8oRXSbtFkLuAAsHrs+yBfwcf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6197
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIlSP2Ia291NQDuSs7VfrN2oCjqjFZ1Lrjl3fJ/ISlk=;
 b=5bcLKbtr/G9EFjFCUQClQSiGF2wYFjHx7CiYmv/ndDQzrhE1FqmUTJDTRnJNTr6fZFpOVuIwOO+o4uchUd13Et0aeGsSUfoQkz2JqOTK95b50nAgr4rzy3iF/QQD2rgahGgavxsx0ruAwi7SbD4xxuY1RLUtOUH2PCOueRYIrGs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=5bcLKbtr
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/2] package/newlib-bare-metal: bump to
 newlib 4.5.0
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
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Have you had a chance to review the patch series that bumps newlib-bare-metal
to version 4.5.0?

Thanks in advance!

> This patch bumps newlib-bare-metal to version 4.5.0.20241231.

> The 0001-libgloss-microblaze-fix-read-and-_write-declarati.patch is no longer
> needed since it is now included with version 4.5.0.20241231.  For this reason,
> the patch can be removed from buildroot.

> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> ...oblaze-fix-read-and-_write-declarati.patch | 40 -------------------
> .../newlib-bare-metal/newlib-bare-metal.hash  |  2 +-
> .../newlib-bare-metal/newlib-bare-metal.mk    |  2 +-
> 3 files changed, 2 insertions(+), 42 deletions(-)
> delete mode 100644 package/newlib-bare-metal/0001-libgloss-microblaze-fix-read-and-_write-declarati.patch

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
