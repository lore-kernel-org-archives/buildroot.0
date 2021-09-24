Return-Path: <SRS0=OK8R=OO=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F05C433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 16:24:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4917F610FD
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 16:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4917F610FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=theobroma-systems.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 183CD421CC;
	Fri, 24 Sep 2021 16:24:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A1TT1_8LGNXM; Fri, 24 Sep 2021 16:24:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EFE141965;
	Fri, 24 Sep 2021 16:24:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 977C41BF295
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 16:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86AE66074E
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 16:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7TjzFlnFlV58 for <buildroot@lists.busybox.net>;
 Fri, 24 Sep 2021 16:24:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70084.outbound.protection.outlook.com [40.107.7.84])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AAD060690
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 16:24:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccLPJH9ozyGTGiJ2UFIgdGAiT8Cxl8dAEC/6XdhXauV1n4e8Bj4H2W3YeaqkfGbmWwm/eVpXDHzABsPiK3pA1Q99zpyb+L1F9B6bl+YYso4Tp//coWGhoSjOR2ANCDCfakIWhD3+pULf+91Xk4LK+NdN9yriAku0ctcpKCNcxANoIQMqPRjYEf7jjk6/bKF6KxpzXJN6/XKETyENHt7/y3HrzFalp0X+D+fY1M3dJ0tJI0/q/AxnWjSDKBPNOLobLrbWoufpvRi2Wse3JkERz95o850QgpYsRahnonPYEfysV8KxUzoTJZtXUYcJrizBSX8ARALhgqvxoetpS/MvpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=oZ2GSjrJ1I6mjQSkFrivIVf+6CxOXbTQdO2iMbaZ5JE=;
 b=UGQQnOLrpJWOAikbsUR9TM6HvASM349jKht+6LloShgPx8kLImRRaU39mlj2yRsX4m8dUxfkqjZjMi7ugq6/gwueaVp7CEdSuaAkBjzCDQc/iJt8ELjOIkhZFBYn9tI2fqtR0scVBOLBx1f2tVB/yH7qc99a1RqeVhqiXdReojfpB2uQfX/z0Jva7cei5L/8mV9hgW4CJmLb0SJbGl+M00NBrZrUhUYgNbaOvTIfOOFJ2XGuyqPLrS8HX6Uyu39Uo+B04Ug3E9J2gkEuDo2C9kkqYriFTplE3stKKZkX6r7ZgQgKfMiNlWtTqWKLJ4Xwve9aGKYuAzSu6Mad2wxxRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZ2GSjrJ1I6mjQSkFrivIVf+6CxOXbTQdO2iMbaZ5JE=;
 b=lTwYIiadXm/DXEg0dBKGYK8ht2pWC5pOD/y+B+exh+WTuSL5IUdlAXzO1YeH8HCwtXPkYx05IWV7c9AnHxkpYhypDhA61f3gGH8aIedtSqhfb9VNK2Zg9MRhe/8jq6T19mcSClc3pyeLJbFaWhOFj8hG0LLeMxdoJW+ox2q6U8U=
Authentication-Results: buildroot.org; dkim=none (message not signed)
 header.d=none;buildroot.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB5618.eurprd04.prod.outlook.com
 (2603:10a6:208:123::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 16:24:32 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64%7]) with mapi id 15.20.4544.014; Fri, 24 Sep 2021
 16:24:32 +0000
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: buildroot@buildroot.org
Date: Fri, 24 Sep 2021 18:23:49 +0200
Message-Id: <20210924162349.2802374-1-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: PR1P264CA0003.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::8) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from localhost.localdomain (92.42.140.82) by
 PR1P264CA0003.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 16:24:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0256cbd3-f119-43a6-309d-08d97f77ca4a
