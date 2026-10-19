Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B39CCA46C
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 04:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F30280C25;
	Mon, 19 Oct 2026 04:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28pD5197lCcw; Mon, 19 Oct 2026 04:24:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5DAEC80C6C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792383873;
	b=Orx3Kdc1j/hMP0tQIy9npeyWBuP4ZXdwi247lsPBYYyzjeklfUeNobct10AD3i/ECbqP
	 JYGHCiR47yuccp2+7No4p4Pe6dfkhawCng6Xq9iUKQH9W4sYXwnlk/6vfgrF9v8bPcl/6
	 VdsHrFG3bW7icNfopakeR5lJe2bx2sybBdr4srLuyp8C9j8sZQMzOOpzuQMohyAb4SbzT
	 mY/avopU2J8VNEstqpbgnfPGnzsZKc9MBkYi20WVZXDJUx0v7GMBtYAmiH/5kUTXHAJts
	 aI5oQfEWMv4xUFmpTujEsa9Yep9w92HM4zluudqNmpnz5f7sMBPBTD5NYn5dbrHrmeQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792383873;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=unk1+kbaXYnbQnem1zVaRRbBDTDECWAh7+HAGdn5Rxs=;
	b=EciVO0Zw37kvXXkjrmrMJE6t5/rDSYYmhqIZ/JL5ZAiJtlQ4RPT3l1S3h2IbVuK9Wvlq
	 oNlzYibO+hZxMFX38zN9/vgVq93JT+DZ3ELF64ZFMWyE+bAuIGZ2eI7j0LqlVwZdpffCq
	 5w00S8jDHNt+ipur2/D28qdJ6RRRTSG0p7x04JLlBE/6lSHmuNhbcbpbZ8L7WufhnNwGQ
	 Lq6GOyptIMzggm57EPaXikvCVoT7ADecaputQF4yZmd6HGCr6FU40JFzzeaEiUrEmTFgE
	 ArVdnRDKxeVvijZRuPN/JJgcPpAxlu8fzxBBZ1dP6eABtqiv8spi4jgTkyuV6VJSFlA==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792383873;
	bh=unk1+kbaXYnbQnem1zVaRRbBDTDECWAh7+HAGdn5Rxs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r91Pwm/lEf4q/MW8lgXpValMv24wSAuicej1p+XRvoHUECeAY/lVa00BagtZCfODs
	 c67xA2OLVSx+dmVAzCJtE4HdffnGbSZuAoJnXBlx57Vzqc/PWdYorGmnL/flt/rMfQ
	 mc8di5De6m/CeRRagNQV2kYb2VFTBL7pR/+NXKTWmf0DYXYNlF9X4w43tcQwL+kIVf
	 aqJ7nC0T/gc+sDUsqqEDSlyMpOnC5qI2O2372d/hBMoY9NN6xRn30kzlAc1ibMJSeB
	 KiKduoyeE0sqE/x8sWd+fkjBQdOkM+yfknYYIl8lLP0llwxiUCzpORyt5RmClxa4wi
	 cNGUi0Kpko12g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DAEC80C6C;
	Mon, 19 Oct 2026 04:24:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AE3C75
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 04:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C59C406C2
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 04:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ph_4Aj5LJznS for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 04:24:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2470A4061D
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40e::"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792383871;
 b=jo9rn52e5BLdRaFSarj5ygBCN3wGNIuYNaSatDKQ+OIvZSn6xQZ5DXSlxFiiaTvfy7zK
 qmL0+t16HpeGQYVy0FCfpiTVCYSG8KAxwE+2trvAn5KjnRD4F/Nj2UXUHf1JulYSlERww
 YFBPiDs/VDRoJKezkHyCMQFeNd3tO5eX0I+TsPFbIxRSQDmL9ZFXPwT7GquOeT77AKYpi
 VzliWXICE+o2zr54O4o9e3vcoDVBHe4vlvXoJPd6A9yQEd7IM+d4eHhoHe86UbdKR7/xG
 cASWOGoUg7AffXjdzxF1kgg6ZxPO4gScEja2qRfJlZmHeAPMPufols4XDecQNwYUwgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792383871;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
 X-Microsoft-Antispam-Message-Info:
 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
 X-MS-Exchange-CrossTenant-FromEntityHeader:
 X-MS-Exchange-CrossTenant-Id:
 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=K1cFlnR1U5P0kCekEedhcHx0+ztonxeKTNMvcU/CZgE=;
 b=Dzb7HmoBsJyjxvD7663bbewnhxVwJwQtEcLhE6j3E4TEWDGM9NmSlFT/68K7bHWsZgQI
 Ef6f3yOOxFUprhx33RHxep95Qg9o5t6b+3mjWV4ya/zsFD/2KWRCFcBHFCbNGsERvdgLt
 BREMYawZxm6eFm+hGI2X4q7EtBDX/qP2JwfcRLMIi8KpY1mAks6Ha1D+NrCNgxe+ExI5n
 BOihx0vKQ1xyMEG1G0j4o8W+Xg6ofJXSec20UWT7eXSRC5ugpsJ3jgQfvdc8nvzrJgmj2
 XwPLAWwx3+4hSMtGGRfiyF8NuGyIPLsOtAGwSFqPkGKmUYDl2b71q21m5bJlcbWJ23g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
 dmarc=pass header.from=outlook.com;
 dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=di79UMbM; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:d40e::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40e::;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=di79UMbM
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40e::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2470A4061D
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 04:24:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/Nm4HXG9XEFMnPPYtKraHyih22FDbgUrus36LUmrGPD6Ltcn/LcDGzCxuPnLhAmtzbjQQi/GTknKQJTVALzn4DaZcm59CWg9xlhDEfKXNLBenZ1o+Ab3mc5RgCvYagmYjzPcI5eyP0yL85mbs6+bOnKC++7hcIZbZ5fc53axsrHMHV7ocblXhexgPfe7zZ6/m+Wki70DnwNMBNwp2slt7OP+v9XhLY4PhnP8K5p3iXmixWHBBWTXeGjJOfGcxEQswly8vgN+8dkoESoaOd9GwSDELAqm4BEpF+0NjRS/+eInWE+ewJTiKXbX8wDKrBaZ44wRsFiG7uPPUB0PxBSYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1cFlnR1U5P0kCekEedhcHx0+ztonxeKTNMvcU/CZgE=;
 b=Jv+R5qd0pfI4oIP33t5FvpSmpDkhWgDw8VxmhPYm0vqSoJFIgbuBae9AA0zfl3oZ+7n4FpNkzieILEhrICNLXoFFYXdyNJYF8ZwyrhrzYYc3V6RvBLCS6MDayt0gnShDnpeQifUQXSEMetL0PxZiqMRreFuF6P6xpfM7spwsfNEaMQ7g9PkzjsEFuv2BJ3Da2E9vHkwDPjVysJOI94QnmVfJfAJJFQtlgjt3zm+DFIc55wRPSwNk3lDnsEtECiMzy1DtqipXJTz8hpIscrodkBduruI53MK6JfYLCjbFNgszEY4R+UG1lOQ4BeX2il3XFm56WPUlRpz93acCOsPAhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1cFlnR1U5P0kCekEedhcHx0+ztonxeKTNMvcU/CZgE=;
 b=di79UMbMf4bfLJKIIEPKHPpvJ6UqOkKrv9zxmrhuATMG1dFV5r/HcmDB0sOJ+mrGCs4QCH46rfzymasjBcgGvhd+/3cuHCSNchzzKRGxIOsMAjxEns7K2GonP4k4OOC2GdCCzk5klFnEoVsg6npJrscbUFUbgfVISfL+zCNuMpMayDpLzTH0LFLhdyHCA8Q1ylq2X39kmgtt5uY62mXFD3nRKKHMlzmYboplY8/NJBhaOF/hppRV6To8+p1kJVz3D7lJVGraT5iD1bJoUqZieNDM6J4H5bZ1Cup2ZHEUppBv4F+zUjOcZFS9cubT8kWja9b+ArJ1u+YpKo1CHUBvfA==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY7P300MB0083.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:239::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.19; Mon, 19 Oct 2026 04:24:19 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 04:24:19 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Mon, 19 Oct 2026 12:24:00 +0800
