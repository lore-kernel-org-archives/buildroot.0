Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367E1C04A95
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 06:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8CFF8129D;
	Tue, 25 Oct 2022 06:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8CFF8129D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kOXvRwMVyfp4; Tue, 25 Oct 2022 06:04:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EED6981253;
	Tue, 25 Oct 2022 06:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EED6981253
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 637DD1BF329
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E8F560ABB
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E8F560ABB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9TtUMLsR4nyy for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 06:04:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 266C4605B0
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2054.outbound.protection.outlook.com [40.107.103.54])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 266C4605B0
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 06:04:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGX/14g4tU16JLvDUU0Smb3kB3O5xmo4I74Ulysd+r3xgla2TKOwyMhGaR/wY1OjHyKjMgn74wG/YBx3QLjw7Nuuam80AlXY7PNmyJoaCXyjNzhrLftFZr6SB+6Py9nNydm5kWhrqgUrN00EB0Byxn8/saAPHm2WbxMb8tMXkA48zhiGVNzf3/JnsfTXigGvyIx8de5KVcD3YINd7BMM59xIcYmNYTTnybFn0LGocTQUcPVyhagvUPd8RFKrc3xOiYjZlF6j+BcxSrlDYQx1EYxJf6k+8x0RXt5UjNV8bVxqi8f51SwWh4d75qsIc9XtyGQEdaDTSPGGQuFzf7MDkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SN2PzHMOvc5KLm864/3+foUYefCD68GBj3P9zKlxFDc=;
 b=OpYD3NBomC8FlLiS1ufpirj9fY2jj+BqI24x9gVJbnGKB1mbMnWMVbvAEQ+HQBkb73gJJVeOEHb2gaK+B1Dgu90BBNxbIWBrQCYzkqKXVcKzzYTVdxe8IvkRgGVI3esZJIhPyUAOurZHAEf0oQy5MidXcPzGftinnVipcDj9r2OBl/K3wN2uxxdWwnDvSC+EUWhkYjDZvaFpEQ9VXOPaXCwGJdQqdTz8Dv5HRRCNIwGUgEF5eEwmqkeDBaIwAGfEr/fGFodKKNF81mvho2eFwWno7P/WSVuvGSM5M7bBgaJHxeojDKDsYiTIFtyLVekGdFFzYpuzAyrrPIateuZV+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB9P190MB1793.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:33d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Tue, 25 Oct
 2022 06:04:05 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1%7]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 06:04:05 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 02/11] package/llvm: move to llvm-project folder
