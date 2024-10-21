Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73822D0E6F4
	for <buildroot@archiver.kernel.org>; Mon, 21 Oct 2024 11:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0917E402A7;
	Mon, 21 Oct 2024 11:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vy4BzH_cYe7F; Mon, 21 Oct 2024 11:46:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 794FA402FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 794FA402FD;
	Mon, 21 Oct 2024 11:46:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EFD871F
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 11:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FACD40175
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 11:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2vgcK_ANQeP for <buildroot@buildroot.org>;
 Mon, 21 Oct 2024 11:46:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:260e::716;
 helo=eur03-am7-obe.outbound.protection.outlook.com;
 envelope-from=aleyssens@idtech.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D1FB400C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D1FB400C5
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20716.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:260e::716])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D1FB400C5
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 11:46:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBXOpDIT5rVEw4ziEla7/du0VhMwcPIgaga33K/eS5cDBnaujBczP6TWPwWnDg61eq/CoL5hInIOvS8xlnsmfJy+n5C+6bcw6VWXSxfw4+/CqW9REd3e6V2/8szIOvsAn1sZv77ryhj1HaAYucQng3VLbYYHXS74XHfvFvh6r+LsZ2FBfbhkp/dCRVeH7ME5cOGl7EllwQvJnaz1mLH12U/e4tFMBMX5uPECNGwrwe9CQOjVrU6iQG3gfRcBRB3b4leEHIouKsWj/p2R3iI97kRmqYw2fxRpWr9zObsAG0Zo7ywA6k0pPlyWaXAMVNassOP+yUGhiLHiQa2xW+sYiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQOEw9m8vEHwSJszHLPVQcbz5+HHkdyFVXX/k9Ei4RM=;
 b=ayGEsENvNLC/VSgO9I2TQkLIq0seNQk9KiWb09T6mOna50cmpWrLedNycZHEnxv/rBq/KFsdvfdELlZXa/MgV6eXWyqa7aY4sTj2DGD8rwJEkMIsOQMQvY2cnFDrJ19Jq+5Clfl890WarZr2sOKOueOt54bIQSysM1wSPmRtWizi5hX4letRjHBssFrSHvn6XQDULxQFMbaC1U11eFfK/JEQPCqtKdFUqM4IBxm2nrBOssS6URQxeahlwVbbBBsog5SM+lJnrv/bRwlfOKhTuHG4FADfh0eMD23MhsaVQU7krXcdchruslMIuVyxHKSCXhA5DldAp5xPFIxZc1VzWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=idtech.be; dmarc=pass action=none header.from=idtech.be;
 dkim=pass header.d=idtech.be; arc=none
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com (2603:10a6:800:1dd::19)
 by VI0PR06MB9746.eurprd06.prod.outlook.com (2603:10a6:800:216::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 11:46:28 +0000
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4]) by VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 11:46:28 +0000
From: Ayrton Leyssens <aleyssens@idtech.be>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/libtevent: add libtevent package
Thread-Index: Adsjrr0VZCNu9HOzTAColIJnvb08jA==
Date: Mon, 21 Oct 2024 11:46:27 +0000
Message-ID: <VI1PR06MB89260BFEC656834C6E385BFCAD432@VI1PR06MB8926.eurprd06.prod.outlook.com>
Accept-Language: nl-BE, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR06MB8926:EE_|VI0PR06MB9746:EE_
x-ms-office365-filtering-correlation-id: 829e5dc7-3126-464f-19b3-08dcf1c5ffa1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|8096899003; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qI+kReyg3WIaRPlwzLLFJfD53ixksteq6H4Qy/z1zp1ysJCM+TrwfEh/CG3+?=
 =?us-ascii?Q?rxaQ9xobR9h1tzF7nI8CiUxC4s0Ylpg+Ec0iBr6GO3O62CyOVM46WvXE5D+q?=
 =?us-ascii?Q?lvQvqnaVR4bG2XzvoH6VHJQaXfqS6BsFUSbyabqMkPjYfOpdVjwLHYdAoHoy?=
 =?us-ascii?Q?UPk8M/2t8B1SvGNmr8xgcXBXFcbxNuX65qqYGX04XQWXIv27UYqD9J97W8wt?=
 =?us-ascii?Q?lBKjNNRVSOmvmzImA8lwZlS0XqAfH0789JMgl3TjRkgIIsBcs8vpz0biIu4q?=
 =?us-ascii?Q?EhcdPhlXMfk0CZ/uKxOUqD1hcXTR+WLrSHawVq1mA9x8W5+QEe3C8qbv+INQ?=
 =?us-ascii?Q?XKUZORKtb4ge8N5AJ0cIe4XQOxuapbiy0XL8YEtPAeYHpj+rqzhJwwTkFjUh?=
 =?us-ascii?Q?XapQOf4zo3hImgedwxYin09CkW1/cklxtj5xzimC3n0Z7vq32CQLba4+jdW3?=
 =?us-ascii?Q?r9wFLeCjeWlOgueNV8vvjQkHssbAzCjBx8tLvvsLIXyt1RFHAUseR6GrFzT8?=
 =?us-ascii?Q?WG5LQW3xohwm4Oj+UL25qzQ6/9nnSHpgiuJsFS0X43cPEQ4GC6SwJpWAdIJd?=
 =?us-ascii?Q?rLmmMaDq1WusjicnGfiGvhxUOEb1v9j6BOcRdf826mahzapUR1zIoZhLzZtt?=
 =?us-ascii?Q?Zo1NjkGsnN9rlm/i2oLv5G7nue971kdywd4Ra03Ja7maaNJHx27EywPGvnhV?=
 =?us-ascii?Q?326Moiqj3G2qJeis/aSBwvhkgfE6IR3Vv72HVUrKbCLmvdlZjxnNYtvehATf?=
 =?us-ascii?Q?3n7rdRRmPB5AndoDOzQj8eHKbvMuAkeAGIL+FLx5+xMkuDbyJJ+UCl7cEb+O?=
 =?us-ascii?Q?ws6fLbvVcrZc6i7IK/+B7OH7EsEPV4G7+OVE52PL9+ccwO4rjVKNLza236ta?=
 =?us-ascii?Q?j1IwzjgEPsSv3ihmX7PE4tgC/ZVeC6ywdno4Z5o1hc4LPjPwqIShBtTqDHyx?=
 =?us-ascii?Q?3KEigQ8PFjy+wm5VQBemcHj+HP+4mV85qeFtRuPMKJWevWt0y34WIYrkNDJK?=
 =?us-ascii?Q?nZ400AZ/4BcUTapDjYhbKycPAEL9O+qS4cNeAPSNpBnzYtaHESCLnhG+PZqN?=
 =?us-ascii?Q?lKOOILLso3Fqz80m4q3NJnPpbLyPGWoHMES0qaHgTcM7BSes3eGV4MIbBDOf?=
 =?us-ascii?Q?PbqMnAM0uL3zbmxct1WEZ2Lh3PtA9LJtRyU+Hnin0m5blRgbkIZDUwXSaOeJ?=
 =?us-ascii?Q?P26WyPvd/s2l9agVFV2EE+JB14uEvIDzEzdSmLyHKjS/R+4abq/Uehk/fJdB?=
 =?us-ascii?Q?jx7vHRQnP/vIgfN5ToKWH//LQs1ldwMQNxDY+UDyDX3FYz7xBnuoN7Vo3rZa?=
 =?us-ascii?Q?oH4VwRudPFI4N+hrOcL5W5gP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR06MB8926.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(8096899003); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xgq9OaFf9SeZm3gU68qnuD7xQ8Y9DJIxUE8yvE6r1Z/fmndAYF99qCfND/TA?=
 =?us-ascii?Q?wsmEOoDxWXuHADncjncTh6x6wPFi5kleogdZ9x8AUp4miImDkTulNNwEXAIC?=
 =?us-ascii?Q?iVyyILuzDz9Xe29JyUC0JL8paTvh1upawVlawCLDEmdotuH/eTQ3XO7XyASn?=
 =?us-ascii?Q?ZUONcmOior85Oz9iHvUwYP8E7l5pbd8aIIsuLbxgDkKrIG3t+3z33Kw3GPXW?=
 =?us-ascii?Q?OuDQ8hndnC3lJftn7pJqpnUtj7pZhgQTy6RE3in3zUSFPdQhFKDGv3J5UzYa?=
 =?us-ascii?Q?Gqcvl9azkB+7Z7tscy7rn8Lsb+ZDVr4Z0HkirOBBltO9y8WNiGmvQ9EMrLFR?=
 =?us-ascii?Q?LmegER3LAkQfexBGke0HhsAx9TqN7/L5mtGMlIrD4pCC49QA0KONJJ7muZvr?=
 =?us-ascii?Q?YQ78FIC9yBe8qmTsJLvc0EGh6vwSxjC25xYaDoIpfO5NAs0IqduhatJIPhF7?=
 =?us-ascii?Q?TqNHHTFqqCwchU6eAUeXlleinf6++J4EXFjuvv0DXbGAhyUQvq1EKaJcfZ0B?=
 =?us-ascii?Q?/uYGu9PvbLUGbbWN0OC9x2YnyYgGHmDeDsxzPPv2htyaimMJylRZMgmQ5JGk?=
 =?us-ascii?Q?c/p2ds7bdYoraKXMWFXMYfUx8eEcrA8fK5O3GvkcZ5PtwcwkX0ZTvWQj894l?=
 =?us-ascii?Q?HQgc2Q5Nx1E9b1sKBvp/6ppcSOiKjO7G0gvwvgQkVWbFyVWBU4ugdy1iosVq?=
 =?us-ascii?Q?O5Fzf92lXlGLa6qOs/JR59taDK2LrKcLd9qjWwmbyPHLdanEGzGCpJ4ApPou?=
 =?us-ascii?Q?RqC8LiGAn8FjWQMj8V8tSe/q+66BOO9mnfl83eEysGk8Bp+d9bNhQTjG/nfs?=
 =?us-ascii?Q?mMP1DPVwYBp5xGqd+HwJNfi3hvbfA20BEE8KKzxNG895q4n3S00WyMmN2dRc?=
 =?us-ascii?Q?4PfqkW4iu5jcrghS8hr3pQzr9KP7z4G6qeZBPCCXZUQiWlNOg2oo8vzl4Q8w?=
 =?us-ascii?Q?6jfAHOMmgfMIe6dtoKLyfo+v808/J7RV8sq9H4mq0y1l7a8A0BSbsbDIha5m?=
 =?us-ascii?Q?tDK8atYRoacaQ2us3LM3SCfNQmgXI/YNzBsqmd+wmT0+iFbph1HbDSgL2KY9?=
 =?us-ascii?Q?sIdoWEVGt7+Em2CQaROo+/t9sJ4gUOZLmTmklYmWvVRBNaoE6f/owurO5Xga?=
 =?us-ascii?Q?gQuQcuQ+h/2LJaFuvIbe64qQJIn5RHu0d0PsxrhdCVtnlKqzT2kl8U5BhIdf?=
 =?us-ascii?Q?b+ae7xgpbfccOAegP+HjZP8kaC16o8WaP6/9erLClP0Z0XFarBXxTfwB0zDr?=
 =?us-ascii?Q?BP4VnaasbSMnk8p4Cl3KkYpzN+yoStlmPqb/uiMw6yz+YRVu20ezCxVlD3i+?=
 =?us-ascii?Q?pWiqklKbgDJ/eEpsmZBNFfqFjXdMwr7ExZtd6ukeSVvnIafMWn1Un20wDIWV?=
 =?us-ascii?Q?D6rQNhWwCH54rQy4Loj5H87A7qjI4/ZLnbwAmbrpLNtGwOpSTQZkIxzQLPCD?=
 =?us-ascii?Q?vqyifq8SZHh8e3ezNbXcFCvnzhoy0H3jMntKOTA6Nm2Ke9JR8XxrIH7PR/ig?=
 =?us-ascii?Q?IDeYEYMK6eP5wgkx32+2TWALZws2/XsK3VvQxDuBBUqUTKSq1Bho+jOqPi0y?=
 =?us-ascii?Q?FS03Z9GU7vPn2AlT73o=3D?=
