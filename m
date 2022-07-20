Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D216BC43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 17:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B8CC8244D;
	Wed, 20 Jul 2022 17:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B8CC8244D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k_pr7Z-3BO-Y; Wed, 20 Jul 2022 17:11:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 512FA82422;
	Wed, 20 Jul 2022 17:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 512FA82422
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58BB61BF47A
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 17:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FC4C4182C
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 17:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FC4C4182C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7wwU4QeTTiGX for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 17:11:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 263FD4186C
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2109.outbound.protection.outlook.com [40.107.94.109])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 263FD4186C
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 17:11:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmnmUSpZAohJyeT9I0UoVck4IYpoAJN0VNFvS0oJE0HtOKwIgigjaoboJjP9GFpRd2L/48rieqDkBHgho+F5lotgS/HJy3NT7iLqBEOxVUsKyE6MF8Is80kG8TzSjlluKwu/4v7N/ZrWmNdIU9JlDa+PfFSZNzhhovr0QOLpeNUaGRi3Y7w9dvCzG01jZETWfStBBcsBi+oOb+cjYrM6trNnFxlNtJ//DgDfi3WZCrDeNaNTx92hO7HQThPkU3jcePzRDX2jAebH3eYQrwCHRB+uwRVu9P44PT6G0/ITwZu1/aXTp6549S+dse8cAxFl7rESeAGd0lPX5VZ7u7tyiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wfv2TX4SCNLrFzS1+mOd7Z0AyVUNqyVCjngVKDwEsEc=;
 b=D09ZEs0W+D9y5U6m+PlfYcL2uf+x6z3oVLpLUu2M6bnkFk0t4EHA1zCB4n/tJAKBkPovwwHNmZ4oRceuy/qtyCgeHb/8Nlp6Hm+vIJP/fd5G6jSThxtf7gGTkjSI5CepRyzeb+1ocDfxWZnrAuZNCnsZ/VAL3GY8uMzWAKjeyVAod1QudLFqJett+UcxqnHTiidvXJn0/3E35URO+iXXlMsBMG55mAseHi9AudnxyLTmi3F/e3kK/uof6NogKdu3mcmplCeHyNnuwd9Qd0dXqzK24RgWiy39LmC/yXryf9CehfyUYHYoatCwrgD4sCdjlyY/IGc497qFPCVnVeZ0/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by SN6PR10MB3456.namprd10.prod.outlook.com
 (2603:10b6:805:d0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Wed, 20 Jul
 2022 17:11:38 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::7451:2903:45de:3912]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::7451:2903:45de:3912%7]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 17:11:37 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 10:11:25 -0700
