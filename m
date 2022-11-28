Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78458C433FE
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 15:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0584360B9F;
	Mon, 28 Nov 2022 15:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0584360B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8z9VAQB5MH7b; Mon, 28 Nov 2022 15:06:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25C4D60B88;
	Mon, 28 Nov 2022 15:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25C4D60B88
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50FC01BF329
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 15:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED356402F5
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 15:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED356402F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RHb0rTAR8mxE for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 15:06:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2061E400DB
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::609])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2061E400DB
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 15:06:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNeuyRpzwRqHdhFSV7b6QGnRYlecwusWGDEXu/bvuLWbeqEnK6Hga8e9ZxnX85p9FU0Gc5CoMvuqEBNxW0OB4rzK30hZcT5oHCoJ9scvsp8r1HqsUwGIloLJyYWtez2+1or4rSAOTiuSNXf8vY44tTLaW8WfoarzbZgj6omhCHfrdbYzZ74bSNFtWLXKOtpKHoHP9Bfiqc8uWiselUmrR4xI59auQLgONoweQXTDEw6UdbGtKFlWAw0KYyv0ZHDIQVgsPBwdK5ZExJJlSFzjveMrLgIFp2q48/hWtcJ8UK9DpP7y9+4myglVJQBZngS2PiiNxZ2etp48QH9dn/aaRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O00aZav0pfeSu9l+/iGHsAm7PXp2PYIcNlvZ/6RPsKs=;
 b=mrrsLQzM3nhwueBKnmR/HkqGWnYTI8VFxlFY9aScjtrzjFTwpfW3douTf31God84Mjb991VjtrrDK05D1yMZK5G1/X60J4s1L5jHbm9FIYdIVv8B39pNIDaMBaX/AkKjC2e7I3nxyRpTuN8jR13H8n68Ss5Gr7O+TRxwLV0P0f4/AbEK6RLucautxizE0/sdedAIRSgxle7LNop3if/ok8mpJjFvHVw6ZguoUOKKntwXlp7E6aO7qQ4VqTtMZsQfaoys/CgJ6INoRLbUPlZK8ycD1UFhJM2KggdMnnkzFfPH/Ht/R1XG1plYBcH+K5ewxSfsQ+nM6HOBOCu5utmC0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DBAP190MB0854.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:1b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 15:06:20 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::2e8a:56c3:e3a7:7bfd]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::2e8a:56c3:e3a7:7bfd%6]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 15:06:20 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH] package/libbpf: Don't remove bpf.h on host
