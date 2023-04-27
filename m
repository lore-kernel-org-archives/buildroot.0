Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2EAC77B60
	for <buildroot@archiver.kernel.org>; Thu, 27 Apr 2023 01:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A64E141EBF;
	Thu, 27 Apr 2023 01:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A64E141EBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C3UPDdzLZr0Z; Thu, 27 Apr 2023 01:50:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8877841EC1;
	Thu, 27 Apr 2023 01:50:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8877841EC1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6CCB31BF39E
 for <buildroot@lists.busybox.net>; Thu, 27 Apr 2023 01:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BC8760B97
 for <buildroot@lists.busybox.net>; Thu, 27 Apr 2023 01:50:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BC8760B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fA0F8V4DyQ87 for <buildroot@lists.busybox.net>;
 Thu, 27 Apr 2023 01:50:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 108E060B79
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11olkn20800.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::800])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 108E060B79
 for <buildroot@buildroot.org>; Thu, 27 Apr 2023 01:50:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmooiTH/vuXWzOR/Q+bc8dvC97tOvvM+cF1NzjxzRO6JJjKOSitX9BKH3K7K1IjhALqdw0hrM8eZLA2KPv53+IX70PyV801Lsenk6LELeqa+tsikQkJxGSvxSZNHeyn0BeiUBADGZV9dRTbh31+sHP1/bXDcyvmFuStnaYAb3+7GwYwReR3jMDT9dFCa5MN3rywwH9A9vhyylu5xdKm9v0WrhFy9BEKoY53Pg+NCO2fPBI9IRAVLGewGSkwpJ+B5Rl9dq91E9oRwRC+9T9oswefx5HkgheNLeiPYTsclWKZyc8O9Lhs4Dh+kDNDgKArGix15G1FSXrM2dpcRZ6lg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuCLF2PyPjH+I/fGRSvfcW15BeEp3aBrFi77I8jBzAs=;
 b=N0RXSLtOPmVOtgAhfaRAXFszC6d/ZtTA4xlUiDAcIcsR4qRhrUQcxoc/Bt4nEJOffuBRMZT37/unpRnE/yylq9suzKXQiWWW6X9mi8Stl4PDR45Bs2PpDWgkX87Rn354i5Z5sMu3q1MvrRWlAqVOrEWVEbm0mKUuyWw5BVee9U6xahWCwLciu1iJEma5BHB3pTFdF5ousOwPgfnHQ6y/dAnFMUIJ260FS5Z/HCDSG760b8UnCIz0TpmK7KcRyqbuFn8Inj7808ew43/SA+j6I8BwqttBysuWy5IVJUX/cyA/LsCkveLj22iGdtv2D80IhK3NSNkMVN7kLib/vYYueA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by SA1P221MB0994.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:255::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 27 Apr
 2023 01:50:43 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6319.032; Thu, 27 Apr 2023
 01:50:43 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Wed, 26 Apr 2023 21:50:14 -0400
