Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340A9C32771
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 14:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE99560E31;
	Wed, 28 Sep 2022 14:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE99560E31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OoFaO5LO8oix; Wed, 28 Sep 2022 14:28:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 050B360E15;
	Wed, 28 Sep 2022 14:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 050B360E15
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 978141BF368
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72A768136E
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72A768136E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eq357KHyYCgn for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 14:28:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C195813FD
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70045.outbound.protection.outlook.com [40.107.7.45])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C195813FD
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 14:28:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nb0ieazswqgY4oaJgJC3kl6d38KeCsyMXdvPIxcofmgi8XcqBhB7t0XxZxKd1j+MSDACdrMowa/jO0eX1jWA5X1XqBlJ6mfxCFfflgJW0cS7NzByGNGwoOAvu7V5DSCNHlxbe68A1/WU5RT8sSyMPmHAU6q11JOwFs/hNcVlJ9PX7gV8bCU5PFEMlrP14fD2qLKj4uzV/jx4oC8E73KyYikHXeTgZ8j7ByZ1qGS8bZsq1oFcJ6FZMYRq0SsKVlOb4NMQS5FhZnFVCLX+/Dc1ckwu1GiNn15bbDjG5YwU3ZDha+eb46eUYybw1Lv+HCX9yIDWNeTwZ7QO/esfJuXGPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOcKiLSuYGiemPwdimwUTZ8CWASXfFph3oPVYX/WR58=;
 b=ANvYg6iAovi4CYKC6LC2Jb65Dg/jqe7HdLuDRiEBnkVdg8z5prDrR8tm+gPljCFNsv/qxLUTAptq++G8Lr2Q+quHt6SQMTw/ZolyZIiK07tz4XJcGxoMSeHgO/9yMp9p1bk4tzVqoOmILt5vutI1PweWpXX2Vtmt01f2RlaQIxjmqJbPaxKUZl+tAbsqpKa62mNBlwl1wS6CU9rR3ljus4l7uhqZn5+PJVVMsFKfOQILpYbKJY+cK3lbI2l40FRSSbmPTBKfjAkDS5nmqvPGK0wUGzjSVkglFwfYWgdf7C6vZNgXwMX5M7BO+XKSEhiromWpUJ2dqnmWFyRCJBUyXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:32::11) by
 AM7P190MB0776.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:119::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17; Wed, 28 Sep 2022 14:28:50 +0000
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b]) by DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b%5]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 14:28:50 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 01/11] package/llvm-project: new group for llvm packages
Thread-Index: AQHY00V+dI/nNy8edEucNMLkuEobrQ==
Date: Wed, 28 Sep 2022 14:28:49 +0000
Message-ID: <DB6P190MB04888B252BBB257A4468CCF19F549@DB6P190MB0488.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6P190MB0488:EE_|AM7P190MB0776:EE_
x-ms-office365-filtering-correlation-id: 9afe9aa1-9f6f-46f7-7f15-08daa15dc301
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pU/53vUe+v3eX355g0ZkFq86o31YSEqBjov6lABmGlhBFnid1D+KuNOpJwvrFZtFQWYWO20+d2xb5hVcaQTXFbnwyc891sAI5d3c5KUSFam0Rkp5S66CgbnkyvsrIxlnP3p1Dd2nyxpRu0c88t8lk8JQ6Rj5zY7Jm6RJAFOXf3njIL/m0wV4Y0wy9y9U5Qr6nKSWazMUvGAnH6FYX6dMno/phqLzSPeDxKvVyFpV+pJp92CNuocNzR0iXpAnRksuotoDKjZnWvnSsglQRfek4GhKQofQy+0ZOtDEIuO0KsqdYYG2+nSdZGAi763ktwivCYiH50LbOFYCDvxOmbFNJVKeGEQXyXmdat4ENpdeGKgrU44f+onW8KKZ/64qn0DR+IVWxdouvWsgVdusBlSG8Zha+6NulmUaaRVuigNcVWAqTUsn0yBovBFrtiU/MAnxFIawuZeM5QxzsZbNkbwyEl6/6FZcXc0erJYZuQ6F3CC6W5qUjObpff39dGsCEdXMWuVEEpuAFAHWj3yU3ED4pOXYDwZz1BRTOcPtp4ss8x/60b0J5xsRnEuc9Njr7ygAsqMCer68Y/vwklYKAw7V3ShzeUnw/xlQ+HrnZ3xamlyFd882UdkaUFq/WKd/rH/yusz75e/siWXT2Hncaqb/fbzrLWj2BUIhuQuT3s9vbajMmUQcOdqEMT+gPE2Dr6aLB9/uN25gKz88GtYqat6JalpdGeW4WbsaD3Kdct6010XHHmTb71fKf+8PS6HAV8IdHZDVinImipbcVNY+6YtELCrr2lphch698x8/9d3Mt1Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6P190MB0488.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(366004)(39840400004)(136003)(346002)(451199015)(64756008)(4326008)(8676002)(33656002)(2906002)(316002)(66446008)(66476007)(41300700001)(54906003)(6916009)(66556008)(66946007)(76116006)(91956017)(86362001)(7696005)(6506007)(26005)(9686003)(186003)(966005)(83380400001)(71200400001)(55016003)(478600001)(38070700005)(122000001)(38100700002)(5660300002)(8936002)(4744005)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?iSF/EDh/fyEd5n5xPrw7l2O4EhXH3FXy6flILFfE0fyulee+n6yDvmr6zA?=
 =?iso-8859-1?Q?v2G6kJ/O1YYaYaB1f4ezb+91mwKxr/WUQL1sTWPFxAKKM2YT1NfPCQLU3F?=
 =?iso-8859-1?Q?JA2DRlLVBCopWqFMTWnpHDVvMq59GCXA5URdscqFuIGwiC9hhqQOwrBVt3?=
 =?iso-8859-1?Q?iymykOxdDP7gm796vuuJo0wDoMpXV7vmNlXFU2FoAgDdepWErf5fbvqjrx?=
 =?iso-8859-1?Q?xM8eaDafEOUu9Ydlrc8/iYXj1RDDgm3mMsV4xpA6oJlGU4qdBfTtG2tcsE?=
 =?iso-8859-1?Q?AmRq2DfcwACQR12XRwWf1Z96KymlVZjK0Mqw1MhJvpXt5p1TZ8ifNR00jO?=
 =?iso-8859-1?Q?1CcrDjAC5CL/FO8YGbgcSYOVsBYuzll3Mi6voiUUAumPP9M05WWH3UyGT2?=
 =?iso-8859-1?Q?SDefanJF9khQLZqiLjb5JJpV3ceUjPBcUsZx7dZakjE9cw335+znROqWUI?=
 =?iso-8859-1?Q?I/UeYubFJkIGr0spIN81E4JTDawAromcSCKArIguvYSMP2/ZKSVmy6ilrL?=
 =?iso-8859-1?Q?WWdm9N+ony7q+XtUW+JcVA9qZ7hdNO9QyddWETnpUiLfMBJWDXbVqQb57k?=
 =?iso-8859-1?Q?x+vi629sUlPT342eP3iK9LytwIekUN4hVWZphj4szXYre/YrI0SNniQO57?=
 =?iso-8859-1?Q?7uzhy533+8VLyX7SwpL/zVC8kVAeqn31OdeoqzC/iZ3xJfYyTn9CVPfwC1?=
 =?iso-8859-1?Q?S7xC/rME0O9zCqS69JyLrEjMA25uTwLnvFsuXQy9+77WhcJzQoERLzX2KU?=
 =?iso-8859-1?Q?FcUtL+3g5WI6x0HgRgWh/u0EPUj9OW9raDXqSY28nlDWn2VDX8p74MjShW?=
 =?iso-8859-1?Q?D7oOXDZoSOWtAm9owCeBkKOjxd1QLIDluzdBwvBX8DBYVd8dEy4svSJjRU?=
 =?iso-8859-1?Q?MuKMR9OTqcOPLb0DnqlCPcbG3fUJmoS6xi9q9MVCLSNtxsMARNmeo0DDvJ?=
 =?iso-8859-1?Q?yAws9YnGgFqMwVgBfiedv9oXN/MCPRYha2cw+V1sRjoZKgww/91Q4wQDOO?=
 =?iso-8859-1?Q?9TK2wwIcjUFZFT0EYy3yAkX1uQCTEck/DDpQfI5JYNjXMNE7uYnYPcTUhl?=
 =?iso-8859-1?Q?OlmTY7qa7/Y8ogG6CO4VSs4oOZ8MObtYBcsyFaMuDPpc73w9PewT17VcBu?=
 =?iso-8859-1?Q?lm63TmAxqjB3GroFyI2zFsMzaqdhfJ9HSAmi8kZoyg2F0ttrtaTbxr4aux?=
 =?iso-8859-1?Q?THipwIyh7+L0sVHfgjJSAUxSM5IXdSZhaBR5UUQiH+NdhE2OBWYN80WGpi?=
 =?iso-8859-1?Q?gGL7k7m3cKyVd6brqAQzoiATeRzZu4PvHxNxlgTX9VMATQVTyXDOCBKN9e?=
 =?iso-8859-1?Q?mRO2m8RhCLNt7StdkA0UR9DCKV/bYuxMw/uCtZFEYpNUgti6HZCdomnxnW?=
 =?iso-8859-1?Q?kqGVsUed4lPjoOIgl6sPcVfE4qmGja2y5HFzL67eTT1WSbjH8qjeRaietB?=
 =?iso-8859-1?Q?l5kF+zAo86kbjF2bRdWcEftgARVqT2UFhNQzpFcSPVxTBp+S9I/39SDnLl?=
 =?iso-8859-1?Q?Sayf5aIryr99Wbu0Y34G/93ffSk7+icy/CrHf3kmj9sWHDvJulg037esRz?=
 =?iso-8859-1?Q?TM3Vl8J9irV5P4nh8QN9L0ygwWVRXzG0ZuwJ7RjLPXFhf2loME43PZ8oV5?=
 =?iso-8859-1?Q?SPGwcWTFx3sC8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afe9aa1-9f6f-46f7-7f15-08daa15dc301
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 14:28:49.8594 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9PHyT41OFrkayxYoCoZjFxMAEDLm30W7zX4xt7ta2kU5T/hYcFjHIQ4xzWLsES2EZueDiqiE0Goxckd65xeehQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P190MB0776
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOcKiLSuYGiemPwdimwUTZ8CWASXfFph3oPVYX/WR58=;
 b=4nDk0wcgLJU0Upm/8nsLY0tqK9MTwJPbWNK3fW/6DxJbZNXpJtItyPQNv5fY1Z5oFAGy6gzAq7WGxNmlKMyggK0TtU4evArqi2ppxCLlspqshOdTg5rCygmu4Zt6K0r1WbdySKXx/jzfUfaP7ug5pjB+hFDq0hQiQOHauwX3A4A=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=4nDk0wcg
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 01/11] package/llvm-project: new group for llvm
 packages
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To make updating easier in the future, group all llvm projects in
one subfolder and define some variables for all of them.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/llvm-project/llvm-project.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 package/llvm-project/llvm-project.mk

diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
new file mode 100644
index 0000000000..7ba89bb605
--- /dev/null
+++ b/package/llvm-project/llvm-project.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# llvm-project
+#
+################################################################################
+
+LLVM_PROJECT_VERSION = 11.1.0
+LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
+
+include $(sort $(wildcard package/llvm-project/*/*.mk))
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
