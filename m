Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE73C00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 09:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6A8940591;
	Thu, 19 Jan 2023 09:50:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6A8940591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IYmlbQXSQKjE; Thu, 19 Jan 2023 09:50:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4A3A40222;
	Thu, 19 Jan 2023 09:50:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4A3A40222
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC51D1BF95F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9581B40222
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:50:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9581B40222
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B4PSeYr4YqhT for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 09:50:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76FDD400F2
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2052.outbound.protection.outlook.com [40.107.6.52])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76FDD400F2
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 09:50:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eb+ugqAp9KNJfuGQa5mVwkIjlcEmI3cDsKV6yjU635LHyvaGqYy3xwhN3YR57YVSFXgbCqdsVw5rFSrA8uwuxmdOmg8/qDZlXTSpyZ9q3OaGOpDWwg0pkHizdMzk/xX84gRBF63lFTFN8mTcTWMDr6dabRD+eS1apvDr91y7onyxCeJ4PUvyBPw4hzWV2CVvqEuonBFHbL7SBXlACxFeSZGaga36YEzp0VpZaGitURcBB19z98p2SnvSLGVDPSbYkUxioIwiAr+ZYcw8JdKOUNchsmaUofNJm6o680AU0SUGJHxlE9CbrXgwihB02Rd1Q0niZYBJZh1ynsCdivMRpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5w9fhJAOELbMc3ijWXhz95MEN8U/mbPZUbc4aRUS6E=;
 b=F0OsKSuuz3NERr6icD8rWoavR0AT7KS8Qn53JUUkDgWi7fiNjS3Ayten6Mr80X7oePAbYbkJI64sECPnqp/EDOHzfeaJ1qo5ZRbbsDIKnzddLZb/2Fht15EgcR3VQNg2ovqGNC1SsfehOSEpDN4whAnvWAggdqxTZWDfq65dE064NieXiUg33J0x86/nsJKgcMT5RA4n2LkIvEtP3XRMU4WKgAX6AsYZBTIC/Q4Q/3leX/Kn4LeCVycXUwtXWxvUZCU4QNZQyzmsT7KraXvxu3FMORl2ghh0LX6qnrdmogUkUgSN1epgygkzOxdQjOf8HDj/0gHj7cAAh/BXmMAthg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AS8P190MB1936.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:521::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 09:50:46 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 09:50:46 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 04/45] package/cantarell: switch to https download
