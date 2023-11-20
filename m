Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BC2C197A0
	for <buildroot@archiver.kernel.org>; Mon, 20 Nov 2023 14:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83D5081456;
	Mon, 20 Nov 2023 14:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83D5081456
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g5hc0kFQuNIl; Mon, 20 Nov 2023 14:09:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5B1581463;
	Mon, 20 Nov 2023 14:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5B1581463
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3283D1BF5B3
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 14:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08A4E404FE
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 14:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08A4E404FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MeX3Woux1hlb for <buildroot@lists.busybox.net>;
 Mon, 20 Nov 2023 14:08:51 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 780CA4010F
 for <buildroot@buildroot.org>; Mon, 20 Nov 2023 14:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 780CA4010F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZYBvSi4MuTIHRKeiB/5a4ia925J7gzDOLpsUJm0HfkQlyKIEMLUCjP/fZEWbt8OiFdIQKrrT+C9ua+4ZHLvqrZ6PHle9Y+2PNE1M3z31/aezs56wqb8PT9oOqP1HfKB+7VBCYTwI930zkeX1O8UcZKqj/Kqa40TH3FysOhO9vmrvF+VLUxtM2m0hjNqyyw29AIL7zQ/QRc8Qrvyx0kTpvgRZPahqsdSJGey0vZiAKdiLf+EQ25s9CFXP2JduVdZO0tvxwpX8kbCVTXCskL15CPhToApwb2eo3VI0S41XlpGPhdoEhfkTahVA5tyNI/qa45j20mpRR4xTK9Jg8ejQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=517TJwhvtbTeS1FIyoXEsICU3FFClwFzfLBxD8Y6DOU=;
 b=U+EgcUE/UXmkWP3HmpqFtqL7kpz/8l8KiJWQtmEu0CndmQHILLKDL1ilmDAFxpjCPDG2ZZy9L2Zuh1x4GOiSLEaOdDzF+Vc9zZfuAKOcd4OuqNLWAhQILjT4bND1swweLp7XoM2ScB0ICWxt0ts/awBgSg6fRmIP4aMsMdcDF/YTcDI8eoNHIJlttbIiCfgvA0eiKbZe2EYV8NaOHPR0s3pzlzRKu7KE6T9x7VVGfBIjf358VqQA2dwkGc49jJ1CX+RFfFcp5llJ4aeQwPb1m1JhZ48FcUq7ZpBKt0HZ+viBtp3EqrFRVCdaQ2vM4hd7CaDMfgw0/ZG8BrmxHkU7zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DS0PR17CA0007.namprd17.prod.outlook.com (2603:10b6:8:191::14)
 by SJ2PR12MB8183.namprd12.prod.outlook.com (2603:10b6:a03:4f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Mon, 20 Nov
 2023 14:08:45 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:8:191:cafe::e5) by DS0PR17CA0007.outlook.office365.com
 (2603:10b6:8:191::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Mon, 20 Nov 2023 14:08:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.204) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Mon, 20 Nov 2023 14:08:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 20 Nov
 2023 08:08:44 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 20 Nov 2023 08:08:43 -0600
