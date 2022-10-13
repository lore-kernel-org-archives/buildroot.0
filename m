Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B96C4332F
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 15:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF13960B8E;
	Thu, 13 Oct 2022 15:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF13960B8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zqYEQsaRp7O3; Thu, 13 Oct 2022 15:02:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33A2760B0E;
	Thu, 13 Oct 2022 15:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33A2760B0E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBC961BF387
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 15:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A30BE83EE2
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 15:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A30BE83EE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ump3sB1o3UeU for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 15:01:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8F7B83ED2
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2064.outbound.protection.outlook.com [40.107.104.64])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8F7B83ED2
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 15:01:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0kbha31m+8yjIjnCCMxW0CppAsmvIQ+GmEl8VLpdsRJ+V8rRlj+ThV5p7T1etLxsFbNwRcwuhdtAAzWG5IgMgO2STM6w4NRNyW2OrZJtlUkypfZic/Jra6FpKQvqu0C+1JWUZ6ZzVfEx1UhQYGxxfPd+9fyMiw2kIcKp5RPl8jYaFsC4Uaj133BJWQiroDVziEjuBM6PzXOeDWPIcOfhpgVFCQa0lAvuQ8loPy18bzKbSvRxE0VIQI62YmzTHB3kCZ87OIBnz3ZsLnInfENT8VWom3jDuQQiHw60924RHoGtp2tvq3rVWKFktIQY4CFeN4EgGatq1OZ5MuQTTYEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3b7rCNDtJiRz1klA+6WMd5Im5iLz/+gee4QWqJ1CLK0=;
 b=Y7o+KcvwXWFryDKaFPa3cOwqX58AznZqonXI/Mrx23AMJsKsbXQWd4fvkzlYCojBu4bw4LrEW/FphuHElHdlNanJfhJ1WcgZsrlagXcDpbslGX3KAi9fHo7WYIA3QKpeFtqK2hzKCeu6DfPhyyiuQmDClRH/NdPHb/iIu9t67rlxHlaOBpiTuVwJWkNhvavkwD9ke2jNQsIoux96oTYYdKAmhCWbuawd6kjnR/Ac5NdL25zVZor/8bGqnJsW3d354PQb8asmQxwUuE3eTMZSBk1hk1jhuyuq/2H+AbdTPj6C2MuNoBj6hgKWnmLoh404QzBDAmnmF5PpuuwhqvCurw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB8P190MB0682.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:125::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 15:01:54 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::818c:f70f:e157:b158]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::818c:f70f:e157:b158%5]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 15:01:54 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/2] package/iwd: drop dbus check