Thread-Index: AQHZK+ox+jCu3gWJfEW7eQ8bhYjH/g==
Date: Thu, 19 Jan 2023 09:50:46 +0000
Message-ID: <VI1P190MB0493BBB9E1697F2FB337485B9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AS8P190MB1936:EE_
x-ms-office365-filtering-correlation-id: 01fabcde-273d-4e05-0548-08dafa02a36b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tvOA62WkDUSBQgcnjWd1vN3eY0oZOlMSVq+PytrLyNlD3ZDhFTHpR5fiLOZW1i9TgGqeucSsMcKHpHBPo73PbQWjz3VWZraFa0nsZn0VBAs3dYwJbBvzuI2ulTJH8/n/Sq3xeQCK286jpoFRdeIatgoLqv9eyjjUrb8qQrECO9GCPCmW0bHE/tL82XfM3v1e4ohzlC7ahW0NaqQtTt35R9W1gIvmBGYI/jeELSnafgCY5+UP0YNR+oQOS0BlOaMATKXcMPfVD41fHBELzY/mKMRfJHvfGhCXWJIfiv9P3qqSGGVzZOWoRt3B7lfhX0eZVX7XhxMtvqmvzgqIhgne7pdcWyuEj8zixPvUvMCjXr+1wKD795R0PbBcnZM+jnvy2qNoR5rFJVQtGOHD2lpPOPykazHmbEgPaYtHZSBxkyT7SAOnMw5iV0bb/ANYJoPU7zcxX2HdcFmnpAd40S+GItVIqMFA2xkWmtx2dikHnX+IysPczumvqoN1dMYFLKsUrNUqPFeZ31F78asyIzPFmwZMdDtnXr49d2X1Vej6x1F7lrBxaQnKHeSF6Fnnpcef/drEC++5gr1PLaZG7LFJ2AYruMWWeXVrVScKSiq7Cwl6/9/RYimF1IdqviuzYngbdtvKzYll6Nq5EG0dEkpx7QuQLr01IqhAtGXGEaTQYf+iOVjrDSkZ840YsAuuylIldDv3D4cAtbROEJc7uO1bqGoRXm+uJvtDYBB8qGaj2bQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:es; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(376002)(396003)(346002)(136003)(366004)(451199015)(86362001)(83380400001)(33656002)(186003)(966005)(9686003)(71200400001)(7696005)(55016003)(478600001)(38070700005)(38100700002)(8936002)(66946007)(122000001)(6506007)(26005)(52536014)(2906002)(64756008)(6916009)(66446008)(76116006)(66476007)(8676002)(66556008)(316002)(41300700001)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jNQmutOSVtVEBTLAZX5aALkAZn4/zWMBN4IqJT2V0c1z9R7mZjUud8UiCu?=
 =?iso-8859-1?Q?TAb/1iea3CErqLnyNR+1i1Zic7B83pdcI37vz6omHZEL1xdRf7aUFZLM1w?=
 =?iso-8859-1?Q?cjS6ZNs34PEWvB0/xUNgxtXCYIjmvbdvlOHSP1s4iABS0+kRkg36ydo0L/?=
 =?iso-8859-1?Q?ewaEUIBKcIwXq08VkrDyeqCIRkCKL9ePFYJiqv4OG992znimBxdQXVvgHm?=
 =?iso-8859-1?Q?Bp1WjIugs51ZmCU1TwDEgBck75MQeFr65GdHT5zHJAubDc3loiOvVxMUHH?=
 =?iso-8859-1?Q?ZRzdzysdCWMYDYX57X798pK/Uk055lMsJ+U9ORQmiG1a96BsL8feiaxi8T?=
 =?iso-8859-1?Q?ft7flvn6hS/tsjvJcml/wmXsqywiX1tCpWJifNaGCNTUK0u+Xovz5jd5vr?=
 =?iso-8859-1?Q?K7EfLub0KGaVv4H94dfhN3zGt630A1AAJSo4BvEX+8/PIxf1RWCNJZapzg?=
 =?iso-8859-1?Q?AN9dsdm1zLxTopM46wr5VqsgTrElauzjjV2dOoRoXTPxC8Aw0PV5Xoa8Gj?=
 =?iso-8859-1?Q?lRtFVIAquTydXu2H3sYHufYL/Wba6fQ8a2HZTRYEiXefqiI1VlmiI3IljL?=
 =?iso-8859-1?Q?mf7IojF6KbLkigC7gWQN6tbQDtGCe46Z2/uBmSWh/MXJoAOLEc0cToGRVN?=
 =?iso-8859-1?Q?QOybauPpdAGDprGYxkh6ndw1kMEq7GT9/8Eu3iuNDVfZMa0YshO6FLBK23?=
 =?iso-8859-1?Q?lFGnaSOhwEYfLfwnq/YnblyBCxwEoN83faW6cvCJ0cn8a8zllnEmATAwSV?=
 =?iso-8859-1?Q?oGT9iVgjplxYujjVFD5bIE+x4oL5XqQS3pifa7uy+EkEcx8/qoby+aY0rw?=
 =?iso-8859-1?Q?/ecUXWbN4VNrB8xfISBNg25Jq+EouQ500QmDmV8Db4sJ1g3TRiF8zfgUp7?=
 =?iso-8859-1?Q?w+GSSoH7z4J3PJl/b4Yu1Z6JIRvbYaWyQB8tYYtG0b1ao6Egv16WzV9oRk?=
 =?iso-8859-1?Q?jeh1Jn+og1hNnxuowgQVA3Sq/JmrWltHnmFIfsi9lHv6sE4YtKWVETin25?=
 =?iso-8859-1?Q?kVuGpF7USAdjrKRYGCznAjkLlIK5Dl7QeRU6qe7+jqTJMmEudsU12LdSUW?=
 =?iso-8859-1?Q?mE2say0lHa4/PCHZV6P/C2LHCc981wkk4pU8uWMknN9Qf+JZO7XMZ7NePC?=
 =?iso-8859-1?Q?W7LON56h1YY9N8BnPnBOuikLmx/35/yaHy/tbwscUdXsQv8vSHeKX1wvKX?=
 =?iso-8859-1?Q?0IQu2T7YYJ7etICgXZPCgnoHNN+bu0rlS7FaVw3m0AFGB5iPU6h4oHcILI?=
 =?iso-8859-1?Q?n8pHNK2ag4fLBJm3KFMD4D5raxR2tas/baXdquBOx7uxc6iL5srDjU6AsJ?=
 =?iso-8859-1?Q?s+OU+NoxiWH65mHepVfcqW3CvyIfyIua5LeR2O79vFsCuIvs9onBriHDZh?=
 =?iso-8859-1?Q?XoWZngtMQA2lhQm0AoLRNRrrKXN4bgxqG5bmfVGUiEljbQDxs8bR0fhz9M?=
 =?iso-8859-1?Q?unPCRMvc2hlnnkTZUQm1nDYOzrrDoHNgbwEatyvPYkxq7QuW4wkeLhYmp7?=
 =?iso-8859-1?Q?YAMWRnZVDqqXcA+F2TKLgOL9mO6pT/4qG1GQAB76M7J0twAGRUad4bIOOg?=
 =?iso-8859-1?Q?wNC8HxNsNrNs48+XXuzqZ65cOMrdWaKzNJuYpm0slZFicynAf6HJPBASrA?=
 =?iso-8859-1?Q?9q/38HNDkOKPM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 01fabcde-273d-4e05-0548-08dafa02a36b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 09:50:46.4453 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qkbcSEX/iEdgoZYAeeV7IbnS+dOTruu948xkBbMxXsG0uuR3H8a9n01SL7I1I2F7dUaS2mlTZBeHbTqVWGtJFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P190MB1936
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5w9fhJAOELbMc3ijWXhz95MEN8U/mbPZUbc4aRUS6E=;
 b=g/tDxRAbzEUzQYPTytaA4BNEjYYW2ae64c6TOqkFVkQd8gbPJ3RkGsgDyakfQisYu0AgqxzPZa0ZpS0MNHlJaciEGbfm2VvatM4/57RxNSmnWLXOKdKeWbwXJQvcH4TWx5IMvOmL5zJLRtThaqUQP/swq+7yjL6EEX07Cjeq06E=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=g/tDxRAb
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 04/45] package/cantarell: switch to https
 download
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/cantarell/cantarell.hash | 2 +-
 package/cantarell/cantarell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cantarell/cantarell.hash b/package/cantarell/cantarell.hash
