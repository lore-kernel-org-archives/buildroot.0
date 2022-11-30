Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512EAC433FE
	for <buildroot@archiver.kernel.org>; Wed, 30 Nov 2022 13:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A528140517;
	Wed, 30 Nov 2022 13:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A528140517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6wGP0ax1YOXp; Wed, 30 Nov 2022 13:44:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCE26404ED;
	Wed, 30 Nov 2022 13:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCE26404ED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F0831BF4E5
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 13:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C7FE81ABA
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 13:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C7FE81ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZMaAivAalT5P for <buildroot@lists.busybox.net>;
 Wed, 30 Nov 2022 13:44:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1F4D81412
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1F4D81412
 for <buildroot@buildroot.org>; Wed, 30 Nov 2022 13:44:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjvX3vQccLsJP6BZGKn/38OGOBLVQ4c5KGxJYJONh0XIEqYgTlPFJrCrDn8ghctD6ffUrJjtTCXFHe4fXbtl23msKbIApnpfosEg4bMnaBypFvuiV1DMRK1hQ+Tu1yqEE9JD4F982r4AJiKtMnVaaWLTnHfCqfDUny+CxbmnpT0/rEv2UDZ/tViCxCRYJ4bobMK+IMoLUppP2/8Ui2HZ1jUAuRHlIwhu1PFEuTYamaTCVIxvZQxGIUxbUSOmwdI9wI3UQ2Dbc8zfNk4k6+baT3B0ff97FzQxnyDnzVILJGlmToxC9SgcfreyYq+kFZB+AlDIhY4Jtiejnbqm60UkAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7BkHBfYdwEXr5GW9KmEIxLpEfTg7qKQEU8MzkqWfPU=;
 b=HRZPmsNbrmmG4JfZoA96FhArKEEw15TXEmI4R/fBEu/F0gBoWHcV+Wt9xpMVqy0EPi4HvAS7K+IvT7YV2sj6mLMou9rfEAb2GV9QITVAdxuNlVzx2pupOgL45KAvRNv1lpQWpa+drJMv8nhk6smAAgqUJrCzisStdUswJzWj3BEtWWDENRVvaM8pzIf5nYtgpvYrdcKK3sxnuMTV+G4zgfrXxkgQVcsT8PBb/FpLViWINb9f/0hfgLBdcxvAgSVhRTntyYlhHkGRIKNMZk2Y/imQNswvoqNHVZl96q25i9P3E6MfCNAVLw0lMmxfi9C0SJnZatdZTVPSbgL+AkCq/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vimar.com; dmarc=pass action=none header.from=vimar.com;
 dkim=pass header.d=vimar.com; arc=none
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com (2603:10a6:20b:39a::21)
 by DU0PR08MB7663.eurprd08.prod.outlook.com (2603:10a6:10:319::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Wed, 30 Nov
 2022 13:44:32 +0000
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::55e2:7130:f584:9eb9]) by AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::55e2:7130:f584:9eb9%9]) with mapi id 15.20.5880.008; Wed, 30 Nov 2022
 13:44:32 +0000
