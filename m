Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCACCDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 15:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85CA481E7E;
	Wed, 18 Oct 2023 15:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85CA481E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id elRRDdl7f_JE; Wed, 18 Oct 2023 15:10:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90579822EF;
	Wed, 18 Oct 2023 15:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90579822EF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D90621BF342
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 15:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE0DD4041C
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 15:10:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE0DD4041C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oVgvfkd6t0wa for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 15:10:01 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D65E403C4
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 15:10:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D65E403C4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T10grpauQHHwKkS2B/QagEP+mIxn1fpajNsRrHhjespMSVaY48Zi8czq2jIALfLu+Bpl6ZzJBT5kdSsaKZW1UsIDcIa/6OiV4Q66IXACVKsCMPwnXJdyy2gAZmgCioDkpljibuVHFhGADyahskCgKfsEtc2dsiNOPhYZptQssyXCEHoylnmh2RVYzzVQsbgxzLIRYxGM6ZydHTg8JqmiW3TxzRPRcQIUB9qt3nHCDgMGvSnj20kaBY8Bb6zX+IYe9Ci7E3z5tOOTjG4BG5y6F7ZJadiO5t2tneMu46QdTCzXBvVu19yyFVxYcbv8JDhqBcm3SOK8jzlWVCtY/7TgTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VM+p82vPBjAovPBtVccUDYZ8GIDr0hoE37TvYgNRY9U=;
 b=HG6JUIfQEtNyTk/ommtWE1k+jeeV3R0tI0pUsJAOP3Ngctt68Gjwy+5zQZDf4rwAfNxEsQ1U8+VfEOFv37CiSN3244TyzNqR3l465OhMnj0lNxCrTRpafww831plZdM39b2pUYGZihMHyDG5VmVP+bTrQHb5GXKkwnTlmOfN8DlHV3qr7FNzXWTp7YNst7PynEHzdCky8mhxli9ay7UD2Cfi/NGZ2smbNx5jwWU1zm9r0uqOJ/sWsvmtuYLEl4q2852+h93EGAJok1z2GmGNMPsSTDJp+GblGhIDPGhnDCwkBwl8gh5dZHEfp5u6YnUnkke1d7ldIkLnztm5lEeRaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CYZPR10CA0008.namprd10.prod.outlook.com (2603:10b6:930:8a::18)
 by SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Wed, 18 Oct
 2023 15:09:55 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:930:8a:cafe::c4) by CYZPR10CA0008.outlook.office365.com
 (2603:10b6:930:8a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24 via Frontend
 Transport; Wed, 18 Oct 2023 15:09:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Wed, 18 Oct 2023 15:09:54 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 10:09:53 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 18 Oct 2023 10:09:52 -0500
To: <buildroot@buildroot.org>
Date: Wed, 18 Oct 2023 16:09:26 +0100
Message-ID: <20231018150932.3961564-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018150932.3961564-1-neal.frager@amd.com>
References: <20231018150932.3961564-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|SA3PR12MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 67fe14f1-7d22-47d8-124f-08dbcfec4904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YZXOrIpDE9ARQf6zMUD5nG1c7cgJbrN9T+aWrgKKRwyyOR9RZLLRZ5EBkFkIdmE91C3V34GH/O9rCKtNEZqHhTcCKSYF5VCdI1PqPx+xTeqrqFRGN3FW/vGhvrAmT69B57eVr8dBW1qUBGSPMCxxsthceOZPiQ+AY39AzHPKlNYqr/hieGs7HH/zsg86nKS18ixbuhYSc+hzAqFLjkfwztcAX8fR1YTYgAZH0Y9+2YfhNSv7qwXHlJ65tgzAj5VKEyLtSdtoIIzEJrZsBm7n0UagnXvR0BkSKv3+/Ze5j+5M5GvjsTQrL+5UDku4iOHdmjvOMs22RGlh8vCZqi9JrKNUhYJ4JJfbnf6EhCn+cyH0EabCJk2u7FM4VjnHHjWX6YK9ENy5Seuif1LTRkPeADYU2SY1oFdctcN8JH1A0jHScGRJlJoqqFc91UOZ5kftcluG1CNQkwe+CUqnnWStMgl2IsLSXa0JA93iCUoBVu3QKSHvWQbdAoE7NLITeQi4ZMmAoQRFCAY5NQQsYcOM2dd1g/JqdKoaMDeMcEZ90A1/zZOew8cp+DuoWXiULp/8vSHMG6/2eEc6GMY/kJRotu36gN0TtxS158c65CoqvWDnd4YYJIjaHPCHecQjch28rHNZryg9HelhqIel9fG16CMb4ijQ0B7RRIDoyxX7zODlSPxr1O+JscdpH746GoPYS+0iPakHt7UjqenmLY37/cjoTVtrVtBbJlu5zngLP8bWuFa6munHnt3nqyvL7S7bt74e83cuy9TScfUFG0Dw3g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(82310400011)(46966006)(36840700001)(40470700004)(26005)(2616005)(36860700001)(478600001)(47076005)(1076003)(86362001)(40460700003)(6666004)(36756003)(8936002)(336012)(426003)(8676002)(4326008)(6916009)(70586007)(54906003)(316002)(70206006)(41300700001)(2906002)(40480700001)(44832011)(5660300002)(82740400003)(356005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:09:54.6354 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67fe14f1-7d22-47d8-124f-08dbcfec4904
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7784
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VM+p82vPBjAovPBtVccUDYZ8GIDr0hoE37TvYgNRY9U=;
 b=jO2fk2hFfvbzwJz0sdjAB6v5swDbiS2S2WZd9gFCu+ohQCjP3kXvnRL1rfqdX26JTuNG3NzjOJz0M6w+Z9rL8XXdSDNcWEZ+pKmCkh+Nl8KW6z/osYhQ4yKgkoiHUkJdlTPR4SCWDUOMsL0xfCouW6c7hqDPiUKB0RHxREYghjM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=jO2fk2hF
Subject: [Buildroot] [PATCH v5 04/10] toolchain/toolchain-bare-metal: new
 toolchain
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
bmdlcwotLS0KIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAyICsrCiB0b29sY2hhaW4vQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MSArCiB0b29sY2hhaW4vdG9vbGNoYWluLWJhcmUtbWV0YWwvQ29uZmlnLmluICAgICAgfCAyMSAr
KysrKysrKysrKysrKysrKysrCiAuLi4vdG9vbGNoYWluLWJhcmUtbWV0YWwubWsgICAgICAgICAg
ICAgICAgICAgfCAgNyArKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykK
IGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29sY2hhaW4vdG9vbGNoYWluLWJhcmUtbWV0YWwvQ29uZmln
LmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsL3Rv
b2xjaGFpbi1iYXJlLW1ldGFsLm1rCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BF
UlMKaW5kZXggNjc3YjhmMDliZC4uNzE0OWM2NWI0ZSAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUwor
KysgYi9ERVZFTE9QRVJTCkBAIC0xMzcwLDYgKzEzNzAsNyBAQCBOOglJYmFpIEVya2lhZ2EgPGli
YWkuZXJraWFnYS1lbG9yemFAYW1kLmNvbT4KIEY6CXBhY2thZ2UvYmludXRpbHMtYmFyZS1tZXRh
bC8KIEY6CXBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvCiBGOglwYWNrYWdlL25ld2xpYi1iYXJlLW1l
dGFsLworRjoJdG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLwogCiBOOglJZ25hY3kgR2F3
xJlkemtpIDxpZ25hY3kuZ2F3ZWR6a2lAZ3JlZW4tY29tbXVuaWNhdGlvbnMuZnI+CiBGOglwYWNr
YWdlL2FuZ3VsYXJqcy8KQEAgLTIyMDcsNiArMjIwOCw3IEBAIEY6CXBhY2thZ2UvYm9vdGdlbi8K
IEY6CXBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvCiBGOglwYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFs
LwogRjoJcGFja2FnZS92ZXJzYWwtZmlybXdhcmUvCitGOgl0b29sY2hhaW4vdG9vbGNoYWluLWJh
cmUtbWV0YWwvCiAKIE46CU5pY29sYSBEaSBMaWV0byA8bmljb2xhLmRpbGlldG9AZ21haWwuY29t
PgogRjoJcGFja2FnZS91YWNtZS8KZGlmZiAtLWdpdCBhL3Rvb2xjaGFpbi9Db25maWcuaW4gYi90
b29sY2hhaW4vQ29uZmlnLmluCmluZGV4IGQ4MDgxZjFiOWQuLmVkMGQ2MzMzZjkgMTAwNjQ0Ci0t
LSBhL3Rvb2xjaGFpbi9Db25maWcuaW4KKysrIGIvdG9vbGNoYWluL0NvbmZpZy5pbgpAQCAtNTks
NiArNTksNyBAQCBjb25maWcgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTAogCiBlbmRjaG9pY2UKIAor
c291cmNlICJ0b29sY2hhaW4vdG9vbGNoYWluLWJhcmUtbWV0YWwvQ29uZmlnLmluIgogc291cmNl
ICJ0b29sY2hhaW4vdG9vbGNoYWluLWJ1aWxkcm9vdC9Db25maWcuaW4iCiBzb3VyY2UgInRvb2xj
aGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvQ29uZmlnLmluIgogCmRpZmYgLS1naXQgYS90b29sY2hh
aW4vdG9vbGNoYWluLWJhcmUtbWV0YWwvQ29uZmlnLmluIGIvdG9vbGNoYWluL3Rvb2xjaGFpbi1i
YXJlLW1ldGFsL0NvbmZpZy5pbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
Li5kZGQ2ZDNjMjUzCi0tLSAvZGV2L251bGwKKysrIGIvdG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJl
LW1ldGFsL0NvbmZpZy5pbgpAQCAtMCwwICsxLDIxIEBACitjb25maWcgQlIyX1BBQ0tBR0VfSE9T
VF9UT09MQ0hBSU5fQkFSRV9NRVRBTAorCWJvb2wgImhvc3QgdG9vbGNoYWluLWJhcmUtbWV0YWwi
CisJc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfQklOVVRJTFNfQkFSRV9NRVRBTAorCXNlbGVjdCBC
UjJfUEFDS0FHRV9IT1NUX0dDQ19CQVJFX01FVEFMCisJc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1Rf
TkVXTElCX0JBUkVfTUVUQUwKKwloZWxwCisJICBCdWlsZCBhIGJhcmUtbWV0YWwgdG9vbGNoYWlu
IGluIGFkZGl0aW9uIHRvIHRoZSBtYWluIExpbnV4IHRvb2xjaGFpbgorCitpZiBCUjJfUEFDS0FH
RV9IT1NUX1RPT0xDSEFJTl9CQVJFX01FVEFMCisKK2NvbmZpZyBCUjJfUEFDS0FHRV9IT1NUX1RP
T0xDSEFJTl9CQVJFX01FVEFMX0FSQ0gKKwlzdHJpbmcKKwlkZWZhdWx0ICJtaWNyb2JsYXplZWwt
eGlsaW54IgorCWhlbHAKKwkgIHNlbGVjdCBhcmNoaXRlY3R1cmUgZm9yIGJhcmUtbWV0YWwgdG9v
bGNoYWluCisKK3NvdXJjZSAicGFja2FnZS9iaW51dGlscy1iYXJlLW1ldGFsL0NvbmZpZy5pbi5o
b3N0Igorc291cmNlICJwYWNrYWdlL2djYy1iYXJlLW1ldGFsL0NvbmZpZy5pbi5ob3N0Igorc291
cmNlICJwYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL0NvbmZpZy5pbi5ob3N0IgorCitlbmRpZiAj
QlIyX1BBQ0tBR0VfSE9TVF9UT09MQ0hBSU5fQkFSRV9NRVRBTApkaWZmIC0tZ2l0IGEvdG9vbGNo
YWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLm1rIGIvdG9vbGNo
YWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLm1rCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjQwN2FkNGVhMzMKLS0tIC9kZXYvbnVsbAor
KysgYi90b29sY2hhaW4vdG9vbGNoYWluLWJhcmUtbWV0YWwvdG9vbGNoYWluLWJhcmUtbWV0YWwu
bWsKQEAgLTAsMCArMSw3IEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyB0b29sY2hh
aW4tYmFyZS1tZXRhbAorIworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKworKGV2YWwgJChob3N0
LXZpcnR1YWwtcGFja2FnZSkpCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
