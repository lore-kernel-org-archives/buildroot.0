Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE53CDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 15:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8353F82468;
	Wed, 18 Oct 2023 15:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8353F82468
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eyxbmGgmzkEn; Wed, 18 Oct 2023 15:10:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 664B981E41;
	Wed, 18 Oct 2023 15:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 664B981E41
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D71B1BF342
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 15:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25E58404DB
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 15:10:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25E58404DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jwUlDdAwCS_c for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 15:09:59 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2860640342
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 15:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2860640342
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpzB4I0vlgZHXn3kCzFoSKpYZDIaPtiVohU3RkNIyzSZUrbcZGIIy2w3QLHM8cVRtHpJskYK8wljJg4FOjkMrxjjSZjACh5xXQxWayMHgkGx5EWQOUZ5pRewbkaW7E9rnPRVJr6mVvEWRDg3Kvc6t7/tK7regjCObpLrzyo0l5uMcxWaNUk6YQwTJts/zs78iEEyBSC+LzCH8doJp1vouXEWPxkka20jsaFA3CLJY1VIu2GCMS/7cKWElIAk5Y7ZHYtVQfebOil7ILakO4gqMSRNMJQH1NDcMMZ7+IAmVeDYvFxiEc/0aFrrp2iG6ScJ/SPmMRZkcwj4guYEiXNSjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MseqylkE3cq23A7uoAy3XezkZ4JNQK35QX5UJzb21+Q=;
 b=A+stRSPn35/elrBLVFkXtPcDgIc91KTjdkl+GreiMqkXAiEKqwH9cYC7lSMNHH77rVyaJ6nvEE2DEk+knPFm8VQmccl30283UHBB1ttgImHJPC1GtAos2M4det7RnBweAjlpsa6HHsmGy8uGak4yNvx+vP5Us6yOg3kKgzasjfAt+0xZti6hUDpG4/zXbWUEuXd66P5uZFnVKpG9+pPHIT2x/dxKXkBtFhiiSaSOHw58unROXyOQ4E7WZnj3IMXZ8PbwBLy6JOoWAzQFv3MbRCvHrLUFR7+h793FgX+LLzwbhtmMvV9Xzq3VWF+PCS2/+lyskjdC1Oi0tVk/uHT6oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CYXPR02CA0096.namprd02.prod.outlook.com (2603:10b6:930:ce::7)
 by PH7PR12MB9066.namprd12.prod.outlook.com (2603:10b6:510:1f6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Wed, 18 Oct
 2023 15:09:52 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:930:ce:cafe::3) by CYXPR02CA0096.outlook.office365.com
 (2603:10b6:930:ce::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24 via Frontend
 Transport; Wed, 18 Oct 2023 15:09:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Wed, 18 Oct 2023 15:09:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 10:09:50 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 18 Oct 2023 10:09:49 -0500
To: <buildroot@buildroot.org>
Date: Wed, 18 Oct 2023 16:09:25 +0100
Message-ID: <20231018150932.3961564-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018150932.3961564-1-neal.frager@amd.com>
References: <20231018150932.3961564-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|PH7PR12MB9066:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e79c8dc-1048-41d0-114f-08dbcfec472d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kmHL4GsP5V3AMJVu5xcdO3tT7ZttlRNbMlN0nmXv5qhWtTJtL2dey3otGW6CwZasLuNg6n2LHwSd6quVoqBOS+581Lf6zKloKcUGAMBI+aU1/hs5JMJu0Vd3kxnoSwO5y4UasW5iBVuQayFQFm+/dLKjjJLp7VzvYltgXqqBngkWiLVH5fhEst8gaU0cHBSIJ/FfxfHHCaNm8XkuPK9MKTsSNrx0D2Ovb67tUdgxy+ct3mZmymaB4HR9OBZdH/I2FkLo7a4kB9GiccbARjIi2FkgpILzCUZK8T/+Be+gQQHJfXUrbldD/miRXGPiVL8rgkBqtcqSRVJmNrEXOT1n3Shdz8qFrdQqCUwo4Ce74Ik5qbabTuTeW6pmD14VD7UdRQel9YWNv4mVrhWluaIvTEUBZD6ODDe8KPqM6jMjYKpG1jdgWMz5tbrqaZBA8CcU0ylcwv2cf0AMTtwKJzGixqXXpeUrBotCC/5UyGK/hm8AgBJFm/SxXHIxGX4znyiKSOuynar+waoa00YDQ88DppZZ434VceeL3KjdIaDvUPw5fEVzJtFeuR+N3Df4Um+RtcPOr6ScnvhMjNJvbsJMXcqqQUiyZAwYfLObJ0zxcfDCdgOu0GqG+vo6S1Dl0dnHlKm/GywYlmzCudFrAIi9VgUg1QsMXD4kWGn8TEPdkh8J03eKZpET9lcZLG/HOV6+nJ0q/IM6f1uGzG1ehoV7RhQvWEdVyn+4A1SDWZK9d/51x1aKmDAhLvKUltFPGmL8
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(64100799003)(82310400011)(1800799009)(451199024)(186009)(40470700004)(46966006)(36840700001)(36860700001)(40460700003)(478600001)(5660300002)(70206006)(70586007)(4326008)(8676002)(8936002)(2906002)(86362001)(41300700001)(6666004)(44832011)(54906003)(316002)(6916009)(40480700001)(47076005)(2616005)(81166007)(1076003)(26005)(336012)(82740400003)(36756003)(426003)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:09:51.5330 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e79c8dc-1048-41d0-114f-08dbcfec472d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9066
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MseqylkE3cq23A7uoAy3XezkZ4JNQK35QX5UJzb21+Q=;
 b=YjnZDz/6kKnsaA+CCrvmkRkFI6ltfA+2fK7NXTHxzcW5xmDHPHSk+vfUj+5tkKlxdkEEj7BgNQNgqAMYz+kJ9xlXbiXy8+POYr4WuiDT3SwjO0MAY3wsCSEecCdSjDt9mXhZ+msaubG+JsFJH8kyZcP0l+D9/xpEIcIyqTtMLTE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=YjnZDz/6
Subject: [Buildroot] [PATCH v5 03/10] package/newlib-bare-metal: new package
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
IGNoYXJzCi0tLQogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDIgKysKIHBhY2thZ2UvbmV3bGliLWJhcmUtbWV0YWwvQ29uZmlnLmluLmhvc3QgICAgICB8
IDEyICsrKysrKysKIC4uLi9uZXdsaWItYmFyZS1tZXRhbC9uZXdsaWItYmFyZS1tZXRhbC5oYXNo
ICB8ICA4ICsrKysrCiAuLi4vbmV3bGliLWJhcmUtbWV0YWwvbmV3bGliLWJhcmUtbWV0YWwubWsg
ICAgfCAzNiArKysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDU4IGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL0NvbmZp
Zy5pbi5ob3N0CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC9u
ZXdsaWItYmFyZS1tZXRhbC5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9uZXdsaWIt
YmFyZS1tZXRhbC9uZXdsaWItYmFyZS1tZXRhbC5tawoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMg
Yi9ERVZFTE9QRVJTCmluZGV4IDkyMmE3NGU0MjYuLjY3N2I4ZjA5YmQgMTAwNjQ0Ci0tLSBhL0RF
VkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMTM2OSw2ICsxMzY5LDcgQEAgRjoJcGFja2Fn
ZS9weXRob24tcnBpLWdwaW8vCiBOOglJYmFpIEVya2lhZ2EgPGliYWkuZXJraWFnYS1lbG9yemFA
YW1kLmNvbT4KIEY6CXBhY2thZ2UvYmludXRpbHMtYmFyZS1tZXRhbC8KIEY6CXBhY2thZ2UvZ2Nj
LWJhcmUtbWV0YWwvCitGOglwYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsLwogCiBOOglJZ25hY3kg
R2F3xJlkemtpIDxpZ25hY3kuZ2F3ZWR6a2lAZ3JlZW4tY29tbXVuaWNhdGlvbnMuZnI+CiBGOglw
YWNrYWdlL2FuZ3VsYXJqcy8KQEAgLTIyMDQsNiArMjIwNSw3IEBAIEY6CWNvbmZpZ3MvenlucW1w
X3pjdTEwNl9kZWZjb25maWcKIEY6CXBhY2thZ2UvYmludXRpbHMtYmFyZS1tZXRhbC8KIEY6CXBh
Y2thZ2UvYm9vdGdlbi8KIEY6CXBhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvCitGOglwYWNrYWdlL25l
d2xpYi1iYXJlLW1ldGFsLwogRjoJcGFja2FnZS92ZXJzYWwtZmlybXdhcmUvCiAKIE46CU5pY29s
YSBEaSBMaWV0byA8bmljb2xhLmRpbGlldG9AZ21haWwuY29tPgpkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9uZXdsaWItYmFyZS1tZXRhbC9Db25maWcuaW4uaG9zdCBiL3BhY2thZ2UvbmV3bGliLWJhcmUt
bWV0YWwvQ29uZmlnLmluLmhvc3QKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MC4uYmU5MmExZDZhNgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbmV3bGliLWJhcmUtbWV0
YWwvQ29uZmlnLmluLmhvc3QKQEAgLTAsMCArMSwxMiBAQAorY29uZmlnIEJSMl9QQUNLQUdFX0hP
U1RfTkVXTElCX0JBUkVfTUVUQUwKKwlib29sICJob3N0IG5ld2xpYi1iYXJlLW1ldGFsIgorCWhl
bHAKKwkgIEJ1aWxkIHRoZSBuZXdsaWIgQyBsaWJyYXJ5IGZvciBhIGJhcmUtbWV0YWwgdG9vbGNo
YWluCisKK2lmIEJSMl9QQUNLQUdFX0hPU1RfTkVXTElCX0JBUkVfTUVUQUwKKworY29uZmlnIEJS
Ml9QQUNLQUdFX0hPU1RfTkVXTElCX0JBUkVfTUVUQUxfVkVSU0lPTgorCXN0cmluZworCWRlZmF1
bHQgIjQuMS4wIgorCitlbmRpZiAjQlIyX1BBQ0tBR0VfSE9TVF9ORVdMSUJfQkFSRV9NRVRBTApk
aWZmIC0tZ2l0IGEvcGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC9uZXdsaWItYmFyZS1tZXRhbC5o
YXNoIGIvcGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC9uZXdsaWItYmFyZS1tZXRhbC5oYXNoCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjFhNjgxZWNmNzcKLS0tIC9kZXYv
bnVsbAorKysgYi9wYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL25ld2xpYi1iYXJlLW1ldGFsLmhh
c2gKQEAgLTAsMCArMSw4IEBACisjIExvY2FsbHkgY2FsY3VsYXRlZAorc2hhMjU2ICBmMjk2ZTM3
MmY1MTMyNDIyNGQzODdjYzExNmRjMzdhNmJkMzk3MTk4NzU2NzQ2ZjkzYTJiMDJlOWE1ZDQwMTU0
ICBuZXdsaWItNC4xLjAudGFyLmd6CisKKyMgSGFzaGVzIGZvciBsaWNlbnNlIGZpbGVzIGxvY2Fs
bHkgY2FsY3VsYXRlZAorc2hhMjU2ICAyMzFmN2VkY2M3MzUyZDc3MzRhOTZlZWYwYjgwMzBmNzc5
ODI2NzhjNTE2ODc2ZmNiODFlMjViMzJkNjg1NjRjICBDT1BZSU5HCitzaGEyNTYgIGE5YmRkZTU2
MTZlY2RkMWU5ODBiNDRmMzYwNjAwZWU4NzgzYjFmOTliOGNjODNhMmJlYjE2M2EwYTM5MGU4NjEg
IENPUFlJTkcuTElCCitzaGEyNTYgIGYzYjdmM2U0NDI2YjFmYTZmNjAxOThkYWU3YWRmZWRkOTRi
NzdiMjhkYjJkMTA4YWRjMDI1MzU3NTAxMWUwZmYgIENPUFlJTkcuTElCR0xPU1MKK3NoYTI1NiAg
NDIyYWE0MDI5MzA5M2ZiNTRmYzY2ZTY5MmEwZDY4ZmQwYjI0ZWQ1NjAyZTVkMWQzM2FkMDViYTM5
MDkwNTdlOSAgQ09QWUlORy5ORVdMSUIKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmV3bGliLWJhcmUt
bWV0YWwvbmV3bGliLWJhcmUtbWV0YWwubWsgYi9wYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFsL25l
d2xpYi1iYXJlLW1ldGFsLm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAu
LjY5ZTdlZmIyOTgKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL25ld2xpYi1iYXJlLW1ldGFs
L25ld2xpYi1iYXJlLW1ldGFsLm1rCkBAIC0wLDAgKzEsMzYgQEAKKyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCisjCisjIG5ld2xpYi1iYXJlLW1ldGFsCisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IworCitIT1NUX05FV0xJQl9CQVJFX01FVEFMX1ZFUlNJT04gPSBcCisJJChjYWxsIHFzdHJpcCwk
KEJSMl9QQUNLQUdFX0hPU1RfTkVXTElCX0JBUkVfTUVUQUxfVkVSU0lPTikpCitpZmVxICgkKEhP
U1RfTkVXTElCX0JBUkVfTUVUQUxfVkVSU0lPTiksKQorSE9TVF9ORVdMSUJfQkFSRV9NRVRBTF9W
RVJTSU9OID0gNC4xLjAKK2VuZGlmCisKK0hPU1RfTkVXTElCX0JBUkVfTUVUQUxfU0lURSA9IGZ0
cDovL3NvdXJjZXdhcmUub3JnL3B1Yi9uZXdsaWIKK0hPU1RfTkVXTElCX0JBUkVfTUVUQUxfU09V
UkNFID0gbmV3bGliLSQoSE9TVF9ORVdMSUJfQkFSRV9NRVRBTF9WRVJTSU9OKS50YXIuZ3oKK0hP
U1RfTkVXTElCX0JBUkVfTUVUQUxfREVQRU5ERU5DSUVTID0gaG9zdC1nY2MtYmFyZS1tZXRhbAor
CitIT1NUX05FV0xJQl9CQVJFX01FVEFMX0xJQ0VOU0UgPSBHUEwtMi4wLCBHUEwtMy4wLCBMR1BM
LTIuMSwgTEdQTC0zLjAKK0hPU1RfTkVXTElCX0JBUkVfTUVUQUxfTElDRU5TRV9GSUxFUyA9IENP
UFlJTkcgXAorCUNPUFlJTkcuTElCIFwKKwlDT1BZSU5HLkxJQkdMT1NTIFwKKwlDT1BZSU5HLk5F
V0xJQgorCitORVdMSUJfQVJDSCA9ICQoY2FsbCBxc3RyaXAsJChCUjJfUEFDS0FHRV9IT1NUX1RP
T0xDSEFJTl9CQVJFX01FVEFMX0FSQ0gpKQorCitIT1NUX05FV0xJQl9CQVJFX01FVEFMX0NPTkZf
T1BUUyA9IFwKKwktLXRhcmdldD0kKE5FV0xJQl9BUkNIKS1lbGYgXAorCUNDX0ZPUl9UQVJHRVQ9
JChIT1NUX0RJUikvYmluLyQoTkVXTElCX0FSQ0gpLWVsZi1nY2MgXAorCUFSX0ZPUl9UQVJHRVQ9
JChIT1NUX0RJUikvYmluLyQoTkVXTElCX0FSQ0gpLWVsZi1hciBcCisJUkFOTElCX0ZPUl9UQVJH
RVQ9JChIT1NUX0RJUikvYmluLyQoTkVXTElCX0FSQ0gpLWVsZi1yYW5saWIgXAorCS0tZW5hYmxl
LW5ld2xpYi1pby1jOTktZm9ybWF0cyBcCisJLS1lbmFibGUtbmV3bGliLWlvLWxvbmctbG9uZyBc
CisJLS1lbmFibGUtbmV3bGliLWlvLWZsb2F0IFwKKwktLWVuYWJsZS1uZXdsaWItaW8tbG9uZy1k
b3VibGUgXAorCS0tZGlzYWJsZS1tdWx0aWxpYgorCiskKGV2YWwgJChob3N0LWF1dG90b29scy1w
YWNrYWdlKSkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