Thread-Index: AQHZAzqHULagjxVHLU2Gb9vmtMeK/g==
Date: Mon, 28 Nov 2022 15:06:20 +0000
Message-ID: <VI1P190MB04936E3BDB708B8974C8287B9F139@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DBAP190MB0854:EE_
x-ms-office365-filtering-correlation-id: 6af50dc9-925a-4939-454a-08dad1521b92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uXps7cuhtFuUCa5vTIap0TQBAaLpwfZ8aiJ+AnhwJLgTRf/umrzmnq9Ec9tM3Mc1rI2cVAcyMyWjbWRa/3fUWqYTVKCkDbC0S0ANacrdztM0n7VmCCuKSs1fzzyO4YVv7qTwsIr6V67lpP7jnsSZ3SQUoJDVX2sOSQBG6j+huln3Seg/6em5HNnnUOm3Ic+qZ0wqvKzxK+4+zdmn3wUCUqcv/+tvsD7OVzYHwitibSqK3nqJ8UUbocrKG+ktsR7ZJ+5zRhGapIhbdvKSt/Xo7ec9u4j0W4r++xq/A1+InpqyHV+Zj0iuyU7hWtK6d/e5OsJeoo1+tx8suwUkX1geYxTMinofmSaVRIT8sefZAPqMuIe009hBqlLr6b2hlvms19sNGVmaUhU7WJfbdwMg+sYHjp4Iw7dAp0+shpmI7TiCtoyl2lIDQGl25uSidXg33agzL7FQCQr7aOtdEXOhVxp7r6/SgZk+UyAMMXH30dkSIxORAX/6ofvsR6DX+qeKqqoGjt1y0I9mRvFgRg7rgG6TS5QWg+lPN9rFr4X/SSX0I9j6qbqz1G8gN5cm/7HllU2MNlGixyQ95PJg6d+ZIEZcWQJkhD4Rs9y0no0F4Vp3QUnXiqkoYzhDoFTMKMEN92RW0gI7unISO1mYl17bW+uxydRKxpH/DwRs3wSWBJigtYRuEyCDv17VmnGNhdGkXD0d16d6GA3C4lFMgnmwRlQGvYVtyKIc+xGjTxXEcds=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(366004)(136003)(346002)(396003)(376002)(451199015)(966005)(6506007)(7696005)(83380400001)(86362001)(478600001)(71200400001)(26005)(6916009)(316002)(54906003)(9686003)(52536014)(41300700001)(5660300002)(55016003)(33656002)(38070700005)(38100700002)(2906002)(4326008)(8676002)(76116006)(186003)(8936002)(64756008)(66446008)(66556008)(66946007)(66476007)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MFc5ZR4J4+HDps60/A8okmrBFHadJtwLeWmj7rdltdGpSWkF6SBYNKE49g?=
 =?iso-8859-1?Q?5N+L+ywy8NkVtH1LLZwpBdKpCMSnNM4KAVeogFDuAgbYQwgjdS+4r6go5s?=
 =?iso-8859-1?Q?QMxrD3qvpMRvnYJqohLp7wfCgsZcMepicOlnxWxhkW9gG5Pwk9rv6TXZgI?=
 =?iso-8859-1?Q?+iwaHpcwA079mr7YR0buJBAR2xAdZBq/12H9OhsA0mFYS+c2LtfxZtGWIu?=
 =?iso-8859-1?Q?yMNcFT5MBGOxDiz/o00xgWGWb2fAjGKlE2WtSKyAAyhJ7+Q2lgF9+Pn4kZ?=
 =?iso-8859-1?Q?2GoWtkj28P3Q+Wnl07HVis9sFDQgtQfzpl4qEKMZtb+/NuppaqyCh3Ke1i?=
 =?iso-8859-1?Q?8+9ZmHHhGZdjgl5Wu+ZDA81ww1xIPGhnBQUnZT1CLHOxbH6KqaVRj0aMVR?=
 =?iso-8859-1?Q?wPQZ8rnTJT0KOMzfCTUJEadt18ZQ8K2yO1ZVSpvKXL366M6MODAATQyxHJ?=
 =?iso-8859-1?Q?U/t+2v//sRkD8AmaQiQnFNfoFdrubzYgvE29nfZLhUspq3KmhIAppKil0l?=
 =?iso-8859-1?Q?lG23FmpVxzfuSvQ/7qfFIZxqk4hMcAORjTnXbJKx9Ah9pda6hXKtn3+oFl?=
 =?iso-8859-1?Q?6+QTC1RtYMnMG5It8m9rnbPqwwnLUVY6xSJYA3lEsguWA48oSrzO4mZklU?=
 =?iso-8859-1?Q?/5CI7d7ZM5a6IjKOfb4MTBpvfzolIB7ob0Oett1PXGJEjQ6NGAzXKlcrdy?=
 =?iso-8859-1?Q?J+gXp/AxB0SAisdx5C62kPYRYUMrnd2Yy7mdkzQUBG4OwAGa83G0iIH6c3?=
 =?iso-8859-1?Q?Z3Ri+VqXhgbivggZL6FB0JxVLIfkkhlKX0RtH9skwWDVWFC9FzHKRTXazr?=
 =?iso-8859-1?Q?UXjSN+ZBCjhENP/7i345SKfbJn8sZdlpU9aPgx3uWj64rL32IOpyRS9cAc?=
 =?iso-8859-1?Q?deTg0roxzMD64s0gT9bauNmhPTrhZLz+5fUNdbpGRGf4WADsrqjGloD5nx?=
 =?iso-8859-1?Q?uphuFAy7jvtbm8mEtV55ifJwZ1CMVSUpHFprE7K/dGhRm83nE6wjqYS7ln?=
 =?iso-8859-1?Q?tHrkcCtjzlNFp8A1jbgiyWIc4IMeuUZG+WM5SZ3bYwj03vu+GE5E3ojHXf?=
 =?iso-8859-1?Q?hJDFn3QQrpxcYe2Ps5C7v0aj5Nyr9gmexEziPXNJSKQUbBVGvCnufEAM23?=
 =?iso-8859-1?Q?A5zoM7VvDTLzLSq0tM5j/VlQjWxDGvlY+YjLkgODB2dcysSLOC1KlkrEL8?=
 =?iso-8859-1?Q?4LUQal5emMdY5mqMI+fllPNLceRgyJ06hEk7W2DZO1Wge5dfl6GQ5HwwTs?=
 =?iso-8859-1?Q?zIYjo3Brb1W9jppxikdh25+RYdeWVWE+pJldMpKWD43v7Q9y9eOe2pyjxN?=
 =?iso-8859-1?Q?aCHDQdJrQEYcoJQ76zu3vRzKziQ927wrAihBQ3tEuioCrwjZfbVjjD957L?=
 =?iso-8859-1?Q?9RKuq71xK/s09QxbCjVDB+MMxL4T4Ikadh1h6Ys2l5t9lWdrUXdBNO9xJY?=
 =?iso-8859-1?Q?bBegSCWCWGUInaHOd9Mq3wyuAYcpWjBazl/vPGOqWed7a8/ikYeLRCZP5a?=
 =?iso-8859-1?Q?DFNdx86ZyQKv6QjPTrCppay1Msm3MbSZDzahsljHEDqls4VQV71LEHjhvg?=
 =?iso-8859-1?Q?ehyvNrXfrjf1e7hgCeSW1ZdQDJkfFFjJYExjuJLQUVH+TSn1ETy9R5AACk?=
 =?iso-8859-1?Q?VF/VogAdmSdlw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af50dc9-925a-4939-454a-08dad1521b92
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2022 15:06:20.5815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jmh3cNFPXOJ1BAcsK6L0rm3ZVLDw0Ppb3mkQ/1UyQgcLb/lnbf/3NbAvN2gkzGl/MfkkjdcLKi+S+z16f0pdHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP190MB0854
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O00aZav0pfeSu9l+/iGHsAm7PXp2PYIcNlvZ/6RPsKs=;
 b=Fe7oV3063Zi+4fpGDs3pvjSA+tqprUi9TZ+yguPMIH9bKr1iR91GVmHWt1X41Eq4XgDqHZkT0Hy0WvvdvgY2EOiTv9OJD/ZkJLqv+WSn5It8xiY5PYSSfVIPizA27CxORj41J2memEyGMGz05mi7j3agxw+ad9Y9d5PJ/otDozQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=Fe7oV306
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH] package/libbpf: Don't remove bpf.h on host
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libbpf >1.0.0 defines libbpf_bpf_link_type_str(enum bpf_link_type) in
src/libbpf.h, which is included by host-pahole.
bpf_link_type is defined in linux/bpf.h, therefore the comment stating
that pahole doesn't need bpf.h is no longer valid.

