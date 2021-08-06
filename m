Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78600C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 14:39:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBE19611C5
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 14:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBE19611C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=theobroma-systems.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88ACB82CFD;
	Fri,  6 Aug 2021 14:39:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8KOSrt2NvpDx; Fri,  6 Aug 2021 14:39:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB46583005;
	Fri,  6 Aug 2021 14:39:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BAD871BF321
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 14:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA93060783
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 14:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v4iPmYeqhH4j for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 14:39:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0a::602])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41DF86066E
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 14:39:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLNqh3D2eXXf97Qg6WtujmGHv/dKjYUS2rTx09n05jP9ATQXWAEIBJWb5obnAB05hFzoQlMcFF6xQKWboG2kgBWRTMvHDjviNnOJ/3E+aqeMW990lKTw1O4TN4CBW+05vAqWSmyugxjm+9S1Ck1Dz4S0Ska6s+TdN+AEJESguD/AabJBAei1Loqro+hozKDexKwTFHhcGjN3ylfdkZVONdUU8CvBewFCc76t5WY0Ihs1zKnCTw1/eNqgPYnv/3SQxuXbAJAeQvpUrQ+9OOT7oJTF5iFZxxVJUu4mieTeOZqHDxyvlj63Zr496qHDXlWLNZbKdpAbaZNgyKX2WzGvCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gelaiMxyOxtIGnXBbJmSOQBgBuqzZnxocQ702c8zPs0=;
 b=UL4vFFA7FC5yfHz9Dv7o0HEKxfIoTGsfI46ejwo4DN9+w+6/0/1bBPhLODpBEwrzA7iqml3en4U+Y2yuECzsCLM6IPtyPq2qyk27WEtqk+BUciYQ1uv6FOEUftnZZ61SCNPAfA2CPg0qAoitZq4fGSblmMgNGwYs3VM9NpMC9dAGzQ4bBkIdUohQWsAPtVzjzFmmYcypw7DB1dPnEHFXrkgRNSXagn0+q9+a3PWGrfya78zFoe9ywcGAPT9xquztjhxUCTQCWdByD73+sj7FoC4WnrM5ZSb2rI9mgJDySddn7BfWuw8VrBX/b2xnqaFVKUw5UC/E2nXjynU4EdHYHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gelaiMxyOxtIGnXBbJmSOQBgBuqzZnxocQ702c8zPs0=;
 b=HFp62aoP98wyowOX0IL0OXkymgETznwZXV9PoZHRCZlP3kEpOuRb1PhXvYfCJqaDfY7pxWYlagaBIBOP4pIifjTDY2p17FHiMjfEWF/CgY9CzoNoc5gBmnHjdrJswn4RcmPh/4cElgH70mHErFRUe1W2jejxiLS453coQBdkWdc=
Authentication-Results: buildroot.org; dkim=none (message not signed)
 header.d=none;buildroot.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM8PR04MB7794.eurprd04.prod.outlook.com
 (2603:10a6:20b:247::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 14:39:40 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4394.016; Fri, 6 Aug 2021
 14:39:40 +0000
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: buildroot@buildroot.org
Date: Fri,  6 Aug 2021 16:38:39 +0200
Message-Id: <20210806143839.2905163-1-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: FR3P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::15) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (92.42.140.82) by
 FR3P281CA0068.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.4 via Frontend Transport; Fri, 6 Aug 2021 14:39:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca6aa8ab-f11b-48da-35d5-08d958e805f4
