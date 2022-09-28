Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E50DC04A95
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 14:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2005460F53;
	Wed, 28 Sep 2022 14:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2005460F53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VtUhhwp96J3t; Wed, 28 Sep 2022 14:32:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1B6860E16;
	Wed, 28 Sep 2022 14:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1B6860E16
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 887B11C113E
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61706409D0
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61706409D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CJZzi3UVBbZc for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 14:32:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79B0E409A8
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130055.outbound.protection.outlook.com [40.107.13.55])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79B0E409A8
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 14:32:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GVQ4G6YhpcCGoAzGRx0IzJXkLBGJAuZeXEyVZevzyMhX/ma78un15ZpsLJsFx4GolmF1fZCTr9RCAkP7EWldAzPsvUt+uIkjGB7tTZME1SUaif8P8p7aur1nT0c28RcEZx5rjasa/6kf8MBsxMfOiyVrsl7sH1VOntSquPzfDeK97wXN6vsQk0X7s7GEb/AM9gLVAWNwKTLPBU9fsGrWgwJOBAeuYatZVGjmi+Nz6GSLIcxqUuchRVmwQpriAkn/19SgPXvSb4JenWdRGLMilvUTd3UG/k2xS6dvXfDUVI8VLEz+jK/kVyGhRq6VbbgD2JJs37qWmEXjJO1BUFSk9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mv5jOWoJQ4xk5DxcXUeyKXZ9+IGTehN+PNs79TvQcy4=;
 b=VrFXZbcdox1e3qlydqVDqI/qD4NFpxX85Zzmf64CkUx/N/M9RLoL0SpMY+wz4QtJSDZuz+8J98NQth9TXikoKUk+CRPzc1I+NGgpgBSMZWO9SXLjYR8OpWrumnvcfoQHPXTCW86D315y5PSnA2ZJGlcBACGJK1ZSC4rBAxyaQKATGLtxjqiILQSwrtLIrwVxf+V/rWelalkWpz8pqhclI92Sxozpn0aM8DTrSbZtdXf45eVjhTPN7VjU5k+gOAhRtnYI2eLdTwpJliiotNFrEXWy1SGUE84//5bXiXoRAUTtgkcTnodIZnneW7BZbAiqTUckXC8auqn39xBJ/e4zmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:32::11) by
 PA4P190MB1101.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:102::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17; Wed, 28 Sep 2022 14:32:37 +0000
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b]) by DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b%5]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 14:32:36 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 08/11] package/llvm-project: bump to version 15.0.1
Thread-Index: AQHY00Yq+wms2U5ITEKuipdBXpfbGA==
Date: Wed, 28 Sep 2022 14:32:36 +0000
Message-ID: <DB6P190MB04882AE2B342697E6147C4619F549@DB6P190MB0488.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6P190MB0488:EE_|PA4P190MB1101:EE_
x-ms-office365-filtering-correlation-id: ca603192-1552-40ac-62be-08daa15e4a1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ff5BtUbILL3v8JqZIlxxJahpQjcqWhd1J+4VVFv3CPpsQcKaApzn9g8PI1+1EIiXp66zQQ9Y8qW1yCwjn6AULa613XQoAq6ySj8t86OdQc9hxkUoV6jm3wXltzR6ttRhAEUDfQ/3+bCNAEr8swV9tAP9BNTEWE642K/JXiCMWzJPLJDehg19oQ11YqIngYMordpDJeWpUeywidnQ6K3jInVF+tkJPYkS8k6mDdBHJEILp1SpjRQok5kWYsqSjy9cYQrWi4W991zZzjVQNe9ls4iJE6DUgyyXTIm1U33scdlkM/g24+n0z34U9Zz7gb03FpqVBBVhVr1mjzXmu6zpbI4x55Nvf1DmPThojI8rGMWjliLQgGnNUVI+AoqLhcza2pAEFxjXMWbfCVQ6Hp0YlUU1xoNAjGMgGJEH0GXVgwtiflubdZvOc5ufP4EcOxtLcqWHG6Fvl3uztNezTIaPtt/Pe5+vmUd2MnoAmkOJ3N5hhKu0rYS4wXpN65j+Q7o8IXGIG+kFoOPW2q6LcLTKiz4N1wm3yIT2Pv5KY/2kLl2LZLpAWDdpb6WhR5wZsMWmHCpScwBlMhO+KxyzwjfMq5LBaROhC+EwjBB5AilSNhuyiKoA2kRhPud7VnAWJrrgTyYUXYGXyuWSrT9voyw1TuAnFf0eWNMDCxDhsAFPSD8slc9WOY2U2ZcAr1qhPew7+4dnQHSElJhXXDM2qjuVppBNDKCx0PF4fY9ciV5T0DNVngpSmM/487UUAHaFT4pjhokcSOI8ET+aB2ONeBypqMVF3iyzUyyksrmv5jhuVi0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6P190MB0488.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39840400004)(376002)(346002)(136003)(451199015)(66476007)(26005)(9686003)(186003)(478600001)(19627235002)(6506007)(7696005)(38100700002)(38070700005)(316002)(2906002)(83380400001)(966005)(71200400001)(66446008)(33656002)(54906003)(6916009)(8936002)(52536014)(122000001)(5660300002)(41300700001)(91956017)(76116006)(66946007)(4326008)(8676002)(66556008)(64756008)(55016003)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?cMFe/JylRmwqC4C4YBr48jPCfnaVxv3AUpejQIbPG/zdLh2ddc8aOCfrqI?=
 =?iso-8859-1?Q?jm9ENZdvz/ofpjOb8zwEX7wObZXK5BWlBUSIMlFt/uorJ8WYbt4bLN0yIh?=
 =?iso-8859-1?Q?68jLXFiVla9pHViwN2+VLH6qw0cICk+Md9TnTgjPuv/EQeivi58xzrQ7c1?=
 =?iso-8859-1?Q?5MQXiiJnCVX3Ca7suEdbPnn82XRjCODpzUvyHlQvgQWOtdZfZo4p196MnL?=
 =?iso-8859-1?Q?J948HAwU1rLNjm3wUFDNITa3bD9VKG1hu379uVxz5Q4VldjVDOXnf7Xq6C?=
 =?iso-8859-1?Q?l/JBK43DKmB/JEchfl6PsY31A7SQDHwjwitKM196Aqm9RM19d3vZnY4PIz?=
 =?iso-8859-1?Q?WTEPJMmIv6El758hcNPjSKAehfClSFEinHvkqc7efMQ8EUHD+2Gm/j0Xza?=
 =?iso-8859-1?Q?JtgSU1fkS2+j7OSul8XFIrvIM6zimAH0Dh7zU2TrP+qEHu1gjkYUviXel/?=
 =?iso-8859-1?Q?K2lLQ9X8eXMQYZKsJehXK58iw323JiNA7NVxa1e4M5vQjjDjcXnAsk2wm6?=
 =?iso-8859-1?Q?NUtA7yi2CsxJU1wMxddFbWTdi2+cY9I8CfYfB1DsTRvo0rjbHxAMZSmxHe?=
 =?iso-8859-1?Q?w3zSopkzta1q6fB7G6M3gmTRFv7L2henU+EjMtJexdmdyK8N+bjkHs7mfc?=
 =?iso-8859-1?Q?d2mRR7C8hSNcdm3ulP4k3TWOkQh4jA4eHYsaSEJd+mFqlWkp7QPaYzJvZp?=
 =?iso-8859-1?Q?o5D2idN6I+PuUyKWCTy+9ymVVTDZd5TxxGV+P8F5yuGQUMGz0F6lu8/pvQ?=
 =?iso-8859-1?Q?dZHBiZPLR9RpAp4V0JqcFGlLNTh1g/EI1EzU7s2mSJrATnoyhmENTRQEXU?=
 =?iso-8859-1?Q?M/QL3NsRWUNMp/eMRX5z50v63bvkCK5wE4tdCWOpxVDMXBFP23DU7GJRn2?=
 =?iso-8859-1?Q?xT4gTbYP5/gX8qC1tAlF/2MkEgBqpdOaUl1qrDlZeWl5nDcSHX9cP7xBtw?=
 =?iso-8859-1?Q?mH3UMbB0RimIY2EG6AAggYbyIAGvBpPwUFS3xn2Svoklx7hZUCHNvk1aVG?=
 =?iso-8859-1?Q?/Aa05dWFmEBbw4yHzkjMksMEsxdNAVIbD4oA+WZm15LVN+X44EL6lI987e?=
 =?iso-8859-1?Q?2pkHlawXDzgNdDEGPo09vEMZFb+j0m2UdqcdyCumHbS7dwLbvMLMQ9vdWT?=
 =?iso-8859-1?Q?BpVhT3v5PmPcnES6t86Klx/Ah54RgfvIb7TVaA5MDwfzmhpwgkSCSqhikY?=
 =?iso-8859-1?Q?BT7LlzIs42qH7FJ6AaFxg2rmHjQ4kWtbie6nWWxxMNGMwQib0FwhWEaen1?=
 =?iso-8859-1?Q?Y0yCQA+AdJdrR35NKlT/ZktU6DefclgMTZ5ky4Djm/Bv5UT5manrh4ac6R?=
 =?iso-8859-1?Q?KUf9Xf7KCK0u8tKRIKW0YOAobFYBqfcyXnqTh6a4h2q/1kuLmXVe0qRpiC?=
 =?iso-8859-1?Q?71hs9HVxh0HNkLe1dRjmKmuRB6UkIUEfnNlqqJ7GaN2vdKNM3AKbseGdKl?=
 =?iso-8859-1?Q?Ll6d/8QPPvfoPdJ8cGHt31WAImV/KEkQC/NEO8snSSthj3KDKo6Yp3Duzl?=
 =?iso-8859-1?Q?XcB4JuWr3Z/gOqAhoXcjuTTpQ4hRhuD8cEueCVwfHaiEoqfCgfDKshS7Hi?=
 =?iso-8859-1?Q?2wq0uCBKZreYFZ4qUtizvJW6AiFeeT4yv/Og8fjw7k/PXC58CgocEnuArq?=
 =?iso-8859-1?Q?laRX9ms9W/h0Y=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ca603192-1552-40ac-62be-08daa15e4a1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 14:32:36.8431 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GULDbWFQumr9e9i75s3VTVE/03laIZC76BRnASJUVYBIUKU3HULLawD0mHetbzfKwaAHN0Xv3NRzw/0NM4e0ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P190MB1101
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mv5jOWoJQ4xk5DxcXUeyKXZ9+IGTehN+PNs79TvQcy4=;
 b=cn8NDrkvoct0iiQ44Ecc54x8g00dGDl7srK3v6p2pG6cZsu3kMOiriD/fpqN1Bw59fLWG5FKQJlklt86OV2jkDC9M8ZGXhkH9x3rHFLYi+9irfGKL3OTXW5lmbhBreQF8p17aZcHu5jcDC9WaqhnBllxCG/mn7murH4kYPhJ2Ic=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=cn8NDrkv
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 08/11] package/llvm-project: bump to version
 15.0.1
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

