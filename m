Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248F5C4332F
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 12:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD6794035D;
	Mon, 19 Dec 2022 12:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD6794035D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hrgKczNxgL2b; Mon, 19 Dec 2022 12:11:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F21C402E8;
	Mon, 19 Dec 2022 12:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F21C402E8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5CA711BF267
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 12:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 005CE40926
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 12:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 005CE40926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ClsdSN5U4WFA for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 12:11:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 534A740281
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 534A740281
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 12:11:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lz2kRsY4PXcc2s9cq1PK9NfEvVnzjOiDzh9aL9rVX1nsWCCXQm9qManIsfcTe1xcFZRJPt+v3cQg2oh7Kf6ynozvvVpfFMuvqlLoBOM58fO+S5D2gyROOVZhJFmnlAhLph0tPak1ypL5n0idhIi8L+4eCm5mzVfqydmHBvMfUwBi7fO4igNI9K+PNjObyTtC8NCkAAYhNBVPe+eb9Qci+kkvc4mVtlnvPbh7G2tUdsfg//ej0l5L1N+Us0D4fBafaZuK7gG2tpzMWgNXOsTzTJA+v9739YLf3jyl3Ezhf1lOkzk2vmHFpJ5kw11xbt5ASF4I04d9XBZ+0PWLV8E3cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OleqO57eYnpatgXZ6pKHd/M6A7R4oRnKbTFiLyNUXU4=;
 b=ExTJ1VenHdEnnzb69V2U4hGrJDiitwRQfeJGoOC5aYldyYCXChMhph5h+vNiwJycV/nz7FPj6DUQ3o32xFH54GOrnhCLxwY74N6oSqafUP/CGxH0+SiLEY0nLAY7VQzuBjTK/wkAzLBh599wwgSdHCGyxW+k8dO0EGyUygyAULSGV7jjjxnJ0mL5j4WAUamsttLXbI0ZuA6aAqaoZwSY8VSDFYLSAwpLUKocc3CD4Z2W+1QQvyTKnG3LOUQ+rv4MgNfh8ETz7TscjfZ2ryr9kkosFCIQpdX818+4Hzo7lZxQqJOYkF9BiTjk5SxW0QWPjAE8Wn7Rd9bTJHDGEysKZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB9P190MB1035.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:224::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 12:11:30 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::ce0a:b080:a30e:47e4]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::ce0a:b080:a30e:47e4%5]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 12:11:30 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/dbus-cxx: bump to version 2.3.1
