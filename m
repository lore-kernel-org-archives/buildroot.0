Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582FDC47DB3
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 11:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0920C614AA;
	Wed, 31 Jan 2024 11:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0920C614AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id npApeXlp8kxi; Wed, 31 Jan 2024 11:22:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29111614EE;
	Wed, 31 Jan 2024 11:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29111614EE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A31541BF5E6
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6904483F2D
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6904483F2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1FfeHekef9zi for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 11:22:36 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::607])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CB7C83F16
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 11:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CB7C83F16
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2Psu1mf5f8t0P++dQybnqNGPcEIhYYa7koUHntZ5wEvRdEwbfmBfseGeXhvygnUho/Fgfl1q2o+6UZ5i+Mt+CQjwpbsfAyA3CuEt+BN9aOFuT3Wuk+qUh5cvKW0DIckAPLLTP6YInoJFJ9ggSyvKWjrP+y+3MIjsBHu/wxeEGI3+rIeA4XT0P9DvWadPzjkY7Em5/WwSKdbuWSC+6F0QY3hrl/ZomLJTNjNu3+/m1QIui3B3z8dr6MEVPgQ2saB9ewTJ+AT2kGZSRQ7Ksp1xF90j0qmx4IUE3XrdITqC613pR/RIu+jKFN1hftLwUS45ofoLVrnJAkHhA7IrbZ0aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32mr8OwZ+KoLrlB7sfl28m60/cVRHCrKN+LIRxgn7ww=;
 b=CUe+g/JzlAsJJH6nC8z2irq6mb16zD67ZNYGLA9yx2KdmZdhu92lALwncj0Z1QSgh48cqXsCnDAVFGNxpX643bw0SE5MYEQPDYGoiyaMwNex2/vXxu3TkLvqYLpIxNJgwp5G1YFNVSoulwoFk1Y5M/4wWJQCP0zxt6MOCtlF/vMzHfBmR2aRtfdMqmSBb4R1t4SFzzt04mzyY7h2RuagbMe2J4iqbFPjPwb1CTtxdMVq7dJ502bPCOgMBiP2N+Ewq2NtDbMy4Y1TNGoG8hiuZt8CiET+4PTDwKylrwOhU0XZ+V+uhuRBhXrOzeryvVZueIV8or0RFye9IbqQi44QDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DS7PR07CA0007.namprd07.prod.outlook.com (2603:10b6:5:3af::25)
 by BN9PR12MB5306.namprd12.prod.outlook.com (2603:10b6:408:103::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 11:22:33 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:5:3af:cafe::1a) by DS7PR07CA0007.outlook.office365.com
 (2603:10b6:5:3af::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24 via Frontend
 Transport; Wed, 31 Jan 2024 11:22:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 31 Jan 2024 11:22:32 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 05:22:32 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 05:22:31 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 31 Jan 2024 05:22:30 -0600
To: <buildroot@buildroot.org>
Date: Wed, 31 Jan 2024 11:22:14 +0000
Message-ID: <20240131112223.2175855-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131112223.2175855-1-neal.frager@amd.com>
References: <20240131112223.2175855-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|BN9PR12MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: 85667a68-e171-48aa-901a-08dc224eeb05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y2QRatk/K9TKn6C8D2rsN9Y83CQdk9xktrGVDrdbOp23CBPnMj4OYw1Sgl+OnjS1CYpUXps8iSI9WvKuqE8hwC5cICOH8n87SxzZJPub+Fw1yPVc7TqppUgjrJcwm9mCCY0/m0Eo46UNKF4bwzhpfpVLsLNGZ5GEelnwWbA+R1R21zbUtkrg9mjsmnCoDVPdxNWiFQhgn72C92F8g++cZpvDaoklFezYSnPNRQs/VBwxFM5YPjN9X3uq65xhFbs31EorFcYSW4SWNHFqz/aVpfEA0WjMGk6b2pHpE0ymhanRCeqLNYZlhO+wnF3Q1uUhWPXpQeK1vHcwbLporPW6ejkZHwYhv5hbujT+z+yyYLxTAFgObuXWYcFfkDfrLspiXfQWT/F8i43CRV/3ld5DwiORn1sxMhTLTMRLtx/VTxWmet8+mvbl6CUvPAshNWF9mhdh4609ETS7OrWcheYoA9ZMD1FR54sae9C2yHxrX1Jzw5SsMdIPcEOW5lJ0xLH+pv1tbviCDxxDgL1DPAwHvKae25601iODvEmsaCR0Xc+vjsXc2g+ZJTAHWVxFHqFQZPrlfp3XNTyHEGE7duVGxqH1A+53NyLAG3dKyZgITV8TLzV01qPoeMmKo3WG+GDQv3+1M7EXBP8zvWhDYQzAT3gBZrFaAfz/0td4HPBj2TFc+tflxpt6sFIcYS1gEhyMY5eoLAY2UYH/1Q0MuwfSSqLMfXOHEgBxn0MzXli/sr9K0n75R/RkMuukXBPt71JRA/i0d7J8GxCY4vcm7Za8CA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(82310400011)(186009)(64100799003)(1800799012)(451199024)(36840700001)(46966006)(40470700004)(40480700001)(40460700003)(83380400001)(41300700001)(86362001)(36756003)(82740400003)(81166007)(356005)(36860700001)(66574015)(47076005)(1076003)(2616005)(26005)(426003)(336012)(70206006)(478600001)(2906002)(6916009)(316002)(70586007)(6666004)(54906003)(8936002)(4326008)(5660300002)(8676002)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 11:22:32.4790 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85667a68-e171-48aa-901a-08dc224eeb05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5306
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32mr8OwZ+KoLrlB7sfl28m60/cVRHCrKN+LIRxgn7ww=;
 b=qhzEl6jk5Xcxl6+h/x5DqHt3sPmufKBzlKPrnR8kaPVSDDUB32CileCRBhwTKdWT47seSC0XR4sqahOVt57MqL+lh9ddQIm8RaCYrZjR8hc6HfGyULdMfqJPNiPquCXIYnGCYg9kdHKmKguy8GzCeL5qHiFEnEeYjPVp59Uwvps=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qhzEl6jk
Subject: [Buildroot] [PATCH v9 02/11] package/binutils-bare-metal: new
 package
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

VGhpcyBwYXRjaCBhZGRzIGEgbmV3IHBhY2thZ2UgZm9yIGJ1aWxkaW5nIGJpbnV0aWxzIGZvciBh
IGJhcmUtbWV0YWwgdG9vbGNoYWluLgpUaGUgY3B1IGFyY2hpdGVjdHVyZSBpcyBkZWZpbmVkIGJ5
IGEgdG9vbGNoYWluLWJhcmUtbWV0YWwgdmlydHVhbCBwYWNrYWdlLgpXaGlsZSBhbnkgY3B1IGFy
Y2hpdGVjdHVyZSBjb3VsZCBiZSB1c2VkLCB0aGUgZGVmYXVsdCBjb25maWd1cmF0aW9uIHdpbGwg
YmUgYQpYaWxpbnggbWljcm9ibGF6ZSBsaXR0bGUgZW5kaWFuIGFyY2hpdGVjdHVyZSwgc28gdGhh
dCBidWlsZHJvb3Qgd2lsbCBiZSBhYmxlCnRvIGJ1aWxkIHRoZSBtaWNyb2JsYXplIGZpcm13YXJl
IGFwcGxpY2F0aW9ucyBmb3IgenlucW1wIGFuZCB2ZXJzYWwuCgpJbiBvcmRlciB0byBidWlsZCB0
aGUgenlucW1wIHBtdWZ3IGFuZCB2ZXJzYWwgcGxtIGFwcGxpY2F0aW9ucyB3aXRob3V0IGVycm9y
LApiaW51dGlscyB2ZXJzaW9uIDIuNDEgb3IgaGlnaGVyIGlzIHJlcXVpcmVkLgoKU2lnbmVkLW9m
Zi1ieTogTmVhbCBGcmFnZXIgPG5lYWwuZnJhZ2VyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEli
YWkgRXJraWFnYSA8aWJhaS5lcmtpYWdhLWVsb3J6YUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBU
aG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgotLS0KVjEtPlYy
OgogLSByZW1vdmVkIGRlZmF1bHQgZW5hYmxlIHRvIGJlIHJlcGxhY2VkIHdpdGggdG9vbGNoYWlu
IHNlbGVjdCBjb25maWcKVjItPlYzOgogLSBubyBjaGFuZ2VzClYzLT5WNDoKIC0gc3BsaXQgdGFy
IGluc3RydWN0aW9uIGludG8gbXVsdGlwbGUgbGluZXMKIC0gcmVwbGFjZWQgdW5uZWNlc3Nhcnkg
PT8gd2l0aCA9IGZvciBhc3NpZ25tZW50cwogLSBjaGFuZ2VkIHhsbngtcmVsLXYyMDIzLjEudGFy
Lmd6IGhhc2ggdG8gc2hhMjU2CiAtIGltcHJvdmVkIG1lbnVjb25maWcgaGVscCBjb21tZW50ClY0
LT5WNToKIC0gbW92ZWQgdG8gdXBzdHJlYW0gdmVyc2lvbiAyLjQxIHdpdGggbmVlZGVkIHBhdGNo
ZXMKIC0gcmVkdWNlZCBhbGwgbGluZXMgdG8gPDgwIGNoYXJzClY1LT5WNjoKIC0gbWlncmF0ZWQg
dG8gdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290ClY2LT5WNzoKIC0gcmVtb3ZlZCBDb25m
aWcuaW4gYW5kIGhhcmQtY29kZWQgdmVyc2lvbgpWNy0+Vjg6CiAtIG5vIGNoYW5nZXMKVjgtPlY5
OgogLSBidW1wZWQgdG8gYmludXRpbHMgMi40MgogLSByZW1vdmVkIHBhdGNoZXMgc2luY2UgdGhl
eSBhcmUgaW5jbHVkZWQgd2l0aCBiaW51dGlscyAyLjQyCi0tLQogREVWRUxPUEVSUyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysKIC4uLi9iaW51dGlscy1iYXJlLW1l
dGFsLmhhc2ggICAgICAgICAgICAgICAgICB8ICAxICsKIC4uLi9iaW51dGlscy1iYXJlLW1ldGFs
Lm1rICAgICAgICAgICAgICAgICAgICB8IDMzICsrKysrKysrKysrKysrKysrKysKIHBhY2thZ2Uv
YmludXRpbHMvYmludXRpbHMuaGFzaCAgICAgICAgICAgICAgICB8ICAxICsKIDQgZmlsZXMgY2hh
bmdlZCwgMzcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTIwMDAwIHBhY2thZ2UvYmludXRp
bHMtYmFyZS1tZXRhbC9iaW51dGlscy1iYXJlLW1ldGFsLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL2JpbnV0aWxzLWJhcmUtbWV0YWwvYmludXRpbHMtYmFyZS1tZXRhbC5tawoKZGlm
ZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDRiOTdkY2ZiZDUuLmU3OGJk
NGRjMDIgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMTM4Niw2
ICsxMzg2LDcgQEAgTjoJSWFuIEhheWxvY2sgPGhheWxvY2tpQHlhaG9vLmNvLnVrPgogRjoJcGFj
a2FnZS9weXRob24tcnBpLWdwaW8vCiAKIE46CUliYWkgRXJraWFnYSA8aWJhaS5lcmtpYWdhLWVs
b3J6YUBhbWQuY29tPgorRjoJcGFja2FnZS9iaW51dGlscy1iYXJlLW1ldGFsLwogRjoJdG9vbGNo
YWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9vdC8KIAogTjoJSWduYWN5IEdhd8SZZHpr
aSA8aWduYWN5Lmdhd2VkemtpQGdyZWVuLWNvbW11bmljYXRpb25zLmZyPgpAQCAtMjI0MCw2ICsy
MjQxLDcgQEAgRjoJY29uZmlncy96eW5xbXBfa3JpYV9rdjI2MF9kZWZjb25maWcKIEY6CWNvbmZp
Z3MvenlucW1wX3pjdTEwMl9kZWZjb25maWcKIEY6CWNvbmZpZ3MvenlucW1wX3pjdTEwNF9kZWZj
b25maWcKIEY6CWNvbmZpZ3MvenlucW1wX3pjdTEwNl9kZWZjb25maWcKK0Y6CXBhY2thZ2UvYmlu
dXRpbHMtYmFyZS1tZXRhbC8KIEY6CXBhY2thZ2UvYm9vdGdlbi8KIEY6CXBhY2thZ2UvdmVyc2Fs
LWZpcm13YXJlLwogRjoJdG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9vdC8K
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvYmludXRpbHMtYmFyZS1tZXRhbC9iaW51dGlscy1iYXJlLW1l
dGFsLmhhc2ggYi9wYWNrYWdlL2JpbnV0aWxzLWJhcmUtbWV0YWwvYmludXRpbHMtYmFyZS1tZXRh
bC5oYXNoCm5ldyBmaWxlIG1vZGUgMTIwMDAwCmluZGV4IDAwMDAwMDAwMDAuLmUwNjU1ZDNhZjMK
LS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2JpbnV0aWxzLWJhcmUtbWV0YWwvYmludXRpbHMt
YmFyZS1tZXRhbC5oYXNoCkBAIC0wLDAgKzEgQEAKKy4uL2JpbnV0aWxzL2JpbnV0aWxzLmhhc2gK
XCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlCmRpZmYgLS1naXQgYS9wYWNrYWdlL2JpbnV0aWxz
LWJhcmUtbWV0YWwvYmludXRpbHMtYmFyZS1tZXRhbC5tayBiL3BhY2thZ2UvYmludXRpbHMtYmFy
ZS1tZXRhbC9iaW51dGlscy1iYXJlLW1ldGFsLm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAuLmQ1NWMyZDA4MWUKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2JpbnV0
aWxzLWJhcmUtbWV0YWwvYmludXRpbHMtYmFyZS1tZXRhbC5tawpAQCAtMCwwICsxLDMzIEBACisj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyBiaW51dGlscy1iYXJlLW1ldGFsCisjCisjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIworCitIT1NUX0JJTlVUSUxTX0JBUkVfTUVUQUxfVkVSU0lPTiA9
IDIuNDIKK0hPU1RfQklOVVRJTFNfQkFSRV9NRVRBTF9TSVRFID0gJChCUjJfR05VX01JUlJPUikv
YmludXRpbHMKK0hPU1RfQklOVVRJTFNfQkFSRV9NRVRBTF9TT1VSQ0UgPSBiaW51dGlscy0kKEhP
U1RfQklOVVRJTFNfQkFSRV9NRVRBTF9WRVJTSU9OKS50YXIueHoKKworSE9TVF9CSU5VVElMU19C
QVJFX01FVEFMX0xJQ0VOU0UgPSBHUEwtMy4wKywgbGliaWJlcnR5IExHUEwtMi4xKworSE9TVF9C
SU5VVElMU19CQVJFX01FVEFMX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HMyBDT1BZSU5HLkxJQgor
SE9TVF9CSU5VVElMU19CQVJFX01FVEFMX0NQRV9JRF9WRU5ET1IgPSBnbnUKKworSE9TVF9CSU5V
VElMU19CQVJFX01FVEFMX0RFUEVOREVOQ0lFUyA9IGhvc3QtemxpYgorCisjIERvbid0IGJ1aWxk
IGRvY3VtZW50YXRpb24uIEl0IHRha2VzIHVwIGV4dHJhIHNwYWNlIC8gYnVpbGQgdGltZSwKKyMg
YW5kIHNvbWV0aW1lcyBuZWVkcyBzcGVjaWZpYyBtYWtlaW5mbyB2ZXJzaW9ucyB0byB3b3JrCitI
T1NUX0JJTlVUSUxTX0JBUkVfTUVUQUxfQ09ORl9FTlYgKz0gTUFLRUlORk89dHJ1ZQorSE9TVF9C
SU5VVElMU19CQVJFX01FVEFMX01BS0VfT1BUUyArPSBNQUtFSU5GTz10cnVlCitIT1NUX0JJTlVU
SUxTX0JBUkVfTUVUQUxfSU5TVEFMTF9PUFRTICs9IE1BS0VJTkZPPXRydWUgaW5zdGFsbAorCitI
T1NUX0JJTlVUSUxTX0JBUkVfTUVUQUxfQ09ORl9PUFRTID0gXAorCS0tdGFyZ2V0PSQoVE9PTENI
QUlOX0JBUkVfTUVUQUxfQlVJTERST09UX0FSQ0hfVFVQTEUpIFwKKwktLWRpc2FibGUtZ3Byb2Yg
XAorCS0tZGlzYWJsZS1zaGFyZWQgXAorCS0tZW5hYmxlLWx0byBcCisJLS1lbmFibGUtc3RhdGlj
IFwKKwktLWRpc2FibGUtaW5pdGZpbmktYXJyYXkgXAorCS0tZGlzYWJsZS1tdWx0aWxpYiBcCisJ
LS1kaXNhYmxlLXdlcnJvcgorCiskKGV2YWwgJChob3N0LWF1dG90b29scy1wYWNrYWdlKSkKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvYmludXRpbHMvYmludXRpbHMuaGFzaCBiL3BhY2thZ2UvYmludXRp
bHMvYmludXRpbHMuaGFzaAppbmRleCA1MTlhMGNhODg3Li5lNGM2YTBiMGI2IDEwMDY0NAotLS0g
YS9wYWNrYWdlL2JpbnV0aWxzL2JpbnV0aWxzLmhhc2gKKysrIGIvcGFja2FnZS9iaW51dGlscy9i
aW51dGlscy5oYXNoCkBAIC0yLDYgKzIsNyBAQAogc2hhNTEyICA2OGUwMzhmMzM5YThjMjFmYWEx
OWE1N2JiYzQ0N2E1MWM4MTdmNDdjMmUwNmQ3NDA4NDdjNmU5Y2MzMzk2YzAyNWQzNWQ1MzY5ZmE4
YzNmOGI3MDQxNDc1N2M4OWYwZTU3NzkzOWRkYzBkNzBmMjgzMTgyNTA0OTIwZjUzYjBhMyAgYmlu
dXRpbHMtMi4zOS50YXIueHoKIHNoYTUxMiAgYTM3ZTA0MjUyM2JjNDY0OTRkOTlkNTYzN2MzZjNk
OGY5OTU2ZDk0NzdiNzQ4YjNiMWY2ZDdkZmJiOGQ5NjhlZDUyYzkzMmU4OGE0ZTk0NmM2Zjc3Yjhm
NDhmMWUxYjM2MGNhNTRjM2QyOThmMTcxOTNmM2I0OTYzNDcyZjY5MjUgIGJpbnV0aWxzLTIuNDAu
dGFyLnh6CiBzaGE1MTIgIDVkZjQ1ZDBiZDZkZGFiZGNlNGYzNTg3OGMwNDFlNDZhOTJkZWVmMDFl
N2RlYTVmYWNjOTdmZDY1Y2MwNmI1OWFiYzZmYmEwZWI0NTRiNjhlNTcxYzdlMTQwMzhkYzgyM2Zl
N2YyMjYzODQzZTZlNjI3Yjc0NDRlYWYwZmU5Mzc0ICBiaW51dGlscy0yLjQxLnRhci54egorc2hh
NTEyICAxNTVmM2JhMTRjZDIyMDEwMmY0ZjI5YTRmMWU1Y2ZlZTNjNDhhYTAzYjc0NjAzNDYwZDA1
YWZiNzNjNzBkNjY1N2E5ZDg3ZWVlNmViODhiZjEzMjAzZmU2ZjMxMTc3YTVjOWFkZGMwNDM4NGU5
NTZlN2RhODA2OWM4ZWNkMjBhNiAgYmludXRpbHMtMi40Mi50YXIueHoKIAogIyBMb2NhbGx5IGNh
bGN1bGF0ZWQgKGZldGNoZWQgZnJvbSBHaXRodWIpCiBzaGE1MTIgIDM1MThiNDdkNWMxMWQxZmI0
NzhlZTE1MmJkZTE3MTkzNjNmOTM5MWRiNzNmM2I5ZjU0OTEyMTdjMTc3NDJiZWY4ZWJjYTZhNTFh
NDAzMDJkZmFhOTQ3NmM1YTMyYThiOGY3MGE0YmY2NDI4OTQyMmRlYTVmNzUwYWU1M2FiODhkICBi
aW51dGlscy1nZGItYXJjLTIwMjMuMDktcmVsZWFzZS50YXIuZ3oKLS0gCjIuMjUuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
