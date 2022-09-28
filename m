Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DA2C32771
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 14:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBD6060EFE;
	Wed, 28 Sep 2022 14:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBD6060EFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3dy8EPw8hjxM; Wed, 28 Sep 2022 14:30:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF51260E16;
	Wed, 28 Sep 2022 14:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF51260E16
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8DBE21BF368
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68A284097E
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68A284097E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GJSPtwpG4alF for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 14:30:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02969405E7
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02969405E7
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 14:30:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkKDFPm16+RGslkviqbyCTJYlxnu+1iURUGOXxfrmTk4EJdnmNcOiFhy2ymnYrK6Yoio9Vu6K6H0q5QRlJddQ9Pu63OmYuwIX6DgvoACbLjqR5tvMqi42Qj8pEKbWik99DLJ6GCn3hRn+8cV8tkevK6AEmpbkfzOfN/q4PndCTaElXVA+LxwL9euvknIOLVwbXHjLZzpzkBK3v6mTG7J1sM3av8c3fcxQKzvqT89r0jlrnSAVDnI4El/Gy8iFoi3SRM1tRksnNTJwbfKYeU+bsvZFOgQpy3/O6cu5voL0iJgqfxVrW1mU3DsJZGW+myKwRzE3qjcuHZWuV119ogOWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dmwsHvsFGIYQIgMjIxeXoC2bquP6qBCjKLVxXr9QQc=;
 b=XHYh84pSxIl/ny2i9mA3sz+RaZ40Vx/bxlZroeJW0KWNPwQUF/PxXEaAhv5EnelXGJ9fFKUF6UspPeXdUO0nMfobhPRv+0NX6ZKBrS3rUKMPEPBNkmzVIqlfG/PcJTHPfAsZ1MJz8KGwT6z2SsqhoRppXypwYSxD+duSSFe5uc0o0F/OppzdkefatKFgIGMUlzd/lzzzmadjjv9hhvs6iPveZWL7Asbb0xLCGKcIhBenHbO3L55Vqkz9Qk2LVnI2MFQLdb8C8/HrUZgqcPwHWHwOjsfiqho3jEu2T6tNaCpHTCLoDb55x9wCKxRToa2mgEb5uVXEQWNsOd7wNw3oPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:32::11) by
 AM7P190MB0776.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:119::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17; Wed, 28 Sep 2022 14:30:06 +0000
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b]) by DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b%5]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 14:30:06 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 04/11] package/clang: move to llvm-project subfolder
Thread-Index: AQHY00XdBRCotiO5Bk+bBIDHS7/IZg==
Date: Wed, 28 Sep 2022 14:30:06 +0000
Message-ID: <DB6P190MB0488FAFD64C45B7A532AB6309F549@DB6P190MB0488.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6P190MB0488:EE_|AM7P190MB0776:EE_
x-ms-office365-filtering-correlation-id: 7bdeaa85-3b24-4aff-2c49-08daa15df084
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZGqiFXzJUc+8tF4u1gVDDdidAdve3GvMIRx6bqxJErbNuC978QCi4Z6eb1r2dodM7ZgtuSv8sG6I3qG1niSYLRDvrXN8StMVJG6jqfqIZOFwcDEYmN6yIKhl7a9DlfmeDCFXoZafVrJ3CumOVTQ7pfsl66Ye31A2zxHheV95WG+20oeQ1J3fXDDE0UkvBrbFl9u1HU3HhI6Vvx77pDZe13if1TY/iJWqVkKOufjXIO7bMAynUlz+6ked8KYFmguBNZQ0w7uZvs//DXSIBdOXBLaIJeTILZRPyGs4vSN9+0310bkzfhj6Cy9xbCryJVpPwZKSp2QrlPdc+QNm8FNGoEn+UVJVpT7uDGcD+0ikMDF+jv3TFZY8altQLFg0pBzSXzulZxyq1uTWmmkrQ3BxNDU6+veiWGkZLFdgAmHhnIdlk/H/eYVO3RPeDgypBpO07AN08gEnNaQB2tmmlQu1hwCkF2rqoa2Gqk1UBS0mcHlzzbBZvg2C2cgVF2ul7ttIBfxw0jtTi8tBfxCRJjCLiWB1DkINyylr8WtzXJ1VQ8MHy5g6gBnCKQE31QPCXzGi8qC8kT/e9G2k1DRTI1QHhjLkk8GPIAlDdHcJqqFg6D4iF8cyc079AnJQco9k9pCLW4GULJMn7VFIhJk4Oq2+G20lcjXBVkN31c3mSyil0Fo2t5YLbOR7S+Ar5epqN2NqRIBr94H1EAWypjkxESuXYJG8vHXuhJHzCSbwle5tK/UY0J8AsACfAcXnKyD68gp7BYOD0tIjJ10mKt3mOXEsd4mDN3Dq+kG7JJJEg7clGeo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6P190MB0488.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(366004)(39840400004)(136003)(346002)(451199015)(64756008)(4326008)(8676002)(33656002)(2906002)(316002)(66446008)(66476007)(41300700001)(54906003)(6916009)(66556008)(66946007)(76116006)(91956017)(86362001)(7696005)(6506007)(26005)(9686003)(186003)(966005)(83380400001)(71200400001)(55016003)(478600001)(38070700005)(122000001)(38100700002)(5660300002)(8936002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7OdCWWoDh73FCXJdH9qUeZ/VJ6Tnu+bkoqGfQPBwQW9lvBxfyr3oKVN0nq?=
 =?iso-8859-1?Q?5hi6mTjyvPfMwdBXXjI4DsrnpzbcgnTcM7WiHs4aGb+asGhjvcVTXLPqGA?=
 =?iso-8859-1?Q?dZMgOscw5e43B63X3jQ3vpvhPhNTlbvVHJtGEXFnSG2Us8jo/7zqbJhQQS?=
 =?iso-8859-1?Q?GAug7z+8IE5eHvoGn0QwVWCM9I9UAzR4ym8J1r9cD2JZpOQzWyoom9g0/D?=
 =?iso-8859-1?Q?1a8owzpa7d1nV0L8IyiVLtgO1kEPfR1Lk35Sd1QtNLK5Jt5D5xDbp7nsHw?=
 =?iso-8859-1?Q?Pf0mmkEcCDSo4cqqjRYzaVLhas3VkOaNMRcxw7FhU8Uo3RIDBRH7aJLqdF?=
 =?iso-8859-1?Q?0yR7g1RoTHpuIp1PeRxPSFGUUeWoF3XBUpCEin8WKzIGEv8+5PoUF2yK/Z?=
 =?iso-8859-1?Q?59iO72e31NBAuWMmG1wlzdgH5B5Ydcfu++A7PjWF2MKAsUpX3mVoHDGX1l?=
 =?iso-8859-1?Q?4LTRgVsGw6jsp56OipCxw7el4Kzs0UxmZO4iOJ6+iyFp2lzOB/KgbiXEDZ?=
 =?iso-8859-1?Q?Q71YURLOETHAfqDqmsvAbLu09H86sLAWPMeYWOdFHkC/rX09Z11NmNJfYF?=
 =?iso-8859-1?Q?UkpPGD8cNW7IQBf1jd5/ECmGmHsK2e2q0DuPg8dp8fAIbwXezvySCsHxvP?=
 =?iso-8859-1?Q?WsdiG7ylAEmiLY56W3+y0dHN4mgYfGNd9wAEb+88JubvvZmTR8cCUTxDIR?=
 =?iso-8859-1?Q?FXT6W7N9MADlk4Gi4GrNcg28Lo0KmqEIsYeveb48uML0Z/8bdQXKJ3lbx8?=
 =?iso-8859-1?Q?WeSuEpzJhAX5zxUAsfj22Nkl0mTeoi0oU7NwD4AiP/c/afXNm25oyEOuIm?=
 =?iso-8859-1?Q?92nYP1pE/OXAKOwTYim+yC6Gue5AK+z9tnnb7LH7V6wUAb5FZ6LcO12xGh?=
 =?iso-8859-1?Q?yqX5+aoy833WBhS6CVKaMVtUFBkGtLIHwQroiVyIijaExd2E9MWwhAvCAC?=
 =?iso-8859-1?Q?x83Lu0i6VLEXUrGTsaau/4gnVN3PychEZPuB7f7M3rYyALR17XO3oheloC?=
 =?iso-8859-1?Q?76PxlFVoKAsYClYcwZdUWGfh6vl7MmOmhyVcA9mFiO3eyIwyDHJY5Z0yyc?=
 =?iso-8859-1?Q?WcjL10iirDJsmG0LPYd0SwBZNS9X7nXnROLNJO3j8dnpzx6voUjQYuRNVk?=
 =?iso-8859-1?Q?hRCNbck6Jah318m6WbimbkoGPYfqPtOf+9KrkwoiwoZCyNSafDFU1YG7/s?=
 =?iso-8859-1?Q?HXcqGkwU2ALFkBdZ6CDlCJsFWcH4umEn1Sqe61nug3HxtfSMoGQCpi6xBR?=
 =?iso-8859-1?Q?Aqc21Y80jypliMtyXvX7SJQaFnOuComk1NdmgjFK5rNQaub5PzDe2hJcFS?=
 =?iso-8859-1?Q?CjjdpQe8Y6LiUWpcyhkoj4vcer6YqIVXBSo0M5GSTVKMXTL+4ZpMq5uF8E?=
 =?iso-8859-1?Q?kpTCimgrMASB9KSaeYDDkn/21hRkhYQoUJAcijpsRQLjQ2VldHyPJldsCB?=
 =?iso-8859-1?Q?jNGfo+bjgIA8QnHYTK710XmshgtY0YnHATPXLz/d7o4mdF50HclgEnFZAw?=
 =?iso-8859-1?Q?lLUyCqrvK5B4TGlUotJJhAbP8gkmLkqAxfCVnPG+q7mAD6Sj1HQ0cbPVKK?=
 =?iso-8859-1?Q?wWNQCR2g9ybkt6PKCyvOnlGGXg+T2BOvyIMHkBQwpeCYZjoC8KC7ToNEOh?=
 =?iso-8859-1?Q?a3rcjc2My2PIg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bdeaa85-3b24-4aff-2c49-08daa15df084
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 14:30:06.4945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JR1LE7JwgMJip48DfOPO+QAobwQA+zCQWHlEGT6IZa608sxI403XZp/0Fsu+BXufaePPyIWF7VUYLvYeO3Ayew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P190MB0776
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dmwsHvsFGIYQIgMjIxeXoC2bquP6qBCjKLVxXr9QQc=;
 b=RN0CT4n2ozr4I6Xqd8hr/5NMCJjjiKqkyiy1PFiAQlpziDJOBvwdLtpO9j8YpOzoCCLRWzSXxJK02pOCIHPZhpf6NayqSInc/ir8Kjn779LqpFKnCVXTf02E1qDsshEDgvRbQNC3JiPnAuOwVpVroKrT0j1qGq2i6BogmJWjKc8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=RN0CT4n2
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 04/11] package/clang: move to llvm-project
 subfolder
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