MIME-Version: 1.0
X-OriginatorOrg: idtech.be
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR06MB8926.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 829e5dc7-3126-464f-19b3-08dcf1c5ffa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2024 11:46:27.9046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 982732bf-7da9-409c-87ae-889ccf886826
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0XwD81hIMBT7dj0B2S+EogmHTrv7KAULeOLG1YTBRvrHT7FQ2WTOQ7Stdzhz6PnZStb2zjiBMsynNe40ZVtcrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9746
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idtechoffice.onmicrosoft.com; s=selector1-idtechoffice-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQOEw9m8vEHwSJszHLPVQcbz5+HHkdyFVXX/k9Ei4RM=;
 b=dvNzC1uw9kIFnsvhGbuydgUNNDBpVAyDxNrBosSepJi9Ven7nrDMdF12JV5CyaUjDuYvgQjd6xllDZwM24JwmJt38tEDIjzhZtiw9TGA5bLX39HIfW7QckVpXktoo4MTohMXUi05r/FhHHkYQWN/0986cWvY70IvuKAZXLm7SHM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=idtech.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=idtechoffice.onmicrosoft.com
 header.i=@idtechoffice.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-idtechoffice-onmicrosoft-com header.b=dvNzC1uw
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=idtech.be;
Subject: [Buildroot] [PATCH 1/1] package/libtevent: add libtevent package
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
Content-Type: multipart/mixed; boundary="===============2891340132591414074=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2891340132591414074==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR06MB89260BFEC656834C6E385BFCAD432VI1PR06MB8926eurp_"

