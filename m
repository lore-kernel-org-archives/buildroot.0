Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE934C4332F
	for <buildroot@archiver.kernel.org>; Thu, 17 Nov 2022 14:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C12661062;
	Thu, 17 Nov 2022 14:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C12661062
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VvZbcf3XMawl; Thu, 17 Nov 2022 14:42:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A13B6105D;
	Thu, 17 Nov 2022 14:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A13B6105D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C49021BF3EC
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 14:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 972244176E
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 14:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 972244176E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zWW5BxTMh7o9 for <buildroot@lists.busybox.net>;
 Thu, 17 Nov 2022 14:42:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBE6A4176B
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBE6A4176B
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 14:42:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYRwSHkhhKunsNLf6BTUp5g4M6I/upJQlxXgz6k0ArsKZuKP3HuqCvnDEyFB3NGu3GnrMb45Y8XJP0YiH41Mpe4qDbcYHscAr+fJNT9HyNTDPyFUltPpCtolX9DAiJvke1WC/C40DEgPKg6bURLQiZtIJIyE/LylLt6gWwfnMi4aKCxu7Db7T5+ch52SdtzNGskAsasWGGffXUu2OtZDfB1r+7TcD3rabAIZMMhK0K1YE+faMd4uZIWZ9F7P/vgPtYGkmCXq1Dn0SYvQqodEqkubN+A5vn243dPye9MswZyV3YmMpQAH5U3Q0B12KOQ0Ycgm0kwSjEQKdTz1QpC0nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFjq1ZXABn3qK0fAlfR1OOijnBQnOYzaB3Z+JqfdY7Y=;
 b=iWAkq90SXiI2mmQ4gT0TH189Em5py6toiK+IqDI8qC80wOWUDYi4dcyZeq6SreIX6d+OZMjJDElOGRekk/wX+Gt3R9h3pDiODD1vd9FR8KlUSbfviIC3z+hfw3/+E9A8my0jZgr2fLFy1/zWYnkeCJrHyDcdqxyroC5N3Cjob7kkkudq2qhDdTfC2cQeQ0eKa9aqrgN7b7ooUCpXxTnZprDJRksXzcGWzb14S5KDZ0sGrhVvlV14rdmj66WXWCqUGPnmP/ojO/Iag6alGQLlQZxpHPKTIctHCpIHyv53zNF3Itcbp2KejPJ6347Zm2cxlIQAwrbrPjxgrDe3wadk6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from DB7PR04MB4106.eurprd04.prod.outlook.com (2603:10a6:5:19::13) by
 DBAPR04MB7463.eurprd04.prod.outlook.com (2603:10a6:10:1ad::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.15; Thu, 17 Nov 2022 14:42:20 +0000
Received: from DB7PR04MB4106.eurprd04.prod.outlook.com
 ([fe80::9430:eba6:1e87:ad87]) by DB7PR04MB4106.eurprd04.prod.outlook.com
 ([fe80::9430:eba6:1e87:ad87%7]) with mapi id 15.20.5813.018; Thu, 17 Nov 2022
 14:42:20 +0000
To: buildroot@buildroot.org
Date: Thu, 17 Nov 2022 15:41:36 +0100
Message-Id: <20221117144136.688703-1-martin.elshuber@theobroma-systems.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: FR2P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::6) To DB7PR04MB4106.eurprd04.prod.outlook.com
 (2603:10a6:5:19::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4106:EE_|DBAPR04MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: 40fe00f5-9f64-4072-cb19-08dac8a9ee3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O9rUnVtO8Zhy7PZOqzi1XiHaYhV9yXDaMZDe/OJmYpJrVusyMIDrA9dfYTiK7ZYwT7Z4a0onJgf+2hq2GQEtDXyZQJBhuIM4UX16s3ntBB0xRbVCTP4vbo/3NkPYnoZOHD7G/nEh4zjrbh8cl7xmEK8eTbd/Hi5w7IZnsPOfblVuX69QNhlRr1Ocfeo693fqtWaZIicEwXnenOJGZPTgWOMU5xI05B9dAXE20UIjk5VkziqjSOzuXmHA7rrIQHYSZ38z3DiXoVmSU6/kTZjx8QcUFX5mQck0wA/LMShYzZXscKCvN3Ouf7CPFwxRPPmFIJaMeXCIwuYRjOvD/WC+f6mnMCWR0Zfg3UzPWabtp3PG43+vQFkrfLCtSEu0I86tWTaOGcTxcd74Q10Kh30tsB1pZI3c4sF1AZ5tcrex9tv9+DH3Tveav0GAj1/DcsbrpK/t9h6rVis/OgBGXckowo8VwAIdgFWPJIuRQinZSmoYFUJIZuy03F1TwohMYwFfKaHh0vhoi5iSQRcuuLa8rH32TH6QV3RnHam8MbtpZkaf8JFFkpTR86g05v0eFwYAB3TFGY3n8yBO02/SqxvmvwUtrEvJcupzD2JY351QtWqAG5LZvfcJhqquxOSlv1NDlko8lpg94WdNcjYHIjk1YV2UIk3mWyDt634nC/TT5AHXhZg0ScjBMyuIyXZJR/xGQ0IdyVbJFSTTSyd4vuLXCyLuc2GbMxv/9ro9Z3jv460=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB4106.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39840400004)(346002)(136003)(366004)(376002)(451199015)(2616005)(186003)(1076003)(66946007)(66476007)(8936002)(6506007)(44832011)(36756003)(107886003)(52116002)(66556008)(6916009)(316002)(86362001)(6666004)(4326008)(8676002)(26005)(478600001)(6486002)(54906003)(5660300002)(41300700001)(6512007)(38350700002)(38100700002)(83380400001)(2906002)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3gdlMVMLCWrTe4QekMaO1+/x7bVNBRFjlRPBJsWAIUTVKLnTH+oeuW/M+jRA?=
 =?us-ascii?Q?T58QMfSPl8KBl2Bbb7s4LTYx3+YP00x8/EtGK+7SaH2VZNGLWeT7kJTGzBue?=
 =?us-ascii?Q?dsH1Dy6aV8A+rxdIA+Ren3eyJ3+mY7nyeQfxTRChEPbYBQLfCqBfH8jscc6r?=
 =?us-ascii?Q?jC3RVynJI270pKTLVSKEQPWyjrYDzp2lWggWHMxHDQ0cTgaWx1zvtsjBEzy3?=
 =?us-ascii?Q?5+/QsRwgp3QW6wiuz2MnDh3Szm6QdQsZEhdUOe/UaKhz9PqrJE0fokhBFR/o?=
 =?us-ascii?Q?+aNjGBxYkDFunhcR1WBxkNgqOL3edyn7Egg8BppjsaKnCn3T/ZYJmtR7GtT2?=
 =?us-ascii?Q?vg1ByuS1qNOaCRa2PJtg0IVKMGWSReBw03ZwLRbFMXDhzMuDltv2HwOvx3zI?=
 =?us-ascii?Q?WILaBOWG74NVxbSUyNRy8NPNk1PvnEONWaY2Rw5PJ7ZCXoKs/CCtw+nZJ6VG?=
 =?us-ascii?Q?GEd8Qs56vuT9CK0B4UKUeE93ouG4pChVMRXk0lv+0P0F/nqsJG0GxzCl0bD0?=
 =?us-ascii?Q?qpy/C2PGlOGLymWydLJhbnu5A8hxGx2LpQ7kacanK0AWpfHbD3UVTu+9NJaZ?=
 =?us-ascii?Q?fclLiQJ1He+lnOlZVNMkSs/om4vABEXjIBEnG9O9W5bqa4YVkDZtjeEJDfFQ?=
 =?us-ascii?Q?jDejwouKz316UIrE5NhlmNLcSNTLvjih42ucHkWUP0RB0Vd8RH9p2GqAH8MY?=
 =?us-ascii?Q?ULqKgpU2+OQHo5veRlT70S4vKyRF2873HM7hmznIXOIeCfbjv3g6pYLRhknF?=
 =?us-ascii?Q?rPM52/jYwVdIzpgMJ5Uw3n3qa9XnABVFBgEUrBZ4f4qAyu/mDHVELr0LGLcN?=
 =?us-ascii?Q?cy3Qh1q4+tzIKpPJk0B+sfDDv5a4fkpsXoIxr22nu3+IKjuMAKRQxvM7UWIS?=
 =?us-ascii?Q?9cWETsirFiPrOa/AQhhBvwts8Ml6fJla4bKP0zQFwr66edIEHDkfZYvhN6Bl?=
 =?us-ascii?Q?uB1/vc3BRu7nIZuXr7POgsR4Q0wgAM3O0pBCAfrNM8wM+1EaAlOsJvEBdYRy?=
 =?us-ascii?Q?AXkuOmKv6aIGHzNEytasKkB/R274KolSIbNzjmEmxDuNTTfd5mEbCs4HIDvk?=
 =?us-ascii?Q?fJYzZdL+XSgO6ez8oURKQg8p3x1Zwjj0VrsvBIqSaE93ZnJjd0OCFPVrU0pL?=
 =?us-ascii?Q?2BKjZWw85JjpVipETBaQOq5zGql/UXrgUUSHxnkR+ymBNPcIyCSaeAU38ggd?=
 =?us-ascii?Q?eyBI9NwS9aytOW2JORyRXMKdtqc2EzhsYeQ8RWGm0ICIk9m3opENebjyuLD4?=
 =?us-ascii?Q?NmgMd3GEbAR1wv07teZlT8PKvHAnVXkp2vO97Tm4wKLslAgtTrnEuWC2xl8E?=
 =?us-ascii?Q?eyHHpvbSSOO6SBJ1h0o+Mf+MQwlh3jkKSo9BWrRj1vzf+AWYMchCuVlqbKpc?=
 =?us-ascii?Q?epaWhyflzp3t6tGY2a5FiiSFO52QqOisbFWzPNmex6INKfPZ7VhrGWOwP5aX?=
 =?us-ascii?Q?JVKlntUSRh5ZueWwK6s0Z66IthIW1GNCqBBbmK0KwFvSoncPVSHbc95q7ODZ?=
 =?us-ascii?Q?1SOIEKjX+eCBRPsjGBxH5Q9mBKdOngBuzuzVtU2s/BCZfTXPJND6Z/Sib6z8?=
 =?us-ascii?Q?rUgibJDJOd0J7OJWyJNeX4m8C2McSYJT82Zwb1MQJsT0JBbnzH5Jp76Okm/E?=
 =?us-ascii?Q?q+Q4lVH+0r8NivsINcPM8OE=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40fe00f5-9f64-4072-cb19-08dac8a9ee3d
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4106.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 14:42:19.9964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CzYMJ2Hetjm02QJLFlCUF67IJOf28++7aXH9PrBQkZIhmDHX5BOmf5yzgi98x1Y6sy4EOjG6Wf8llpfjp7hOPtvR/IQtBpp+fN4s3MknRtq0yi4u8i5d0OPKibx9O8kB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7463
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theobroma-systems.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFjq1ZXABn3qK0fAlfR1OOijnBQnOYzaB3Z+JqfdY7Y=;
 b=KxstVz7CXZZw12NBDbqiwH6FZ4nDeWIH+NP6iPUlcH0KU48hQ0VUFlKScAN5hrsUlA/zznyPu5Chkp1+1Kl9giODSSEpaq6YeRY5oQRO8Kd71stHCrN9D/fUz8Dt2WharoNkQvx++uSK1VRsZlenRfrzpyoD/dRqH5ILYLDiT4DXXLDgJJ5wtwba/KrSZ5UJHN9+34sPaFSL71l4bhPOJeIlTvz30jreVPeBDJjViSriXbv07aw/Qva0BXDt5CTaZe6p0SuUJ8mMJFbX0ZFE/7mp04YOY9eUpTIsL3nZgplF7Ja+raQhdFbFvKHDT2HZX2rxTGh+r0rMk8M8Z3Apxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=theobroma-systems.com header.i=@theobroma-systems.com
 header.a=rsa-sha256 header.s=selector1 header.b=KxstVz7C
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump to version 252
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
From: Martin Elshuber via buildroot <buildroot@buildroot.org>
Reply-To: Martin Elshuber <martin.elshuber@theobroma-systems.com>
Cc: Norbert Lange <nolange79@gmail.com>,
 Martin Elshuber <martin.elshuber@theobroma-systems.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove the patchfile since it is already contained in systemd v252 in
