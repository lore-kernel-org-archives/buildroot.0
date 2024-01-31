Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA8FC47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 11:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E54F614F1;
	Wed, 31 Jan 2024 11:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E54F614F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NFE8xzqc7Vxh; Wed, 31 Jan 2024 11:22:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A15C5614D4;
	Wed, 31 Jan 2024 11:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A15C5614D4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D52EB1BF5E6
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B620D614D4
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B620D614D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jixo-T_sxP4F for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 11:22:35 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C537614AA
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 11:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C537614AA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZbUbC6ot4CLy3NvNL83Tg7cP0qOA4/AEG5pDlCqUiSKR7FwQ9gw2FynG8hhNyBdKLv6yCeXSLYNas0J4/3em/C8T6ewelVnq7mBZl5aI6qy3pFHNF1aYurX8PZBOXv87mL7jWLJNsrHGqVIBm2fCgczkSl3yaLCcUUiAUg1DDObo8KHFK0chOmoGaTYnkRCoZVqssmYSdTB+rYx5KiyhWXasVWRHmoiDI8AGfPsypSjH3ceyISCu6v6T6TVKP4wRgYieuikM6291krLXapD5CSZ0nHhkcpTz8vft8DVaYoDM4TEKCBdFgTC5u8yna2Yal00LwIrP5j0sa53NgLAjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtE9+qY0PDEe2ucHCaFRyMsV3BpXIzEK5uZaEmofVH0=;
 b=gODGr8JtTqVbxp4GRCpPWdI3ffQfHAo3ELowMrDYmR7S3ASddaJq2kWHw55U/v1HB6G90mTJkIoWMVj4pmm3hTmS3JDXSwoM7WxuciozK7lCeoA2IkddTbR+HvPhb4keSUvFyezIFM2T4TRc5YpP9Y8+UooOOnQNcyf4lcSOUR1cLVsZxOV6N4FIG1rMoqSWURSW3NeRMQnm8ZkGzXCh6p+rigQWbRU4wNVoPqoSAuWROjn694kgDt4/k0SyMJEA8ajm921kgoOw7hCoFeIIwYWZnkWDVYJ38OmcVMZ97H9a+OsHBUk3y471tHV1sMldl2SqI6VpGYcd8vkBLN/qTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR13CA0003.namprd13.prod.outlook.com (2603:10b6:5:bc::16) by
 BL0PR12MB4914.namprd12.prod.outlook.com (2603:10b6:208:1c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 11:22:30 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:5:bc:cafe::2e) by DM6PR13CA0003.outlook.office365.com
 (2603:10b6:5:bc::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Wed, 31 Jan 2024 11:22:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 31 Jan 2024 11:22:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 05:22:28 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 31 Jan 2024 05:22:27 -0600
To: <buildroot@buildroot.org>
Date: Wed, 31 Jan 2024 11:22:13 +0000
Message-ID: <20240131112223.2175855-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|BL0PR12MB4914:EE_
X-MS-Office365-Filtering-Correlation-Id: 8491f429-1c94-4c18-6588-08dc224ee8f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B8dZRiwtCqLaqtF0/WZa+9FnA+d4fqqxn/Giqrm5hN0qXmD8OoDIJc9ikV0GxSlRcnJMbgtYzh7yjFUb7cek4SaNR1ED8D63rQiok/aLfhJZhYoooSyvbj4PNTI8Tke+V6v+GotZmOo2dMjxIrEWR2aghZHcoRT0RQqxvHGo8aIme/H4HayIgKW3ne/w1mDsNMX0Z53u5pWlnumZB1fy8v+BSNT3maSIWFfDipgOVS4ddGRmwEdp/8jKA1vdNGXuz9gDcE83kD8/683JwOiyPIYiWtC+UriMgXTiFSg0EUoARTBPC8gizTrD08v6DYk8DziyiwDu/W6V7A6vJjv71Lc7WuOPE0mEYK0p3juvq68Gb/zaXjHoI3AsnqX/OQQw8ZgsJ34MJ5Oaj1R+vt8haGdfyctO50kkfSOifeA5WyaHztONuejohtCox4ahePSNuf7M3CzKffNzBLq+9AyeiqtxciZzDN+PPBp/7SpCwI55/WjJ199cEqZ1tPur7u9dpg/Hi5g01mW61gjyYw35/13dc8yX2OINLpDYzpf7E7yz8XzFYlGLX/TPx0Ih7gpwdSZu0CRAe/gTFVrqg7nAHOzDT+X/8ut8A90JH1FNGqlT4jVBe5i6a2m798vW43T3V+CMMen6pz64Exg32TnYt3IHarikqtsWZ9fVFwwY5i+sVSg9g2aLLfJHZmQSz8y2KmU85H+ZDfgM1qJNwwXn2SodOU8xn0A15JDCllvxFpkXV53Xt81Fw4ZIudKJS3vbnAVj7piwfE04UJ5WTuXnCw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(376002)(346002)(39860400002)(136003)(230922051799003)(64100799003)(1800799012)(82310400011)(186009)(451199024)(36840700001)(40470700004)(46966006)(36860700001)(47076005)(83380400001)(86362001)(36756003)(41300700001)(82740400003)(81166007)(478600001)(356005)(8676002)(8936002)(6916009)(4326008)(44832011)(70586007)(70206006)(316002)(54906003)(336012)(26005)(1076003)(2616005)(426003)(2906002)(5660300002)(6666004)(40460700003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 11:22:29.0307 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8491f429-1c94-4c18-6588-08dc224ee8f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4914
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtE9+qY0PDEe2ucHCaFRyMsV3BpXIzEK5uZaEmofVH0=;
 b=3NFNSG9zLTAzgkihnjqiJ407Iwuo3ATR4cZAVQ7/8VAvULJmKAeLHnW/3bXeUPVxzX7g/ok5N2aeBfEncuHU6nFfWLhjmEmiiONg8UPXeTGVdqaTebVls4PIXC1puH24bL4FzeakKJzDaFe+Tqm8tTQzCRITagWOfS12Vak+5R0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3NFNSG9z
Subject: [Buildroot] [PATCH v9 01/11]
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
ZXRhbAp0b29sY2hhaW4gdG8gQnVpbGRyb290LiBGb3Igbm93LCBpdCBkZXBlbmRzIG9uIG5vdGhp
bmcsIHNvIGl0IHdpbGwgbm90CmFjdHVhbGx5IGJ1aWxkIGFueXRoaW5nLCBidXQgaXQgZGVmaW5l
cyBzb21lIG9wdGlvbnMgdGhhdCB3aWxsIGJlCm5lZWRlZCBieSB0aGUgdmFyaW91cyBwYWNrYWdl
cyB0aGF0IHdpbGwgYmUgcGFydCBvZiB0aGlzIHRvb2xjaGFpbgpidWlsZCBwcm9jZXNzLgoKU2ln
bmVkLW9mZi1ieTogTmVhbCBGcmFnZXIgPG5lYWwuZnJhZ2VyQGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEliYWkgRXJraWFnYSA8aWJhaS5lcmtpYWdhLWVsb3J6YUBhbWQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgotLS0K
IERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
NCArKysrCiB0b29sY2hhaW4vQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMTAgKysrKysrKysrKwogdG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxk
cm9vdC9Db25maWcuaW4gICB8ICA5ICsrKysrKysrKwogLi4uL3Rvb2xjaGFpbi1iYXJlLW1ldGFs
LWJ1aWxkcm9vdC5tayAgICAgICAgICAgICAgICB8IDEyICsrKysrKysrKysrKwogdXRpbHMvY2hl
Y2tzeW1ib2xzbGliL2JyLnB5ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzICsrKwogNSBm
aWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbGNo
YWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9vdC9Db25maWcuaW4KIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB0b29sY2hhaW4vdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290L3Rvb2xjaGFp
bi1iYXJlLW1ldGFsLWJ1aWxkcm9vdC5tawoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZF
TE9QRVJTCmluZGV4IGNjOWJjNWI1Y2MuLjRiOTdkY2ZiZDUgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BF
UlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMTM4NSw2ICsxMzg1LDkgQEAgRjoJcGFja2FnZS9tcnAv
CiBOOglJYW4gSGF5bG9jayA8aGF5bG9ja2lAeWFob28uY28udWs+CiBGOglwYWNrYWdlL3B5dGhv
bi1ycGktZ3Bpby8KIAorTjoJSWJhaSBFcmtpYWdhIDxpYmFpLmVya2lhZ2EtZWxvcnphQGFtZC5j
b20+CitGOgl0b29sY2hhaW4vdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290LworCiBOOglJ
Z25hY3kgR2F3xJlkemtpIDxpZ25hY3kuZ2F3ZWR6a2lAZ3JlZW4tY29tbXVuaWNhdGlvbnMuZnI+
CiBGOglwYWNrYWdlL2FuZ3VsYXJqcy8KIApAQCAtMjIzOSw2ICsyMjQyLDcgQEAgRjoJY29uZmln
cy96eW5xbXBfemN1MTA0X2RlZmNvbmZpZwogRjoJY29uZmlncy96eW5xbXBfemN1MTA2X2RlZmNv
bmZpZwogRjoJcGFja2FnZS9ib290Z2VuLwogRjoJcGFja2FnZS92ZXJzYWwtZmlybXdhcmUvCitG
Ogl0b29sY2hhaW4vdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290LwogCiBOOglOaWNvbGEg
RGkgTGlldG8gPG5pY29sYS5kaWxpZXRvQGdtYWlsLmNvbT4KIEY6CXBhY2thZ2UvdWFjbWUvCmRp
ZmYgLS1naXQgYS90b29sY2hhaW4vQ29uZmlnLmluIGIvdG9vbGNoYWluL0NvbmZpZy5pbgppbmRl
eCAzNGUwYWUyYzVmLi42NGEwN2Y5MWRjIDEwMDY0NAotLS0gYS90b29sY2hhaW4vQ29uZmlnLmlu
CisrKyBiL3Rvb2xjaGFpbi9Db25maWcuaW4KQEAgLTkyMyw0ICs5MjMsMTQgQEAgY29uZmlnIEJS
Ml9UT09MQ0hBSU5fSEFTX0xJQlFVQURNQVRICiAJZGVmYXVsdCB5IGlmIEJSMl9pMzg2IHx8IEJS
Ml94ODZfNjQKIAlkZWZhdWx0IHkgaWYgQlIyX1BPV0VSUENfQ1BVX0hBU19WU1gKIAorY29tbWVu
dCAiQmFyZSBtZXRhbCB0b29sY2hhaW4iCisKK2NvbmZpZyBCUjJfVE9PTENIQUlOX0JBUkVfTUVU
QUxfQlVJTERST09UCisJYm9vbCAiQnVpbGQgYSBiYXJlIG1ldGFsIHRvb2xjaGFpbiIKKwloZWxw
CisJICBTZWxlY3QgaWYgeW91IG5lZWQgYSBiYXJlLW1ldGFsIHRvb2xjaGFpbiBmb3IgYnVpbGRp
bmcKKwkgIHBsYXRmb3JtIHNwZWNpZmljIGZpcm13YXJlIGltYWdlcy4KKworc291cmNlICJ0b29s
Y2hhaW4vdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290L0NvbmZpZy5pbiIKKwogZW5kbWVu
dQpkaWZmIC0tZ2l0IGEvdG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9vdC9D
b25maWcuaW4gYi90b29sY2hhaW4vdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290L0NvbmZp
Zy5pbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4zYzk5YzdlMWI1Ci0t
LSAvZGV2L251bGwKKysrIGIvdG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9v
dC9Db25maWcuaW4KQEAgLTAsMCArMSw5IEBACitpZiBCUjJfVE9PTENIQUlOX0JBUkVfTUVUQUxf
QlVJTERST09UCisKK2NvbmZpZyBCUjJfVE9PTENIQUlOX0JBUkVfTUVUQUxfQlVJTERST09UX0FS
Q0gKKwlzdHJpbmcgImFyY2hpdGVjdHVyZSB0dXBsZSIKKwloZWxwCisJICBUaGlzIG9wdGlvbiBh
bGxvd3MgdG8gZGVmaW5lIHRoZSBhcmNoaXRlY3R1cmUgdHVwbGUgZm9yIHRoZQorCSAgYmFyZS1t
ZXRhbCB0b29sY2hhaW4uCisKK2VuZGlmICMgQlIyX1RPT0xDSEFJTl9CQVJFX01FVEFMX0JVSUxE
Uk9PVApkaWZmIC0tZ2l0IGEvdG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9v
dC90b29sY2hhaW4tYmFyZS1tZXRhbC1idWlsZHJvb3QubWsgYi90b29sY2hhaW4vdG9vbGNoYWlu
LWJhcmUtbWV0YWwtYnVpbGRyb290L3Rvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9vdC5tawpu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi40ZGMzNmVmM2YzCi0tLSAvZGV2
L251bGwKKysrIGIvdG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9vdC90b29s
Y2hhaW4tYmFyZS1tZXRhbC1idWlsZHJvb3QubWsKQEAgLTAsMCArMSwxMiBAQAorIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKKyMKKyMgdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290CisjCisj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitUT09MQ0hBSU5fQkFSRV9NRVRBTF9CVUlMRFJPT1Rf
REVQRU5ERU5DSUVTID0KK1RPT0xDSEFJTl9CQVJFX01FVEFMX0JVSUxEUk9PVF9BUkNIX1RVUExF
ID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UT09MQ0hBSU5fQkFSRV9NRVRBTF9CVUlMRFJPT1RfQVJD
SCkpCitUT09MQ0hBSU5fQkFSRV9NRVRBTF9CVUlMRFJPT1RfU1lTUk9PVCA9ICQoSE9TVF9ESVIp
LyQoVE9PTENIQUlOX0JBUkVfTUVUQUxfQlVJTERST09UX0FSQ0hfVFVQTEUpL3N5c3Jvb3QKK1RP
T0xDSEFJTl9CQVJFX01FVEFMX0JVSUxEUk9PVF9BRERfVE9PTENIQUlOX0RFUEVOREVOQ1kgPSBO
TworCiskKGV2YWwgJCh2aXJ0dWFsLXBhY2thZ2UpKQpkaWZmIC0tZ2l0IGEvdXRpbHMvY2hlY2tz
eW1ib2xzbGliL2JyLnB5IGIvdXRpbHMvY2hlY2tzeW1ib2xzbGliL2JyLnB5CmluZGV4IDg0NmE2
MDk4MjkuLmY5ZGMzMzZlNjQgMTAwNjQ0Ci0tLSBhL3V0aWxzL2NoZWNrc3ltYm9sc2xpYi9ici5w
eQorKysgYi91dGlscy9jaGVja3N5bWJvbHNsaWIvYnIucHkKQEAgLTM2LDExICszNiwxNCBAQCBz
eW1ib2xzX2RlZmluZWRfb25seV9mb3JfYmFyZWJveF92YXJpYW50ID0gWwogXQogIyB0b29sY2hh
aW4vdG9vbGNoYWluL3Rvb2xjaGFpbi5tawogIyB0b29sY2hhaW4vdG9vbGNoYWluLWJ1aWxkcm9v
dC90b29sY2hhaW4tYnVpbGRyb290Lm1rCisjIHRvb2xjaGFpbi90b29sY2hhaW4tYmFyZS1tZXRh
bC1idWlsZHJvb3QvdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290Lm1rCiBzeW1ib2xzX25v
dF9kZWZpbmVkX2Zvcl9mYWtlX3ZpcnR1YWxfcGFja2FnZXMgPSBbCiAgICAgJ0JSMl9QQUNLQUdF
X0hBU19UT09MQ0hBSU4nLAogICAgICdCUjJfUEFDS0FHRV9IQVNfVE9PTENIQUlOX0JVSUxEUk9P
VCcsCisgICAgJ0JSMl9QQUNLQUdFX0hBU19UT09MQ0hBSU5fQkFSRV9NRVRBTF9CVUlMRFJPT1Qn
LAogICAgICdCUjJfUEFDS0FHRV9QUk9WSURFU19UT09MQ0hBSU4nLAogICAgICdCUjJfUEFDS0FH
RV9QUk9WSURFU19UT09MQ0hBSU5fQlVJTERST09UJywKKyAgICAnQlIyX1BBQ0tBR0VfUFJPVklE
RVNfVE9PTENIQUlOX0JBUkVfTUVUQUxfQlVJTERST09UJywKIF0KICMgZnMvY29tbW9uLm1rCiBz
dWZmaXhlc19ub3RfZGVmaW5lZF9mb3JfYWxsX3Jvb3Rmc190eXBlcyA9IFsKLS0gCjIuMjUuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
