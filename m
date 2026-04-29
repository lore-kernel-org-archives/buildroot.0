Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CEFFF8867
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 09:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46D0761440;
	Wed, 29 Apr 2026 09:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9IyC3GrRGvL; Wed, 29 Apr 2026 09:36:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16A95613FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777455398;
	bh=BZV+rE/cu/8H3NNZ6b2xeZpYC0IUcBWGQZhAAQ0L40U=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gjRJbe7la/wg7Z9sGf1OoMnw1D9YSwtxlJLhIcJMOAY+mVCO15hdv1LWGJGPKPd1S
	 cKctq1B2TM7b3OGNLA5hsP21aIbfUIS6/8dx7A1AWt7nfol3ymNaEbZwd+HlpTYYwv
	 6aZ+qWSC4JdFf2NbZXbFL2P+IGuUyXdM624OG/pJkgKvWo1jA9smmoSb9lCmezetuK
	 emHQThwuCEYKwRbh0WZH/bR1iPF2aQQ4JM8BlvL+kQEi2twuAlWQ0DLREaka30kMHW
	 S2oxV/fUs+Nh2rBk8pqw/+oY8mSusfEMRMP9GzQQiZIOOi6D3AZ92L3Y6KK7tBCdYU
	 Cx4NOQ3aWs8tA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16A95613FE;
	Wed, 29 Apr 2026 09:36:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B50BB231
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 09:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5C5C613FE
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 09:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id plND7VSk3uQp for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 09:36:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::5;
 helo=duzpr83cu001.outbound.protection.outlook.com;
 envelope-from=kanak.shilledar@axis.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C50B1613F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C50B1613F4
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C50B1613F4
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 09:36:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYOoAgVGr8ke7eWy2ilfrjXucVT8eDGVUy1oBG67CIG2Zss0JJBM1D89Quw8DMDdHuLbUHkuWCk1wePwQaDysGnVletgFax4F4RfZ3y5xmz/awSqXYaszYZRgFg7d/QpM+dPh/68xobqzq5CyT5w2R+USafaNEo+mL0LlOTtlBOzeeABzsKNto/IhXrmupEE4WSlVghxIiU/yf93GiVy4GjO2OF3Zpsa6TRnrTj1z8R65rpds0HgDKempOmUcELn2HRi0a6XzWr1jllEm4oGP3f5BG5Y4rJCFomq/sExhCkTUVALbVaytDTHEybzMHK/HNCDAasAeIeugmaQFehJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rp6sNCrrpdhHMqv3ydMn22qgMAhYw3ILD/0XZZnI2w=;
 b=J265XQmh5BVzPfsJYwY900N1RkGOU8a7ucrljGzLOR5oflEioJFvyP+XRlSm8rf2tDt0jfKiZxUTLAqwHB8DblPduftnNU8/hH6pj9WRSXeB/zsbkavufv3HJz71Rcf6dVqxN79BdZ5cdPLteYHbVrZ02iQ6RudLyps3f3slUvZhvqLwe8etBuZGGWPWRhub4ZxQqW7Hsp2JUrXQp4JjWUJuCIV/hDyETsfFbw5kgCZx69ZBczZrNA0zu0WwoEYtNQYBzCqaPaonbMnYrg1BXDbBVpshOFcrj5k8p0z4Sz0tThjpHNbhVu1nbRT64sMDMdOwkl0HVuLDZSo58EVYQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=buildroot.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
