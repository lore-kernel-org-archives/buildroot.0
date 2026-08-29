Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29ACC61DBE
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 11:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35B5E605C7;
	Sat, 29 Aug 2026 11:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u50p8eCGgj5d; Sat, 29 Aug 2026 11:13:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788001991;
	bh=bqrWtEs2C+HUfMuSnqA0Zw9rcLBd8FQgGVE928+eOrE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lzG760NH+ADh6mAgEyVlH752d4YWw8D527XzSsulRVwDlkgPMghn5nHJnC7Orv6kT
	 K4FjbKzEOm4dx/7xd6nnLTU5GGTLnRSJJIQQjG0GNrMLG5AN42VxU83YDy6tY1iP2A
	 A3NxZzprK30G9sYnLVX0n/UG/mP5TkLzvG0+NensFuQ62DlLsPCuKN3pjOxFv4dlUv
	 fIoHNg9hx6I9U+8N6z0zITmTHp9v74wXGboKyZ3JY0Hd9zCJzQWSW8gsJ0fTW326YH
	 o+gZ/DIMJcQJVpdAy0EP0aYSL2rAA4NZk7qrzfxeP2BWiNB6jJwg8d4x9wMqPhG3vd
	 4H7bp5vcGVhFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A977605D1;
	Sat, 29 Aug 2026 11:13:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DC2F118
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 11:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 343064009A
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 11:13:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ueMWMWFWE-iZ for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 11:13:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40e::;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=gYblPxFq
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40e::])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1464640052
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 11:13:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARZlW5uVvNhWgFbwxeG4rJDUiHCgFizKzFRChE9riMR8XFC2/U3H40uHNsm+1+wxyn6bU9+tzwbDAEc+8vNNCZ7fVnJb4v4Br5inuemX0xLQvrBWwtFLOBEPGpcUcN0uUdSnwctaowq7qeXXx7bqxxBKQ2C5gvSm0vK/DB0m5yPSWvDHHttr0jLIFDHEp/Ur7/ok7owubLi9qsiymAjwFZ0BKkHuey5K8jq3HWhSekznRTu0rZVufjpBE+ztZ4eBbdeoIU7fjovpihw6xH8u37fTkWzTz4MJOJxhzAqiABCTf15vZ1w8ImlXeAXSzdy+/banhGTvEwXbzSepqR8CCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R92ecapqWK/2sZg4bDkluK0p3MVtNyQ904UTUHwiUzI=;
 b=vLCKjtiCSmKWuH2G4huADUE/Sf090XEs2/vD9Q4X6GQzPM79N0K9KT9Z3w6Q6c9AupVkSgnfV7MYbFf9724v5L2hnaHEvM+dkBok1JulXK7pkwxju5QcGsPZSrRNdreIS+orbEFspwFaCnxWzfIz87tVIxj9/S2xXAG+Pf8iOMLZOATvbWTUMvVXJo1DP4iyYzmrXcOKUhTcrKSmVvFkWr7PEKDzQcz7Z9eSIRzf3Tpibf/go0MLy1NCqNfO9DUtG7z6ArWD/KC7tDlSTC1j8kJDNFG5/WTgjJsfyJZ4QMXgtEAonrWSuMHZj9B7kIPsNnJrJD/AbbR3xLXGCrYtJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R92ecapqWK/2sZg4bDkluK0p3MVtNyQ904UTUHwiUzI=;
 b=gYblPxFqEdND/q4udA1C9TDHwptpBIyfN0Na+YHXEW8dSDPMCOBODqxptGmF2wyyUSDjHSPKcl00rp7sBMzdmiIC8TQMWgxyTD5DBCZwtT/VE4YmR2jcGCzNoOjCh/R8KYDP0Sof0oypENLqnyqerezITHa9uOoRKM9XVAynXICDIyX7DtANxFp6YjmMfIH2BvbTGjpfFXiCo+n767whgVHb4Pb2aIHXyjZ4/6kb0FP+xJiNiU1UMPq7XGXgcu4GFQiS1/l/09UpZ20u7OieEykApfQZanDh8zOGFSl1KXFGQUouWEFoqdIA/9J+jJzpgBJCEvQO54NbqBEG5Vs6gg==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY0P300MB0708.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:27d::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.12; Sat, 29 Aug 2026 11:12:57 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 11:12:57 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 29 Aug 2026 19:12:09 +0800