Thread-Index: AQHZE6Lql4WgWax0KUGpCYrweUqp2Q==
Date: Mon, 19 Dec 2022 12:11:30 +0000
Message-ID: <VI1P190MB0493FD977027E500C3EB8CAC9FE59@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB9P190MB1035:EE_
x-ms-office365-filtering-correlation-id: 6ae80fd5-1ec0-4a32-f25f-08dae1ba2972
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IMafBB7f5TB0E8i/2XjnMnq+SL9HMJ8jxbRIFzkK4UXpJ8sNgnWCc6kgIaRSxGFX+EE8TxfS8jkeS4SKkZss9uwcRnkgFihqiw//jpV3vXCewaEkZ/K17yzA7l7v/Tz2ZOShQqAQnzFEdftUuiSNSZmCqRiiSeigQ1lWggICQHUZjb0vUJuA2OjiQsD93btzgOROIS4oamdkdh3XaQlDisizsmS/ZkIgZ3eW4o0N3SwDB9ixsjP+XdoW2+UPL2fSSpXuHApdwIDWHGop48ibROzhuk3vsJw0HChV7jnwEvkTO7BbmRchovJ81ANoy0lYb2aBgykEfimi/QAmiBGM2OB+xaamPufI6bMThcbzPLpnX8q9aQbwCoQB2/1cE8K5SmqjHV4HtMq/Lt/p5oBLKfUWm8Z82MjrB1YRbUV0WFE0NFOpLsIarUf/miiYJ62gXiKPBp8c1z9PxBUh9ApIHKjPH/7gopZIeRiTJLKUJ+O+y3thKSVFzj+rGlCHE8fUUV+pGYN1k7Krlovi7ijNsaK5uipX42T8YPUiCKhgtzUhaaXqeOsJe7whJGBPRURnAjANyZMngnaSqpePzFMlkp2LrGXe1bdVo7Q2X+1ZPBLitqp8zu8U6gyOsea/Ar/O/QP0ji6SnT7Z33Irbsbo211clgNy3YWils4QEhCvSKNu4phzUyYYvaxQPBtMO1nW9yD0jHDhgk8nJdbmc6ebFQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(136003)(376002)(396003)(39840400004)(451199015)(38070700005)(86362001)(64756008)(66446008)(5660300002)(66476007)(76116006)(66556008)(2906002)(8676002)(66946007)(33656002)(52536014)(122000001)(38100700002)(83380400001)(478600001)(6916009)(71200400001)(316002)(55016003)(9686003)(41300700001)(8936002)(6506007)(7696005)(26005)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?nx+FU4cYRXGewjkpXsqtcN/oWuNgfcx5ZCbj+YVG0SudtSzg8U6ymOxrCd?=
 =?iso-8859-1?Q?lxawCnq0RLYJ3sNnND22Sc7f3ToOg4/X9P+fnk1TGHoM56Y5Lmzh7021jb?=
 =?iso-8859-1?Q?5qkBXVPVH9i7/0i5z6yh6D2yK04MAJdH3AOBZaAjS+DxBHWEDSys4ZU8sD?=
 =?iso-8859-1?Q?IsfCaqpu8V7W6tWiuqBPnfd8FZxb21pxVlDiHAXCjwQ7qJV5JphIgMcvVD?=
 =?iso-8859-1?Q?t1cpUarl+CHnChpowEG6RBphE7eRXpg2i86Cixmh+Q8VogvBQ+GGziRUWM?=
 =?iso-8859-1?Q?8FUTHSLdnCKxo+fTitkAXZmJ1l+npzt1UVxAg98IKNh6509Mpg3R9umVco?=
 =?iso-8859-1?Q?I24iiA4LJzFE5yRMHO+4jU6Gkn56iVUuE4VHoiocKVTUY+qy/A2PwkLCGR?=
 =?iso-8859-1?Q?tJprdZ1yu1lMLdeq1V+xWlt5lCjJNu2MLAwACbBv5MN7/k3MI9QWHSRWLK?=
 =?iso-8859-1?Q?lTXmJrmKRCmdlpgzIjvbmERMK8SmBOW+UX/q0l9ugXVjZgGDb8XMIJHekS?=
 =?iso-8859-1?Q?6kv/CEPnAdslHScCT94ew+G9UkgFIiZBWGMIKeW25te8d99JnyJLYeErZv?=
 =?iso-8859-1?Q?CdjwNbmUOas0jjv2jz9BsLAJkmPHgtYIS/w9h6H6w4UvVEEo0nzQOGHhjv?=
 =?iso-8859-1?Q?LmaQ6KMXw+vnv9fqINnjZ7BMN7pcHL8LgT6OxcusDjp0eEiRKtxV04Np2d?=
 =?iso-8859-1?Q?+698byYWpTQaP92M0Lg2CAV0tAb5qG04TyrhGoJFHUNGZ5cs9N0rRWlR1/?=
 =?iso-8859-1?Q?Q1FDEbQelMgqdmL2LsStB7X6q1KDzZlNq2NqI7vvUZ7FRHz8F8XvW6oyO3?=
 =?iso-8859-1?Q?UJsMTYzj1LtVW+/q/nm8LSs/FBvkLvWjNZ/ST8NWrexLVeWJJBVinPPIzI?=
 =?iso-8859-1?Q?9DzEa+Wav+t3/RgaZKCAqmOYdjs7dRBOAHsxoF2X5HLJhRlcQrPDca0yPG?=
 =?iso-8859-1?Q?g578OTHjpzdEVK6DrgwQP+hvVOIOYMRAdmd/PIYA89jLtcL6bXsky2BHqM?=
 =?iso-8859-1?Q?XELCZ0IBbBWjGjsOKKPenraW8+846dubaaZ4asRBy8cHr8tj07VF41nwrL?=
 =?iso-8859-1?Q?fAscNiK6s8qNnEPDxt1KEIEbL+UrmTWVliqg+oMEA5HWeUAI6TrclcL+hM?=
 =?iso-8859-1?Q?NHb0npZxtw1jGZPs0Vec1P5jCSB2oJGm+Nh91uE2nG+4bylOSLGrdrHQmr?=
 =?iso-8859-1?Q?rsriWWejFzBXa20iKTm/6qYRkxeqT6VctWQprjneqPFiGVaUMpaVO3tZ5X?=
 =?iso-8859-1?Q?7eB6Igqncbl6FJyh+NGmQ2JHQfPPE+C1dirLHa/UoLkOYdcPk/43sLQ0uj?=
 =?iso-8859-1?Q?t+cW9QWwlxm0lX9zvgCX6Od5gBwp8jg3S58VlfA6rRANwKrDSRnvsusyRj?=
 =?iso-8859-1?Q?fudoud/XZgaj36hXeLUQXypyzotUTRfSLhgfyw3+nkRk0NRQBtljAc2yE5?=
 =?iso-8859-1?Q?6fqnXFvE0MDxLAwUvEY2uRrqkvFhDmMzHp9SWLKQ5KSyWzV6RnGeR/Fgnb?=
 =?iso-8859-1?Q?uBZjZS7rYUK8AF3QETpSKhPO/krCr+qt9Dqpy49gye3YOZclhNr8+G6qeu?=
 =?iso-8859-1?Q?wlxz68hQWS23SN/7WVkVim5RGbDvU3fNBqjmu8OzEPabT7gDlLu/Q+QVbB?=
 =?iso-8859-1?Q?D9GvMCx86Q83A=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae80fd5-1ec0-4a32-f25f-08dae1ba2972
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2022 12:11:30.1599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TnrYBfgXiIMnUYGTHkdGbQV2K0owL4OjPXf+VehaiXq1mkHb22XUldV/n+mrLw4d+m3ZN/Bvo2+Ijd91zLkhKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1035
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OleqO57eYnpatgXZ6pKHd/M6A7R4oRnKbTFiLyNUXU4=;
 b=001q8L8dqxDd+vITwrEIzmEoq9az+5HWw6UzwHWXF4RXKvzMK6JI3M2unZbvSn0xN4kOhQPCgyi6C7szKm8T+NS2VSzdlkgXyoxxOC8iyrbm+dq+0fPxkDf1nVUkhj886aKs40Lmpjz6JzG6rlXBS2D61ZTVsHEFc8H6t4Pwbq8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=001q8L8d
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 1/1] package/dbus-cxx: bump to version 2.3.1
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
 package/dbus-cxx/dbus-cxx.hash | 2 +-
 package/dbus-cxx/dbus-cxx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-cxx/dbus-cxx.hash b/package/dbus-cxx/dbus-cxx.hash