index 49b4634063..18e0fc2cfa 100644
--- a/package/cantarell/cantarell.hash
+++ b/package/cantarell/cantarell.hash
@@ -1,4 +1,4 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/cantarell-fonts/0.0/cantarell-fonts-0.0.25.sha256sum
+# From https://download.gnome.org/sources/cantarell-fonts/0.0/cantarell-fonts-0.0.25.sha256sum
 sha256  14a228aa0b516dfc367b434a850f955a00c57fc549cbb05348e2b150196a737f  cantarell-fonts-0.0.25.tar.xz
 # locally computed
 sha256  79a9d6198c0d9192c1b0bf55bcbc404a39390bd0d8c650cf20d652c2eaa284d8  COPYING
diff --git a/package/cantarell/cantarell.mk b/package/cantarell/cantarell.mk
index 2769b35c1f..59e65b25c1 100644
--- a/package/cantarell/cantarell.mk
+++ b/package/cantarell/cantarell.mk
@@ -6,7 +6,7 @@
 
 CANTARELL_VERSION_MAJOR = 0.0
 CANTARELL_VERSION = $(CANTARELL_VERSION_MAJOR).25
-CANTARELL_SITE = http://ftp.gnome.org/pub/gnome/sources/cantarell-fonts/$(CANTARELL_VERSION_MAJOR)
+CANTARELL_SITE = https://download.gnome.org/sources/cantarell-fonts/$(CANTARELL_VERSION_MAJOR)
 CANTARELL_SOURCE = cantarell-fonts-$(CANTARELL_VERSION).tar.xz
 CANTARELL_DEPENDENCIES = host-pkgconf
 CANTARELL_LICENSE = OFL-1.1
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