To: <buildroot@buildroot.org>
Date: Mon, 20 Nov 2023 14:08:20 +0000
Message-ID: <20231120140828.1903865-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231120140828.1903865-1-neal.frager@amd.com>
References: <20231120140828.1903865-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|SJ2PR12MB8183:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b896ba-2159-4892-644e-08dbe9d23570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xhna5BOWIziTSvnmvOcd41ppPUlOgrIH6QbdLPR5xWr7vcWZ0fMJvhayEcaF4SmT8vCwyS303ax09c2fY+qJCJw518TY8a3KXvzScLdZU1rRRcjDrSm69a8bsoaQiQEUr/RY2W3eU0iHmzenFsDfgBcjM0fZJtljncnDePWy8L4QJEPcrRuePMpwA7PLXtKRQ839nkHtPnAbBTtp6gtWUpHsP+iUg0CCKmwkc0+dq8sqWuVCMfVZcSyv6Wl3erm3DTPbDKsM7zCqQXwdTaG0WcYnkNmcSsY7OJLGLAhIAt1XWhdRkM2X9iTRfheWetFHJ/X6HsY+4P4gOnM+a+EnOt1mhKcC3N9VmJ7M2O0bWgPU5QTmTLIymnzHZErNZVTsMYEoI8Okpe0M1GkszgJwccLwKFn7M7do3hxEdSKBfiNX/7nMcPUG/KedxJIUKsNnY6JpO71eJjjR0kNDdgemeOjA6kVCHU+nvspqKWihNW/3T4MawSp57WM742DeEMPJJZrWnbsYxW0UAoug62Phfr1B1pSMegrCiJW64UzeS4jEni5HrtA2/uIVCq3t0srhMuhyjkGp1mv6Bfg9VYfRJtb/e0uwEdaE0eHBuBlnWxVGBWkIQnIkj0lz/bSrfiEnUuTUC+9YYZMdODL4sOPsxRCtAT6lA/OVdOuDScZ2G+5DWEs/ENGuJkiETirQxAXdbPWeqtm5XvJyaZ7YVzJZx/RU4Kj+U9yE23xyzdM5UtQJQY7r6Qu1ArdY2YnfPD6y
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(82310400011)(40470700004)(36840700001)(46966006)(40480700001)(36756003)(4326008)(40460700003)(44832011)(26005)(336012)(2906002)(356005)(47076005)(36860700001)(41300700001)(82740400003)(86362001)(2616005)(81166007)(5660300002)(1076003)(54906003)(478600001)(316002)(70586007)(6916009)(966005)(426003)(8676002)(70206006)(6666004)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 14:08:45.0925 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b896ba-2159-4892-644e-08dbe9d23570
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8183
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=517TJwhvtbTeS1FIyoXEsICU3FFClwFzfLBxD8Y6DOU=;
 b=eRfJacBj3GVspJe3rK3ZNp9OJOTep9a9wcY5DBw7Ta7Z68XqDQxyzZEyttQjXYaSk81FbfBmgRrdgbYsTCjcrZ+S7j54WalONV+EOvOaxS3nC7yfvp7B97MpLvcWZhVlXBA9QpJengJCKSNnX3R0xnMuRpCIYG4fVvSiTGmM69A=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eRfJacBj
Subject: [Buildroot] [PATCH v7 02/10] package/gcc-bare-metal: new package
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

