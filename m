Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDD5C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 06:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 490C681249;
	Tue, 25 Oct 2022 06:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 490C681249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kjkCOEmSTGdZ; Tue, 25 Oct 2022 06:14:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5931581092;
	Tue, 25 Oct 2022 06:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5931581092
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA78B1BF2BB
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7959480E3F
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7959480E3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M6UrZSp_ak_7 for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 06:13:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BCB080C30
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2059.outbound.protection.outlook.com [40.107.22.59])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BCB080C30
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 06:13:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYMXY2+WceojpqwEyCZZMjdatWxSZWVC/hHXE7re5Fl/r+0IlMO+q30JO/HpxDs8VyGPqrIDp3zMElt9gz6DFW47qC8wajREd5stQfzW6LGhIPhqFPhLmkYFWyEJOpmQY5opSyFw+3ZzpzI1UYamm+lrQcX/d1lLdNmvN7FhhLCk9XxziPi6b73ldqVHCIbWMHVQPyJa3P+7oxEzBGaxMQ8mn/Ht6t82Uav1mFH5o5P2N+au1mHuD4XlNzsSZ0DgyxYTB8Bwpr6b7g5KZcICzUw5rCv2k9YMtQJK2CrEnBK4TWLpmqBagGhkG9K6vgUH4aaxYjUVBkS5dSTuddghOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Smzp0AHGrm7m5Pz9yruzOpfeRW27USx3GuOGy2aYYuM=;
 b=hkpyfBqCSLnI6xDYcTzx2wpjolAZ8+P2UbKbBiOACW1KtnCKHqk+Cspx9GEjaBqk3twfNwW+u+PLtv63gXW7IXFA87Xe7DuG7Ylstz0a6e742Engwj2l+55LQEbLmQ1ERNQXQKO8gfv9DSmaupVthqeKsuKBMx9nQ+FoYFibfHBFfTPnfWEK8Y5Qg87LK1LItFflU0y138R9AtM3Im5Cwh3opq9xwo6T2oEuM2i8wUck+k9IBRM8WJa0+fW9hzYSGxwGYCClHYN/T7GdBHYQqSyu8NcetIMTrVMVw9TZUg6+Fd6gFHJ+lpA2cBm3XsAmCjYUWWjGYo11AcRcWePC2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VI1P190MB0654.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:123::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 06:13:57 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1%7]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 06:13:57 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 10/11] package/libclc: move to llvm-project subfolder
 and  bump to 15.0.3
