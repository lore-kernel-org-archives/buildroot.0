Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C7FC6379F
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2647E404D5;
	Thu, 19 Jan 2023 10:16:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2647E404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lnhttCz1Od4y; Thu, 19 Jan 2023 10:16:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 579C940377;
	Thu, 19 Jan 2023 10:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 579C940377
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8CA6D1BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59B7B41829
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59B7B41829
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xSbvJPHWGlRX for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:16:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A025408DD
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2082.outbound.protection.outlook.com [40.107.7.82])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A025408DD
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:16:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLlUr5fJGNvVNT+k6P3VOFVBIdedyWbkRh10EyrcTlzljHH7SLAur25no4TrvIlTfqgQaELquvNMN49/D8W/J8h7v/2VE+N3SX4NRX0G8Yw1LuRz3AMHzxG1S3JDboso1szJ0fOiy0fOT3b/QKGdYX7RMVqRm9RhjnAkry/qieQ9WRaC99g8hjKiZJo/wwWBnlp2d75CwLEbXrsND/NxpXW30R6gaMIN95k8oHSPfXuFcL4KuwmLkZ6mk7qYLDthbTQ9km6DhGi6soFwfor2Nrmh6oSGrEla+UIixcHJbbZ8K22dLMLxzwVQukAocZRRTpmV+wcnudSyyUNmf3sjiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fATEGROwmjBTQu+0YK4FJP1wPj8fS/YsnpVOQJihsis=;
 b=LnOsI9SmVTUAjawIBvrYFNEpL50oKv5DcgmpvPyQhzqa/62ZQR/jidFlVsEYQ/4nSYchvvi598TQfmgxUnOrxPjGd0lo3dHjOJ0U4ZzAi4yJpW0ZnLEZ8s2ntuwfYS/M99YpkrnkzNcuLjkJlKLiHyGUy9TZuv7oB81tPmPYzQAs0vtxBDQxsUUKlQd9pq99x/M6VM8t9NmJdbIj0Ic9Ip7Jo5IIOZNINMFujkrv2uhhtNQR+TYSjE8cSaY/HtPANucrCs4qG189SYYqGzdKRVNU0MJuG7Di08SlgrYjM9hHGxKKyUsLhQ6sGlqZb9J8rZ2CCERpscKv9DPgRoTpBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by PRAP190MB1716.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:27a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 10:16:48 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:16:48 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 42/45] package/pangomm: switch to https download
