Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4AFC04A95
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 06:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4CA960AEC;
	Tue, 25 Oct 2022 06:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4CA960AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WSpFzktczr43; Tue, 25 Oct 2022 06:12:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A0B3605B0;
	Tue, 25 Oct 2022 06:12:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A0B3605B0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FF791BF2BB
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1DF9812C3
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1DF9812C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2HiUb9-HJr80 for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 06:12:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EAFD80C2E
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2067.outbound.protection.outlook.com [40.107.22.67])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2EAFD80C2E
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 06:12:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtsHie3iaHWPdbO1lyJi6TFDHDbotI/RxLKBv6nDOhvI6qZqmiBpYQvRe1rN+/7kPm5eHARxeVNeaj33V24GqN2Ar0IOYIDho+rZ+3uYkoZ0K3iMkNq+a2mLuQTBTfk4m4hxgaHLl9EIq0emVFl4V1g3EOWe/wDJr9vGUaCD5+P5RHZ3dCQ/OHkdWQmx0Edb3rJ4Z85XSS7Z/MUJOcRPwGJkBDoNmWOsD07BD1xtzYEjj7mWviJJ7XaYXRdxkRkEwTdPJgA7FoK9cJWK1TS+apjKQybTDLjJZdMTdYsMopP6MKFp5VkIUS82Ie/ptDS0ozaUf0n2rFl3x9tOsB7Abw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pspDN51+qhWWN7Gg1gM8Y6L+qSeX4HZ4hqkMij1WBUw=;
 b=IsSkgH+Zf9qxXKDz+PWHTzquWkfb7vSJejEkWMNRF4D9la5g2RraakUm9npLSzVBxHr0KFOdcfkz5IOR5c9sH/VA+iKZG79gIJGKXXokhqUEL6drcWwBqkerWo31VVFP4YUd3NQb0s6vNkK9TNdwDSwQHQjby7bCvtXYVqtm/Q2CqiueVhMKEouqTZjD6JsNxkYOiS9UHu+1IzAnQoTiJmK9tY+tO8EV+zHfolAaKmGbEw98X/iuRJkzr072J8kqBTUbsghCoRuply0B4zcbhx2t/YsTcmqNjinAqiPLzGvknbQnG2pL9p3wTQz7+0xxnvMlq8Aq9BGOVCwQv+snzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VI1P190MB0654.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:123::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 06:12:02 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1%7]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 06:12:02 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 08/11] package/llvm-project: bump to version 15.0.3