Thread-Index: AQHY6DhG8xuuU+vUa0CBhYphMcWdFg==
Date: Tue, 25 Oct 2022 06:13:56 +0000
Message-ID: <VI1P190MB0493F747C05E6E64D3A384719F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|VI1P190MB0654:EE_
x-ms-office365-filtering-correlation-id: 29ab04ef-0f1c-4bac-386c-08dab65019a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KgZa1eGTIzVNdZCcQVyycr3RCkldCz3AF9bh1NVN8gL4AQWp4QBC6ElsBDJtHWbzLrWETpm9NNy1BUXBgSme4Y8LeHkkK1cyvzYioSRr9khJHnmUCn6TQdriYpOI/0lHDk0h+Z/UN+WJhS2zh5drBHDhIMp/7bZ+y4AdiwjTn5I5txp38Mmz1j25O8N8abk0XhFP4rLa8easgQM5gkPgKrjvN1AS9FjMwhNlxVnUSBkjzEHHITvOrmiDsx5r+LGU2OI9H1d4ZnrkzTJJ8993dxGeauTy2LzPrVmpux72P2AZRCWpyvYYcAqa2WhC2GREZm5bH980dhrNuxuqvtoGgoPMF6j84SiP0m7kY9Rs6Vfcus+xvjlMi7W7lWmqn2kS+mBIGfsSOSs/ckSWRT+oDEztpgW57Q4VMbJQzqnIg23DUZrLmCtPtnAGZbEb0Xa2wSxfnvqDbSSwvmkqGrHESQbAqVLUHooZJDPRIJ4t8f7t09+WeNvzrpR0hJZmBeOaWIFm2RmNi5gdie8WbjmOFCnxqn8gx6rvUUVhVe+3fKrLtM2Nx9AdKnGLONedCMvAIAZpv7WowkdNQhvt+cBHKNaOBYWuyQ0xFUpQc9VyQV2Aq4NYgc/M9MchniG7KPLpIO/rce1ZLdiLeAGKUjot082BBTz1rAxQ/SJR2TwZtwtqMqWLGFOCC5BRJWvJm6SVmEYUiRtIuDNKsgLf6Y7VDDuGO5eM2RLFVkmVOmayU+C3AMDgiWNwCEFqUn+0TgwAkN6AnJZUVKExoMQnz5aRpPNBYpcNG2HjoOYBy0oCo+0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(396003)(366004)(376002)(346002)(136003)(451199015)(478600001)(186003)(83380400001)(86362001)(71200400001)(966005)(66476007)(66556008)(4326008)(8676002)(316002)(66446008)(66946007)(64756008)(7696005)(6506007)(55016003)(41300700001)(9686003)(26005)(52536014)(6916009)(5660300002)(76116006)(54906003)(8936002)(38100700002)(122000001)(33656002)(2906002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?KbLxy2ObOLQRsmyt6cTdKLFh3Ll7KA6biZ21F9dlUmv8fls9X1hEa7Jmz0?=
 =?iso-8859-1?Q?5hHKnW5v66zzQsym7K9e8CFKV2HKQtcZIY/S0Wguoqu5lNjlAm9lqgfLI+?=
 =?iso-8859-1?Q?lLr1hVyPfeagQcPetzcJsTFoW3HBZH6gwLefXTuZvUuwlDd3pw1RZ1TSdg?=
 =?iso-8859-1?Q?akdQx4xbVZY+SGM2Ipz54Qo5b6HxOtBnDk33RQZYtB75Iau4ujLQzF6Sqp?=
 =?iso-8859-1?Q?DOdr9FvKQQf8UpDwG20LfNqDNSaZtoPLXTclYVDQTL7pv+C7iMSbfvPVI0?=
 =?iso-8859-1?Q?zu+Cwhb+zMtK9u/mv56fkYKHZjIpL7NlSXp10h4oRdmD3weTSxrnGWMQr9?=
 =?iso-8859-1?Q?Y5LKdSeYX+YFTJbT5P+Z6ZJHEF40SPLnQMkryRIuESvURswwzAifLcgBdZ?=
 =?iso-8859-1?Q?L9q4hBRJqOwcjMEbsxuBLoNxe31x6RFQx92u4mrsDv7d6ZA6cDS84MtGVW?=
 =?iso-8859-1?Q?2jlNQe3ordkoxAD0NKZLtA3tCxre1X26kFSF8dTgks78rMGVn7L+rETAEn?=
 =?iso-8859-1?Q?6Ksm0IWgUw4HlnvQBFdRjAOaKfipDeKphsnP4hpIW03c0HGooRa69a29k7?=
 =?iso-8859-1?Q?J/fz6xrqMZX2Q6/sD0scpJbRNiuYra5bu79iJqngtw7mRfejXOaqF0L1ls?=
 =?iso-8859-1?Q?eaZ7FUjX/YRfCnV6s4eEJyyI2cZO2EggwJH59HwCbr3amAPBbd+m0VthiM?=
 =?iso-8859-1?Q?iJ2FwmOOim0cG186ymIeWCyrVfv6hgzsLjpobmL8YswMObZl77behU1Yk4?=
 =?iso-8859-1?Q?/In0Sb94cJ2t7SOrHez5UAHbuzg5fADjP1kD11vpz1SSj3aYdOAPRZFdtG?=
 =?iso-8859-1?Q?g9vX/YgAU66TWUiAak6faQ4A4frwNMwbHXZQa0iCBs03VZR+YBRdSpNV6Z?=
 =?iso-8859-1?Q?0LKnYOkS/yrlFx+G7kQHydoVkp4aBi1hutyvyr1vbOKrh88uA3qd0aBdx9?=
 =?iso-8859-1?Q?2WYcpsMu4y+bqGLUwdOo1emeQL5JhXmD3OuzZ8JFSLfWGwQfKH2h0+ZlKN?=
 =?iso-8859-1?Q?snzCptgZM5QTIANVHNkrgpGQU9/4wTgsDYY7T/DU+C0qDOf1mna0Nd6glH?=
 =?iso-8859-1?Q?DmF/zNvcBvVmr0DoJiexU5FNJ3E0iRmbqs13ik7PXVDKxG12puKfM1x6M4?=
 =?iso-8859-1?Q?G/Oew6XoaCXm5yWUia8OioQcStGJApuGaIn8XskFb+o1o90PobwjBnGNx7?=
 =?iso-8859-1?Q?65gkNrDCF648C3i+5DZxW5pL5Q0TF6vHD5vMQ/xFkZPbh/Q6wpChMaHjPR?=
 =?iso-8859-1?Q?hcOdnSFtjdMYtbsnMMwcm6qLygPL6IajWcIV5R0v8eMvDHxbfPDdgjYRFg?=
 =?iso-8859-1?Q?yLekcjzTtoIa3HpQv80OlHTh2NJ3abccfzsdS1Hvn9K5sR+vwmWdq8oZlR?=
 =?iso-8859-1?Q?62ramogrSLSyWmAt/x2gn4EBzwlxExwtIwSJ0HkPpcKuusrugTxqHEQrxo?=
 =?iso-8859-1?Q?NqQxD+cvYn3Ki7Kh1gH0FzKY6N2K+URD9jvCx6zD9+ald/nyZKsSzSS+nC?=
 =?iso-8859-1?Q?oTyCvSg6ShMbfiBNVLFY/RvM+6YLlEjwe9huNyO4KNg1i70q1QYs0DgIjK?=
 =?iso-8859-1?Q?G8Twr+SIOFPRr9b3s1KX35oLIaoCp+iNach+CX+JxRdHua/k7tJB0LNZjG?=
 =?iso-8859-1?Q?qWsTLwfwmlFCE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ab04ef-0f1c-4bac-386c-08dab65019a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 06:13:56.9734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EwcYwjkhfo+LY9lJrRkNgyihO97xCxhc4kHmes3vaTqOmLb1roQ/PtfktD8lMo6tCyFToQJ0LrCVk3CEBknu4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P190MB0654
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Smzp0AHGrm7m5Pz9yruzOpfeRW27USx3GuOGy2aYYuM=;
 b=3SR6Fc0MH7Wqjv6nT4qC2qROSOE/Oc+hiRMKgf+kB3ZklTI32VtBTVEfGXjdetUqi6B7oYgxHhvG57aCSImdbzsCyKq582nmmH/UVGIqQv51pfI6XMu7ATq+WNOlxfXd5V/eqzlsgDMfBpXDLDAkOGHj6aUPj/MqLS9lQhtYUMA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=3SR6Fc0M
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 10/11] package/libclc: move to llvm-project
 subfolder and bump to 15.0.3
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
Changes v1 -> v2:
- libclc: Add missing change to package/Config.in
- Bump to 15.0.3 instead of 15.0.1
---
 DEVELOPERS                                                    | 4 ++--
 package/Config.in                                             | 2 +-
 .../libclc/0001-support-out-of-tree-build.patch               | 0
 package/{ => llvm-project}/libclc/Config.in                   | 0
 package/{ => llvm-project}/libclc/libclc.hash                 | 2 +-
 package/{ => llvm-project}/libclc/libclc.mk                   | 4 ++--
 6 files changed, 6 insertions(+), 6 deletions(-)
 rename package/{ => llvm-project}/libclc/0001-support-out-of-tree-build.patch (100%)
 rename package/{ => llvm-project}/libclc/Config.in (100%)
 rename package/{ => llvm-project}/libclc/libclc.hash (51%)
 rename package/{ => llvm-project}/libclc/libclc.mk (92%)

