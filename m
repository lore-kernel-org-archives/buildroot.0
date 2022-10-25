Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87D1C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 06:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6156F40333;
	Tue, 25 Oct 2022 06:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6156F40333
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GJXXQjcZQVdx; Tue, 25 Oct 2022 06:10:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D634A402C2;
	Tue, 25 Oct 2022 06:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D634A402C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3DE5D1BF2BB
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A49580BD7
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A49580BD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 471hiSe2x08f for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 06:10:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3575E80B98
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2052.outbound.protection.outlook.com [40.107.20.52])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3575E80B98
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 06:10:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mH7s51naqodTzp+GeIFAr5ytVu6UxfLzq4g3vObwyFSW8TqOLiDqVjuthNO8GoPrFW/RDuI7Zjf/qvI4cvehjXHM2ZCNGPXU6QEvDMha2jxzXMbRDBK1mwl/34RDT7w/BUD+TzuB08r+ITePPtaMVEAeE5UToawY41DrXhCTEEPAY6AqgNw5TOpMbG0H/ZFjakJrvOCEncZ8DhUv3nkR41JyeaskbVx9H8Gap2cpqQKMM+LjUPjcZJi3rbKgYB7q4WXF6cEPDEccsrOb8TalXvRGi+d38RfY3ofc3JN4ZFBPqHVMX5teUTdQVBGAH3fa56Os30LimZANkvG6bkIM1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAKDWXC6hQ3gW5NSRbLMUrTUPxKTJoMk59wfzVeu/As=;
 b=HVzfMcPz+AES2DzUI8usGD8EMkwm/n+/WnaAq0cVZzl9ygfpeDefO/OLdt+96eJCu7eNA6FYXzvBWRIff7Osqc548J9G9S9SQyTUmSgnMfjfrprcTG4tYQ5Y9x5/TiMFbZjvTRW+pQ8UxKjodMxsYx112AVgFTsoJaZ7FFetmTZ1Mbvde1RntexoHDPMuJBB9SPmm1nwxO1IVcU301rV75Wt0h1ia5djACDhHqV2+Oh4vsMIQUxEnUSr4D6vCSM8dSuFMwdKNvqqjm3NlTfQiR5RmU0ePl7xdMISbflnb3kDkdMv8qdccPzCKg+Qr3KTqTBbfrkJzYeRbh9KzB9nyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DU0P190MB1803.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:34b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Tue, 25 Oct
 2022 06:10:16 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1%7]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 06:10:16 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 07/11] package/llvm-project/llvm-libunwind: new package