To: buildroot@buildroot.org
Date: Wed, 30 Nov 2022 14:43:47 +0100
Message-Id: <1669815827-23415-1-git-send-email-luca.pesce@vimar.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <AS8PR08MB6870E377EFDB1E28448EBF5581049@AS8PR08MB6870.eurprd08.prod.outlook.com>
References: <AS8PR08MB6870E377EFDB1E28448EBF5581049@AS8PR08MB6870.eurprd08.prod.outlook.com>
X-ClientProxiedBy: MRXP264CA0008.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::20) To AS8PR08MB6870.eurprd08.prod.outlook.com
 (2603:10a6:20b:39a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB6870:EE_|DU0PR08MB7663:EE_
X-MS-Office365-Filtering-Correlation-Id: 46679a87-596b-4df4-559d-08dad2d90280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qx2zSwNQpYfQ9++yBpV6WEfp7gL97af44zigZ4TxHCgEQhrtCSXFXWMGxz/nxUHv4bkkG148eWhQqB2UHnYClzBdNHBwzDxf3pVyMiV8SJphVvjGp5v+qfzWe6/MAQ4vD9I0gE33s5PWeFAu3eRkD0XWFLu8WfTSOBwRpqjXsaXsRL45+8EoRHdxMBqKgpdRAAxOJ7nbLPFocxFespFmTUG8UZXdkyU3x8K3UB1qGwfFLV80UxK6Ld82wHdACvyaeaabK7kIhW10DSj30dUIacq4MXROcaHzBiQq8nCR6yhqTcGabuQ6ksa3M6RcuVRvdZY839QM76kj/47duhhoBku3Otq9LpW2fyoMWbC0QgMHxgjd7UwwgMgISgWWUCKnRR6NEpqQnTEVW5S8gLu8/aIB5SKSs1t7AaiE6G0MaPsjuKAtIw82tirkZ3xdYPzjzDwNWiV8WQWOGCnHSW9UvkvnpFbnGlA0Jg/gln27aQT0LwWNAfJEQEIKLb5/VyH5Fr8GzFXjLg+OHOTS6ucheFqj+7gr+sBY2Kmg2iR097HulsMaIc3ggencUyi61j4UH5fWE/sqLUX4voQdIS67AT6uKx8gC+TrzUopq3kEE8OB2yvJlRI92lonvet4KrJotwljgoD3TltuTjJano5xKA/YCSWXA99BLs/yu2Y4+OWrzzu1oF4/xC2Xi0P4BFxkuV1NV270AEXf+TsiHd+NEqpbQRxxXvenk5Y8p/kB+ec=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6870.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(136003)(376002)(39850400004)(346002)(451199015)(107886003)(86362001)(36756003)(6506007)(6512007)(6486002)(478600001)(52116002)(2906002)(6666004)(26005)(8936002)(4326008)(41300700001)(6916009)(44832011)(8676002)(66476007)(66556008)(316002)(66946007)(5660300002)(38350700002)(186003)(2616005)(38100700002)(83380400001)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K+50IZWGkojI969Ap8XLl3ou74pf21ceWVlTDRpCHrLdHu3YWV1jZRoKUq5o?=
 =?us-ascii?Q?WtLdmO1QCE81Y21oockRbhHpDjD96KqtDS5PB0CqRtlmQdl6jkgbFZKsTCfN?=
 =?us-ascii?Q?WinboeR0IufIfnoLUHCBxoyvthPavTKcZby0acfHjMDtqEZv3dAuS8rgzaCp?=
 =?us-ascii?Q?HN4BXZhsKsleeJWimraJoAEEtt4cot5Dm4v8OKA+EhWEweSCM9VvTWRIXVtV?=
 =?us-ascii?Q?YgjyH3i+wIcY9DK+t77BJ/3lupcDHXIZEwY53ybT82JEOPas06kkhzeyNWqr?=
 =?us-ascii?Q?Gac/vxWeyEBVU2sp/QY20okKodait8+wQl2ln0cnhVAvE2yLGqyk/TguseTX?=
 =?us-ascii?Q?arFEH8n/6djiOb0xZk5F3UwqIamPAX5CyAJC8eQEQq8XGcrsFJ4lOcOmQYXH?=
 =?us-ascii?Q?3StW4DE/B+jpkfL0UeUo2WmDxwOm5evPvINp9vfPTGTxOvjGyHcl5RNBlBtp?=
 =?us-ascii?Q?YDJ+ahBq47WnF/ueWMWU1U/wfZkFADYpeOAfzPGP42RWsctT9o40cVNT4U8V?=
 =?us-ascii?Q?rUfI4V72vSucqpnopE2dmwd/MJt+dtBzGpRR9fWeVgBMhvk38io1/ynAqt/5?=
 =?us-ascii?Q?JdQytGHBIa43YK/2NknRwsO36N4VORCp7lHfJVYS7Nr6NcPHqfqGG3oj22ul?=
 =?us-ascii?Q?HHcihgIwptKeX5FTsr/zfvLGL/dJZQiy2lV44m0nB4fbOAThP/uAEc7ngNG5?=
 =?us-ascii?Q?LNyGd+dUV3ba7YT8iio4vQwmzKPYOfZ7dBTlF3GCOnOcKcd10hQoge4iMqZj?=
 =?us-ascii?Q?SVxtXXyqTzc/m3iq3/0l0bQIHUdJaiPmJLwYCVH6Hx+sXnRj+vEn7ax/Oe6v?=
 =?us-ascii?Q?3Wlpi25QJgbWgDMnurPmqdI2rhCQ03uFjsg8VOskLxfiekQVVJpVp4GGmbQ0?=
 =?us-ascii?Q?awIMGAFOfg9WuZRfMJkF1dDkJOChg4hT8rcstxZye85dtcMIJrnx5woNUq3o?=
 =?us-ascii?Q?038wufXgTzTmRb6dYoXQ4M9A51ze16R+XvZqLJ7BGOiioEeRXC7EOxAs2DUN?=
 =?us-ascii?Q?EuLZm2xRvrr2b2ZhhpnPDLvQoZxdOXkCPL7pXRx3DNy/hqxgAtM98OfbGxfT?=
 =?us-ascii?Q?CU0QdsoEdisG0N9eptlpE4XAO13NROim5Qf606MaqPlrQ2p8EKWjEHq4GaSN?=
 =?us-ascii?Q?kq0QgtjYOeoj7PWTQgV0vuwvV1GXIBjUXlTebo++7AYl6JJSfdfWa0dt8ifa?=
 =?us-ascii?Q?bkZ7nbedCWUtoy2tmLCQVAFD8oJaV9Ryxq83a7ivVtCXGTZSWBFSefffCu3Z?=
 =?us-ascii?Q?4IzxOJPb9MyCzBw5fo4A8GQRFYJHpFB7wD7h/evnVBly554LflBzQn+otZw1?=
 =?us-ascii?Q?WucZ/PApFV1uuB2yd2utDyj7TSysuuvhpS1t3ybuOH0tG4aeycrDE+U6mudk?=
 =?us-ascii?Q?SURk+RuPjyTUSDL8pnzYU3zPSg7qAZXiBYzvqhMvn167fNsfx5117p3y35N3?=
 =?us-ascii?Q?AjxF0/uHj1XVCdZ+9Kxdv6AaxYFD46OWGjmInTJnP+bsvs6qQ8b3hczk4JYV?=
 =?us-ascii?Q?U/OQNYVr6geidpdJu/9DdQYpe5tZycW8XrGfGvuwjfgjlrqc9RGridl2Cydl?=
 =?us-ascii?Q?A3nb6LODPm9lUm3aHHGS+SED3IKafkbCbWXaps8c?=
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46679a87-596b-4df4-559d-08dad2d90280
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6870.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 13:44:31.9453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ja9/kQcKJQaXWEVMZgCKNjP/N0MlRPBhLHPWSp7NJoLDfCyC1YgErTbMF+zVWGA7Smf2OboBlYYTGR6dLtFm6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7663
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vimar.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7BkHBfYdwEXr5GW9KmEIxLpEfTg7qKQEU8MzkqWfPU=;
 b=aEHiGQi7iv/xP9+nf8PJWjPXGBsu8Z7uyqwZ1wa5LIBkwyYeF1su8avM7ykSur6uvl+wndw6CkGQwgtrdmpX5H6YWNEbhYHyUwcvtR7jB/DHhfSYexlqumumBdlYswvxhCX9AY7iJEtl3vCpSmcTOcEsX6ttcoJXdsrfTLYyxuA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vimar.com header.i=@vimar.com header.a=rsa-sha256
 header.s=selector1 header.b=aEHiGQi7
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vimar.com;
Subject: [Buildroot] [PATCH] support/download/dl-wrapper: make the whole
 dl_dir writeable for the group
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
From: Luca Pesce via buildroot <buildroot@buildroot.org>
Reply-To: Luca Pesce <luca.pesce@vimar.com>
Cc: Luca Pesce <luca.pesce@vimar.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Root makefile imposes 'umask 0022', which means that every file/folder in
the per-package download directories has no write permission for the group.
These are writeable just for the owner - the user that issued the first build
that populated the per-package dl dir for the first time (say user A).
Thus, if a BR package changes its version (e.g. for buildroot update), and
another user (say user B, in the same group of A) starts a build, BR fails the
creation of package-xxx.tar.gz inside the dl dir, because user B has no write
permissions on that path. Furthermore, in the case of the git backend, this
makes the git cache not updatable by a different user.

So, to allow sharing of a rw BR2_DL_DIR location among users of the same group
on a host machine (e.g. a build server used by many users, all belonging to a
certain "developers" group), set group write permission to the whole package
dl dir.

Signed-off-by: Luca Pesce <luca.pesce@vimar.com>
---
 support/download/dl-wrapper | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 09a6ac1..b7a4319 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -190,6 +190,10 @@ main() {
     new_mode=$(printf "%04o" $((0${new_mode} & ~0$(umask))))
     chmod ${new_mode} "${tmp_output}"
 
+    # Make the whole dl_dir writeable for the group, so other users within
+    # the group can download new versions and update any vcs cache in it.
+    chmod -f -R g+w "${dl_dir}"
+
     # We must *not* unlink tmp_output, otherwise there is a small window
     # during which another download process may create the same tmp_output
     # name (very, very unlikely; but not impossible.)
-- 
2.7.4

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
