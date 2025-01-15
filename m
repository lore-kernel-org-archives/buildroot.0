Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3F6C02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 22:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57DFC60821;
	Wed, 15 Jan 2025 22:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OLyzqADnQ-5; Wed, 15 Jan 2025 22:07:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26AD560067
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26AD560067;
	Wed, 15 Jan 2025 22:07:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02F88B8B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 22:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6F7341E70
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 22:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVzatvF2HKMC for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 22:07:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.154.183;
 helo=dispatch1-us1.ppe-hosted.com; envelope-from=barrie@iotamotion.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F71F41E63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F71F41E63
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com
 [67.231.154.183])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F71F41E63
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 22:07:34 +0000 (UTC)
X-Virus-Scanned: Proofpoint Essentials engine
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 8F14F3C007F
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 22:07:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hD57ivIMjUtfp+P3c1FyEF70dxMnIcESwWwKaqIDLgpFT9Y0c9kmfA+FOseGsRwXuBmGKNRzdX4hNPmwGNtKGrusjwMkeCnq2dGQe35Tx2EBHQpPWkHinYI7BNL+SB057v9dr/3zLjyjfRoa9vGc8wvExpq64Pl38uE+O00U4IJc7stvCMi3G3Sz1KG2ZtJMmPxTw/PFtTJVX61+KzfXyYPKB87piPHF9soGRHvZXOEaxabQ8cJ6qekPlEaT6BPxk5lQ1S39Az+Yu6Moh+5DcLI0kFR2mrl3I/37sZc72wpEUMe7Dy83O9OVvO1spkmOs4HsH6nYBTJieCy1jj/RrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ms0bZLJYnJXSDngEM8Lc18Od/9RFQpJSGLmlr2bW8iQ=;
 b=Og/bAisc+pdkxSwuGsvqFHpDLzw7Bj2kZDAiCmmRA8upsJk/yx98AbnYMFHySFYwO5Lg/aJSP5p1R5ZLfNYvk9wA6GgpQ6/C7T9YRMUa85OV2XMPxMwML/g8eOgUTYtZTKChgSS0fOAf4Eb5HYWSh/QCnOStjO5V65tmieh8dai5+1WHQTssyP9Pfe9WygKX9ZwUCtjt2Bq1tBt6KaAsUpEVLZdSPrpXJsdR+CtF/8YQEN4DwErCoiF4YWbpQncYCKIaEApE4lXp71i/zm2e+vqd21iL3wpmAMdgfr6XSxgqMQ8fxq29ghoXdKlgDgzxCeySFXlCeXcEs/58LhWctQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iotamotion.com; dmarc=pass action=none
 header.from=iotamotion.com; dkim=pass header.d=iotamotion.com; arc=none
