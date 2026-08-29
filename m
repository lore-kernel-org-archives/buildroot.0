Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ABDC61DC4
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 11:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3061860628;
	Sat, 29 Aug 2026 11:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3eh2lN6SmQH; Sat, 29 Aug 2026 11:13:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788001993;
	bh=UzrpLaIX+rOhQ3weWJJgHRe5HdvfbsJcdwsPD6X+SSw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SMlBZjPAzUhPYm8VRB6yCIt/zhO0CUU+PdWhulFj/LU3PaKSVHGd2B5E8ZVtgvBNw
	 ITKl0MuWWGnD/KO14S/rbd+L0KDzp0GCCQWFqLuhed2u8S0gvAd5xZrHMaIhtepWOp
	 3mnzGa9V7HvDvfiSm5l3x3L86BTDtBxmpm3TADd4JgIUNaE8FmGIsce2p/I/uNAFrm
	 MB0agDXFv9vylYGGGGCkvP3r8pWX6p6Ses0NZ7INeesQJlYlLCzvIiU2lkHaNFBWJh
	 fMu8UmQNuUY+SuEKUxHx11yTTuHly1Iv+aFv0y/AaSKMFur2+UQb79mL3lETVoAYBl
	 fGqdF6C4HQY/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50BAA60629;
	Sat, 29 Aug 2026 11:13:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C4598334
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 11:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAF96400A5
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 11:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPaWsTssAuvn for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 11:13:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40e::;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=JFk2AnrW
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40e::])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFA2540052
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 11:13:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/XpYsV66jrrsBZnJhgn3Teq61uOXhkyH1sjCHlEyhRXxaM4+8Cw2OqB61rxSCZ3w3FHGgqiNif6rE7dqEiqSyxpg9OyRbbhBCP137/ZlpS+Qa+xVzWpqhn00Pi3yw4PlihM895YFpdZFKfI5gYFlC+rJfi1RHFAD6XZAwiNFP7OaQBaWsh7XjKA+eKoUkC+hYciHVvSKsiJmCOJT/PWn79XvvCiXGJG/2Hbvohf80U21OQ8g55DtUnsXd9g00XyqJF6bZr+s9Np3QZWypzdWBRz4LSY/iJ3QWfsrSfztSENfKXfJmz82tQWz9CbZWx3lwxf72JuCWG2JmlNMFrWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GegGT8GYok6PMBliIdJsPoNPe/6yZ6URrQz5Hy8IWiU=;
 b=sA7Y5A+aKmEJULgfHAc/+pBDeQngEU8MYprY6YNq398P6rCIoSC9e4NIiFHpo6v3mv9ELuqWA1Tga2vkKDUFbiWXj7B0xexGJEIAw6ySLB3ZOn9oE8mGJd9wcibsr9d6noFFiem1y3GeLWxIDVWWlI1rcrKWebcWUpye1TjVsUHfXByV1HQwJMe4uqDX6ffcjl7EcGxVK03feJ+4ITzTgPWIkljOXxaze6tQBjPCmddJbEY+Xh7OsZILhwy/68MwoIjrOvq3ht0MRLkR52OK7ZezHuFkBTNGcFNGzr8+AfkqYA4nLfhVdVIwVup5/ADOOjKpO/evemwYdw6nCojxfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GegGT8GYok6PMBliIdJsPoNPe/6yZ6URrQz5Hy8IWiU=;
 b=JFk2AnrWKncF9Wzhkl48oIXxKhxE0ttTua3ctSGzE4pWZ1pKnUvpsds/nLfGZiQVWBTriv+cqfgjY/JOXF6DmqwScWVYkSUtUa6RxhOl69UJN6cYtkrxR9CS7z438E6zbYRlkpJuob0M2Mp0ktCIX18Tr5Aregm+dsdQyf9SaWc5dZZHyDgEbo/er/6I5WF3d2HD91tZ0GKXmvR0tXUW9xtFxiE0JCT6kzjolV7uNyjyXvHruL+5jICny89RC9apSk5Hb7YM+9QTilAjuWGrAAgUO+Dgn78JX0B/p4Lv7OvEkuFI6d6M1qC+0WUCDfTPE8qh7yKmzEw6lfbseSqqIA==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY0P300MB0708.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:27d::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.12; Sat, 29 Aug 2026 11:13:03 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 11:13:03 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 29 Aug 2026 19:12:11 +0800
