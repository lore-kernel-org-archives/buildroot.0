Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55F5C00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 09:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5755F404D5;
	Thu, 19 Jan 2023 09:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5755F404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nQUuLZzzMCsG; Thu, 19 Jan 2023 09:52:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9344740C46;
	Thu, 19 Jan 2023 09:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9344740C46
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 382031BF95F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13AB681F99
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13AB681F99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZkduGrTiuLVg for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 09:52:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02CC080C0B
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2071.outbound.protection.outlook.com [40.107.13.71])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02CC080C0B
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 09:52:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ag6d9i4kaUDCkXAyC0z7WOZLpr67EvYSFNKqJf2SCbVvYT5gSNfITNlYiW3DI+UfDK9ivHjJhif0YOCHRhmAxGTVEFE/rVL+uRxgP+FBgAZ03HlM9GgrBgOQW5HOP03BBpyX9quDjFRIn95eJdGEgTZHqO2vRbmwtkTDpwtU5ARtlik4CNoKtVvkkKDsI8sQqasuVtFiTyTjdmuWmiIE4QxcMDkVt6JZLRewsNz7BPCyt7+EolQ2c8TEMGX+fWtA97KBHqCifia+QF637ec1X6p1+f7Y2IwyBo6Ca4Vui4Z2UVNVLPRLW3S2rx2ODSAXjfHcapufv+oypDkvoy3Rpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eMQKuo1lrjVVP1J9PuvEuLcAfil8lD/ASK69nw+ziM=;
 b=Ei/IiPM31DZSWq4l6VPoCKrjcWEMXloFn09wlFu25pyRzj9MPNXywXgilGi2EXO6i6NFShC+iOR4tpru1ZO2tNV8hiGJp4Kb5rNzBrDrGw4BMpUtKJSOqZ2E54zxf2pSrm4JfbLXZ4o28Q5RPYPnfrmIXZ3K9+I14Om3UNGHT5o+UQl5UI8sr4jHfWi/Iew2hjeuy7jVWmIifA9+q/e8sfo2L9L6QfHFtdb9kDxxYWawazoLzYyYd1Rmag4O/okaO3JLzjgIlmadSF0zbbsvTYwAkp/jykytkmxBuHgflZ0adxSk9eK/uKND3CdOTS6ro+X6nx119QG5Vt4r83HBPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by PR3P190MB0937.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:8b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 09:52:21 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 09:52:21 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 06/45] package/gdk-pixbuf: switch to https download
