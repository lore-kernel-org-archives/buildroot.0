Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19553C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8681417D0;
	Sun,  7 May 2023 21:36:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8681417D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VErgyVcQ4I9x; Sun,  7 May 2023 21:36:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E914141793;
	Sun,  7 May 2023 21:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E914141793
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67A0B1BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40D88821AE
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40D88821AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id agWnyCzSSi7n for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:35:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A24FB821AB
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn20823.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::823])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A24FB821AB
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:35:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jShab2nCZWYTf2gzY7qUC9fZYuu4vCYk+UTueoWl/5BLlHq+KVnafD2z/ZqInqsnF4ppez8y+sIYZXyV0hcv8+lIWnknm5woLh3xg67YdsZOSaAaJ+QwtFXkCiaDoazAeIphHPS/a1MIopzscLc6eRSSJOap7ORlWYaBGnSePszrbncyKo/HENPHoZEOi0GBGekmXpR6tyWGtYwgWoV+OAWlBy0ZbT9BIR10NiUgpjEphiGncY6vvLUNHK0Fg8AK/gQdKWEeNG+2JOI5euaWIAB1kR/tj52ZGuT3n4uAXSV4ci3WiERZcQPvg80Tyqd/lsfe92iAheTE0VVPwecaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAqV9ey+o2o1XoHiRoEuy1Tf1pzW85M3u9DVUqE6Bkg=;
 b=P0GUyjj350EaqvQPe5KLkpOLoiZxkmIBQfXI4N+hb8vqGUGe6xuDIkLSSvGem1thNTBI7ZaIi0GuVmJ4PB8CjcNlmF/tVjSUsTXgkxatgKQPnO57W33PUOm01VlT2XMzhNQ33atXHOSmKAcEZJyHjbXluuiyJuvhIkk8zoTkRIAUxDXRTakIInINa7/g0eUja92EImVzP0BRGOPdmD0oOso5dsOK+1s/j6TjfJWVvbdrnIPAZ5sfreSvABFiqSXnACSSltb4EbdH4xUkiAFePkIlE1S0drBSwfDS93c0Vn1DNHfGnOCUV8ErgGqRd7gVeQ9gH8R+UUNTpk8W9RShCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by PH0P221MB0831.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Sun, 7 May
 2023 21:35:10 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6363.029; Sun, 7 May 2023
 21:35:10 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 17:34:33 -0400