Message-Id: <20220720171125.2914642-1-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: BYAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::23) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a893002d-d036-4d27-ea93-08da6a72e7e2
X-MS-TrafficTypeDiagnostic: SN6PR10MB3456:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Xg3DmLq47K+cy2ZixE5j7fxw4i3Zz/TaxLckfFNwAEwyAfkfNLgQQDZfwcUGstQa8lLVrbc/LTkOGRv3TF39wXUgAK3uawWobrB5mCoqhC3eOVAslaX70Hv4quK+71Mo5kzCfIiuICJXrlgS+FmgmBf8tPSo4j8xh7a+a23iqY/ps2wv4bqx8Xhpb7gIodAsnOrF1ZF4bCKlBhG528g8SOy0ZOf0WPw/+mQFgT6GoBNZbLVPuhJBsvOE9VK+NdymdGsfhLbR6fBxq2ICN0kl7NAAMPh3K1uDS0cplObaxbUBWq+sJdZW4h7T022FqSygWgvJO0DWhU0v1j6kraUpQb/AXFbbvHNGqB1NSjPtZ05UDUNOkJs5NiQmQj4DkKL9O7ulAP8YTA04pxSVqKrvTtyJUgaVD0JoHvogczkJCeCw1dYpxcuFhi8DfHiIuyEnJgdsNqa5jUrtQIqBJAdxGJNpln4ev+TVNySCfR5d5jR9eXr+TIWjsE4uSas3oCmw2reIi5Q8Vt6tcMRgWVZWRlTzC4iH2S+5TBJipPuoqvFbvmdP/ovZXosmFmXXGzYpKoRWlhrj30/XPNA2/AMNFjjIDVxVRjppIN++UzVtok5VND/w5QeB5LlobS6Rmo3HTs3Q0HRIacJdRLK9X641pv5RI+ED8jIfBawZ8pyN4vp1JYov0gOvQGE8y6WZ5FDjNmXD6I2LWMlDfBXE7oBA6Mz0JJfcYXxis1+ui0mnGqpe8ChGpI0jJctqFr9Jeg2ySZEO1d8M5Ix30nZNx9nultbBbXv0Ji0eTFKstZde9s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2351.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(136003)(366004)(396003)(39830400003)(346002)(2906002)(66556008)(83380400001)(6486002)(478600001)(38100700002)(38350700002)(41300700001)(6506007)(316002)(6916009)(6666004)(6512007)(1076003)(2616005)(4326008)(8936002)(66476007)(44832011)(186003)(52116002)(66946007)(86362001)(5660300002)(36756003)(26005)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ETfTR39tM4gF8VzYCjV4KD7gMPOAAzQwHt8LANzwCkLloU6J7YEcK2eoKb5+?=
 =?us-ascii?Q?7F3fn8T97/9U6sWoJBOmchCmYTWPjCcFGmD9VIo1eKKsiSx3UQ2hM2pvnXNA?=
 =?us-ascii?Q?dHG7BGvAtU20em4rZizLswqd4HMcKfl0EWuqkBia6hBHEBMyRvMDzPAK29n9?=
 =?us-ascii?Q?zt1rU0zL9EMG5aMXs2AtJNFUqJ0CUosj2sGlnClWYUNoUWgzE9Wj2RFiLaxk?=
 =?us-ascii?Q?fsTYYY53xctcypftaY04pz+xnQ0bOZgCtBg3rJ1GvmfkhGX3L2DmKxDoSlI/?=
 =?us-ascii?Q?HFotG+kv7ks0tpQkB/JDHAAgS8lhZ7mMajPlTn9kei3hXG/9VKX8xDBEMArj?=
 =?us-ascii?Q?7pxZvOcedw6P5hWJVvsHCMnRx65Jj/M/fTsRg6T3d/OImrUq0yUQBPRBS5DO?=
 =?us-ascii?Q?Lp785n+pU9bzaB7aYr+ulEI+8jgJcmiS/bUdVYly1YKpKfbRyV0JW2+IJrxf?=
 =?us-ascii?Q?k8hioMYHQ/tSukv94zA2dko4oNkY5eVGvzxowCwi9/EuH1zVoKeB9EcZM36N?=
 =?us-ascii?Q?FkSCk/ZUMmUtTlEkZLWHpyaQcysxByJfqnaD7SLkNCnQ2ZskAuMWVZdSHYYv?=
 =?us-ascii?Q?vcu2tP9tll45lIaZDue+L6CGWNfDI+38N2lq1LcV6l32AIqIi14gsH8qJ6P7?=
 =?us-ascii?Q?vIOUZrerAEy/E2TN7lqmd50T05+pjnOWu/EGoQYVMyL941rYQsDpn9cw7/wz?=
 =?us-ascii?Q?Bm90xK4aiLOYW+woN0BprTTWZfxEL+ymK0wE5g1TPbJL+vJPyGV2S9d0skew?=
 =?us-ascii?Q?st6xqEI2S/Oqd34h8RlPkiM6EmO3/6gUXNHimEkrqxjj8N3ml5iM84fbz9XT?=
 =?us-ascii?Q?zWwr4DAoEkdaJLcc1c/KfXel37S42Pp7hHx4y50fxDracNrCib9mX+xwQeT9?=
 =?us-ascii?Q?aK+fy5YUQYbZ4uL7nqdj2nF/M6elcJFN3jV3Y+IbVcFhCOymzDVh5mWYcUlY?=
 =?us-ascii?Q?dcAPrQ629Dw4x3dFgay6nuesQnUam1s90Y2ZdbhZaxYIAtdAFPi496BR+uKr?=
 =?us-ascii?Q?sdOVYP5vqneq64/aNBckj/jzXBKEpBouMTz2eSlB+M2gEUI69q7qkJ1brXHD?=
 =?us-ascii?Q?7PaKWFdKPwbAAb13m9zHN6HsBblWQRHf8vHuWQym+oGaxlNFO8sZ6Bdjk6ig?=
 =?us-ascii?Q?iltSd4VI5i4MQcXb26zjWKWXi1FH1sa6tNz4AViDx2uSHBf6rYITxRG6FEpu?=
 =?us-ascii?Q?7GDe4zUIAcPsrpPqp22VR+0VrSc1VC7O7iG0/USUi44zRqy/p/MST5W0Dwfd?=
 =?us-ascii?Q?5kWX06X7vr8EBQPQ4bO7rnUzz9SfnBR/4kN41v90nsHnaCTX3NaEbupsSfXW?=
 =?us-ascii?Q?o59RchEjlW/XcQAbjSkdnJUkN487EXO1VunOt9Cj55ZTGUPPCCvXj7udFdeN?=
 =?us-ascii?Q?lnOiYhPDpsE43Wyrq24b3ZVX6ZloIqxR1w+q3J1X4tv3vkWb7ff8fyBQTc69?=
 =?us-ascii?Q?QR7iFSfv0SCdDro6H2lKlOwS/BWrV6M8W/ZlIj2JvpiCLFfnD/jiSlIoYUHg?=
 =?us-ascii?Q?4oNnPIdpEZ+Ku89VAQr+Xo/Y4WZ7Alf5SkGmm08HNxxNRVFL4+qZaAz6cF1N?=
 =?us-ascii?Q?rYQLmNqGRyVSMKjk7ZSAbsdtPSnXHqp7CBVYkzEnrpYvJqifommCRUCLVlhF?=
 =?us-ascii?Q?ow=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a893002d-d036-4d27-ea93-08da6a72e7e2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 17:11:37.7289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTpy4w+R/WwVsYKRpYUL1Y+XqjLnm5FOaGuQU2Wu4Vrd/37uRwQtQKaO9uZyZxZbgN+4eOri2IPnJMq0aQQPjE/EBANwivcKtckDdxao8SM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB3456
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wfv2TX4SCNLrFzS1+mOd7Z0AyVUNqyVCjngVKDwEsEc=;
 b=H33C/SAn6erKt0B1IexRi9Q71EEDh3v0YztEJECs+5tADP6lOI4Po/8i+1/G91caE/rR/fwTqqtXsBAgM8U1yFWVTm6NTI6ZRzhxBjYO2r+bd8vJHcl9lrrCiE6o4OGXQmwGYEPI7sGnAZKpGlyRY1RDmYUj7LQo63zWL5AQk1g=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=H33C/SAn
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: [Buildroot] [PATCH v1] package/mstpd: fix mstpd bridge-stp use of
 pidof
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Through mstpd version 0.1.0, the bridge-stp script uses the '-c'
option to the pidof command. Busybox does not support this option, so
mstpd does not work.

