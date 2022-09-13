Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C214C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 08:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D122A82AA7;
	Tue, 13 Sep 2022 08:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D122A82AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yAIDy-9eT_Yd; Tue, 13 Sep 2022 08:46:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18D1E82A26;
	Tue, 13 Sep 2022 08:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18D1E82A26
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF3011BF291
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 08:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7D76408ED
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 08:46:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7D76408ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mBLouO86EYcM for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 08:46:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AACB401EB
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80075.outbound.protection.outlook.com [40.107.8.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AACB401EB
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 08:46:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0yckEnLKY7b6SDmwM7ptH5lr+O7TX7iFiJGVgH5Vi2iPzbIFCfJ2dkx/N9yIm9eZj5LxnK5KiFaYl787ri7wypMAIITZg7SKnRD6jZYpVRcoCafFJm+jdqmwuGIa3fMVmClSOz7fITO46mkTRFLo6SPUxRmzfl7LGR2yMP7s03wU7aHIiJDsTTbcUGLzVetbc/RnqRZ2eod8tVW16sRMnNU+UZXBH/HgjG5/lOkIkIi3E2fGpONoDT6v4C3T3mfRYXiNNtLJfn5zcMN8T/quQBK1UMXrd/gSn/9BGXgrqwk3M9BJvOY+iYjd9ajPxeWkHjadMUjft32Cjs2+UTZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MO2Qokfn9Xhm7FJt9HMW2lMS8t2sJXfFGiBWHW2erSQ=;
 b=QBMOeHKVPetmHwRudzhK3hWB/S0x8eXxoUqXXj/5TsR2jYgzKl3HgdLDWqZKMh53tdBunXon5D3St96M67tNVQnF6P5/0rE8B5hDmqR8jfM247rPhCOm4heSf4BK3d0tR8vjIFIK6wRhn0+gGrvoqcHbXQCAiSPx630K5HmbLVb1VqNfTx9Jjf/QRcLJ3s90oDmlpDW15Op0jJ2XokRIpUIddG0U0AC2w0MW3gIcyJZdmZ+XAzx2RasKb82rQjxeRoY2+OXAfKy/BMAv25Pg2Tc3D7a2ITWbK71ZYBzFB6r7Q2dl6iBPMDNgVsYAvHFMBJhWDgc2i+B3nEth6562xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM7P190MB0678.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:11e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Tue, 13 Sep
 2022 08:46:29 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76%4]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 08:46:29 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/vim: security bump to version 9.0.0453