Message-ID: <SY8P300MB0041EFD8D13BF20DAB3D61FCB5AB2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
X-Change-ID: 20260829-missing-toolchain-deps-cb57f97ceca4
X-ClientProxiedBy: TP0P295CA0015.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::13) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20260829-missing-toolchain-deps-v1-0-1c2b4919c455@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY0P300MB0708:EE_
X-MS-Office365-Filtering-Correlation-Id: a128ad9d-b8f4-4d17-0637-08df05be7b12
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|25010399006|41001999006|21061999006|6090799003|5062599005|5072599009|23021999003|19110799012|8060799015|24021099003|51005399006|15080799012|3412199025|440099028|26104999009|40105399003|2607281247196008|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjRlYjlxcjN3bkVaZWN5OHFHVk5RMnpjS0RBVm9UZDN4aXRUL3VXR1lKSSt6?=
 =?utf-8?B?RnAxMEE1RjduU1daLzhEeU1ldmlXY2FOSTUrMnJOUWhxRG5OTkFpelF2OFdR?=
 =?utf-8?B?ckJJYm5ySE1jTDNld3hCTTIzYkx5c0RpeDgwbGlYdU9lWHJqdWdWZlgzR1dO?=
 =?utf-8?B?WlVSNlNYZzBYUnc3YlFDNkxGVnNrK3JTTmtaczRvSVJVT3BCY01FOEVDQlJo?=
 =?utf-8?B?dzN4VjUzNUF6REZudjB0YlorZlRlQjc2RmhJelRnQldrcVM2elhWemFyWkND?=
 =?utf-8?B?NVdWQVJTdUtwN1NhSEMrcDZ0Z1FsVTBmT2ZxNElJcDB0L0ZoS3k2V3RUNWh1?=
 =?utf-8?B?NzM4dldBT2FIMDQyWnVDQ243RlhEaU45dGxMTnpMSzU2NEhtOGYxUU15MHll?=
 =?utf-8?B?ZHZNczdYazNlR0MxcFRKeTJ3bm9XOU9IZWI5K05rS282Y0l3aGNOT3BGWlpQ?=
 =?utf-8?B?Q0puMitJQkQydUFhM2pKN0JXaitFQXVaRWw2NVJDQjBTMG9KbUJ0V0JqSVRU?=
 =?utf-8?B?Q1R1K0ZIOWJOaWoxYVZweVRyQjRWZStpVkI5bGZpcmJtZXhuUWJpQ1BtL0pk?=
 =?utf-8?B?ZE1lNU9MVk0zZ2VQZEtpYTNCSkdhM3NHZGVyWUxIaWltTVZiSkViWCtzVXRU?=
 =?utf-8?B?Z1k3MDhJYTN5Vlh5REU1VGNhZnJ5UzlzYmFVTGg5endaMkZqWEk1bEdYMUYx?=
 =?utf-8?B?dVpoS2lDeVpjbUExMEFabSs5d3ZjUWFjZ1NLSTd4Zm43R2ZOd2VhblJRUlRB?=
 =?utf-8?B?UnMvVmIwZWZQd0RVU1lFQXg2WFBuZkFPK21LQkpVcFJmUXRObHdMV1g0cmZC?=
 =?utf-8?B?UktBdkZlSmlidHlVcGxuSktHbmcxeEpvQnJLMHZtK1FwV0pGRktHRjhyVjlB?=
 =?utf-8?B?Z3VGY2lySzc1bFU1TlJDUElqakJ2QmVZL2RuQm9PQXE0c2cwazRXK2NjbVBw?=
 =?utf-8?B?emo1YlZyNnN2ZCtveVdwNjlVMm9pOWdscVluNVk1YTZFdjdWNVd6aGVucGhM?=
 =?utf-8?B?U0pNRHpieldmZ0hESG9jR2VJaVhqcXRDdUtFbHVtS0gyQXZIY3N1UURXdHNW?=
 =?utf-8?B?cUlMb1B1K3h1TG5sTG02RjZJdi9aMlVhUWQwRnhKZnkyckFlcXVzRmJRTXgz?=
 =?utf-8?B?NTJGUVJDeEIrQ24zT2xNeHJWQ29VNmdQbjhVWEE1ZXhBR0pIUEU5czZRcGM3?=
 =?utf-8?B?SmlQS3FEanBkY2RVOW54b2NodmFBQnFUVTAvaG1KTGFGMWY1S1h5dkpzN2Vk?=
 =?utf-8?B?RHE3c2lOTWVWaXpGNVU0ck1zOUM4RmFmdzVmTWxsZE5ob3BVakZjVTNOT2N1?=
 =?utf-8?B?akhya1lIWXcvekRUb094MFM3VFY2SVNPTUhGMjVrUVh3Yis2QW1wNkhLakVa?=
 =?utf-8?B?aWlvUmpiZzFNTERTckNRcStFR3czdVhjN1RvOFMyeVR4L2FYdXFndDNCM0dy?=
 =?utf-8?Q?dU1aJoot?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1VvK0xhcTUyWUVBcVdFSzcva2tGWjBLYmpNazI4N0tLMUpxQVRVdzJJQXBM?=
 =?utf-8?B?elgrYW5TVElmV2dWMzIxOUtLSW13Y24zVVZTUmt2MjRJa08yRlIyZ0tac0I4?=
 =?utf-8?B?ZjB6MFhuNnRsOHM3UnJTNERnbFIweFNkZmlsQmZaOE9pT0hoSlhZM1Rtb0Q5?=
 =?utf-8?B?TE1zS0JwQWpPeXlTa1I0MnhLeDZQS1R5MnpDSFNzWEpHdnFpV0tyY1I2WnpV?=
 =?utf-8?B?aWlkcFg3Uy9IQXlTaDZxc1V1MmFZYk5lQVg1MTNIRm81SEVJczFXVzY3K0Nx?=
 =?utf-8?B?c0V0c1Jia2pLL3lUQUhxcFNYTEFSTWZuU2FQUll2THk0cjFVR1Y0TnpTWGc2?=
 =?utf-8?B?aStqMVVGT2poYnF4K0RGNjVYWE44Rmh5L0c2WEFlVDVuK1ZIWHJlaENycVJR?=
 =?utf-8?B?REZoS3l2YllpZDBkYnVXejI4Sk8zMEo5bk93UUZPYlo0M0RuZHc5NHlxcDRS?=
 =?utf-8?B?V0lQejl3UkZ1QVplZk5wQytNSlNlY0pQRVphQTA3SlpuOC93WXBkL1ZmT2xP?=
 =?utf-8?B?YTZSSS9jT0IxYnluM1J2V2Z3S0pKUlNvejd3SnNFdXpJNHZ5WGlMSGNJMThs?=
 =?utf-8?B?eVVKdHFTWllpTUorYll3eGttMGJyM28xS2U1MzA2SnJNbnYrR3lNSVVBVElK?=
 =?utf-8?B?UUN1UUo1UVhXdHYzMm5TdjRoMlJPanVEZUYrYVc1eGRaOStIL280WU9CVXdV?=
 =?utf-8?B?S3IrZDVJVmJhVzFTVFBuRXFtbU8wcHNaMGoyUVVjMlBYS2MxaDFaZnhsUDlD?=
 =?utf-8?B?bFdPR2t3U2RrZkM0WWNROVduQ3NqNVpxeUpTeWR6VGh3YXM5SzlrQkJ5a2xu?=
 =?utf-8?B?azRidHNtbGFKbm51azQyNEZaUnl6V1BUK0w0dnRiakNIZ1VRTW1saFBHZmRB?=
 =?utf-8?B?c2VVaEIybTBVZDFucGthSmpCWkUvWFp4K21VYnRicVkwRTl5bzN4d1FTVjA0?=
 =?utf-8?B?NEVXMXo2VFJabG5qamdaVDRtWGhhME5pbzdXVG96WU5NdFFLTCt6bHhPQXFZ?=
 =?utf-8?B?UjVWU2orNDBoYzZFYjliMUJSZVRLenNqaWtxRHRXdFJSZjdveld3Tm5HVUpB?=
 =?utf-8?B?MGRRNXpWVUtoNGJOUlVOZDlzeHJlUlVMcjBlZEd4SW51MGt0TVpZUnB1UDBF?=
 =?utf-8?B?OG1NSTJUdWpvZWljTCtPL2tXUXdtdFdLZ0ZtN01JcStEUW9sckdFYXVFYmtS?=
 =?utf-8?B?cGFZRzVhelc3b1R1WEE1Z3FBRTU2cWZxUmVPbGNhMEZNRnhJMVhFOEdBZFRT?=
 =?utf-8?B?QXg5UmNlQzR6YnhjN3htbGFwdHVaQ2FqUUFzb1h2NnluWCtCK1o3cnAybU9J?=
 =?utf-8?B?TS91MjBMUHZLS3RQWUhvdGFSV1R0dkJoaklpQkpRSy9BZjNibDV3ck1MTDNQ?=
 =?utf-8?B?V2tVSkZ3MGYrQnh5cVJpVlJCekc3NkdwN0plUEJqc0QwN1dOMmp3UExNMEE0?=
 =?utf-8?B?ME1VWWNtL3p3L0JTcTRPTW9sM1pDZkdBQVJwOGZHMGh3ekJIanpLRG92a0g2?=
 =?utf-8?B?MitzdUh5c1Mwenc3L0RrZEc5aGdUQnIzenhLU0huVHMydTBSbk5aZDAvRmdD?=
 =?utf-8?B?dXFLR1FMS2ZLcnIrOEY1WWR6SzhaYjF1bzBENnRxbGxhWXpxY200eUZ0ZHFz?=
 =?utf-8?B?cEFCTVRncTJaMG5YdUV5dTlaNS9DaHBGQ2J2enB4bTlocWN0SVB3ZXZEaWF5?=
 =?utf-8?B?b3JMWjJKSjJOd0ZBOEJKaEJ6dkNIdEo2b3hlb1dXN2JqbmF3b0xuK0l0bHZy?=
 =?utf-8?B?V1lObStVMExOQllkekxtMVJxYmR3dElweXZGdWFEUi94dUhZazkzT00wL0Nq?=
 =?utf-8?B?eldIam1TNnZpTDdxSEpYTDAyeDJKL1BVbzV0bytaa1ZUbGQzZUpGcUc2ZnRP?=
 =?utf-8?Q?JHHfzOW9xPwju?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a128ad9d-b8f4-4d17-0637-08df05be7b12
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 11:12:57.8053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY0P300MB0708
Subject: [Buildroot] [PATCH 0/3] support/scripts/gen-bootlin-toolchains: add
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