Received: from CWLP265CA0499.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18b::18)
 by AM0PR02MB5890.eurprd02.prod.outlook.com (2603:10a6:208:185::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 09:36:31 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:400:18b:cafe::be) by CWLP265CA0499.outlook.office365.com
 (2603:10a6:400:18b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 09:36:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 09:36:30 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 29 Apr
 2026 11:36:30 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 29 Apr 2026 11:36:30 +0200
Received: from pc66231-2602.sto.se.axis.com (pc66231-2602.sto.se.axis.com
 [10.133.4.42])
 by se-intmail01x.se.axis.com (Postfix) with ESMTP id 13AFE4EF;
 Wed, 29 Apr 2026 11:36:30 +0200 (CEST)
Received: by pc66231-2602.sto.se.axis.com (Postfix, from userid 21940)
 id 0030A305D2A6; Wed, 29 Apr 2026 11:36:29 +0200 (CEST)
From: Kanak Shilledar <kanak.shilledar@axis.com>
To: <buildroot@buildroot.org>
CC: Kanak Shilledar <kanak.shilledar@axis.com>
Date: Wed, 29 Apr 2026 11:36:14 +0200
Message-ID: <20260429093615.3993498-2-kanak.shilledar@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79A:EE_|AM0PR02MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c3e684a-3bb6-4573-de37-08dea5d2cb3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: vzyDN4ZlLvHOrx2CrWFy30Z47VMQmPb6XuNIIIzdK0JW6c1r1guVFtLCTlCCDrOaR22ST1uy88elIh1GeSbJZxWqsCPpIRmZMHkEr4IK99B25CGL/RpkgjNrUdK1remn1ka2TbThf92Q7z2Qf9RV2P27AHJXjX8dCJrGG1rOYRT6MSHI0q4k0+xcFq5h2YIlHLA8gCptWMpaeizXb+lh1Gd6zPe6d3t1AtYgbnPbPdnHQwlDmhOMte+9gPeltnUZ1RJrYs0QrCy0YaTKnXQEkpkFNI9lfwP2Sb3x0C/pSVA0JGbe8HnF5uK/qFSXYhfZ2M67tZbT+PTRwSTkS0OyHY7uuKrh6TO5NwMBdu8BYMrG6Jk2rDw1rAbl7WKEDxfI5188DYzYa+rQcrTz/+9PxoSBggM+JZf9jDbWKmuNB8jZvztnvTc9o2d4OrJA31TpOLeK+bpNdNvZKsypppAXCDT7CCw5ukoflQ5AZr2M7/5s9Xxj6JnPnuibWUpzSm7ICuqgau7WzwM6GsyyDsTlsg8IDKKrVAjlziK6CpVqz6QaNiYyZt8JAj2vaL6vrYQ6QBH5jIrz9HqjxtB03uEJr/QizH5Uup+itTvMgS/hkPEpUPO7k69KZ/Y5bzs1WvVNMv+F261nA7/HmXtoGv1n+Jd48XXMRcEDCOEgNxk3T2a61X96fppzGDgb3jC5RhLquQIx0p/Lv+/YXhuS0zeRp4pYmmn/GhM8XU0IzlOKuKo2UZB0XXS0lJ3IKvH0V9vSFf6T/ECVcAGAcJFU3nue2w==
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oLelFair8e7kzZCOmIEnVqAI1A7tgkxr4+0izUdLhOJmAHgIjdsQgm5z6Yj6M8gWp37OKNt13r3nEd0mfPNFtGMpOSTDHO0jaw6wNKA74UAdxtQ3ZdZAdYLh3g+xf+pSECEWStCtgl6AoDKHsnqgkz9gUxn0lKIKhL4ljQRmrdTJ4hDp5llmpTKpkLJy9LixZoDSULIix4hSiC1XAnso3QfKFSzPOtLYk2F+ZI6SnRnlmtdrFXZgNaUbxeincqmQxr1qNMyj+seKkECWEyTVJPWu2+Gf7VmRHkQC6RZZphjULc3/PT+OB8ksBV8OQmHyDl8qc5bfyH5n9HwIo4slWCi4+79ABXzrPNrEByeef/aYOHzbtK3/Gm9NaVAMd038ybpUZNwADtrFJjx1tcpe21UHZoHaHTSzfygqfB2T6/6F6JHFCYiOrxSyUKf6dM5T
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:36:30.4403 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3e684a-3bb6-4573-de37-08dea5d2cb3e
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5890
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rp6sNCrrpdhHMqv3ydMn22qgMAhYw3ILD/0XZZnI2w=;
 b=HIIg9Y7peHcf3/lStS5B3BVIzbLLHJbFMguo/WvNJQ0z79IFp2zD3GJ9UXGzNX/Jazyh8FqGpzLne74XB1MppfLHrBkWHEm63GjSx5gUIT+s+R+27qjnmxZFWYd9li9VAPqLPHYI9NQIgphvQkDSTfzrOcpjTQoilnx6Dmel25c=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=axis.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=HIIg9Y7p
Subject: [Buildroot] [PATCH v3 0/1] support: kconfig: Fix compiler warnings
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCldoaWxlIGJ1aWxkaW5nIHRoZSBgbWFzdGVyYCBicmFuY2ggb24gVWJ1bnR1IDI0LjA0LjQg
SSBhbSBnZXR0aW5nIHRoZQp3YXJuaW5nIG9mIGAtV2Zvcm1hdC1vdmVyZmxvdz1gLgoKYGBgCi4v
dXRpbC5jOiBJbiBmdW5jdGlvbiDigJhmaWxlX3dyaXRlX2RlcOKAmToKLi91dGlsLmM6ODY6MjY6
IHdhcm5pbmc6IOKAmCVz4oCZIGRpcmVjdGl2ZSB3cml0aW5nIDEwIG9yIG1vcmUgYnl0ZXMgaW50
byBhIHJlZ2lvbiBvZiBzaXplIGJldHdlZW4gMSBhbmQgNDA5NyBbLVdmb3JtYXQtb3ZlcmZsb3c9
XQogICA4NiB8ICAgICAgICAgc3ByaW50ZihidWYyLCAiJXMlcyIsIGRpciwgbmFtZSk7CiAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgIF5+Ci4vdXRpbC5jOjg2Ojk6IG5vdGU6IOKAmHNw
cmludGbigJkgb3V0cHV0IDExIG9yIG1vcmUgYnl0ZXMgKGFzc3VtaW5nIDQxMDcpIGludG8gYSBk
ZXN0aW5hdGlvbiBvZiBzaXplIDQwOTcKICAgODYgfCAgICAgICAgIHNwcmludGYoYnVmMiwgIiVz
JXMiLCBkaXIsIG5hbWUpOwogICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4KYGBgCgpJIHRyaWVkIHRoaXMgb24gdGhlIHJlbGVhc2UgYDIwMjYuMDIueGAgYW5k
IHRoaXMgd2FybmluZyBleGlzdHMgdGhlcmUgYXMKd2VsbC4gSSBhbSBydW5uaW5nIEdDQyB2ZXJz
aW9uIGAoVWJ1bnR1IDEzLjMuMC02dWJ1bnR1Mn4yNC4wNC4xKSAxMy4zLjBgCgpLYW5hayBTaGls
bGVkYXIgKDEpOgogIHN1cHBvcnQ6IGtjb25maWc6IEZpeCBjb21waWxlciB3YXJuaW5ncwoKIC4u
LnVwcG9ydC1rY29uZmlnLUZpeC1jb21waWxlci13YXJuaW5ncy5wYXRjaCB8IDQ1ICsrKysrKysr
KysrKysrKysrKysKIHN1cHBvcnQva2NvbmZpZy9wYXRjaGVzL3NlcmllcyAgICAgICAgICAgICAg
ICB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IHN1cHBvcnQva2NvbmZpZy9wYXRjaGVzLzI0LXN1cHBvcnQta2NvbmZpZy1GaXgtY29t
cGlsZXItd2FybmluZ3MucGF0Y2gKCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