VGhpcyBwYXRjaCBhZGRzIGEgbmV3IHBhY2thZ2UgZm9yIGJ1aWxkaW5nIGdjYyBmb3IgYSBiYXJl
LW1ldGFsIHRvb2xjaGFpbi4KVGhlIGNwdSBhcmNoaXRlY3R1cmUgaXMgZGVmaW5lZCBieSBhIHRv
b2xjaGFpbi1iYXJlLW1ldGFsIHZpcnR1YWwgcGFja2FnZS4KV2hpbGUgYW55IGNwdSBhcmNoaXRl
Y3R1cmUgY291bGQgYmUgdXNlZCwgdGhlIGRlZmF1bHQgY29uZmlndXJhdGlvbiB3aWxsIGJlIGEK
WGlsaW54IG1pY3JvYmxhemUgbGl0dGxlIGVuZGlhbiBhcmNoaXRlY3R1cmUsIHNvIHRoYXQgYnVp
bGRyb290IHdpbGwgYmUgYWJsZQp0byBidWlsZCB0aGUgbWljcm9ibGF6ZSBmaXJtd2FyZSBhcHBs
aWNhdGlvbnMgZm9yIHp5bnFtcCBhbmQgdmVyc2FsLgoKU2lnbmVkLW9mZi1ieTogSWJhaSBFcmtp
YWdhIDxpYmFpLmVya2lhZ2EtZWxvcnphQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IE5lYWwgRnJh
Z2VyIDxuZWFsLmZyYWdlckBhbWQuY29tPgotLS0KVjEtPlYyOgogLSByZW1vdmVkIGRlZmF1bHQg
ZW5hYmxlIHRvIGJlIHJlcGxhY2VkIHdpdGggdG9vbGNoYWluIHNlbGVjdCBjb25maWcKVjItPlYz
OgogLSBubyBjaGFuZ2VzClYzLT5WNDoKIC0gc3BsaXQgdGFyIGluc3RydWN0aW9uIGludG8gbXVs
dGlwbGUgbGluZXMKIC0gcmVwbGFjZWQgdW5uZWNlc3NhcnkgPT8gd2l0aCA9IGZvciBhc3NpZ25t
ZW50cwogLSBjaGFuZ2VkIHhsbngtcmVsLXYyMDIzLjEudGFyLmd6IGhhc2ggdG8gc2hhMjU2CiAt
IGltcHJvdmVkIG1lbnVjb25maWcgaGVscCBjb21tZW50ClY0LT5WNToKIC0gbW92ZWQgdG8gdXBz
dHJlYW0gZ2NjIHdpdGhvdXQgYW55IHhpbGlueCBwYXRjaGVzCiAtIHJlZHVjZWQgYWxsIGxpbmVz
IHRvIDw4MCBjaGFycwogLSBhZGRlZCBsaWNlbnNlIGZpbGVzClY1LT5WNjoKIC0gbWlncmF0ZWQg
dG8gdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290ClY2LT5WNzoKIC0gcmVtb3ZlZCBDb25m
aWcuaW4gYW5kIGhhcmQtY29kZWQgdmVyc2lvbgogLSBhZGRlZCBzeXNyb290IGZvciBuZXdsaWIg
aW5zdGFsbAotLS0KIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAyICsKIHBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvMTMuMi4wICAgICAgICAgICAgICB8ICAxICsK
IHBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvZ2NjLWJhcmUtbWV0YWwuaGFzaCB8ICAxICsKIHBhY2th
Z2UvZ2NjLWJhcmUtbWV0YWwvZ2NjLWJhcmUtbWV0YWwubWsgICB8IDY3ICsrKysrKysrKysrKysr
KysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgNzEgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTIwMDAwIHBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvMTMuMi4wCiBjcmVhdGUgbW9kZSAxMjAwMDAg
cGFja2FnZS9nY2MtYmFyZS1tZXRhbC9nY2MtYmFyZS1tZXRhbC5oYXNoCiBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9nY2MtYmFyZS1tZXRhbC5tawoKZGlmZiAtLWdp
dCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IGQwNmIyODA1MDAuLmZkZmQzMGZiNmYg
MTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMTM4Myw2ICsxMzgz
LDcgQEAgRjoJcGFja2FnZS9weXRob24tcnBpLWdwaW8vCiAKIE46CUliYWkgRXJraWFnYSA8aWJh
aS5lcmtpYWdhLWVsb3J6YUBhbWQuY29tPgogRjoJcGFja2FnZS9iaW51dGlscy1iYXJlLW1ldGFs
LworRjoJcGFja2FnZS9nY2MtYmFyZS1tZXRhbC8KIAogTjoJSWduYWN5IEdhd8SZZHpraSA8aWdu
YWN5Lmdhd2VkemtpQGdyZWVuLWNvbW11bmljYXRpb25zLmZyPgogRjoJcGFja2FnZS9hbmd1bGFy
anMvCkBAIC0yMjE5LDYgKzIyMjAsNyBAQCBGOgljb25maWdzL3p5bnFtcF96Y3UxMDJfZGVmY29u
ZmlnCiBGOgljb25maWdzL3p5bnFtcF96Y3UxMDZfZGVmY29uZmlnCiBGOglwYWNrYWdlL2JpbnV0
aWxzLWJhcmUtbWV0YWwvCiBGOglwYWNrYWdlL2Jvb3RnZW4vCitGOglwYWNrYWdlL2djYy1iYXJl
LW1ldGFsLwogRjoJcGFja2FnZS92ZXJzYWwtZmlybXdhcmUvCiAKIE46CU5pY29sYSBEaSBMaWV0
byA8bmljb2xhLmRpbGlldG9AZ21haWwuY29tPgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9nY2MtYmFy
ZS1tZXRhbC8xMy4yLjAgYi9wYWNrYWdlL2djYy1iYXJlLW1ldGFsLzEzLjIuMApuZXcgZmlsZSBt
b2RlIDEyMDAwMAppbmRleCAwMDAwMDAwMDAwLi5iN2E3NWRjN2RkCi0tLSAvZGV2L251bGwKKysr
IGIvcGFja2FnZS9nY2MtYmFyZS1tZXRhbC8xMy4yLjAKQEAgLTAsMCArMSBAQAorLi4vZ2NjLzEz
LjIuMC8KXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlCmRpZmYgLS1naXQgYS9wYWNrYWdlL2dj
Yy1iYXJlLW1ldGFsL2djYy1iYXJlLW1ldGFsLmhhc2ggYi9wYWNrYWdlL2djYy1iYXJlLW1ldGFs
L2djYy1iYXJlLW1ldGFsLmhhc2gKbmV3IGZpbGUgbW9kZSAxMjAwMDAKaW5kZXggMDAwMDAwMDAw
MC4uZDQxN2IwZGM3NwotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvZ2NjLWJhcmUtbWV0YWwv
Z2NjLWJhcmUtbWV0YWwuaGFzaApAQCAtMCwwICsxIEBACisuLi9nY2MvZ2NjLmhhc2gKXCBObyBu
ZXdsaW5lIGF0IGVuZCBvZiBmaWxlCmRpZmYgLS1naXQgYS9wYWNrYWdlL2djYy1iYXJlLW1ldGFs
L2djYy1iYXJlLW1ldGFsLm1rIGIvcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9nY2MtYmFyZS1tZXRh
bC5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4yOGJhYWNkYWFhCi0t
LSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9nY2MtYmFyZS1tZXRhbC5t
awpAQCAtMCwwICsxLDY3IEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyBnY2MtYmFy
ZS1tZXRhbAorIworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKworSE9TVF9HQ0NfQkFSRV9NRVRB
TF9WRVJTSU9OID0gMTMuMi4wCisKK0hPU1RfR0NDX0JBUkVfTUVUQUxfU0lURSA9IFwKKwlodHRw
czovL2Z0cC5nbnUub3JnL2dudS9nY2MvZ2NjLSQoSE9TVF9HQ0NfQkFSRV9NRVRBTF9WRVJTSU9O
KQorSE9TVF9HQ0NfQkFSRV9NRVRBTF9TT1VSQ0UgPSBnY2MtJChIT1NUX0dDQ19CQVJFX01FVEFM
X1ZFUlNJT04pLnRhci54egorCitIT1NUX0dDQ19CQVJFX01FVEFMX0xJQ0VOU0UgPSBHUEwtMi4w
LCBHUEwtMy4wLCBMR1BMLTIuMSwgTEdQTC0zLjAKK0hPU1RfR0NDX0JBUkVfTUVUQUxfTElDRU5T
RV9GSUxFUyA9IENPUFlJTkcgQ09QWUlORzMgQ09QWUlORy5MSUIgQ09QWUlORzMuTElCCisKK0hP
U1RfR0NDX0JBUkVfTUVUQUxfREVQRU5ERU5DSUVTID0gXAorCWhvc3QtYmludXRpbHMtYmFyZS1t
ZXRhbCBcCisJaG9zdC1nbXAgXAorCWhvc3QtbXBjIFwKKwlob3N0LW1wZnIgXAorCWhvc3QtaXNs
CisKKyMgZ2NjIGRvZXNuJ3Qgc3VwcG9ydCBpbi10cmVlIGJ1aWxkLCBzbyB3ZSBjcmVhdGUgYSAn
YnVpbGQnCisjIHN1YmRpcmVjdG9yeSBpbiB0aGUgZ2NjIHNvdXJjZXMsIGFuZCBidWlsZCBmcm9t
IHRoZXJlLgorZGVmaW5lIEdDQ19CQVJFX01FVEFMX0NPTkZJR1VSRV9TWU1MSU5LCisJbWtkaXIg
LXAgJChARCkvYnVpbGQKKwlsbiAtc2YgLi4vY29uZmlndXJlICQoQEQpL2J1aWxkL2NvbmZpZ3Vy
ZQorZW5kZWYKKworSE9TVF9HQ0NfQkFSRV9NRVRBTF9QUkVfQ09ORklHVVJFX0hPT0tTICs9IEdD
Q19CQVJFX01FVEFMX0NPTkZJR1VSRV9TWU1MSU5LCitIT1NUX0dDQ19CQVJFX01FVEFMX1NVQkRJ
UiA9IGJ1aWxkCisKK0hPU1RfR0NDX0JBUkVfTUVUQUxfTUFLRV9PUFRTID0gXAorCSQoSE9TVF9H
Q0NfQ09NTU9OX01BS0VfT1BUUykgXAorCWFsbC1nY2MgXAorCWFsbC10YXJnZXQtbGliZ2NjCisK
K0hPU1RfR0NDX0JBUkVfTUVUQUxfSU5TVEFMTF9PUFRTID0gaW5zdGFsbC1nY2MgaW5zdGFsbC10
YXJnZXQtbGliZ2NjCisKK0hPU1RfR0NDX0JBUkVfTUVUQUxfQVJDSCA9IFwKKwkkKGNhbGwgcXN0
cmlwLCQoQlIyX1RPT0xDSEFJTl9CQVJFX01FVEFMX0JVSUxEUk9PVF9BUkNIKSkKKworSE9TVF9H
Q0NfQkFSRV9NRVRBTF9TWVNST09UID0gJChIT1NUX0RJUikvJChIT1NUX0dDQ19CQVJFX01FVEFM
X0FSQ0gpL3N5c3Jvb3QKKworSE9TVF9HQ0NfQkFSRV9NRVRBTF9DT05GX09QVFMgPSBcCisJLS10
YXJnZXQ9JChIT1NUX0dDQ19CQVJFX01FVEFMX0FSQ0gpIFwKKwktLWRpc2FibGUtaW5pdGZpbmlf
YXJyYXkgXAorCS0tZGlzYWJsZS1fX2N4YV9hdGV4aXQgXAorCS0tZGlzYWJsZS1saWJzdGRjeHgt
cGNoIFwKKwktLXdpdGgtbmV3bGliIFwKKwktLWRpc2FibGUtdGhyZWFkcyBcCisJLS1lbmFibGUt
cGx1Z2lucyBcCisJLS13aXRoLWdudS1hcyBcCisJLS1kaXNhYmxlLWxpYml0bSBcCisJLS13aXRo
b3V0LWxvbmctZG91YmxlLTEyOCBcCisJLS13aXRob3V0LWhlYWRlcnMgXAorCS0tZW5hYmxlLWxh
bmd1YWdlcz1jIFwKKwktLWRpc2FibGUtbXVsdGlsaWIgXAorCS0td2l0aC1nbXA9JChIT1NUX0RJ
UikgXAorCS0td2l0aC1tcGM9JChIT1NUX0RJUikgXAorCS0td2l0aC1tcGZyPSQoSE9TVF9ESVIp
IFwKKwktLXdpdGgtaXNsPSQoSE9TVF9ESVIpIFwKKwktLXdpdGgtc3lzcm9vdD0kKEhPU1RfR0ND
X0JBUkVfTUVUQUxfU1lTUk9PVCkgXAorCUFSX0ZPUl9UQVJHRVQ9JChIT1NUX0RJUikvYmluLyQo
SE9TVF9HQ0NfQkFSRV9NRVRBTF9BUkNIKS1hciBcCisJUkFOTElCX0ZPUl9UQVJHRVQ9JChIT1NU
X0RJUikvYmluLyQoSE9TVF9HQ0NfQkFSRV9NRVRBTF9BUkNIKS1yYW5saWIKKworJChldmFsICQo
aG9zdC1hdXRvdG9vbHMtcGFja2FnZSkpCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
