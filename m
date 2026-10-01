Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2E1CA5FD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 12:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6498240D7E;
	Thu,  1 Oct 2026 12:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvLG3e2fyFha; Thu,  1 Oct 2026 12:41:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6134540D7A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790858478;
	b=GWCa7z/7G6tWlowF7+4/pcr5VEazDl6pwsSu7MPl+j4MFi5tiixgLqogjVjVD35Rn+u5
	 R4UC0jNKYXQl+Ivb1iIMLW6e2AuvNx2zkLLXYLw55YwTmyrHJ+wEupIr06nEGmh3HZbqF
	 6mU+jd4AWYRMMmurSAV2oAsBbxfKroUPTlnPrDG6zIkp9NCEVvukhz5Y01SY95+DLN673
	 p+fS+4K/BhS7J5DXNJpWoBgx2FK5KnKWEzIfccPC1+wc1TDfBIhJcTRSXsDncZPl/2QcX
	 mKDcSnzJveK1nd6Es8uzOWVdJdHWtYP/wJJ+gsSDOHGMce9sr7oyOtiNgESEcglYYSA==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790858478;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 Received:Received:Received:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+ng5fpe/TP07wIKigc5gkMf1BnPoeM8h2ce/cwmMfAA=;
	b=YJVguIMuQKOl1gJx/03V0uc1XYTfWpwpgmfsDmYmvcnf6IBNjOz6m9YdvU9jkJkSfTaB
	 xAPxyXUPnyr5j7L5/NhuD0Xzc28GWFVRtYNr1+09JUiz1qFDqclmuLWptjFtZDD9628Bu
	 4GLpPXw3tiJXQ8yFwP8Yal+8t1uEkEmounkjKOHDjSUBBI8F2QsPawjiJ2Q44QvW7JPBI
	 dsdFr9k98NKgs6bDkqH5BSPTs3WYlFmkTaTcXIiUMk1WQTV95DJlQbShQCV8lmt1hzBfJ
	 3Z/gFj0QWktOgLeYgufJReT0bmg00eSFlpKD6IORSOCKNXnZVALJMCvnAMCjO7eesaw==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790858478;
	bh=+ng5fpe/TP07wIKigc5gkMf1BnPoeM8h2ce/cwmMfAA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=pH23IRSPUiJXPx0NID456F42MIV4M7EdIwyVFnNVvUslFhjHbRCrIL4W+YacJ6KAJ
	 iYcDs8eQob2v9oqxBkn/muQrI8VEJ3xwAPt82ss4+rkTA6pkZoDwOmLMyD1/PO3ppG
	 5tEGqRRdFfmkz9XM+wfPaxgI7Rwitej0cgi2hsN1yrhXrcnk8zkXa4p9CmpBsw48b6
	 r6cq92byqvpdD/6AH/wCFpZO3B/QRc2msIJjPs303bQXePEev6usE3iRs9m3B9WAbA
	 uEjkaLjJLONixWeRgZUICsYh/0fwQN7H5sJXo8NO+pdkFp0I9e3OhA6xVGPki7Axf3
	 G6vE6P/ePfQvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6134540D7A;
	Thu,  1 Oct 2026 12:41:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56D41263
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 12:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CEE760C1C
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 12:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GpYupSpVkbUP for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 12:41:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6E37C60C29
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790858475;
 b=OPcOYJZ+P1gFRTxUb4VhMOHENEqbaePZH5pVoMwpA1bsDYi8H8IVOoZUc+C/f9+z7R5X
 OuKMdqeRkVPbDXAHgdyvrm25/MtccugqLWFsEtY92cyDeVJBaJO7rdC9UHaTQFIJtn57b
 evW1sgPCEBghZGJUrGxltnYGxhnChz4A20YvXWth+Yy1j0NzhB9EKvP0RbgVtzGE8KpPP
 tPrlLkXSRxbWeD6I2SC9AgDx9dhhwz6MBWF8F9jHe3nMIVjs8EXY5kDQWtrAJGCYZ+W7M
 9owxYZm8ZeGWiKQcan/QWowqBvucYYrj6nv9VWSqjKIHV0kML6Yuy0CAWzOE9iWkuFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790858475;
 h=Received-SPF:DKIM-Signature:Received:Received:
 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-EOPAttributedMessage:X-MS-PublicTrafficType:
 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
 X-Forefront-Antispam-Report:
 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-Id:
 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-FromEntityHeader:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=p6xrdjWLZeQR9+EA2unbipd2JxwP2H8SnSbSWioXN4M=;
 b=DuXCcnxQobF4u00iOSrJ2Z6vGc7IICR7e8qSux5aSiHO3xUDAarvlK3IG2X+nIIogQYj
 8KQ7Dj3rdvPGD9/CiRTiIVwOjvXWr4Y3h3GSpdYx+UKVuQPvv9MrKeb1/r0BthTirM1V3
 NnpfyLcbLsuIBLhA3RqYyGU6NtAl5YervKJD9rcAM3CeH2uzAA3dV9UmrKn2AEXy6GdgV
 gr+u4YhV/HX7r1J2vWLV7TJbJJ2PQQiGUfPVda5zG4OYfehkyW5Nsq7FlHi/oi5rN9CZ/
 XEeg6dFO1RSLrYogmVML58fGNJ9t0n8iIoziOZ8pXXJI12GEILPKwqXRGxJnOcmWczQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org;
 dmarc=pass header.from=amd.com; 
 dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=yMtPaB94; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:c000::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c000::1;
 helo=byapr05cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c000::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E37C60C29
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 12:41:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APkfkQJTMGT+Aef/4J17L93hZ9cKh08EPrZdSamyULROfG52qs7IZTLzV4OV1yws0Rwp8b3Oa8nr2oBwwyrrLwmQTjrcb5VEoI6ZpoZ037mvIZ8fdu/9xb3xDHRNt9vgreFTjbfXXjgMpvYy7tjSfY2SmsyLfDOxYGwzn5QjJHDZx5GL+rZentDgMf9JTPVzq1H0ghAah5Q9P8ZRM2UTHp3E+S7Rn9oi34hOolcUZf2gU4SBhu42RYFwKo4eI1quPMGmc3OVCJWlXREcYUaL7C55eujkVFJjEzy+ep6gJz8OgaGv+mXZlnF2QMdka6OLhglf7ZBuziE7J8tdzPYDdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6xrdjWLZeQR9+EA2unbipd2JxwP2H8SnSbSWioXN4M=;
 b=awcGRFxQiCqgqiJI4v8c3NlPXgDkOK8BPJ50Gy+3Fovc7CNec4DkycMVzxkpHZXH+pAdgjXIPC4Bad7AIYAXhMbygkonO41WIqbXE84+Q72i0UGinvK433SKpcJXZjsV79hEKUjOruHs0lo8r15+i0tdDxBzppnCWh8pebcjSXxEjfEzmFearmM4A/BeTul+9Qizuriv8OdPbWcPmR5XA1AYlCExAwIjH5hLWu66dgWWUF9Ssf1lQ2iZprB6HL1z7AyH8SGck6zjXRybCXtuv8ZkvNrPHYkM1pDmlkcrHX6TCVnbepKR8yVx69YLZfurum9YiSTRjkp5KGOZ5aq4KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::20)
 by MN2PR12MB4096.namprd12.prod.outlook.com (2603:10b6:208:1dc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 12:41:04 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::38) by SJ0P220CA0013.outlook.office365.com
 (2603:10b6:a03:41b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 12:41:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 12:41:03 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 07:41:03 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 07:41:03 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 1 Oct 2026 07:41:00 -0500
To: <buildroot@buildroot.org>
Date: Thu, 1 Oct 2026 13:40:55 +0100
Message-ID: <20261001124057.1941988-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|MN2PR12MB4096:EE_
X-MS-Office365-Filtering-Correlation-Id: 4416a6c8-54f7-47f5-59ae-08df1fb9415f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|36860700016|7416014|82310400026|1800799024|13003099007|10067099003|56012099006|11063799006|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: XwB39qrthx61nyO2t2EHDnjbucJPFMzXucLliSglypLnMIEVLzWODgy7uj0EushK6xA44a5+iBUVGPGf0BbmTzG6NtsBTHENBlLqnBpt4KMrjc3XLv065qbBL5+AdnbGp/aCFZyAxUgh/04h2yOMcuPuUbS74x0/9UrwKLM7w7cbT0F8eG1cT50hOmZLmdkRxmhEAHD2gGmke7hkQHjAIIrWHHqg5ozcAQY4iC6w8e9TxAjpkApD8CaqgPx7Fyuwze7KgQQ5WxyZ4oYOre8DGlanPLKJ3u1DPuAo+arTWXPDlcyMO82NYXaEQpurpk3QoqfC2wABDb41QxAAYIi9E7GukfWPFW7FGGRO4Md+OhUpM1t02C1NEep2Czl6Naf2ZtpcBsqdUOZKdu43Zhs4s+W49UAzRKCU+W75veb5l1FwQTq780bqFnxgJKGZcqO3+CllbmuR+2f8k5X8fYQgNyNADYFkBw6/yXSRLNf5Z7FfNEc+bAE46JzJhyT8tU+WwoxncMazndS9tMfeYCbtjzqRqnacQf7Z6WFMfz4cEpRtN0fCVF1wKrSE9y81BUr9fvJJcqDHWO1Ei0E+AKPxRTMvGkHjekU7g8A5DdluETzIHE2/ggKdrhP7uPoJLAgNIuhvxH4l+iHROX190CEwOL6/Z5YlEjVUm6c0P0pxexaOcqEAKKT1qKFerMHOBJ2OfKw0KW9Eq7+97hnSXTNtrA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(36860700016)(7416014)(82310400026)(1800799024)(13003099007)(10067099003)(56012099006)(11063799006)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HTiErvDKcNFtzMP9G+5Ym2opKilYn4ADfTJaWC9CFulPoyUBq7Vx+3cSVCzj61MorGGRov6x2XBbqh81HjZfPCoe51wsrcLaiNY6JtG0oTEQD5oJfwO+6Q7xGxy8SOHRy6gIEkoZfsQxYRfVYEhIIqFoEam5Lri+yBNVchxzbJfujJnzk+uG0JrjKFehVRDFGiXcBtcNIsdc/Nom/tJpBvN6ccfXw+lxoI8Q8LgdGe+n72OIIobIglNrttNk7uvkKjGs/rjj2JU2tRvh3Fq9Cxh+ZZnxt/CMASY4H2zgFDuL3IoMRaFVciDQC51w9+LTpEHLj3fpTV7DhbgLW2vqmZ0rSsZDSJTXbxPUSHhTUYqB0rwMgqEXtPih4iYOZeMpUsiPTRdKrim85N4ZAdAynT/uS/6jq9iiqRh4YMkA5a4UgqKGHiPwfBSIs5ttyvQB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:41:03.5406 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4416a6c8-54f7-47f5-59ae-08df1fb9415f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4096
Subject: [Buildroot] [PATCH v6 1/3] package/xen: add custom version support
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: alistair@alistair23.me, stefano.stabellini@amd.com,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com, micheal.saleab@amd.com,
 yann.morin@orange.com, matthew.l.weber3@boeing.com,
 Matthew Weber <mathew.l.weber3@boeing.com>, brandon.maier@collins.com,
 john.ernberg@actia.se, brian.j.wood2@boeing.com, ju.o@free.fr,
 stewart.hildebrand@amd.com, thomas.petazzoni@bootlin.com, arnout@rnout.be,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the ability to configure specific Xen versions while leaving the default
version unchanged to avoid breaking any builds already using Xen 4.22.0.

To test:
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_XEN=y
BR2_PACKAGE_XEN_CUSTOM_VERSION=y
BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE="4.21.2"

Add to package/xen/xen.hash:
sha256  9c5c2ad0b4ab86ddd378f60ecc5b1ed53d36b436249ba27c86831003e1281fa3  xen-4.21.2.tar.gz

Signed-off-by: Neal Frager <neal.frager@amd.com>
Tested-by: Matthew Weber <mathew.l.weber3@boeing.com>
Prior test details: https://gist.github.com/matthew-l-weber/c17f14a3793ccee440a383e4177ff3db
Reviewed-by: John Ernberg <john.ernberg@actia.se>
Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
V1->V2:
- rebased to updated master branch
- removed the line move of the XEN_SITE definition
V2->V4:
- merged into new patch series as the second patch
V4->V5:
- added custom version test to commit message
V5->V6:
- rebased to master
---
 package/xen/Config.in | 25 +++++++++++++++++++++++++
 package/xen/xen.mk    |  2 +-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/package/xen/Config.in b/package/xen/Config.in
index 89543ac9ba..c27600cae1 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -10,6 +10,31 @@ config BR2_PACKAGE_XEN
 
 if BR2_PACKAGE_XEN
 
+choice
+	prompt "Xen Version"
+	help
+	  Select the specific Xen version you want to use
+
+config BR2_PACKAGE_XEN_LATEST_VERSION
+	bool "4.22.0"
+
+config BR2_PACKAGE_XEN_CUSTOM_VERSION
+	bool "Custom version"
+	help
+	  This option allows to use a specific official version
+
+endchoice
+
+config BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE
+	string "Xen version"
+	depends on BR2_PACKAGE_XEN_CUSTOM_VERSION
+
+config BR2_PACKAGE_XEN_VERSION
+	string
+	default "4.22.0"	if BR2_PACKAGE_XEN_LATEST_VERSION
+	default BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE \
+				if BR2_PACKAGE_XEN_CUSTOM_VERSION
+
 config BR2_PACKAGE_XEN_HYPERVISOR
 	bool "Xen hypervisor"
 	help
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index f8a4100bbc..5e3013cf63 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.22.0
+XEN_VERSION = $(call qstrip,$(BR2_PACKAGE_XEN_VERSION))
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_SELINUX_MODULES = systemd udev xen
 XEN_LICENSE = GPL-2.0
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