Message-ID: <SY8P300MB0041329F1DE99C028DCA8064B5982@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
X-ClientProxiedBy: TPYP295CA0030.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::16) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261019042400.2768229-1-tfx2001@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY7P300MB0083:EE_
X-MS-Office365-Filtering-Correlation-Id: cf3ce880-3c00-419c-7eb5-08df2d98d7aa
X-MS-Exchange-SLBlob-MailProps: Z9TzpHVL8qo66q/I2BQDGqmFnMul9MvFgsZKyKYmmRESTS0j2A8wlh4e+YoYFB8tlu4Br/U5875rdkO+yZy8FazrUIms5+KosT/lTnX+cyaqHjnJStLmF1qZX5kVpvn10eYstyJZb98rO8wFqLvwgqEPsgnJK+RtA0e4aaaOqIvhuDkFcV5iMzAMI6a/N/DR3XR32TU9nbT/yMzV3AeVsAL3rcAqArDSpwkno0/LmaaEfm7nUU5Wak3Y+a9foZgH9QeCnwoVuiE0ffXKVpnRsca3a1h13lJdW5gHSzy5I66mqvylf0y9R80RgcD1utNqq9iP5Bic/BBz4jnVHPJVFFrbv6yvmH19nNTNifoBVQKegnl0uttcsSLAVISk/fkpV+jPviggoUVpIMow71yVFVsvh7BGQ/yuZjaxuBvcXUY40Oeu0HVkxHmEIiNUUROXLZNCcDwEB5aLsy8k3S3f3zU3ad+aLHrQTFHxyLOyi/p1YrvxRthrarSy+i/bdnQjIRrgo7VaXo2DNVNHu5xrsPbtezjYsp0ecM4EYcgkxMT5K/J04aobjKENxbRCoJ+d9E7N1/6oh3I2AiRiJ+EeusYok7t/jCMfSItVNicLX4ettY/XnJ/L+o5iRE4AOnNET63FFOLJqhOAXx1OWUz0c6VfuH1GChEQJg572yVgzSYlxH0OKkXFtwwNE0YGdKK3r8Cj23J8Bgd/wj+n7rYqfC4HiDGE93ygTpvNXdF5CRhFl8kPOgzuhvWH18FnNN7CTkA02Ed187RG4YBj3xwU8aPo/fbFpm2q0TqAf+T0aOJtDVKU8pPnpxXwoAOKXv88Y4UhP8W92rtz7nZFQcGz5vjckOhK6gs7TItl6iBfyzKuig40IelFbQ==
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|260925184616899003|8060799015|19110799012|12121999013|51005399006|24021099003|25010399006|15080799012|5062599005|23021999003|5072599009|41001999006|40105399003|1602099012|10035399007|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L5CDLSzcUkWvy0SdzlSurrPanjmgqbYlqneidhMINK0IyHv/RLeNo/k5/d3O?=
 =?us-ascii?Q?3SKeNOV/RvsJCPKTz7MOKPwIhPynuk2DmAymC+K5SbcmyO+muZdSJxZ+Qw/h?=
 =?us-ascii?Q?p0sRNXkzu5dthSirf9U+s+LC/Cgzr/pfC79mGzznH+k51dXlZh8kIzL+5IbL?=
 =?us-ascii?Q?EbvcKbLVtVA9GaCrNw5CfzTOJSlGwoJufdLbuOQRyWexmpQlHcMP/cpvechQ?=
 =?us-ascii?Q?IRYBUr8gbUPPkmWBJjQFlU+ZM8zADOVS3Cu4xkrnNLkHGxnCbY/+ZKoOQH8+?=
 =?us-ascii?Q?s4xUrPxW80PyORz8YFZxwfrpxrmSi9digZILSce0ohSjQ26Da76md49AdttK?=
 =?us-ascii?Q?YQRZCQ3gSeSojrEYYMCsogVm+GhL2uhuoytMkTUaltJZGS8aKo512Qrh2kKO?=
 =?us-ascii?Q?9mQAw09I71nbPUN8HHr1LTqgq47bgozSTLe4ZQ9KdkwQPpZOuDi8WVmsx6AK?=
 =?us-ascii?Q?MwSNCwOC7Wx/1j6d03t2lYOuX/4m8epwyjKKxTuU5M9nZsl/xGTbNw6TfsGx?=
 =?us-ascii?Q?rT3fQ8FxpIrODRHKH8rFfAVgIUC4YPerBSJ0Hqb9RrlzDO5+9jr1duFREKia?=
 =?us-ascii?Q?x60CC5QqiGI826H4e1h7L57+c7sry4FbtGw0pJbqfPGXcHVImk0At4x5d0Cc?=
 =?us-ascii?Q?IENqhJePUXCe6QPwDGvjSZcjPDqjBgD0xBoi7+M0Ds/tzs2PemBZCCvgIOnN?=
 =?us-ascii?Q?3Kmi65KqBlTTYvxYWQlEFYaSxFRveuCggf32Dj+ZQMtbpcex/Y2iI2eWx8OW?=
 =?us-ascii?Q?bJI3qs4zn9nmTxo7DLRlDCHHYUHEBIfQbS6fN9/0HRozOUe5j2AWRDG2fhOa?=
 =?us-ascii?Q?t7XHXieauQVKv/f4+cj5Zh/Ow/u/Lx8AumtJKKHP7eTxG1w9SRc3ZVXApVNl?=
 =?us-ascii?Q?Z+JlQZ07EIbCqWaEbuayDYo79NranRIrRugh/m7iqPNmTkbpDdsA9DgYdlQm?=
 =?us-ascii?Q?HINNj2Gj4UFOg8nFCeqoFJkR+08mWpyBa+7uBtKqo2mC5FGBHqyR+Z4jQiPN?=
 =?us-ascii?Q?pMFUGbGOgROmA26XxNCIXcQXum8Q+1DL0vo/vT9XQeKvJRWCyETmhxtlFRth?=
 =?us-ascii?Q?49AHeh57df2RtqHFS+MVyufhUW8vJly6EQRaiwoDYe0+/nE31YE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lhoJGeY2DyUXdM2EAtyPF5DQQ4DHS/Ai93n17U/P3EC0TX/GLf3F5tvXiI+P?=
 =?us-ascii?Q?GE/6yGspqJUEMFMilnPszk6XauXtZq0zPPSS/rKU5nsmEttFLaXNc8ubBqrk?=
 =?us-ascii?Q?6XFWqnIo4pSj4Hctgmu1nOFzNuF3X2Ek0ehy+zsVZhbLZwh0n7iO4KryFxZF?=
 =?us-ascii?Q?pG1kqns4fPLpwZdZ9MnnJ2JUixS0PZphRaeD/2Wn8c6ADxt21qN2Pp8S34Mz?=
 =?us-ascii?Q?VMrc55S+1v6Z9bLAFr23+DOHs7sR6TKDj8hzowmh3fIy3Aop/8HFuAvJitqS?=
 =?us-ascii?Q?jXl4y4pHzPk0FFjKjeruxsL7bWgNXQ6U6FrjT4jqEURABdFkaSA4l25uv/oC?=
 =?us-ascii?Q?gLIObwGfcPIMqtkBsymlRxgNmdVM3bhS1mA5rIkx13i5AW0OLDOL7owvJSYu?=
 =?us-ascii?Q?ZPlb31I3xxT8lUqAH/+DOvP7aWJzJCFaUCnvHXudpPFABPuQrALwm7Mci3bH?=
 =?us-ascii?Q?3v07MLFS1oWSOPpSkFO6X/ETXR0FrZwsLMeuwhKMytkVPO6HllM/pZ7dXl5O?=
 =?us-ascii?Q?rXcGfGJwE6beYp+vTS2UEN0fmWMWNeywv4y4Jui2zr3GrEioSHBlwiqXu8V3?=
 =?us-ascii?Q?gBBHzTaKuBg53CRqKfaen5qvoxomGseigVN5G1HIYnIpHMmCQhoyL3hYCEkQ?=
 =?us-ascii?Q?fM53noa3qBkOkojXy2MqWq6sgQ26QK+ZjpMTvA5sJZbirnAfDEN3oFMgQYXG?=
 =?us-ascii?Q?U0OdVtu+YDCLTlnesd5czpHfQKS7QPe5EixTtgOZ79Bm67wwyyqWoJ4HOXUl?=
 =?us-ascii?Q?dGMoSwfmjRefCx+CTarIm+sM3evh7kamzOzq8Fe4rxeEPYKbFjpsjGGNJgqK?=
 =?us-ascii?Q?A/dZFi/BtlQU7wvEwssHvmoZKSvtjPIxAjwux6Uzgsqsye/2WegNNV5IV3aU?=
 =?us-ascii?Q?vOz1+5k/WLKsvmgFwCtxdfiXGZAEGWKSegsKAO5h9VL9Mq5ZXmAY/xD8MTWb?=
 =?us-ascii?Q?kD4cg1sg/ePC00TO/HMi2aM99YzYEvSg/gMinWoOETrMNfcDLq3y/mp4c3O9?=
 =?us-ascii?Q?1exfwpKxLkgR/zBqQPMM2P7t9yafR1URmhBEa8V+jQTKglm9hm39viDPP43i?=
 =?us-ascii?Q?yDsS12krUdeAq7r22R8T1oJx9qqa17z0PolHn0rz/dugJCbK5LDyAmgfwnGF?=
 =?us-ascii?Q?KhSaR/Q8JFqdH7ugcQtYXeP4tzgJjBX3lTTmkr0Wb1mKKvsjZ7KbLqlxUp/Z?=
 =?us-ascii?Q?Gi1RIaZbenaitVJFMbW2Qd1woZX0QoJvC2Ppgoy3UflMHBJZEYjK35Md0iem?=
 =?us-ascii?Q?VworJ8QEAVXlAga8eApcbI8QgxiQ8rmnSD9Tj4rFjejCz7o7wy8MjJmSDBFe?=
 =?us-ascii?Q?aELkbm8Xlot3wlNrHUi+9qTSKb7ht5hgO/lT2CYnQvPGQOYygKdYfPJy4h5q?=
 =?us-ascii?Q?FhKhizZMeyhPkKb5pyTUmGk6jt5V?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3ce880-3c00-419c-7eb5-08df2d98d7aa
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 04:24:18.9706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB0083
Subject: [Buildroot] [PATCH v2] package/btop: fix build failure on ARM
 Thumb-1 target
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