- Add new build dependencies to lld and llvm
- Drop old config options

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/llvm-project/clang/clang.hash         |  2 +-
 package/llvm-project/clang/clang.mk           |  8 +------
 .../llvm-project/compiler-rt/compiler-rt.hash |  2 +-
 .../llvm-project/compiler-rt/compiler-rt.mk   |  3 ++-
 package/llvm-project/lld/lld.hash             |  2 +-
 package/llvm-project/lld/lld.mk               |  8 +------
 package/llvm-project/llvm-project.mk          |  4 ++--
 .../llvm/0001-nfc-Fix-missing-include.patch   | 24 -------------------
 package/llvm-project/llvm/llvm.hash           |  2 +-
 package/llvm-project/llvm/llvm.mk             | 21 +++++++++-------
 10 files changed, 22 insertions(+), 54 deletions(-)
 delete mode 100644 package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch

diff --git a/package/llvm-project/clang/clang.hash b/package/llvm-project/clang/clang.hash
index 0136b80664..05a3ff7c6c 100644
--- a/package/llvm-project/clang/clang.hash
+++ b/package/llvm-project/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  0a8288f065d1f57cb6d96da4d2965cbea32edc572aa972e466e954d17148558b  clang-11.1.0.src.tar.xz
+sha256  76f8bee6cf97daf7e553936f66195df917c99d58944113aa3f7ee8d9eb80051d  clang-15.0.1.src.tar.xz
 sha256  ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47  LICENSE.TXT