Thread-Index: AQHZK+5uCJ95tv+ZZkC0b0xAxwSiLg==
Date: Thu, 19 Jan 2023 10:16:48 +0000
Message-ID: <VI1P190MB04937629EB4243D09EC7DF1D9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|PRAP190MB1716:EE_
x-ms-office365-filtering-correlation-id: 1290ea08-d52a-4db2-cfcd-08dafa06469d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PfKqRqx2gEibyg0pnw3yMaoDo+jYlXM0UR7xiV/r6ndncWMm6O9t75t2lCxex2WbGftjDNKpQfYVhsmdIkYeN+wl7cCa42As9ODSlmLf/6Sto6O5qlkDevBgiec53A7eYWrh9pQrPsDIUiMlYxTjUXSVsphvc4J5FKpzNXzoWVEJZ8fJVMHdJiZ+Iz8OZEi/0WgM0h1tBNUF9OAs7q9eYIfIDyYtzhHlOJ6jWeyHOUm/9ieiAMzwJJ/PwHxCulkj3jkDwnSgzKrs8aD3uaWZ6VJFgx5gb542+77uiOrT0GHKokd1dMItznSoq8Idk+GabiirUX9LrCvre/e8GaZqcLVqYUD2EJkBNlM+u0X2nyt+UBXud4IaGxAtK8YhxeoCoREY1UW+Qrif+59k0qoaccmNZIStF8mZQpbkvXK54dqvMKIr+BHgcjv29yLnKmmoxMsoP4qMh39UizKVe3jSKXpKtD+dLtx4nrrjo63duzbmwhCwShPChTNbDiLYZaO3byjS38HJo/9XBVg9k0wjLiGiov8vJ2FyUsLy771wPZOX0JzART8wxtcj55K3Zwo/yGSScnQGZ++QgiAsGiLshx+ioEjd8eV2lBxvhBQlaC6GWCWYJtmsZ9gRQa9YdKeCIytzSsbYQYwgDXrWrfoXbz909G5erZGB+syKzCFvV54GOt0kFSs2JnJI6fnKX5QNJFAkkSgSQzrYsf2rusSAokb257r0rdjXv29RXwdo63w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(39840400004)(396003)(366004)(451199015)(478600001)(8676002)(6916009)(9686003)(26005)(4326008)(52536014)(86362001)(41300700001)(83380400001)(966005)(71200400001)(8936002)(186003)(7696005)(5660300002)(38100700002)(33656002)(6506007)(316002)(122000001)(76116006)(64756008)(66446008)(66946007)(38070700005)(66556008)(66476007)(2906002)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?qexOU2w3kyyxsOwLNwkSQMMsQiAcfzksDEqh9hSwsvmkLxnaZkjbTSD2wj?=
 =?iso-8859-1?Q?lhRMXwM6vdIOwJSzVH7KzrgiXMMyfEUdvS/GQWAM0NdHbYA1sEh0RLg3Lt?=
 =?iso-8859-1?Q?jIqrDi2TV+iscHQlnTJtBtUgmWviEpsp6QwvSyEzxGDJ/7KW9e4GhS5Bwl?=
 =?iso-8859-1?Q?lw0DGKe/rJBoOtaW6EhRnBvybuMxJNOR+zHa7LD4xKvmW9WEb9KHG3ZPPc?=
 =?iso-8859-1?Q?FgPC6O4eyRMTBUBh1mYMZoGYKdR8GfHd4vPyPTg2Nlukii+VyyZ2d/MsWh?=
 =?iso-8859-1?Q?BAXv0pWi/6IfbRt4/J9eovnp/iy4gmVxjcw6I30QYX52L9TzS7aL6RwrdE?=
 =?iso-8859-1?Q?qRmwy8UVHqsuqkttPRsvqHY2OUXxeNWWrize/dh98wu9LNjwko5W2MAa0q?=
 =?iso-8859-1?Q?edU9/8v92ZytJw9lZRQfb+QdPhQrhgYYhVtVF66AlTr/BUXnC4/yCzrpzN?=
 =?iso-8859-1?Q?/yh15oj2avPoExFJoMO8qgCPsLEf8Yv5rwYrGd7iYrUjJ/iLJBkVwHkTG5?=
 =?iso-8859-1?Q?UZNGM7l/pD8W8nnmWlj7X4jkhYKIe2/sAGCCsYPFQw/kOxexrN7Rdy7IhG?=
 =?iso-8859-1?Q?fnYe8os+zmMx32o++iOl3f47Z5LmrhwkdfAfFWbmLErk9TDeQumH9wSAnv?=
 =?iso-8859-1?Q?4HnAV8go0GHLe5it/lqktIthlv2O0+V0AVO4xFV8VnqCjP7fSbZoZDX7SJ?=
 =?iso-8859-1?Q?GIGUuKsKGvJIZkFP5FOQjii9P/JrOsK4A4fjRKT5WkhIw7N8EleurbA+1T?=
 =?iso-8859-1?Q?wo13u+K5PckV0ssxiN8W10Sugm1eO8HL1bXbTx+mSWZBoq9hZRet1FXExK?=
 =?iso-8859-1?Q?X8l7AXTrsbrAFCN9uISpnWL5XEcN8uDZjTk1UDhEq0OAPvatoQ8BiFsafQ?=
 =?iso-8859-1?Q?N7xMsTAEqB2TsNWLuhhdBoRmXCXM+Ow8VkUT5p26Vf4iytG/09mceufFST?=
 =?iso-8859-1?Q?ZzVxY01nzUdQ2awNskXCDnP3OCGx+Qu0K0yobwopdDGMbW4k0FF3lC3959?=
 =?iso-8859-1?Q?lqokoqCDoANS+urA/Av5efm57TZx9eX282yMNOwO/zm3MKy0br5VtcYfxG?=
 =?iso-8859-1?Q?Z8qHi1olI+xGLIeawtB2NL6i7+cq4xldfv/BJu4YFBG5/ak4ofsfUAL6qk?=
 =?iso-8859-1?Q?wpPuiDp+mpQYzsJD1iD4nyhg0ju1khhEOQnn/USmOETgKaTwwDZVuzbDSZ?=
 =?iso-8859-1?Q?syNEKB1KE0fvmsIVoNLVmFrS6Qi15UiSK1iNHgHJKF7u6j1fwmOu2ugxHm?=
 =?iso-8859-1?Q?GOJhHVDSaa+p7mVezVSUUDm1ArYaq9WAe1467NmbAAs47sXLE2+HYqAFUp?=
 =?iso-8859-1?Q?xPxZKaZg1bHpWQhRt69e9ZbU7g7zWuEZQhALo+DCwNMPEMj8NOz5GOWtCv?=
 =?iso-8859-1?Q?Ac4WrWql1PvJWHpkzdIkVyLGr4FSNx/rsmZlzaF+9v3XCA4BeSE8eztkdq?=
 =?iso-8859-1?Q?p27SZghDaOSDdm0cpdd4Ryf8b4ISQt7ImXMFE481GZiWwXQM2XVhLbvvU6?=
 =?iso-8859-1?Q?7wh2JVIgJ+4xO0XYj0c22qKBxb8Zg54QwYZopLm/xkc5i5rF5ewRMhBQvt?=
 =?iso-8859-1?Q?tqF4He/ZFD5YVrGrYs44CxQQ6TYU9609+IVqhYlxhzh4gIZ8oGGQHpv22X?=
 =?iso-8859-1?Q?qD9g7JmTh/tik=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1290ea08-d52a-4db2-cfcd-08dafa06469d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:16:48.7373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jwcomYlwQEzWWdphrD0i6jRuGCAyhIZ9iffHnY9K6Uu0Sf4gJv7IOEdZ37NdPGnXV7nqiLNxQMdRSPEEJpRWkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP190MB1716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fATEGROwmjBTQu+0YK4FJP1wPj8fS/YsnpVOQJihsis=;
 b=hkWcgC/9VVBl0+WX7SK5Ivu87fD5KM4e+UIfInLHSgZ/xYTTXKiUdAZlt31MhjqbFxDV5mRzC5QOKJORLdpjtIa2mz5UVtG0s0K9u0TPOlPTWQL8xfMy6rur4Vgxm4WlnJakWtL+kFU8J5gtz5ABYbDElPWNBcRG5xlCENuYmrU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=hkWcgC/9
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 42/45] package/pangomm: switch to https download
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
Cc: "james.knight@collins.com" <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/pangomm/pangomm.hash | 2 +-
 package/pangomm/pangomm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pangomm/pangomm.hash b/package/pangomm/pangomm.hash
