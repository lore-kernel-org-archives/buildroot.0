Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001DACDB47E
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 11:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7E23704D9;
	Fri, 20 Oct 2023 11:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7E23704D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHO19mmT9Iws; Fri, 20 Oct 2023 11:43:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A211704FE;
	Fri, 20 Oct 2023 11:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A211704FE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC0F51BF3A9
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 11:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84746848F8
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 11:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84746848F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O8j6wNGe7C3D for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 11:43:05 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::610])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A180A848F7
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 11:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A180A848F7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBi3I2H+FbZXttirZBJ2YnRmUJWV6MQPBtY5f9hDfmItANG6sgYetIpkc9mWTbX2/OUkglouVLEUH0rIHX/rLy+eoAUpIbxOm4gwgE5w9ONotQlN8w1kth/kV+JfaefNQwzY6I7oTIoTNJCeJv+sfFzO03DjR2Z6v52c1nsEJp8BpnpiG/7Q3RXd22NJmAsnY0ORdkAAoRpOY+3YIZHbWLwnAI8ERB5X3KIx2VxqU1H42DJZPLbzAz3UvOxb3EradxI9sxCHm4pLMbPDVtwIkvgfmKoionaoGVY1sgdkJFlHDoW8RLKkgqvD6JRkUsnM7ovVesLY2mEDLbVS/yBbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xNky3NxdHepr8tlX8Fp3ahq+A4qVi/vnw6t+OqF7DA=;
 b=SGcN1DSyZN0+gRz+cEdRI1UQoNENrW+JV8TfZJF5bDTq5bot6r6SUNGATF4MGjr215mSAScrOEFXmiB8KwkC44DCE2uVqihl7I10uaLqdNKkiXkiTP35e8J8jr+vLZ9QgbJAcsWA6lwdoavNwiHU+9omWNdGZGUjia8ujD+W4g2pdvQ3pEpiDr4PuMjItxdyBDzke02Z1bEIwrtHz9dt/bOQE3JtZVoaOT4K16+5IzvTUfRvTZUpBeienqMzj4CXoiuZCIGVD3XXFEUDm1TJI3SFqeVSuce/FgyrhxNezrjBDBVB5vqcAzsgiiBJCyfJE5YV64wflZ8kSgkdmNACwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR03CA0281.namprd03.prod.outlook.com (2603:10b6:5:3ad::16)
 by BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 11:43:02 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:5:3ad:cafe::4c) by DS7PR03CA0281.outlook.office365.com
 (2603:10b6:5:3ad::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26 via Frontend
 Transport; Fri, 20 Oct 2023 11:43:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Fri, 20 Oct 2023 11:43:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 20 Oct
 2023 06:43:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 20 Oct
 2023 06:43:01 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 20 Oct 2023 06:42:59 -0500
To: <buildroot@buildroot.org>
Date: Fri, 20 Oct 2023 12:42:29 +0100
Message-ID: <20231020114236.4129636-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020114236.4129636-1-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|BN9PR12MB5273:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb87230-f246-4e72-b547-08dbd161b74a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9TxkkNdo5wJIGFtcMO0l76LEGpkA70Clfxvr75r3UBKSvrX43MCdACrZj40CSvs6oVjiD9LUJB9enB+iU+RVicNotlkiB47J/yEXKI+UM+AqYO48IxkYRWdf20qBTSBoBdevWkTQRdoVT/nB7Zx3MFWyTnWrYzA8D3lHBfOq4m7shTYv+aG/F8zIlTi9N+usiwRU9gFUZ+71/tdhgItXnfmhWw5qDXYN21Cqx9eYoQoc0xgAH/+HySnnStPdVobQKYPckaOfN5plXLEStX+i54Z+NrPvWvMpAjiVo/FCjWL0eLuJ0eNFhgKVMMy+KpIXAJ82ooIT4PBSdDfsXc5ronpbtyeJyy13lsodZXXajZ54CyH6MUzGKOVDwcRiimGhi0oD/HDTC7/ALhaUbWUqVSFfWpZTzp/W4PyGF+BaI2tceS9Up5J6jef7gLnQStjGaI0JqGZAQ31rvbmnb4eb2o4Bn/3jQv5W3K7EkIDBD0Ai82e1MYoIYVpVnXC9eu5oO+qVEDtRVSum2RCdzPl5SKM5aVRCrHGa85n6yDSIeiTDLhh5yBqDup0ouxiPsHU41LoLhDp8MFxLiTF4jrc5KaTqgG8dNevSHpNJsAznzvNya3idzl31reohNx4VgcnGqIk3yDp66cmVhdovZldpTbCn1Kc0EPj76Pkm4Nm0fLVS0jGcGFCHVdd27SR4b9jsueKY8Ux7OlKskfg5bLZeMcTwu9Pf4YCmTTvpD03uhyyB3R2OS2OfpxsOsKvufwbp
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(451199024)(82310400011)(64100799003)(1800799009)(186009)(40470700004)(36840700001)(46966006)(2906002)(40480700001)(40460700003)(478600001)(5660300002)(41300700001)(4326008)(44832011)(8936002)(8676002)(316002)(6916009)(70586007)(54906003)(70206006)(36860700001)(47076005)(36756003)(86362001)(356005)(82740400003)(81166007)(2616005)(26005)(426003)(336012)(1076003)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 11:43:01.9122 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb87230-f246-4e72-b547-08dbd161b74a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5273
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xNky3NxdHepr8tlX8Fp3ahq+A4qVi/vnw6t+OqF7DA=;
 b=EMFOjxda3rTOAGC0sw1NZasbAby5QtFNqPV3L8SbFsriNlz6CkNRqYsZl1h1W0ecRdi7LzyUoXGDmgr7g8YeuPkSfZwHIv2hJ82FhojRykyY5aoiN8mobD9yhmy/I56ELT19SADpBkKHiCb1u1f+3fXdmgQFosApSHavW+ehnU8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=EMFOjxda
Subject: [Buildroot] [PATCH v6 03/10] package/newlib-bare-metal: new package
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

VGhpcyBwYXRjaCBhZGRzIGEgbmV3IHBhY2thZ2UgZm9yIGJ1aWxkaW5nIG5ld2xpYiBmb3IgYSBi
YXJlLW1ldGFsIHRvb2xjaGFpbi4KVGhlIGNwdSBhcmNoaXRlY3R1cmUgaXMgZGVmaW5lZCBieSBh
IHRvb2xjaGFpbi1iYXJlLW1ldGFsIHZpcnR1YWwgcGFja2FnZS4KV2hpbGUgYW55IGNwdSBhcmNo
aXRlY3R1cmUgY291bGQgYmUgdXNlZCwgdGhlIGRlZmF1bHQgY29uZmlndXJhdGlvbiB3aWxsIGJl
IGEKWGlsaW54IG1pY3JvYmxhemUgbGl0dGxlIGVuZGlhbiBhcmNoaXRlY3R1cmUsIHNvIHRoYXQg
YnVpbGRyb290IHdpbGwgYmUgYWJsZQp0byBidWlsZCB0aGUgbWljcm9ibGF6ZSBmaXJtd2FyZSBh
cHBsaWNhdGlvbnMgZm9yIHp5bnFtcCBhbmQgdmVyc2FsLgoKU2lnbmVkLW9mZi1ieTogSWJhaSBF
cmtpYWdhIDxpYmFpLmVya2lhZ2EtZWxvcnphQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IE5lYWwg
RnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQuY29tPgotLS0KVjEtPlYyOgogLSByZW1vdmVkIGRlZmF1
bHQgZW5hYmxlIHRvIGJlIHJlcGxhY2VkIHdpdGggdG9vbGNoYWluIHNlbGVjdCBjb25maWcKVjIt
PlYzOgogLSBubyBjaGFuZ2VzClYzLT5WNDoKIC0gcmVwbGFjZWQgdW5uZWNlc3NhcnkgPT8gd2l0
aCA9IGZvciBhc3NpZ25tZW50cwogLSBpbXByb3ZlZCBtZW51Y29uZmlnIGhlbHAgY29tbWVudApW
NC0+VjU6CiAtIGFkZGVkIGxpY2Vuc2UgZmlsZXMKIC0gcmVkdWNlZCBhbGwgbGluZXMgdG8gPDgw
IGNoYXJzClY1LT5WNjoKIC0gbWlncmF0ZWQgdG8gdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRy
b290Ci0tLQogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDIgKwogcGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC9Db25maWcuaW4uaG9zdCAgICAgIHwgMTIg
KysrKysrCiAuLi4vbmV3bGliLWJhcmUtbWV0YWwvbmV3bGliLWJhcmUtbWV0YWwuaGFzaCAgfCAg
OCArKysrCiAuLi4vbmV3bGliLWJhcmUtbWV0YWwvbmV3bGliLWJhcmUtbWV0YWwubWsgICAgfCAz
NyArKysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKykK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL0NvbmZpZy5pbi5o
b3N0CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC9uZXdsaWIt
YmFyZS1tZXRhbC5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9uZXdsaWItYmFyZS1t
ZXRhbC9uZXdsaWItYmFyZS1tZXRhbC5tawoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZF
TE9QRVJTCmluZGV4IDkyMmE3NGU0MjYuLjY3N2I4ZjA5YmQgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BF
UlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMTM2OSw2ICsxMzY5LDcgQEAgRjoJcGFja2FnZS9weXRo
b24tcnBpLWdwaW8vCiBOOglJYmFpIEVya2lhZ2EgPGliYWkuZXJraWFnYS1lbG9yemFAYW1kLmNv
bT4KIEY6CXBhY2thZ2UvYmludXRpbHMtYmFyZS1tZXRhbC8KIEY6CXBhY2thZ2UvZ2NjLWJhcmUt
bWV0YWwvCitGOglwYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsLwogCiBOOglJZ25hY3kgR2F3xJlk
emtpIDxpZ25hY3kuZ2F3ZWR6a2lAZ3JlZW4tY29tbXVuaWNhdGlvbnMuZnI+CiBGOglwYWNrYWdl
L2FuZ3VsYXJqcy8KQEAgLTIyMDQsNiArMjIwNSw3IEBAIEY6CWNvbmZpZ3MvenlucW1wX3pjdTEw
Nl9kZWZjb25maWcKIEY6CXBhY2thZ2UvYmludXRpbHMtYmFyZS1tZXRhbC8KIEY6CXBhY2thZ2Uv
Ym9vdGdlbi8KIEY6CXBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvCitGOglwYWNrYWdlL25ld2xpYi1i
YXJlLW1ldGFsLwogRjoJcGFja2FnZS92ZXJzYWwtZmlybXdhcmUvCiAKIE46CU5pY29sYSBEaSBM
aWV0byA8bmljb2xhLmRpbGlldG9AZ21haWwuY29tPgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9uZXds
aWItYmFyZS1tZXRhbC9Db25maWcuaW4uaG9zdCBiL3BhY2thZ2UvbmV3bGliLWJhcmUtbWV0YWwv
Q29uZmlnLmluLmhvc3QKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYmU5
MmExZDZhNgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbmV3bGliLWJhcmUtbWV0YWwvQ29u
ZmlnLmluLmhvc3QKQEAgLTAsMCArMSwxMiBAQAorY29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfTkVX
TElCX0JBUkVfTUVUQUwKKwlib29sICJob3N0IG5ld2xpYi1iYXJlLW1ldGFsIgorCWhlbHAKKwkg
IEJ1aWxkIHRoZSBuZXdsaWIgQyBsaWJyYXJ5IGZvciBhIGJhcmUtbWV0YWwgdG9vbGNoYWluCisK
K2lmIEJSMl9QQUNLQUdFX0hPU1RfTkVXTElCX0JBUkVfTUVUQUwKKworY29uZmlnIEJSMl9QQUNL
QUdFX0hPU1RfTkVXTElCX0JBUkVfTUVUQUxfVkVSU0lPTgorCXN0cmluZworCWRlZmF1bHQgIjQu
MS4wIgorCitlbmRpZiAjQlIyX1BBQ0tBR0VfSE9TVF9ORVdMSUJfQkFSRV9NRVRBTApkaWZmIC0t
Z2l0IGEvcGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC9uZXdsaWItYmFyZS1tZXRhbC5oYXNoIGIv
cGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC9uZXdsaWItYmFyZS1tZXRhbC5oYXNoCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjFhNjgxZWNmNzcKLS0tIC9kZXYvbnVsbAor
KysgYi9wYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL25ld2xpYi1iYXJlLW1ldGFsLmhhc2gKQEAg
LTAsMCArMSw4IEBACisjIExvY2FsbHkgY2FsY3VsYXRlZAorc2hhMjU2ICBmMjk2ZTM3MmY1MTMy
NDIyNGQzODdjYzExNmRjMzdhNmJkMzk3MTk4NzU2NzQ2ZjkzYTJiMDJlOWE1ZDQwMTU0ICBuZXds
aWItNC4xLjAudGFyLmd6CisKKyMgSGFzaGVzIGZvciBsaWNlbnNlIGZpbGVzIGxvY2FsbHkgY2Fs
Y3VsYXRlZAorc2hhMjU2ICAyMzFmN2VkY2M3MzUyZDc3MzRhOTZlZWYwYjgwMzBmNzc5ODI2Nzhj
NTE2ODc2ZmNiODFlMjViMzJkNjg1NjRjICBDT1BZSU5HCitzaGEyNTYgIGE5YmRkZTU2MTZlY2Rk
MWU5ODBiNDRmMzYwNjAwZWU4NzgzYjFmOTliOGNjODNhMmJlYjE2M2EwYTM5MGU4NjEgIENPUFlJ
TkcuTElCCitzaGEyNTYgIGYzYjdmM2U0NDI2YjFmYTZmNjAxOThkYWU3YWRmZWRkOTRiNzdiMjhk
YjJkMTA4YWRjMDI1MzU3NTAxMWUwZmYgIENPUFlJTkcuTElCR0xPU1MKK3NoYTI1NiAgNDIyYWE0
MDI5MzA5M2ZiNTRmYzY2ZTY5MmEwZDY4ZmQwYjI0ZWQ1NjAyZTVkMWQzM2FkMDViYTM5MDkwNTdl
OSAgQ09QWUlORy5ORVdMSUIKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmV3bGliLWJhcmUtbWV0YWwv
bmV3bGliLWJhcmUtbWV0YWwubWsgYi9wYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL25ld2xpYi1i
YXJlLW1ldGFsLm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmE0MmUw
NDg3N2EKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL25ld2xp
Yi1iYXJlLW1ldGFsLm1rCkBAIC0wLDAgKzEsMzcgQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
CisjCisjIG5ld2xpYi1iYXJlLW1ldGFsCisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitI
T1NUX05FV0xJQl9CQVJFX01FVEFMX1ZFUlNJT04gPSBcCisJJChjYWxsIHFzdHJpcCwkKEJSMl9Q
QUNLQUdFX0hPU1RfTkVXTElCX0JBUkVfTUVUQUxfVkVSU0lPTikpCitpZmVxICgkKEhPU1RfTkVX
TElCX0JBUkVfTUVUQUxfVkVSU0lPTiksKQorSE9TVF9ORVdMSUJfQkFSRV9NRVRBTF9WRVJTSU9O
ID0gNC4xLjAKK2VuZGlmCisKK0hPU1RfTkVXTElCX0JBUkVfTUVUQUxfU0lURSA9IGZ0cDovL3Nv
dXJjZXdhcmUub3JnL3B1Yi9uZXdsaWIKK0hPU1RfTkVXTElCX0JBUkVfTUVUQUxfU09VUkNFID0g
bmV3bGliLSQoSE9TVF9ORVdMSUJfQkFSRV9NRVRBTF9WRVJTSU9OKS50YXIuZ3oKK0hPU1RfTkVX
TElCX0JBUkVfTUVUQUxfREVQRU5ERU5DSUVTID0gaG9zdC1nY2MtYmFyZS1tZXRhbAorCitIT1NU
X05FV0xJQl9CQVJFX01FVEFMX0xJQ0VOU0UgPSBHUEwtMi4wLCBHUEwtMy4wLCBMR1BMLTIuMSwg
TEdQTC0zLjAKK0hPU1RfTkVXTElCX0JBUkVfTUVUQUxfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcg
XAorCUNPUFlJTkcuTElCIFwKKwlDT1BZSU5HLkxJQkdMT1NTIFwKKwlDT1BZSU5HLk5FV0xJQgor
CitORVdMSUJfQVJDSCA9IFwKKwkkKGNhbGwgcXN0cmlwLCQoQlIyX1BBQ0tBR0VfSE9TVF9UT09M
Q0hBSU5fQkFSRV9NRVRBTF9CVUlMRFJPT1RfQVJDSCkpCisKK0hPU1RfTkVXTElCX0JBUkVfTUVU
QUxfQ09ORl9PUFRTID0gXAorCS0tdGFyZ2V0PSQoTkVXTElCX0FSQ0gpLWVsZiBcCisJQ0NfRk9S
X1RBUkdFVD0kKEhPU1RfRElSKS9iaW4vJChORVdMSUJfQVJDSCktZWxmLWdjYyBcCisJQVJfRk9S
X1RBUkdFVD0kKEhPU1RfRElSKS9iaW4vJChORVdMSUJfQVJDSCktZWxmLWFyIFwKKwlSQU5MSUJf
Rk9SX1RBUkdFVD0kKEhPU1RfRElSKS9iaW4vJChORVdMSUJfQVJDSCktZWxmLXJhbmxpYiBcCisJ
LS1lbmFibGUtbmV3bGliLWlvLWM5OS1mb3JtYXRzIFwKKwktLWVuYWJsZS1uZXdsaWItaW8tbG9u
Zy1sb25nIFwKKwktLWVuYWJsZS1uZXdsaWItaW8tZmxvYXQgXAorCS0tZW5hYmxlLW5ld2xpYi1p
by1sb25nLWRvdWJsZSBcCisJLS1kaXNhYmxlLW11bHRpbGliCisKKyQoZXZhbCAkKGhvc3QtYXV0
b3Rvb2xzLXBhY2thZ2UpKQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