Message-ID: <SY8P300MB0041672EF4D2FB7673811ABBB5AB2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <SY8P300MB0041EFD8D13BF20DAB3D61FCB5AB2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB0041EFD8D13BF20DAB3D61FCB5AB2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-ClientProxiedBy: TP0P295CA0015.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::13) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20260829-missing-toolchain-deps-v1-2-1c2b4919c455@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY0P300MB0708:EE_
X-MS-Office365-Filtering-Correlation-Id: 396b45c1-2d93-4137-bb18-08df05be7e42
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|25010399006|21061999006|6090799003|5072599009|23021999003|19110799012|8060799015|24021099003|51005399006|15080799012|3412199025|440099028|26104999009|40105399003|2607281247196008|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckNJYW1jN0N2WU1JT2FCd0lMN0hYOHpqWmFEOXVwc1Nld0ZFZkpWSTg4TmYy?=
 =?utf-8?B?Ty9Cb2pVdmY5bk1ZNkNiczJkRFJwTmVOZzkyV00vaFBCMnQ5N3ZUWm5tbk9U?=
 =?utf-8?B?aEs2WmdhZHZwRFQ0cElnVGtSMEZxWko5MndnTWdpV2drRlpBS3Z3MWNjZXhG?=
 =?utf-8?B?bDhBdnFacVlhMGJkak43YTNmWjJ5dlM3cnQ4SFdISDFJVWljTDJqdGVtSFNu?=
 =?utf-8?B?bnhIbHJ1UmQ2ZDgxT2h6TG1DakpGaklxbmkwQzlRSXN0aHRpNlJjaDZZUjJG?=
 =?utf-8?B?VHduTU5GeEtVUUVwazg0WDA0TzlzSWVpcUdXMTBQcHFzTUtmS2RvWHBxYmRT?=
 =?utf-8?B?M0t3SG9sMzhrNjNqN1ZwL0t4MmZvUlcxaG42TmhoZXJwNmUwaHdHcDB6VXVS?=
 =?utf-8?B?WFZJcjRTOW1FUmlKRFFGY3daZGI4bUUweGJyVUNXN1J5VURqZURNZnEvcTBJ?=
 =?utf-8?B?UnZJc2FOM1hOc3F2Y1ZpTGZLNW1jMjNMWEZrbVlRVi9Da0t3R0JneGRzOVlX?=
 =?utf-8?B?UzhIUUVrb1AwbHJXZVd1d0FUdEFNM0FWOXN5MllVQWhZRmFCVEtSUFU0WW9Q?=
 =?utf-8?B?bXN0YjQ3M1dUNVZCZ0JBNmRZZnpva01iUXNmZDNqbjl3Zy8zZk0xNjdCQ1Z4?=
 =?utf-8?B?bEtXV1Bsb1RJa2ZWYzNDdHcya1lHekJKS0JyM3FKL3AwY2ZRY25JaEo3d3dI?=
 =?utf-8?B?SFhudWpJenFCVERqdDhWbTgwcmxwT1gyT21Uc0JHeXowZjRHdDFrelMvdGFG?=
 =?utf-8?B?NzRqNnFsNko5VGRKVm44VUxmbVRzRzdIbXY3T0kzVW9ObkhmT2QwUjdLUXN0?=
 =?utf-8?B?d01tOCsxZjV4dG52YVpuLzBiaDhzazNENFFqbE9maCtzUDRRUXFyUlVQZ0Na?=
 =?utf-8?B?R21UWkhkenpQdk1FdUUya3MrcUpsakdYaHA4THk4ZVVBVHFxSEhzNVhVaG85?=
 =?utf-8?B?YW5kQXBYa0NlcFp1WGFLWG5NYkVRSHdnMVRGVGNyVW5jVUs2T0taOFBCVnNq?=
 =?utf-8?B?bkhCTDRWOW9rU1VsaWxqSmxubDZsUnR5SXQ5U3Z4bjcxeGpoRUpwMEp5T3J5?=
 =?utf-8?B?WWprK3I5N3FyK3YvNXZ0QnY2b1RkWEFMVk5DS00zK0hYZmsyc2dncUdxbE5I?=
 =?utf-8?B?eTNheVB3dkdFWFduN1kzblpHQXpyUHFiTUFzbXZiVTNSWTR4Q1BUZjAzTXgw?=
 =?utf-8?B?SmpScDBPNjlsdmQ4emlsTm55U0RFamhiR056NEJGMkZIc3NtOHZvWXpETERS?=
 =?utf-8?B?enR5d2V3Z1ZqcVJFRVNaRW9NRWlzbWsrU0h5T1FTVnJTc0V3eENKRFlwLzJP?=
 =?utf-8?B?RHgrMXhCc1M5SWZoZGYwUVl0b0tINjFFOXM4V2hiUnNzayt5R0JITHRkaHZo?=
 =?utf-8?B?VGhIN0JwWFdKTmc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHN5MVVrZ1JOeGhsY3p4YlFsd2lqSnFTV1VxT25ZWEZiUENUQkxaa21Nci85?=
 =?utf-8?B?RVpYTHI0NE5KY1FYVm5uNmVqMDd6NmVNaVUrc3lnbUhJVlRDNS81OGM2K3ND?=
 =?utf-8?B?WDJXNjF3UmVWOWxIdmtuWWltZkx6RXAxdG1BVWhoYTNqRE00V0lHKzNiWCt5?=
 =?utf-8?B?dDVBQUt5RWlaU3gwTWZFUUZTVnk3TTdsdEp6RytueDQwSXM4azlxT2c5MnVt?=
 =?utf-8?B?L282ekFTMzFUY2NUdWFJZ1hLMzVSWFE2WE5NNDRjelRkSHdQUEpnVjBIcWJp?=
 =?utf-8?B?TVBEZDhSQnJxTmUrT0prellRVVhMVzJPSitPMndPalR3ZHhHYlZaWGs2ekEy?=
 =?utf-8?B?Mm1TTnB1Q3NiSVhmcjJuMGh5Wm9Va3hUZ21ZWlZPQTVlb1EwcGpPK1FnSmt1?=
 =?utf-8?B?MmNpSHJ5blJQcGdRVU41KzZRaDRJSWo5emQ1bnhPbTRSR0xUMTZIS05OUnlh?=
 =?utf-8?B?Qm5aUHlteG1jSllzRjlpTU1HWVIyellVaXlXT2xyRXg1M2R6YWJ0SGVJczBY?=
 =?utf-8?B?d1d4YWhHZWJseU1ueXl4eHVCK1dGZ2NDTkRKSjNVNFZOejBSNUhZcUJ3dmlj?=
 =?utf-8?B?RTA1UjJlZjFtZVFOdStzSnFKSDVUOExsVy9LallSVC91WEM3MmlZZk5SZ3JL?=
 =?utf-8?B?c3V4RGlMM3hTYW9JNEJBblNteENkQ1I0RERhQTRVOFlFU2M4QlZLYkpZVThO?=
 =?utf-8?B?YVZVdXhnb0QwaGM3TDVEMkVhZXB4d1h3eEF3QjV1YjRXK1IvRmc5VlR3czA1?=
 =?utf-8?B?WERNd2ZpbHBEa1dLMUpFMWJlRVBNTFVRdUoyazMrRDVNdFBOY3RXVmYxRFVR?=
 =?utf-8?B?VUJwaWM2VGhNK1ZHYzVLVlNXaGxuelJZZW9oYzExYnl5ZHoxUk5LZTNFMkln?=
 =?utf-8?B?TTRYa3cvUDlRSGxuSnZZT09RNGQzcWhYOUtQdm4vY1VjQVlmWDRVWG1abkpz?=
 =?utf-8?B?WjRINzdXTk9BbytkOXJaWmZFNXhyZmtYOHZLQXJmVDAwSXhNeGFKK082UU5m?=
 =?utf-8?B?YWZsT2srNHZsbW9kRVVOay9JdGhHLzkxZmxCWnRiZUNOQmpVUCtiMzFWekRz?=
 =?utf-8?B?bjVKSjMwU3FWbEo1eVFFU1JaVmd3ZVFXbGdHWW9qNVgwZ2E5M0hueEdQWGFT?=
 =?utf-8?B?MDV5d0IrRWl6QytMTDVDbW9MaXlLbm1KK3dGa1lhQWpCNzU4dEgzWW51N3cw?=
 =?utf-8?B?WGlqeVJZQXdBSHRsSHFwM1R0b0R0czVnWUJrRDJEWlpqUWp0bERVZjVoUGRJ?=
 =?utf-8?B?TnJibU1DU2RBUndnR3FKeWZ3NGQ3aUVWSU5KdXZFenM2UmNjUGpieXlCeFBS?=
 =?utf-8?B?WGFTaGlReWprRHByTEdrdE05K0syclgxT1UweGFrMERSQmJNZ29zVWJNWnhB?=
 =?utf-8?B?bkt3VDgyMWdkTjRUVDR6UjBaV2M3R3MzeWZPc1QrV1lEY0JQc1k0eGM5YU92?=
 =?utf-8?B?eFQ0NFZWTndMN3lYSnpKRXpSMnlmN0pmakVvM0FEZTh0aERoTG1rR3lXakN6?=
 =?utf-8?B?cWNOM3RHdnkrY2tIQjhTdnVzZ3VIQWFXellwdWNsSXRoTnAvSmxJSWZJalFQ?=
 =?utf-8?B?cytCSFEybExvQ2lxSWJuaXdqNXhlZWpUSUJremN0SFNlMWZHQ0ltOHpvSW00?=
 =?utf-8?B?TVJjbW0xNjBnZFNQTUVGOG9vNGpFUUxLbE02Y2lTVUJmSUJUMUpqVkx1UjZu?=
 =?utf-8?B?U25uVVNKSWV3eWdJSzZoOTFwWUZrTWVqWDJnZHdjNDZ4VXRqSUpnZWFta0hX?=
 =?utf-8?B?WTF2Ri9UYUN0eXFsQ1lOd0tIbFNaY29CTDMrRkpUaWpyTG82czFqbW5KZ09F?=
 =?utf-8?B?OGdzcmt3emsvaHZXMzl1WEVvOVliblo1dElST1NNTVdUYno4ZVUrQkFJMUww?=
 =?utf-8?Q?vZtVCLYaXFVOs?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 396b45c1-2d93-4137-bb18-08df05be7e42
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 11:13:03.2594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY0P300MB0708
Subject: [Buildroot] [PATCH 2/3] support/scripts/gen-bootlin-toolchains: add
 missing BR2_USE_MMU dependencies
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Bootlin uClibc toolchains for m68k-68xxx, riscv32-ilp32d, and
xtensa-lx60 require an MMU. However, their generated Kconfig entries
lack a BR2_USE_MMU dependency, allowing them to be selected for noMMU
configurations. External toolchain validation then fails with:

  MMU support available in C library, please enable BR2_USE_MMU