To make version bumping easier, move llvm to a new llvm-project subfolder
and specify site and version for the project.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 DEVELOPERS                                                 | 6 +++---
 package/Config.in                                          | 2 +-
 ...-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch | 0
 package/{ => llvm-project}/clang/Config.in                 | 0
 package/{ => llvm-project}/clang/clang.hash                | 0
 package/{ => llvm-project}/clang/clang.mk                  | 7 +++----
 package/llvm-project/llvm-project.mk                       | 3 ++-
 7 files changed, 9 insertions(+), 9 deletions(-)
 rename package/{ => llvm-project}/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch (100%)
 rename package/{ => llvm-project}/clang/Config.in (100%)
 rename package/{ => llvm-project}/clang/clang.hash (100%)
 rename package/{ => llvm-project}/clang/clang.mk (96%)

diff --git a/DEVELOPERS b/DEVELOPERS
index fd88cd929d..0acc1eef55 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1605,10 +1605,10 @@ F:	support/testing/tests/package/test_python_aexpect.py
 N:	Joseph Kogut <joseph.kogut@gmail.com>
 F:	package/at-spi2-atk/
 F:	package/at-spi2-core/
-F:	package/clang/
 F:	package/earlyoom/
 F:	package/gconf/
 F:	package/libnss/