Thread-Index: AQHY6DchO7frU9smiEWtrKOXRQ9z9Q==
Date: Tue, 25 Oct 2022 06:04:05 +0000
Message-ID: <VI1P190MB0493B8352071CFBCAC9B508D9F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB9P190MB1793:EE_
x-ms-office365-filtering-correlation-id: a940cd13-4350-4468-2deb-08dab64eb8db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vy0SN5IFf4/QyaqBf1DqEreiufb8cYShDEqYoRCacxXRCAEbgNZ+pLMf+gs2EXj67cndSUW52Dfm7yDqARo0Uyy19WSIRwzI2NLLEdEOjrjsLdmww4MUGf8pfTzRhn6qsfDHUdeZkCD+BibusC1V9lertaNMXDTFV4RMgUl889tr7Ymvp6xitodaYPy+Ccc8EX6Vx2vbSjCFFiSttJXibyGRxOcns36e7fZUsCH7eDYvDNzpe+dUi0i5zfKYzWF1szciZbEhOgpGh/Afthwfk6pYWF8znXoJF+DIA4srIge2g7caHgIqV7rc+qrsgwaSvoyNoa9tFkCbABcWExOwFfOxKDnB//0Hjmn3zBHqWLKAOWIQ3SSGTDQ1nUlBILeiQc0l2nDNlaRtR06htjf0fHfV3g1VdGxl8IMYiJU5bZZeEO6SqBMCgN6WJRZfgdhEk2e0dM+kqneY3q/PTqFIJmnqLRPzvDCoib0bkWiSsAAuMO+vvV44nDXdf1YYXwm9UxCilc+n3JSUNIxAvNJ7hx1X0tMRSXmgDfDLNhtOA5CqtTnpfjWwTRjrSGilCuVUrYoY7BXGi8SG39qbFqCkTOQ7BBjbXT9icmzkXv1Y9AZH7FD8O1jJSnRu0PCL3n+ZLRWNsPDZDgqleupQmOA8g0kxdGFNcnunUbtXOXbXCSQEpab8KzSeWnGzICgUArFQwCZ5+YeXtrTdXOg7JD5BH11bEiB3vmTeejHxQ8BGuhFfsJPH+7C4R0K/89ztTa0kmiZq4aq24B83Wf9jDUn5OUcOio4yROEZHFV0ppMPhd8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(136003)(346002)(396003)(39840400004)(451199015)(52536014)(55016003)(38100700002)(122000001)(83380400001)(186003)(66446008)(33656002)(8936002)(4326008)(76116006)(2906002)(66556008)(66476007)(66946007)(64756008)(8676002)(6916009)(5660300002)(54906003)(41300700001)(86362001)(316002)(6506007)(71200400001)(7696005)(26005)(9686003)(38070700005)(478600001)(966005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?RyBLNpPJ4fB8400KKnUEAiRfaUmLxyQ2U9qZ2fxJ9dLZgVtiEggEK1QWoj?=
 =?iso-8859-1?Q?1PZC8WFxEI4w6uo9WY2tSC1WkllAaUR2N7eH5pNL/m/vTGvAWstAZXfU4P?=
 =?iso-8859-1?Q?XvUwO0RP3K01/OQV4XF2HvObLfXENE3FMU1+EYpjoSaJ6e6xf75IwjOnO4?=
 =?iso-8859-1?Q?e6d2awDpAyyqf6TR3k7QYE56BVfLMhpBUs7mc03fElLvE16/0uIwh51dec?=
 =?iso-8859-1?Q?7W9wFR6Kf0U+TrwzO85ypeX51duTdydAG7F3QEN7omImC/v1yuKz12EuGI?=
 =?iso-8859-1?Q?nvYNoAHYLN2NJQOE7LrqrwKGOdDQwqEw0E4O8fz9om4HZdhHrYQnuZGEGS?=
 =?iso-8859-1?Q?490/jIAPsv9BpcJHEU2uUVUlbnkOREOZ/P3O4260Uawa6ooR5/WSQQ8M7F?=
 =?iso-8859-1?Q?3+VVTDNQ7uCBvgv8AnDTGot77UZXHUOGQHkG5soqZ2urKtW3TZgBAViP2V?=
 =?iso-8859-1?Q?KKud3ev2/hi3nYdgmLiIVLLMSWtYWEfqA9gtt0QqdBi/HOf8Sl84INezmZ?=
 =?iso-8859-1?Q?iiJ2puX97axMC5OMXC11bWWfGselnB0NGzD2z8sR3A/T8IztMct4K2m/20?=
 =?iso-8859-1?Q?wKEPwgrV331qpJtoVRKgRFxiQ9rHvdsVGA2F7KraBxJDNve5nGOh+Kvjd+?=
 =?iso-8859-1?Q?ZN4mKxiyzbyUa6wIGw9Idozac2DNy4TYiDSvVUW73wUlJ3xbm+oIUIbvCA?=
 =?iso-8859-1?Q?JiS3DME1b5+86FnWMQ3vowQkIRQVE6Qyshiza613WlGTMbwAMQ78eERn+A?=
 =?iso-8859-1?Q?T5S73HOD+S6jxuS70WP3qJXZzWyKdQ8cnAg+DLPJPI2HocIfJYbwtFS/wG?=
 =?iso-8859-1?Q?PaiHch/wG4QEodIfU3YEOs/pUkoLLreNmJ51/T7HJtMxQtPObUMyPY+p21?=
 =?iso-8859-1?Q?2KGYzpQFML2WNwTIh43weAHtbCc3Sl+LalhUka3DzIB6wCu/758qkMZha9?=
 =?iso-8859-1?Q?/ml1572DDa2jxT53/hQDAUbkEFKo9PrtoRmxCMhlbROAK9p3X9S3nqbAd3?=
 =?iso-8859-1?Q?YWyK0RRde8wJ7MCsk2Ka8+XLQ1SOiVs6pAX9GQatWl2NuPtB+pJRhjInyf?=
 =?iso-8859-1?Q?l6VaEjoZiVK07RxBMok68qLdSuBm1+tSyWbyMkGqG0AiA9kBKgfbzVjt2k?=
 =?iso-8859-1?Q?4dCgMGxib+p25dExBqs8fLL+o5W17wgOLes/xEC4H5+f/EtpA//OfpWmrF?=
 =?iso-8859-1?Q?JfB6auEVPczK5OY+lBX8+dlsF93qQPA/REiN57Cp6wdbqIHLg/JB5Zbfss?=
 =?iso-8859-1?Q?BGdOm3K7r5ccSDdCj+7EzkX8OmqFuJnlAniP4ClHyT2J6Zkuwl1D3hWf9b?=
 =?iso-8859-1?Q?9tYfqlYXLeyaE9V+FyGjeJweRNG0L1Igi2dCm6R2S8CGiTh1UGY+EGCaob?=
 =?iso-8859-1?Q?7ai7G+wOHHGwrvrgYlW3cWlPJDbnQh/DeHO7mXr/qnU1m/xtys7qs82yOr?=
 =?iso-8859-1?Q?rXfzQfOiC+z/yuLv69p6mqIAeoAK8HEJa7FHyBDQksB2+gaTux7kimtDl9?=
 =?iso-8859-1?Q?0BomXe4ckxdPdqRJXTXz/4V8KguY9zmOeR18ayB/8ic348psWt+MgZRPO5?=
 =?iso-8859-1?Q?bdxhQHPw5cVSR6HS+klj05z+kaqhQY7v39t5XzHOOv4taOG3bpvygGGfUQ?=
 =?iso-8859-1?Q?ZZoMGs0HFyXV0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a940cd13-4350-4468-2deb-08dab64eb8db
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 06:04:05.1266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DrEz9e/wcYQCU0UozwEk+fau7h+v4NK+wjadXPVzXVmONB+B63jnyLOipSQRxTIojWGaU/S1JNJXpbJHfYP3MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1793
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SN2PzHMOvc5KLm864/3+foUYefCD68GBj3P9zKlxFDc=;
 b=EiywXkQ2MRvqWeAql0MAUgbjG06jw8nfNCRZ54lgjWJFNqzIP/Kv5OWUiP3fbbkKZhfgrg+ZbZHnYAnaUy389U2lzYru5wxjzbElwslAtGmyDkgYYlpig5P/r+fqnm0CqvmZb3aEStgQ/8DViXxBRaY69u1Jec/tbAikaOfBboM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=EiywXkQ2
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 02/11] package/llvm: move to llvm-project
 folder
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To make updating easier, move llvm into the llvm-project folder
and use the defined information.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
Changes v1 -> v2:
- No changes
---
 DEVELOPERS                                                  | 6 +++---
 package/Config.in                                           | 2 +-
 .../llvm/0001-nfc-Fix-missing-include.patch                 | 0
 package/{ => llvm-project}/llvm/Config.in                   | 0
 package/{ => llvm-project}/llvm/llvm.hash                   | 0
 package/{ => llvm-project}/llvm/llvm.mk                     | 5 ++---
 6 files changed, 6 insertions(+), 7 deletions(-)
 rename package/{ => llvm-project}/llvm/0001-nfc-Fix-missing-include.patch (100%)
 rename package/{ => llvm-project}/llvm/Config.in (100%)
 rename package/{ => llvm-project}/llvm/llvm.hash (100%)
 rename package/{ => llvm-project}/llvm/llvm.mk (98%)