Add a patch to add CMake compile test for -fstack-clash-protection, only
enabling the flag when the test succeeds.

Fixes: https://autobuild.buildroot.org/results/573e0fc3178f8c9a0583bf86a678caa775410ef2/
Fixes: a7d47860f323 ("package/btop: new package")
Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
Changes in v2:
- Add Fixes trailer pointing to the commit introducing the issue
- Link to v1: https://patch.msgid.link/SY8P300MB0041CF44C55A5BC134A52D6EB5992@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
---
 ...compile-test-for-fstack-clash-protec.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/btop/0001-build-cmake-add-compile-test-for-fstack-clash-protec.patch

diff --git a/package/btop/0001-build-cmake-add-compile-test-for-fstack-clash-protec.patch b/package/btop/0001-build-cmake-add-compile-test-for-fstack-clash-protec.patch
new file mode 100644
index 000000000000..b26a55069869
--- /dev/null
+++ b/package/btop/0001-build-cmake-add-compile-test-for-fstack-clash-protec.patch
@@ -0,0 +1,56 @@
+From f7b5ba16d3662ca036c6b1724fe741b28f29106a Mon Sep 17 00:00:00 2001
+From: Fengwei Tan <tfx2001@outlook.com>
+Date: Sun, 18 Oct 2026 16:37:11 +0800
+Subject: [PATCH] build(cmake): add compile test for -fstack-clash-protection
+
+On ARM Thumb-1 targets, GCC front end accepts -fstack-clash-protection,
+but fails to compile actual code:
+
+  format.h:960:36: sorry, unimplemented: '-fstack-check=specific' for Thumb-1
+
+Add a compile test with large stack allocation to trigger the compiler
+to emit stack-clash protection code, verifying whether the flag works
+correctly.
+
+Apple Clang ignores -fstack-clash-protection and emits a warning, so
+skip this flag on Apple platforms.
+
+Upstream: https://github.com/aristocratos/btop/pull/1918
+Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
+---
+ CMakeLists.txt | 17 +++++++++++++++--
+ 1 file changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 3398196..0be6365 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -134,10 +134,23 @@ endif()
+ target_compile_options(libbtop PUBLIC -Wall -Wextra -Wpedantic)
+ 
+ include(CheckCXXCompilerFlag)
+-
+-if(NOT APPLE)
++include(CMakePushCheckState)
++
++cmake_push_check_state(RESET)
++set(CMAKE_REQUIRED_FLAGS "-fstack-clash-protection")
++check_cxx_source_compiles("
++  int main(int argc, char *argv[]) {
++    char buf[16384], *src = argv[0], *dst = buf;
++    while ((*dst++ = *src++) != 0) {}
++    return buf[argc];
++  }
++" HAS_FSTACK_CLASH_PROTECTION)
++cmake_pop_check_state()
++
++if(NOT APPLE AND HAS_FSTACK_CLASH_PROTECTION)
+   target_compile_options(libbtop PUBLIC -fstack-clash-protection)
+ endif()
++
+ check_cxx_compiler_flag(-fstack-protector HAS_FSTACK_PROTECTOR)
+ if(HAS_FSTACK_PROTECTOR)
+   target_compile_options(libbtop PUBLIC -fstack-protector)
+-- 
+2.56.0
+
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
