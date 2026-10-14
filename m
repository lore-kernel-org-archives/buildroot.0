Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFE8CC6B27
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 07:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60BC76083F;
	Wed, 14 Oct 2026 07:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fiMo2hf5znB; Wed, 14 Oct 2026 07:49:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6BDC8607CF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791964172;
	b=VvOd4jCxj6XBtnZfYFIamx1K6XR45DJoKEHlJCstzAQb7lWQsWfJfMi2pnUUQ7oGTfOg
	 duYhBdkcFsevJ4D96uAok3iVzYXsP5ap36yZeX+1tcHHeckuQ01VVsEILIsehckfQ976G
	 R/3qaqny0/AynCQ3TcZFPWlPpislnvzcZ4GfGsL1UV3uwYOJy28yh+NGY8wmNGlSsR0yz
	 b7/qINYtlwWs6d4BghvR5NTS9x4qSup92KX9bzGAYEy8KOrP4bj7FXkOdt9aI1sLCBv0f
	 4gscBd5pysTPqvcYA2PpwsTgcbK7MGBT8Y6802ukdfS6+Ip5GsfMuX/7+a/pGHrr3ig==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791964172;
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
	bh=1GGJcwFPCBggJCLXWDxteso/YBCIIhGZbiX2xeeUXYw=;
	b=WXsyE/LGseRW5hg1IoXxRrda/GvOqxJm2QaqsP+gBH+2Zj7kZ1Zho9P1PxUiO989la3h
	 G7Zbojv/Rggjmuf/18bTlCa1G3lIFdV+XlBIue1/B4eRBsHsw7ehdd0ZMY2znwUbGbu4W
	 XcNZMycFQ39Z84vhHYFSzwTTRv1Fad4U50Ebvpoy0GWFbpXeNeMVIfVINSNyJHh8DpU4b
	 D0APOTT9lKnt4RX/tQ32U5OZxwJS2HvKVpgDi+Qp4V9Y62gNbQ6/kcZbYldFAwe5sw4a+
	 /OfjP3NYtpJTx1veXZygXPiZwOt5C9u4X1om41pvFa6TSylzhxKbGntlsdomEyLVfeQ==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791964172;
	bh=1GGJcwFPCBggJCLXWDxteso/YBCIIhGZbiX2xeeUXYw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=UmRucBfAH2kd02uTMCKqxPN7y5a4xT3ITAats8jxeF+eLNpWvF+L+fJh4fKTUfdtN
	 z0l5k+bQBM49TQJkCQhApyl0f7qpgdqN2MBVUPQCctaqvvyad8X09LRGx9AYqIO0qa
	 tkVfquhU1yeYOKHMcX3zuVz45bNhywta9K0mTPG02mAXF9Bk+pZ3DGdfXqiB4D3orl
	 +ki3KdvN5Ztil6n/3/CBAb+/Z+wAHCWpxlRBdQiTuqxm776xNdti8MujWofTDJ43D5
	 K4raioL5n24Fy8vuBhWOS7agzsUAfznewTL8h5h9BlIZ3I+jHxJy1QJxDRdeB7LDx9
	 fXO3/sfJpD44A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BDC8607CF;
	Wed, 14 Oct 2026 07:49:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 77748255
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 07:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 690C340666
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 07:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njcv8eXj6SM0 for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 07:49:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 88A5F4058E
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791964170;
 b=gbUsQ9l1tHHnqN2ReOnAMetcUZbj3SNF3vZ1DEDDWORK5yK8y3AC2c9YpaQOWRh6+1Co
 /giOjLrr3DgAByf5XU9xmQBPOqfihzKKbiroQ4LSlsG5IUzFbZ32zpUIVI1mskxjG/nMT
 79CcL1QR2E1xlupFj54tBtY4lxTPGw5lWETeQcB+0hQUNEUbZodJ4faNECTslfurqvcTv
 qgekhTVsm8jHCaoCSut93lge0RKZ1nBcopuCxe+o7qy1vDViuyOMVTXerbrCuU1BV1leg
 BEcoOUqxIo5g5SjFINgBlLFtUtcynm5n12yARHstfXLVCTQSI1ffR7DA5ye/v4SxAUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791964170;
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
 bh=8vw3aRWqz9batB2OH0GaB3X4eapMcj9ynL+9+gxzM34=;
 b=ckW7et1MJmq6z1YQxYXk0YOABa28D0kt/2VrEE4jESns4kM1pfu2NAGUwvC8rBeycqPV
 iJf6CkhX0G8Y5+ROGqxTBgQ04OVrEMbibWhowe1/X55gIQQDWX0WTQ4WDQleLLLuaizgy
 dSZyUaYX6OVOOwy4UPIIu1XSyfpOp1i0UweEUxk/RLo+gXgOTWfvDEesqKEyE+5VgcRId
 s3koUmcI9EEJmpP3u4IuYDifyluclyd1Y9zUolpDr1b2D7C6yh2i1vuUY4Uu47bUu+xhS
 bsd7sUNshF4HlJoU6POVU++VxRPZK5SmqwioyPeP0kZUUbLlIwRNKFaPGDkB2onsWRA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
 dmarc=pass header.from=amd.com;
 dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=aSO4L6EJ; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:c112::5"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c112::5;
 helo=cy7pr03cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88A5F4058E
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 07:49:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDyBeI6A1J9sJlQyxOiJaNt1tZ/v1sYERUfhLsOFZJ1CxEBU4NveofScAhKJjxUOhHWMLp2e9FHj8UGCxvCJpz45GU8HzRoJ0SdWTOW4WxUmgoofmp6NGMdD3o03EyQYfxG/yb+qMMyXr3wWZmU6sYobU0X3F4ydnLwcUCjmUsAABSBdGTFyl6+Dgax3s9Rpw4s0eqa6NrPFXIy9Bw0eBTiqsSwaADAGC7G3pTcWFVH2NeK54L066+F5/UwZ8T8MU93n1G19ogOGwtwsUoJM85iukBjw0dmnqr5kcNE8xwagou/pBDC2vIfkm3AStTvMeu9GHlbWT9ltfVkyEGn2fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vw3aRWqz9batB2OH0GaB3X4eapMcj9ynL+9+gxzM34=;
 b=KdZyzQqPcOTdv2VXKp8u31u1mpY+ljkK+vUta77okcMSiRQPm7RtPZt2fOAgfMBQVQz8au+rJtCrNatxhiO2XzR7y2lvZ2564BcKTnSh0lb01oXVe5RZlOeyrg81QzuwVXIkSPAgkHPGVBckXdP67XE7YNDR3xYoXYEAKIDvUMyk8PWlkfSRmQGvCyqRyVfczMKuYWjFCtqVIg3My8CDHPlPz88az+gqGqpYIed2qwNT0AgZUb6cZsQz2eF3cl8abyGHb/Ks3TdyVAD/dYt2CfTex5Lcie7X268/Tm4XkNYD1qYR+GIFT/y9WyazXqyoflt7B7j8By8Jv0zCTouzkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR13CA0076.namprd13.prod.outlook.com (2603:10b6:a03:2c4::21)
 by CH2PR12MB4070.namprd12.prod.outlook.com (2603:10b6:610:ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 07:49:19 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::47) by SJ0PR13CA0076.outlook.office365.com
 (2603:10b6:a03:2c4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 07:49:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 07:49:18 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 02:49:12 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 02:49:11 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 14 Oct 2026 02:49:10 -0500
To: <buildroot@buildroot.org>
Date: Wed, 14 Oct 2026 08:49:08 +0100
Message-ID: <20261014074908.3176317-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|CH2PR12MB4070:EE_
X-MS-Office365-Filtering-Correlation-Id: 1188dc4c-ef73-4abb-1b19-08df29c7a715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|82310400026|23010399003|36860700016|56012099006|11063799006|5023799004|261009223027099003|260925021311599003|260925022911599003|260925021911599003|10067099003|18002099003|13003099007|3023799007|41080700001;
X-Microsoft-Antispam-Message-Info: IzQGtHH2acRjedLdNf/UI/wXDUBi/yKT+K/PolCLTQykWRd7SoXHnWoyxSORbpDFeRndwyszrZVursJ0jDrsZd28Nq+PSZBtKAQm6PGgJk5590Rc5kNiqgocH69dzSQMqWF69ie0aBMfWpYdq7uIu9+x1EcZdY9ESY12YkTnrA7Cw9KSIOD98Fj1nxXnCi6m1VTylO2bbTHzMtS9xUYBrh50SvYobYVWG2hNQ/MMxQqZYK/jWzb1LOBeaXhS+KZLd4bVWxnAuxSID7v1saPBtyx4UhbcS92Fv+MrK70jBOgH6CIGw8RCTIOmuYa37LrDW4WXPCEUoHPGAfQkMUuUOX6lcu6Xe8Mi5Kyh+l6C4o0dcaSO6IK2uCpl+2KE/miElCNMJC0/saWtwSzc4vN4FmZLIvHcMOU6yyrG77BAV4Z2upNQvbs6eK6T5QLQOnqDiVHhpP9+N8cWAswJBpf6b9KhDfe8KPS54Vi36EpE3TiU0a2S9KIQLZYBQiEC65bv3um83dcZ5KY4DvJiRX6R8SHWmivBqdcfBB5BNZMe0V0hICYGw8mrRnlAjqGrIDzkQPUiguYFj/L7+0z60fMkn+6osey0EG3FNs30+dX89QJPornK2Qj52afB65/g1BKIuCm5pQPvNxNKOoBAHz5KpxPVco9OMhpthwOjVYMTa7sKfe0BRXxpIMRSY5NGpLhX+efoFicZrv1Hujl0kcJ/u3XIlDlm17snBtpIM3yxEKae6CBs4G2ni8ab7g39fTGPkzo0wTEZh6zjtd+zGpU4ag==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(23010399003)(36860700016)(56012099006)(11063799006)(5023799004)(261009223027099003)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(18002099003)(13003099007)(3023799007)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iJSgMrAdCHE1XawlvX2unQQrPtBhVl+DfjYgbYMUkbd5snVtdCr4Bp2hWmT7x/AjusWMCzJuy6i5nUS8e6QAm+UIPDksLmafTEvfiuBpJVNa9eJxLGrvpiXlOJfyOm3mt6EwfTTYbXOHd+TtyHzSddxAlO7EGND2MhPwSuSBOu/a3b7+u8UJIIk/EM/jvyZ7zIrIK2rHxg6Motbx0H9Fb8XC7R2b0DvhsHILaW9B/QShhyRBY/tmSAscdV7gyitiqS2scfYuGtE8pikNN79ZlMQvwmDjBy0VNfRolfv2hN8jsguJkfeGIIFiK/O7GgnT+5h+GAPeh9c+43Az2O3PrShw0GV76w3UFCQjyxNqrD/7gxDFXTjUKHbHjDQ9Ljy0zkVgQ770P7qs2pN7/FtaN/QC9jddLKWK6df0TJ5m4OBOwGqtnITY2vJzRDJZWJGn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 07:49:18.6947 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1188dc4c-ef73-4abb-1b19-08df29c7a715
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4070
Subject: [Buildroot] [PATCH v1 1/1] package/gcc: add microblaze frame
 unwinding fix to v14
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
Cc: Neal
 Frager <neal.frager@amd.com>, joseph@anodize.com, ramin.moussavi@yacoub.de,
 thesamprice@gmail.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 arnout@rnout.be, lordrasmus@gmail.com, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add microblaze signal-frame unwinding fix back port to gcc 14.4.0.

Upstream: https://gcc.gnu.org/cgit/gcc/commit/?id=4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...Linux-signal-frame-unwinding-support.patch | 196 ++++++++++++++++++
 1 file changed, 196 insertions(+)
 create mode 100644 package/gcc/14.4.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch

diff --git a/package/gcc/14.4.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch b/package/gcc/14.4.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch
new file mode 100644
index 0000000000..762a1e09bb
--- /dev/null
+++ b/package/gcc/14.4.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch
@@ -0,0 +1,196 @@
+From 4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f Mon Sep 17 00:00:00 2001
+From: Ramin Moussavi <lordrasmus@gmail.com>
+Date: Wed, 3 Jun 2026 00:00:00 +0200
+Subject: [PATCH] microblaze: add Linux signal frame unwinding support
+
+libgcc has no MD_FALLBACK_FRAME_STATE_FOR for microblaze*-linux*, so the
+DWARF unwinder cannot step through signal frames at all.  Anything that
+unwinds out of a signal handler -- most prominently NPTL asynchronous
+pthread cancellation (SIGCANCEL) -- either stops early with
+_URC_END_OF_STACK (cleanup handlers below the signal frame never run) or
+misinterprets the on-stack signal trampoline and crashes with SIGSEGV.
+
+Add the standard fallback: recognize the two-instruction trampoline the
+kernel writes into struct rt_sigframe on the stack
+
+	addik r12, r0, __NR_rt_sigreturn
+	brki  r14, 0x8
+
+and rebuild the frame state from the sigcontext's pt_regs.  The ucontext
+is anchored relative to the trampoline (its last member) rather than to
+the CFA, so the layout of the frame head does not matter.
+
+The interrupted PC is recorded in DWARF column 36, one past the hard
+registers, because column 15 must keep the interrupted r15 (unrelated to
+the resume address of a signal frame).  Declaring it as
+DWARF_ALT_FRAME_RETURN_COLUMN makes init_dwarf_reg_size_table size the
+column; without that _Unwind_GetGR reads a zero size and aborts.
+
+Tested with a microblazeel-linux-uclibc cross compiler against uClibc-ng
+git, running its NPTL test suite under qemu-system-microblazeel -M
+petalogix-s3adsp1800.  Without the fix 17 tests fail (tst-cancel{1..5,7,
+9,16,20,x4,x7}, tst-cleanup{1..3}, tst-cond{16,17}) by SIGSEGV or by
+hanging in the unwinder; with it all 17 pass and the rest of the suite
+is unchanged.  The implementation follows the mips/aarch64
+linux-unwind.h pattern.
+
+gcc/ChangeLog:
+
+	* config/microblaze/microblaze.h (DWARF_ALT_FRAME_RETURN_COLUMN):
+	Define.
+
+libgcc/ChangeLog:
+
+	* config.host (microblaze*-linux*): Set md_unwind_header.
+	* config/microblaze/linux-unwind.h: New file.
+
+Upstream: https://gcc.gnu.org/cgit/gcc/commit/?id=4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f
+
+Signed-off-by: Ramin Moussavi <ramin.moussavi@yacoub.de>
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ gcc/config/microblaze/microblaze.h      |   8 ++
+ libgcc/config.host                      |   1 +
+ libgcc/config/microblaze/linux-unwind.h | 102 ++++++++++++++++++++++++
+ 3 files changed, 111 insertions(+)
+ create mode 100644 libgcc/config/microblaze/linux-unwind.h
+
+diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
+index 2b5bd52040f7f..fc8c4b8717545 100644
+--- a/gcc/config/microblaze/microblaze.h
++++ b/gcc/config/microblaze/microblaze.h
+@@ -176,6 +176,14 @@ extern enum pipeline_type microblaze_pipe;
+ #define DWARF_FRAME_RETURN_COLUMN \
+ 	(GP_REG_FIRST + MB_ABI_SUB_RETURN_ADDR_REGNUM)
+ 
++/* Signal frames (config/microblaze/linux-unwind.h) record the
++   interrupted PC in DWARF column 36, one past the hard registers,
++   because column 15 must keep the interrupted r15.  Declaring it as
++   the alternate return column makes init_dwarf_reg_size_table size
++   it; otherwise _Unwind_GetGR aborts when unwinding through a signal
++   frame, such as during pthread cancellation.  */
++#define DWARF_ALT_FRAME_RETURN_COLUMN 36
++
+ /* Initial state of return address on entry to func = R15.
+    Actually, the RA is at R15+8, but gcc doesn't know how 
+    to generate this. 
+diff --git a/libgcc/config.host b/libgcc/config.host
+index 046156fa5e786..a685d5da7a107 100644
+--- a/libgcc/config.host
++++ b/libgcc/config.host
+@@ -1050,6 +1050,7 @@ mcore-*-elf)
+ 	;;
+ microblaze*-linux*)
+ 	tmake_file="${tmake_file} microblaze/t-microblaze t-fdpbit t-slibgcc-libgcc"
++	md_unwind_header=microblaze/linux-unwind.h
+ 	;;
+ microblaze*-*-elf)
+ 	tmake_file="${tmake_file} microblaze/t-microblaze t-fdpbit"
+diff --git a/libgcc/config/microblaze/linux-unwind.h b/libgcc/config/microblaze/linux-unwind.h
+new file mode 100644
+index 0000000000000..b54704a065198
+--- /dev/null
++++ b/libgcc/config/microblaze/linux-unwind.h
+@@ -0,0 +1,102 @@
++/* DWARF2 EH unwinding support for MicroBlaze Linux.
++   Copyright (C) 2026 Free Software Foundation, Inc.
++
++   This file is part of GCC.
++
++   GCC is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by
++   the Free Software Foundation; either version 3, or (at your option)
++   any later version.
++
++   GCC is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++   GNU General Public License for more details.
++
++   Under Section 7 of GPL version 3, you are granted additional
++   permissions described in the GCC Runtime Library Exception, version
++   3.1, as published by the Free Software Foundation.
++
++   You should have received a copy of the GNU General Public License and
++   a copy of the GCC Runtime Library Exception along with this program;
++   see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef inhibit_libc
++
++/* Do code reading to identify a signal frame, and set the frame state
++   data appropriately.  See unwind-dw2.c for the structs.  */
++
++#include <signal.h>
++#include <sys/ucontext.h>
++#include <asm/unistd.h>
++
++#define MD_FALLBACK_FRAME_STATE_FOR microblaze_fallback_frame_state
++
++static _Unwind_Reason_Code
++microblaze_fallback_frame_state (struct _Unwind_Context *context,
++				 _Unwind_FrameState *fs)
++{
++  const unsigned int *pc = (const unsigned int *) context->ra;
++  struct sigcontext *sc;
++  _Unwind_Ptr new_cfa;
++  int i;
++
++  /* The outermost frame of a thread may leave a null or near-null
++     return address; do not dereference it looking for the
++     trampoline.  */
++  if ((unsigned long) pc < 4096)
++    return _URC_END_OF_STACK;
++
++  /* The kernel writes the signal trampoline onto the stack
++     (struct rt_sigframe.tramp):
++
++	addik r12, r0, __NR_rt_sigreturn
++	brki  r14, 0x8
++
++     and sets the saved r15 to the trampoline address minus 8 (the
++     handler returns with "rtsd r15, 8"), so the unwound return
++     address points 8 bytes before the trampoline.  */
++  if (pc[0] == (0x31800000 | __NR_rt_sigreturn) && pc[1] == 0xb9cc0008)
++    ;
++  else if (pc[2] == (0x31800000 | __NR_rt_sigreturn) && pc[3] == 0xb9cc0008)
++    pc += 2;
++  else
++    return _URC_END_OF_STACK;
++
++  /* The trampoline is the last member of the kernel's rt_sigframe and
++     the ucontext sits directly in front of it.  Anchor there rather
++     than at the CFA so the layout of the frame head does not matter
++     (the kernel may insert an ABI argument-home gap at the front).
++     uClibc's ucontext_t matches the kernel's struct ucontext.  */
++  ucontext_t *uc = (ucontext_t *) ((_Unwind_Ptr) pc - sizeof (ucontext_t));
++
++  sc = (struct sigcontext *) &uc->uc_mcontext;
++
++  new_cfa = sc->regs.r1;
++  fs->regs.cfa_how = CFA_REG_OFFSET;
++  fs->regs.cfa_reg = 1;		/* r1, the stack pointer.  */
++  fs->regs.cfa_offset = new_cfa - (_Unwind_Ptr) context->cfa;
++
++  /* pt_regs holds r0..r31 consecutively.  */
++  for (i = 0; i < 32; i++)
++    {
++      fs->regs.how[i] = REG_SAVED_OFFSET;
++      fs->regs.reg[i].loc.offset
++	= (_Unwind_Ptr) &sc->regs.r0 + i * sizeof (unsigned long) - new_cfa;
++    }
++
++  /* The interrupted PC goes into the alternate return column
++     (DWARF_ALT_FRAME_RETURN_COLUMN, defined as 36 in
++     gcc/config/microblaze/microblaze.h), one past the hard registers;
++     column 15 above keeps the interrupted r15.  */
++  fs->regs.how[__LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__] = REG_SAVED_OFFSET;
++  fs->regs.reg[__LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__].loc.offset
++    = (_Unwind_Ptr) &sc->regs.pc - new_cfa;
++  fs->retaddr_column = __LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__;
++  fs->signal_frame = 1;
++
++  return _URC_NO_REASON;
++}
++
++#endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