Message-ID: <SN4P221MB06828BC39A3D143DD800B153A0709@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
In-Reply-To: <20230507213433.4128-1-james.d.knight@live.com>
References: <20230507213433.4128-1-james.d.knight@live.com>
X-TMN: [VY0qdIy0aqws0ZFc1YYA4nS3fM17iuyW]
X-ClientProxiedBy: YQBPR01CA0156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::20) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230507213433.4128-5-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|PH0P221MB0831:EE_
X-MS-Office365-Filtering-Correlation-Id: dd525fc0-fd84-401d-7ff9-08db4f42eed2
X-MS-Exchange-SLBlob-MailProps: 70qbaZjg4mviZtaP/Vfoqw4HKTEYM7id732a6ht0I/T7+dvWGM/+gSLGLKQvFm5XF6f8MGWs5Q8k11gx4u8bWOY0x8rgLut78WG9p+DrAzd5VUivRGxoVLo0oXank18eA5RsQQ3XLav7SJJ2ytshbqrv0i73ZHEKjuVCbmUWbux7Patimnl+IJecF4HQJhrjUE5QtnEw7w8V9j3Bt4/t9HfB+3Ktz2VUJL4PamSOSB7kmM4tzYOXacnCSyemtjDdZssOI8WJTp2SXxNMyGYOxVDDiTJnDKEYtyxoYvrNU71nyMIM40r63k2Qv9AdnP4dqky/1tVKnWjwbWrY3ENkzFOkisKnhfoQxQiUaGSKmGfE8jTe5BxV9cGctWsy5BZxf/DX/ANKeELAryfoRhS+PqvYWeT7o4fKN0Bxq6Uo2VcXVFOfe6W7pYNdWLJFKnl4wbZDsiLo6W7EhjQuKJbfxwJ8dgrVrSDadg1ogX0DFy8mNPoqiqxQ/2Gxt6xrqozMkij/c1CZhhm5G2wPby7SGuHeMZf6WQAx91E9J2zaUXQDn+OACnOaYe4o0Q3dWUKvmNtn5S3ReVcGCg8J63usJVHErCIS5GM/y/l4VCWSmYLgU85oHGDi5sWJmgqSsZt8QxgR/R56CNMAMlU4MeYZwBZlU6WemYXvhQ7k/HlvaWN4MGREMoCGlVKw1C1N+qaM57peZ9MdkMYoUdzB3QxRCDrlcsVIIKwvk4U3PjvnQ84smwOTBv2GvA==
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2hXc3FEjq2pX8EPV7JImgodi5Ela9n36ZekNlPvruVmHQv5HoAHHyw6+SpfrXtNgRNAR8KFMcpiO9CQBIDPVTAYxKZ8kaptu5jYwrc0fUm82TRkpZr7HOid5/XwLt7j2nvK0UYqw52kw0DVghJTPHl8qGIhoLMg4chXi5vUFjk/k+nWYITSh1s9I9/pVlUnlxQZQsAcm00zf8kaaIOO3S+YBgLAlYCuoEBXKPBw7Osnlr6jA2+X9lD2sXRfdTjTfDnmSr3CIHn4Akcq1Ok5F4CkFpnFhGapWGrD37jW70JOAnIbnpEj4ofPDy6nRw1EIVyMtM8w5yf0d2EBHSztmzHBIA+OKETM2kGf3YvvfRLK2SV/nA8LdBKGBDZ9ulPn/+5KaqMgkNHAckB6w8npVu7corf+jZ58dg26Vie//kA4oogePBmpO6TVQYRltx1A1HhpsOCHjLLsAq0UFWM+ippyphoV3gSFmocjsJHHYwD3jlzhl3Fb+zcZerS0zacEx1ECpNm0rEHJlQxSzt8Snu/p4IiMQfwLIpCYVJvb42rQFCcfCGKpkHC9XwYOwraAdP1gdKuaEhXtcBgyqbjpZLwtRZUFzL0kT1G8WKi7LVMmQFTeMPKAhXmyPflK+sqjQ
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kZ9AhJgCdTHaqsfpXp+B4DH/cfNvi/TJ+ZPZwZK7o88a9ROHkFCrh2wKfGUK?=
 =?us-ascii?Q?jy3tnPwgfATCADcvOZmGaG12ZAtK/ShY35ZKtKVLZ1h1kQa1SaS2HtHIyujP?=
 =?us-ascii?Q?15WXr3joiWJT0aAcOgJA+eM/0TBGVH3zx3ebeguG5nvB1QDfQPoHzWQhWGy7?=
 =?us-ascii?Q?Oz8W+8BX1sYV4zvgysRNHqovVk+wvsyzBHpk2pPpfrIFiODOeNkO9mrvl1Rz?=
 =?us-ascii?Q?l9hh2FS912PJT5zTJ+zdQBe0ubW7qStXneEgs3Z5UE3On/s/ZgRi9/CLrGqd?=
 =?us-ascii?Q?e99fgOsRfNpLTbf86ZsoUQWZL/w7w7LWvAA1jvniskOmKOLpl3lmnNOcvsww?=
 =?us-ascii?Q?/ZtljxRbDn3ae8hLMDgqs0zFfz0nS5vis8dBou0VZWw9pYy2c0X1In+Vko9W?=
 =?us-ascii?Q?LWAZfRStbG7ax/JXOcc0jodJh2pWFhCqZZ1lQyohD3DhHhCL9xcTPFq6opJE?=
 =?us-ascii?Q?xSkSFYmWc+A7DmTx4DdkcA2ntb4OQB5x4JYHZ5dCXPS/9pj4XXz/PHarunY8?=
 =?us-ascii?Q?wxfDtrw0Ph7IJs+VRlvrM9V3RgIfRpUawDipAhgKLOBA5KDkrq+4zhqN9JQ+?=
 =?us-ascii?Q?XaswpytbydJKlM9QwMc+ZE+CPZfcIw79jhI0sCTY3hUNewgfuY/QlUSJPg12?=
 =?us-ascii?Q?jnAeYIsUb/OQd8feFammH3K669vYwKbbetuRrzi+KFkNtgthCZ+54yEH9xab?=
 =?us-ascii?Q?JoI4k07cHAVpxIeiCPY7F4I7Rvuc9WPkIa34JqYCm8e4PUcBOsQCgwr4mYgG?=
 =?us-ascii?Q?osSpwaT/jiewh9cG/+8fWffuw+pJ09LkSZaBXR+5jzq3CuAwisyxvGao4Sc8?=
 =?us-ascii?Q?iCu9XiiiA0hw+5mTw2fYcCSl8FsxqM5E5RJ12+i/1txJdMbYXJ8OHusNAP14?=
 =?us-ascii?Q?IRY/SYrqT47V+IezUAsiVIUQ68vlgixQx2T2vZFBhyZ/h8E/0+p+uNipBrAQ?=
 =?us-ascii?Q?EXBbZbEoaE3PAatx4+VevCgidJ9Zu+NAlLVEdarV4K4nlRLzeehb1Dcwf9Uz?=
 =?us-ascii?Q?p+EhIDmHqX1vR6T4sBIQeU00HiRXWO81qjZigkY4IXt6lphnNbTS5jeIwcLE?=
 =?us-ascii?Q?QpLBUXYYEfUDZ6U4JL9fyJGfrHrdc/Bd1dDJ5teXM3wESxb2fT5TGPB+zGPo?=
 =?us-ascii?Q?5dBEL4OfZdf+HFtHW8wONoNiGOQJtFJuCP48gmYYGOom1W7lg9oXnJay29P3?=
 =?us-ascii?Q?HCxKcVfp55Nc5pfGYQ4S5xAHRonXo8mjtbZ3h5Xny/MA/H4CfZMl9NV/Zhs?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: dd525fc0-fd84-401d-7ff9-08db4f42eed2
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2023 21:35:10.0691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0P221MB0831
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAqV9ey+o2o1XoHiRoEuy1Tf1pzW85M3u9DVUqE6Bkg=;
 b=dpBVOZjHD8WsYa7JiEJgICdhHvi3AiQE/ZXB8OKBW46kB0GfFlJNJXHdnrHgrmWd3fFDtiZFqQH6MOlUX6wCBlbsRjbEs9u7/jAckeokeKhn9il59BzpCbYJaMlCNRJ5YrAnBDso8cAHu4VxD8QdyEiRKflpF9N+w6y915OVtXDDeneyvLWd48KdhFqPrlqY1BNp79wTmEWcjVmCBTzXAYB4m1ZJ1AClM/b8KXeLqpk3wREfPAmZp1GbXzr5l1WVRe1veNVjpTlb4K1nS6JP5aouixbghrArFhSAIbli2EuxUElQWMoNVo9z7wXaJvOKhaE6mSDE1u//wXwBtm20zA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=dpBVOZjH
Subject: [Buildroot] [PATCH v2 5/5] package/rpm: add readline support
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
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When readline support is detected, enable readline support.

Signed-off-by: James Knight <james.d.knight@live.com>
---
Changes v1 -> v2:
  - New patch in v2, with changes from the original first patch.
---
 package/rpm/rpm.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 2964c6a51202772a3ce74c18b7f7e5b5ffa4d49e..c66ce6992d9b29d0463a66b43d278b269610c79f 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -89,6 +89,13 @@ else
 RPM_CONF_OPTS += --disable-python
 endif
 
+ifeq ($(BR2_PACKAGE_READLINE),y)
+RPM_DEPENDENCIES += readline
+RPM_CONF_OPTS += --with-readline
+else
+RPM_CONF_OPTS += --without-readline
+endif
+
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 RPM_DEPENDENCIES += sqlite
 RPM_CONF_OPTS += --enable-sqlite
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