Thread-Index: AQHY6DgYiJtr+w5KjEK2dNO77pkWaQ==
Date: Tue, 25 Oct 2022 06:10:16 +0000
Message-ID: <VI1P190MB049330FC63A2E74B7886D2A59F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DU0P190MB1803:EE_
x-ms-office365-filtering-correlation-id: 26c19157-162f-41e1-b640-08dab64f95f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vkVALy9eGqe+Rhau6j2xPith/XZd9SIb12yCGR+mL2CDGkwnLDaHx5WZlN6p/dUptdCvoKxgJlWOqs5gJXvbcqaL3TG3RyIUf8Ap9oNSOCq4kQSmtolxzJVfZ63U2PyxgsX/0HDhSmnnb9tO86BkZ+y2rA149ghZwEaBRejHl/TcOpfkuaXTU0cHTbaTxOSPWA2zxs8JeDnG2rRdfE7+wVQLcJ3QxsJP8WYCfUFj/GAOPIdtMAwbfE3kQMVOfvlXvUe5dxTf3PLk5ty5BtkNMRNwCqRnBpf0zpGaj4lqy8JJUa5sBCOSvy6Hkvdy543StO6iCCylfb7lUUPlkitIJstvAMhP1wSfQff4Y9ATlbXCQ0/tqX8Joiri9aBVwBvls+WW/DIoD38YanMPLcYiQ8veD0uS5McRGxNc52WPyaodFusLZl8DO1qMTyRqFWLeAiS+i+cwuPIW4To4bIihwOQ8gNge8m24cfIQc7RXWX28OAlIEZlx+hpx3HMCS9kY5CVusEf0gcV1a5pUfUUw7iYEVco/8DBRxFzlrCQAE1thGk5fFaUpAg3x6w8z7QxIZ6k5C9Khc9JIuNp5s74qhmBpZZnKCndCrDxACDHsyDW7hCZjmOpmMsE9fI2mFsYkCZCWXLW5zG7ujxxumb3LW2iK+yc9A731H81JGlGkAeS8rAzJvz4iAgCteZhqfpwwTNsEuZ5x34d4r38/4lcYx28aX1ZoudeooOf/miwvKABsEtZ8blcgW8kK9rNBflHJDx+coDbuDr+4t3WkMDCSJw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(39840400004)(376002)(396003)(346002)(451199015)(8936002)(41300700001)(52536014)(5660300002)(9686003)(6916009)(66476007)(26005)(76116006)(66556008)(8676002)(64756008)(66446008)(54906003)(4326008)(6506007)(7696005)(316002)(38070700005)(2906002)(66946007)(33656002)(186003)(55016003)(38100700002)(122000001)(86362001)(478600001)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?0G2Q2/mgbLNhcQ/+DjeZlY5VQ5MiUoPjilfVQXQXdu3WCdQzABj8vEG0Ac?=
 =?iso-8859-1?Q?J99KDCzwtPt+SidICp43ecNDwv95OzNWrEVt4nWR5IC0l1Z8/0SGuROaDB?=
 =?iso-8859-1?Q?83ftNz52Rj5a+f1YxeJRBmz+CDM821jr3JPvvcd2VFk6ktcPqxxy9ojE97?=
 =?iso-8859-1?Q?CIKIJVIhw82GwhDY6mQXQMbi+9ieu/621gN2x6A3hZwXXDkuHVw98KjwoD?=
 =?iso-8859-1?Q?eKTTqmotqOhMh10t8cH/iLvxjBRnnekw8Z7rEqUI0xH0sMcreGi2UGKl14?=
 =?iso-8859-1?Q?3m7+kfCCV4itSHHXKjDuKfzQ9XxdAv4q43gPYOuCszxbBhux3Ne///fo1W?=
 =?iso-8859-1?Q?GUqTvVpBOnXSU+UU0QLGGw5gnoaDa6mHhv3x1NkkmREpzzWe7z73xaL83r?=
 =?iso-8859-1?Q?mNFgL+QzuSTmADBZHXP/eCLAzm8lxmvgaPfXZez1s2FEwpL5V80wRTcq1q?=
 =?iso-8859-1?Q?zG+dsGwSl6RFS3o15ZL6jrfhIpSX47P7O/3jhNcXvEbsYs8E6nTxCxlHLS?=
 =?iso-8859-1?Q?Zu2YSIdulDzqxBsmmNR1w6D9fWh8mAMN+mZxw8F/KJuzbm3KXwjoj91+y7?=
 =?iso-8859-1?Q?7ATImhgsh1VTan15dfUR8Bw/Rgxze8EKzOXOqHppeNjQJQwT1pFfhgD8qB?=
 =?iso-8859-1?Q?cjQ28ZdBGUi3gKa1qWBMv0yZGQQM3RCc2BVq1RuUugy7R4oO5eVZSoN0pl?=
 =?iso-8859-1?Q?ksDXNx+NvfenNOiR5yOGeyeDZpKaEDSjutBy0cMq1cl9nGPwxgSvx2LsGw?=
 =?iso-8859-1?Q?8tGjOPid0U1KkqsmZ+QDDF0fxW/5RvQOKX79blKcxnmOeMCcidqAiFBSkF?=
 =?iso-8859-1?Q?Km+JddVhG2Bvcqof6efnv7YmAy7eVcEQifmilkcnWiMZZ+yY6R1qhPpcYu?=
 =?iso-8859-1?Q?KFTdiUS28/NoSJJp4Iq20Z2H1JisLWBHeSdLI2I2GrXRT6F29BFyF8QF1O?=
 =?iso-8859-1?Q?sUYeJm9IWAcPjL6PX/bs2xC7OZWM4oCWYB6IzBGlRSeMsbhKQePLkxS7j5?=
 =?iso-8859-1?Q?DcT3Nki2Q5kiADpMISRV6qM2RrNOJBQAudDShWshozCZnGPFWWrh/RwCBO?=
 =?iso-8859-1?Q?yQIMwRMTiM3Ste62UbYzgEo2vkPqlcWAST937BmQOOvs2Xkv4tv3mFSj42?=
 =?iso-8859-1?Q?PN7O8pyrMh5Ls30tyWiQ1BwKNSCt+fcp3QmeyqwOmCWIyWtHjdYLHNhwfZ?=
 =?iso-8859-1?Q?+iyfo4nvQA05HrvzjcGLhqkPYTFPdcmzdTayo3Aw2HOQtI2lDElT8v72LT?=
 =?iso-8859-1?Q?wFPRzcz7JMmyoF8Cc76c7ck9g37Zl6GrzSCZVlhfOM0TAFxdRvvM/7/HaS?=
 =?iso-8859-1?Q?Sw3RQeyJ61TRIu6blHRGRt/wYDYOUz/KtaJKfFNbgtRC8qKDwgkJv/LwlJ?=
 =?iso-8859-1?Q?CoBPco4DswBc7kePVvZCUolvXFYKFGVXhPrsiiGxcROpvxq/mCF1BCn3kE?=
 =?iso-8859-1?Q?AVXolsB76F7mOj4xip2S5zfiqjB2elIsfuBxUAmbF4YrcnmsKi2FQRmqth?=
 =?iso-8859-1?Q?MgZ+oFxECEuMppdUhx0LzPtsU/dzerxY+uOwBBa7oyeI5naeTJTFt+wqkK?=
 =?iso-8859-1?Q?kK15h5sasLBX6B6Ph/ITKjyJk2e3OmSvDOjRHee8jH2wZ5mBiSLW9wvx2q?=
 =?iso-8859-1?Q?d0C+uxIw6Un7k=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c19157-162f-41e1-b640-08dab64f95f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 06:10:16.0366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZpyJoMNcLs0F8loRdkpNQQRUbDffpzLu+QwAtA+wUyM6Wt3X9amYDgDbu0EL/qXXhLkqzP8EYS8ddjTqm45c9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P190MB1803
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAKDWXC6hQ3gW5NSRbLMUrTUPxKTJoMk59wfzVeu/As=;
 b=Dyr92TChLVR5m5sVPY1mLoiQzq4cNEDSMdei10PeLnj2JQoEIb++73tXBsSXRC77f0J5AGPxB75Tmb2fixJkYwTG7v2uHdbw5d4e3sNsd95899VEMeGkIkl/I92oQIyClEZArho+AWW9VWFLUxBxATi1kWGUDTwwfxxp5ybEgXg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=Dyr92TCh
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 07/11] package/llvm-project/llvm-libunwind:
 new package
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