diff --git a/package/llvm-project/clang/clang.mk b/package/llvm-project/clang/clang.mk
index 0943e21a8c..0bafd6461b 100644
--- a/package/llvm-project/clang/clang.mk
+++ b/package/llvm-project/clang/clang.mk
@@ -17,13 +17,6 @@ CLANG_INSTALL_STAGING = YES
 HOST_CLANG_DEPENDENCIES = host-llvm host-libxml2
 CLANG_DEPENDENCIES = llvm host-clang
 
-# LLVM >= 9.0 will soon require C++14 support, building llvm 8.x using a
-# toolchain using gcc < 5.1 gives an error but actually still works. Setting
-# this option makes it still build with gcc >= 4.8.
-# https://reviews.llvm.org/D57264
-HOST_CLANG_CONF_OPTS += -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON
-CLANG_CONF_OPTS += -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON
-
 # This option is needed, otherwise multiple shared libs
 # (libclangAST.so, libclangBasic.so, libclangFrontend.so, etc.) will
 # be generated. As a final shared lib containing all these components
@@ -62,6 +55,7 @@ CLANG_CONF_OPTS += \
 HOST_CLANG_CONF_OPTS += -DLLVM_DIR=$(HOST_DIR)/lib/cmake/llvm \
 	-DCLANG_DEFAULT_LINKER=$(TARGET_LD)
 CLANG_CONF_OPTS += -DLLVM_DIR=$(STAGING_DIR)/usr/lib/cmake/llvm \