Thread-Index: AQHYx00lKzmLZJ3uU0mlkHOzGq2RuA==
Date: Tue, 13 Sep 2022 08:46:29 +0000
Message-ID: <VI1P190MB04933203BAC82BF8A05205FB9F479@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM7P190MB0678:EE_
x-ms-office365-filtering-correlation-id: c65fb0eb-2642-46be-499f-08da95647360
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ojm/BI6rxDBlilryUkeJCnRwwM+scEs9ZcMw+KaUrzTuSfOpxQM2etoj6LnO9PesoyK1kbvXlqF9bg3ynbPQ257aDhhO/FOjBqERKdi9T8Nw5C7zSVdxjTKoCe0LduZwe/9pE82r0xKNzJBaEKgkV+hZXAwNXY2uMn3qUgZwp9f/pDEis5B+RRz4bnnhm7QiNN2Z267iX3cFKSH/Iou+9sUQaACwDqKLGLkBFx2Xj68HfPlY9T5lInVfNiS+P1ggQHuV3w/ZEl0NYk89+gvdJ7SEUsYnqW77A2dhFCslbJKY9toXjgPhyzktAoYao2ZvjIiDI5Jj+DHsfmrEAvpZih68W8l6JsiaBQVufw6t1ROBCi+QP2lJcaITxaZNzDAn96vIqXTfX9d2wn+QJ2yxlxLqcYRKxVpznseCKWupQW4WZgWts1PEQ101VLpxhI+rcmzWaNjtPdPFbyW9H7pkewqGxBrg+R8I90+de2vV3WDBB2DHZ85v3QSMYeBsEPNpw+hBMpDFbEmlMzcAzrvYNoTRRJf8aQCuDUPZVKV5+L/+vaM2vRD5fOpjtx6MqSzlaCiJv1HHZ4md6ZpFPr7ycMVbV2Bez9AGXzlI3jPr5jmr+xK7yG4L9yTofwDLLXIDMoqgForZ6bccmudTV2CFygpkR4M1GTRTCpJQvdyRPmeW8tBDU1VBRB+ZRU/G4qeUT2VS0QbG/dA2pjpl/Y0H1i7VK4pGMqqtLjs9oR6vrtI67/NXESUU+5S0rCdjFSI/NjF16I/84TX79IH/D3gPlw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39840400004)(366004)(376002)(346002)(451199015)(122000001)(66476007)(6916009)(66556008)(66446008)(64756008)(186003)(38100700002)(6506007)(7696005)(26005)(9686003)(316002)(83380400001)(33656002)(71200400001)(38070700005)(55016003)(66946007)(76116006)(478600001)(41300700001)(2906002)(8676002)(52536014)(8936002)(5660300002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?S2idOPrK/fOi+APLKsNUCuSNDdUprARtHs9ZGcRJPAgalc9X2JCorZw8+3?=
 =?iso-8859-1?Q?KzLzw5bXexYSZzJw4Np/a6VDzV1Zu74nkhDpvPUbPctTYT/ha2PiDtycOy?=
 =?iso-8859-1?Q?cyQAzI98DnnHsKCB78BS5UtJko8zWXM2OSn89TV3Zrq8H+/qsAC2ICtiz5?=
 =?iso-8859-1?Q?Aq/cPtMa7JcgIaHsiAjQUDYL9YlbuSXQqKlK2KqyGXQCQCvjmrqtMbLHiX?=
 =?iso-8859-1?Q?q3yi846Emm3JKfb9MPl+zsDA+cM4aXyhtRlMLX6I/zvIx833MRdhY47VT4?=
 =?iso-8859-1?Q?l8aAFCc/xWAPPkPWcw9e+ybIhVxBxt1FdRneW7ge0G1pfF6hvQE6BVnRXL?=
 =?iso-8859-1?Q?gZ7ovnAEvCFsUJmEoTrL6I1/M2M/c9uVTKgcEiUjLsKiAa30l+vL+IJe8V?=
 =?iso-8859-1?Q?dukCuTQQKxWmNTp8SSoUQ+ypOQ3Io5ba8biqLd5VciJL7mxLBdBkghZPuI?=
 =?iso-8859-1?Q?gx0zSZno/kTDamaRb21SVjVOyRYJIXAONBSlMo2t47bTjXjeKycSxLzwF1?=
 =?iso-8859-1?Q?vM8zRCoxaKhBbwoW6GZf1KEWL41msZbSfI9ewmmyXxTAkzeOjIDESfv89C?=
 =?iso-8859-1?Q?Ht/ggb5gj6bci0GwKF3XfZMaDNpGQdalpyyUe9xNMipDNwXNut4e6JccbD?=
 =?iso-8859-1?Q?OLYSUfMvPtPIxaB8czKjSavyFeBeq3+EAVE307/nBzQTNjgFORkKeLXFFO?=
 =?iso-8859-1?Q?I9DgxwfLCrbRp4Q3xxISsbOIbVvjBceY8CXiORtP552PpqGAKJrKZuKnzb?=
 =?iso-8859-1?Q?RxREhSyf2xDAiG/r2tz+ROKN4yw3zG1Wu9xb8wAgbcKPH96UOcH65WrDnK?=
 =?iso-8859-1?Q?plDOEt5g2Ltmun/k9SipmKkWePuyRDEf0QLj7aH6srQNGtHL8AiLhLqPaS?=
 =?iso-8859-1?Q?HEzk6pWDeXmzVmvKFj6OT9rXa5Rn4Cxi5OTrkoMFFOLBaOLtYoJQaE6a+Z?=
 =?iso-8859-1?Q?M6fSdaqgnhmPYKBnjDPGpyXs/Vk4Iiasnxhm6ykL9sIBSok/bGJFKB3AXm?=
 =?iso-8859-1?Q?0ly7U9WYDdsZE4q3XQt1szJ9Ub6Hlg1GnqeG0V/Z9wERXjbIJBfiOJCNK0?=
 =?iso-8859-1?Q?H2ywoTorPQNB8YZ6ybhIxudVcYpDSnz4HTr+Iw6OVYO/nm9QfFvByQXoNF?=
 =?iso-8859-1?Q?FFBBFhT+NeFuKdLgQk2n3ZK8i6u7FDSy8wuuNu5W/pZ43xaL9+DmTOU09R?=
 =?iso-8859-1?Q?FmCtIDuQRnwu16EYC8u4pA1Ni0ePROeIyVx92zR8L9ou87mHeIQ55FPK9a?=
 =?iso-8859-1?Q?uRM432NmBX8WtXH9PTxmrnqU+WBgqf1aVo76D4w/J9t3D/tu9wN2sBlDD5?=
 =?iso-8859-1?Q?BWyDfsky0ZwKMfFxYdwOB1cdMO7MY//aFtYl20BpwjLJaQwQhfnKnH8QAH?=
 =?iso-8859-1?Q?lwKBu5cFpN5PkuvAla8D9QANmTURrR9YTwOeylDe8rUm5FTgNNuRytvWi/?=
 =?iso-8859-1?Q?C+l9CBdcUZZN+xFrj+ri45c+SAYeqnpzHmJv9X/X5Rl5RFK48TMhGjRNqd?=
 =?iso-8859-1?Q?GkTpJoQ6+s+Y/xtaVSGUUV4MZnuwNzTMT+8sfENGJ/9E7blHGl+gG7w0Dv?=
 =?iso-8859-1?Q?U+kVR3luYnWHtbI+jF0fcWi97TRxS+hiMMQIMm0Ym8Sxg0jUnhr5v4uSoS?=
 =?iso-8859-1?Q?9Zz81VwFAYGTs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c65fb0eb-2642-46be-499f-08da95647360
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 08:46:29.0836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZsetwHnm0BhE6ZQ7ahi9qFnIT0f0FG2DR2igUauE9MGJ2qSUspO/gq3jKhXcax0YTaSGzdJafbtvL+pD0cCXVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P190MB0678
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MO2Qokfn9Xhm7FJt9HMW2lMS8t2sJXfFGiBWHW2erSQ=;
 b=QVQlNOP+oiYoYZ35t7cFNKmDbXvGyeZUUf5iJHQeWYs6oMFH50/9H5RFxV0I1FXQr4Q9qYy2zugmNSaZ9KJsSybngGDi5R2Kiz+yTPRfwzFq8oJBAiwBgNTbXvAPS6ftNbhoOEigfDqmdxtpZLLE6g5zxxFuzxHBwDOSBKL26Pc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=QVQlNOP+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 9.0.0453
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-3037, CVE-2022-3099, CVE-2022-3134

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index f06d084cb3..0c6b720dd1 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  7c97f8e8cc56157cad7d461633beb347472e134e96b5545d24d1fe451dfaecc2  vim-9.0.0292.tar.gz
+sha256  b90063706a2a9ee234275e0dd4b71a11e24867c33203c432fd6e9799fdc3bff9  vim-9.0.0453.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  4afae7c984ab1a4ccd0b474a695f316e7435ab6ed46537648af925c18835d853  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 5e7c34abbb..3f1985f036 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.0.0292
+VIM_VERSION = 9.0.0453
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