+F:	package/llvm-project/clang/
 F:	package/llvm-project/lld/
 F:	package/llvm-project/llvm/
 F:	package/python-cython/
@@ -2522,7 +2522,6 @@ F:	package/alure/
 F:	package/aubio/
 F:	package/binutils/
 F:	package/bullet/
-F:	package/clang/
 F:	package/clinfo/
 F:	package/efl/
 F:	package/enet/
@@ -2541,6 +2540,7 @@ F:	package/libgta/
 F:	package/libiec61850/
 F:	package/libspatialindex/
 F:	package/linux-syscall-support/
+F:	package/llvm-project/clang/
 F:	package/llvm-project/llvm/
 F:	package/lugaru/
 F:	package/mcelog/
@@ -2947,9 +2947,9 @@ F:	package/gettext-tiny/
 F:	package/tinyssh/
 
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
-F:	package/clang/
 F:	package/clinfo/
 F:	package/libclc/
+F:	package/llvm-project/clang/
 F:	package/llvm-project/llvm/
 
 N:	Vanya Sergeev <vsergeev@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 3b7d4a9448..15dd27796f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1970,7 +1970,7 @@ menu "Other"
 	source "package/capnproto/Config.in"
 	source "package/cctz/Config.in"
 	source "package/cereal/Config.in"