X-MS-TrafficTypeDiagnostic: AM8PR04MB7794:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8PR04MB7794E43BFEE96AB1F12A363EC2F39@AM8PR04MB7794.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rcrJxislyOqAlEy8P/Z2iFwxY+uN9fS+oAuPYkC7zsVzhOoF6vjp5V1tVMCUzcgbJ5FJ3qwQjBnGslZFJqfm13CxH7YA6BcIQrc37t+NlXuTjk+Fz/yzxJ/4DDyqALglD+KdhZ7jQKtrmMbxKHpcjVi+cZPKZGiBCWeMFNXsEWg958AnUOtLH/y+poTKhHFxjJw/wsIU2J4YG8E0Qwa8F1P9x2oqCbY1RhAnCmHndaTohun/AeC3VqKIkYBIzsr80z8NCMAOrvNlnTFKItGaHwdXdnAObdxMjoIyfSEnGPl0UU9nX5Zxz/yIn2eGpftDL9OVNB7eBtJy+TJQQgyIcAIVLOKQ667H/L2tdcDxMzg+OdyVYVkGvyavkVX5nlXveEpOiOmBcFPAyMFBJ5lAaV0PCXFgHMGc8D+2afIapzDdOogaIopey+DFcBrL2v09Yl3H3bABGJOcVw6iGf2vyq7+QAIhVBtrTgLr0Epz8EpPpk3/jouBMdg5SGcAXRwLA/DBoiDQHcLZtPdIdDNPPSefScS8u1rX4H9O77l/YuyiM/Lmi7wviFB8pyq1LF2iA/OA0a/5lQz8MOD91qf75VykyrAjA7CkZxUvA2SwTdRRwMFPJ1gCJ+g7G4b6RIR9avtVDbivXiXRJWmR90ljXzj2gTABqKBJDS3q3YwWscYuHF/1g+jtvsy8JGtXvGaDHeLPwzXXMkDnnnGjCZNfUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR0402MB3348.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39830400003)(396003)(376002)(346002)(366004)(136003)(8676002)(2616005)(6916009)(2906002)(956004)(5660300002)(86362001)(36756003)(44832011)(6486002)(316002)(54906003)(66476007)(66946007)(6512007)(1076003)(8936002)(26005)(186003)(6506007)(66556008)(4326008)(478600001)(52116002)(83380400001)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?41kFVyUsXtLQYH7l2MDB0nbGZMa0zgQ5rIHTZSLGH8UyKkRM7kVpA6Eecr+H?=
 =?us-ascii?Q?uTZLnNU4DdnR39IAdIb8cyVEnN60kNfqZbb00FQsmweho9Mwc4kf6VWltc3E?=
 =?us-ascii?Q?5U4Sf+59+iLMZ1sROw9B5XrDvrHvud3fNiCzWJD5iHgAQ2i2rk6oDBWU1aqA?=
 =?us-ascii?Q?CHsO1YkZnr1o6/aUkM/mSMPYJpSrqE5QGFtDm5RYNCT0DpN9u0J7Xb+dH+OM?=
 =?us-ascii?Q?tELnw4GxxW1LEqsJaWB0E0frkRE6p7w/3MW9BwKLeQeEYnNzqOZTvfKp45pj?=
 =?us-ascii?Q?n5swGARhBL7+3RKbyZnO8RXVZ2j5rAnRN1nTvA65vrT5QwV3R7BYo0V7cd5G?=
 =?us-ascii?Q?vE7mvIYpaelO7MA0AyRYP+0rfIhtg0amtg1cKXEIYudz+GwK8rofXcOeMgGy?=
 =?us-ascii?Q?bjFLRFlI7xaiLyurZz6f4lqLueYyZ3vdg4HxqczCdoCWK/gZi8oMUXJy2wG8?=
 =?us-ascii?Q?EB3AK0ugYzY2YrNSOQ5rwB9VDr+H8EpcYu0K5rm8T94mgTeRqBnQdxS2JR54?=
 =?us-ascii?Q?PflMjZn19UGPwsYffmmy8OJCmM5wucuLEczEOd4bkS2+9lK28s4jtw2YEVOq?=
 =?us-ascii?Q?ZK34U1vOuPoS8CBYQNPBdfn6nsiFzSxebV3dKMapDpHoPwpxm15LzWFxkZnp?=
 =?us-ascii?Q?X/UNjDdjwgj2vs6/jO4v3zkW6Na/2UGCMxie24ul+OblX2fyeVDr+l4ygYTk?=
 =?us-ascii?Q?aa+3b7yZE+Ku1DgcXkSwWFOKbUiS4wbNjcl5Eq/PY/c4BGFEls+QYtd4g8rP?=
 =?us-ascii?Q?LX+oEI8Ra2LBLMUJNC9qC/P9yzkyCjVfp13ebSkL849nxrNJaNOB0NX1Vyjx?=
 =?us-ascii?Q?6tNbMEUSdvV7ja06Ns6ag8p8L2JUQVC1EZC29wSYdpMCckbEhGrz9R3X8cst?=
 =?us-ascii?Q?FUpx86fxLwX72fUCdvRo9r66kKBzqXnvLnjuFy/18SnRhrOpg8NavJeomiFt?=
 =?us-ascii?Q?Qqq1K9zRKo9ZuL1AiCEC3OkSwGa/VWWpqV25nu3nHMHDyAAEbciNVq+ZIFLB?=
 =?us-ascii?Q?c1+ozBXoViV+1nDZ1CHTAroZvuY2T4wFq7xsZ6DjMwOQNLXxbKfzBZM4eFfj?=
 =?us-ascii?Q?4a6GKMRBQ/8WjBYGujYpxpQ0E+8xo03xhjqI3bZ5Ydkkd6S0ZoXfoBYtGGaY?=
 =?us-ascii?Q?SNsaU9eolfdQ/mivW8AF0qUa2j14XrxTXSR9Y21ldCKnZaFZGkMcXOdxf3WC?=
 =?us-ascii?Q?Awk8w8yckDsDLJ8KB/iDyaBRAeku720t/s+HqPf9HxMubpEeHzMhvQrf17vp?=
 =?us-ascii?Q?CZtg9FNVeNzGIVh1telowQc7EhZbnRgrk2otEou7MbIWuqOgPUXuelN2RPBm?=
 =?us-ascii?Q?pTrlIL7ss02LzKcwZ9UZlyj4?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6aa8ab-f11b-48da-35d5-08d958e805f4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 14:39:40.6026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGeU5Y4sv0Dbs4MuZKuuAGudd/+NAfmjxgts73Bchy7d5SqIRSwaxao0YMM2Hu4wR0qYwyH1yVUGhyc70h4IcuUMYfk6Y+H5wcDwFslDd4/JeuzQMU+xkgI7LcnNF4Vj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7794