Thread-Index: AQHZK+pHWRzDdz7xsEORsLicxyX3vA==
Date: Thu, 19 Jan 2023 09:52:21 +0000
Message-ID: <VI1P190MB04935BBBB8F3C08440BD590F9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|PR3P190MB0937:EE_
x-ms-office365-filtering-correlation-id: e1316b93-d3a1-4c6c-b72f-08dafa02dbd7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rCR5pZCbCHYCBwH5IC/xEbDFaQ5acTAZQ0jQcB9x6KBe9czjRqqUKNK4IkTkDRY9gV/SmGvq/98hDLcm6qIaLtqWDBH77soNxKGIUCojnQjECXo7GSNzJEmD9Q5Lhdrc1RvgF7x0MjdjRpW06s74FJd1nwJqiTUNlprVlj/Uf6Eiwb1jGfyQZ7LlfD1AF8p8lY3kWoOh0KpvTaqhdL/jXzAa53d8l5U+q2ckeSJ7MS36Qie/O1AD/ma5AxgQsutu40gyQI45Hpqa+ZjBcFr/z3Aj8xLx5tBwyNZP5wAQwl1mtz+7iclYAg7YOwsu1TaBFf2NvfDNmhnH3zQ/uJf7QJUoHij3IZhBs3PHIXOCw9HL0xq2lr6fWKELZqgCJlkwHqrXj9IJjRLBm8vfdjrqhA/sNDP6draPuHT4T3Eq+vg8ArwBDnqLYhjlP8DnjumVBR/XajACn8yAsCPxGPsvZ5OmA5VCh8TCeySwzsr6xOrAiPgyjulWiLRFemm15jEDo7WR3xOL79fUCXM0DbUdbKKdB49vkC0r4QFnn4M8Jf5YW3NmzDhK+V0iQmJ9fOoYkURCjldXxP7Ntn/BZLlee/Nlq74qZ2m5ANIPd+UvF06cf/Ure6aqOWm9US//0XxHDhX666qDrbtkNIWZk0UvKXeYm7bRuK01TtUGzomYyDVU0xrcTXaBF7eVbKVoVyeLoB4wwzqCQrRaAb2FpNgGdZLF8uEiyhEf32paDI075pA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(366004)(396003)(39840400004)(451199015)(38070700005)(6506007)(33656002)(86362001)(55016003)(66946007)(52536014)(66556008)(5660300002)(8936002)(66476007)(2906002)(38100700002)(122000001)(76116006)(316002)(64756008)(966005)(71200400001)(7696005)(478600001)(6916009)(41300700001)(8676002)(66446008)(186003)(83380400001)(9686003)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?J3HPbmJb6li4VvZy+Q/QGU45cCOMabtClYwEKom2b3yl9Un5FIKEWpgCuv?=
 =?iso-8859-1?Q?Y701226Y74V3dWnOH/VR6OdGZ3Hg/pBAP6NhxinRNpcIiaV9yINbR8xyqC?=
 =?iso-8859-1?Q?zLHp9Wn6hQ2JDV6+s/74AUMqkQoYoh+ifPt9E36GMvj3XZMjsbRye0qymC?=
 =?iso-8859-1?Q?TYKq+0HeXcrBjZaZL30LIeycU62fUOIagz1/MrRR2A48g67gguG/hGKs+K?=
 =?iso-8859-1?Q?3Vawr1Kp+RLHofhxmyKaPLpvhSAEZVgRrxrMwWeGYQoYZHfE/MyFFXpunQ?=
 =?iso-8859-1?Q?+96s4r7rgygPunZSq8Bwfqw3Wz6LgtAco/fhmcyXrkhShsRUHTIQ5RHF1z?=
 =?iso-8859-1?Q?Fg/0w7N74EgrLigrYl+VPaNq65UNLtxFMmsCobHejiGYwoaReyAdKjBgmk?=
 =?iso-8859-1?Q?9QD4hh8kPWV7g6gkycia6VKlbl3rsL2HdzGZF4H61NPGuHI3O74AHW0kO7?=
 =?iso-8859-1?Q?Nk3iAsGbATr9RbC3vMzEN5Kd07p9p+CPaGjYCBFMCnIy4RL6CXKTcFhFz6?=
 =?iso-8859-1?Q?zeIDakttVlp7eCe48rSCjg5FHK3BRDssfXQOkHtDfjx+cISVauSePlsa8E?=
 =?iso-8859-1?Q?GovSWbT4B9bWdDOzNuOK784fmOYjkgvjS9LuGcaNCVCRyf6JfRPfI1Bep4?=
 =?iso-8859-1?Q?YSVQoW80Ojh2S0Fa7E8fU9qMz5GGvb2Ucff7+KIlcG3AVVjxe/JFjZ6o3i?=
 =?iso-8859-1?Q?UWpdNWhtyEffwP6Cz06ZOyZLJgod8MwnPBXL7hs57RiWtzarYw3gPCsKPj?=
 =?iso-8859-1?Q?4gQDKZhlg3+tRbq25KR9zonyIYhOy8ZNmksDITXmfl6D2PjPED6KotD/CQ?=
 =?iso-8859-1?Q?WB28dBCUabLo6m4PdYecDiOCoESX1hwJK6XqcLMPrAfrBM9LL0ud0mN53s?=
 =?iso-8859-1?Q?CutmK+DdJEVr/t7kZ6MMQZVEc2NnzzalM8m1f55Ng1sPMFo5f79Ez+ijP3?=
 =?iso-8859-1?Q?xIbKTjnPaKTCS7P96so8Ku/twtBTJh0tIBgF/qpPJe+aqRVSO7QX7kFSGq?=
 =?iso-8859-1?Q?JbfXfbmmBIFOTg0P+JTV1PVoNNqd3a0P7313iLJNkNYXrDUyXzvz2LL+lo?=
 =?iso-8859-1?Q?8EM43i8B6b0D+Tn9bxhauKpPMVyUxFQfD8PY6MPgM3xfPZrnDwzFhgDFA+?=
 =?iso-8859-1?Q?hgD0leouL16opHf+lnmZZma+aytaOh1KU28OEOVKfw5Rsx+7pNw/kyAYRR?=
 =?iso-8859-1?Q?QY12uMOqi6wF/ImpGBjSXd+JIYW0ZDeRwHHmTfTXK15TyX7grbwukpynC3?=
 =?iso-8859-1?Q?rEex/DcTfbAKfs22CDITXY/4Z8xd3Sf9GD7jIAMBzVRruj91tyN9t37MzX?=
 =?iso-8859-1?Q?+uhx40eiy/zmfHzkOe1lqbMAcXH74ZXjB2YzFEr+byeU1rvPiBwcfx/jeo?=
 =?iso-8859-1?Q?5Br2itGWJ0NMeVM35rscLx7+wxsg4H2+KnxbDwUReS8ceCsuTpztZcvJgd?=
 =?iso-8859-1?Q?6TQ5miNCD20WXEvw31ZFeWIKVdgdxplAzHKUncjaqZJSbYS2TPLz55tMvG?=
 =?iso-8859-1?Q?xNSs+R2NQ4UL3XluE2oKSr8y+XOtXmFRPZf+Yk9ezqsqNKHvRDU2UPHbpt?=
 =?iso-8859-1?Q?ReB+XpDcbc8IIWUaM7Hz/hjKydbQy1z/NbOQJoFv640iPErKWsWFYqjjm5?=
 =?iso-8859-1?Q?c7cVipxaJPLCc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e1316b93-d3a1-4c6c-b72f-08dafa02dbd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 09:52:21.1103 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LhdeIh+Xu4jb5RNWJUI6J32N8DbD6HYEM531hDWkMraJ/WQZxZ/afulA1jJKCIC7GXC2thgvNbaPiVVpMI6qNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P190MB0937
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eMQKuo1lrjVVP1J9PuvEuLcAfil8lD/ASK69nw+ziM=;
 b=t20ftUepp9hF0mI1zZJ+pKWG+r5BVNFSSGso3nVDJCMLfFr+hx9jojDzLyNx6or20P0Talyq5a105UIj3rVMOIigKCT/8mhE8D4On4VAqTrVkVc9TEFY0tuLAzoiqfibjXfqL8EgXbyiUGZLYHiqT8Kvxzhx+nxu2LTTjUd9+2U=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=t20ftUep
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 06/45] package/gdk-pixbuf: switch to https
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/gdk-pixbuf/gdk-pixbuf.hash | 2 +-
 package/gdk-pixbuf/gdk-pixbuf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index 23a7c3fc05..c3953e15a6 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,3 +1,3 @@
-# From https://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.10.sha256sum
+# From https://download.gnome.org/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.10.sha256sum
 sha256  ee9b6c75d13ba096907a2e3c6b27b61bcd17f5c7ebeab5a5b439d2f2e39fe44b  gdk-pixbuf-2.42.10.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 561e191569..e041d2cbde 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -7,7 +7,7 @@
 GDK_PIXBUF_VERSION_MAJOR = 2.42
 GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).10
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
-GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
+GDK_PIXBUF_SITE = https://download.gnome.org/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPL-2.1+
 GDK_PIXBUF_LICENSE_FILES = COPYING
 GDK_PIXBUF_CPE_ID_VENDOR = gnome
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