Message-ID: <SN4P221MB068281FE13C893DCE2F2ACCAA06A9@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.1.windows.1
X-TMN: [2NiUGwbSDG1udisbC+dUow50WXrAv+t9]
X-ClientProxiedBy: YQXPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::36) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230427015014.5228-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|SA1P221MB0994:EE_
X-MS-Office365-Filtering-Correlation-Id: c9d94f9d-2f06-48d9-8c3d-08db46c1cf71
X-MS-Exchange-SLBlob-MailProps: 70qbaZjg4mut0ZTEc/+RhwzsFjQD3otI9r4SVVMsQn0oo6rmHc5ejEE2FY+/jhk0jecZcOwIOmtVp+NmdpBkmZXUmphsXkCWG18GYN9Ma7jkV9AIlsisguwEpsnNQ6QFnmDFIsRB2Z6nS2egbmoCeahgqtzJnsny6jxLJhxh2ar21+B/on1Lflnvy65LaH2rQnL6hD+hsFIDdA1aYbD+d0tRpEST5kA/PVxLqETY+DN+6Ebpzv1x59MFUY5Ta0D01d4iLUAFRPVZtIq1Y7EaH0qWkpSd9J97uzpCozHFiDjdHBekFcPLIaJHDT2WDNXah8KvrtmprtGC/sUtgLqej2n64vlXTmXQNEe5xLzye0JaIsHuzOy8cTmMlHAlisGjsFraDJv29RqymK9UIaZILVFHkKGQGNoWxatnSRZAJP7tINZf+Rmy5lX7Hjf8XMRNAGoHV/kHntYFvA9XAK9+/lEzMUyOd0u3j92fZZdTqkfkKNKjXjncE6AjOBbBNHAivHVjUKuuNWbAmh7Y2xeqrVXs/7rv3fdjGvYEgAZ2iX1BsupnQ55/tHMxadsfEQrtLPdUJSMMXJdnHFTaVN0Ae9GxOwVaQOA6tCTv6/F0QULynx/JdDuR0UazlAyi2GN2aAZfB5+pqzNXKKOPr8ooeSWHA637+pT0v4MVkipXxxnKAq1Nr1E50Gt247sCTqvhKfBPoYWqRhD4gm+7NYsTKOMJXJFFQjHF6lQwOySQxVeWFIyNfj1a1w==
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xsa4Fuc85aIBJzc+F/wiJ6rXqUIgxjFPP/k6WMMnvWD3UCek9S1iYRlfxnFK5OK5qyiWZ0Em57bujcoECG07trOjifvLKPkRoxvHYYZqNVw3q1huKCv6iJezASmRFVBr6C9Off28VdRtywYL8rqDJU6T5Bg67MzZZOzGdcFKpK18KUI441tWfMaZRAwwUuh0PADYlvZwIHiWoU6LjwtKJ0VWgJkpgc8E+f6iRs28C8bg6YlzEwzFRA+Hs1Okd0hz9IQv4f1PW+BfQvuEuPec6xB7NyjaKL8cdTJqmWSTtbP34X4BNc69j1K618kFcWUhEH0Qs0gRx9UnEGpvi8dRVdhjm842cnoRZla18LhfVXjpbAo57ytCm0mN8zckv/1B9l9Z1uN/c0+F6fxwd3nXypYq3Hnjgl3E1lCZ0B87wFpDb3R6NrbdvWtSfzj+ulloEsjhm7EuJWP0VDjPtzIwVmZ03QtKPqdFDaa1sAqybnsqgF9TtXFXra7fzHhhUVW5TIF5go0ms0ikAT+CJRN1BuvgxWKiaz6M4UzORmqO+3Q2CgIszyKhl7K0jGyQP7e10tbecN2dQ6rxFTEf8n8V9DykQoG9cnoR1lGpq5kxtZdiOw19oQN0sAh6Y/b6F6pJ
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LqES8FQ0kHbfPnxs1yB5+CHHan6aahnjVWZsrHy341kZA32096MY0NYnsHzJ?=
 =?us-ascii?Q?cKcyJGh/wuAsnFxhy8mgmraoDbAxqLbnI1DrHATYvdjFutr8uDJWcNAZbGES?=
 =?us-ascii?Q?UdjELbz2oTVsu+twOm6xn0E55wn7Tnm0BcU4u5aYnNK3fWoCbsw3wVLxJfU6?=
 =?us-ascii?Q?NjXOT0FX1tupbEnTGyZ8hq8ITJoVks4pMnki3kPqrwS+2XUAfUIwvrQt+pEq?=
 =?us-ascii?Q?Z+tYIsolURVNI9wkps+rwQ7zDfdCMAE8GmRjEPQL0KX/olm8q9RNM626/FoS?=
 =?us-ascii?Q?NHK47S9bxg0AgCNVLGv1zgBjYLnlYC+3PvRsU+5MnAPwl5CQ5IUxvvlb2ddY?=
 =?us-ascii?Q?c101gPYCz4dd/xRimGHl6jEHaAGDI8yHvgire+1s4cce9WtrR63MdFDDCSA9?=
 =?us-ascii?Q?X1uclQz9RgpHINzIoPjVVKFXQp3jU6GPpZarhaM27sCjaf7/fvsGyu1qlXRk?=
 =?us-ascii?Q?SX3KXJpTA6juCjDA/JIK4ViBPP3OXav1UHJML/2ExOj5TZ4mUtt0LFxuYQB5?=
 =?us-ascii?Q?yIPux+sJX4u0fEFTgpuN/iFKA6hCGOEaNGZkpHPDtjSMMce1fACbPkH9SjC8?=
 =?us-ascii?Q?VnW7N16mc4EzcDRp8kLPHi2232KpK/jZ3BS9udn0bFQArMqBfCbg+L+FGDZl?=
 =?us-ascii?Q?b8aC/nOr1OZCo0Hva1KegtTqLoQBjX5BPWy55BFYX/ob0vfcTcg73Rx6Y5On?=
 =?us-ascii?Q?/tuGjLMvFkvoa6TYo28fE19NBthHsiNv7D3BmODVjGKkIdGDl2IaIN75L5Rx?=
 =?us-ascii?Q?6jskUr0gOh4bfAXkCrJmcxYTaVLUG9GM+VsGbiQm8tw7DgUSYCqysD9GKGwR?=
 =?us-ascii?Q?vWsUuxDZVVfPPgeWQqQYFS+8texeqSPTAHakFbhttgRWY8Ily29z3UYT/Y1i?=
 =?us-ascii?Q?onoGMxUtko5156OEE0urltEoQvi815uTrQu7NvhcciISgTzRC1yFQ0szpP2o?=
 =?us-ascii?Q?4IwbahB1qrkqyBZ5KqgUUPeOZ3hz0Z1ajYZnFSHxxdpI8NOwbDkzNgyPrZSN?=
 =?us-ascii?Q?S91AfEvNhjVqwTw6ktnzozUxV6ZOMBEk4u3JIGME2Od5+349hIu1+/PT/5/9?=
 =?us-ascii?Q?mPyd88F71173AkVVaFbTmuoT1XLg24wyo8QqHDpwWzyX/5J+/HmCRTSmqiwN?=
 =?us-ascii?Q?y/rNa75YnMSTq7uhqMgfpbXYKcPHKlntcMk5U8nSXC1vYppCjLZ5K9WXQkYv?=
 =?us-ascii?Q?6CbCnAHZ/RCWf6gbuLhXFBQ26zZ1zpdpI0AEutYov9VE1gmT4nbc/5+gdgE?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d94f9d-2f06-48d9-8c3d-08db46c1cf71
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 01:50:43.1136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P221MB0994
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuCLF2PyPjH+I/fGRSvfcW15BeEp3aBrFi77I8jBzAs=;
 b=AWFwxY14V6+F61F6GX6irvaKMLHsizoIbaYmHw4owpHVr8dlaLIAxBmySPzxsaPdkZ3dc2jEe/btowLIQHxS0eG32BlG1xSMaeAzJlW4qeaLKcWdP8ASDKLlK81HJULvteb08bJaHZLUAel1pSdnILtrHQg03cqdzBr+jG5IkiRqD98At9kds7rjIA3B9Lto0u+M/+MnnKMBYPKu+fy9JGlIV5Egf0H7SLD+PUUXFog9BMXbfBBaapEP4yenKtaPal9eHqfJFUs4nN3Dh4wJi/YvuNVj1cxdigtduMsKAquZAQ9Wq4NB/qWC4QAATlGiZOwFOdP4Q4mITiH+/hRJLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=AWFwxY14