Received: from PH0PR17MB5727.namprd17.prod.outlook.com (2603:10b6:510:a8::22)
 by MN2PR17MB4079.namprd17.prod.outlook.com (2603:10b6:208:20d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 22:07:29 +0000
Received: from PH0PR17MB5727.namprd17.prod.outlook.com
 ([fe80::5a1a:1acf:260e:89ce]) by PH0PR17MB5727.namprd17.prod.outlook.com
 ([fe80::5a1a:1acf:260e:89ce%4]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 22:07:29 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] docs/manual/customize-configuration.adoc: warn and
 give workaround for surprising `make savedefconfig` behavior in some cases
Thread-Index: Adtnmc/h9rzdCjn3TvuCpOysqm38mQ==
Date: Wed, 15 Jan 2025 22:07:29 +0000
Message-ID: <PH0PR17MB5727DE48E5AF3DD83CDAB0F8B7192@PH0PR17MB5727.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-codetwoprocessed: true
x-codetwo-clientsignature-inserted: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR17MB5727:EE_|MN2PR17MB4079:EE_
x-ms-office365-filtering-correlation-id: 03959d56-81a4-4291-f6cf-08dd35b100fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?d0p95JsHmDaY3bRb+X8RywORCsKx9w05J7x9PmByXktvGhDDRtOetFDAInUv?=
 =?us-ascii?Q?umFlhg5LjIg5FEvKFzBzDMhbeiBLaeBnoUilyBvq2tRbvFArjFP7UeA4jZNW?=
 =?us-ascii?Q?aY9xh6m7qmQVhKBPs5H7+xj6qoFpGvibYi1gOwOIslTstcJKeN8pqaJJ5qIN?=
 =?us-ascii?Q?4Ei0/50DKe8VkT/buNOlmC9HysXE0OxDi2N7lV+jScYv7F8sFk2NZxpyOqAy?=
 =?us-ascii?Q?bQR2xyz3VcIP+uNqwbPvmQZMKxilWb8p/EokBz9GQus2pZln/JXb97AOFu8m?=
 =?us-ascii?Q?Zk8ylOq69Lg9W2CQSJrs0l6vH/WRDWoljkS/Xlh/fYXNKRNw1DVqVysuOyVR?=
 =?us-ascii?Q?xMPnlaLpUSibsuGOckp5p3eHk/p2d3kBXNyUp9PdNlXy81F0u7RU10UfbHZH?=
 =?us-ascii?Q?1pl5ErWCdK4TSMzD8QB3pWUXFj5thV3Y5mjOTJiV0w0/v/2pwQgb6lm6gxHv?=
 =?us-ascii?Q?jWNrVDwhCUAjsPqNXSQaCW33BQRlMN/RcE0TVpwNb6lv26foqtiShGHq2eLA?=
 =?us-ascii?Q?SkajTmXctT1oSoruDRFZbxCl/eR6+cI9vH8AA38QTAZu7WHv03fMcE7m3MXB?=
 =?us-ascii?Q?WdJFdraOGS3aSHZKWa9I1HF2EoM7d5ewF/PAaATvhdlKPaybYoDWfcA8044L?=
 =?us-ascii?Q?gSvAg+/t8IgtVBYloJovc3Sv6polIQbwRDsavv4QGNMTobbXYye5SqSlTxYm?=
 =?us-ascii?Q?AGw6vCWRmGhQH19O6ihuo1sf+BVcYwPRA/ylSApt2lO2gjWJIykHClq59UzY?=
 =?us-ascii?Q?Fgr6JAqOUxVbVQJGie59daHt36AbeBoQEiwV52yqN0S0m2KEEsQ1KcTtd3Wi?=
 =?us-ascii?Q?Jr5UPHgP7ZFdWl+R8vkQ//YISsk5M2QEKUEMP+UMwvtphSe1F0hFMZFdOUnK?=
 =?us-ascii?Q?GEvXhgN1xfAMc23Ksp8ORxQFoaj4ICLa6VQfAzf4Q1gK+mv0sr2A/iLBiUFr?=
 =?us-ascii?Q?z0QVL52+xZkVNc3FSH2kH7mJX/UBwe6yWfjZIy+VL6NZclrkm+TJNoKzgSKd?=
 =?us-ascii?Q?9mjPRqpXMCMopFWHAxgcGwXqFy0PpvNeleOcEnwpmaZfrOmE9bheXoSFdJLD?=
 =?us-ascii?Q?ssjzGG0q7mMuRb7WFKDrRJQumgsBzlOILDLoFPDHOH+iVNJ0Qbc7efFdyjoW?=
 =?us-ascii?Q?3MXrACgM0Ujna6dg+neKjVGzqEtGGtoKa0U3OkN6Ap+FfA6yniAVBGeGOhv0?=
 =?us-ascii?Q?bJi0Tk3eCcIRR3gbjpjfPb9Act/0V7nrxq66rO3JEujoHT7p9x5dVaYU96ED?=
 =?us-ascii?Q?R5eRmyV6XoZAQ/Z7kaqtZBhspcHYQ2o7ER5wdPiJLXheLVg5MpZR7xZl1Klo?=
 =?us-ascii?Q?QqYg+fiplXuKUEiIicqHthmFDhpCVw4whgs1TqQcuYClidBWhGLC7SN529zT?=
 =?us-ascii?Q?wgn2fL3tSnWsaE7cI4jJxBij/X7YzSiapjiPKFXrciif9tWNgGFHE3Eozsnp?=
 =?us-ascii?Q?lyhLWYCZmO58YADrLGnhlvyrsXcomBIT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR17MB5727.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2Q7fu0X+StAI2VcvsaGh7sNHUTd2jZCrfIOWovtB1nEDCWyRD1LFK9+UfpYy?=
 =?us-ascii?Q?gkAEbkEWv5Q+pPpAnO4O6ZXBckWYqGVIDOHUya6Ji8sXkYIvm89rOGXabBMA?=
 =?us-ascii?Q?nfpbWxeRiC3agGjgqaNBXXzejx1Mypv2GLfDI5WE9/4Om72f9fM+L99E+xEr?=
 =?us-ascii?Q?rpIwxnf860YJFVRj5fqW+uRlycsIfCeffVOkUlz9XIzwFBLwTl2Nyv1olg3I?=
 =?us-ascii?Q?7YJLDg0oPOz0owf+PZj4JhUHaOK2VMfiQ5+/X19Ou81JssLW/G9f4eGrynPT?=
 =?us-ascii?Q?CkKEb2kmRMZBHb8GfMtn0DwOpwyVdwXyuYa6uRLFFQ1B+epphiC3xNaRLo8y?=
 =?us-ascii?Q?VhSXG1fZAVuUfq63in6LgU8I8S5htRz0YmsTlqoywuOB43lnTk1hcHn5mANq?=
 =?us-ascii?Q?2Gbw3tGZTGCGYBqUPT1MKiOsNYbd8gTF+lii3KMVPoncGmLcBS1+A42ISP6j?=
 =?us-ascii?Q?XxsDH9mnMEXZtvdPDH8FHIV9RPyXk9c+Jw6/9nUvfL62J8S2/Gzx3uEpciil?=
 =?us-ascii?Q?aQpCHGbbAQs7/BIbIih7LZw99mHetvlSUqVi6zEUCflf2s3MsJa0/N/cyz/r?=
 =?us-ascii?Q?6e+sLj5RkMCouJJsZJ0kcWX1kGszcVZnSoh3ks+7b9mqrYjG9c/EesqI7irK?=
 =?us-ascii?Q?ejHZa3ttzcFMfOE0i53HGWvHabaP5e0zAXnjwCgKKFZacykTKB7/C/gZe9lB?=
 =?us-ascii?Q?CtQFiElMLDPYbhBTp5CrO/dO11nvKvDPK6k+SD8uJcBeXYzKCX1T465SuLqT?=
 =?us-ascii?Q?dB/hHSYTv6vdPNPxCjINnnzdwSBGcpuE9C4eufKRxLe0havY+4VB+KEcGIit?=
 =?us-ascii?Q?Pj9xOTXEb/hvAqIXpo+Uw3gO6tgFt8WrrrxPnrLcII5tp/+h5HgmQuC8xIOs?=
 =?us-ascii?Q?InDgmbtMkH5luvhsqCWac/EsnUerz/v/R3CwrQwRIp3pIuZWmNa9e4etk2SJ?=
 =?us-ascii?Q?hE5Rpe22naJDG+x4DM8O+nxgGT9wevd4Fyf08skNQ8rmmq8VzAxvpFGHH5z5?=
 =?us-ascii?Q?lZQ5QCet0m0vWyTK3OOCurV+nAoGeCb5LvDSkPnCRG/3j91+rqIBUzIqHYc/?=
 =?us-ascii?Q?rA2/PKQFYvB1jGgO/U3eO/u6E+Kt/F4SQmc7zoFrXR755+FAL7b8x/vmH1cR?=
 =?us-ascii?Q?B/PEyj7/jzgjx0yR3FMFFBp5nZp8ZhMJZi6IPfAvLvPJuZP1lk1en+ktMLQQ?=
 =?us-ascii?Q?wyMEUhioafI50is6Hga0YIJoRQ2kZeJDp3hd8GA8gOxjslNya6GBL20HDhAy?=
 =?us-ascii?Q?GxJt1w3PB2m+FyrIDZcd1gcntiropYDCPf+rihK8aRPYz1Ls4pxwcj3EE7bv?=
 =?us-ascii?Q?Uupa49Hcuk6WSjS2kZjTuOBdHmxAMTDNZnpiNWeK9UbNMvLdFIECY+5y671e?=
 =?us-ascii?Q?toGJ6r3+TTJ3s4NwpSutUFNRN2eGWRakF7k83rYmhU7ldSOT0lX6BLkHclRr?=
 =?us-ascii?Q?BxjL3nO+IgZAPfPZCVsqgdAcs93RvswI7iqDGtOccH6Q9/bxZryLR4u4BqI9?=
 =?us-ascii?Q?sli3GEHM8k0QTvuoJNYaVtrUArvmeiOJQUIU0SdLqnjQ5hrxAo+kC0B2UJJN?=
 =?us-ascii?Q?OMeVEsWDYokRa9RLaIw9/XcfoO+rhzPk8WiYsVKr?=
MIME-Version: 1.0
X-OriginatorOrg: iotamotion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR17MB5727.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03959d56-81a4-4291-f6cf-08dd35b100fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 22:07:29.8291 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1772dc88-4660-4648-b023-2c36168356de
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7CT/UFxpHoAuPf2bOgWXi1810fpW8sFMJ/Mk2JqMcbXJUyqQkQuO0wMHXGNtOJloyfpCdB0CCq/TwBsrzx5ZbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR17MB4079
X-MDID: 1736978852-rmFRZKbmg62k
X-MDID-O: us1; at1; 1736978852; rmFRZKbmg62k; <barrie@iotamotion.com>;
 ad4067ca35f154b7961dceddb54358b6
X-PPE-TRUSTED: V=1;DIR=OUT;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=iotamotion.com; 
 h=content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:message-id:message-id:mime-version:mime-version:subject:subject:to:to;
 s=selector-1702932271; bh=Ms0bZLJYnJXSDngEM8Lc18Od/9RFQpJSGLmlr2bW8iQ=;
 b=L6cQt4drlnRWEONsUIqAxEg5ZA7hl0taSxKntjw4odhyBpcANuvLtUA7AJI8C8mBFQtLCt10pYA01IUFjbIfggInYRb5KP5t8Sla/cVy2QpJdJICQdc/6gNEsOH7SuuQmFkX9Toin/mxIAhmADmeGtRZn1+X7bQJq+65QFzxQI4ZOv+lDbG7DR44nLaO9ohvSNoCymM+SIXWmMrNqaK0neO3HwgVKVxRsfAI0OO50wFe/uBeVUxev5YWBTwaEw+eW+61q/kDebTYQ9MsA8ec4cB8QfZgcNprcCv4PujvugXHl3AuKUpsJIGO6VbB9HEjb+aQaKs/cQT1rSmlDmp7bA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=iotamotion.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ms0bZLJYnJXSDngEM8Lc18Od/9RFQpJSGLmlr2bW8iQ=;
 b=pfB8nhSls6dGRQFo8ZhyMMLeLPFp0C3kbP+Ibuu6FtKrYxvy5z/BceO7nmANxoOBWP55zDalc5v1+mM5xs881PZWVIKHWOMg2BpRJqpxM6j9DhEKCnaUbL5kj12zULebWQ2ig57JA2pscOOsZfpLbnFgct9KsconCxWQi+vjOSoGdyn76zSD8S/MWJOua5ISelOLNm5rX32C08qVQevEzSj2rMhnycaKjTuIvLwXIx334KNtKvpMJmyXGU/En/5Ct57Sf2E7eJcqqYN0pVRM2U8FjxZJXVQElQDn1UdfnptRznvNh+xi09NzO+odfNULtaBZGEak9zjwdCBLSRfdxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=iotamotion.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=iotamotion.com
 header.i=@iotamotion.com header.a=rsa-sha256 header.s=selector-1702932271
 header.b=L6cQt4dr; 
 dkim=pass (2048-bit key,
 unprotected) header.d=iotamotion.com header.i=@iotamotion.com
 header.a=rsa-sha256 header.s=selector2 header.b=pfB8nhSl
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iotamotion.com;
Subject: [Buildroot] [PATCH 1/1] docs/manual/customize-configuration.adoc:
 warn and give workaround for surprising `make savedefconfig` behavior in
 some cases
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
From: "Barrie Slaymaker \(he/him\) via buildroot" <buildroot@buildroot.org>
Reply-To: "Barrie Slaymaker \(he/him\)" <barrie@iotamotion.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The documentation does not mention a behavior that happens when using, then saving e.g. configs/pc_x86_64_efi_defconfig. This behavior can silently "corrupt" a built-in defconfig by adding in a user's changes, so at least a warning should be given.

Signed-off-by: Barrie Slaymaker <barries@iotamotion.com>
---
 docs/manual/customize-configuration.adoc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/manual/customize-configuration.adoc b/docs/manual/customize-configuration.adoc
index fa8f4546..b1be5f17 100644
--- a/docs/manual/customize-configuration.adoc
+++ b/docs/manual/customize-configuration.adoc
@@ -13,6 +13,12 @@ called +defconfig+. If you want to save it in another place, change the  +BR2_DEFCONFIG+ option in the Buildroot configuration itself, or call  make with +make savedefconfig BR2_DEFCONFIG=<path-to-defconfig>+.

+NOTE: A few of the files in +configs+ set +BR2_DEFCONFIG+. This causes
++make <boardname>_defconfig+ followed by +make savedefconfig+ to
+overwrite the original +configs/<boardname>_defconfig+ instead of 
+writing +defconfig+. To prevent this, either unset +BR2_DEFCONFIG+ in 
+your `.config`, or run +make savedefconfig BR2_DEFCONFIG=defconfig+.
+
 The recommended place to store this defconfig is  +configs/<boardname>_defconfig+. If you follow this recommendation, the  configuration will be listed in +make list-defconfigs+ and can be set
--
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