Thread-Index: AQHY6DgxZAFMccj3gEKTpBmsMR9ACA==
Date: Tue, 25 Oct 2022 06:12:02 +0000
Message-ID: <VI1P190MB049300FBF75C4F62737566069F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|VI1P190MB0654:EE_
x-ms-office365-filtering-correlation-id: d3f2fb62-c934-4cde-234f-08dab64fd532
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7+M3I4nphHmN0bYSq49Xm4PvwSX9YlRkbXY4RmXbriIgCgK4qdioxlS1tetuAbTL11DlDs3wja2vC5vrEMskHyqfEIWlDL2TF7m2VqwADSsXckjUhwRlbsrPETsad2yzJa4/aOBsnpQA/VODQ6fBOdoTpHML7rKTCr/m1YZfVY9EJE+ElcnT/hWLqGJSQq7YJQnMV6NL61u5boMxQ9LmldQoX3ZrBggUIKqdrsV6yRqKJ0Sj7Rip0sz6+BJoDwE3I2+DgbI1h7aNnvHSftSO6rL1yTYs6Xt/3ZjqhAm/pDTYnW1lEodDPyoyQ9+8fYYwpCOXt/2PMf1o2VivHZbYdGW/8zTnZ8sTz6uQNiDpK7PGcDQn9X/teG6evrPEJpZ79WXQ41CCsjP2wsh6ZjYsNotVUD+36o3ch/FZ3uugrt/xrMwLFWUhR6+DX/5rXDpsqIlCOgOtXi01g2bIiwM4lV6ZxYGpB7k21tpjGBs2J6oJuBEaZNKICQ35E56+rjpF918QFC04WKimJv8ZBOhn1nkOl+OKkvq74opYwFO9Sru2peYdWOS3xfl3o3TIHPMvmBBHIZZss0GIQv1ZdtRZjAjGhZtdi7/E0JrEnS9XU5+4hDmuuYSXOIO7X15Uy/disWCdQ/2XacxIbHwBAIuM3HaR6CNjCwQkwk6wgXGUXQS6RLlgSzvhnXsPEMh6qegphyKT2WR22Fc+5k9EB5HhYOjnfUl7Vvp2VDLdFglVLMQxvqVPTzmqxol/y0Fz52AbGjdNZSEobxzCOcij+QMzNeyGHO/TlHUM9Q2Vhz10+jo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(396003)(366004)(376002)(346002)(136003)(451199015)(478600001)(186003)(83380400001)(86362001)(71200400001)(966005)(19627235002)(66476007)(66556008)(4326008)(8676002)(316002)(66446008)(66946007)(64756008)(7696005)(6506007)(55016003)(41300700001)(9686003)(26005)(52536014)(6916009)(5660300002)(76116006)(54906003)(8936002)(38100700002)(122000001)(33656002)(30864003)(2906002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kPM1Tbo35AhgtJsNnCCU5aojo563EM/lZZvxMpxvY20+i9Q87Jc/Uy4p03?=
 =?iso-8859-1?Q?dykN47PDBIosHcic59vY9dd/wNTB8IIFHDQeJwAP0413g0rKGkrytafPB6?=
 =?iso-8859-1?Q?qjdQ4NW5eO8wAB9RnQJC3t/kfdRR/gYNCFUaJ2oB1hsMa4Hq4zGdiVv7kE?=
 =?iso-8859-1?Q?JSK9Q90KiiMl023S5o57utjvjY4lj/IFrPRn0grv8+PK66J3UnPTh7m/30?=
 =?iso-8859-1?Q?xgOIwvC9S7tmMsww+bIfp/b2dL84l4z0kIrHsAWXkvVWx0EEZptMyFfYtZ?=
 =?iso-8859-1?Q?2hkOGAoX1BntRROYi8iKWX3aAOcDBQh91wxfSxeQL8KX4bGDcJCUEth2Nw?=
 =?iso-8859-1?Q?jGGTyNfI8zXzrtT9ULtxYn/k/oWc2sYDOKKQFIVAMf1nbphJNj8nj0t0bh?=
 =?iso-8859-1?Q?4lmDy/gFfXmeXgzCpetEoLhVV2du0ZsVZLqRjgZOlbbHh6TcOxSlnt1rki?=
 =?iso-8859-1?Q?tzt9HlEBy1yQoQH887627gFnqeRtwP5/hK9ZB1hMwNrIoISNhs3WYan1zN?=
 =?iso-8859-1?Q?wyjx4/8yzOOG0zzf0XICf4Z6yJ/Md+MwIpPWTi3IIxefq24kUjieIdgZ7U?=
 =?iso-8859-1?Q?87LCdPer/6w6vqF1U3srn6K5lCS6EWpAOOjKQMP7oIwqXUb8ANRNmn8Zue?=
 =?iso-8859-1?Q?vBSvE/DF8CPlHAR/d/QX6plR9Usc73soWu1z8LzTc0DV8ga4lO85+fhOmY?=
 =?iso-8859-1?Q?1G3HYScbFJznmhibkibNsVK7BgDuTmM6vbWz1jws8RALH7WgYz4x5zIqoU?=
 =?iso-8859-1?Q?BUfkrL78ZD0Vuu5sheWP4OOkaADp28R7AUpyrnOz3X3atqzSpBWW8ORjHs?=
 =?iso-8859-1?Q?KB0FBjTG7tVJgEvGFjsamtd+U9gu5CMe3GtgBTJ+B3XCJgWrtCEuK1b69D?=
 =?iso-8859-1?Q?zfXw5x6uPVcDw3OPIy5m6yemvdzokj6Nfjrufg/a6VATgP4GdyaXOL5p9C?=
 =?iso-8859-1?Q?wfKnoVkwPWZWpPO6gghKpfRH4WKBnn8+XbfcpEtxIVdg1LzyYPJEOhlXAv?=
 =?iso-8859-1?Q?AIdd/Q3gbOk6AhmuEQ+56i7xPGxCzGAm0qQQLfJzFHB6173m0q9cxPZVST?=
 =?iso-8859-1?Q?8LGJy9swLW1tA8QQtrqJuZXqANQP2HnRN6xonXf/Op8qSvYlg38tAln1mG?=
 =?iso-8859-1?Q?RMaI317Pw8aq+AXtAG/2gG4kNgFO2oLDyDv8TU/1FbrzjNzrxm+3eJlgwA?=
 =?iso-8859-1?Q?h3RIAfSLVDgrWrRqwtrfR6R6HRDwrCfACLQbFT2aQQpQqQ/dAgSNET4Zp9?=
 =?iso-8859-1?Q?1a8TeBNLSGC2hb9bOkXWA/+nNELQQ8cUx5lle69y8kVl3KHWQKQPI1L3B5?=
 =?iso-8859-1?Q?I7ZQfysoQFSYJMOMH5xnCbtlLJXej+Ve+YxssEcGjIZSGKTQznrmK/vTk2?=
 =?iso-8859-1?Q?4R26NqQDz3PJq1fu5EpmfIsgxDVE51FOR3CbHHW7Gx+/0tzHTbPpy+RRQR?=
 =?iso-8859-1?Q?4Ohf7qmo/E1mWKtfBkwCUT9CvbBAPAlP4G4ZhO+fDWX6GHr+XGHkfEhlBQ?=
 =?iso-8859-1?Q?f/bQuz/v/txrRbn1+6iPTS+jw1EhRBRhIrQDT09jVQBTRCzmKeL0gESPDy?=
 =?iso-8859-1?Q?s5giSpTQsvlBT6fZx8XFooOvbqSrvHLmzGccv85FuXuzkEnCveQgfR+CjN?=
 =?iso-8859-1?Q?ZpD5PRFJg3RPA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f2fb62-c934-4cde-234f-08dab64fd532
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 06:12:02.1226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ikagDYOmsiMmF8zCJdTVSQv4xRjxfYI9biImFJzQTzy1fh18HTwzcsFmxoYf/sBCN49D+Ly5kelsNI5FyvbH5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P190MB0654
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pspDN51+qhWWN7Gg1gM8Y6L+qSeX4HZ4hqkMij1WBUw=;
 b=c7GOI+iOkwxFgMf0epXFmvulH1gHLqo3B4rnrXK3stFIDvQDyrZICfZatwSsF033TtWEu1m03zBDnSknUv8oNMxa3fl1LyhEqjCuobuGhm1dv2O1LSl3+zCzItL6Piy6/9Vwy2cZ8PWssdMK9BOwSqEzFTPgKCRLRs68VH4mhug=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=c7GOI+iO
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 08/11] package/llvm-project: bump to version
 15.0.3
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
Changes v1 -> v2:
- Bump to 15.0.3 instead of 15.0.1
- llvm: use CMAKE_HOST_C_COMPILER instead of HOSTCC
---
 package/llvm-project/clang/clang.hash         |  2 +-
 package/llvm-project/clang/clang.mk           |  8 +------
 .../llvm-project/compiler-rt/compiler-rt.hash |  2 +-
 .../llvm-project/compiler-rt/compiler-rt.mk   |  3 ++-
 package/llvm-project/lld/lld.hash             |  2 +-
 package/llvm-project/lld/lld.mk               |  8 +------
 .../llvm-project/llvm-cmake/llvm-cmake.hash   |  2 +-
 .../llvm-libunwind/llvm-libunwind.hash        |  2 +-
 package/llvm-project/llvm-project.mk          |  4 ++--
 .../llvm/0001-nfc-Fix-missing-include.patch   | 24 -------------------
 package/llvm-project/llvm/llvm.hash           |  2 +-
 package/llvm-project/llvm/llvm.mk             | 21 +++++++++-------
 12 files changed, 24 insertions(+), 56 deletions(-)
 delete mode 100644 package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch

diff --git a/package/llvm-project/clang/clang.hash b/package/llvm-project/clang/clang.hash
index 0136b80664..52c755cfb3 100644
--- a/package/llvm-project/clang/clang.hash
+++ b/package/llvm-project/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  0a8288f065d1f57cb6d96da4d2965cbea32edc572aa972e466e954d17148558b  clang-11.1.0.src.tar.xz
+sha256  96036052694e703d159c995bda203b59d1ff185c6879189b9eba837726e1738c  clang-15.0.3.src.tar.xz
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
index 8ee010ac5a..fe4e98164b 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.hash
+++ b/package/llvm-project/compiler-rt/compiler-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  def1fc00c764cd3abbba925c712ac38860a756a43b696b291f46fee09e453274  compiler-rt-11.1.0.src.tar.xz
+sha256  db958eee92d1571d8b7f76c1be8513817f1a888dcf6ced88aca871acfb0eeddd  compiler-rt-15.0.3.src.tar.xz
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
index 6d56ffcaab..2d2598dbeb 100644
--- a/package/llvm-project/lld/lld.hash
+++ b/package/llvm-project/lld/lld.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  017a788cbe1ecc4a949abf10755870519086d058a2e99f438829aef24f0c66ce  lld-11.1.0.src.tar.xz
+sha256  cd5d0894a74b957ce78d62212c1df0b3876a7297593aaece6b0512285e3b8732  lld-15.0.3.src.tar.xz
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
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash b/package/llvm-project/llvm-cmake/llvm-cmake.hash
index b76013e810..862c5d92e8 100644
--- a/package/llvm-project/llvm-cmake/llvm-cmake.hash
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  a660d1b7d4d2ef9759de6ad360d5fa9eed3625a6548068a97df2dd706edf2dd0  cmake-15.0.1.src.tar.xz
+sha256  21cf3f52c53dc8b8972122ae35a5c18de09c7df693b48b5cd8553c3e3fed090d  cmake-15.0.3.src.tar.xz
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
index 2d6286a40e..86775f5dba 100644
--- a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  65af59d7cd4672e2c1793402968f803beb3f91a92ad95f8702610a9a07a5ca10  libunwind-15.0.1.src.tar.xz
+sha256  0ab6e07bf05359e242e9ea80e4089b819914867fa997a715e324e584bcfdf114  libunwind-15.0.3.src.tar.xz
 sha256  b5efebcaca80879234098e52d1725e6d9eb8fb96a19fce625d39184b705f7b6d  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 747a6f5647..5859ff7cfc 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LLVM_PROJECT_VERSION_MAJOR = 11
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.0
+LLVM_PROJECT_VERSION_MAJOR = 15
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).0.3
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
index e7f79492de..df9aa88411 100644
--- a/package/llvm-project/llvm/llvm.hash
+++ b/package/llvm-project/llvm/llvm.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  ce8508e318a01a63d4e8b3090ab2ded3c598a50258cc49e2625b9120d4c03ea5  llvm-11.1.0.src.tar.xz
+sha256  c39aec729662416dcbf0bfe53a9786b34e7d93d02908a0779a2f6d83ad0a4a27  llvm-15.0.3.src.tar.xz
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
index 1adad17b16..5751ba4f7f 100644
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
+HOST_LLVM_CONF_OPTS += -DCMAKE_ASM_COMPILER="$(CMAKE_HOST_C_COMPILER)"
 
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
