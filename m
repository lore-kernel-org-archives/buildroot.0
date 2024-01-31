Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEA5C47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 11:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5464861488;
	Wed, 31 Jan 2024 11:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5464861488
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q2qDJIXmFDm3; Wed, 31 Jan 2024 11:23:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BB1060803;
	Wed, 31 Jan 2024 11:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BB1060803
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 34A161BF5E6
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B28C4017B
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B28C4017B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Z4INqaaaFjp for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 11:22:58 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::601])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3A604012F
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 11:22:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3A604012F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iujthimos/caqxcv1crgSnL4CxHtDeqXS6gCDwcQI+sb1KaCHH8u6HIYZBIcoQBxdTEuPYSHEujaN908mYST2Atr6R+DPlfNWUAKbXAjsgE7xOTpLwj55z4SHZFjndmdZxAdmcL9Qs5H473KO7H/tj1KJUy53rfXshrPqwvvgqgw8+NWoNLjZImofPKm9LXo3bbSrhpYesaNq6vjTtYTz+y+eVdKU2WVXhzO9GQyZpjC7xQCPz0M8D31s2pASXEzI3rg5JcvEeB26At7kQoqPuUeu8OU2hlui0LsMfJGI51+1gk1i8rawT1zsw/v9MndN0fLYp08DpacRRjkCb9KKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7VW9TCMvFBm0PMXtKV10fXeB40m1BwmBbqpDLPWqaI=;
 b=FxDw5LS1g4XLbXh9BWRyONvUMQyFgubCZqMHBE7HaGL860PjiyY6QlrMOTEewGunzEBZCQyufkaUdX1CuIh2ubcHb8aeHyDY2638iarC51TwozlJsjOSdgWSN+/h21ew72Bcfya4ajXazn1qXmVqCE6wlYu+q2CCBxA3336hga8HAKupIcc2l50bYeuhduoFop/v1vSoUR4lvBJp5k/dQSUDNT69KNBve4eIOCDtFo7/Zi+UWwiCQWsadK/4uYsE5UcE8wVQ7IPKmpywPpsXM8uRiqiH4YliKsXAdfzavg/Ck9aSpJ4bRbaP4JDZAL3IUiFfz+eK+2kYSjqhhMStBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from BYAPR11CA0039.namprd11.prod.outlook.com (2603:10b6:a03:80::16)
 by MW4PR12MB7468.namprd12.prod.outlook.com (2603:10b6:303:212::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 11:22:53 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:a03:80:cafe::cd) by BYAPR11CA0039.outlook.office365.com
 (2603:10b6:a03:80::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Wed, 31 Jan 2024 11:22:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 31 Jan 2024 11:22:52 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 05:22:52 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 05:22:51 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 31 Jan 2024 05:22:50 -0600
To: <buildroot@buildroot.org>
Date: Wed, 31 Jan 2024 11:22:16 +0000
Message-ID: <20240131112223.2175855-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131112223.2175855-1-neal.frager@amd.com>
References: <20240131112223.2175855-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|MW4PR12MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc22154-79af-4999-f554-08dc224ef6f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bkz2uzUhiRkNQNBYPzLB8vJ3pJvhEiRFYC8DtKG6vej9h1gXDuWtv3RlC2EjX0k1uOHw+6UN5bHYk5R/I1IxM4WRR9ntHqClIsMVCpLZe3NmpQmdsO0r2DMkWTIh2QBnmxXRuMkmZpKdPBLrVPWQQdxSR0Oq0W0J/ALMyKTD/UrkZ6BgBVmX7lnBXCXGbDegRtulEmghMkp84/OBGB1HVLERMybRsbhT13P7qn021oXl2y33ITWrybq31FGPeq0QWAPrntIR3odanSQi0L2tvtIEj2m03RaS6KnwN0zhPq1mcsnVjw7wwozvjwS+0MFUryPcVKR8BdAGhY0NLuZVMhVWtUard7uqwA4cmQHT4fqst9zxsYvJBKQO7BnaPTh/zbtDE5AXWRcINc6DLwyhZEWfK0xcR4AmAFein/t9QOYIsjJ6cmDPd2kxT6uOJ7AkzhmeBeaQwS+tke6Bhc11f8Iz8hSxeohrwjUWBmh/n+rlWE/x3T53pvVwsxMD0nnY8oks/WPtsZDg+db8X7O/GpEGThFvRi/aHilS0d7YGyhfvYdlbVSCPErZG2AZhHyFVmSgOYtntw3dVDCLIU1O5ltgJXK+VHOO0BtpxLTrFtO+yu2b1DSiV3BCd/QS+pUtf2yEGIIUCszDwHv07++glZNfoFZJXBcf67HmYh3LvP4DhnCimrXV6Jhv6kwjt9dJCO9Ntj6UOFmduhm/bpLoga5NmTFz33OmqH4+pXWgAcCpKMuvZaeRvSr0qJeVlbiK
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(451199024)(82310400011)(64100799003)(186009)(1800799012)(46966006)(40470700004)(36840700001)(40460700003)(40480700001)(41300700001)(36756003)(86362001)(81166007)(356005)(36860700001)(47076005)(26005)(82740400003)(1076003)(2616005)(426003)(336012)(2906002)(478600001)(6916009)(70206006)(316002)(70586007)(6666004)(54906003)(5660300002)(4326008)(44832011)(8936002)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 11:22:52.5200 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc22154-79af-4999-f554-08dc224ef6f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7468
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7VW9TCMvFBm0PMXtKV10fXeB40m1BwmBbqpDLPWqaI=;
 b=1g/1oVLNZcX/hpWl7MfF9ZYuPMJaLQplro+7RNxKS4RNFaXVrUpWpOGbEPKkwGcmeOG74qFY+Ly9g3jVyuTESKJ/G5wdE89XnBsB46p1MJFrM/cH5VjzqP5AkEyXiX52qqd/NmdRxIvwsuYZFAiJv7wu8d7yjbVnCWh7l819dnA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=1g/1oVLN
Subject: [Buildroot] [PATCH v9 04/11] package/newlib-bare-metal: new package
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
cHBsaWNhdGlvbnMgZm9yIHp5bnFtcCBhbmQgdmVyc2FsLgoKU2lnbmVkLW9mZi1ieTogTmVhbCBG
cmFnZXIgPG5lYWwuZnJhZ2VyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEliYWkgRXJraWFnYSA8
aWJhaS5lcmtpYWdhLWVsb3J6YUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6
b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgotLS0KVjEtPlYyOgogLSByZW1vdmVk
IGRlZmF1bHQgZW5hYmxlIHRvIGJlIHJlcGxhY2VkIHdpdGggdG9vbGNoYWluIHNlbGVjdCBjb25m
aWcKVjItPlYzOgogLSBubyBjaGFuZ2VzClYzLT5WNDoKIC0gcmVwbGFjZWQgdW5uZWNlc3Nhcnkg
PT8gd2l0aCA9IGZvciBhc3NpZ25tZW50cwogLSBpbXByb3ZlZCBtZW51Y29uZmlnIGhlbHAgY29t
bWVudApWNC0+VjU6CiAtIGFkZGVkIGxpY2Vuc2UgZmlsZXMKIC0gcmVkdWNlZCBhbGwgbGluZXMg
dG8gPDgwIGNoYXJzClY1LT5WNjoKIC0gbWlncmF0ZWQgdG8gdG9vbGNoYWluLWJhcmUtbWV0YWwt
YnVpbGRyb290ClY2LT5WNzoKIC0gaGFyZC1jb2RlZCB2ZXJzaW9uCiAtIGNvbnZlcnRlZCB0byB0
YXJnZXQgcGFja2FnZSB3aXRoIGdjYy1iYXJlLW1ldGFsIHN5c3Jvb3QgaW5zdGFsbApWNy0+Vjg6
CiAtIG5vIGNoYW5nZXMKVjgtPlY5OgogLSBidW1wZWQgdG8gdmVyc2lvbiA0LjQuMAotLS0KIERF
VkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsKIHBhY2th
Z2UvbmV3bGliLWJhcmUtbWV0YWwvQ29uZmlnLmluICAgICAgICAgICB8ICAyICsKIC4uLi9uZXds
aWItYmFyZS1tZXRhbC9uZXdsaWItYmFyZS1tZXRhbC5oYXNoICB8ICA4ICsrKwogLi4uL25ld2xp
Yi1iYXJlLW1ldGFsL25ld2xpYi1iYXJlLW1ldGFsLm1rICAgIHwgNTIgKysrKysrKysrKysrKysr
KysrKwogNCBmaWxlcyBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL25ld2xpYi1iYXJlLW1ldGFsLmhhc2gKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL25ld2xpYi1iYXJlLW1ldGFs
Lm1rCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggYWY2YzAxYzcy
Zi4uMDU3ZWFjNzg0NSAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBA
IC0xMzg4LDYgKzEzODgsNyBAQCBGOglwYWNrYWdlL3B5dGhvbi1ycGktZ3Bpby8KIE46CUliYWkg
RXJraWFnYSA8aWJhaS5lcmtpYWdhLWVsb3J6YUBhbWQuY29tPgogRjoJcGFja2FnZS9iaW51dGls
cy1iYXJlLW1ldGFsLwogRjoJcGFja2FnZS9nY2MtYmFyZS1tZXRhbC8KK0Y6CXBhY2thZ2UvbmV3
bGliLWJhcmUtbWV0YWwvCiBGOgl0b29sY2hhaW4vdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRy
b290LwogCiBOOglJZ25hY3kgR2F3xJlkemtpIDxpZ25hY3kuZ2F3ZWR6a2lAZ3JlZW4tY29tbXVu
aWNhdGlvbnMuZnI+CkBAIC0yMjQ1LDYgKzIyNDYsNyBAQCBGOgljb25maWdzL3p5bnFtcF96Y3Ux
MDZfZGVmY29uZmlnCiBGOglwYWNrYWdlL2JpbnV0aWxzLWJhcmUtbWV0YWwvCiBGOglwYWNrYWdl
L2Jvb3RnZW4vCiBGOglwYWNrYWdlL2djYy1iYXJlLW1ldGFsLworRjoJcGFja2FnZS9uZXdsaWIt
YmFyZS1tZXRhbC8KIEY6CXBhY2thZ2UvdmVyc2FsLWZpcm13YXJlLwogRjoJdG9vbGNoYWluL3Rv
b2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9vdC8KIApkaWZmIC0tZ2l0IGEvcGFja2FnZS9uZXds
aWItYmFyZS1tZXRhbC9Db25maWcuaW4gYi9wYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL0NvbmZp
Zy5pbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4xZmYzZDVkOGVjCi0t
LSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC9Db25maWcuaW4KQEAg
LTAsMCArMSwyIEBACitjb25maWcgQlIyX1BBQ0tBR0VfTkVXTElCX0JBUkVfTUVUQUwKKwlib29s
CmRpZmYgLS1naXQgYS9wYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL25ld2xpYi1iYXJlLW1ldGFs
Lmhhc2ggYi9wYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL25ld2xpYi1iYXJlLW1ldGFsLmhhc2gK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZjhjNTUzY2Y4NgotLS0gL2Rl
di9udWxsCisrKyBiL3BhY2thZ2UvbmV3bGliLWJhcmUtbWV0YWwvbmV3bGliLWJhcmUtbWV0YWwu
aGFzaApAQCAtMCwwICsxLDggQEAKKyMgTG9jYWxseSBjYWxjdWxhdGVkCitzaGEyNTYgIDBjMTY2
YTM5ZTFiZjA5NTFkZmFmY2Q2ODk0OWZlMGU0YjZkMzY1ODA4MWQ2MjgyZjM5YWVlZmM2MzEwZjJm
MTMgIG5ld2xpYi00LjQuMC4yMDIzMTIzMS50YXIuZ3oKKworIyBIYXNoZXMgZm9yIGxpY2Vuc2Ug
ZmlsZXMgbG9jYWxseSBjYWxjdWxhdGVkCitzaGEyNTYgIDIzMWY3ZWRjYzczNTJkNzczNGE5NmVl
ZjBiODAzMGY3Nzk4MjY3OGM1MTY4NzZmY2I4MWUyNWIzMmQ2ODU2NGMgIENPUFlJTkcKK3NoYTI1
NiAgYTliZGRlNTYxNmVjZGQxZTk4MGI0NGYzNjA2MDBlZTg3ODNiMWY5OWI4Y2M4M2EyYmViMTYz
YTBhMzkwZTg2MSAgQ09QWUlORy5MSUIKK3NoYTI1NiAgZjNiN2YzZTQ0MjZiMWZhNmY2MDE5OGRh
ZTdhZGZlZGQ5NGI3N2IyOGRiMmQxMDhhZGMwMjUzNTc1MDExZTBmZiAgQ09QWUlORy5MSUJHTE9T
Uworc2hhMjU2ICA0MjJhYTQwMjkzMDkzZmI1NGZjNjZlNjkyYTBkNjhmZDBiMjRlZDU2MDJlNWQx
ZDMzYWQwNWJhMzkwOTA1N2U5ICBDT1BZSU5HLk5FV0xJQgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9u
ZXdsaWItYmFyZS1tZXRhbC9uZXdsaWItYmFyZS1tZXRhbC5tayBiL3BhY2thZ2UvbmV3bGliLWJh
cmUtbWV0YWwvbmV3bGliLWJhcmUtbWV0YWwubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMC4uNDUyYmM0ZGEyNQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbmV3bGli
LWJhcmUtbWV0YWwvbmV3bGliLWJhcmUtbWV0YWwubWsKQEAgLTAsMCArMSw1MiBAQAorIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKKyMKKyMgbmV3bGliLWJhcmUtbWV0YWwKKyMKKyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCisKK05FV0xJQl9CQVJFX01FVEFMX1ZFUlNJT04gPSA0LjQuMAorTkVXTElC
X0JBUkVfTUVUQUxfU0lURSA9IGZ0cDovL3NvdXJjZXdhcmUub3JnL3B1Yi9uZXdsaWIKK05FV0xJ
Ql9CQVJFX01FVEFMX1NPVVJDRSA9IG5ld2xpYi0kKE5FV0xJQl9CQVJFX01FVEFMX1ZFUlNJT04p
LjIwMjMxMjMxLnRhci5negorTkVXTElCX0JBUkVfTUVUQUxfREVQRU5ERU5DSUVTID0gaG9zdC1n
Y2MtYmFyZS1tZXRhbAorTkVXTElCX0JBUkVfTUVUQUxfQUREX1RPT0xDSEFJTl9ERVBFTkRFTkNZ
ID0gTk8KK05FV0xJQl9CQVJFX01FVEFMX0xJQ0VOU0UgPSBHUEwtMi4wLCBHUEwtMy4wLCBMR1BM
LTIuMSwgTEdQTC0zLjAKK05FV0xJQl9CQVJFX01FVEFMX0xJQ0VOU0VfRklMRVMgPSBcCisJQ09Q
WUlORyBcCisJQ09QWUlORy5MSUIgXAorCUNPUFlJTkcuTElCR0xPU1MgXAorCUNPUFlJTkcuTkVX
TElCCisKK05FV0xJQl9CQVJFX01FVEFMX0lOU1RBTExfU1RBR0lORyA9IFlFUworTkVXTElCX0JB
UkVfTUVUQUxfSU5TVEFMTF9UQVJHRVQgPSBOTworCitkZWZpbmUgTkVXTElCX0JBUkVfTUVUQUxf
Q09ORklHVVJFX0NNRFMKKwkoY2QgJChARCkgJiYgXAorCQlQQVRIPSQoQlJfUEFUSCkgXAorCQku
L2NvbmZpZ3VyZSBcCisJCQktLXRhcmdldD0kKFRPT0xDSEFJTl9CQVJFX01FVEFMX0JVSUxEUk9P
VF9BUkNIX1RVUExFKSBcCisJCQktLXByZWZpeD0vdXNyIFwKKwkJCS0tZW5hYmxlLW5ld2xpYi1p
by1jOTktZm9ybWF0cyBcCisJCQktLWVuYWJsZS1uZXdsaWItaW8tbG9uZy1sb25nIFwKKwkJCS0t
ZW5hYmxlLW5ld2xpYi1pby1mbG9hdCBcCisJCQktLWVuYWJsZS1uZXdsaWItaW8tbG9uZy1kb3Vi
bGUgXAorCQkJLS1kaXNhYmxlLW11bHRpbGliIFwKKwkpCitlbmRlZgorCitkZWZpbmUgTkVXTElC
X0JBUkVfTUVUQUxfQlVJTERfQ01EUworCVBBVEg9JChCUl9QQVRIKSAkKE1BS0UxKSAtQyAkKEBE
KQorZW5kZWYKKworZGVmaW5lIE5FV0xJQl9CQVJFX01FVEFMX0lOU1RBTExfU1RBR0lOR19DTURT
CisJUEFUSD0kKEJSX1BBVEgpICQoTUFLRTEpIC1DICQoQEQpIERFU1RESVI9JChUT09MQ0hBSU5f
QkFSRV9NRVRBTF9CVUlMRFJPT1RfU1lTUk9PVCkgaW5zdGFsbAorZW5kZWYKKworZGVmaW5lIE5F
V0xJQl9CQVJFX01FVEFMX0ZJWFVQCisJbXYgJChUT09MQ0hBSU5fQkFSRV9NRVRBTF9CVUlMRFJP
T1RfU1lTUk9PVCkvdXNyLyQoVE9PTENIQUlOX0JBUkVfTUVUQUxfQlVJTERST09UX0FSQ0hfVFVQ
TEUpL2luY2x1ZGUgXAorCQkkKFRPT0xDSEFJTl9CQVJFX01FVEFMX0JVSUxEUk9PVF9TWVNST09U
KS91c3IvaW5jbHVkZQorCW12ICQoVE9PTENIQUlOX0JBUkVfTUVUQUxfQlVJTERST09UX1NZU1JP
T1QpL3Vzci8kKFRPT0xDSEFJTl9CQVJFX01FVEFMX0JVSUxEUk9PVF9BUkNIX1RVUExFKS9saWIg
XAorCQkkKFRPT0xDSEFJTl9CQVJFX01FVEFMX0JVSUxEUk9PVF9TWVNST09UKS91c3IvbGliCitl
bmRlZgorTkVXTElCX0JBUkVfTUVUQUxfUE9TVF9JTlNUQUxMX1NUQUdJTkdfSE9PS1MgKz0gTkVX
TElCX0JBUkVfTUVUQUxfRklYVVAKKworJChldmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkKLS0gCjIu
MjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
