Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE993F0183A
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 14:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2404F6107E;
	Fri,  6 Mar 2026 14:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8cQDarGV68j1; Fri,  6 Mar 2026 14:10:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9A5461046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772806253;
	bh=CfpI6Z6DLE2IDznf378l+HwnufEqP1yrttlNp60CGSA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L0c67LVs8XDCEPMrK/Q0tJQAfoqZLrhBAqKdi3n66m7jaQGhptW0RcpYK5bw9Sz1C
	 ttogpbzFt8perVIVI417uKAUtlyL9reHTN7gOxDNqpOk7TYQZxTNViMEyFqY8qq72E
	 k/M7KC6ZZYtOiW8mkLxavv92Bt56ySZpeJdf954u4yegOGO4CdvS5Q6QFDerSLMxOy
	 zvoVkQS0wMnQ79lkhIxwXlAOPCqm0esMyrp1nCh3wZxih2EVMCyD0GDOaMew9Ronj2
	 NZvPN0MmL1aOIULpaxsWdfu0OcRZUjdrBH0sdWLqIR8mQGAiRE5WZl8GxpXqyDOr0v
	 W4Ymm0G5tezfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9A5461046;
	Fri,  6 Mar 2026 14:10:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B8C26223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 14:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E95E41D6D
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 14:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_OQJbT34RA1 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 14:10:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:c213::;
 helo=zrap278cu002.outbound.protection.outlook.com;
 envelope-from=martin.bachmann@designwerk.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B8BE41C36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B8BE41C36
Received: from ZRAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandnorthazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c213::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B8BE41C36
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 14:10:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6HN7nWDLwYxJMTJCa46b4BT+IVa/Pap0e1ZfJ9QgP8uTMZMcOP6pU9oVBqCBCSbquyBdvb2rhiNus+oLOt2gmO692ldF9T7kmO2F9EsHODs4c8NU2SGSnqYo96aaUtjkVHsz6oPs0DmcCKus9uUUs8Y24yi+2yWL6WYT3Yd+dtRDzfXZ9wulRnd/brziOd1dcPUufigRJjFD7/omgPRfNnH0rGlHB+SLY3xuIjJRlSh6I4HIxD5J5iaXpfKGcuViozIPvlzh64VzzIGTC1qZ3+xhEaidjRRlv4z5bJ5ccG3Uw0E3Rd5eKWrPGWMxJS5FBdnmKAjb0yNLV1DsuSwkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kUHN9sbA8PrXcQI1T4wRG7kF+vBf9+gPLuBcgKm74o=;
 b=SmwLdmuGrDVi729AEoL2+V6GIOQtf6m9Ug+LtLJYcOm2Nyi8GZnIkGcbPR50p1Ia1Dkv++cWkeAYZ9w/3S9NfQUH83SdaEGCcR+fdIf4kSc72en7swe05kccv0LeOtJje9EYKJxqf0V+sfaBvxnnkbvaDNY1iFedFe48MvBAYga+ljIct4+WOGZypvn4iWA9sWtVXAlV2javuPWHep1lQ5btRuISNet8Mv27PvOrX1/rkchgmIErV0iwYUNfjbl+1ZMlGGkgc99qFDwlxYvtphpEdNW/nizxA3cqur3adDKKARaGLvPf1MxH854lC8lVdbHrQYBzRcJEnkKsFXL/4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=designwerk.com; dmarc=pass action=none
 header.from=designwerk.com; dkim=pass header.d=designwerk.com; arc=none
Received: from ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:42::7) by
 GVAP278MB0971.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:56::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.19; Fri, 6 Mar 2026 14:10:43 +0000