--_000_VI1PR06MB89260BFEC656834C6E385BFCAD432VI1PR06MB8926eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This patch adds support for libtevent as a standolane library.
Libtevent is part of samba, but one might need it for other packages withou=
t the need for the whole samba eg. Certmonger.

Signed-off-by: Ayrton aleyssens@idtech.be<mailto:aleyssens@idtech.be>
---
package/Config.in                             |   1 +
...mba-add-disable-stack-protector-opti.patch | 116 ++++++++++++++++++
package/libtevent/Config.in                   |  16 +++
package/libtevent/libtevent.hash              |   2 +
package/libtevent/libtevent.mk                |  58 +++++++++
5 files changed, 193 insertions(+)
create mode 100644 package/libtevent/0001-buildtools-wafsamba-add-disable-s=
tack-protector-opti.patch
create mode 100644 package/libtevent/Config.in
create mode 100644 package/libtevent/libtevent.hash
create mode 100644 package/libtevent/libtevent.mk

diff --git a/package/Config.in b/package/Config.in
index e1ceb81dc0..d4cc03dcdb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2245,6 +2245,7 @@ menu "Other"
           source "package/libsolv/Config.in"
           source "package/libspatialindex/Config.in"
           source "package/libtalloc/Config.in"
+          source "package/libtevent/Config.in"
           source "package/libtasn1/Config.in"
           source "package/libtommath/Config.in"
           source "package/libtpl/Config.in"
