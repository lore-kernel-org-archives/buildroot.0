Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597FFC7EE21
	for <buildroot@archiver.kernel.org>; Fri,  5 May 2023 03:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7C3140C21;
	Fri,  5 May 2023 03:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7C3140C21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id moC_OJ_ulJu4; Fri,  5 May 2023 03:44:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2E5F404F0;
	Fri,  5 May 2023 03:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2E5F404F0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5199B1BF3FC
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 03:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A27960BD7
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 03:44:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A27960BD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gIlQqB8MauIa for <buildroot@lists.busybox.net>;
 Fri,  5 May 2023 03:44:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 538C160B49
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11olkn20801.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::801])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 538C160B49
 for <buildroot@buildroot.org>; Fri,  5 May 2023 03:44:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oN6aZF92Qq2XgebUxvOGjzLOPLt1uHg5c3A3jB/RWRbh6vyYS/mtkEolRYzRsoWv87POWFNdAwA3QZG1j+VdiWTzdBc9U11X44tExS2aimyQRRLN4qIUl3aVBDplo9LRub09+gnSJ43TybD49AtVX24akBDFcgVdBFWaQQ0F4ins9b0zirqCq6HhsyQ/juBxgPzyq9GCZIN72+yrAQzroMTggQf9k0YnObr6zUqtbfKV2h/NspSu0aa+WmRL40gMnt+WbJiTszRDTvffiDfxH1V+LgmOygd/keB/bd7r0VPPVuRn2PJJCEb5JT+QtXwKyd2y66K0SqwW15RLRtytmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PLmSB6L1ABm4AmuxVhEY26Zttur2QtlOiSTnq7bCDw=;
 b=XC1Y5Bn/snOywrebvuUad/L9iTPq53rN8vyHAyRsqjte2c9yu5nlMnhkAyCP7Q4/iCbmHJOV86guFVSwjCRxQNEtNp0i7406jI8Bdrfz5TAx37tycD8LUFvgovXnNodfzYLg+sZsqqXJEapPpscSm/AVvCr7Y6d+Vzf50cXRD9C49jHrAs0biqzjIkZnApL/N5Qs8smRRru5t7g/OxakojCh7KDN9Jjt3KmdGn5XxlWy5V2NBW7RCmc0G52FnOiz2fEpP/YAabZl7oBPwha8uOhXsQsuFycA/GrmTZKWAX/UzQds32MsrreNgi/TE9P9TE0X8TF1KHKoZ4Z8hMtb7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by CO6P221MB0709.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:140::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Fri, 5 May
 2023 03:44:19 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6363.022; Fri, 5 May 2023
 03:44:18 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Thu,  4 May 2023 23:43:17 -0400
