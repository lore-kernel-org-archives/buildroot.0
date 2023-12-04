Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61DBC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 07:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79EDF8148E;
	Mon,  4 Dec 2023 07:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79EDF8148E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UG78gYij2die; Mon,  4 Dec 2023 07:35:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A186881E59;
	Mon,  4 Dec 2023 07:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A186881E59
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4CEB1BF33C
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 07:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 445A360B12
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 07:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 445A360B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nyzj1JM4RQ5F for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 07:35:10 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::618])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C548A60A6B
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 07:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C548A60A6B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6YXtp55AWSlE1iJk8HUKvRBY/Oj6e9QDnPhRm1zae19aSmH2UOjaubsTQohdrk0ZXFvEkZ+9gKLWJL7DDIkulJ24C5YRWT7+lQXeO5PmZICq3+TdJZGSdlubrqqwdTTZzZBP1/d3AfOjw35zRu8Ucpv2ouSwd8dYOkX6pqxpRz598IOvXOHcRiquxc+zB08Y9Q6DYtCjzzfabeUAD2DdNfjzXKH6llayzD9prV6wu1XLwAoUZvJZb76qOIjEBah6tg8thJbfsHJGlbYYf/YXVO1QjfwPXCoZ36kuUQWebPDj9UTU1wIXBWDZd8HeL9Z41gZcOlL+xtF6gYh+EN3qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eg0fz7Kf3Bnrl+PGhwoap++07arqh0al7Ei8Nt6L660=;
 b=BQTigxIBxv7l5flisGSjoR+BFX8m7oTV2qbbS0VAycDCU6TZ0XaLuPjfF079VoZtOsWuU+S1lGK7aCsdc2u7GUohdnv1/+5dBndYSP3VEIsfGBD8ftSRrAlca+YtxrLxnikEWITACt+pQ0ZerwLQ7AU70gI5BSH2vjbCOk7lXB7o7SNFiDJweIh2s8fcSjB66QNV8uKD2mihfUJURGcRDf5nxO4uklSdIPWXXXkwlz2WXxFZY8bBq+HWF9qnA7rLaI5KULfxJlblHNYVUPFGX4N91iUdqg2iHuJhpLNMRqbGIqCtzyOw3U6MCyPvpb8FklHcn+vDwRJKKJr6woV9/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR19CA0018.namprd19.prod.outlook.com (2603:10b6:610:4d::28)
 by SA0PR12MB4525.namprd12.prod.outlook.com (2603:10b6:806:92::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 07:35:05 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:610:4d:cafe::29) by CH2PR19CA0018.outlook.office365.com
 (2603:10b6:610:4d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 07:35:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 07:35:03 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 01:35:02 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 4 Dec 2023 01:34:54 -0600
To: <buildroot@buildroot.org>
Date: Mon, 4 Dec 2023 07:34:36 +0000
Message-ID: <20231204073443.1543587-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204073443.1543587-1-neal.frager@amd.com>
References: <20231204073443.1543587-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|SA0PR12MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 8883f2b3-c520-4164-6c6f-08dbf49b87e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m52C1pR9nRztlyHmi7mK+sy4KT58cpER+e8QSScdFcufgVy+XrUAUbo7jltJvO+OLcRD9bspOTp43drOwGMvwPwDXG+OvkCjhpowCPz/WfmGO31QZ8Fav3tdqHf1OrvdX79aXpygJ5rPYBsa8Sdg0VKg/g0qeV/hantohjCDRO2B3AkIbhqhmkZn6hTeo/H4ckd6kroW/K1h1UgkTVom/YOiFFAdZRIPHz/nihXSoh/MUnxYic4neMDdznEHjV65NBd2LkXRNDaFzoFp/J6x+3O0mQyusM6WiG9OX3YlB0bzjeKiIoJktGz3c/MS3xOm+dNlsnp2Fw7R0BHokOv3RByJ6vGUGz1VeFV8O1dR5vA8YNMVquMiwqSj5JTLIEy+yJpxyo2UqNC6DkJv200Vyc13dfeF0YyXLYVVS1WmsJHNOEA3r3BofiZi412AIRWYNpE66moJDJMbZ8fHBLtQl4SbM3glYL6U19QwpD4P2rpqeQPPyUbIIn/l2J2B9+tjtGB4lnVBSZL+tfP88vVlSRryEPZ4h4/sSbiIKrBaR7wGZcrt7M6aW7f+aibIF0JhxUuhnrwmjsP4C26b1gstW9dkpyhaihXChGXxIA5qiVPdqJrsqK5xMYgVt0EN88G930uJdMxKHt4ibWRK+HDBWIoFOvuavACWLwyOgGPDCQZ5Xb6fl8toXpjyACpNqlky3tAwLr4uFVgP1KuINIDNTx1tTaToXQGMLJrsNep0YgfaLlSWfi2pHGZSrnLTVrkSx2qagGWBYmdMyvf1/4v7Fw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(186009)(64100799003)(82310400011)(451199024)(1800799012)(36840700001)(40470700004)(46966006)(70586007)(70206006)(54906003)(316002)(6916009)(478600001)(40460700003)(6666004)(5660300002)(41300700001)(36756003)(2906002)(44832011)(86362001)(4326008)(8676002)(8936002)(1076003)(2616005)(36860700001)(40480700001)(47076005)(356005)(81166007)(26005)(336012)(82740400003)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 07:35:03.9227 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8883f2b3-c520-4164-6c6f-08dbf49b87e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4525
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eg0fz7Kf3Bnrl+PGhwoap++07arqh0al7Ei8Nt6L660=;
 b=vDb17BJRxJlFqseX6QllMCypCzBGfXCORxopYtiqv0XkHOffY3ezO9V/iT0yeCxPXc7juvXT6QMx8wyeLNVLExVb4tYRweHsg01m2+MiNIXN7Fk4LGnQ2fJVFHHoSB/vJcfYlt4si69aYsF5+3PrwE4Bd4+1WI0NFah8dLKuiLk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=vDb17BJR
Subject: [Buildroot] [PATCH v8 04/10]
 toolchain/toolchain-bare-metal-buildroot: new toolchain
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYXRjaCBhZGRzIGEgbmV3IHZpcnR1YWwgcGFja2FnZSBmb3IgYWRkaW5nIGEgYmFyZS1t
ZXRhbCB0b29sY2hhaW4gdG8KYnVpbGRyb290LiAgQnkgZGVmYXVsdCwgdGhpcyBwYWNrYWdlIHdp
bGwgY29uZmlndXJlIGEgYmFyZS1tZXRhbCB0b29sY2hhaW4KZm9yIHRoZSBYaWxpbnggbWljcm9i
bGF6ZSBsaXR0bGUgZW5kaWFuIGFyY2hpdGVjdHVyZS4gIFdoZW4gY29uZmlndXJlZCBmb3IKdGhl
IFhpbGlueCBtaWNyb2JsYXplIGFyY2hpdGVjdHVyZSwgdGhpcyB0b29sY2hhaW4gY2FuIGJlIHVz
ZWQgdG8gYnVpbGQgdGhlCm1pY3JvYmxhemUgZmlybXdhcmUgYXBwbGljYXRpb25zIGZvciB6eW5x
bXAgYW5kIHZlcnNhbC4KClNpZ25lZC1vZmYtYnk6IEliYWkgRXJraWFnYSA8aWJhaS5lcmtpYWdh
LWVsb3J6YUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBOZWFsIEZyYWdlciA8bmVhbC5mcmFnZXJA
YW1kLmNvbT4KLS0tClYxLT5WMjoKIC0gYWRkcyBzZWxlY3Qgb3B0aW9uIHRvIGJyaW5nIGluIGFs
bCBwYWNrYWdlcyBuZWVkZWQgZm9yIHRvb2xjaGFpbi1iYXJlLW1ldGFsClYyLT5WMzoKIC0gbm8g
Y2hhbmdlcwpWMy0+VjQ6CiAtIG1vdmVkIGZyb20gcGFja2FnZSB0byB0b29sY2hhaW4gZGlyZWN0
b3J5CiAtIGltcHJvdmVkIG1lbnVjb25maWcgaGVscCBjb21tZW50ClY0LT5WNToKIC0gbm8gY2hh
bmdlcwpWNS0+VjY6CiAtIG1pZ3JhdGVkIHRvIHRvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9v
dApWNi0+Vjc6CiAtIG1vdmVkIHRvIGl0cyBvd24gaXRlbSBhdCB0aGUgZW5kIG9mIHRoZSBtZW51
Y29uZmlnIGxpc3QKVjctPlY4OgogLSBubyBjaGFuZ2VzCi0tLQogREVWRUxPUEVSUyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwogdG9vbGNoYWluL0Nv
bmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMSArKysrKysrKysr
KwogdG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9vdC9Db25maWcuaW4gICAg
fCAxMSArKysrKysrKysrKwogLi4uL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9vdC5tayAg
ICAgICAgICAgICAgICAgfCAgOSArKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0
aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xjaGFpbi90b29sY2hhaW4tYmFyZS1tZXRh
bC1idWlsZHJvb3QvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbGNoYWluL3Rvb2xj
aGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9vdC90b29sY2hhaW4tYmFyZS1tZXRhbC1idWlsZHJvb3Qu
bWsKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCAxNTIxMTVjZjNi
Li41M2UyNGFlYmVkIDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAg
LTEzODUsNiArMTM4NSw3IEBAIE46CUliYWkgRXJraWFnYSA8aWJhaS5lcmtpYWdhLWVsb3J6YUBh
bWQuY29tPgogRjoJcGFja2FnZS9iaW51dGlscy1iYXJlLW1ldGFsLwogRjoJcGFja2FnZS9nY2Mt
YmFyZS1tZXRhbC8KIEY6CXBhY2thZ2UvbmV3bGliLWJhcmUtbWV0YWwvCitGOgl0b29sY2hhaW4v
dG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290LwogCiBOOglJZ25hY3kgR2F3xJlkemtpIDxp
Z25hY3kuZ2F3ZWR6a2lAZ3JlZW4tY29tbXVuaWNhdGlvbnMuZnI+CiBGOglwYWNrYWdlL2FuZ3Vs
YXJqcy8KQEAgLTIyMjQsNiArMjIyNSw3IEBAIEY6CXBhY2thZ2UvYm9vdGdlbi8KIEY6CXBhY2th
Z2UvZ2NjLWJhcmUtbWV0YWwvCiBGOglwYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsLwogRjoJcGFj
a2FnZS92ZXJzYWwtZmlybXdhcmUvCitGOgl0b29sY2hhaW4vdG9vbGNoYWluLWJhcmUtbWV0YWwt
YnVpbGRyb290LwogCiBOOglOaWNvbGEgRGkgTGlldG8gPG5pY29sYS5kaWxpZXRvQGdtYWlsLmNv
bT4KIEY6CXBhY2thZ2UvdWFjbWUvCmRpZmYgLS1naXQgYS90b29sY2hhaW4vQ29uZmlnLmluIGIv
dG9vbGNoYWluL0NvbmZpZy5pbgppbmRleCAzNGUwYWUyYzVmLi41ZjA0NzM5NmQzIDEwMDY0NAot
LS0gYS90b29sY2hhaW4vQ29uZmlnLmluCisrKyBiL3Rvb2xjaGFpbi9Db25maWcuaW4KQEAgLTky
Myw0ICs5MjMsMTUgQEAgY29uZmlnIEJSMl9UT09MQ0hBSU5fSEFTX0xJQlFVQURNQVRICiAJZGVm
YXVsdCB5IGlmIEJSMl9pMzg2IHx8IEJSMl94ODZfNjQKIAlkZWZhdWx0IHkgaWYgQlIyX1BPV0VS
UENfQ1BVX0hBU19WU1gKIAorY29tbWVudCAiQmFyZSBtZXRhbCB0b29sY2hhaW4iCisKK2NvbmZp
ZyBCUjJfVE9PTENIQUlOX0JBUkVfTUVUQUxfQlVJTERST09UCisJYm9vbCAiQnVpbGRyb290IGJh
cmUgbWV0YWwgdG9vbGNoYWluIgorCXNlbGVjdCBCUjJfUEFDS0FHRV9ORVdMSUJfQkFSRV9NRVRB
TAorCWhlbHAKKwkgIFNlbGVjdCBpZiB5b3UgbmVlZCBhIGJhcmUtbWV0YWwgdG9vbGNoYWluIGZv
ciBidWlsZGluZworCSAgcGxhdGZvcm0gc3BlY2lmaWMgZmlybXdhcmUgaW1hZ2VzLgorCitzb3Vy
Y2UgInRvb2xjaGFpbi90b29sY2hhaW4tYmFyZS1tZXRhbC1idWlsZHJvb3QvQ29uZmlnLmluIgor
CiBlbmRtZW51CmRpZmYgLS1naXQgYS90b29sY2hhaW4vdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVp
bGRyb290L0NvbmZpZy5pbiBiL3Rvb2xjaGFpbi90b29sY2hhaW4tYmFyZS1tZXRhbC1idWlsZHJv
b3QvQ29uZmlnLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmQ2MmRm
ZTgxNDEKLS0tIC9kZXYvbnVsbAorKysgYi90b29sY2hhaW4vdG9vbGNoYWluLWJhcmUtbWV0YWwt
YnVpbGRyb290L0NvbmZpZy5pbgpAQCAtMCwwICsxLDExIEBACitpZiBCUjJfVE9PTENIQUlOX0JB
UkVfTUVUQUxfQlVJTERST09UCisKK2NvbmZpZyBCUjJfVE9PTENIQUlOX0JBUkVfTUVUQUxfQlVJ
TERST09UX0FSQ0gKKwlzdHJpbmcgInRvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9vdCBhcmNo
IgorCWRlZmF1bHQgIm1pY3JvYmxhemVlbC14aWxpbngtZWxmIgorCWhlbHAKKwkgIHNlbGVjdCBh
cmNoaXRlY3R1cmUgZm9yIGJhcmUtbWV0YWwgdG9vbGNoYWluCisKK3NvdXJjZSAicGFja2FnZS9u
ZXdsaWItYmFyZS1tZXRhbC9Db25maWcuaW4iCisKK2VuZGlmICMgQlIyX1RPT0xDSEFJTl9CQVJF
X01FVEFMX0JVSUxEUk9PVApkaWZmIC0tZ2l0IGEvdG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1l
dGFsLWJ1aWxkcm9vdC90b29sY2hhaW4tYmFyZS1tZXRhbC1idWlsZHJvb3QubWsgYi90b29sY2hh
aW4vdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290L3Rvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1
aWxkcm9vdC5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi45ZDI2YzBl
ZWY4Ci0tLSAvZGV2L251bGwKKysrIGIvdG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1
aWxkcm9vdC90b29sY2hhaW4tYmFyZS1tZXRhbC1idWlsZHJvb3QubWsKQEAgLTAsMCArMSw5IEBA
CisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyB0b29sY2hhaW4tYmFyZS1tZXRhbC1idWls
ZHJvb3QKKyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK1RPT0xDSEFJTl9CQVJFX01FVEFM
X0JVSUxEUk9PVF9ERVBFTkRFTkNJRVMgPSBuZXdsaWItYmFyZS1tZXRhbAorCiskKGV2YWwgJCh2
aXJ0dWFsLXBhY2thZ2UpKQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