Subject: [Buildroot] [PATCH] package/libxkbcommon: enable wayland support
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
Cc: James Knight <james.d.knight@live.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tweak the applied configuration options to flag support for Wayland if
the wayland package is detected. This will allow the generation of the
`interactive-wayland` utility (when `BR2_PACKAGE_LIBXKBCOMMON_TOOLS` is
also configured).

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/libxkbcommon/Config.in       | 1 +
 package/libxkbcommon/libxkbcommon.mk | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/libxkbcommon/Config.in b/package/libxkbcommon/Config.in
index e9f61227a02b55a0123318f27b296ce2c8b4ad36..c344eb78b6d0cbc72ff382ccf0682811f9a2ecfb 100644
--- a/package/libxkbcommon/Config.in
+++ b/package/libxkbcommon/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBXKBCOMMON
 	bool "libxkbcommon"
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
 	help
 	  xkbcommon is a keymap compiler and support library which
 	  processes a reduced subset of keymaps as defined by the XKB
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 236bf4c5d94d163809056691339ed7660e545195..2bbe349771360d34c0ff73bf871ed5621120b312 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -14,7 +14,6 @@ LIBXKBCOMMON_INSTALL_STAGING = YES
 LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
 LIBXKBCOMMON_CONF_OPTS = \
 	-Denable-docs=false \
-	-Denable-wayland=false \
 	-Denable-xkbregistry=false
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
@@ -24,6 +23,13 @@ else
 LIBXKBCOMMON_CONF_OPTS += -Denable-x11=false
 endif
 
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+LIBXKBCOMMON_CONF_OPTS += -Denable-wayland=true
+LIBXKBCOMMON_DEPENDENCIES += wayland wayland-protocols
+else
+LIBXKBCOMMON_CONF_OPTS += -Denable-wayland=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXKBCOMMON_TOOLS),y)
 LIBXKBCOMMON_CONF_OPTS += -Denable-tools=true
 else
-- 
2.39.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