Message-ID: <SN4P221MB0682F08F5BA15071DDED63A7A0729@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
X-TMN: [jzSzZV3hUyX94vK9qq1jqmjXnAYD2hZD]
X-ClientProxiedBy: YQBPR0101CA0079.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::12) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230505034318.1903-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|CO6P221MB0709:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d81edf-52bd-4f11-1626-08db4d1b0141
X-MS-Exchange-SLBlob-MailProps: 0wLWl8rLpvtSuoynPzOBnq86nziGpphY14L1qJvdIO3wGCMkzJduUuHMI7+yQwd2WpB8gORjHCx7yN3BQwjgTl9wCPmPW64fXHTSpqWI7/3W9tX37EcSDH2gZyhL8NkgY1aBjKyzxouiFZM9WpbpOjvcX0ZIgjyPNCWLhw69Y4546xYBif4NwHyQ+6Gh3e3gvMbXzk/z3UmTkZ/jM1BSCyMrCJZ3wiOzmJ67i1CN/1KQWXd7Q4dQ/pk+KpDmHjTf0I5hLTJ1gIW2rhcsCLkNuwHzemJez9aQkQw8u2S+8Chpg6ZHG0qwzRTFy7e3kLjATntvPCB2kwIDltyDihuiWDkhiPw4/0U+u75rupLxuaW5irMuDeAvBu76q8jU86uG8SimmxB4xyHeZ1i6rqfGcO7yF7C6fe1cwxTFBH1b6CkgsA3HElzu80qjM1nXNNtMRfug8seaaq92kbctN9X5X1M6Y5JwdWTJH8xP/rNP8qUWsl1h0bkD/JjecvYsHUDxkobDnzXtAi0IrGlaz2ZQXQZhaod8UzLoLFp54+1Lb9AcHCsLagnomeL02PIBiGQtuN/XCofOFAdcjavZsVXRMdPVYqlfp3BAWYpWTSbPqHa3NJGEqY7q/kemz2xjOZQS5iLAtd0tzjwKkt5ujswqT75oebzWy4JrLKljcWyP5mMNX+fnW9FBGp5iPuLbBpn0KMoLxhIzi9INvE1dWTmF5xRgUsUuNSYTRe1lkWaeeRffU2tP7QyhM08F7lT00tAUCnsFimQwgOY=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2vlNc2K3aB4rnpNO1P1zxw9PKbxDuDWYcu2kEiS0RrikRmLfqTDp4XonJxhhG2ggMpWs3K0ijpFU0VrWpvQBW7jaOAgB/iIatnZUtjeFhCaFNR8Sb6GYmsg8sXhmUYAganiQzLWpWsm3oh3iiHwxlZJdHlT6MJDwIJ7WGxAeBTfy8GoI4fHl3FIEhDYQFmQqlIICWkU6Z7l/kQVDalIn/HJdXIjmMzDNTS0Psk181R3QXmVk18HAwKiKmSL/TfQPva6TsgLVY/lKsXsWSJwn2/sez3FUBYrGB3VN0lyEVO/+EqxMfs2dOqfzc0558gvnGbwRnEiSDMxGqmEZCvTH90JPbaqGC6FRvlE4869a0O5mOlISFoBk07cjqnyY51EYubKbosOKNbohSxzP716XADO2WGDo2PZknynfIybQS7Ys0dG0QvTLP0Clj63KIdaPuF0YGBVEfLlo7tVIyDEtWQHI0PjPWqBUcE5FVGQNp5+ItF3eTRJom0zkaiNYr1NEdC85vYcfVrGw9gfharClelFIb60iFdNaKE4Ky69gJ9/DsabF6kPYAKQ3ou1uk4LcClpUTGHDX2bk0/f6iYgZafZq8D+3N+cJUbhVGfY+56kLnf4wIZOhIpNwxn6+yp5p
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S6/iWSapI8ExWSTTBS8ykUrEahvFLMNr3VcLyERVhKwWtAn8RG+p8rnk9ZrJ?=
 =?us-ascii?Q?X0SEmZHuLPtTfRQ/vvQjPRxq6CpQUBpJLyDzSc0MdEHh8QlZyPLHRXeALvnY?=
 =?us-ascii?Q?J6diULEUFqRfMo+xdpe1YlaGKpn2hEaQNW7u6vR8N7CRiMFCav4/CmtSgu7R?=
 =?us-ascii?Q?AvAQKVG/UGDICsySAqHehpEXzYbfQzPYOzpKOqrc9+kncVjqMc9rrhSVrjgu?=
 =?us-ascii?Q?l9aZjz19CyJHix38VThBiqkW9GDob8ikRXNY92WdeIMOEcvDYQzJ+TNBAFFb?=
 =?us-ascii?Q?CR+MvJ1z/M3/lSK+9xAgS645b+p3D5nmtOwh46lOuaAW1Lu0FZqgQDT7wIVa?=
 =?us-ascii?Q?YkMBu0Pnae/Fwa+cExkO9bcU/mffnieDMiWQelZQPbttSH5vAr8rlDsEicur?=
 =?us-ascii?Q?ff+qp4fvjZ9wQk3lOF8qOcQG+Ywmgsvvip7IpA2/1nxO9eBQUjItHgEJ6TPT?=
 =?us-ascii?Q?RM0pTEFj18hC3EIZ9swGfbWHD85ExtwM+wR6x7cW4mybZzzPywZ0sispstSD?=
 =?us-ascii?Q?RelXMS00eistcKBPgtSZX6I474NLJGuMMURuLGZcnFv8y6wzO2mZOsKWHRAV?=
 =?us-ascii?Q?xcX3xIk0od57RgDc27Pcmh/YDEFf5ipxQuiyHuSjXdWGe0Y+QsYvtzVCq+mz?=
 =?us-ascii?Q?+p+duZvmiX10PFkgOXMSZQ1Q1OvHV8la+Hsa4d1R6FhTNOMj9mzRbg76nzDL?=
 =?us-ascii?Q?vriyxMtOOx1zkmX84qnhnhBhrsMyAyfNOdfD5qC0aE99V9g3e5i0bffZTSwU?=
 =?us-ascii?Q?uzX/eHZuj5S15VsA8z20aFhEQxAIYgkfU7K71WBAgforxXZ9k8dgWg+lHBKB?=
 =?us-ascii?Q?P/rKtyTquLO7fGR3URjDwlEImyO6STxXcS08G7vuKTcSAvsm5QMs9AmaTlXs?=
 =?us-ascii?Q?KNqPrikBcoIJQGA72NCG/0Dz0nNaZ6F6J7qboyk7X6QPU9q0UCuNpYkuX+C0?=
 =?us-ascii?Q?AZh/8HMxzxHh4U96EMfTZJTEFx4EfBBvBmX0MZYMeVgECB6MgJGIv8onKgYA?=
 =?us-ascii?Q?otzv+rCZksu61TId0AptuJgXfyioYBMh3h8vjZLSfo3WNoMZewG5dcC9ziZ+?=
 =?us-ascii?Q?D6M+zzxLeOv5HakrZgo+Ak/9WxkLzZuJc8bgnErG4bXHSICG3D40Q0zu81Vg?=
 =?us-ascii?Q?IJzr7PJYHT7jVks4DCt5UUFuWF+UvShFH58IpWkLQ5jgnY5+qOruhu6pDb6t?=
 =?us-ascii?Q?KVV7M7YlNnZWq6yV7BboOj8lxAgENiK5pft4ns2hwN5zlMUb3/lxNCiZel4?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d81edf-52bd-4f11-1626-08db4d1b0141
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 03:44:18.8837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6P221MB0709
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PLmSB6L1ABm4AmuxVhEY26Zttur2QtlOiSTnq7bCDw=;
 b=cUKiRG9Ag++KUqnGRWv4RRIUZ/OYQJF9CMCRQs4dBC2fWp+QLIo6x1tupBDMwVFSo365k+n1+uuGWwaJQOCzYdOjYKHolly+0V0DPyXer5o7RLxxIJN1NGkYQHPdd9uRjsg/WicU5ryTbbYxO7Jzpmy/Sx5WdQR+hcPurCjb/4IuzNNmANixZPsROKujBHepoWmL8k8jMx4bzhfPNueKdICXS9/6rDjnBTgHp1/rcut9e7Md05HF+sBz96SNzjRLbGo2HrnoRnXsk3l8X5UXwuxq4eTFz+EL2LXttnLFMPy2R4abjWcPNxabQQ0J886u/BA6GWEUf47SGLfrx7vb1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=cUKiRG9A