diff --git a/DEVELOPERS b/DEVELOPERS
index e6606408c0..6dbf4fe7a5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2538,12 +2538,12 @@ F:	package/irrlicht/
 F:	package/liblinear/
 F:	package/lensfun/
 F:	package/libbpf/
-F:	package/libclc/
 F:	package/libgta/
 F:	package/libiec61850/
 F:	package/libspatialindex/
 F:	package/linux-syscall-support/
 F:	package/llvm-project/clang/
+F:	package/llvm-project/libclc/
 F:	package/llvm-project/llvm/
 F:	package/lugaru/
 F:	package/mcelog/
@@ -2954,8 +2954,8 @@ F:	package/tinyssh/
 
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clinfo/
-F:	package/libclc/
 F:	package/llvm-project/clang/
+F:	package/llvm-project/libclc/
 F:	package/llvm-project/llvm/
 
 N:	Vanya Sergeev <vsergeev@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 1d48b1448b..882e296533 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2010,7 +2010,7 @@ menu "Other"
 	source "package/libcap/Config.in"
 	source "package/libcap-ng/Config.in"
 	source "package/libcgroup/Config.in"
-	source "package/libclc/Config.in"
+	source "package/llvm-project/libclc/Config.in"
 	source "package/libcofi/Config.in"
 	source "package/libcorrect/Config.in"
 	source "package/libcrossguid/Config.in"