-	source "package/clang/Config.in"
+	source "package/llvm-project/clang/Config.in"
 	source "package/cmocka/Config.in"
 	source "package/compiler-rt/Config.in"
 	source "package/cppcms/Config.in"
diff --git a/package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch b/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
similarity index 100%
rename from package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
rename to package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
diff --git a/package/clang/Config.in b/package/llvm-project/clang/Config.in
similarity index 100%
rename from package/clang/Config.in
rename to package/llvm-project/clang/Config.in
diff --git a/package/clang/clang.hash b/package/llvm-project/clang/clang.hash
similarity index 100%
rename from package/clang/clang.hash
rename to package/llvm-project/clang/clang.hash
diff --git a/package/clang/clang.mk b/package/llvm-project/clang/clang.mk
similarity index 96%
rename from package/clang/clang.mk
rename to package/llvm-project/clang/clang.mk
index 3c75f8d6b1..0943e21a8c 100644
--- a/package/clang/clang.mk
+++ b/package/llvm-project/clang/clang.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-# LLVM, Clang and lld should be version bumped together
-CLANG_VERSION_MAJOR = 11
-CLANG_VERSION = $(CLANG_VERSION_MAJOR).1.0
-CLANG_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(CLANG_VERSION)
+CLANG_VERSION_MAJOR = $(LLVM_PROJECT_VERSION_MAJOR)
+CLANG_VERSION = $(LLVM_PROJECT_VERSION)
+CLANG_SITE = $(LLVM_PROJECT_SITE)
 CLANG_SOURCE = clang-$(CLANG_VERSION).src.tar.xz
 CLANG_LICENSE = Apache-2.0 with exceptions
 CLANG_LICENSE_FILES = LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 7ba89bb605..747a6f5647 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LLVM_PROJECT_VERSION = 11.1.0
+LLVM_PROJECT_VERSION_MAJOR = 11
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.0
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 
 include $(sort $(wildcard package/llvm-project/*/*.mk))
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
