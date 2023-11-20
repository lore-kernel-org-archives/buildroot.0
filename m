Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374A8C2BB3F
	for <buildroot@archiver.kernel.org>; Mon, 20 Nov 2023 14:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7B13818CD;
	Mon, 20 Nov 2023 14:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7B13818CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ettqhYDOU_mG; Mon, 20 Nov 2023 14:09:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA277818C2;
	Mon, 20 Nov 2023 14:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA277818C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3AD9E1BF5B3
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 14:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 117D0404FE
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 14:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 117D0404FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bM68s36egdJL for <buildroot@lists.busybox.net>;
 Mon, 20 Nov 2023 14:09:17 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::60f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 016F64010F
 for <buildroot@buildroot.org>; Mon, 20 Nov 2023 14:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 016F64010F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V92P/ZX25RoHXWG8x4rsMcC6suZZmbHXXZ3jqVS4P77OMnBYCsgkQpGJCE6G56RORB8FWVgmc59GZ/K2+YwfyaYRXLG9VAiReag54OOBD/gCusa0KfI1+vX+Py+6OxVDSMZClcTn/JbRl9hXFykDnGkWtoo+NafflrQrWW4xqmwznOurPLVxl/S/yHgOLixJeQmf7x/YATalW3ggLQAewpxydYUERwDY2TFUtDloQDf2xt/eVxYZt/IXlkewFrvytBwDnDJ7Df7SZ1nXaS3SlD5vlscXkF7Ast+GPPT89H5bM7gUKu6wFDOkwtVvb3QN4k1dfPyqIte/ZwHBVOTqlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdrH/8eEWR7y5XSfYcZhQB1m1mj8eeLDwDPxMagkda0=;
 b=mwalzoN9K5tax0lxqEZM+YoSOq+RIVdCcf8WHN/EJ6hQprcOwkD+uNdnHUIQOi0iobhQrKDKLeH5vZdgrE6J6yGa5MHs7VkPyZWSsTvir8dX76RwZH7FPePIdmkSlCzDk/dKbHb+KGBKSjfvD5LR8ihXZO841ZM5JxPImFBr8ABSqp8RKJhXAAbGStrzA1V3rIngc1irzCA7tmuwjEuUj4EOO4fpVfHkZPlTmEuh5fxH4QAqp9fS0NNp9BRtG8mGajRH/4zbDsFXE3NlDA2Cf05lzb2GF2mwmNkDDk6233eJfvmZmfs7sF2oKE/Xnt5GiYGSfsvuvm671dVNX9mFEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH2PR02CA0022.namprd02.prod.outlook.com (2603:10b6:610:4e::32)
 by CH3PR12MB8583.namprd12.prod.outlook.com (2603:10b6:610:15f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 14:09:11 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::b5) by CH2PR02CA0022.outlook.office365.com
 (2603:10b6:610:4e::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Mon, 20 Nov 2023 14:09:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Mon, 20 Nov 2023 14:09:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 20 Nov
 2023 08:09:10 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 20 Nov
 2023 08:09:10 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 20 Nov 2023 08:09:09 -0600
To: <buildroot@buildroot.org>
Date: Mon, 20 Nov 2023 14:08:22 +0000
Message-ID: <20231120140828.1903865-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231120140828.1903865-1-neal.frager@amd.com>
References: <20231120140828.1903865-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|CH3PR12MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: a93c0e09-6ae5-455a-7818-08dbe9d24503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qFld3Xhsi38ku+lNdWB9FjHn+wBpv9sOpzUDOQNCqXHRYAKjIk4es6g8fiSGDb6XG0MJjrOHMjQlT5Ra+sQzwPGvZLHncwHq91Q3fYhIj5XzStVxAjx2/e0v5Jh6GcN/Ke96wlLlSFjcg7udPjfjTmdddjqyALsNFv0fsnpnBou++WjMovDGQUfG5Mzo2GXpd1fesWD9u35xhL5KHZwry+O1NiAG7y6qucC4MgC4nag8AUT6cj/EU3uJHsB+1Y9jYbWKeAMf299IT71Bpenbjdw1lptLT2mrQh86nk+t8yflT22ElFcrARdIc4LVpyfrC3sAS1yZSrYhX5P9GLGxwLcO9WfU8WBuCOktWv7TFy5IALZIcVHekuXZ/efuBdBr7Urvz5CUAsMXw1Bpib72xkFclFFRrrLcq1l5cRABG/TuDMkGwZhvUPnEHe7ImYy7wN+UBT69UbhSIM+GWIE45HyPQ5/TfxCFYsUCGu9fJIPXraHHIxbinMe7rydrxpN6i6BNASME3sHPSitW4rApc8/Mv6PuwSnsaaDhVSQ0k62MK+ZDXKAayvNyINvRry987wErVvL456O0UTCeHmAm8DafQM4LKvYvlW4k9CB13XVkBVTwVfhozOVoSwmgIg6L/xblbfe35OZvNodGSsHoqktJKUu2Hy0GbkIkGMTZ1MGiGbxEd5a/BbGakZ+B4T4shEnmYdtNekQ9qEwMa76qtr6MTnOBm5xLwzQ7wbh/dvlUGxPuc20OXkBj5mNoDyYrd4gugmFWzoAK52oTHOwt5w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(186009)(64100799003)(82310400011)(451199024)(1800799012)(36840700001)(46966006)(40470700004)(82740400003)(426003)(336012)(36756003)(86362001)(40460700003)(36860700001)(81166007)(47076005)(356005)(70206006)(70586007)(6916009)(54906003)(4326008)(8676002)(316002)(41300700001)(8936002)(5660300002)(2906002)(44832011)(1076003)(40480700001)(2616005)(26005)(478600001)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 14:09:11.2535 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a93c0e09-6ae5-455a-7818-08dbe9d24503
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8583
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdrH/8eEWR7y5XSfYcZhQB1m1mj8eeLDwDPxMagkda0=;
 b=cQkO3UwKp/g+WymwV/wL7wUN5Sgpb/AH4aIcuvmHyWDhI544/xmkyt5BAU7KSVpjKcWAeFpieWKe8qSYaVCSvbgdElXbjxQZ2p83qVHto8QFMjCrO5VS3S8TVwsIrVo08zLsszFcQK5jYqSay91IlAHW8dtzv2csp3mTub1uN4M=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=cQkO3UwK
Subject: [Buildroot] [PATCH v7 04/10]
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
Y29uZmlnIGxpc3QKLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAyICsrCiB0b29sY2hhaW4vQ29uZmlnLmluICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDExICsrKysrKysrKysrCiB0b29sY2hhaW4vdG9vbGNoYWlu
LWJhcmUtbWV0YWwtYnVpbGRyb290L0NvbmZpZy5pbiAgICB8IDExICsrKysrKysrKysrCiAuLi4v
dG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290Lm1rICAgICAgICAgICAgICAgICB8ICA5ICsr
KysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgdG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9vdC9Db25maWcuaW4K
IGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29sY2hhaW4vdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRy
b290L3Rvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9vdC5tawoKZGlmZiAtLWdpdCBhL0RFVkVM
T1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDE1MjExNWNmM2IuLjUzZTI0YWViZWQgMTAwNjQ0Ci0t
LSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMTM4NSw2ICsxMzg1LDcgQEAgTjoJ
SWJhaSBFcmtpYWdhIDxpYmFpLmVya2lhZ2EtZWxvcnphQGFtZC5jb20+CiBGOglwYWNrYWdlL2Jp
bnV0aWxzLWJhcmUtbWV0YWwvCiBGOglwYWNrYWdlL2djYy1iYXJlLW1ldGFsLwogRjoJcGFja2Fn
ZS9uZXdsaWItYmFyZS1tZXRhbC8KK0Y6CXRvb2xjaGFpbi90b29sY2hhaW4tYmFyZS1tZXRhbC1i
dWlsZHJvb3QvCiAKIE46CUlnbmFjeSBHYXfEmWR6a2kgPGlnbmFjeS5nYXdlZHpraUBncmVlbi1j
b21tdW5pY2F0aW9ucy5mcj4KIEY6CXBhY2thZ2UvYW5ndWxhcmpzLwpAQCAtMjIyNCw2ICsyMjI1
LDcgQEAgRjoJcGFja2FnZS9ib290Z2VuLwogRjoJcGFja2FnZS9nY2MtYmFyZS1tZXRhbC8KIEY6
CXBhY2thZ2UvbmV3bGliLWJhcmUtbWV0YWwvCiBGOglwYWNrYWdlL3ZlcnNhbC1maXJtd2FyZS8K
K0Y6CXRvb2xjaGFpbi90b29sY2hhaW4tYmFyZS1tZXRhbC1idWlsZHJvb3QvCiAKIE46CU5pY29s
YSBEaSBMaWV0byA8bmljb2xhLmRpbGlldG9AZ21haWwuY29tPgogRjoJcGFja2FnZS91YWNtZS8K
ZGlmZiAtLWdpdCBhL3Rvb2xjaGFpbi9Db25maWcuaW4gYi90b29sY2hhaW4vQ29uZmlnLmluCmlu
ZGV4IDM0ZTBhZTJjNWYuLjVmMDQ3Mzk2ZDMgMTAwNjQ0Ci0tLSBhL3Rvb2xjaGFpbi9Db25maWcu
aW4KKysrIGIvdG9vbGNoYWluL0NvbmZpZy5pbgpAQCAtOTIzLDQgKzkyMywxNSBAQCBjb25maWcg
QlIyX1RPT0xDSEFJTl9IQVNfTElCUVVBRE1BVEgKIAlkZWZhdWx0IHkgaWYgQlIyX2kzODYgfHwg
QlIyX3g4Nl82NAogCWRlZmF1bHQgeSBpZiBCUjJfUE9XRVJQQ19DUFVfSEFTX1ZTWAogCitjb21t
ZW50ICJCYXJlIG1ldGFsIHRvb2xjaGFpbiIKKworY29uZmlnIEJSMl9UT09MQ0hBSU5fQkFSRV9N
RVRBTF9CVUlMRFJPT1QKKwlib29sICJCdWlsZHJvb3QgYmFyZSBtZXRhbCB0b29sY2hhaW4iCisJ
c2VsZWN0IEJSMl9QQUNLQUdFX05FV0xJQl9CQVJFX01FVEFMCisJaGVscAorCSAgU2VsZWN0IGlm
IHlvdSBuZWVkIGEgYmFyZS1tZXRhbCB0b29sY2hhaW4gZm9yIGJ1aWxkaW5nCisJICBwbGF0Zm9y
bSBzcGVjaWZpYyBmaXJtd2FyZSBpbWFnZXMuCisKK3NvdXJjZSAidG9vbGNoYWluL3Rvb2xjaGFp
bi1iYXJlLW1ldGFsLWJ1aWxkcm9vdC9Db25maWcuaW4iCisKIGVuZG1lbnUKZGlmZiAtLWdpdCBh
L3Rvb2xjaGFpbi90b29sY2hhaW4tYmFyZS1tZXRhbC1idWlsZHJvb3QvQ29uZmlnLmluIGIvdG9v
bGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9vdC9Db25maWcuaW4KbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZDYyZGZlODE0MQotLS0gL2Rldi9udWxsCisr
KyBiL3Rvb2xjaGFpbi90b29sY2hhaW4tYmFyZS1tZXRhbC1idWlsZHJvb3QvQ29uZmlnLmluCkBA
IC0wLDAgKzEsMTEgQEAKK2lmIEJSMl9UT09MQ0hBSU5fQkFSRV9NRVRBTF9CVUlMRFJPT1QKKwor
Y29uZmlnIEJSMl9UT09MQ0hBSU5fQkFSRV9NRVRBTF9CVUlMRFJPT1RfQVJDSAorCXN0cmluZyAi
dG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290IGFyY2giCisJZGVmYXVsdCAibWljcm9ibGF6
ZWVsLXhpbGlueC1lbGYiCisJaGVscAorCSAgc2VsZWN0IGFyY2hpdGVjdHVyZSBmb3IgYmFyZS1t
ZXRhbCB0b29sY2hhaW4KKworc291cmNlICJwYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL0NvbmZp
Zy5pbiIKKworZW5kaWYgIyBCUjJfVE9PTENIQUlOX0JBUkVfTUVUQUxfQlVJTERST09UCmRpZmYg
LS1naXQgYS90b29sY2hhaW4vdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290L3Rvb2xjaGFp
bi1iYXJlLW1ldGFsLWJ1aWxkcm9vdC5tayBiL3Rvb2xjaGFpbi90b29sY2hhaW4tYmFyZS1tZXRh
bC1idWlsZHJvb3QvdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290Lm1rCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjlkMjZjMGVlZjgKLS0tIC9kZXYvbnVsbAorKysg
Yi90b29sY2hhaW4vdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290L3Rvb2xjaGFpbi1iYXJl
LW1ldGFsLWJ1aWxkcm9vdC5tawpAQCAtMCwwICsxLDkgQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCisjCisjIHRvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9vdAorIworIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKKworVE9PTENIQUlOX0JBUkVfTUVUQUxfQlVJTERST09UX0RFUEVOREVOQ0lF
UyA9IG5ld2xpYi1iYXJlLW1ldGFsCisKKyQoZXZhbCAkKHZpcnR1YWwtcGFja2FnZSkpCi0tIAoy
LjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
