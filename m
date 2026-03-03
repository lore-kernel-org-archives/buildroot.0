Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84162EC145C
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 14:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30D1D60C1E;
	Tue,  3 Mar 2026 14:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCNp5vZoYTD9; Tue,  3 Mar 2026 14:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FDF360E10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772548211;
	bh=xNmsQGJKSLNvqlPS01OFntIy2tgq33mhsdZwtkQOIEg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=jO5A1oLSflk/pt2B8RF+ouwRkpqdjo+o/aoS5WdrFUKJCBPIvUHQMV8Bw2MIAJz8L
	 xPpkBk/xZ6/hr9XQGl+uMvxqhy/LUKL/GO6wf9aLvcjx6Si6wJ7X/vMqX/xFVG0+Bb
	 uLMRDicasTl2///8NiikLWJONOQbT6Oofcmd+aDKcg736X+8S4r+LHd97zgYohCMXa
	 moU6Rbs5ZGywfkmWalEdsP4pamLaKTDAnt2F6ShsOdmpj2F3KHEzUz7igDNXeWtpqq
	 JCI5Frmgk4KK+4LPHVmK3ziGx5YRUWsSflKvm3s+DmZxT/hse8D/ibEGVCeRpd8zs2
	 Cmoxysi60sPdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FDF360E10;
	Tue,  3 Mar 2026 14:30:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 327521EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 14:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17A8F40CDE
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 14:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XlbAeMTRFJKv for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 14:30:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c213::2;
 helo=zrzp278cu001.outbound.protection.outlook.com;
 envelope-from=martin.bachmann@designwerk.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C45D40CDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C45D40CDC
Received: from ZRZP278CU001.outbound.protection.outlook.com
 (mail-switzerlandnorthazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c213::2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C45D40CDC
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 14:30:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvDALGUcymRUaEAyD+/UsQTBUIDpcHMoR+LHWhw3B8hHFPauqcS/pdb3aduYsM39iy7dt55bOJdnDLiAsUaq8L7oobFfAtmEyoLP1DVXNbq29pJpVuG6+FerIZev1zzFmaiDUCnWFwExkpX03ynPUlHyIekSiQY1LNNKySDmxkHgEbyegfA8DTacmgKJTkFtnmmh8j6FM6zA7HiTA+KiaPSQkN+/fbS/gBeQallmic4kxiq1CaRSQwvmKlIOdJa/RThtrLYZXsS010cO3+LHr7L8eQ3846SsxBr8mFvSyneYEVlF56TpsUfca8eTHicPseepEOGcbQgLHFhtmWrgUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OPUfujpvmsdj5u8uG4WSjZnx4koT0hP3RabGCKIHvI=;
 b=MIJq0ntIRXJ3eK8SBkq4RYv/54liqhgvQypgKYojs1sz+5sULNsAV/SmzHLjoX89Q+6A3omaTTILwcVOaRIEsHT+GWCJbH/JUOUBHvu/EbkqgISHgwJ2uPXu2yOSaQ6AaRefhdHZ+xmJuSZbD4ZRdxV9HwDD7n2onKdsOtJEVD8IULJIlZ9fWTKmfMQW1n991y8AXI+FOQPS3xKbtZt8mV5t2SKnMXSqAH3SZyNz3wcxTJNXFTwzYDHX0cwnMpDCe0zRiFikEo2ONwpGvYKDYgFcKT2/KBzHY5bVoid8ptmHRevUyKzjO3PIjgQu5n2oacvUMCvoyCe6xuuJs4sgHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=designwerk.com; dmarc=pass action=none
 header.from=designwerk.com; dkim=pass header.d=designwerk.com; arc=none
Received: from GVAP278MB0882.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:56::14)
 by ZR0P278MB1295.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:80::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 14:29:58 +0000