Fixes:
- http://autobuild.buildroot.net/results/d126a4b6eca786402dc362c86f8df3addec3d217/

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
I wasn't able to reproduce the mentioned compile error in the kernel.
The mentioned file (tools/lib/bpf/strset.c) shouldn't be compiled when
compiling the kernel as it would recompile libbpf.
---
 package/libbpf/libbpf.mk | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index 820f1dc4bf..0381fd833a 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -39,26 +39,11 @@ define LIBBPF_INSTALL_TARGET_CMDS
 		-C $(@D)/src install DESTDIR=$(TARGET_DIR)
 endef
 
-# We need to install_uapi_headers so we have btf.h to compile
-# host-pahole.
-# Nonetheless, this target adds bpf.h which generates a conflict when
-# building the kernel:
-# In file included from libbpf_internal.h:17:0, from strset.c:9:
-# relo_core.h:10:6: error: nested redefinition of 'enum bpf_core_relo_kind'
-# enum bpf_core_relo_kind {
-# ^~~~~~~~~~~~~~~~~~
-# relo_core.h:10:6: error: redeclaration of 'enum bpf_core_relo_kind'
-# In file included from libbpf_legacy.h:13:0,
-# 		from libbpf_internal.h:16,
-# 		from strset.c:9:
-# /home/francis/buildroot/output/host/include/linux/bpf.h:6497:6: note: originally defined here
-# enum bpf_core_relo_kind {
-# So, better to remove remove it now since we do not need it to build
+# We need to install_uapi_headers so we have bpf.h and btf.h to compile
 # host-pahole, the only user of host-libbpf.
 define HOST_LIBBPF_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
 		-C $(@D)/src install install_uapi_headers DESTDIR=$(HOST_DIR)
-	rm $(HOST_DIR)/include/linux/bpf.h
 endef
 
 $(eval $(generic-package))
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
