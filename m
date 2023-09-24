Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27B6CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 15:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A37C240A9F;
	Sun, 24 Sep 2023 15:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A37C240A9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ewAyfejfNl5G; Sun, 24 Sep 2023 15:13:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A894541509;
	Sun, 24 Sep 2023 15:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A894541509
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B9CC51BF3E8
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 15:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 929B440BFB
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 15:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 929B440BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L_AdZXDgQGdu for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 15:13:06 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8BB54051F
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 15:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8BB54051F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdeJ8fpPqtuSJ5Vwifz6wTGFVyb3TYGkavshk3Vg59TnlMKICIqmhTDbg8SxPMwbOVPLjZhoR/EqsLtrPHGtp+n9Qm65Pw7SIrvwEFBMqT6he8EkJQx/HEJswp9NHXKh5Ni56fjtiENC9TxDkYPpHrIyiuB3wtL+RKZB+qG9xhUjwEfXmsobFzPvOJX1wawFHqIbqqNClEAjWp23c1tOYbn2Bbb0orR65UpFIp4OPjguR55elr+qsWjFBjpxinFgw1J0a114KErasVgK+IkUZM3iiUDu+lOg7cJiX69bDcI/R6SpfD1F55NusdFrmFYEM4MOcAi4DYIKckt2+NFq2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pqq4x3U/cqFl0M8wkv8t73kYVm0wFDvYqbaiBeAm3rE=;
 b=eTE/mTB9oOhqDXNNnnAhoVv/j/27HifglBGP0ZHTYdPd8xU4OX/kcKLhu5eH9mQMclKkGTS6KoPKRGlBEZzR6UCfCVfXPVjDMC9PM3wu/RPI/vThp8ZDUMCYcmGxXYhU9uV60Y9YNTpto8WQ3x6Dx2ZiCgA6iSnWLwuK3VfARbsiJUe5xB3vdap8ThMVmsb0KXIeZqxAMBSAESZgUlI12c0FaWIPm9NEDCSGQBTaABKcF8KJ3Y3FDtTrCvUnhfDHVZTZ75+GuxedeZBBQ4Nvca3SVubBIfOSwhS7BM2zXO6teq6CxMJT8bF3S2eH22U6qCkbcQUdjvjtP0jKJkVYaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BL0PR1501CA0028.namprd15.prod.outlook.com
 (2603:10b6:207:17::41) by DS0PR12MB8248.namprd12.prod.outlook.com
 (2603:10b6:8:f3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.27; Sun, 24 Sep
 2023 15:12:59 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:207:17:cafe::d) by BL0PR1501CA0028.outlook.office365.com
 (2603:10b6:207:17::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Sun, 24 Sep 2023 15:12:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sun, 24 Sep 2023 15:12:58 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 24 Sep
 2023 10:12:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 24 Sep
 2023 08:12:56 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Sun, 24 Sep 2023 10:12:55 -0500
To: <buildroot@buildroot.org>
Date: Sun, 24 Sep 2023 16:11:59 +0100
Message-ID: <20230924151205.2099293-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230924151205.2099293-1-neal.frager@amd.com>
References: <20230924151205.2099293-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|DS0PR12MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: e3dddcb8-2501-411e-57c6-08dbbd10bcc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TUjSMnUNEq7cLigsAhGtofGIQv9Ftjk/MZj2yCBnNeCyFAtOM3GkcaTkEuhhYivPY3DN/ABQ5tzhbYm/E704CA6wDT+JUQXXgEtdQdLWGmoIVPB+DhSFZRXNMwtb5XPOLHEL/uOP3zWZA8ywgLhtEl1ZQLWKnJIMK2T8VcASSYKsLa3SMC/dPQCmYY04FmrbisgFcvrBCBXI9kY3/nFKBYjsE34ryF/R3crvdi6o9gT8QCh+0uzHOiIkZRSJ8PbpYkjKYryuQAq65rwf9ay3pVlHJqWESHj/TBmxL3BHUyZCmcCYXoyJKSKcc4XuHzCg0kRUS0ccUeB0t7eJiBuKJlKQrAHo/ecCOWAE3+5M1jGcCN3/cq34h9VaUdlqjyVRBG3yXIwx7GH0ly0ljjuwHvv6ezz+ii/P6EPdk3UZr54dIAnCjgdSOgXdZLedA6CiifzXhmyooPAL9ry0UexuBuc6wp11Ze58wJZ2SqsjcNR9GAU3sOhStHaY7XgOaPcRYKeY0if/Q0Cr7ckQ/3FEALd8dJbKUU7FjJhO7otpi9RGZZSDBpKNx5QdvTm4RxEIXC3Aw9jdogFvkj1QXAVspxzBZNdFy8wnLigfgoYhGtcaOhLNmcHiYT/Ql0v76x2g3DxYMqFxvT3j+2aTjJ/GW/5AvqB8Ojxc42S1lxRDBRh+WIOo93LXy2s8XLG2zJ+ih3uLTXq+ZXUkLFlXIBN1UXUnu5Ni0J+ebgZ1XGor9JEq0Yv6mnFo0gAviyLFiW25rq1PLjUezLEJ+5LDYXhhEA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(451199024)(82310400011)(1800799009)(186009)(36840700001)(46966006)(40470700004)(47076005)(36860700001)(40460700003)(40480700001)(336012)(426003)(26005)(36756003)(8936002)(44832011)(5660300002)(478600001)(4326008)(356005)(8676002)(82740400003)(81166007)(2906002)(86362001)(70206006)(70586007)(6916009)(316002)(54906003)(41300700001)(1076003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2023 15:12:58.6961 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3dddcb8-2501-411e-57c6-08dbbd10bcc8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8248
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pqq4x3U/cqFl0M8wkv8t73kYVm0wFDvYqbaiBeAm3rE=;
 b=cR0FTvtFgfxtHHcadTRvWr5YZs8mGxAIf7kVZPJd/rUHe9JKfHiYTwc+29jCqABVyatVoK+AkQ9vyGFrGs+XCj4zsbOZfb6BnVFt3gnDGRbsBBo9SoiEfJW7OxOKZXHkpVUiPGmChw1LOyyF6LgH8SVl8zziZclXgIn5zYCEAMM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=cR0FTvtF
Subject: [Buildroot] [PATCH v4 04/10] toolchain/toolchain-bare-metal: new
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
bXAgYW5kIHZlcnNhbC4KClNpZ25lZC1vZmYtYnk6IEliYWkgRXJraWFnYS1FbG9yemEgPGliYWku
ZXJraWFnYS1lbG9yemFAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogTmVhbCBGcmFnZXIgPG5lYWwu
ZnJhZ2VyQGFtZC5jb20+Ci0tLQpWMS0+VjI6CiAtIGFkZHMgc2VsZWN0IG9wdGlvbiB0byBicmlu
ZyBpbiBhbGwgcGFja2FnZXMgbmVlZGVkIGZvciB0b29sY2hhaW4tYmFyZS1tZXRhbApWMi0+VjM6
CiAtIG5vIGNoYW5nZXMKVjMtPlY0OgogLSBtb3ZlZCBmcm9tIHBhY2thZ2UgdG8gdG9vbGNoYWlu
IGRpcmVjdG9yeQogLSBpbXByb3ZlZCBtZW51Y29uZmlnIGhlbHAgY29tbWVudAotLS0KIERFVkVM
T1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsrCiB0b29sY2hh
aW4vQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiB0b29sY2hhaW4v
dG9vbGNoYWluLWJhcmUtbWV0YWwvQ29uZmlnLmluICAgICAgfCAyMSArKysrKysrKysrKysrKysr
KysrCiAuLi4vdG9vbGNoYWluLWJhcmUtbWV0YWwubWsgICAgICAgICAgICAgICAgICAgfCAgNyAr
KysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEw
MDY0NCB0b29sY2hhaW4vdG9vbGNoYWluLWJhcmUtbWV0YWwvQ29uZmlnLmluCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgdG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsL3Rvb2xjaGFpbi1iYXJlLW1l
dGFsLm1rCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggNWM1ZjRm
MWUyMS4uZjk3NjU1MjQ0NSAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJT
CkBAIC0xMzU0LDYgKzEzNTQsNyBAQCBOOglJYmFpIEVya2lhZ2EtRWxvcnphIDxpYmFpLmVya2lh
Z2EtZWxvcnphQGFtZC5jb20+CiBGOglwYWNrYWdlL2JpbnV0aWxzLWJhcmUtbWV0YWwvCiBGOglw
YWNrYWdlL2djYy1iYXJlLW1ldGFsLwogRjoJcGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC8KK0Y6
CXRvb2xjaGFpbi90b29sY2hhaW4tYmFyZS1tZXRhbC8KIAogTjoJSWduYWN5IEdhd8SZZHpraSA8
aWduYWN5Lmdhd2VkemtpQGdyZWVuLWNvbW11bmljYXRpb25zLmZyPgogRjoJcGFja2FnZS9hbmd1
bGFyanMvCkBAIC0yMTg4LDYgKzIxODksNyBAQCBGOglwYWNrYWdlL2Jvb3RnZW4vCiBGOglwYWNr
YWdlL2djYy1iYXJlLW1ldGFsLwogRjoJcGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC8KIEY6CXBh
Y2thZ2UvdmVyc2FsLWZpcm13YXJlLworRjoJdG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFs
LwogCiBOOglOaWNvbGEgRGkgTGlldG8gPG5pY29sYS5kaWxpZXRvQGdtYWlsLmNvbT4KIEY6CXBh
Y2thZ2UvdWFjbWUvCmRpZmYgLS1naXQgYS90b29sY2hhaW4vQ29uZmlnLmluIGIvdG9vbGNoYWlu
L0NvbmZpZy5pbgppbmRleCBkYTZiZjVmNGM4Li4xNjA0ZmEwMTA4IDEwMDY0NAotLS0gYS90b29s
Y2hhaW4vQ29uZmlnLmluCisrKyBiL3Rvb2xjaGFpbi9Db25maWcuaW4KQEAgLTU5LDYgKzU5LDcg
QEAgY29uZmlnIEJSMl9UT09MQ0hBSU5fRVhURVJOQUwKIAogZW5kY2hvaWNlCiAKK3NvdXJjZSAi
dG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsL0NvbmZpZy5pbiIKIHNvdXJjZSAidG9vbGNo
YWluL3Rvb2xjaGFpbi1idWlsZHJvb3QvQ29uZmlnLmluIgogc291cmNlICJ0b29sY2hhaW4vdG9v
bGNoYWluLWV4dGVybmFsL0NvbmZpZy5pbiIKIApkaWZmIC0tZ2l0IGEvdG9vbGNoYWluL3Rvb2xj
aGFpbi1iYXJlLW1ldGFsL0NvbmZpZy5pbiBiL3Rvb2xjaGFpbi90b29sY2hhaW4tYmFyZS1tZXRh
bC9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZGRkNmQz
YzI1MwotLS0gL2Rldi9udWxsCisrKyBiL3Rvb2xjaGFpbi90b29sY2hhaW4tYmFyZS1tZXRhbC9D
b25maWcuaW4KQEAgLTAsMCArMSwyMSBAQAorY29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfVE9PTENI
QUlOX0JBUkVfTUVUQUwKKwlib29sICJob3N0IHRvb2xjaGFpbi1iYXJlLW1ldGFsIgorCXNlbGVj
dCBCUjJfUEFDS0FHRV9IT1NUX0JJTlVUSUxTX0JBUkVfTUVUQUwKKwlzZWxlY3QgQlIyX1BBQ0tB
R0VfSE9TVF9HQ0NfQkFSRV9NRVRBTAorCXNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX05FV0xJQl9C
QVJFX01FVEFMCisJaGVscAorCSAgQnVpbGQgYSBiYXJlLW1ldGFsIHRvb2xjaGFpbiBpbiBhZGRp
dGlvbiB0byB0aGUgbWFpbiBMaW51eCB0b29sY2hhaW4KKworaWYgQlIyX1BBQ0tBR0VfSE9TVF9U
T09MQ0hBSU5fQkFSRV9NRVRBTAorCitjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9UT09MQ0hBSU5f
QkFSRV9NRVRBTF9BUkNICisJc3RyaW5nCisJZGVmYXVsdCAibWljcm9ibGF6ZWVsLXhpbGlueCIK
KwloZWxwCisJICBzZWxlY3QgYXJjaGl0ZWN0dXJlIGZvciBiYXJlLW1ldGFsIHRvb2xjaGFpbgor
Citzb3VyY2UgInBhY2thZ2UvYmludXRpbHMtYmFyZS1tZXRhbC9Db25maWcuaW4uaG9zdCIKK3Nv
dXJjZSAicGFja2FnZS9nY2MtYmFyZS1tZXRhbC9Db25maWcuaW4uaG9zdCIKK3NvdXJjZSAicGFj
a2FnZS9uZXdsaWItYmFyZS1tZXRhbC9Db25maWcuaW4uaG9zdCIKKworZW5kaWYgI0JSMl9QQUNL
QUdFX0hPU1RfVE9PTENIQUlOX0JBUkVfTUVUQUwKZGlmZiAtLWdpdCBhL3Rvb2xjaGFpbi90b29s
Y2hhaW4tYmFyZS1tZXRhbC90b29sY2hhaW4tYmFyZS1tZXRhbC5tayBiL3Rvb2xjaGFpbi90b29s
Y2hhaW4tYmFyZS1tZXRhbC90b29sY2hhaW4tYmFyZS1tZXRhbC5tawpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi40MDdhZDRlYTMzCi0tLSAvZGV2L251bGwKKysrIGIvdG9v
bGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLm1rCkBAIC0w
LDAgKzEsNyBAQAorIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKyMKKyMgdG9vbGNoYWluLWJhcmUt
bWV0YWwKKyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKKyhldmFsICQoaG9zdC12aXJ0dWFs
LXBhY2thZ2UpKQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
