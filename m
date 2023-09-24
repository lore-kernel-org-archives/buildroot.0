Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B51CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 15:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04D294044F;
	Sun, 24 Sep 2023 15:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04D294044F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FOwbFoEnyvNj; Sun, 24 Sep 2023 15:12:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1812640232;
	Sun, 24 Sep 2023 15:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1812640232
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 99E7E1BF3E8
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 15:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 539F660A93
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 15:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 539F660A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TIOHXYddRpbV for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 15:12:39 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::61c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D953660595
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 15:12:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D953660595
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4ojbMm7ftq/oCdkCmN9sdKivlGfDp0knnRxUX21OoQYChfdeShAL4xguvD2rZCbYuh4A1T9OkM5GgwEEoQHNVjBS2nap4pqAz4oslPLmp9vXMDFJvSem3e8so7OFQaFFt5GzscfvOBb4IV/TYeHzzKE5okrTUMjiFdBmjLgpXztamoqcqfiVVGYxY+SHxh29yrBKqdbAzqg42oRxyNh9PbWQ2mcnguRqE0xzNtVSEavMuMVJ4wI0T93gc2HJ6YM6X8hNWfoqhnFPcLdRQHOJLIXaLbJheLhfw0gPJAPn3tPhT8eXv3zAFOTdXFYIrZ2ALcz+4LwiUdeCDrUIursJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9PlJ8RIFHYbzWZPsfTfgGhfs5K7jCBU8PiMxQcfa/I=;
 b=ne22brx9MsG6/xrGRi6DsfduufS+Hz8dIQ0Y9Slz3KGZq5A+z3CIMMuFMbNXCUbGHrESOzI4HGDztdxzeCuojmCpsSmWs7/SAksN+oqRXxZsccyjh8bPiyg+zttSBMufY2DTRpGWGbq9SGWGEaMFwnsBy3yjiLhRFbh6w5zzy97T/CI/OyMsVAZRPi5F/1tU5R5C9bnXMO+3cXRWIor/GBpxHn25V4Qo9uNy5iIiUle60kuovTp2Y6Pibi4JR7KTn1N1hwNzRApGe6FNtOQ+piyWqa6XSf2uil7aRN5Dwb53TfYFfMbeWgQdKymhBFyZFxKjeCc8JdoMrsg4wzdE2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BLAPR03CA0090.namprd03.prod.outlook.com (2603:10b6:208:329::35)
 by PH0PR12MB8175.namprd12.prod.outlook.com (2603:10b6:510:291::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.25; Sun, 24 Sep
 2023 15:12:31 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:329:cafe::57) by BLAPR03CA0090.outlook.office365.com
 (2603:10b6:208:329::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Sun, 24 Sep 2023 15:12:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sun, 24 Sep 2023 15:12:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 24 Sep
 2023 10:12:17 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Sun, 24 Sep 2023 10:12:16 -0500
To: <buildroot@buildroot.org>
Date: Sun, 24 Sep 2023 16:11:56 +0100
Message-ID: <20230924151205.2099293-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|PH0PR12MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fd02672-f887-4ad1-aef2-08dbbd10ab18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9enYycnBnya1Zw3rtp66UYJST+xj7+4vWmlshXXQ0fV0vHwQeltOGKUKpbLcgdNaG0KDqC/pnIeQOeJJJClg56hIySyYQe/fiQbuWIBITtfmQYJY+CTW1gZelit9FjV44p9XO81vujRkR+MM9khWj0rXyjCzfZW8oOEJZFUuO2ym1xObsbCYO1ATcZ0EVATT4NFRUuL0dvWgtoAnk4yQL9GdfIdl33LcLN6Q+5LHC73+BJoEHMc6QkZ3MI9dXqXPS+7XCSgz2EX9DIPD7liFAhOyjMrEOE28h/SG8M1Cw6CL+N0AFdo9xOVcTniZSULA0xPLch+r6bVwJD84fyBDaoN36h2bRRMUJHUPwiuMI/aZNnmJ1ObCgiqYj041hRxZSucqIuTvAtz0/hfriqcVqtYSCsaDGRBRWpeP/uZUBbVrKc66kWyn7uCXJ7SCG1RegNMFUcEkl93AnxOPyw/AylWf9tL54u7syaj4I4ENTTMpJg2oRMyNX2X/0nJVaGeo6EEELNyvOGo4BYYv8r/mDgfeIxkJqngs1WFtAmmTTzeNCpInM24SCJrYwWn109T2+wkNSp5E9prGbD6wCmnXEyGmYABlu9u2pwU9WUS4T1SglICshyPeOjSb50M5a9FKdM/Sb+U9Re/5Z5cWzlP9kbWTj/o7+ArDrNLpib/VuIQyV7U8+uLWV8hom3tlcAVQ4IW2hkDTWbpHDN+O6ugrbBOuyhpx0mPJQzVrWu1eOXbzWTR3E3WUYgnnCOeImKexf37K7EKdUFLz9vWaV9owBVq2CL1XmvaFKvY3XlKeLlI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(82310400011)(186009)(1800799009)(451199024)(46966006)(36840700001)(40470700004)(2906002)(5660300002)(41300700001)(44832011)(4326008)(8676002)(8936002)(54906003)(70586007)(316002)(426003)(26005)(336012)(966005)(1076003)(6916009)(70206006)(40460700003)(478600001)(66574015)(6666004)(82740400003)(81166007)(2616005)(83380400001)(36756003)(47076005)(36860700001)(40480700001)(356005)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2023 15:12:29.0392 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd02672-f887-4ad1-aef2-08dbbd10ab18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8175
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9PlJ8RIFHYbzWZPsfTfgGhfs5K7jCBU8PiMxQcfa/I=;
 b=v3CQHdAxk0lcqZtWUVpLoRTlUQ4XS+W003ZynV0WwEhy9ZoBCkeqIw9aHKkOzZ8j/84prZRndfIHJx1xih8W3zuzo/IWOgGUJERvo8r8h5/+pG2VPkSrYrHRxSWvXadczjTQFSkizymzrv+fB/hRWjopJnFJ6tnAR7hN9gAXiAQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=v3CQHdAx
Subject: [Buildroot] [PATCH v4 01/10] package/binutils-bare-metal: new
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
IGFwcGxpY2F0aW9ucyBmb3IgenlucW1wIGFuZCB2ZXJzYWwuCgpXaGVuIGNvbmZpZ3VyZWQgZm9y
IHRoZSBYaWxpbnggbWljcm9ibGF6ZSBhcmNoaXRlY3R1cmUsIGFsbCBvZiB0aGUgYmludXRpbHMK
cGF0Y2hlcyB0aGF0IGFyZSBhcHBsaWVkIHRvIHRoZSBYaWxpbnggZGlzdHJpYnV0ZWQgdG9vbGNo
YWluIHdpbGwgYmUgYXBwbGllZAppbiBvcmRlciB0byBnZW5lcmF0ZSBhIHRvb2xjaGFpbiB0aGF0
IGlzIGVxdWl2YWxlbnQgdG8gd2hhdCBYaWxpbnggZGlzdHJpYnV0ZXMuCgpTaWduZWQtb2ZmLWJ5
OiBJYmFpIEVya2lhZ2EtRWxvcnphIDxpYmFpLmVya2lhZ2EtZWxvcnphQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IE5lYWwgRnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQuY29tPgotLS0KVjEtPlYyOgog
LSByZW1vdmVkIGRlZmF1bHQgZW5hYmxlIHRvIGJlIHJlcGxhY2VkIHdpdGggdG9vbGNoYWluIHNl
bGVjdCBjb25maWcKVjItPlYzOgogLSBubyBjaGFuZ2VzClYzLT5WNDoKIC0gc3BsaXQgdGFyIGlu
c3RydWN0aW9uIGludG8gbXVsdGlwbGUgbGluZXMKIC0gcmVwbGFjZWQgdW5uZWNlc3NhcnkgPT8g
d2l0aCA9IGZvciBhc3NpZ25tZW50cwogLSBjaGFuZ2VkIHhsbngtcmVsLXYyMDIzLjEudGFyLmd6
IGhhc2ggdG8gc2hhMjU2CiAtIGltcHJvdmVkIG1lbnVjb25maWcgaGVscCBjb21tZW50Ci0tLQog
REVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKysKIHBh
Y2thZ2UvYmludXRpbHMtYmFyZS1tZXRhbC9Db25maWcuaW4uaG9zdCAgICB8IDEyICsrKysKIC4u
Li9iaW51dGlscy1iYXJlLW1ldGFsLmhhc2ggICAgICAgICAgICAgICAgICB8ICA3ICsrKwogLi4u
L2JpbnV0aWxzLWJhcmUtbWV0YWwubWsgICAgICAgICAgICAgICAgICAgIHwgNTYgKysrKysrKysr
KysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCA3OSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9iaW51dGlscy1iYXJlLW1ldGFsL0NvbmZpZy5pbi5ob3N0CiBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9iaW51dGlscy1iYXJlLW1ldGFsL2JpbnV0aWxzLWJhcmUt
bWV0YWwuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvYmludXRpbHMtYmFyZS1tZXRh
bC9iaW51dGlscy1iYXJlLW1ldGFsLm1rCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVM
T1BFUlMKaW5kZXggZThiNzhhOGQ0Ni4uMDQ2ZjhmNzg3NCAxMDA2NDQKLS0tIGEvREVWRUxPUEVS
UworKysgYi9ERVZFTE9QRVJTCkBAIC0xMzUwLDYgKzEzNTAsOSBAQCBGOglwYWNrYWdlL21ycC8K
IE46CUlhbiBIYXlsb2NrIDxoYXlsb2NraUB5YWhvby5jby51az4KIEY6CXBhY2thZ2UvcHl0aG9u
LXJwaS1ncGlvLwogCitOOglJYmFpIEVya2lhZ2EtRWxvcnphIDxpYmFpLmVya2lhZ2EtZWxvcnph
QGFtZC5jb20+CitGOglwYWNrYWdlL2JpbnV0aWxzLWJhcmUtbWV0YWwvCisKIE46CUlnbmFjeSBH
YXfEmWR6a2kgPGlnbmFjeS5nYXdlZHpraUBncmVlbi1jb21tdW5pY2F0aW9ucy5mcj4KIEY6CXBh
Y2thZ2UvYW5ndWxhcmpzLwogCkBAIC0yMTc4LDYgKzIxODEsNyBAQCBGOgljb25maWdzL3p5bnFf
emM3MDZfZGVmY29uZmlnCiBGOgljb25maWdzL3p5bnFtcF9rcmlhX2t2MjYwX2RlZmNvbmZpZwog
RjoJY29uZmlncy96eW5xbXBfemN1MTAyX2RlZmNvbmZpZwogRjoJY29uZmlncy96eW5xbXBfemN1
MTA2X2RlZmNvbmZpZworRjoJcGFja2FnZS9iaW51dGlscy1iYXJlLW1ldGFsLwogRjoJcGFja2Fn
ZS9ib290Z2VuLwogRjoJcGFja2FnZS92ZXJzYWwtZmlybXdhcmUvCiAKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvYmludXRpbHMtYmFyZS1tZXRhbC9Db25maWcuaW4uaG9zdCBiL3BhY2thZ2UvYmludXRp
bHMtYmFyZS1tZXRhbC9Db25maWcuaW4uaG9zdApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwLi4zYTY4YzFlMDJkCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9iaW51dGls
cy1iYXJlLW1ldGFsL0NvbmZpZy5pbi5ob3N0CkBAIC0wLDAgKzEsMTIgQEAKK2NvbmZpZyBCUjJf
UEFDS0FHRV9IT1NUX0JJTlVUSUxTX0JBUkVfTUVUQUwKKwlib29sICJob3N0IGJpbnV0aWxzLWJh
cmUtbWV0YWwiCisJaGVscAorCSAgQnVpbGQgR05VIGJpbnV0aWxzIGZvciBhIGJhcmUtbWV0YWwg
dG9vbGNoYWluCisKK2lmIEJSMl9QQUNLQUdFX0hPU1RfQklOVVRJTFNfQkFSRV9NRVRBTAorCitj
b25maWcgQlIyX1BBQ0tBR0VfSE9TVF9CSU5VVElMU19CQVJFX01FVEFMX1ZFUlNJT04KKwlzdHJp
bmcKKwlkZWZhdWx0ICIyLjM5IgorCitlbmRpZiAjQlIyX1BBQ0tBR0VfSE9TVF9CSU5VVElMU19C
QVJFX01FVEFMCmRpZmYgLS1naXQgYS9wYWNrYWdlL2JpbnV0aWxzLWJhcmUtbWV0YWwvYmludXRp
bHMtYmFyZS1tZXRhbC5oYXNoIGIvcGFja2FnZS9iaW51dGlscy1iYXJlLW1ldGFsL2JpbnV0aWxz
LWJhcmUtbWV0YWwuaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5j
NTA0NDNlODM3Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9iaW51dGlscy1iYXJlLW1ldGFs
L2JpbnV0aWxzLWJhcmUtbWV0YWwuaGFzaApAQCAtMCwwICsxLDcgQEAKKyMgRnJvbSBodHRwczov
L2djYy5nbnUub3JnL3B1Yi9iaW51dGlscy9yZWxlYXNlcy9zaGE1MTIuc3VtCitzaGE1MTIgIDY4
ZTAzOGYzMzlhOGMyMWZhYTE5YTU3YmJjNDQ3YTUxYzgxN2Y0N2MyZTA2ZDc0MDg0N2M2ZTljYzMz
OTZjMDI1ZDM1ZDUzNjlmYThjM2Y4YjcwNDE0NzU3Yzg5ZjBlNTc3OTM5ZGRjMGQ3MGYyODMxODI1
MDQ5MjBmNTNiMGEzICBiaW51dGlscy0yLjM5LnRhci54egorCisjIGxvY2FsbHkgY2FsY3VsYXRl
ZAorc2hhMjU2ICA1OTkyY2U2ODY1NDY4NTM3Yjg0MzcyNDgwZjc1OTMxMjVkYjc1NGY2NzNkY2Nh
ZTFlY2Y2ZDZhN2M3NGVkODhlICB4bG54LXJlbC12MjAyMy4xLnRhci5negorc2hhMjU2ICA4Y2Vi
NGI5ZWU1YWRlZGRlNDdiMzFlOTc1YzFkOTBjNzNhZDI3YjZiMTY1YTFkY2Q4MGM3YzU0NWViNjVi
OTAzICBDT1BZSU5HMworc2hhMjU2ICA1NmJkZWE3M2I2MTQ1ZWY2YWM1MjU5YjNkYTM5MGI5ODFk
ODQwYzI0Y2IwM2I4ZTFjYmM2NzhkZTdlY2ZhMThkICBDT1BZSU5HLkxJQgpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9iaW51dGlscy1iYXJlLW1ldGFsL2JpbnV0aWxzLWJhcmUtbWV0YWwubWsgYi9wYWNr
YWdlL2JpbnV0aWxzLWJhcmUtbWV0YWwvYmludXRpbHMtYmFyZS1tZXRhbC5tawpuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5kZThkZGNjOWU5Ci0tLSAvZGV2L251bGwKKysr
IGIvcGFja2FnZS9iaW51dGlscy1iYXJlLW1ldGFsL2JpbnV0aWxzLWJhcmUtbWV0YWwubWsKQEAg
LTAsMCArMSw1NiBAQAorIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKyMKKyMgYmludXRpbHMtYmFy
ZS1tZXRhbAorIworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKworSE9TVF9CSU5VVElMU19CQVJF
X01FVEFMX1ZFUlNJT04gPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1BBQ0tBR0VfSE9TVF9CSU5VVElM
U19CQVJFX01FVEFMX1ZFUlNJT04pKQoraWZlcSAoJChIT1NUX0JJTlVUSUxTX0JBUkVfTUVUQUxf
VkVSU0lPTiksKQorSE9TVF9CSU5VVElMU19CQVJFX01FVEFMX1ZFUlNJT04gPSAyLjM5CitlbmRp
ZiAjIEJJTlVUSUxTX1ZFUlNJT04gIAorCitIT1NUX0JJTlVUSUxTX0JBUkVfTUVUQUxfU0lURSA9
ICQoQlIyX0dOVV9NSVJST1IpL2JpbnV0aWxzCitIT1NUX0JJTlVUSUxTX0JBUkVfTUVUQUxfU09V
UkNFID0gYmludXRpbHMtJChIT1NUX0JJTlVUSUxTX0JBUkVfTUVUQUxfVkVSU0lPTikudGFyLnh6
CisKK0hPU1RfQklOVVRJTFNfQkFSRV9NRVRBTF9MSUNFTlNFID0gR1BMLTMuMCssIGxpYmliZXJ0
eSBMR1BMLTIuMSsKK0hPU1RfQklOVVRJTFNfQkFSRV9NRVRBTF9MSUNFTlNFX0ZJTEVTID0gQ09Q
WUlORzMgQ09QWUlORy5MSUIKK0hPU1RfQklOVVRJTFNfQkFSRV9NRVRBTF9DUEVfSURfVkVORE9S
ID0gZ251CisKK0hPU1RfQklOVVRJTFNfQkFSRV9NRVRBTF9ERVBFTkRFTkNJRVMgPSBob3N0LXps
aWIKKworIyBpZiB0b29sY2hhaW4gaXMgZm9yIG1pY3JvYmxhemVlbC14aWxpbngsIGFwcGx5IFhp
bGlueCBwYXRjaCBzZXQKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfSE9TVF9UT09MQ0hBSU5fQkFSRV9N
RVRBTF9BUkNIKSwibWljcm9ibGF6ZWVsLXhpbGlueCIpCitIT1NUX0JJTlVUSUxTX0JBUkVfTUVU
QUxfRVhUUkFfRE9XTkxPQURTID0gaHR0cHM6Ly9naXRodWIuY29tL1hpbGlueC9tZXRhLXhpbGlu
eC9hcmNoaXZlL3JlZnMvdGFncy94bG54LXJlbC12MjAyMy4xLnRhci5negorCitkZWZpbmUgSE9T
VF9CSU5VVElMU19CQVJFX01FVEFMX0VYVFJBQ1RfUEFUQ0hFUworICBta2RpciAtcCAkKEBEKS9w
YXRjaGVzCisgIHRhciAteGYgJChIT1NUX0JJTlVUSUxTX0JBUkVfTUVUQUxfRExfRElSKS94bG54
LXJlbC12MjAyMy4xLnRhci5neiBcCisgICAgICAtLXN0cmlwLWNvbXBvbmVudHM9NSBcCisgICAg
ICAtQyAkKEBEKS9wYXRjaGVzIFwKKyAgICAgIG1ldGEteGlsaW54LXhsbngtcmVsLXYyMDIzLjEv
bWV0YS1taWNyb2JsYXplL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMKK2VuZGVm
CitIT1NUX0JJTlVUSUxTX0JBUkVfTUVUQUxfUE9TVF9FWFRSQUNUX0hPT0tTICs9IEhPU1RfQklO
VVRJTFNfQkFSRV9NRVRBTF9FWFRSQUNUX1BBVENIRVMKKworZGVmaW5lIEhPU1RfQklOVVRJTFNf
QkFSRV9NRVRBTF9BUFBMWV9MT0NBTF9QQVRDSEVTCisJJChBUFBMWV9QQVRDSEVTKSAkKEBEKSAk
KEBEKS9wYXRjaGVzICoucGF0Y2g7CitlbmRlZgorSE9TVF9CSU5VVElMU19CQVJFX01FVEFMX1BP
U1RfUEFUQ0hfSE9PS1MgKz0gSE9TVF9CSU5VVElMU19CQVJFX01FVEFMX0FQUExZX0xPQ0FMX1BB
VENIRVMKK2VuZGlmICNpZmVxICgkKEJSMl9QQUNLQUdFX0hPU1RfVE9PTENIQUlOX0JBUkVfTUVU
QUxfQVJDSCksIm1pY3JvYmxhemVlbC14aWxpbngiKQorCisjIERvbid0IGJ1aWxkIGRvY3VtZW50
YXRpb24uIEl0IHRha2VzIHVwIGV4dHJhIHNwYWNlIC8gYnVpbGQgdGltZSwKKyMgYW5kIHNvbWV0
aW1lcyBuZWVkcyBzcGVjaWZpYyBtYWtlaW5mbyB2ZXJzaW9ucyB0byB3b3JrCitIT1NUX0JJTlVU
SUxTX0JBUkVfTUVUQUxfQ09ORl9FTlYgKz0gTUFLRUlORk89dHJ1ZQorSE9TVF9CSU5VVElMU19C
QVJFX01FVEFMX01BS0VfT1BUUyArPSBNQUtFSU5GTz10cnVlCitIT1NUX0JJTlVUSUxTX0JBUkVf
TUVUQUxfSU5TVEFMTF9PUFRTICs9IE1BS0VJTkZPPXRydWUgaW5zdGFsbAorCitIT1NUX0JJTlVU
SUxTX0JBUkVfTUVUQUxfQ09ORl9PUFRTID0gXAorCS0tdGFyZ2V0PSQoQlIyX1BBQ0tBR0VfSE9T
VF9UT09MQ0hBSU5fQkFSRV9NRVRBTF9BUkNIKS1lbGYgXAorCS0tZGlzYWJsZS1ncHJvZiBcCisJ
LS1kaXNhYmxlLXNoYXJlZCBcCisJLS1lbmFibGUtbHRvIFwKKwktLWVuYWJsZS1zdGF0aWMgXAor
CS0tZGlzYWJsZS1pbml0ZmluaS1hcnJheSBcCisJLS1kaXNhYmxlLW11bHRpbGliIFwKKwktLWRp
c2FibGUtd2Vycm9yCisKKyQoZXZhbCAkKGhvc3QtYXV0b3Rvb2xzLXBhY2thZ2UpKQotLSAKMi4y
NS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