Hello all,

Buildroot supports both MMU and noMMU configurations for the m68k-68xxx,
riscv32-ilp32d, and xtensa-lx60 architectures. The configurations used
by Bootlin's toolchains-builder [1] do not explicitly set BR2_USE_MMU.
Instead, it is enabled through Buildroot's architecture-specific Kconfig
selections and defaults, as illustrated by the RISC-V configuration [2].
As a result, the corresponding Bootlin uClibc toolchains are built with
MMU support.

This can be confirmed by running, for example:

curl -fsSL 'https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--uclibc--stable-2025.08-1.tar.xz' \
| tar -xOJf - --wildcards --no-anchored 'uClibc_config.h' \
| grep -E '^#define __ARCH_(HAS|USE)_MMU__ 1$'

However, their generated Kconfig entries lack a BR2_USE_MMU dependency,
allowing them to be selected for noMMU targets. External toolchain
validation then fails with:

  MMU support available in C library, please enable BR2_USE_MMU

Patch 1 regenerates Config.in.options to bring it in sync with an
existing generator fix for duplicate BR2_TOOLCHAIN_HAS_THREADS
selections.

Patch 2 adds the missing BR2_USE_MMU dependencies for m68k-68xxx,
riscv32-ilp32d, and xtensa-lx60 to the generator script.