Subject: [Buildroot] [PATCH] package/qt5/qt5base: do not link against host
 libatomic when building host tools within qt5* target packages
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Peter Seiderer <ps.report@gmx.net>, Quentin Schulz <foss@0leil.net>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

qt5declarative builds qmltyperegistrar for the host as part of its build
process.
When building qt target packages (which is the case for qt5declarative),
-spec devices/linux-buildroot-g++ is passed to qmake in QT5_QMAKE
variable and this spec currently has -latomic in its LIBS.

This -latomic makes it to the build of the host build of
qmltyperegistrar which is not useful.

This was discovered on Fedora 34 where libatomic is not pulled with gcc
package, therefore was missing on the host machine.

This makes sure that -latomic is not added for host build of qt
packages.

Fixes: 7d286be4f9 ("package/qt5base: link with -latomic when needed")

Cc: Quentin Schulz <foss@0leil.net>
Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 package/qt5/qt5base/qt5base.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 8b55aa3098..9da3de468a 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -277,7 +277,7 @@ QT5BASE_ARCH_CONFIG_FILE = $(@D)/mkspecs/devices/linux-buildroot-g++/arch.conf
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 # Qt 5.8 needs atomics, which on various architectures are in -latomic
 define QT5BASE_CONFIGURE_ARCH_CONFIG
-	printf 'LIBS += -latomic\n' >$(QT5BASE_ARCH_CONFIG_FILE)
+	printf '!host_build { \n LIBS += -latomic\n }' >$(QT5BASE_ARCH_CONFIG_FILE)
 endef
 endif
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