+	-DCMAKE_MODULE_PATH=$(HOST_DIR)/lib/cmake/llvm \
 	-DCLANG_TABLEGEN:FILEPATH=$(HOST_DIR)/bin/clang-tblgen \
 	-DLLVM_TABLEGEN_EXE:FILEPATH=$(HOST_DIR)/bin/llvm-tblgen
 
diff --git a/package/llvm-project/compiler-rt/compiler-rt.hash b/package/llvm-project/compiler-rt/compiler-rt.hash
index 8ee010ac5a..316d9e89a9 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.hash
+++ b/package/llvm-project/compiler-rt/compiler-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  def1fc00c764cd3abbba925c712ac38860a756a43b696b291f46fee09e453274  compiler-rt-11.1.0.src.tar.xz
+sha256  af9f1c2be8596bb76f712c29c77e2c18cfa7d0f94dbca5d396d757342ece2e1b  compiler-rt-15.0.1.src.tar.xz
 sha256  1a8f1058753f1ba890de984e48f0242a3a5c29a6a8f2ed9fd813f36985387e8d  LICENSE.TXT
diff --git a/package/llvm-project/compiler-rt/compiler-rt.mk b/package/llvm-project/compiler-rt/compiler-rt.mk
index 84add60801..026650c7c8 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.mk
+++ b/package/llvm-project/compiler-rt/compiler-rt.mk
@@ -17,7 +17,8 @@ COMPILER_RT_INSTALL_TARGET = NO
 COMPILER_RT_CONF_OPTS=-DCOMPILER_RT_STANDALONE_BUILD=OFF \
 	-DCOMPILER_RT_STANDALONE_BUILD=ON \
 	-DCOMPILER_RT_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME) \
-	-DLLVM_CONFIG_PATH=$(HOST_DIR)/bin/llvm-config
+	-DLLVM_CONFIG_PATH=$(HOST_DIR)/bin/llvm-config \
+	-DCMAKE_MODULE_PATH=$(HOST_DIR)/lib/cmake/llvm
 
 # The installation of the target runtime libraries defaults to DESTDIR, however
 # host-clang resources directory needs a link so Clang can find the runtime
diff --git a/package/llvm-project/lld/lld.hash b/package/llvm-project/lld/lld.hash
index 6d56ffcaab..222d3ce90e 100644
--- a/package/llvm-project/lld/lld.hash
+++ b/package/llvm-project/lld/lld.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  017a788cbe1ecc4a949abf10755870519086d058a2e99f438829aef24f0c66ce  lld-11.1.0.src.tar.xz
+sha256  4966ce882c147452b607a2a7320d5e3400b6d1f27543009bea5445aeb64d3728  lld-15.0.1.src.tar.xz
 sha256  f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
diff --git a/package/llvm-project/lld/lld.mk b/package/llvm-project/lld/lld.mk
index 46ec3b13ff..539dd0bd71 100644
--- a/package/llvm-project/lld/lld.mk
+++ b/package/llvm-project/lld/lld.mk
@@ -10,13 +10,7 @@ LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
 LLD_LICENSE = Apache-2.0 with exceptions
 LLD_LICENSE_FILES = LICENSE.TXT
 LLD_SUPPORTS_IN_SOURCE_BUILD = NO