Patch 3 regenerates the Bootlin toolchain Kconfig and test cases using
the updated generator script from Patch 2.

This should address the immediate issue in Buildroot. A possible
longer-term solution would be to expose in the toolchain metadata
whether a toolchain requires MMU support, allowing the generator to
derive the dependency automatically.

Please let me know if I missed anything. Thanks a lot!

[1] https://github.com/bootlin/toolchains-builder
[2] https://gitlab.com/buildroot.org/buildroot/-/blob/83fc4aa55eeab8f6dab64e6fe26a04284fa73881/arch/Config.in.riscv#L73

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
Fengwei Tan (3):
      toolchain/toolchain-external/toolchain-external-bootlin: drop duplicate BR2_TOOLCHAIN_HAS_THREADS selections
      support/scripts/gen-bootlin-toolchains: add missing BR2_USE_MMU dependencies
      support/testing, toolchain/toolchain-external/toolchain-external-bootlin: regenerate after MMU dependency update

 support/scripts/gen-bootlin-toolchains             |   6 +-
 .../tests/toolchain/test_external_bootlin.py       |   8 +
 .../toolchain-external-bootlin/Config.in.options   | 460 +--------------------
 3 files changed, 28 insertions(+), 446 deletions(-)
---
base-commit: 83fc4aa55eeab8f6dab64e6fe26a04284fa73881
change-id: 20260829-missing-toolchain-deps-cb57f97ceca4

Best regards,
--  
Fengwei Tan <tfx2001@outlook.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
