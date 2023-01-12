Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16008C54EBD
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 09:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6999A605E9;
	Thu, 12 Jan 2023 09:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6999A605E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id owJ5RzRzwvWG; Thu, 12 Jan 2023 09:22:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A615560B23;
	Thu, 12 Jan 2023 09:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A615560B23
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E721E1BF3DB
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 09:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFF77403AA
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 09:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFF77403AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i2FPN258AiFu for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 09:22:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14B1540120
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14B1540120
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 09:22:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8x9mfcceVE3HUtSMeq+BmSUEZXVRLKVAUz1GfqMt5OPkVFZk2EHqSJmEw53ke1eJMXdQSBW/MHgawqnND1eFU5T4YOcWoyThm3i0vHHzTI0oGkfhZdse0RkMMx6/kqXF1mPmD5YJV4kowZ30glmho1OBEQwsScUGrXs5PyEljbyzZatS3gWg+rUA11a+dLYhvc/lKuZDcfYfBRka3v0plp2wy9QqZl53FwjLY1/E+NzyyOwzzChLfhttb9V7EyJdnmcIip4a+wqV0J9AJ+G9eiNH3zx3QE55tkClKb4E5OhTEnmCukn5tldfAltzNAEp9HP/fHPfjP5YiakO+1eqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eQMWzYC40t9e23DgX59CNQuCXAoohGOrhz8uzFdck8=;
 b=ZR+29vKpXJIK8j86PTCUEs8yZ38bNf4LjfXFGy58oLshDsQ2TFw+62EAl6ymguviUL6iWMFTXIYQ9xLvGbj8IvsW/0v+h2r4lkQXCq0Bj4gkaDglu8tyA+4CvTuG//JXMS7Z6DRn/69g+qDdm6TX1oq2ykmkzDGs8/V9nJOzNuSbAuGBcSZxCgPjCb4fJdHkiQ4nlKTBgh4X3bBBW9GJG9SC1kjF5TXS9z66DVi5P87BcnHCeHrWi8aVA7MC/3SvCGct330l3p8MdsV1a3C1IOlJeJuq/9I/7UWGJnMRivY9QiY1ZOkZj/6rYABWXiHH5SBhpjHls9ohnxsk7X1Nxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:32::11) by
 GV1P190MB2020.EURP190.PROD.OUTLOOK.COM (2603:10a6:150:5c::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13; Thu, 12 Jan 2023 09:22:07 +0000
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::4b1c:f113:ed46:3dda]) by DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::4b1c:f113:ed46:3dda%7]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 09:22:07 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 1/4] package/at-spi2-core: switch to https download
Thread-Index: AQHZJmaBIECCnNR01U20zNXrK2X8Wg==
Date: Thu, 12 Jan 2023 09:22:07 +0000
Message-ID: <DB6P190MB0488622C1D557DF4C5083A4F9FFD9@DB6P190MB0488.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6P190MB0488:EE_|GV1P190MB2020:EE_
x-ms-office365-filtering-correlation-id: 1c7d0309-b76f-46f6-04c4-08daf47e79b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Quvtt1ztVfniu7ZCMXZQ14ue6gfViG7tQFp4oX5KO3dQxiS4w3P9IWeiK2iW3OVqXfNW6+u37d4ftF/4QWF3W72NqcwfXlpKOP9b2eBiLIf/Omxq7HOb++dPLgdW9WHyGbKUbBj2i//auVRBlVvTEkM1apK0Ac3LdQid+Z6QqXkySxa+vKcvag6fs01FTXcCsoEY7sUULs/b+YhxkhA2KG8jSE74cNPwYzkUlyAD4hG0ApZLG6VkYsc9pOkMxkRVuzZdfE/Is0eoHgvH0NCq2OtZK6graSRwR3G2/TbDA3HS62eoyBdGgbuTqabe69S/jqIeUGtFjs1V94U/syDlIYbbAkId9ZYvgYHRKtKloLMOCPyrnot+kIqWOLnwpJxDvyocaPs79vqNZH6/gJ+heLkZJ7Nrw8QDpSZGyDYYeQFD00kEY0B+jcHc0w2xP+wWhKB7UZ4LetSWnR8l4tu4kLWQPJf745Fx4VmInIfcfHqtS5pczI4fed/FWm23oALDFRMZsWRpAbbxx9GnTPHFJNeFn7dUBxnJNmrKRY4gZi2tQoKDIwzIEMVRDdBqRXXdO6z7AFe6wSzfjL4S34nw8IFc5zmwWXMNfn+Q3cXTAxOF9Ti3u0LkAuRpBLawJwQPikeT8aOyI0lelu5AmdAxbWO2SzT7xCS6r3O2Y+zUN+xkjuyoe+w54m4K7Z7W2T0otOaDx/TXcrM7Q4Z64vU90RGhrmPTAABkrWRYdJFrFTM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6P190MB0488.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(366004)(136003)(396003)(39840400004)(451199015)(2906002)(86362001)(41300700001)(52536014)(76116006)(64756008)(4326008)(8676002)(66556008)(6916009)(8936002)(66946007)(5660300002)(66446008)(66476007)(33656002)(966005)(186003)(83380400001)(7696005)(26005)(9686003)(6506007)(478600001)(38070700005)(55016003)(91956017)(71200400001)(122000001)(316002)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?r8nj54X0hXfNTQAiixI+3NFPKiLFlD8DHVMj1wD/+bi3GlDGCzQeKJE3Hf?=
 =?iso-8859-1?Q?THy7H83Y7c/PiBt4YouFDQ4khYGShsQ3Tc/d023rVoW0cKLnAixcZZPptI?=
 =?iso-8859-1?Q?H/srHcqh0Hcj+oFmKHfu9hs4OHR5GH+gCRfcUPS+0q7OzTlCQ8TQml5r55?=
 =?iso-8859-1?Q?xx203E5bQsDQyfjc/25cfrg6jIC3AWaexs70xprpwz7wAxoYdGg53F/5wA?=
 =?iso-8859-1?Q?uXdRkgd6hu6r39AZcVHodI7HsrAe18SiAQby3UIb0i9lGIkW3r+JG5M/Bi?=
 =?iso-8859-1?Q?ke2KVPSOj/N2pku+Dd3VrAPAjKrxiEITZKz6PTcuCwlEUkfovc6XNHeKyT?=
 =?iso-8859-1?Q?bobviw01zxZoR7Hk7WWdbzkCOfH6LzWqDqFV2t86BGvkWSNYRLY33YAymX?=
 =?iso-8859-1?Q?kbA+OwhxgE+XaA4RwebBNO1II+lz0SbDgkYVsd9BtRfQBo+1abE5kWkGs7?=
 =?iso-8859-1?Q?Ir81zUP/0pVs/MdasI2K4RsqrLJZWi9o2Rk3Y53SIneBl1f2UamSSCxQV0?=
 =?iso-8859-1?Q?AH5UWLdQDKeWbR4jy4ui3IPW+cF1is+jdyTR3gxLd8lK4nDh9Uy/ZL4ckP?=
 =?iso-8859-1?Q?8kohDC+defWwgrEyg49VHH2GRLIPtgETt1zLA+bhGidVF++WI19o+XdGef?=
 =?iso-8859-1?Q?nfpo5Nj3esaV0C3VqmyjYJaqRHBRWpzV3fpAJrxc0EdBoBOfdXQxBoGeh+?=
 =?iso-8859-1?Q?4PApSJmSPL+zwMmDjS1qAU6YUglqbAm7cU+UXopXjrnCltZLRuwmnlbJ/w?=
 =?iso-8859-1?Q?gTUpnugw/58kqlwJ/DZSwxzHV7u2SoUub7HOPPVwlQZRlFvLY+gSmo9PZY?=
 =?iso-8859-1?Q?cjKLwUiUJKmb58W/OVn7/i1/0Bv8ZVa8yiIYqFLEtgl6ieHoJEMEQVfX9G?=
 =?iso-8859-1?Q?ELhVE4+Or44PpwdIdVvqhQ8YfRkbUwv/lwJXJQyarixbWl0ODBcSMmQ/a8?=
 =?iso-8859-1?Q?yN4Z+Y9ixCdohUrw60QwbOnImqR+vpoURfU/uLisBSLAFriqZOEPeccrei?=
 =?iso-8859-1?Q?Ac9wqtTsbpaFx4LpHCYeAYROQt+A4nUuV9/TPgnDjSkAs1zo3/kT6MXgYs?=
 =?iso-8859-1?Q?4uNqmYuSgbzwkxF1OIjvRADT3daRSx9YS5fNCx9ClhBHpwCDoc8h8EoilR?=
 =?iso-8859-1?Q?0aYM+6e/EmVaTWrl4OewXErJqXXkQFzpd646RRv8IkT8Xg6dpqfRVwDpxl?=
 =?iso-8859-1?Q?RRn8St+xHvoFWY6DSSdb+tpQlvJFDEB2s19at3WTW9od/2/vn+pahsspk+?=
 =?iso-8859-1?Q?zRtY9KUUH32fyMrOxQFg2NmGim5uwdIaOSWCtqL0FTF53sC/Nhley+W8yh?=
 =?iso-8859-1?Q?4P7j+7EAFhqUUd3kzkUSSBEWKn+EQtKV6RCeEkMCF4dpiA5kt4V0CIumy7?=
 =?iso-8859-1?Q?VuMAAvBGxRk3cl2qEO4C8dXBVrCkfv2xzfpxXxoFwxBZKS4xr5IpCtAMZe?=
 =?iso-8859-1?Q?R0UKwSukOh3g3W6wc8ZeS2PP7AJe60l0TfJxdXgFa7FPOha9YIvqeE7fHn?=
 =?iso-8859-1?Q?Naj5wBLDAWLBKJ8qNuXdULsjSkxeNR/JFXS6xpJsaAwQRLya5/8VaWhbtU?=
 =?iso-8859-1?Q?lgk42I0iFYi/jk7/Uf36MoECPT9jR4VTXq22CoS3NQBqN6idwP1trQKCcM?=
 =?iso-8859-1?Q?sB4Z/ZAwGHWSg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7d0309-b76f-46f6-04c4-08daf47e79b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 09:22:07.1218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: khFG3KP/gyWMt6ZJ9OtgfaLMIxAwdc6ZL0J0DiuAM1/eRWibRFuXqveraF0oTT/UzRgWD7vxm1Rp25owxgE3vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P190MB2020
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eQMWzYC40t9e23DgX59CNQuCXAoohGOrhz8uzFdck8=;
 b=UbkLlPMyLAyJKOXJ2TpXaK7oF2tMa3CjfWNK9QAj7Dxojd0fo4ApkCgO4UwaSLwJE7hoDQRDV5MX1usYsEdkm8Z83RCvWTVbAMT/2gWONlRe9www0k7T4H0M7JYB+s9wNbBi7qwSpuys+wkIzhTD6wA+ZgVdMhwmsmL/siuFcTY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=UbkLlPMy
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 1/4] package/at-spi2-core: switch to https
 download
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
Changes v1 -> v2:
- No changes
---
 package/at-spi2-core/at-spi2-core.hash | 2 +-
 package/at-spi2-core/at-spi2-core.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
index e2cc403e71..764e4c3661 100644
--- a/package/at-spi2-core/at-spi2-core.hash
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -1,4 +1,4 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/at-spi2-core/2.36/at-spi2-core-2.36.0.sha256sum
+# From https://download.gnome.org/sources/at-spi2-core/2.36/at-spi2-core-2.36.0.sha256sum
 sha256  88da57de0a7e3c60bc341a974a80fdba091612db3547c410d6deab039ca5c05a  at-spi2-core-2.36.0.tar.xz
 
 # locally calculated
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index cf7fdd297c..f0b019c0ed 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -7,7 +7,7 @@
 AT_SPI2_CORE_VERSION_MAJOR = 2.36
 AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
 AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
-AT_SPI2_CORE_SITE = http://ftp.gnome.org/pub/gnome/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
+AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
 AT_SPI2_CORE_LICENSE = LGPL-2.1+
 AT_SPI2_CORE_LICENSE_FILES = COPYING
 AT_SPI2_CORE_INSTALL_STAGING = YES
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