index acb059b91d..6a7a634ced 100644
--- a/package/dbus-cxx/dbus-cxx.hash
+++ b/package/dbus-cxx/dbus-cxx.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  45663b6dbc289f133dfdcd8b8de771de3a2d54588954c2eec3f97888b03bd8ad  dbus-cxx-2.3.0.tar.gz
+sha256  88d4bd1d9af8563bda03f24b26ffe4efbc555ca82ac664ced572b053928f739a  dbus-cxx-2.3.1.tar.gz
 sha256  99e5d0ad951d96567a6f9a17f3f17ac000c0582f53357c7f3601851c2dcbb786  COPYING
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  cmake-modules/LICENSE_1_0.txt
 sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  tools/libcppgenerate/LICENSE
diff --git a/package/dbus-cxx/dbus-cxx.mk b/package/dbus-cxx/dbus-cxx.mk
index 43556195c7..554acaa67d 100644
--- a/package/dbus-cxx/dbus-cxx.mk
+++ b/package/dbus-cxx/dbus-cxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_CXX_VERSION = 2.3.0
+DBUS_CXX_VERSION = 2.3.1
 DBUS_CXX_SITE = $(call github,dbus-cxx,dbus-cxx,$(DBUS_CXX_VERSION))
 DBUS_CXX_LICENSE = LGPL-3.0+ or BSD-3-Clause, Boost license (cmake-modules), Apache 2.0 (libcppgenerate)
 DBUS_CXX_LICENSE_FILES = COPYING cmake-modules/LICENSE_1_0.txt tools/libcppgenerate/LICENSE
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