This has been fixed in the main development branch of mstpd, but it is
unclear when the next release will be. In the meantime, apply the fix
here so that mstpd will be useable until the next version release.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 ...pport-different-versions-of-pidof-13.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/mstpd/0001-bridge-stp.in-support-different-versions-of-pidof-13.patch

diff --git a/package/mstpd/0001-bridge-stp.in-support-different-versions-of-pidof-13.patch b/package/mstpd/0001-bridge-stp.in-support-different-versions-of-pidof-13.patch
new file mode 100644
index 0000000000..daa591131b
--- /dev/null
+++ b/package/mstpd/0001-bridge-stp.in-support-different-versions-of-pidof-13.patch
@@ -0,0 +1,48 @@
+From 181c453fc1a00573e19f14960dcc54ad84beea7c Mon Sep 17 00:00:00 2001
+From: colin-foster-in-advantage <colin.foster@in-advantage.com>
+Date: Tue, 12 Jul 2022 23:01:09 -0700
+Subject: [PATCH] bridge-stp.in: support different versions of pidof (#137)
+
+* bridge-stp.in: support different versions of pidof
+
+Busybox uses a version of pdiof that doesn't support the -c option. As
+such, this renders mstpd non-functional on any Busybox system.
+
+Just use the standard form of pidof to detect any running instances of mstpd.
+
+Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
+---
+ bridge-stp.in | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/bridge-stp.in b/bridge-stp.in
+index 47cbe79..3807873 100755
+--- a/bridge-stp.in
++++ b/bridge-stp.in
+@@ -139,7 +139,7 @@ case "$action" in
+         fi
+ 
+         # Start mstpd if necessary.
+-        if ! pidof -c -s mstpd >/dev/null; then
++        if ! pidof -s mstpd >/dev/null; then
+             if [ "$MANAGE_MSTPD" != 'y' ]; then
+                 errmsg 'mstpd is not running'
+                 exit 3
+@@ -212,12 +212,12 @@ case "$action" in
+         done
+ 
+         # Kill mstpd, since no bridges are currently using it.
+-        kill $(pidof -c mstpd)
++        kill $(pidof mstpd)
+         ;;
+     restart|restart_config)
+         if [ "$action" = 'restart' ]; then
+             # Kill mstpd.
+-            pids="$(pidof -c mstpd)" ; Err=$?
++            pids="$(pidof mstpd)" ; Err=$?
+             if [ $Err -eq 0 ]; then
+                 echo 'Stopping mstpd ...'
+                 kill $pids
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