X-MS-TrafficTypeDiagnostic: AM0PR04MB5618:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB5618A663259D8016126E17E1C2A49@AM0PR04MB5618.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9kbcUU9Lx/T8Rlz/dHJ0dekU9KG1txkJK+v8CzrM0VcT6RMxOTJ8EugDa6XUe2M/gzH+QhCScNnglsDylZ5/+c0KhlSlIHP05yVqflr+aM+sDh1FhxBV2cdMKj1EMyBE+SHIIriYLN+C7/bEINStvRQrmDCJabZesK48EHq5mrdrP7L0spSZn/0oElfAria4xOPM5EGA59bnmQg6rhndTF9/IQ3m6BMroVig5FrSSrXLo1aV3fQoOd9VC89omZJ55ULxyWX7UWgOgiK+aja0M+iGdpJg/k6WsyHvpmMis507ugS9FLIU9Ew02xwFAV+gm4kX2r/fsoTXEPaefzJP+rzxBLxOiIvoe4g08qZoOZIVIo+XTwQ0Vslhbz4AAT4bBHCnOWwHXbfBDPCxURLLYP1WKbrts5qGr2wD1DKCxxltCUsJJLIll6XZBW/k8d3/LAKNSpw0Z60QtZsxp2CO6OoM4jURGe23xF/2wDScKPYBIHe1MTW5IhPevTHv4hqox13T0uc+NtuIsSsD/EiSSYm359ffMUOpkFnTx6yOXBGWE5+q0xTHdjCLeqedEBXDIhr7FwNWFbp3CExOkvCNnx7bx23lb302NwDm4B9KNn7CvITIUzrksziJIWJbiJB705vNj+qtiLHfCUwhPCORLGczJMhrx8Me6EpQIdolmiU53HUHYAT9svTXN4M0Uyte3ux34+Yraxh6rDFJuuO2hA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR0402MB3348.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(54906003)(44832011)(316002)(107886003)(6916009)(6666004)(1076003)(86362001)(36756003)(52116002)(186003)(66946007)(38350700002)(66476007)(8936002)(66556008)(508600001)(26005)(8676002)(6512007)(38100700002)(956004)(83380400001)(2616005)(2906002)(6486002)(4326008)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JQTsI1O01+NJSuawQQjKh164IG4z4Aq91YwKY4q+ciXbPnKKssGg0jkLRUYh?=
 =?us-ascii?Q?Ayf8P+SskrN0B0IPEKSXCEABThlk4ee3Q5W4Z8bvgU1V9mrLXj3R6OV0bKmg?=
 =?us-ascii?Q?Gk6qaR1ux3+zL8IxrQcnydiT12+p92xtfzIeEq4+kz8DPl6pm/2UtHi2c7fu?=
 =?us-ascii?Q?DJbRnPM0DpYLfLXufTBOPwc5Rfge3OB817i4JETzTV3fLbjfwRvTgVAQWMm3?=
 =?us-ascii?Q?ExOnkJFSZM9IV1z+oI2j+g/REmcqXlTuBVif8RSDZuVeA1Oa5jhDAX5FDfs4?=
 =?us-ascii?Q?NbpybUBO/BRfeGPPTpVYy8NvYRancdjcK23eRYv3fiWA3Q8Lm6DGVrgXle7t?=
 =?us-ascii?Q?H/ZFH7DACB/WVJBm3WYQ+SnmQvQDiCR3Qpde14XxSFxdj+bcHTAAAdVfJS5Q?=
 =?us-ascii?Q?kK1h6OhnxNiQlQazmkBsrxe7VduCREM1f/KAQVfmsyL9eUzQZQ2VvO2n7aZc?=
 =?us-ascii?Q?V1X2ut+XXuJuB5Q5tRa9+1DLYk0LPZXaangPnn7t0+jrQcbo553/u7L6Z1wl?=
 =?us-ascii?Q?EinBSmXdJhrjwxW98tQCQweHS7EQq9FURziHY/pXbh+3YunxVldH0N1IWc2J?=
 =?us-ascii?Q?bJX/BjE84sD4qhYg3UxNDJU/lk92Dte1bhZrW0WE6qDkE26r3shwTex27k+r?=
 =?us-ascii?Q?7xMt8/Fc/QTXuCa4Q8JwClzd9rXvYTKxmcfTsRw7Bq5/rvJQG+IkNPsPg84T?=
 =?us-ascii?Q?tdxWMHjDYUnVuCHCAVPTIr4rmTsMxTYR6n1zwQMDUTI7dDFbZ6Hhq42escdx?=
 =?us-ascii?Q?E+Mb3mxjFRArvisMIp4rf1LHaHzExRiloVhFkcJ2nuppT5o4vgnULDdO8dEc?=
 =?us-ascii?Q?wGHbmWSXMjyBv/R4TVCpLN3/BVjZKo0YX3QXbbsg1glChajgbOEGDqtkGX4Q?=
 =?us-ascii?Q?qay+VMI5Cfvth8tbPew8GFWNvEdALoOLh70LpGGLyMSlS/BwI+L00DP6Ilea?=
 =?us-ascii?Q?NH456q2yj/UO/D4a7blrfkYGvEjvjCqHoQJhz+jkmElj/2A4QeOlxKfc51bT?=
 =?us-ascii?Q?HUREs70ngVCmHYL0DAV5xk8yWVd0a8m/B31EEZ2cIXfNMY7bxDAh0nf/9IZt?=
 =?us-ascii?Q?4S5KJXhXSR8LCLJMT85S9uodwCp0K5GPIiPa7BF9ujJZJ5XGUWP74dTFYbEH?=
 =?us-ascii?Q?ij4jvCU0btp9yM8tO5iimR54dtNhi7Us0svCZ9iBiUDjmCsnOlG/oaD/NujQ?=
 =?us-ascii?Q?NF6YUGsTYbMMkWenCvQohyh+EF/D65iYnXR8kVD7336/7PSvjiXby0FYg4dD?=
 =?us-ascii?Q?eOJxiqgoc73V0k0jdNTf7GWxgJ6pCSfFPZz29OooFauhBhMi8gPUlBw02SKH?=
 =?us-ascii?Q?gVFkl/GUHQ8RiFtxEIuPpRYR?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0256cbd3-f119-43a6-309d-08d97f77ca4a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 16:24:32.2150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0YM/zQ/gWUJUs4UBV9/6E68rvJP/ITw1TIVGUQfgzxlSKR0QKBN+tovnPRf519gHX9BKaUwGhyUA6EA60H2V62nmOtIlsVSl75wY78Ql8ToVl5YW+4WKRvCMnPKEvce
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5618
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: point LICENSE_FILES
 to correct file
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Since v2.2 release (commits 8cc36aec912 "doc: De-duplicate readme and
license files" and 9f1622b018ab "doc: Move content out of readme and
create new index page "), the license.rst file at the root of the git
repo is only telling to look at docs/license.rst file.

Let's point the ARM_TRUSTED_FIRMWARE_LICENSE_FILES to the correct file
and modify the .hash file accordingly.

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
 boot/arm-trusted-firmware/arm-trusted-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
index 1ab50a9e28..80402ec374 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  d12a824afcc5cb90d005f9820f3274f1319cef1bb282e40a6a190b75900206d3  arm-trusted-firmware-v2.5.tar.gz
-sha256  487795b8023df866259fa159bab94706b747fb0d623b7913f1c4955c0ab5f164  license.rst
+sha256  0171b0795501ee90634fbc4a7835e2fb215d9423daf1cf5b0d0682adde12c597  docs/license.rst
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 9d44a5df06..001121477a 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -21,7 +21,7 @@ ARM_TRUSTED_FIRMWARE_SITE = $(call github,ARM-software,arm-trusted-firmware,$(AR
 # This is valid only for the official v1.4.
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION),y)
 ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
-ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.rst
+ARM_TRUSTED_FIRMWARE_LICENSE_FILES = docs/license.rst
 endif
 endif
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