diff --git a/package/libtevent/0001-buildtools-wafsamba-add-disable-stack-p=
rotector-opti.patch b/package/libtevent/0001-buildtools-wafsamba-add-disabl=
e-stack-protector-opti.patch
new file mode 100644
index 0000000000..839479a3fa
--- /dev/null
+++ b/package/libtevent/0001-buildtools-wafsamba-add-disable-stack-protecto=
r-opti.patch
@@ -0,0 +1,116 @@
+From 5885ed8e6db7648e6842d9811aace7edc4e8aba7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine fontaine.fabrice@gmail.com<mailto:fontaine.fabrice@=
gmail.com>
+Date: Wed, 20 Apr 2022 11:16:52 +0200
+Subject: [PATCH] buildtools/wafsamba: add --disable-stack-protector option
+
+Allow the user to disable stack-protector through
+--disable-stack-protector to avoid the following build failure with
+libtalloc on embedded toolchains which don't support stack-protector:
+
+/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/i686-buildroot-=
linux-musl/9.4.0/../../../../i686-buildroot-linux-musl/bin/ld: talloc.c.5.o=
: in function `_vasprintf_tc':
+talloc.c:(.text+0x427d): undefined reference to `__stack_chk_fail_local'
+
+This build failure is raised since
+https://gitlab.com/ffontaine/samba/-/commit/38e97f8b52e85bdfcf2d74a4fb3c84=
8fa46ba371
+because stack-protector is enabled on libtalloc despite the fact that
+libssp is not available:
+
+Checking if compiler accepts -fstack-protector-strong                     =
                      : yes
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e221bde25c7622db99761d0adcd56663=
296beb15
+
+Signed-off-by: Fabrice Fontaine fontaine.fabrice@gmail.com<mailto:fontaine=
.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.com/samba-team/samba/-/merge_requests/2493]
+---
+ buildtools/wafsamba/samba_autoconf.py | 49 ++++++++++++++-------------
+ buildtools/wafsamba/wscript           |  3 ++
+ 2 files changed, 28 insertions(+), 24 deletions(-)
+
+diff --git a/buildtools/wafsamba/samba_autoconf.py b/buildtools/wafsamba/s=
amba_autoconf.py
+index 78927d85193..23a995e1c34 100644
+--- a/buildtools/wafsamba/samba_autoconf.py
++++ b/buildtools/wafsamba/samba_autoconf.py
+@@ -703,9 +703,28 @@ def SAMBA_CONFIG_H(conf, path=3DNone):
+     if not IN_LAUNCH_DIR(conf):
+         return
+
+-    # we need to build real code that can't be optimized away to test
+-    stack_protect_list =3D ['-fstack-protector-strong', '-fstack-protecto=
r']
+-    for stack_protect_flag in stack_protect_list:
++    if not Options.options.disable_stack_protector:
++        # we need to build real code that can't be optimized away to test
++        stack_protect_list =3D ['-fstack-protector-strong', '-fstack-prot=
ector']
++        for stack_protect_flag in stack_protect_list:
++            flag_supported =3D conf.check(fragment=3D'''
++                                        #include <stdio.h>
++
++                                        int main(void)
++                                        {
++                                            char t[100000];
++                                            while (fgets(t, sizeof(t), st=
din));
++                                            return 0;
++                                        }
++                                        ''',
++                                        execute=3D0,
++                                        cflags=3D[ '-Werror', '-Wp,-D_FOR=
TIFY_SOURCE=3D2', stack_protect_flag],
++                                        mandatory=3DFalse,
++                                        msg=3D'Checking if compiler accep=
ts %s' % (stack_protect_flag))
++            if flag_supported:
++                conf.ADD_CFLAGS('%s' % (stack_protect_flag))
++                break
++
+         flag_supported =3D conf.check(fragment=3D'''
+                                     #include <stdio.h>
+
+@@ -717,29 +736,11 @@ def SAMBA_CONFIG_H(conf, path=3DNone):
+                                     }
+                                     ''',
+                                     execute=3D0,
+-                                    cflags=3D[ '-Werror', '-Wp,-D_FORTIFY=
_SOURCE=3D2', stack_protect_flag],
++                                    cflags=3D[ '-Werror', '-fstack-clash-=
protection'],
+                                     mandatory=3DFalse,
+-                                    msg=3D'Checking if compiler accepts %=
s' % (stack_protect_flag))
++                                    msg=3D'Checking if compiler accepts -=
fstack-clash-protection')
+         if flag_supported:
+-            conf.ADD_CFLAGS('%s' % (stack_protect_flag))
+-            break
+-
+-    flag_supported =3D conf.check(fragment=3D'''
+-                                #include <stdio.h>
+-
+-                                int main(void)
+-                                {
+-                                    char t[100000];
+-                                    while (fgets(t, sizeof(t), stdin));
+-                                    return 0;
+-                                }
+-                                ''',
+-                                execute=3D0,
+-                                cflags=3D[ '-Werror', '-fstack-clash-prot=
ection'],
+-                                mandatory=3DFalse,
+-                                msg=3D'Checking if compiler accepts -fsta=
ck-clash-protection')
+-    if flag_supported:
+-        conf.ADD_CFLAGS('-fstack-clash-protection')
++            conf.ADD_CFLAGS('-fstack-clash-protection')
+
+     if Options.options.debug:
+         conf.ADD_CFLAGS('-g', testflags=3DTrue)
+diff --git a/buildtools/wafsamba/wscript b/buildtools/wafsamba/wscript
+index 8729b0829da..d75bb3b1c0c 100644
+--- a/buildtools/wafsamba/wscript
++++ b/buildtools/wafsamba/wscript
+@@ -165,6 +165,9 @@ Currently the only tested value is 'smbtorture,smbd/sm=
bd' for Samba'''),
+     gr.add_option('--disable-warnings-as-errors',
+                    help=3D("Do not treat all warnings as errors (disable =
-Werror)"),
+                    action=3D"store_true", dest=3D'disable_warnings_as_err=
ors', default=3DFalse)
++    gr.add_option('--disable-stack-protector',
++                   help=3D("Disable stack-protector"),
++                   action=3D"store_true", dest=3D'disable_stack_protector=
', default=3DFalse)
+     opt.add_option('--enable-coverage',
+                    help=3D("enable options necessary for code coverage "
+                          "reporting on selftest (default=3Dno)"),
+--
+2.35.1
+
diff --git a/package/libtevent/Config.in b/package/libtevent/Config.in
new file mode 100644
index 0000000000..9b556725e6
--- /dev/null
+++ b/package/libtevent/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LIBTEVENT
+          bool "libtevent"
+          depends on BR2_USE_MMU
+          depends on !BR2_STATIC_LIBS
+          help
+            Tevent is an event system based on the talloc memory managemen=
t library.
+            Tevent has support for many event types, including timers, sig=
nals, and
+            the classic file descriptor events.
+            Tevent also provide helpers to deal with asynchronous code pro=
viding the
+            tevent_req (Tevent Request) functions.
+
+            https://tevent.samba.org/talloc/doc/html/index.html
+
+comment "libtevent needs a toolchain w/ dynamic library"
+          depends on BR2_USE_MMU
+          depends on BR2_STATIC_LIBS
diff --git a/package/libtevent/libtevent.hash b/package/libtevent/libtevent=
.hash
new file mode 100644
index 0000000000..990998e6d1
--- /dev/null
+++ b/package/libtevent/libtevent.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  362971e0f32dc1905f6fe4736319c4b8348c22dc85aa6c3f690a28efe548029e  =
tevent-0.16.1.tar.gz
diff --git a/package/libtevent/libtevent.mk b/package/libtevent/libtevent.m=
k
new file mode 100644
index 0000000000..636a6abbe2
--- /dev/null
+++ b/package/libtevent/libtevent.mk
@@ -0,0 +1,58 @@
+##########################################################################=
######
+#
+# libtevent
+#
+##########################################################################=
######
+
+LIBTEVENT_VERSION =3D 0.16.1
+LIBTEVENT_SOURCE =3D tevent-$(LIBTEVENT_VERSION).tar.gz
+LIBTEVENT_SITE =3D https://www.samba.org/ftp/tevent
+LIBTEVENT_LICENSE =3D LGPL-3.0+
+LIBTEVENT_LICENSE_FILES =3D tevent.h
+LIBTEVENT_INSTALL_STAGING =3D YES
+
+# libtevent is extracted from the samba source tree, and that has a workar=
ound
+# that requires PYTHONHASHSEED to be set, and to be set to 1.
+# See https://gitlab.com/samba-team/samba/-/commit/420bbb1d92fd2a28725b53f=
425ba3d214831b660
+LIBTEVENT_CONF_ENV =3D PYTHONHASHSEED=3D1
+LIBTEVENT_MAKE_ENV =3D PYTHONHASHSEED=3D1
+
+# --with-libiconv=3D is unconditionally passed, even if libiconv is not
+# present. Indeed, waf will search for libiconv by default in
+# /usr/local. Because of a bug in some waf python script, /usr/local
+# is then used in many subsequent and unrelated checks, which
+# ultimately causes a failure when BR2_COMPILER_PARANOID_UNSAFE_PATH
+# is set.  However no need to set libiconv as a dependency of
+# libtevent since it's optional.
+LIBTEVENT_CONF_OPTS +=3D --cross-compile \
+                      --cross-answers=3D$(@D)/cache.txt \
+                      --disable-stack-protector \
+                      --hostcc=3Dgcc \
+                      --with-libiconv=3D$(STAGING_DIR)/usr
+
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+LIBTEVENT_DEPENDENCIES +=3D libtirpc host-pkgconf
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIBTEVENT_DEPENDENCIES +=3D host-python3 python3
+LIBTEVENT_CONF_ENV +=3D \
+          PYTHON=3D"$(HOST_DIR)/bin/python3" \
+          PYTHON_CONFIG=3D"$(STAGING_DIR)/usr/bin/python3-config"
+# There isn't any --enable-python configuration option
+else
+LIBTEVENT_CONF_OPTS +=3D --disable-python
+endif
+
+LIBTEVENT_WAF =3D ./buildtools/bin/waf
+
+# like samba4, libtevent uses the waf build system which requires a
+# proper answers file to configure package before build
+define LIBTEVENT_POPULATE_WAF_CACHE
+          $(INSTALL) -m 0644 package/idtech/libtevent/libtevent-cache.txt =
$(@D)/cache.txt
+          echo 'Checking uname machine type: $(BR2_ARCH)' >> $(@D)/cache.t=
xt
+endef
+
+LIBTEVENT_PRE_CONFIGURE_HOOKS +=3D LIBTEVENT_POPULATE_WAF_CACHE
+
+$(eval $(waf-package))
--
2.43.0

--_000_VI1PR06MB89260BFEC656834C6E385BFCAD432VI1PR06MB8926eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"FR-BE" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>This patch adds support for libtevent as a standolane library.<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>Libtevent is part of samba, but one might need it for other packages witho=
ut the need for the whole samba eg. Certmonger.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>Signed-off-by: Ayrton
<a href=3D"mailto:aleyssens@idtech.be">aleyssens@idtech.be</a><o:p></o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>---<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>package/Config.in&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<o:p></o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>...mba-add-disable-stack-protector-opti.patch | 116 ++++++++++++++++++<o:p=
></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>package/libtevent/Config.in&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 16 ++=
+<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>package/libtevent/libtevent.hash&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +<o:p></o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>package/libtevent/libtevent.mk&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 58 +++++++++<o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>5 files changed, 193 insertions(+)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>create mode 100644 package/libtevent/0001-buildtools-wafsamba-add-disable-=
stack-protector-opti.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>create mode 100644 package/libtevent/Config.in<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>create mode 100644 package/libtevent/libtevent.hash<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>create mode 100644 package/libtevent/libtevent.mk<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>diff --git a/package/Config.in b/package/Config.in<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>index e1ceb81dc0..d4cc03dcdb 100644<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>--- a/package/Config.in<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+++ b/package/Config.in<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>@@ -2245,6 +2245,7 @@ menu &quot;Other&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source &quot;=
package/libsolv/Config.in&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareas=
t-language:#2000">source &quot;package/libspatialindex/Config.in&quot;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source &quot;package/libtall=
oc/Config.in&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">+&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source &quot;package/libtevent/Co=
nfig.in&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source &quot;package/libtasn=
1/Config.in&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source &quot;package/libtomm=
ath/Config.in&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source &quot;package/libtpl/=
Config.in&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">diff --git a/p=
ackage/libtevent/0001-buildtools-wafsamba-add-disable-stack-protector-opti.=
patch b/package/libtevent/0001-buildtools-wafsamba-add-disable-stack-protec=
tor-opti.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>new file mode 100644<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>index 0000000000..839479a3fa<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>--- /dev/null<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+++ b/package/libtevent/0001-buildtools-wafsamba-add-disable-stack-protect=
or-opti.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"IT" style=
=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">=
@@ -0,0 +1,116 @@<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"IT" style=
=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">=
+From 5885ed8e6db7648e6842d9811aace7edc4e8aba7 Mon Sep 17 00:00:00 2001<o:p=
></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"IT" style=
=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">=
+From: Fabrice Fontaine
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif;mso-fareast-language:#2000"><a href=3D"mailto:fontaine.fabrice@gmail.c=
om"><span lang=3D"IT">fontaine.fabrice@gmail.com</span></a></span><span lan=
g=3D"IT" style=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-la=
nguage:#2000"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+Date: Wed, 20 Apr 2022 11:16:52 +0200<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+Subject: [PATCH] buildtools/wafsamba: add --disable-stack-protector optio=
n<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+Allow the user to disable stack-protector through<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+--disable-stack-protector to avoid the following build failure with<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+libtalloc on embedded toolchains which don't support stack-protector:<o:p=
></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/i686-buildroot=
-linux-musl/9.4.0/../../../../i686-buildroot-linux-musl/bin/ld:
 talloc.c.5.o: in function `_vasprintf_tc':<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+talloc.c:(.text+0x427d): undefined reference to `__stack_chk_fail_local'<=
o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+This build failure is raised since<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+https://gitlab.com/ffontaine/samba/-/commit/38e97f8b52e85bdfcf2d74a4fb3c8=
48fa46ba371<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+because stack-protector is enabled on libtalloc despite the fact that<o:p=
></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+libssp is not available:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+Checking if compiler accepts -fstack-protector-strong&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; : yes<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">+<o:p></o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">+Fixes:<o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">+ -
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif;mso-fareast-language:#2000"><a href=3D"http://autobuild.buildroot.org/=
results/e221bde25c7622db99761d0adcd56663296beb15"><span lang=3D"FR-BE">http=
://autobuild.buildroot.org/results/e221bde25c7622db99761d0adcd56663296beb15=
</span></a></span><span style=3D"font-family:&quot;Calibri&quot;,sans-serif=
;mso-fareast-language:#2000"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">+<o:p></o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">+Signed-off-by=
: Fabrice Fontaine
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif;mso-fareast-language:#2000"><a href=3D"mailto:fontaine.fabrice@gmail.c=
om"><span lang=3D"FR-BE">fontaine.fabrice@gmail.com</span></a></span><span =
style=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2=
000"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+[Upstream status:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+https://gitlab.com/samba-team/samba/-/merge_requests/2493]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+---<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+ buildtools/wafsamba/samba_autoconf.py | 49 ++++++++++++++-------------<o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+ buildtools/wafsamba/wscript&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; |&nbsp; 3 ++<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+ 2 files changed, 28 insertions(+), 24 deletions(-)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+diff --git a/buildtools/wafsamba/samba_autoconf.py b/buildtools/wafsamba/=
samba_autoconf.py<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+index 78927d85193..23a995e1c34 100644<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+--- a/buildtools/wafsamba/samba_autoconf.py<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++++ b/buildtools/wafsamba/samba_autoconf.py<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+@@ -703,9 +703,28 @@ def SAMBA_CONFIG_H(conf, path=3DNone):<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp; if not IN_LAUNCH_DIR(conf):<o:p></o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp; # we need to build real code that can't be optimized =
away to test<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp; stack_protect_list =3D ['-fstack-protector-strong', '=
-fstack-protector']<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp; for stack_protect_flag in stack_protect_list:<o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp; if not Options.options.disable_stack_protector:<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # we need to build real code =
that can't be optimized away to test<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stack_protect_list =3D ['-fst=
ack-protector-strong', '-fstack-protector']<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for stack_protect_flag in sta=
ck_protect_list:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flag_=
supported =3D conf.check(fragment=3D'''<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; #include &lt;stdio.h&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; int main(void)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; {<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char t[100000];<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (fgets(t, sizeof(t), stdin));<o:=
p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; ''',<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; execute=3D0,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; cflags=3D[ '-Werror', '-Wp,-D_FORTIFY_SOURCE=3D2', stack_prote=
ct_flag],<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; mandatory=3DFalse,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; msg=3D'Checking if compiler accepts %s' % (stack_protect_flag)=
)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if fl=
ag_supported:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; conf.ADD_CFLAGS('%s' % (stack_protect_flag))<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; break<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flag_supported =3D conf.=
check(fragment=3D'''<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #inclu=
de &lt;stdio.h&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+@@ -717,29 +736,11 @@ def SAMBA_CONFIG_H(conf, path=3DNone):<o:p></o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ''',<o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; execut=
e=3D0,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cflags=3D[ =
'-Werror', '-Wp,-D_FORTIFY_SOURCE=3D2', stack_protect_flag],<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cflags=3D[ =
'-Werror', '-fstack-clash-protection'],<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mandat=
ory=3DFalse,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msg=3D'Chec=
king if compiler accepts %s' % (stack_protect_flag))<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msg=3D'Chec=
king if compiler accepts -fstack-clash-protection')<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if flag_supported:<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conf.=
ADD_CFLAGS('%s' % (stack_protect_flag))<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break=
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp; flag_supported =3D conf.check(fragment=3D'''<o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #include &lt;stdio.h&gt;<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int main(void)<o:p></o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char t[1000=
00];<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (fget=
s(t, sizeof(t), stdin));<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ''',<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; execute=3D0,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cflags=3D[ '-Werror', '-fstack-clas=
h-protection'],<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mandatory=3DFalse,<o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msg=3D'Checking if compiler accepts=
 -fstack-clash-protection')<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp; if flag_supported:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conf.ADD_CFLAGS('-fstack-clas=
h-protection')<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conf.=
ADD_CFLAGS('-fstack-clash-protection')<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp; if Options.options.debug:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conf.ADD_CFLAGS('-g', te=
stflags=3DTrue)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+diff --git a/buildtools/wafsamba/wscript b/buildtools/wafsamba/wscript<o:=
p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+index 8729b0829da..d75bb3b1c0c 100644<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+--- a/buildtools/wafsamba/wscript<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++++ b/buildtools/wafsamba/wscript<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+@@ -165,6 +165,9 @@ Currently the only tested value is 'smbtorture,smbd/s=
mbd' for Samba'''),<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp; gr.add_option('--disable-warnings-as-errors',<o:=
p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; help=3D(&quot;Do not treat all wa=
rnings as errors (disable -Werror)&quot;),<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; action=3D&quot;store_true&quot;, =
dest=3D'disable_warnings_as_errors', default=3DFalse)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp; gr.add_option('--disable-stack-protector',<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; help=3D(&quot;Disable stack-protector&=
quot;),<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; action=3D&quot;store_true&quot;, dest=
=3D'disable_stack_protector', default=3DFalse)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp; opt.add_option('--enable-coverage',<o:p></o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; help=3D(&quot;enable options nece=
ssary for code coverage &quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; &quot;reporting on selftest (default=3Dno)&quot;),<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+--
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+2.35.1<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>diff --git a/package/libtevent/Config.in b/package/libtevent/Config.in<o:p=
></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>new file mode 100644<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>index 0000000000..9b556725e6<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>--- /dev/null<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+++ b/package/libtevent/Config.in<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>@@ -0,0 +1,16 @@<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+config BR2_PACKAGE_LIBTEVENT<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;libteve=
nt&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; depends on BR2_USE=
_MMU<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; depends on !BR2_ST=
ATIC_LIBS<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; help<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Tevent is a=
n event system based on the talloc memory management library.<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Tevent has =
support for many event types, including timers, signals, and<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; the classic=
 file descriptor events.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Tevent also=
 provide helpers to deal with asynchronous code providing the<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; tevent_req =
(Tevent Request) functions.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
<a href=3D"https://tevent.samba.org/talloc/doc/html/index.html">https://tev=
ent.samba.org/talloc/doc/html/index.html</a><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+comment &quot;libtevent needs a toolchain w/ dynamic library&quot;<o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; depends on BR2_USE=
_MMU<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; depends on BR2_STA=
TIC_LIBS<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>diff --git a/package/libtevent/libtevent.hash b/package/libtevent/libteven=
t.hash<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>new file mode 100644<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>index 0000000000..990998e6d1<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>--- /dev/null<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+++ b/package/libtevent/libtevent.hash<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>@@ -0,0 +1,2 @@<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+# Locally calculated<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+sha256&nbsp; 362971e0f32dc1905f6fe4736319c4b8348c22dc85aa6c3f690a28efe548=
029e&nbsp; tevent-0.16.1.tar.gz<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>diff --git a/package/libtevent/libtevent.mk b/package/libtevent/libtevent.=
mk<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>new file mode 100644<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>index 0000000000..636a6abbe2<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>--- /dev/null<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+++ b/package/libtevent/libtevent.mk<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">@@ -0,0 +1,58 =
@@<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">+#############=
###################################################################<o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">+#<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">+# libtevent<o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">+#<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">+#############=
###################################################################<o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">+<o:p></o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">+LIBTEVENT_VER=
SION =3D 0.16.1<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">+LIBTEVENT_SOU=
RCE =3D tevent-$(LIBTEVENT_VERSION).tar.gz<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">+LIBTEVENT_SIT=
E =3D
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif;mso-fareast-language:#2000"><a href=3D"https://www.samba.org/ftp/teven=
t"><span lang=3D"FR-BE">https://www.samba.org/ftp/tevent</span></a></span><=
span style=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-langua=
ge:#2000"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+LIBTEVENT_LICENSE =3D LGPL-3.0+<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+LIBTEVENT_LICENSE_FILES =3D tevent.h<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+LIBTEVENT_INSTALL_STAGING =3D YES<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+# libtevent is extracted from the samba source tree, and that has a worka=
round<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+# that requires PYTHONHASHSEED to be set, and to be set to 1.<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+# See
<a href=3D"https://gitlab.com/samba-team/samba/-/commit/420bbb1d92fd2a28725=
b53f425ba3d214831b660">
https://gitlab.com/samba-team/samba/-/commit/420bbb1d92fd2a28725b53f425ba3d=
214831b660</a><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+LIBTEVENT_CONF_ENV =3D PYTHONHASHSEED=3D1<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+LIBTEVENT_MAKE_ENV =3D PYTHONHASHSEED=3D1<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+# --with-libiconv=3D is unconditionally passed, even if libiconv is not<o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+# present. Indeed, waf will search for libiconv by default in<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+# /usr/local. Because of a bug in some waf python script, /usr/local<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+# is then used in many subsequent and unrelated checks, which<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+# ultimately causes a failure when BR2_COMPILER_PARANOID_UNSAFE_PATH<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+# is set.&nbsp; However no need to set libiconv as a dependency of<o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+# libtevent since it's optional.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+LIBTEVENT_CONF_OPTS +=3D --cross-compile \<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --cross-answers=3D$(@=
D)/cache.txt \<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --disable-stack-prote=
ctor \<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --hostcc=3Dgcc \<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --with-libiconv=3D$(S=
TAGING_DIR)/usr<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">+ifeq ($(BR2_P=
ACKAGE_LIBTIRPC),y)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">+LIBTEVENT_DEP=
ENDENCIES +=3D libtirpc host-pkgconf<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">+endif<o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">+<o:p></o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">+ifeq ($(BR2_P=
ACKAGE_PYTHON3),y)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000">+LIBTEVENT_DEP=
ENDENCIES +=3D host-python3 python3<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+LIBTEVENT_CONF_ENV +=3D \<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PYTHON=3D&quot;$(H=
OST_DIR)/bin/python3&quot; \<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PYTHON_CONFIG=3D&q=
uot;$(STAGING_DIR)/usr/bin/python3-config&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+# There isn't any --enable-python configuration option<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+else<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+LIBTEVENT_CONF_OPTS +=3D --disable-python<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+endif<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+LIBTEVENT_WAF =3D ./buildtools/bin/waf<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+# like samba4, libtevent uses the waf build system which requires a<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+# proper answers file to configure package before build<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+define LIBTEVENT_POPULATE_WAF_CACHE<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(INSTALL) -m 0644=
 package/idtech/libtevent/libtevent-cache.txt $(@D)/cache.txt<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo 'Checking una=
me machine type: $(BR2_ARCH)' &gt;&gt; $(@D)/cache.txt<o:p></o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+endef<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+LIBTEVENT_PRE_CONFIGURE_HOOKS +=3D LIBTEVENT_POPULATE_WAF_CACHE<o:p></o:p=
></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>+$(eval $(waf-package))<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>--
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"font-family:&quot;Calibri&quot;,sans-serif;mso-fareast-language:#2000"=
>2.43.0<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_VI1PR06MB89260BFEC656834C6E385BFCAD432VI1PR06MB8926eurp_--

--===============2891340132591414074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2891340132591414074==--