Subject: [Buildroot] [PATCH 1/2] package/pkg-utils.mk: suppress kconfig
 set/disable operations
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

In a previous commit [1], the use of `KCONFIG_ENABLE_OPT` was tweaked in
a way which no longer generates a default output unless the quiet flag
is unset (`Q=`). The use of `KCONFIG_SET_OPT` and `KCONFIG_DISABLE_OPT`
does not apply a quiet operation. In order to make all these kernel
configuration defines operate in a consistent way, adjusting both
`KCONFIG_SET_OPT` and `KCONFIG_DISABLE_OPT` to be default-quiet as well.

[1]: 66d2ff25bad813659ed4541b3f4c6c2a09455bd7

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/pkg-utils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 0945e6ed318ab4d176ce6d4efa3906e537f2b982..530638566c05094080b8defb098c131aa4981767 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -34,9 +34,9 @@ define KCONFIG_ENABLE_OPT
 	fi
 endef
 # KCONFIG_SET_OPT (option, value [, file])
-KCONFIG_SET_OPT     = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=$(2), $(3))
+KCONFIG_SET_OPT     = $(Q)$(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=$(2), $(3))
 # KCONFIG_DISABLE_OPT  (option [, file])
-KCONFIG_DISABLE_OPT = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(SHARP_SIGN) $(1) is not set, $(2))
+KCONFIG_DISABLE_OPT = $(Q)$(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(SHARP_SIGN) $(1) is not set, $(2))
 
 # Helper functions to determine the name of a package and its
 # directory from its makefile directory, using the $(MAKEFILE_LIST)
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
