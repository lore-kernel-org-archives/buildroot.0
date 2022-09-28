Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D981C32771
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 14:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0890416AD;
	Wed, 28 Sep 2022 14:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0890416AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZoiZyY8V38e; Wed, 28 Sep 2022 14:32:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 896E8409A8;
	Wed, 28 Sep 2022 14:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 896E8409A8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A1C9D1BF368
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EFA581A65
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EFA581A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P02seDEPBpzW for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 14:32:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98C88813DE
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2087.outbound.protection.outlook.com [40.107.21.87])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98C88813DE
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 14:32:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLJhgtAnwy0iv68CX1Fy+ZDGHnzN9QK62hJ7LaqfrsbBc+m6lYF/w0x2RIt4NUZIan7JHAv249fnNVvNyHQHGANtva9QFeVgb7dvvlu7krZddEHrxobGmar7QD2juyQx6k4on2yb8yO/fa7JjSCHiy15/I1IP5FJHrwqJkebBD5VSDz1FvTGQyXTEOKxUmpeQJAqwvIb+XU1RIV5d2NtI9uH1VaCvcNFDSPnX71rHUc9DwAQne+5IDggxCHSagG2BS5Gy29LP8evOCbB0+CzsTfl52EJAN+NnhBmuZ8xGsElWL1kLLDSqymtbn8Ef74KkrSu4ETFIKOrLBADSTyUYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVErAVVXHsItQQkXdrYJRpcyF6MoCPdXeznwhQiyFjw=;
 b=G7Qlv3aVMZdWTVCNTKI/fk5A/hjhKG+eGrvjDTLIXyTFjzCrAEKhje2zWMyXywcMJ+5EYciPKGJ/bq6m8E9YrXEZBqSVDi/son4JOPp0erl+xoqRHtc7HgjAHnzSWM7rF6ncLreYtPxWyzzgQYJdJi7W9jdklvxj2HvzzNV0r3bgY+fqhS8PCWVolJlKF0hS+YCaVgGszVGxL2QBE2th/hNtBmJV/3vY0HwxKntL3qWuNy1kXP31bgFbKORDnwOeHpjXKCkTAkCr0XF40hsV99jQYJfmOcaerWkS1znJs8N5Zn5oHejPcAwz77ydEbhdYuExfn8AXeCiMVQWEkA2Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:32::11) by
 AM7P190MB0776.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:119::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17; Wed, 28 Sep 2022 14:31:57 +0000
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b]) by DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b%5]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 14:31:57 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 07/11] package/llvm-project/llvm-libunwind: new package
Thread-Index: AQHY00YVQLt1ZBYZTke5MWb4NcbYrg==
Date: Wed, 28 Sep 2022 14:31:56 +0000
Message-ID: <DB6P190MB0488C8A1DCD37BAAE373A4749F549@DB6P190MB0488.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6P190MB0488:EE_|AM7P190MB0776:EE_
x-ms-office365-filtering-correlation-id: c40b29ee-ce2b-48a6-c448-08daa15e3258
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oUeSHvBkyZVW8jb4Feme4XqiqhTBvHUmo3ZI09Nhsb8Wnln/FWOQEqQKmFIBZhSM/YcvTDNDZD0DOAkrwC0epQnvT+TqozmPd3L8tkSG9sMt6Si4WHD4hshxUM/EoXxcVTbkLCKfsqoO11/atLGZWJ5c1L+sPwp57+lgXsrjrP0I5EneaVZHNt7XXMW6i9LqPK3I/0ZUBv3bf0QCcg2zymvT9gamhBIC7iCwjz85WZ48bkUsqRAoY6NThd2yptqzSTlAt7OobM4LtOdPobbYHJE8JdawDQBZsElZoEfoqMDDHbLw9A69zlFSPJTK5X31ITEKaF17WGoS1deT177zmwDpV1F3RYDmWDzL61FHU2vx0gcRSJDnP8XUzkxo59EbI89ZZyIulQf80isOf+YZnaxCcToZpVmsUMYi3CmRjKXqIkcEcfvdCO25Np2vaMESwEEkiGF2SUnac9IJ2OATkV4sO/9WD3n2OQo4BUsgtqbUthP1LEIVB1WPd8Xq3XyA+o1Kc1rZV2j/NjlYW+J0GvCDCTlIzDqjDWfQNGjEt5NvR0d2x1HEkjW5WePm1XPBtzSQzPaAAYiuwByRXSS2zAr4da3t2/6b6o0f6zgbtEZUNz6Yy3RQ4INNLkngLYagUyTvECzu2Tbx1Y4ZP6F9y/bb3k4RNMb+O5qG8NJdllD29spEANmeaS8Zw/8w6K4QDzbCOYyQQanfgil6Ki7bUT4ahn7ZAgxxqZXgTtdtRtPf0v5zhGxyatVLXLsNa5Mcb3IeWWlk3vK2/qkVVvjD8w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6P190MB0488.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(366004)(39840400004)(136003)(346002)(451199015)(64756008)(4326008)(8676002)(33656002)(2906002)(316002)(66446008)(66476007)(41300700001)(54906003)(6916009)(66556008)(66946007)(76116006)(91956017)(86362001)(7696005)(6506007)(26005)(9686003)(186003)(71200400001)(55016003)(478600001)(38070700005)(122000001)(38100700002)(5660300002)(8936002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MrKj5MWC1J4x0VqFahamz2M1zsdJNYQ4VZrMBYbirNwDLbsYzRP2Ot8mb8?=
 =?iso-8859-1?Q?xBmrVA/PdcE9nv/Nr73JkSb8eiwmiuEj/9q6RYf7lB6Plvfn18WVe3+7jB?=
 =?iso-8859-1?Q?+/aklalcxpi61e95fRrfA7Sa+gKlo5W6Beg4amQIJujjE9WKtrM2Qt+23K?=
 =?iso-8859-1?Q?ldS006ciRm7p0xyotFpM5f9M92lFaSMurPW/60LzY2WALJpn+Tq74UeFso?=
 =?iso-8859-1?Q?KteYnRtTSBqtEYQJWPlCJJE9GkAGlECnlKWoZVBAR99NSNelf21urIdTp/?=
 =?iso-8859-1?Q?D8DMX5FgfHX8xhMX8o9FftrmhgQE3khDjBdfOZo3TwQr9pk9BWGhZQMeJA?=
 =?iso-8859-1?Q?lySSUBmSxQRxfqnfvQSlcFK8mnX7g7rBsZ/1VmJkrj3KQh91/u6YdZe4/p?=
 =?iso-8859-1?Q?iZTyu2tyqaCXK0uWwB7TzXkoFZEedN4Yun6R3BQEbD+UYLVCaHZsvw9gdt?=
 =?iso-8859-1?Q?AKnaGUEpgMOIVwl99Wq+xgkXC3+p62QZRp8NuIOOTdvhJ6vdxjII+a4dcf?=
 =?iso-8859-1?Q?RxqHeDpMaNamC8mf+HiXvV+3DfnfOSLs4Z8lReB2uxixVCbBiNzOvoXp2p?=
 =?iso-8859-1?Q?sdh6UQbJU/CogDnW3C/Www6CHFxrmi1SDfbHIHq3/S/9OAOJNIlzXR2RpJ?=
 =?iso-8859-1?Q?l3d6VcgEgkhhd+V+Wtsv9lpAGYVFoQ4q4ajz5UOk4NkUUWvnuG4NrlG0nG?=
 =?iso-8859-1?Q?t+gqmYg88DXdm/F3cYpWdyW0sjKzffOMaZ5SYH/58buF1YY9K5EkiNDt0O?=
 =?iso-8859-1?Q?jwIw7apRuJf0lWby7rt7Xxlbr7zRxw01YOsJxRZ7mHl6VWh3jabICg+U94?=
 =?iso-8859-1?Q?E16TukVGn2wE8mmwbyGAqKhbJlGSlHnhfU6KLOMO8gtmEsvOUFlpxP5Csc?=
 =?iso-8859-1?Q?RF7O6lmoMuu6ySraNJ3d/6XmjkbnvtYYU4saJaqc7T0wEFxOohOwug4ETQ?=
 =?iso-8859-1?Q?Fg089CzgbzmaIMjbqfCL3314T8/zNEhGmVbk2IljH0el6sDUwmV8Dtr9Bb?=
 =?iso-8859-1?Q?sLcHjvvYnCJ0ZGUTYyu94YuoXh7UC4OH7yP5nuPq0/x5WLIg8ejWJuZ6Kt?=
 =?iso-8859-1?Q?HaeGQXn5gL91UCa0JhYVOreXLGtthuOR6Ou5MXXNw1IMrTbPzaInf+SAtN?=
 =?iso-8859-1?Q?CMem7RSddGntFyHKu38uUjvQ6aMKRn/E7zIJF/SqxXU1CRZUz90rzY9/q1?=
 =?iso-8859-1?Q?tlL2DCBBgevKWJckjFwJBN9fYqTJ7hm8YHRZ2fdDT1gvIJf9jWQetsJecm?=
 =?iso-8859-1?Q?OZOqArlsBWBkSj6Wb4o0nORwuIFGkycRO1Kwc9XArtH9XFnVlVBY3t/kWG?=
 =?iso-8859-1?Q?l/LFMOJdlgEfg7/vddELCJ/TTe8YVuCET2Jv5t4pHV2I9iNzPZpU79oDhq?=
 =?iso-8859-1?Q?LdpIySlT37PYSjMt7xlGjHMKCxkc6Av8LMjLeLSR6CRQQEbocI7siZQara?=
 =?iso-8859-1?Q?UIEk/Tl+w4vBJQk6d0EglS3abFBsfUJp5Un1tFSHdYgphZtlE+G2FVKYjK?=
 =?iso-8859-1?Q?7IrUzk5jY55TZFbZV9oq5qTZ1zvV5BE8Cg7B8NLPJdZTf648WPoij1lQ0w?=
 =?iso-8859-1?Q?Y8O1n7pJOWgav+oZGakSOzi+iVGfVhc7xVMi3Ro7CdDTyhKtq3HZCTYIBs?=
 =?iso-8859-1?Q?lyv1T0SE86LOE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c40b29ee-ce2b-48a6-c448-08daa15e3258
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 14:31:56.9397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kqkki0ZFu7pnc5tBdM5nIc4/oz13+PnJxn8Gsr2jFjKaU65rQDVTCR2sFqSM3ThJCROHHkQZEgGkM4FLrFTXtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P190MB0776
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVErAVVXHsItQQkXdrYJRpcyF6MoCPdXeznwhQiyFjw=;
 b=HVTOcFnfMnoEpnsKkFhUpNVeu4HoKxXOp28SqGeNSEbMtW/2cjOnjpOFOXBp54xN+Trp+I2GlxfehgVyyqDJJKDYhXWaD0sYShuPAawt6JDZRqSq6KfsJo23c4dgVHML/88X1XtZ5kS9PLkwWaAFKmJntadPpQs1/WYXUioMQmg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=HVTOcFnf
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 07/11] package/llvm-project/llvm-libunwind: new
 package
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

In future versions lld needs the llvm implementation
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
+sha256  65af59d7cd4672e2c1793402968f803beb3f91a92ad95f8702610a9a07a5ca10  libunwind-15.0.1.src.tar.xz
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