Starting with version 15, lld needs the llvm implementation
of libunwind, therefore it is added as a host package.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 .../llvm-libunwind/llvm-libunwind.hash         |  3 +++
 .../llvm-libunwind/llvm-libunwind.mk           | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 package/llvm-project/llvm-libunwind/llvm-libunwind.hash
 create mode 100644 package/llvm-project/llvm-libunwind/llvm-libunwind.mk

diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
new file mode 100644
index 0000000000..2d6286a40e
--- /dev/null
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  0ab6e07bf05359e242e9ea80e4089b819914867fa997a715e324e584bcfdf114  libunwind-15.0.3.src.tar.xz
+sha256  b5efebcaca80879234098e52d1725e6d9eb8fb96a19fce625d39184b705f7b6d  LICENSE.TXT
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.mk b/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
new file mode 100644
index 0000000000..be9965a49a
--- /dev/null
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# llvm-libunwind
+#
+################################################################################
+
+LLVM_LIBUNWIND_VERSION = $(LLVM_PROJECT_VERSION)
+LLVM_LIBUNWIND_SITE = $(LLVM_PROJECT_SITE)
+LLVM_LIBUNWIND_SOURCE = libunwind-$(LLVM_LIBUNWIND_VERSION).src.tar.xz
+LLVM_LIBUNWIND_LICENSE = Apache-2.0 with exceptions
+LLVM_LIBUNWIND_LICENSE_FILES = LICENSE.TXT
+LLVM_LIBUNWIND_SUPPORTS_IN_SOURCE_BUILD = NO
+
+HOST_LLVM_LIBUNWIND_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH="$(HOST_DIR)/lib/cmake/llvm" \
+	-DLIBUNWIND_INSTALL_HEADERS=ON
+
+$(eval $(host-cmake-package))
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