Received: from GVAP278MB0882.CHEP278.PROD.OUTLOOK.COM
 ([fe80::afc0:e495:617:f18c]) by GVAP278MB0882.CHEP278.PROD.OUTLOOK.COM
 ([fe80::afc0:e495:617:f18c%3]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 14:29:57 +0000
To: Martin Bachmann via buildroot <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/1] package/python-scikit-build-core: new host package
Thread-Index: AdyrGd1YiVoah8LiSpe4yCuassg22w==
Date: Tue, 3 Mar 2026 14:29:57 +0000
Message-ID: <GVAP278MB088272A4BA8DF81A21B7F6BB8B7FA@GVAP278MB0882.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_ActionId=ff65dc09-7467-4b76-ab3f-232f352c8514;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_ContentBits=0;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Enabled=true;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Method=Standard;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Name=defa4170-0d19-0005-0004-bc88714345d2;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_SetDate=2026-03-03T13:55:22Z;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_SiteId=5f12add6-5f96-40e3-ac41-2307f36545c9;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Tag=10, 3, 0, 1;
x-codetwoprocessed: true
x-codetwo-clientsignature-inserted: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVAP278MB0882:EE_|ZR0P278MB1295:EE_
x-ms-office365-filtering-correlation-id: ce4651c8-73a1-408d-095e-08de7931587d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|13003099007|7142099003; 
x-microsoft-antispam-message-info: umU+AxBGW4W4kDcowKZUqaAU7TQAAvzvWckp28mgqE0NxYSTZ71Cxro8rrKQkCsHLZu7UlEHHSAcHsaMNvgagIgLJ6E4AUTtC4uZycGZFmSOv1cJKeJdOR3B1yGLmj1jQZrUeP09b+bo5SCbZJy9rs72C7neUzixYNDERIJpHQ6S9VBGCqnH8tPE8iiTWXavlG8+9h8seh6cZ2Vm0RRYluQyFHHVCFC8uiX0aUaRO/uQUdHZapgyPToyWc6zPR/7QDwtEnxouTKdFKdHgAZt+zA2jBOrh26nS3XTRIguSFhjK+SkAjtkIYh7xkHN23WWqtJVtXDISmN+uIqhiG1SGH9CgvShRR2biAumCwqFzdibZuHrIcXq+3E6Gx26UPHbunWSr30vqSxeXWg7rswgp2fmgoitcsKbQ9SiAJJBDLTH07d8QZ23a1uvOkpx4zEPqAc1nhCTiw8Lh36rnA6qVf7eurHPHFjBKuRqFgfE+qgZdlcY3uksRBrbHYJdn/27UcNAMGY1k7rAA5rjgRQ5JtLug6A/x1usLHXleEEC8enfkGozuPcXRmZW/F466HYiSn3iHGuobTqfA3825up7fpFEtJ6AsYMHngc5b1RBxiJeHWOtkZmtkmjuMRGl4g8qSJpu9et2U+zX7P4gPXikDUIV1qIG7tdF6l1sEaIGIbXuAizy+Ga8CGJ10WKInLYZuO1gPsEAqM4JJysf5pQ3UDjjsGLeG7f+AFlicsV3g/sDT2J/xaMKENZJbLk/4IKn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVAP278MB0882.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(13003099007)(7142099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?48S8j7nNT/hG8r5cfeUAyQQRYJ8SRhZ3UvNzuHrfDnF8hwvCLAE9fPii8s3O?=
 =?us-ascii?Q?ixwbYlS4poF7rEnpbel5Hhs7BUmbt2uWuy8etRmQ8ta6LzT4N7pZOmwZwQyh?=
 =?us-ascii?Q?kV5NVJIrVtT1OnOhAhJ2fAkwe/2IpAUltZrT7rUjgtc3x2grioiKtP3trJnk?=
 =?us-ascii?Q?thqfOv/DU5An5MVstvZd9Q7fNOen06/j2wlgeJ6L8eU0EIN1X45qh3b3LGHl?=
 =?us-ascii?Q?foRAvXFHrHuCUHFqBdPHUketxcj6f1pYQ8VaL8BT4YxLwNNnhOZGFhkGSTma?=
 =?us-ascii?Q?gqzH9S38P2LPVDAS5UqPLq7CBFIZEVoxFHEelEGReJrYrJBy36zRzPSAJWOd?=
 =?us-ascii?Q?ZE+Cp5+PQvvYEELpMjtNJTR13JCm8pDU2uVlwFJ5mYpUiwaFi1gVRPdeWedO?=
 =?us-ascii?Q?qFc/qTFcec6PEH/kyFUYqvZBYutjRJl4y09wHTuJhIXABap80TekI5Di2ZLC?=
 =?us-ascii?Q?EpLH2On/1KpRRnT4379u0h4/52MZmWyc/eTMbH0isBBCxIU/wCpZBc1aBFek?=
 =?us-ascii?Q?/O77n+xqDgxkzwLuqfFA8kAukMnVmhO3XaR5LEabBGKDxLgTiu2ehqi7jZHm?=
 =?us-ascii?Q?s0HHNFZ1mvXEk+YbS3cVbZg/elIVW3z5L9fSg2GUGeCAOa+6g3JW/U0+slcF?=
 =?us-ascii?Q?MgK2N6Cmzop/An4S9Evr/ZTJPBu0v7bfCcbczLet9RvnBYYvuvfAg3oSwCsH?=
 =?us-ascii?Q?BV6jkms8embcVPJtT+HMyTFTdLpQLwp4HR97cJOBHih9f+ftD4QNZwPi5Y9t?=
 =?us-ascii?Q?0gSHEVrzVeUikvZlfsEBEoZBMxvt8GnSnYITKRJ2siRbJg0Frr3sNY3CM3FC?=
 =?us-ascii?Q?zplxoJ/58V8Fc21bclsp09L0vPXjq5TdjvUMMOV27sRb1yutPf8NtB+yL2g/?=
 =?us-ascii?Q?34e58uOLMScpsdrL9Fr7qkDYH+P8Ack4eCJFLMEQZlmjouBBq9f4VPVhjPha?=
 =?us-ascii?Q?SniCuUKmEQfG2lmzucPP953ra4jyERJbKwemrqa0D6uKzh/YagHsEbKbCOmR?=
 =?us-ascii?Q?hSqPcFboARVQkY9ZFtx9gslXiHPa23gOLejRVBVt1HUC42VOu4klNJHEPaCD?=
 =?us-ascii?Q?Hwr+XkDTRkxczsHsyO77JTD9LXBq6qPHxIYwukZc0tiLJjXo3x2xUAH35QMI?=
 =?us-ascii?Q?aweTSAmcAECZiMKiZdlJmxxBYPpq1mRBaBuzOTJnkiulBomR1eJ07xukgnHp?=
 =?us-ascii?Q?5VQVIaZOL7Be1V+0Pnxat35gZGB5TJihV9Yd/V6VoOM6aBblfiLIpyFgSOEV?=
 =?us-ascii?Q?SILFYmAQL7gtkwbXN0sj32CdkLF4yVy+RCUnpSA0Iw2dmP2HXjR+LcUynkfX?=
 =?us-ascii?Q?cIFP3X9JHlVB4gof+LGJgePhLZTsr7UyixAa7hOde2kWSsVjHI39RiQ/GuoJ?=
 =?us-ascii?Q?aYWURBDLkR6/YdwXm/ifRNZiMyzwjWeGiWr1P20iTiILHwaYr4p0rIofbwg1?=
 =?us-ascii?Q?am+o6jDTzcgHmv7C+QZ8Y+0uEjZDS9e467ODRGXsbfp2X1igD1qB+4nwnMta?=
 =?us-ascii?Q?azb9U7XaTcjCs96Lg2ixu/eJsPZrmRq3NZcVhEawsaEUXH3SaiR6I5dSJs/2?=
 =?us-ascii?Q?4N/B4ZvIkCT8TFWeLQM2GKmeGkJb6YAJXV2yXktgNVQiZhxp2ebi9VrVqVOH?=
 =?us-ascii?Q?smRmmzQw+4TlaNVAPdPI5dHydrHk7LkSi6WoGl3OHdpq/EiXCYN4KS75PEcx?=
 =?us-ascii?Q?NHeq0oEHMd2tRXUNqmPi+ttqaPqOGxa3wXY28Y9at8BqItUFYQuKHeNktEQB?=
 =?us-ascii?Q?qv+K5qtxLE1H36i3oiC2QO/E704W7QA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: designwerk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVAP278MB0882.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4651c8-73a1-408d-095e-08de7931587d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 14:29:57.7827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f12add6-5f96-40e3-ac41-2307f36545c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xAy8uOWnz8mV6Tu9q+m6kPnxZ2+1a7g0MQSiRjhtLL3j8y2f5D4/lFhV9152ogLCBlE/9ssdOgzR3zc8AcdnEdpYnCnrUUCglNiXZoqmu7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1295
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=designwerk.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OPUfujpvmsdj5u8uG4WSjZnx4koT0hP3RabGCKIHvI=;
 b=emMSxU5FCi5IpZwuVCcbpbTQMVKtrpAfWYsBu7Kcm9Qnfo28Sm87bVLUuHlJ2HvzkddIiQxH4qJhFWqjKe3kFqamnWibRexMi2GILLPUbYRkXe7Yv6I6rIGpwBjc8arFIUUzAoipXo2FDfrCIbeNS5m2YNze0ct/5gJyQYZV2yM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=designwerk.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=designwerk.com header.i=@designwerk.com
 header.a=rsa-sha256 header.s=selector1 header.b=emMSxU5F
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=designwerk.com;
Subject: [Buildroot] [PATCH v1 1/1] package/python-scikit-build-core: new
 host package
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
From: Martin Bachmann via buildroot <buildroot@buildroot.org>
Reply-To: Martin Bachmann <martin.bachmann@designwerk.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a next-generation Python build backend for CMake, providing
a PEP 517 compatible interface. It is designed to replace the
legacy scikit-build and does not require setuptools.

This package is required as a host-dependency for building
python-pyzmq v27.1.0+ and will be needed for upcoming versions
of opencv-python and pybind11.

https://github.com/scikit-build/scikit-build-core

Signed-off-by: Martin Bachmann <martin.bachmann@designwerk.com>
---
 package/Config.in.host                                    | 1 +
 package/python-scikit-build-core/Config.in.host           | 6 ++++++
 .../python-scikit-build-core.hash                         | 5 +++++
 .../python-scikit-build-core/python-scikit-build-core.mk  | 8 ++++++++
 4 files changed, 20 insertions(+)
 create mode 100644 package/python-scikit-build-core/Config.in.host
 create mode 100644 package/python-scikit-build-core/python-scikit-build-core.hash
 create mode 100644 package/python-scikit-build-core/python-scikit-build-core.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 2160a0f558..c4ece91e09 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -88,6 +88,7 @@ menu "Host utilities"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
 	source "package/python-cython/Config.in.host"
+	source "package/python-scikit-build-core/Config.in.host"
 	source "package/python-greenlet/Config.in.host"
 	source "package/python-iniparse/Config.in.host"
 	source "package/python-kflash/Config.in.host"
diff --git a/package/python-scikit-build-core/Config.in.host b/package/python-scikit-build-core/Config.in.host
new file mode 100644
index 0000000000..3cd75d1532
--- /dev/null
+++ b/package/python-scikit-build-core/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_PYTHON_SCIKIT_BUILD_CORE
+    bool "host python-scikit-build-core"
+    help
+        A next-generation Python build backend for CMake.
+
+        https://github.com/scikit-build/scikit-build-core
diff --git a/package/python-scikit-build-core/python-scikit-build-core.hash b/package/python-scikit-build-core/python-scikit-build-core.hash
new file mode 100644
index 0000000000..9633af0162
--- /dev/null
+++ b/package/python-scikit-build-core/python-scikit-build-core.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/project/scikit-build-core/0.12.1
+md5  278029173f310ef79a5e9a43d8a645cc  scikit_build_core-0.12.1.tar.gz
+sha256  bb663e71116bcd23d208ef30e5b94aa14f225f3704794d9429017ea9b461b0da  scikit_build_core-0.12.1.tar.gz
+# Locally computed sha256 checksums
+sha256  203fb4d261f202242333928424e101de19abf5bf166620124418fb6dd6b279b5  LICENSE
diff --git a/package/python-scikit-build-core/python-scikit-build-core.mk b/package/python-scikit-build-core/python-scikit-build-core.mk
new file mode 100644
index 0000000000..86f8d351d4
--- /dev/null
+++ b/package/python-scikit-build-core/python-scikit-build-core.mk
@@ -0,0 +1,8 @@
+PYTHON_SCIKIT_BUILD_CORE_VERSION = 0.12.1
+PYTHON_SCIKIT_BUILD_CORE_SOURCE = scikit_build_core-$(PYTHON_SCIKIT_BUILD_CORE_VERSION).tar.gz
+PYTHON_SCIKIT_BUILD_CORE_SITE = https://files.pythonhosted.org/packages/ed/15/9045d60554e2efe07baf66974f96862e3aa237ecd6bf6ce5ef4c71f883cb
+PYTHON_SCIKIT_BUILD_CORE_SETUP_TYPE = flit
+PYTHON_SCIKIT_BUILD_CORE_LICENSE = Apache-2.0
+PYTHON_SCIKIT_BUILD_CORE_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