Received: from ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
 ([fe80::5237:f3b3:d6d4:9900]) by ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
 ([fe80::5237:f3b3:d6d4:9900%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 14:10:42 +0000
To: buildroot <buildroot@buildroot.org>
Thread-Topic: [PATCH 2/3] package/ncurses: Fixing license information
Thread-Index: AdytciDhKYWJUK8bRoK9jRia9TcIgg==
Date: Fri, 6 Mar 2026 14:10:42 +0000
Message-ID: <ZR0P278MB0869F0D024FFA7A2E1BCA07E8B7AA@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_ActionId=5115b55f-192b-475f-8ea6-c0281f3d5b8e;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_ContentBits=0;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Enabled=true;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Method=Standard;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Name=defa4170-0d19-0005-0004-bc88714345d2;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_SetDate=2026-03-06T14:03:28Z;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_SiteId=5f12add6-5f96-40e3-ac41-2307f36545c9;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Tag=10, 3, 0, 1;
x-codetwoprocessed: true
x-codetwo-clientsignature-inserted: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR0P278MB0869:EE_|GVAP278MB0971:EE_
x-ms-office365-filtering-correlation-id: 7c558763-74b8-4633-b03e-08de7b8a26e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: icucCQXBo36Q83rbuLypft8seyU7wufCzDs9QNVfSk/PbIH2xGfXBPne/9SQswF1QjXMhHFhb/KaeaSztPIECl7FIwXKASnbpO0ClpfNp3GV8N3xmFjUFuI3KTArX7CHz3rDGXxPB1oODUZzWI4Ah2Patw2t9PlLT/0ZheJ9byOmOfQjAhtr2VHrfEqz/CnUkf3Y4xRR6IS1kEgmeDBnzFhfKb1fqV+hKTEgCZNNUqCRxtwVjs6nGqvllI45jaMVz6BgDClvjLqHomM04Witw93w+9/6dMohpxk7lGgsUdBVZ44yvuRMybAQ63M0zmKkIyLCYO1b2tkbZX4zwfWPoRnxzxqo2QYZM5yYVEyxYU76x6Ayb0FOxpp+jOeOqKQS/4QkCO/R7FrPrEXnS1pQtGuA447tkZd/P5CYBNFjz+CYcFYyU5B+y//LFhSW4c7mKKc+ksgSvbr9WZJF+QtPCRA6tMFe5p4Gblf5y6hVg3RtF+Gq9HPJiuSBawxeFWAsqbT9phkGRVKd2jHhwXbTcL62UFLDCzp1gfr0IMYmwx8Rrx3Km4pfh3XhrOu6P7P6g+QLB9DX5tmYQDjgv9GXf0CkSh4TYor5vlFMATMbUFNKURxPIKRU7MwvBoGT2VRIaEHl4wfpjueUP0NTsCWOaU42dLn0ymw/o2dAodIDWIi5Pg/ko63MlS9eI9D3yssiecBRZOzt+kzh1ipeYxSvJadUs/kUETBtYqc+0DiA5ICGtko62CxNJO2SRW6kVJXh6kTKF6RCpghxxZddfw0gC2Fj8IGKcEyQOgCkQIsAyZc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oY+oAa3y6VimBaSFtealML/dMKErQ7oyGaBUJl12GeLzG2drNlR66MfB06b7?=
 =?us-ascii?Q?o+T6hLXLF8iFHL5gRWYf1FwxJwI5MIL03tTiCYR9zws930HYqeGoRp1GqT1C?=
 =?us-ascii?Q?nEZu93NmIEx6LHFUIstBh4adXb5H5NO/fIkxZ53iZZp9lyCLWWjMhMh8tjdD?=
 =?us-ascii?Q?S5P4+AgTkofA6KNoAeIder8MOgaAGLpB+1CjRgQ4SB5c+Y6E/FQKdebAZGLl?=
 =?us-ascii?Q?bUmbtDgxaQoWy3pPezUd0QbYuaCdKqiNge2xhLTEoS/OlYg0SzNC5ICEHJie?=
 =?us-ascii?Q?2NOGszq/TlauHv5+9Hd3JbaQNefNeNDZhuYijPaU365V/V/aXtLZKqigFWrB?=
 =?us-ascii?Q?VSfyrYD7+lXSScFqjWIYFMvM70IfLx5LCCsj07vn4gXVsvf9CHUJUVQobTKn?=
 =?us-ascii?Q?RSGknY5IaZcajBu4gnOQewVna9lVzv3Y+KrCGjwc6j+gVoqwpttGvbbaMVCg?=
 =?us-ascii?Q?lcBTRFFm9CDVal1xhxHBPeYCi7STgDcTKH9wYGHwFfQjmD4JPxd0Pr3xO6l1?=
 =?us-ascii?Q?jPguD/Ts6ktYaCtlWzc8zd1PkfSWbpfID2QDj1322nXhLTFydkjJfKehnqpn?=
 =?us-ascii?Q?hs0lXvOLHZr8WxFLgQBBq6aeJo1v9geGxX/KY8hmpqUUwYIAm31liL0gosaj?=
 =?us-ascii?Q?74BeSykEurcK1lYnWngOE985LQzx7gal1a6Xkwj/RTcsQ6q0kKlesfSymAtl?=
 =?us-ascii?Q?dSSa7JtM1uoONhfMXwyeTwgnkfVr0N9eh5oa2WloYxtlbOT4SvP0Ur1i0pW+?=
 =?us-ascii?Q?hSvubSfXQrDPRNUijV9rL8Ssa02fsWz3T9PwSniVZtaVAOUKFcd+flSG/QSR?=
 =?us-ascii?Q?G+Pk9YsyZfJphFWNNYc2sxGU80HKl0PKHiismLEtoJQsRGUBiun7AEiVba+d?=
 =?us-ascii?Q?yI7/iSq2rIr08Yw98wAyQGoYid51V1eDFpbuQ2tTRVMHLVK/JdRe3Cf1WMjj?=
 =?us-ascii?Q?xLwVZG4jjyRH0L0OBp3mCbkEBgezVUTAPvdmiL/jQiKxaezJqiywzMFxTHpq?=
 =?us-ascii?Q?+c5u+YWTe8JQ6CX6jTc/66qRB2OevTviqB5Sna6LT9LAvjGN/jeREdrTT2pV?=
 =?us-ascii?Q?GnCPBvisH1w2IjoEWT0j4pkdhboeZm0lw9t6x7qbSOiuiAlDHJBaD+F13XLc?=
 =?us-ascii?Q?lzKYuiE8i2djMzMAHKjvqoUPerNY9t5vpWnKqBypUMjCHeCJRwbiljLHYBmx?=
 =?us-ascii?Q?n6jBw0DkmSKKZX40VIb3KPSrXM2tzh0Zc32lTQ6kkv/bvc7sRI4Zp+8q7Kug?=
 =?us-ascii?Q?P7OwAfLVe4CPbEktPbXWfbpxMC+VdlpWAOFIj4s7B9rSmE+skPIVUNgzHQ4y?=
 =?us-ascii?Q?B8O+wQGCMC4KwO9n1O3leHVKHRGfgxECylynIRJgAhj1JwQpkKm0whgFsXSJ?=
 =?us-ascii?Q?dv3fxI478Jp9UbxhokLqX/0v8lad9SwJo9JBpV8kNoGtJtaRXrWxr6k4wmgf?=
 =?us-ascii?Q?B0wHiDc1rys6MtrPG/SgIi2xrWgOZEX78fojzOZ5kKLCvVfFoQyL/6d51etc?=
 =?us-ascii?Q?0hYGXnMNoMJT11FAudo9RCeEpJoCt/9lHwkuwzbbmPsBWsN8nDx1p+E3lgz5?=
 =?us-ascii?Q?iPbftt2jkdA4K03PW2rDsveOKfwhK7+OK2RzBDW5nZX3MaaUig2b1PhsoiYU?=
 =?us-ascii?Q?btg5Pghf4j9BMcHAf0+TKZZPowaVN09+vC9HD2W4pE2pf2LUE12EAROlSmai?=
 =?us-ascii?Q?M5r6uTPuR9nsy49X2M7xLog6fbsO7KQ4N7QJaQNw4hQJUyXJswViBsvEt1T4?=
 =?us-ascii?Q?9Kxdte4+mdDfCBLLJpDLQbUvrChK6KU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: designwerk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c558763-74b8-4633-b03e-08de7b8a26e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 14:10:42.0735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f12add6-5f96-40e3-ac41-2307f36545c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t1e63y02bg4TzKOQuSyMDrcFNZCAlHnyDg5DAZVJnvwLbvk+afKZlSJu3bWZNudsjOAspfvd3I8TIY2PX8WD+2uR0kcvvXHUGdE5svaJiA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0971
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=designwerk.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kUHN9sbA8PrXcQI1T4wRG7kF+vBf9+gPLuBcgKm74o=;
 b=KEJvv4AObmA9AoTwr37dMC7ZkJzwFszgD7PKGBTwshCL0jpjuoR4Gm5ow2MxHk3DT9gJK/cVA3UcpEpkLIknLD6A256lS2n16x9+U/8q9PE7WOWu5A53dckU4+wuetgtREuDotAkhLWYVYuzyrC3D0jw7d9MStRiFdnkPSBs8s8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=designwerk.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=designwerk.com header.i=@designwerk.com
 header.a=rsa-sha256 header.s=selector1 header.b=KEJvv4AO
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=designwerk.com;
Subject: [Buildroot] [PATCH 2/3] package/ncurses: Fixing license information
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Martin Bachmann via buildroot <buildroot@buildroot.org>
Reply-To: Martin Bachmann <martin.bachmann@designwerk.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

MIT with advertising clause is the same as X11
The license text is the same as mentioned on https://spdx.org/licenses/X11.html

Signed-off-by: Martin Bachmann <martin.bachmann@designwerk.com>
---
 package/ncurses/ncurses.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 5e2077500a..584014c70d 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -12,7 +12,7 @@ NCURSES_VERSION_GIT = $(subst .,_,$(subst -,_,$(NCURSES_VERSION)))
 NCURSES_SITE = $(call github,ThomasDickey,ncurses-snapshots,v$(NCURSES_VERSION_GIT))
 NCURSES_INSTALL_STAGING = YES
 NCURSES_DEPENDENCIES = host-ncurses
-NCURSES_LICENSE = MIT with advertising clause
+NCURSES_LICENSE = X11
 NCURSES_LICENSE_FILES = COPYING
 NCURSES_CPE_ID_VENDOR = gnu
 NCURSES_CPE_ID_VERSION = $(NCURSES_VERSION_MAJOR)$(if $(NCURSES_SNAPSHOT_DATE),.$(NCURSES_SNAPSHOT_DATE))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