index 3fba695831..0fb40e6568 100644
--- a/package/pangomm/pangomm.hash
+++ b/package/pangomm/pangomm.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/pangomm/2.48/pangomm-2.48.2.sha256sum
+# From https://download.gnome.org/sources/pangomm/2.48/pangomm-2.48.2.sha256sum
 sha256  e1d75522c53f462799875cd247f9b49c91ced4b1abe68387ac35b271392d4ea5  pangomm-2.48.2.tar.xz
 # Locally computed
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/pangomm/pangomm.mk b/package/pangomm/pangomm.mk
index af90d69c4e..e5b237197b 100644
--- a/package/pangomm/pangomm.mk
+++ b/package/pangomm/pangomm.mk
@@ -7,7 +7,7 @@
 PANGOMM_VERSION_MAJOR = 2.48
 PANGOMM_VERSION = $(PANGOMM_VERSION_MAJOR).2
 PANGOMM_SOURCE = pangomm-$(PANGOMM_VERSION).tar.xz
-PANGOMM_SITE = http://ftp.gnome.org/pub/gnome/sources/pangomm/$(PANGOMM_VERSION_MAJOR)
+PANGOMM_SITE = https://download.gnome.org/sources/pangomm/$(PANGOMM_VERSION_MAJOR)
 PANGOMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 PANGOMM_LICENSE_FILES = COPYING COPYING.tools
 PANGOMM_INSTALL_STAGING = YES
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
