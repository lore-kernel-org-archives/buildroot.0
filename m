Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE83C6FA8E
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 09:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8791860D5F;
	Thu,  2 Mar 2023 09:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8791860D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m18_WlZWAdVf; Thu,  2 Mar 2023 09:26:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C16A060BC6;
	Thu,  2 Mar 2023 09:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C16A060BC6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE3821BF322
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 09:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8379D418FD
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 09:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8379D418FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HsuQ0yjNJq3O for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 09:26:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B3C9418FE
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::603])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B3C9418FE
 for <buildroot@buildroot.org>; Thu,  2 Mar 2023 09:26:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkDrClAO05Ltst+zyaZH+O6KdmFoID/5DydqeEFGaUf8PCyVZkUOuP0y1ET6ebso4Ybqe7TK1G0GPqtboYhT9nUMrKlWdjAgyJNQhVmWUhaQZjc0hTX6ew+bkuDK+sFIobPkjMJZDNa8Mzo1M+CvxcsIaoKvzTP7XGcENJmLl74LEAVkdx8C+mQK3wZSQxIwYCrpYE4jjYpD2CbV1OV0eiN25dVoMnJk5t9Q+NsRQ7hyaCm7Cai4WGJ3/fZ2gBv4Ckt6vXCbHorPtwwmuI54CWHNQDmZ3HptGOwSRmfDo7jW2+JWxgdMvSmAokty8HuVPrZtEMEQKGsZ0k/zM3LzOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W36HrXBo/8LYD9XAgid7AGFdneNtOWAJrf3sBlEBMY0=;
 b=apC4VTAgrGeXs+OClYuV3QcYlaroIMzDolLlc0COR4VV8dZjQVqYrPs/7PdX0RL3hiNKD61TWemaI3t7rC2H7fQCpN50K7A4Uz0NA8PF13j5190de5QHepAG5Fs2W+Ry0GLwIHn202R6hKtfnrY4A/8OumGH/KIWgxkNdiGyWm2G/9K0uFqJa2yYiaHKwxodCSUnrILkV6dPZve7p96nr3/lDMZOAJOMOY0o5D292lKzNY60nW4R6DTt3KVfIzvbbC42qnXUsulkaT55vUkrzgdBXygf2o2Ij2d0tB32f/hkb+sfKI/nmdVVYjiToPrjD77BtpN9x4ZKPaSz2qKL2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM7P190MB0757.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:11c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Thu, 2 Mar
 2023 09:26:03 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%4]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 09:26:03 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH] package/swupdate: fix ipc header include