Add the missing BR2_USE_MMU dependencies for these architectures to
prevent them from being selected for noMMU targets.

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 support/scripts/gen-bootlin-toolchains | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 75fa2c7e0f..4579949d18 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -68,7 +68,7 @@ arches = {
         'prefix': 'arm',
     },
     'm68k-68xxx': {
-        'conditions': ['BR2_m68k_m68k'],
+        'conditions': ['BR2_m68k_m68k', 'BR2_USE_MMU'],
         'test_options': ['BR2_m68k', 'BR2_m68k_68040'],
         'prefix': 'm68k',
     },
@@ -156,7 +156,7 @@ arches = {
         'prefix': 'powerpc64le',
     },
     'riscv32-ilp32d': {
-        'conditions': ['BR2_riscv', 'BR2_riscv_g', 'BR2_RISCV_32', 'BR2_RISCV_ABI_ILP32D'],
+        'conditions': ['BR2_riscv', 'BR2_riscv_g', 'BR2_RISCV_32', 'BR2_RISCV_ABI_ILP32D', 'BR2_USE_MMU'],
         'prefix': 'riscv32',
     },
     'riscv64-lp64d': {
@@ -269,7 +269,7 @@ arches = {
         'prefix': 'i686',
     },
     'xtensa-lx60': {
-        'conditions': ['BR2_xtensa', 'BR2_XTENSA_CUSTOM', 'BR2_XTENSA_LITTLE_ENDIAN'],
+        'conditions': ['BR2_xtensa', 'BR2_XTENSA_CUSTOM', 'BR2_XTENSA_LITTLE_ENDIAN', 'BR2_USE_MMU'],
         'prefix': 'xtensa',
     },
 }

-- 
2.55.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