diff --git a/package/libclc/0001-support-out-of-tree-build.patch b/package/llvm-project/libclc/0001-support-out-of-tree-build.patch
similarity index 100%
rename from package/libclc/0001-support-out-of-tree-build.patch
rename to package/llvm-project/libclc/0001-support-out-of-tree-build.patch
diff --git a/package/libclc/Config.in b/package/llvm-project/libclc/Config.in
similarity index 100%
rename from package/libclc/Config.in
rename to package/llvm-project/libclc/Config.in
diff --git a/package/libclc/libclc.hash b/package/llvm-project/libclc/libclc.hash
similarity index 51%
rename from package/libclc/libclc.hash
rename to package/llvm-project/libclc/libclc.hash
index c496291d81..7140884f6c 100644
--- a/package/libclc/libclc.hash
+++ b/package/llvm-project/libclc/libclc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  8f0213e52e2fcaca3dfcc438f05d0e15e9b3c96fd6b0994a802b267dc1047a1d  libclc-13.0.1.src.tar.xz
+sha256  07e8a2b31e07a8cc8a976a6bfd87797d2543d5a9530f449755bf5119acbdbe8e  libclc-15.0.3.src.tar.xz
 sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/libclc/libclc.mk b/package/llvm-project/libclc/libclc.mk
similarity index 92%
rename from package/libclc/libclc.mk
rename to package/llvm-project/libclc/libclc.mk
index 5d246cf4f8..9f303d6d2f 100644
--- a/package/libclc/libclc.mk
+++ b/package/llvm-project/libclc/libclc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCLC_VERSION = 13.0.1
-LIBCLC_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LIBCLC_VERSION)
+LIBCLC_VERSION = $(LLVM_PROJECT_VERSION)
+LIBCLC_SITE = $(LLVM_PROJECT_SITE)
 LIBCLC_SOURCE = libclc-$(LIBCLC_VERSION).src.tar.xz
 LIBCLC_LICENSE = Apache-2.0 with exceptions or MIT
 LIBCLC_LICENSE_FILES = LICENSE.TXT
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