Thread-Index: AQHZTOjtqDE/XSpQYU2rIkz4lPTDWw==
Date: Thu, 2 Mar 2023 09:26:03 +0000
Message-ID: <VI1P190MB0493D233ECC579510F8C0FC69FB29@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM7P190MB0757:EE_
x-ms-office365-filtering-correlation-id: 6e3271f9-d045-4da9-989d-08db1b0024d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HeOPk8F+WYtBtsy0UBLmGeMYIk9/9xfT3WGuew1XoHY5gJHxFWNzU3lsKGBBMcrZbRxRewvBef8mPnbBhoU7dozDpdYjINDC68QSxjaz4NavXfL6o51trmxbf1E1aFqzrQFkpn4Pj8EsX1UheF7EVlTdSOKeVD3JrKQxnk+KvFInQBmZQRGTYVMm3TNKXq5VUpjRbBkpK9Qb9McWWAdjvpyI3rkduECJM1Y2500m2qI72PpYLuaCOfnnCb3tWlNmKtYMvwm/TrEzvIvFYOOKvcaxHc1/yDLZfGVD7sJpYgysWUUu6BBwKEEPHzRmUjpN/NVJxsdIkNX8yrjnOZuPLSNd5XhZALU5IKckfEh/mKMy5+1X14YFNSiNWXovXqJct+BCGUoiorInAJNZkCpX5Q+Z02iMnBQu2LJySXekxRM9Y9IGS5R3iX31htF0kcTkwmWcbSXdIRWsU2zRYULLa4Z8Wy1mlVolmpfPMvE9cQpta50ewxMZ/BKjn4F09VE+/1Z2RctG2JrGIr5mc4X2IwZxbCHI76bFpd+lXt+/38gic9gTryRXLNxsplXGktV9uHA++gR0WFbrYbMW8ddYVw5jsH7OpB/glSg08qupwPp2+ZuC1hoWc6U4wp6NfT5VqeYqmTh5k7yGvh86c7pzujHrKQflNo0n7BVvSPKeKwI9ISNakOUwfrb/MtrubL+V
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(39830400003)(136003)(346002)(376002)(451199018)(83380400001)(38100700002)(122000001)(8936002)(5660300002)(33656002)(52536014)(478600001)(66946007)(71200400001)(86362001)(38070700005)(55016003)(9686003)(186003)(26005)(6506007)(66476007)(76116006)(66556008)(7696005)(2906002)(8676002)(66446008)(45080400002)(64756008)(6916009)(316002)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?nyDa0MIqPl7V5Ig9GEcZw2AB6H5nNhrIMQfPGuCkQZ0ntEfytPmH1PTvqH?=
 =?iso-8859-1?Q?NKOlu6oIbwHEdg4ygc3Iv7+4F5QeEtBFtKxOmmG7kgZ8rZt9f74MgRq7us?=
 =?iso-8859-1?Q?aNBjapJYU5viXLTS3zOGP0SOhY2xsCy1Kgb9GE5rrvhb3Aj8e7jL6xZXTG?=
 =?iso-8859-1?Q?o80pZEpoEfo6XEy6EaO1Qg79nnlA35490HsVNUioLseySpNPN7lMXB7NRI?=
 =?iso-8859-1?Q?N5up+kee+sA/MT9qBI2WUq1puQijolyw5Pa/Zu+fTXL/g+LSl06BaNnAvb?=
 =?iso-8859-1?Q?9WvK3zV44igUhnUYNJWh8BnfxOo9AlhtzcG0chIS0NKEHbG+v20rZSKKNc?=
 =?iso-8859-1?Q?4Ap3ZwhJ9mXlVTqxtS7R4p9x5fi2FIC9ExAtVPhY44CppbUqTeyyv2WAMC?=
 =?iso-8859-1?Q?GrAcLZyMiysdOmGz9qBV5PCr4UCpKwJyrtosYwGUTL8DVglopEaRWomw9X?=
 =?iso-8859-1?Q?D0rBmktu3qhQ6+agjxz8YyiV964BbOUIXkC1NG23nwUUAOKO9zYaSncIjd?=
 =?iso-8859-1?Q?Su6EV2tibORJ7Mxu16XatQrrQC6UqEjSPn8VC+EcihAud9ts6O0tYDoaqC?=
 =?iso-8859-1?Q?b5yu0x4OmBeuRVL0+dmBOYp5duoGhV1qx6ViL4zfA52hYMFUCOE2l7m/pa?=
 =?iso-8859-1?Q?Ttw30UcOR7ppvFahSHfcV5PUwuAs0xhWtu7uBr7C286dR4APGvQyxShfLD?=
 =?iso-8859-1?Q?EG8ZQdKUjGQjYJc97etMiWCIMjJjI+xstdxFFWuL6bh61/NAIJgDPeFymc?=
 =?iso-8859-1?Q?ofqz5bj22gzLvotcE75zK2UbO9V/SXdngzVAFgSioKIXSPbUiCmC3slRG4?=
 =?iso-8859-1?Q?Pfs3TZNyIqK4XA19dlQs/qOl1eGsSFvXrU7BqOufwhQxNgbAiqYbWm8Gyz?=
 =?iso-8859-1?Q?jibcpWpZ7bHIopF4IbHCTFJMxd5R945HwRQRw4wFI+7y8SUgra9RyXxMmT?=
 =?iso-8859-1?Q?xRPNJukRtjTajLbwqfkKZ747+GWpPnEc+B7Jnuqiw/E8OSmTgO9RPbELm+?=
 =?iso-8859-1?Q?n/ozmoLIqduzlA/SGEWNHFI50PGa26/EByFZnNvrlpV9pgfitwrORbDdiI?=
 =?iso-8859-1?Q?7l6Uje9CXxdtxg6Doy5MJLq7A18rxxXYjWCQHJuJQf7Nz0L/csbibitF1M?=
 =?iso-8859-1?Q?UO26Z4HK+YexiwzrKsurNEsnRlBSPbTuwGkMA+/ZciHnZMHcHZdv8panVC?=
 =?iso-8859-1?Q?uWtVjwGq7pRO7VXNDOxbydml9VTEKlPc5Gjbi1HeXvS8DUE0UUzMFau5ej?=
 =?iso-8859-1?Q?jjkTw7L60gGt/XyYL2PkPvTgAODdJclkjbwEoqZ6pZ5V8CgOZEQZsMsxeA?=
 =?iso-8859-1?Q?IvIntznELE9IQ90b5GAGva61DciRNFYRsHnuVxt0iPWdvsmGoIGS2rw00+?=
 =?iso-8859-1?Q?z0AgnqPvv++jRPgXL9N4xBFP0Mn+ifvqKikkn6DMtTwo7qPBKGSMbRaqEJ?=
 =?iso-8859-1?Q?moCdtx2q9zKxr1EHw0fjoS9bxayZaIcIQjr3L0XJHNpSZ/iL69NWZF9gig?=
 =?iso-8859-1?Q?zAhmzJnGmuohSbjU/vwRgHFvToxu0Unf7+bbH/uNrwqlZHWXnbUOwE0iCR?=
 =?iso-8859-1?Q?HqYwaEIKer2bt/LkTlCg8/6iyuWrRBvb3js0H/guchUeMCkjMXD8g14xxh?=
 =?iso-8859-1?Q?glF5BeG/CmBmY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e3271f9-d045-4da9-989d-08db1b0024d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2023 09:26:03.4869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nBLem5ttOaAs6UF6vm2vLjD3t7d8PqDBtlpYqsYsviDorf8FbBq0mfokVvoygfJfO/L2GBOPA7KMEmZVcH0Upg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P190MB0757
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W36HrXBo/8LYD9XAgid7AGFdneNtOWAJrf3sBlEBMY0=;
 b=itDMfCudbnYUPR8DYCc9esU4tOuThWXJ0yhLjG+nudY36Zg5PetdFvXzG3j4yljtWVb6zhvdTh8bmGBF0ZVpJgNUNbHJcWFW4P/y0GyvcJqvocnfTOfaP45t29JB2bnLqZALh1gsPv3zLdbMIJXH0ZkSTDScFTEYzbhy6rKHPew=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=itDMfCud
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH] package/swupdate: fix ipc header include
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