commit 608c3b0293cac3cbb037b2d15c0a0f1e247eb71e.

Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
---
 ...define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch | 33 -------------------
 package/systemd/systemd.hash                  |  2 +-
 package/systemd/systemd.mk                    |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch

diff --git a/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch b/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
deleted file mode 100644
index 0934886acb..0000000000
--- a/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 16c132a6a0389e0eaea70c4ad95dbfd1637ec5ba Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Fri, 7 Jan 2022 22:25:23 +0100
-Subject: [PATCH] missing-syscall: define MOVE_MOUNT_T_EMPTY_PATH if missing
-
-MOVE_MOUNT_T_EMPTY_PATH has been added to systemd 250 by [1]
-but it's defined in kernel headers since version 5.2.
-
-[1] c7bf079bbc19e3b409acc0c7acc3e14749211fe2
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- src/basic/missing_syscall.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
-index 8267b1a90c..793d111c55 100644
---- a/src/basic/missing_syscall.h
-+++ b/src/basic/missing_syscall.h
-@@ -569,6 +569,10 @@ static inline int missing_open_tree(
- #define MOVE_MOUNT_F_EMPTY_PATH 0x00000004 /* Empty from path permitted */
- #endif
- 
-+#ifndef MOVE_MOUNT_T_EMPTY_PATH
-+#define MOVE_MOUNT_T_EMPTY_PATH 0x00000040 /* Empty to path permitted */
-+#endif
-+
- static inline int missing_move_mount(
-                 int from_dfd,
-                 const char *from_pathname,
--- 
-2.31.1
-
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 3572b25965..d8163463ce 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  d2bda9d225da11dc9ff48b48e59fc36798d3e66902ed400a9f78fa370c596864  systemd-250.4.tar.gz
+sha256  c345253c293e89f4d8a3743fac2b9b81c972b0da3b7f709ae578b247510efe01  systemd-252.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b42f6a502b..d9448bac57 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 250.4
+SYSTEMD_VERSION = 252
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
