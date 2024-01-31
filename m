Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F36C47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 11:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F68A614AA;
	Wed, 31 Jan 2024 11:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F68A614AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K9gLjkYCuolc; Wed, 31 Jan 2024 11:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A704961503;
	Wed, 31 Jan 2024 11:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A704961503
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D3A781BF5E6
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FB5461508
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FB5461508
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9Y7F3EgQYHQ for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 11:22:55 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::600])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BADF614D4
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 11:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BADF614D4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKjpsw+S/trX4lRPMoHCdcpwsAT2ByzQ/eoSq3jeEmJqC4U6UzEYNESVxkLMxqhQuo8XehI0JynfP4wXsT6DxQ3UUW1wbo+U7GzrmeD+3tbggAiimdTR8vsZqmBiKtkNby3YibzpgvaMZW5uMKOmsxv99/3xbnO6BfMtMoG6ZX/9atlNbp2OdHVnf5VrQlRQQLcy8xyvw0HkkySc1M5lyOia71lxsV4lXzRiqK6r8rz3vg2fuHhnufGPioa/FEXtjur6rL9iD8kUivZcFZI09GIcRcu66fPNZq2aaYuLTYJ43lsaZb/Hddd6oGcW+2zEZjZv//HIqNd0HVSoaWQdLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8D65lLhR/TDyfGWGcDk2xkVCW3a/d7yIttleyhLCPo=;
 b=WW5zMA62/9CaqB1V5yb2cwB6IXG1wW73STSuZe3ZA+mTxPPKDI9ikfr3NUDaHD+gsAYrX4dRaWV7d+eNBzB4sgH/1AWOcv3qd00J0KgqJiB1UoZ3G2lyE6oSfz/B7poSXfbNLfMl6ZQXfw98OOOwpWRt37Lbvccaxs360CLagzdhRDfGNrCIjOIhsfSk71/em+hEJyD+3iGI2ShNZ/2SnCbMRX6MPgOi/NalI/ry3DUODxtc9ehZG6X9GBQhDS2v37ip8Q0Hbxf+6YriDztQkJYdT4XICwZ5na1xjJsIH1cl4WSWQ/Cqd+LnQ01Yq7zaTtecSHJ6SCawQssxUMTEPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR03CA0158.namprd03.prod.outlook.com (2603:10b6:a03:338::13)
 by DS0PR12MB8785.namprd12.prod.outlook.com (2603:10b6:8:14c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 11:22:52 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::d2) by SJ0PR03CA0158.outlook.office365.com
 (2603:10b6:a03:338::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Wed, 31 Jan 2024 11:22:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 31 Jan 2024 11:22:50 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 05:22:49 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 31 Jan
 2024 03:22:49 -0800
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 31 Jan 2024 05:22:48 -0600
To: <buildroot@buildroot.org>
Date: Wed, 31 Jan 2024 11:22:15 +0000
Message-ID: <20240131112223.2175855-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131112223.2175855-1-neal.frager@amd.com>
References: <20240131112223.2175855-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|DS0PR12MB8785:EE_
X-MS-Office365-Filtering-Correlation-Id: dadb6e16-ab18-44b2-2d4f-08dc224ef5ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pPNUXQYrN/M7RpuPbG8g1ircZFTL6JpA20zO80GOSBekuL49cO9uV4GQl1svptkrq7xc+sLx2oZfyWTTOCIzfEJXLIxW4aNBA1VPxZJw8WhCX8f4O2oLtpImxiVcXyRmPKrrvqlMUnPQqeW70jVb/9dkrskhC1ouP/+gW6YGGhYsyfaG6ZOEoH3rA6kcZkymD06MPRUJDmS0b3rh7kNBdIYEy6DJawMN7a4hDOXdP1Z41bZUnC8/uxAhIMKNBwM/TRJElnvkk4HsR9wsG0W2FyNtYdYAoB09Gk2Vp1FhpWeM05UcFvzDpxBbF8t01odZgQdlvCZKioWDStrt9HES6d9U2aTD1yhfsCXz/VBzftHFFG8x26wyDZ+1oCX3vM8Pp+i7phZ5TIAtl47UajPVb/xyqXovf9DGt3ycnfYkgH88nq16fbdU0nmI/xPi7mgWp0RCo7lpmbJBO7/pT4x8H/vaOnk7+tEpQxUPwHNOzePTzyeIEr3lfunyaLwkezxGF9pt0W8s5intTUVwQSZtdhcEotqMJM3buuUub7KEnzZlMeC8lY7eS7lGTrjfMEAnfwTh6JCV04BIxB8RgRXJa1y1jmluUxpReJAWEQ7XFbj3NYHB/3AUmZXkS/wy5Ie9lFrFK3XBT9FsOCCguYdNc19ZprHhFJL63pjYc/Ktp62MO77W0PGx3/aMTeU4KQZYKEwI17gJg/frxyKC7Ss5Zp3cbwdCRqHqylPcxCGAqlXHJr/wwGncpcivEv0m/NsY
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(1800799012)(186009)(82310400011)(451199024)(64100799003)(36840700001)(40470700004)(46966006)(41300700001)(1076003)(336012)(426003)(40460700003)(40480700001)(36756003)(47076005)(36860700001)(6666004)(26005)(2616005)(478600001)(81166007)(82740400003)(356005)(2906002)(966005)(86362001)(44832011)(5660300002)(54906003)(316002)(70206006)(70586007)(6916009)(4326008)(8676002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 11:22:50.4822 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dadb6e16-ab18-44b2-2d4f-08dc224ef5ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8785
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8D65lLhR/TDyfGWGcDk2xkVCW3a/d7yIttleyhLCPo=;
 b=U6+agO1YgMwetkscv12ChbyvsCCExwHBLF87Js6xSSM2KcicTmZR/Wz30LIPPazbKaTryOhcDGSA8uvl/5HPjLnp9tq8hun+0jaBlbjXKRIp2zNM6B8z304HAPJJ5Oei6eAUwEUpJDcQDdGNw9KO/ES/u1ZVT1uWNTma86RjQxw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=U6+agO1Y
Subject: [Buildroot] [PATCH v9 03/11] package/gcc-bare-metal: new package
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
aWNhdGlvbnMgZm9yIHp5bnFtcCBhbmQgdmVyc2FsLgoKU2lnbmVkLW9mZi1ieTogTmVhbCBGcmFn
ZXIgPG5lYWwuZnJhZ2VyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEliYWkgRXJraWFnYSA8aWJh
aS5lcmtpYWdhLWVsb3J6YUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25p
IDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgotLS0KVjEtPlYyOgogLSByZW1vdmVkIGRl
ZmF1bHQgZW5hYmxlIHRvIGJlIHJlcGxhY2VkIHdpdGggdG9vbGNoYWluIHNlbGVjdCBjb25maWcK
VjItPlYzOgogLSBubyBjaGFuZ2VzClYzLT5WNDoKIC0gc3BsaXQgdGFyIGluc3RydWN0aW9uIGlu
dG8gbXVsdGlwbGUgbGluZXMKIC0gcmVwbGFjZWQgdW5uZWNlc3NhcnkgPT8gd2l0aCA9IGZvciBh
c3NpZ25tZW50cwogLSBjaGFuZ2VkIHhsbngtcmVsLXYyMDIzLjEudGFyLmd6IGhhc2ggdG8gc2hh
MjU2CiAtIGltcHJvdmVkIG1lbnVjb25maWcgaGVscCBjb21tZW50ClY0LT5WNToKIC0gbW92ZWQg
dG8gdXBzdHJlYW0gZ2NjIHdpdGhvdXQgYW55IHhpbGlueCBwYXRjaGVzCiAtIHJlZHVjZWQgYWxs
IGxpbmVzIHRvIDw4MCBjaGFycwogLSBhZGRlZCBsaWNlbnNlIGZpbGVzClY1LT5WNjoKIC0gbWln
cmF0ZWQgdG8gdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290ClY2LT5WNzoKIC0gcmVtb3Zl
ZCBDb25maWcuaW4gYW5kIGhhcmQtY29kZWQgdmVyc2lvbgogLSBhZGRlZCBzeXNyb290IGZvciBu
ZXdsaWIgaW5zdGFsbApWNy0+Vjg6CiAtIG5vIGNoYW5nZXMKVjgtPlY5OgogLSBpbnRlZ3JhdGVk
IGNoYW5nZXMgZnJvbSBUaG9tYXMKLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMiArCiBwYWNrYWdlL2djYy1iYXJlLW1ldGFsLzEzLjIuMCAgICAgICAg
ICAgICAgfCAgMSArCiBwYWNrYWdlL2djYy1iYXJlLW1ldGFsL2djYy1iYXJlLW1ldGFsLmhhc2gg
fCAgMSArCiBwYWNrYWdlL2djYy1iYXJlLW1ldGFsL2djYy1iYXJlLW1ldGFsLm1rICAgfCA2MSAr
KysrKysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKykK
IGNyZWF0ZSBtb2RlIDEyMDAwMCBwYWNrYWdlL2djYy1iYXJlLW1ldGFsLzEzLjIuMAogY3JlYXRl
IG1vZGUgMTIwMDAwIHBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvZ2NjLWJhcmUtbWV0YWwuaGFzaAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvZ2NjLWJhcmUtbWV0YWwu
bWsKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCBlNzhiZDRkYzAy
Li5hZjZjMDFjNzJmIDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAg
LTEzODcsNiArMTM4Nyw3IEBAIEY6CXBhY2thZ2UvcHl0aG9uLXJwaS1ncGlvLwogCiBOOglJYmFp
IEVya2lhZ2EgPGliYWkuZXJraWFnYS1lbG9yemFAYW1kLmNvbT4KIEY6CXBhY2thZ2UvYmludXRp
bHMtYmFyZS1tZXRhbC8KK0Y6CXBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvCiBGOgl0b29sY2hhaW4v
dG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290LwogCiBOOglJZ25hY3kgR2F3xJlkemtpIDxp
Z25hY3kuZ2F3ZWR6a2lAZ3JlZW4tY29tbXVuaWNhdGlvbnMuZnI+CkBAIC0yMjQzLDYgKzIyNDQs
NyBAQCBGOgljb25maWdzL3p5bnFtcF96Y3UxMDRfZGVmY29uZmlnCiBGOgljb25maWdzL3p5bnFt
cF96Y3UxMDZfZGVmY29uZmlnCiBGOglwYWNrYWdlL2JpbnV0aWxzLWJhcmUtbWV0YWwvCiBGOglw
YWNrYWdlL2Jvb3RnZW4vCitGOglwYWNrYWdlL2djYy1iYXJlLW1ldGFsLwogRjoJcGFja2FnZS92
ZXJzYWwtZmlybXdhcmUvCiBGOgl0b29sY2hhaW4vdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRy
b290LwogCmRpZmYgLS1naXQgYS9wYWNrYWdlL2djYy1iYXJlLW1ldGFsLzEzLjIuMCBiL3BhY2th
Z2UvZ2NjLWJhcmUtbWV0YWwvMTMuMi4wCm5ldyBmaWxlIG1vZGUgMTIwMDAwCmluZGV4IDAwMDAw
MDAwMDAuLmI3YTc1ZGM3ZGQKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2djYy1iYXJlLW1l
dGFsLzEzLjIuMApAQCAtMCwwICsxIEBACisuLi9nY2MvMTMuMi4wLwpcIE5vIG5ld2xpbmUgYXQg
ZW5kIG9mIGZpbGUKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvZ2NjLWJhcmUt
bWV0YWwuaGFzaCBiL3BhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvZ2NjLWJhcmUtbWV0YWwuaGFzaApu
ZXcgZmlsZSBtb2RlIDEyMDAwMAppbmRleCAwMDAwMDAwMDAwLi5kNDE3YjBkYzc3Ci0tLSAvZGV2
L251bGwKKysrIGIvcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9nY2MtYmFyZS1tZXRhbC5oYXNoCkBA
IC0wLDAgKzEgQEAKKy4uL2djYy9nY2MuaGFzaApcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvZ2NjLWJhcmUtbWV0YWwubWsgYi9w
YWNrYWdlL2djYy1iYXJlLW1ldGFsL2djYy1iYXJlLW1ldGFsLm1rCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAuLmYzOTFmMDk0ZmUKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNr
YWdlL2djYy1iYXJlLW1ldGFsL2djYy1iYXJlLW1ldGFsLm1rCkBAIC0wLDAgKzEsNjEgQEAKKyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIGdjYy1iYXJlLW1ldGFsCisjCisjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIworCitIT1NUX0dDQ19CQVJFX01FVEFMX1ZFUlNJT04gPSAxMy4yLjAKK0hP
U1RfR0NDX0JBUkVfTUVUQUxfU0lURSA9IFwKKwlodHRwczovL2Z0cC5nbnUub3JnL2dudS9nY2Mv
Z2NjLSQoSE9TVF9HQ0NfQkFSRV9NRVRBTF9WRVJTSU9OKQorSE9TVF9HQ0NfQkFSRV9NRVRBTF9T
T1VSQ0UgPSBnY2MtJChIT1NUX0dDQ19CQVJFX01FVEFMX1ZFUlNJT04pLnRhci54egorCitIT1NU
X0dDQ19CQVJFX01FVEFMX0xJQ0VOU0UgPSBHUEwtMi4wLCBHUEwtMy4wLCBMR1BMLTIuMSwgTEdQ
TC0zLjAKK0hPU1RfR0NDX0JBUkVfTUVUQUxfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgQ09QWUlO
RzMgQ09QWUlORy5MSUIgQ09QWUlORzMuTElCCisKK0hPU1RfR0NDX0JBUkVfTUVUQUxfREVQRU5E
RU5DSUVTID0gXAorCWhvc3QtYmludXRpbHMtYmFyZS1tZXRhbCBcCisJaG9zdC1nbXAgXAorCWhv
c3QtbXBjIFwKKwlob3N0LW1wZnIgXAorCWhvc3QtaXNsCisKKyMgZ2NjIGRvZXNuJ3Qgc3VwcG9y
dCBpbi10cmVlIGJ1aWxkLCBzbyB3ZSBjcmVhdGUgYSAnYnVpbGQnCisjIHN1YmRpcmVjdG9yeSBp
biB0aGUgZ2NjIHNvdXJjZXMsIGFuZCBidWlsZCBmcm9tIHRoZXJlLgorZGVmaW5lIEdDQ19CQVJF
X01FVEFMX0NPTkZJR1VSRV9TWU1MSU5LCisJbWtkaXIgLXAgJChARCkvYnVpbGQKKwlsbiAtc2Yg
Li4vY29uZmlndXJlICQoQEQpL2J1aWxkL2NvbmZpZ3VyZQorZW5kZWYKKworSE9TVF9HQ0NfQkFS
RV9NRVRBTF9QUkVfQ09ORklHVVJFX0hPT0tTICs9IEdDQ19CQVJFX01FVEFMX0NPTkZJR1VSRV9T
WU1MSU5LCitIT1NUX0dDQ19CQVJFX01FVEFMX1NVQkRJUiA9IGJ1aWxkCisKK0hPU1RfR0NDX0JB
UkVfTUVUQUxfTUFLRV9PUFRTID0gXAorCSQoSE9TVF9HQ0NfQ09NTU9OX01BS0VfT1BUUykgXAor
CWFsbC1nY2MgXAorCWFsbC10YXJnZXQtbGliZ2NjCisKK0hPU1RfR0NDX0JBUkVfTUVUQUxfSU5T
VEFMTF9PUFRTID0gaW5zdGFsbC1nY2MgaW5zdGFsbC10YXJnZXQtbGliZ2NjCisKK0hPU1RfR0ND
X0JBUkVfTUVUQUxfQ09ORl9PUFRTID0gXAorCS0tdGFyZ2V0PSQoVE9PTENIQUlOX0JBUkVfTUVU
QUxfQlVJTERST09UX0FSQ0hfVFVQTEUpIFwKKwktLWRpc2FibGUtaW5pdGZpbmlfYXJyYXkgXAor
CS0tZGlzYWJsZS1fX2N4YV9hdGV4aXQgXAorCS0tZGlzYWJsZS1saWJzdGRjeHgtcGNoIFwKKwkt
LXdpdGgtbmV3bGliIFwKKwktLWRpc2FibGUtdGhyZWFkcyBcCisJLS1lbmFibGUtcGx1Z2lucyBc
CisJLS13aXRoLWdudS1hcyBcCisJLS1kaXNhYmxlLWxpYml0bSBcCisJLS13aXRob3V0LWxvbmct
ZG91YmxlLTEyOCBcCisJLS13aXRob3V0LWhlYWRlcnMgXAorCS0tZW5hYmxlLWxhbmd1YWdlcz1j
IFwKKwktLWRpc2FibGUtbXVsdGlsaWIgXAorCS0td2l0aC1nbXA9JChIT1NUX0RJUikgXAorCS0t
d2l0aC1tcGM9JChIT1NUX0RJUikgXAorCS0td2l0aC1tcGZyPSQoSE9TVF9ESVIpIFwKKwktLXdp
dGgtaXNsPSQoSE9TVF9ESVIpIFwKKwktLXdpdGgtc3lzcm9vdD0kKFRPT0xDSEFJTl9CQVJFX01F
VEFMX0JVSUxEUk9PVF9TWVNST09UKSBcCisJQVJfRk9SX1RBUkdFVD0kKEhPU1RfRElSKS9iaW4v
JChUT09MQ0hBSU5fQkFSRV9NRVRBTF9CVUlMRFJPT1RfQVJDSF9UVVBMRSktYXIgXAorCVJBTkxJ
Ql9GT1JfVEFSR0VUPSQoSE9TVF9ESVIpL2Jpbi8kKFRPT0xDSEFJTl9CQVJFX01FVEFMX0JVSUxE
Uk9PVF9BUkNIX1RVUExFKS1yYW5saWIKKworJChldmFsICQoaG9zdC1hdXRvdG9vbHMtcGFja2Fn
ZSkpCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