Compilation for other programs trying to use swupdate headers will fail
because the header is located in $STAGING_DIR/usr/include/swupdate and
not $STAGING_DIR/usr/include.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 .../swupdate/0001-progress_ipc-include.patch  | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/swupdate/0001-progress_ipc-include.patch

diff --git a/package/swupdate/0001-progress_ipc-include.patch b/package/swupdate/0001-progress_ipc-include.patch
new file mode 100644
index 0000000000..cb555bc63b
--- /dev/null
+++ b/package/swupdate/0001-progress_ipc-include.patch
@@ -0,0 +1,33 @@
+From d073bf21c1021d313ae3edc92c8e89993e01fae4 Mon Sep 17 00:00:00 2001
+From: Lang Daniel <d.lang@abatec.at>
+Date: Thu, 2 Mar 2023 08:43:33 +0100
+Subject: [PATCH] process: fix include
+
+The header might be installed to a subdirectory of /usr/include (like
+with buildroot which sets /usr/include/swupdate). swupdate_status.h will
+not be found in this case.
+
+
+Signed-off-by: Daniel Lang <d.lang@abatec.at>
+[Upstream status:
+https://patchwork.ozlabs.org/project/swupdate/patch/VI1P190MB0493A1E34DC101CFDD5DFBB59FB29@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM/]
+---
+ include/progress_ipc.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/progress_ipc.h b/include/progress_ipc.h
+index 5d0be1c..30e5266 100644
+--- a/include/progress_ipc.h
++++ b/include/progress_ipc.h
+@@ -9,7 +9,7 @@
+ #define _PROGRESS_IPC_H
+ 
+ #include <stdbool.h>
+-#include <swupdate_status.h>
++#include "swupdate_status.h"
+ 
+ #ifdef __cplusplus
+ extern "C" {
+-- 
+2.25.1
+
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
