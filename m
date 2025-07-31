Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F55BC87FCB
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 01:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EC7741A34;
	Thu, 31 Jul 2025 01:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2umgrG-3AY8D; Thu, 31 Jul 2025 01:46:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B13AC419E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B13AC419E2;
	Thu, 31 Jul 2025 01:46:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 30D98160
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 01:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17346401A4
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 01:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S9G7MaB6Vy7t for <buildroot@buildroot.org>;
 Thu, 31 Jul 2025 01:46:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2406::70a;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=colin.foster@in-advantage.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 39C6D40F1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39C6D40F1E
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2406::70a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39C6D40F1E
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 01:46:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8XOBoNKsrnjA4xLihzr3ItmN9X8soecy5bqCn4j0TyCHOmdXm8AFFWXgb/g1dH9e/Ff5uKz7tn11HTnIqg8KGMnE23fqgmjDU0R5g0vqbv14tYo25M24Axt9rCvzJniGeAHcUBWgOBnBN5hMMYmzJ5BkKflpiN57Ln3Ncp9ItfpRS2YcNl/i8Y7qOUU6swQ7xeyMnKDyqHPpW4trKVxF0Vq08lMKn4TTzWOhB+Dx5JY8CcLPpKDZAlSAmWyHVwk4bivZ9kiMd4h+l8Cyg45EbyN0qj34ZV/W2CNdjxj0ldwXNsN3SPO2v/FeUGVPH3biBUgfYqh1Ah0BJ3oPmtC4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rk7XvLXu3RuVBX92DQjqZaGCFyHhZrgUCkNtaJCjqF4=;
 b=deNL1msICntwStWxVAB5qLCY6pSGsvl138TWlz2s9q/TZwIItdpG+AU0V4Jlk0cpWxMDaHDVnyybuKd2ye/V9/HF6zE+2O75KSelPr0KmAd6NLbTGuxTqGvsFSm9B81SIAVUA7st1OnwNriwFYiQKMGarEfxNkaf+/E8RmN0BClh1TBxxFoeP6Bm9gs0L3JNNI3kkM3U0rG5Ikonxsxj1IRA7OdmZefka6c0ZraMFP72ObqeWiyon8vO/mKQD4AiZQSy9DSrtpSldtrFJDhsdGfMy9LFtlYYdvCqVrbU6ogUT28nCtyx76XYG3KfSNSPPxi8kjmjgdhgZAJ7QvY/UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from DS4PPF3984739DB.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d15) by PH0PR10MB6436.namprd10.prod.outlook.com
 (2603:10b6:510:21c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Thu, 31 Jul
 2025 01:46:31 +0000
Received: from DS4PPF3984739DB.namprd10.prod.outlook.com
 ([fe80::ba61:8a1f:3eb5:a710]) by DS4PPF3984739DB.namprd10.prod.outlook.com
 ([fe80::ba61:8a1f:3eb5:a710%5]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 01:46:30 +0000
From: colin.foster@in-advantage.com
To: buildroot@buildroot.org
Cc: Colin Foster <colin.foster@in-advantage.com>
Date: Wed, 30 Jul 2025 20:46:23 -0500
Message-ID: <20250731014623.3277975-1-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: MN2PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:208:23a::19) To DS4PPF3984739DB.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF3984739DB:EE_|PH0PR10MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: c93ab3bb-f34e-434c-1941-08ddcfd4123a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2Z1Ja2HdzFEflDelgSNDXHhoix5x6NQMIgSESp4a4E8R09bPBcoNVVccPuiW?=
 =?us-ascii?Q?GG5xvziFmtl2tW3aIJlzqczXoa+yskgd9d5oenXAc6nYdp3PLC4gJtg8XWtX?=
 =?us-ascii?Q?AzVCmeekbFoM1RAHjND1kLv1ah2XECjocuGXPZISiazmV1WZw0nao1KN4w2A?=
 =?us-ascii?Q?YlZhfESQ1Sns5mFbXT5tBZzVRK3hkuMnb48z1BjAWJFlJpDQ2eTONrs9aujr?=
 =?us-ascii?Q?bjZH+j7y+6AxAuC5M8bgEfRP3GdidsNGeEDUJpbPW3pjbz5uvzA0w+7GDd9J?=
 =?us-ascii?Q?HMQ4xO4W4wyrkHfTOYEsX/VT6YhWL9BjJGtBQNXAsxUHSrh48632PTvBPTvx?=
 =?us-ascii?Q?It14ZRCHkmkowbcxnWrpp+mAnAvF/tFFrsOyuD9j/lWXLMQMhE3WkJqiGzIn?=
 =?us-ascii?Q?n93H9+jqqAcHC66vWRum5Ggv7qKlKzJZGTjpwhvCoYmWFXFQ7VdZXd9yzvJi?=
 =?us-ascii?Q?1jxtIFZPSOZs1Wxby/F+1lwQ4jk/1TiVDX2gRJfAjFaqgeUZyoUAabcl9VH+?=
 =?us-ascii?Q?nU2wIH29xQ3DDz709f8NL9Ac3nN0eLlCsDnBsL1csAhW54uNXdJ2/maDRqJ2?=
 =?us-ascii?Q?X1cUlnrJPwdBgY28Mg7TRKf04B9dLHPFsdGvTPcZbEUl8DFzPL3WsB+wueBV?=
 =?us-ascii?Q?p4+esOoMoP1na5nP9CLKB+Ier7EtNBXhUZ8h7o3VqAvVUDw6F1MqZ9oGLGpW?=
 =?us-ascii?Q?rouvC7FXrLx1C26NzHjOPwHGghwrOfj4uoUOfKslMcZFdMqiOwSSFwKJFTn0?=
 =?us-ascii?Q?PYFtZr2JEOIZesT/PJbmwvUGEVTitGpy2XnODgzzFUqfBp/VYYYAp+2xWFrv?=
 =?us-ascii?Q?0KstoRUUs7BeVJ1z8DLLONlnVozAZZuPvQH7qoPyce0afanjRr+kKThtj4n2?=
 =?us-ascii?Q?wfMdktcGbphcBySxE065DYrJnrO+a8ls7gkU+QPrCYfelemCWTFZHjLu6g02?=
 =?us-ascii?Q?ea9wQ0ec+oKR0R94HFHEcMnrESfOWqAlAm+YGxSEG7KEfL+TEo7TfipRfpHT?=
 =?us-ascii?Q?rB3VIU/DuS7JWjpddKXDzbCdKkFQyLLlQBqfIp+ROaXKiyCo6dg4zBuSDOzZ?=
 =?us-ascii?Q?wDS9RYHFMBIt10F/8RRWRzuWcbcLwHpnxrWE0dQpGNDWM+T5XhT+WB7jx4IR?=
 =?us-ascii?Q?nriQw7mUHs0AW+qisaufZWGkbnalDGWJ3+P6zeS21RKQRyO4Mi+EO/DuRl5N?=
 =?us-ascii?Q?qVLLK3L0Re5T2wsCsyoafFq0tiF7rGDRFwf3bg8/wPlElKRsmpEtoZ1QH1bv?=
 =?us-ascii?Q?dOX4csuFPxdZ3jQ+ycBeOsbYgz3mPqJ1bXnGmFuZppwBHUB0R/qCKCeR/KP+?=
 =?us-ascii?Q?sJJ/kUM0nK7vYO+HVhdx8Cpa8vHDTCvaccKRwnjInCQL+YA4vcAjHFYCd2RL?=
 =?us-ascii?Q?XHqweMV1LnUkeQa1mEf1szcGUa1MlON0DxChQ7/FrtGi3+bYEOhgVeM+PKd0?=
 =?us-ascii?Q?Xl26/dpftF8RaL48Sl2KzwDWg2Zega7tSRvMKd66AN0tMYxmAh5m2MnlOzFy?=
 =?us-ascii?Q?9CCQT2YKshP4Dso=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF3984739DB.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bm5eWtnlmBVGStMw55ijIqbphXc4kCiVk419KSp4zbbCivQsR2KOL8xDsdMV?=
 =?us-ascii?Q?iyUcJg6PHhUveuRzEO91nnnuZ4T8wr8694SFXs9yqjruyFss9k6XoFrFIbfn?=
 =?us-ascii?Q?yhr8C0i1mixqf+UpoBiT6YOUv2Xn5ifNVc5psR8R5TxzjYl75H/b46vxiYnt?=
 =?us-ascii?Q?uVuVYvVOWrDtN7C1eLqEAcA7y89LCAFHjHTtQJM0S/P3xrl11EwlzlHSU6ga?=
 =?us-ascii?Q?WjHbGhFhE0SgjQKP8W3xmtUQYZtZWbNk1UrcGGdkZ3z+4hLVYzUQzI415eDY?=
 =?us-ascii?Q?7Tn9f9w28t/VTxuYmTgHRrMxA2PaY+jmvNb4R4z1tKPbhRI2na6PGveVjWJM?=
 =?us-ascii?Q?78xJa+xLx1lQJlBh0Gu6mAs6lqNVGSQ88EdVyONR/7yiG1nc0hdt9oNQqcIC?=
 =?us-ascii?Q?ukk7+O0zhu0SyGJWBXVepHa5k1kBZUgnjgB9ORoLePVh2xNBx+ITcu4D8B8i?=
 =?us-ascii?Q?SCPek4UDm+YKVQoV/EfqTY4PuRsa32OhfFPCBYYr6wZIBwam57rrzVEqCOpN?=
 =?us-ascii?Q?xB/ufOBpP0r5jOtcWUbDQ9il1IKsJlFSgQHWlp32ZRKtKkvipFwmlH/qYmd+?=
 =?us-ascii?Q?Z6Xu6xDf+rfk/iP+mzR/BOak3hgXbJXRL5ghC3jId84ASIag+7ti4U9i/Oov?=
 =?us-ascii?Q?7H/Kjq6qaWlqnJI7tZSmckTvPa5Ctmk7UF0nOhDC1kbDvCjFLD2chx+eqztP?=
 =?us-ascii?Q?EYiUbQO60iH5GgZ8IHCCXGIKtrFwQ2C38s+n5mMA03TrCr+8ev6aU4r0YzHF?=
 =?us-ascii?Q?/LDfiKFxtcnMhJFNwvylsX0kdir/elpmr33G/x2sMgyPaQAPOtBHVQnq0xIk?=
 =?us-ascii?Q?+MHXdYIZsvcgk858yme/6AK2NP8LezudYFuz62Lsmz/JAzTGzqSIlTwT3XUK?=
 =?us-ascii?Q?dAy9wg1nDc5mTnqHSzXNWdOfg+IIibMXLko6h7zU4lTF9NkwTAqUbIfCm3r5?=
 =?us-ascii?Q?aM4lUHbMUtsRn99ZUSeZi7So0l3k6JQ/5zthgsAfcVXNePZ+LPUIqJrcKZcf?=
 =?us-ascii?Q?GRibynPB6oie/YfDyDwRMF+zZSVPNdM4jr5e39JTOiDExZN+cFM+0YumiaH4?=
 =?us-ascii?Q?rr8GaweBaFirMx1t5zUfXGSrysi1wZBl5QcqiggC9gCTxgrfQuB90EPX4Z92?=
 =?us-ascii?Q?4KHcWsDXm+0kC7a8+xJHNCAtBmUiD/KLuXPmRwER8w+hU41vgDfzQoj8Xzio?=
 =?us-ascii?Q?Z+yS/1QImK1AmC2M9t7GlvzlqEmznOpkeIISm2ANMrG0TjMMb2Tsg8UNwtSA?=
 =?us-ascii?Q?hyi2bxAQyhMte2oxw1HsTzhKraQs+gh1SEpP/Zsb5iNL0r9qkA8r9nitxNNz?=
 =?us-ascii?Q?9/rnwixgJUHBR8rsw7wessZ0n1NKcwLsN0QHO6OGGmvlsaL8WOfgE5RA4cBj?=
 =?us-ascii?Q?L3gZehd9wGVE5F+4ma00GhYf6WvfYilsFwOjSB6843uLG983W5jnPMOpapIp?=
 =?us-ascii?Q?XipVRFLcb+/zYOdxgx5fj26petuv2GHKuWz+AVCX9G++r2TD4TIrOlCIZnCU?=
 =?us-ascii?Q?AEc0NBtdZOJcuOeYIjSyhciPjOw+NxXZFzc4fXaRT4DWE+ak/Y6wlXjn5ty7?=
 =?us-ascii?Q?dHbWdZpq7eixybyuRaNwTXg/lRFhty+qEQNIFd6egtzi28gQR2Pxilr7KoOm?=
 =?us-ascii?Q?jJrnLinhv++bxEY9KUoj5SY=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c93ab3bb-f34e-434c-1941-08ddcfd4123a
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF3984739DB.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 01:46:30.7161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRUacxdf71be5OT31wwZAww5XM01szdV+1sp/m6u7rTd87iMxX2IuZq57/C/mNlmVTK5avxgWAHO0e2d0oGGqDBdLHHoKig8bppcM2zJ8D8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB6436
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rk7XvLXu3RuVBX92DQjqZaGCFyHhZrgUCkNtaJCjqF4=;
 b=FD7xJ4rQA3k4qiikZqiucxpqQLXLFIi3uVuoiidkd1/2WofojvsFbz/DSzoq10I6lQc28aZk+CXQsph+EOGNonnJQv2Ya/2wFn3e9/Fy12MB33NEp6DLVpgrQK4hrYPisM0eEju5BUBjzxkAzmozjo5aXEjvAqr0csxOho1iFrA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=in-advantage.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=FD7xJ4rQ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: [Buildroot] [PATCH] package/rauc-hawkbit-updater: bump to version
 1.4
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

From: Colin Foster <colin.foster@in-advantage.com>

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash | 2 +-
 package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash
index c65ead3784..b0833a744f 100644
--- a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash
+++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  42318e96a464e6c716edb45c48bd3ec3b874462973db902fbe099a395e4acb4b  rauc-hawkbit-updater-1.3.tar.xz
+sha256  635da0807699d2efef63e44f6f6563efdb88f2f826f8ad7f8f852473a5416d71  rauc-hawkbit-updater-1.4.tar.xz
 sha256  041234c81fd6fe6c531ea1a886b9e740b9ee06759d1a910a14edbd06f4aa62c7  LICENSE
diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
index da1c020bb6..9c211518d7 100644
--- a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
+++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_HAWKBIT_UPDATER_VERSION = 1.3
+RAUC_HAWKBIT_UPDATER_VERSION = 1.4
 RAUC_HAWKBIT_UPDATER_SITE = https://github.com/rauc/rauc-hawkbit-updater/releases/download/v$(RAUC_HAWKBIT_UPDATER_VERSION)
 RAUC_HAWKBIT_UPDATER_SOURCE = rauc-hawkbit-updater-$(RAUC_HAWKBIT_UPDATER_VERSION).tar.xz
 RAUC_HAWKBIT_UPDATER_LICENSE = LGPL-2.1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