Thread-Index: AQHY3xFnLrnvetmAG0CKgpwo6UjD6Q==
Date: Thu, 13 Oct 2022 15:01:54 +0000
Message-ID: <VI1P190MB0493E0B331B7910A594A5A689F259@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB8P190MB0682:EE_
x-ms-office365-filtering-correlation-id: 8248054c-63fa-4e48-d7b9-08daad2bddbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zWMFgqyCISrA22WLSYvqAIjFgqI9q642fa3YuvFQQ3fCpd5jGhMTo1sDvHd3wwrDn5ey+8VlIO/EChWTzMg5vYWk0CYKdDpHU0+8+ek4oVX3jyN5UWtb1/hv9c48B7891SfA+JV0QVQVXmhKZyqmoXqx854mx3DRk5tj4h8aevB8DYBR7iPZqJADRwClVO6GncsRt34tejqxrtQ1sFsmA97XZIAwosbb/Kaahm+9Jj310l9wp3ERC0g4gXWiE2Bn0tqDOA3ILu9mSfvx7QqFUq3WTYSMFTr1PKE9N+IHlsqQ/ZEZ/IuMCiR0ruNSfi+zepO2Y6Xbew1nZhrRNlUkzy0D/QSNSU34GlZIIszTJRDOQ7L6PZoYum3KD1E9oeoIgm9NOk5SFHvbbLV6DRx3wejlQI2CSAMaW9l9s1aGnhV5mUepEg9RI1i0vV1hDQnbsddx/OkOp1kjtS2O+ThO7eSbZbHbMAcyQVmQ9ZQPx5IJu///vzWU8lEabh5e+h2ZdEbdaAbppybvqk5EsMxBv8p8yw3vYZITIvFwFWPBkrHf5K79UpWZl+vqLwSQJpMwhz/4iJ25z+S/uKMiOGE2Np4dzyegVhtMHQvbQ9hEJXgTV7YKkSRK9pKvFz7AP54v8ouLqIgOCaW9X3WapIpHM1NNto2KlaHSYKt9EzB6etxkwkye9y9Nbp0xLwuD5oSDYSRSMRgXMf5c1m67Bt+EmUto+YS4VlD7jPBv+Rwe1XUYpGr5V6JZ3Z4AwLce9saUlHKTbtINokjsYmo66PBwcQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(366004)(39840400004)(451199015)(186003)(9686003)(26005)(55016003)(2906002)(122000001)(52536014)(316002)(33656002)(66446008)(6916009)(86362001)(41300700001)(66476007)(66946007)(66556008)(8936002)(8676002)(64756008)(76116006)(38100700002)(7696005)(478600001)(6506007)(71200400001)(5660300002)(38070700005)(4744005)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7S1l22q0fedwxYavroL62c+dReYwXUzvdVNhIbqf2yPlAysQEkvwgheYQJ?=
 =?iso-8859-1?Q?0UEWVKTDPybeWZzUKRfxvskj6VXP+xLb0zY1znoPWAUzTOUUBZIqbjPj2i?=
 =?iso-8859-1?Q?Np20YvmJ2mFIhyYkSaYF1HhZF533zFTLF/gBbBlcqDm1Nhp9jVdi63V023?=
 =?iso-8859-1?Q?IgKyCZ2Ne/9QHHKKVxOCFdnLA62fxh/znE7NUNhL0sI+qhv9SqT1RHl2OS?=
 =?iso-8859-1?Q?oHkqbUB8bwAQa2b4TwVHMHrOAvPV3ElaaFaIBq9+eIS6uORxaqjk3Z1i7P?=
 =?iso-8859-1?Q?Mwdi9YX5o6gh2iGLbgJMBGonuVwtPQQVUILwGcNLpVgTmWlQw6sz8oDxDY?=
 =?iso-8859-1?Q?5nbNBAaCdT2mOdX/Z3B3UFY4Vwd8+wIMbpQpQv4wpaJ3Y5iP88qzE+d0CQ?=
 =?iso-8859-1?Q?4+YFHz2WVGRv7iwMtY24EPmWa3IyXGq+DSVzb2cJkEGNBy5jm0SUHLM/OI?=
 =?iso-8859-1?Q?uhBGKA8Mab3jE4jrSN1hEd0/iKHl3zwdeM1meYxS/MYC8CHm6szV6zlCEc?=
 =?iso-8859-1?Q?v6Q4d/IFMEMwVaksKhB1xvUQ3OrcP7zNKEARNpXRPRYpSgSfUkQbR4Vtt9?=
 =?iso-8859-1?Q?/qp5bYl9VQWYdPERc/7eY/9BcfWGzRw75GgDurrQQCIxMlWEujW22eQfNo?=
 =?iso-8859-1?Q?vu+ON4e2yCkKSDZRdspI6CY1JvT738PqFWZr/vGjpJbJ1IqhmtNqyUyiD7?=
 =?iso-8859-1?Q?Ydvcj/Q4pWm0haoM/e5Zd2ePOrDkwDuyTuJTL0RKZ0pAUIXNJdrsfiZAnE?=
 =?iso-8859-1?Q?x4CJ367ggnzo17gjigs1mufNbAQVUC3LjtMUpxTYAdgrmlqL0qZ5Agjj74?=
 =?iso-8859-1?Q?MuPOclYlh7L9vMD2sMXC/7Ga6OhncIYZkOzhjxmnFGQb5herzXNDUhhd75?=
 =?iso-8859-1?Q?uJWka1+wQLsKz7rEOY3Ht6v7ZRbWyCujMSqcq8Q3/HQdHoQcEJp/nLusY7?=
 =?iso-8859-1?Q?LvomLU4F9TqRDGO3ocrPJ0GCyX3fHkqsGxos45/+BD84WSOnIFpR6OHNjR?=
 =?iso-8859-1?Q?XEbaKEqvvBvKDPzEF+OWEqx6S4L9+mWMYjoNO+6xAJAlUhVYR93UF1fpdr?=
 =?iso-8859-1?Q?modbNZSEZTL57+pdm4XHVqj3MjJqCBoqy/+Ob9Qxw+E9qOTTwD5VxmEPDi?=
 =?iso-8859-1?Q?lHejayVI2g8YtSP2JB7OxNSVQZBcTcT9p6S8ZUb6wWDZIBqG9n0NgDJECd?=
 =?iso-8859-1?Q?AKDp44OwyVcul9UpI78LQTPkrznOIyL2wfSPjZHORN9B0vovQnUWnJ0jGh?=
 =?iso-8859-1?Q?2jk/puaIP6jSOjgpJa1LeG4pekKd8ujtE/Gr4g9GdYHeOv4ti7V018trBO?=
 =?iso-8859-1?Q?QZL+6Q4alw+SM/6gjnfDPYtUcTQlETG1FrKSymVv/vfcGLtbnL8n4Suo8G?=
 =?iso-8859-1?Q?Zl/tLR3e2BldZARheHAeWf1pbBSOdmiOE0Q6c42JUgb6uqlYbVS/S1b57O?=
 =?iso-8859-1?Q?zY6OLuKU+My4faSudT4rJnQMRVx/kjEKHcrGu7XxJyG5JIe7QALCS9LEAT?=
 =?iso-8859-1?Q?aLMSTSIaEJUsKbagPIt5e9sEnSPbQbicdAhZZa1u1Alu9gAqvbQM7UpPr1?=
 =?iso-8859-1?Q?ETSrq8adt8gCSrlSIvDTE+blAZgctMM92qvnnGKSFhLkvRKjOi3LeiZ8Fv?=
 =?iso-8859-1?Q?Yt4dE8v/L0eBk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8248054c-63fa-4e48-d7b9-08daad2bddbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2022 15:01:54.1726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UKRPlofvCoVe1/Dck0zqmhytPDu3WYjmnalRvsolklDQgUHaOqnVLZ3UBboVBlNvPo5ckCzgSFwAYl/2KsTsMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0682
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3b7rCNDtJiRz1klA+6WMd5Im5iLz/+gee4QWqJ1CLK0=;
 b=KuFBziTsZ1xATlckgfCZubgyLjU2oOGRzF5+Qy1yu3ZPd949WMfNqnYnRtfuQOnPnlD/cN5txpioZ/Uzl1CreloxQe8XE9G4OqA3mIJifObvd8jBzeR5tAYK7aohRpxEH7ZSK07DLKnnLT+8o/HBXNLTKRdzU/LucCAay6/nn8g=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=KuFBziTs
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 1/2] package/iwd: drop dbus check
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

Since 6f5f6bcd8 dbus is selected when iwd is selected.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/iwd/iwd.mk | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index fc10c5f1d4..8497fd1141 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -17,15 +17,10 @@ IWD_AUTORECONF = YES
 
 IWD_CONF_OPTS = \
 	--disable-manual-pages \
-	--enable-external-ell
-IWD_DEPENDENCIES = ell
-
-ifeq ($(BR2_PACKAGE_DBUS),y)
-IWD_CONF_OPTS += --enable-dbus-policy --with-dbus-datadir=/usr/share
-IWD_DEPENDENCIES += dbus
-else
-IWD_CONF_OPTS += --disable-dbus-policy
-endif
+	--enable-external-ell \
+	--enable-dbus-policy \
+	--with-dbus-datadir=/usr/share
+IWD_DEPENDENCIES = ell dbus
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 # iwd client depends on readline (GPL-3.0+)
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