diff --git a/DEVELOPERS b/DEVELOPERS
index c8183b2290..8763fde182 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1610,7 +1610,7 @@ F:	package/earlyoom/
 F:	package/gconf/
 F:	package/libnss/
 F:	package/lld/
-F:	package/llvm/
+F:	package/llvm-project/llvm/
 F:	package/python-cython/
 F:	package/python-pycups/
 F:	package/python-raven/
@@ -2544,7 +2544,7 @@ F:	package/libgta/
 F:	package/libiec61850/
 F:	package/libspatialindex/
 F:	package/linux-syscall-support/
-F:	package/llvm/
+F:	package/llvm-project/llvm/
 F:	package/lugaru/
 F:	package/mcelog/
 F:	package/mesa3d/
@@ -2956,7 +2956,7 @@ N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clang/
 F:	package/clinfo/
 F:	package/libclc/
-F:	package/llvm/
+F:	package/llvm-project/llvm/
 
 N:	Vanya Sergeev <vsergeev@gmail.com>
 F:	package/lua-periphery/
diff --git a/package/Config.in b/package/Config.in
index e3a34d6e97..3b7d4a9448 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2069,7 +2069,7 @@ comment "linux-pam plugins"
 	source "package/libpam-tacplus/Config.in"
 endif
 	source "package/liquid-dsp/Config.in"
-	source "package/llvm/Config.in"
+	source "package/llvm-project/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
 	source "package/mpc/Config.in"
diff --git a/package/llvm/0001-nfc-Fix-missing-include.patch b/package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch
similarity index 100%
rename from package/llvm/0001-nfc-Fix-missing-include.patch
rename to package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch
diff --git a/package/llvm/Config.in b/package/llvm-project/llvm/Config.in
similarity index 100%
rename from package/llvm/Config.in
rename to package/llvm-project/llvm/Config.in
diff --git a/package/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
similarity index 100%
rename from package/llvm/llvm.hash
rename to package/llvm-project/llvm/llvm.hash
diff --git a/package/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
similarity index 98%
rename from package/llvm/llvm.mk
rename to package/llvm-project/llvm/llvm.mk
index 977c0a08c2..1adad17b16 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm-project/llvm/llvm.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-# LLVM, Clang and lld should be version bumped together
-LLVM_VERSION = 11.1.0
-LLVM_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_VERSION)
+LLVM_VERSION = $(LLVM_PROJECT_VERSION)
+LLVM_SITE = $(LLVM_PROJECT_SITE)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
 LLVM_LICENSE = Apache-2.0 with exceptions
 LLVM_LICENSE_FILES = LICENSE.TXT
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