-HOST_LLD_DEPENDENCIES = host-llvm
-
-# LLVM > 9.0 will soon require C++14 support, building llvm <= 9.0 using a
-# toolchain using gcc < 5.1 gives an error but actually still works. Setting
-# this option makes it still build with gcc >= 4.8.
-# https://reviews.llvm.org/D57264
-HOST_LLD_CONF_OPTS += -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON
+HOST_LLD_DEPENDENCIES = host-llvm host-llvm-libunwind
 
 # build as static libs as is done in llvm & clang
 HOST_LLD_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 747a6f5647..8a74b78c70 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LLVM_PROJECT_VERSION_MAJOR = 11
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.0
+LLVM_PROJECT_VERSION_MAJOR = 15
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).0.1
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 
 include $(sort $(wildcard package/llvm-project/*/*.mk))
diff --git a/package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch b/package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch
deleted file mode 100644
index 62111ca138..0000000000
--- a/package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From b498303066a63a203d24f739b2d2e0e56dca70d1 Mon Sep 17 00:00:00 2001
-From: serge-sans-paille <sguelton@redhat.com>
-Date: Tue, 10 Nov 2020 14:55:25 +0100
-Subject: [PATCH] [nfc] Fix missing include
-
-[Retrieved (and backported) from:
-https://github.com/llvm/llvm-project/commit/b498303066a63a203d24f739b2d2e0e56dca70d1]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- llvm/utils/benchmark/src/benchmark_register.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/utils/benchmark/src/benchmark_register.h b/utils/benchmark/src/benchmark_register.h
-index 0705e219f2fa2..4caa5ad4da079 100644
---- a/utils/benchmark/src/benchmark_register.h
-+++ b/utils/benchmark/src/benchmark_register.h
-@@ -1,6 +1,7 @@
- #ifndef BENCHMARK_REGISTER_H
- #define BENCHMARK_REGISTER_H
- 
-+#include <limits>
- #include <vector>
- 
- #include "check.h"
diff --git a/package/llvm-project/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
index e7f79492de..61f279ca19 100644
--- a/package/llvm-project/llvm/llvm.hash
+++ b/package/llvm-project/llvm/llvm.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  ce8508e318a01a63d4e8b3090ab2ded3c598a50258cc49e2625b9120d4c03ea5  llvm-11.1.0.src.tar.xz
+sha256  0222beed0080fd07f1ee93c5bbeb2e05420b555b9cda725e3a0c299d8cea7cfa  llvm-15.0.1.src.tar.xz
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
index 1adad17b16..548c496c48 100644
--- a/package/llvm-project/llvm/llvm.mk
+++ b/package/llvm-project/llvm/llvm.mk
@@ -14,15 +14,16 @@ LLVM_SUPPORTS_IN_SOURCE_BUILD = NO
 LLVM_INSTALL_STAGING = YES
 
 # LLVM >= 9.0 can use python3 to build.
-HOST_LLVM_DEPENDENCIES = host-python3
+HOST_LLVM_DEPENDENCIES = host-python3 host-llvm-cmake
 LLVM_DEPENDENCIES = host-llvm
 
-# LLVM >= 9.0 will soon require C++14 support, building llvm 8.x using a
-# toolchain using gcc < 5.1 gives an error but actually still works. Setting
-# this option makes it still build with gcc >= 4.8.
-# https://reviews.llvm.org/D57264
-HOST_LLVM_CONF_OPTS += -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON
-LLVM_CONF_OPTS += -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON
+# Path to cmake modules from host-llvm-cmake
+HOST_LLVM_CONF_OPTS += -DCMAKE_MODULE_PATH=$(HOST_DIR)/lib/cmake/llvm
+LLVM_CONF_OPTS += -DCMAKE_MODULE_PATH=$(HOST_DIR)/lib/cmake/llvm
+
+# Assembly files for x64 in lib/Support/BLAKE3 need to be compiled
+# by a C compiler
+HOST_LLVM_CONF_OPTS += -DCMAKE_ASM_COMPILER="$(HOSTCC)"
 
 # Don't build clang libcxx libcxxabi lldb compiler-rt lld polly as llvm subprojects
 # This flag assumes that projects are checked out side-by-side and not nested
@@ -259,7 +260,8 @@ HOST_LLVM_CONF_OPTS += \
 	-DLLVM_INCLUDE_EXAMPLES=OFF \
 	-DLLVM_INCLUDE_DOCS=OFF \
 	-DLLVM_INCLUDE_GO_TESTS=OFF \
-	-DLLVM_INCLUDE_TESTS=OFF
+	-DLLVM_INCLUDE_TESTS=OFF \
+	-DLLVM_INCLUDE_BENCHMARKS=OFF
 LLVM_CONF_OPTS += \
 	-DLLVM_BUILD_EXAMPLES=OFF \
 	-DLLVM_BUILD_DOCS=OFF \
@@ -270,7 +272,8 @@ LLVM_CONF_OPTS += \
 	-DLLVM_INCLUDE_EXAMPLES=OFF \
 	-DLLVM_INCLUDE_DOCS=OFF \
 	-DLLVM_INCLUDE_GO_TESTS=OFF \
-	-DLLVM_INCLUDE_TESTS=OFF
+	-DLLVM_INCLUDE_TESTS=OFF \
+	-DLLVM_INCLUDE_BENCHMARKS=OFF
 
 # Copy llvm-config (host variant) to STAGING_DIR
 # llvm-config (host variant) returns include and lib directories
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
