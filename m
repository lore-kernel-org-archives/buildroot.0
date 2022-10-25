Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD380C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 06:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42811812C3;
	Tue, 25 Oct 2022 06:02:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42811812C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zh7FNJTXYBxj; Tue, 25 Oct 2022 06:02:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E970812BF;
	Tue, 25 Oct 2022 06:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E970812BF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 577E61BF329
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95844812BF
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95844812BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YcHmWbgea10x for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 06:02:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D405812BD
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2045.outbound.protection.outlook.com [40.107.247.45])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D405812BD
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 06:02:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mASVDsI7slmqHOYa8OmjeeF7avEy1J0NX9yqQTrYRAnCHRZDD9TpeqVk2XM5O8nPlpFE40c1lamn3IYhY4ep4JO6rYj9DcJ5P/BiHnYbNPgGowewEy2S3t3PJuVgqNnx1LYgpvgdJ2FBRrmHmz2OvfXqoMKDPey24PhK3ocPmK2V1q4jwjOk4runSe1fq/nBRYWzOv7ewO0CkW9NToxfHzL7olZ6qu5WUU023+hVevCWIEVzGLt4R7zE6AdsWNaL/QiU4T2vzb0O6Lec7UcH2qhQUHqD+AluXTBqrIr8yQSW4kN6zgPS0lBAf+KEtxqA48oO9Clc1D+3NfX3Cg6EPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zA77BflluYJXNWtfP22EJPVf4/l5drod0g1cCghXgPc=;
 b=OkXCSxM3izmgQwLMnOCxXGV6Sh3GAujMf3UFLIRM6YO5fpDDu2i2wNo/dTMu6RfF6V9Sl8hFf2G37urjPksYI3PEera85nnyEpWOvzJQ1rLuuOru5R8jvdPFrmng22uyIxDff7v4BYMfRRNZX2V2LwZpJ3c9Oy6wgXV0mX/iH0xZiHYGSXTW10qgpF2C5CO2CM2OZJd13bX9Gvrmg+uok/Ab2XD/XOnEhynasaVIb/n8W8/wcIXs4jfMuoBJbE7569/AHm6YTi+OWW38gGZGxDRaoJxQgYUxnisNwMXvqaeDxVmsUT/PELVPI4n0hu3iB0+FmpvkdYp6VOA1A+3hfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by PAXP190MB1792.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:28e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Tue, 25 Oct
 2022 06:02:09 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1%7]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 06:02:08 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 00/11] group llvm projects and bump to version 15.0.3
Thread-Index: AQHY6Da9sWSKWW7ioUqK/3/o/fVREA==
Date: Tue, 25 Oct 2022 06:02:08 +0000
Message-ID: <VI1P190MB04937CE5FB8C1C3935CEFA859F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|PAXP190MB1792:EE_
x-ms-office365-filtering-correlation-id: 4c8ead79-a652-41f2-3a41-08dab64e7386
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MZGTuA8OPXwdohUwitKSeSgd0SXhIXmopXuMLF3n4i+/FeHhfhtWriqpfh2a12zSXFgcndw1UMM/tu6Z/EmcCJWZBfnPzzsTFUpUOYgjwOP5bn6BZ4MVfceMYoQvbQz3lWGrPr70k8hULlL5/DPzTARfl7yA3SwW9bm0S2yJPqJb89YWvNycn2UQ747+kWN3qKGUIU6pkAxqIuG9YocDcaHOTBUsQG8PLmPWPd8mimAtiy8hmxmEvijDMcIPJlxxyKkHSfKaK3ivgtzd7ARUYzZuaCSkp1V4uGKZ5LptM1QYV6PwuFmK3vT2wL0DrCFiCC1YylcKWEpVOM/02X7x1/JLau88mY4MsxeWpTQ5jxowyOovuwsQCniz6mJUkDEsSJWAQ0xwTUOB+XmiDtcuxcFS0G/4X2TnGahgrnEvpJsXqiUlBOK2FB45iV6rl2KysGp1BF5iUjcOK9tQwmjW0RRHupA1ojhTRJXL+BWkSI2JAA3Ik+A4y1KpGrmB0OO76PoqGDSIz7L/VoZ6llFQb5uOq2vRkmnTm+lO3nBrwKvsWtpXMa8kaVpq91gx/TWDU3Zpkd2Smkh4kEkdhd/tveKjdJOiC/3qr2fWc/Yj0HLMYC6Wv8OBbusIeznoxEUSwm5LouRql+otCfVQBGPRLiOeJRys8R091TxrXGYTbLW6v2eHZ+3A/AYZNaR1Ju7TZN0Xf3dkbXOGm+yjfGnTO7z2Y32/gj9Ym2NdjgkdREbigJwr6jpb9U/FYITQyhujT1EuutCu+HM1rfWvYmwYvQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(39840400004)(346002)(366004)(396003)(451199015)(186003)(83380400001)(38070700005)(122000001)(86362001)(38100700002)(2906002)(41300700001)(8936002)(478600001)(52536014)(54906003)(5660300002)(8676002)(55016003)(7696005)(71200400001)(76116006)(66946007)(4326008)(66476007)(64756008)(66446008)(6916009)(66556008)(316002)(9686003)(6506007)(26005)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?smVPrKaZPQFEgLjWvdgyr+xKHflaMJz+8Ze33kiif7BJfter5i/5lI+aXn?=
 =?iso-8859-1?Q?OKU4aROYHKdQCVq75jPcsOsIw3jxDqPtiwdBm51cociyGFvrRZWuPuqx9f?=
 =?iso-8859-1?Q?AMi0DI7nv4oxOezQyP3S6cHVZ4pn543mMd/2f6QhaU+Kv3vIVesrC/fSH0?=
 =?iso-8859-1?Q?N7WjCrXtcqKzWFpyHpqsV6MoFlhfk66kReJMGVfXQ3wyiNzSlJYma71JMs?=
 =?iso-8859-1?Q?Z/WbBAJNvt01aM0enrbPe0bvezdkc5aJaZ7ao8Xpj2mGfTsjtPCLm4ri0P?=
 =?iso-8859-1?Q?K57E9iEE/kCNblyDPH28wJTuKS6h5YOoGuVDc9aVQfZ6v8uoKIZVIicbqU?=
 =?iso-8859-1?Q?RuQUbTZaPmRVgDev7ZhRojoNiGfzWEwS4JHgWoTV9vfl9YlzMAxZpvrQ1M?=
 =?iso-8859-1?Q?H7HuigQsjWZxB/PgZclLYVZbmLHjGojEa0VraWPmah8HT41ICyD1JaUVAK?=
 =?iso-8859-1?Q?FW1/Q3qHN0HapqfQtLaSWPSGA5nQ1vEhJfkJ72gCj8u3FVF5heZiLimoE+?=
 =?iso-8859-1?Q?SDXmDHakM3eWVUQ8ilY4HGiyqthiyn+b11G4IevPmmwXtgnCMoN7E/TroX?=
 =?iso-8859-1?Q?LDlS2rkSbjgl4DZ2CCCXhRgTQ0XHC6pKANBRr3tD9RKscEPcUx0xvsKm6H?=
 =?iso-8859-1?Q?JR5KYcC7kLOHFjtQrcss4qHjQJ2Ujt8NWyOelG+/teMIHmxEa/nUY8W8L4?=
 =?iso-8859-1?Q?Rw+z5XMuChZqFdKCgwE6SX1Ynt1LjXSN/c3CaqBk0R2dVHc1HU8vNvCs1U?=
 =?iso-8859-1?Q?OJx4HdRmf6wO/m0NdFCnRe+AvSjX6JIOQWGKIfMnT6pwz7PKwO+qzaAh/U?=
 =?iso-8859-1?Q?jSQUsX0ni38uCheN3dQpyl26qj7krMAcvM9E03dnl/rD8abfoUCNT//BO4?=
 =?iso-8859-1?Q?IEY+StG2d1Qc8oVSSUcWndasDnkdvWhgOHsIKPUZo71i4gZG9ibO+p4kpl?=
 =?iso-8859-1?Q?wD5TSSvmCbaNyfFWL3VQCa6I+R5WzExfWKl+1VJ3CZWv7uE1r88mruUHVE?=
 =?iso-8859-1?Q?FHYYQcvFQC9vcHLVnCkBEcszPigfrzi6PaVnOm51j+Uebh7WgM8L5HX9Is?=
 =?iso-8859-1?Q?7+X5AKd/8zvS0u/wMYDWKjOKb8LrTWkKIf1lgWA6nyLe/UhjCZXud9KqjH?=
 =?iso-8859-1?Q?7FrHWgFwxkQjGP806RT8u6jKBivMr56ahH5+MzMPZ0idBNv6tO32Nkj1qB?=
 =?iso-8859-1?Q?YVvidMZ2VZQRU+stL4rFfbSxGkRF6uRYfuUgUkf0A1vCH+i0r8caxo/2td?=
 =?iso-8859-1?Q?s/GwPtU19v2camwfpjK/8nv6Wtp9a37pain1FeNnz5gb4jP+tD/w6QiVE0?=
 =?iso-8859-1?Q?KLBXlecsuSS/7pVseJ3CsdMRjwU2Y72njLZu/G+fbHCvRYgPN+5CbClD1F?=
 =?iso-8859-1?Q?i3FJgewVjwVmBAU9AWlfPKiCgqWU8lOU6qgvLVCHwEJkm0dMj7udDXGQrH?=
 =?iso-8859-1?Q?9DUBLGka9mNOm2qJuF+j/rlKXWBXJniaiF+Nxki6a0T43DIFNK8I1mKvVg?=
 =?iso-8859-1?Q?ZJO1b0rpmM50z9oa4YX38ILppZTiGy6O1DCRGIhlNbLsbQ0jHnRxnBzO5z?=
 =?iso-8859-1?Q?z1k1PdA1nfN6GTvEqH6hRu/iziUe076trOcO2383W3IPyrVf90Ao3hZE/b?=
 =?iso-8859-1?Q?HZHg321Lg2Bm4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8ead79-a652-41f2-3a41-08dab64e7386
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 06:02:08.8071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TifhejZT3/fVJQ3Jf2WbX7vCOimwhz+vUCLc7OaED57IX8zUTYzHtvQiR4rKXOmbPSijXhwm/8z9+oMtgtkWRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP190MB1792
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zA77BflluYJXNWtfP22EJPVf4/l5drod0g1cCghXgPc=;
 b=z4DXSFBIzF63Jn8medBsFmpM5rgOoB6BhKRzn1dDL489Ip66tiiPM3pJBobx5cf8AxCVKJQnTb024sjn0ZevswNePkLEONqDQXsXxCxauNgSJlVLFWoioOiVz44HDltLx+UCAfOlEMABTv3BjXzM+JeZfRDsBn6yZLMambitVVE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=z4DXSFBI
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 00/11] group llvm projects and bump to
 version 15.0.3
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

This series attempts two things:
- Move the different llvm subprojects into one folder
and share version and site information.

- Bump the version to the latest 15.0.3

Starting with version 12 different subprojects added
dependencies or sources that would be available when
building from the "monorepo". These have been added
as new host packages.

Changes v1 -> v2:
- Rebased onto current master
- Bump to 15.0.3 instead of 15.0.1
- llvm: use CMAKE_HOST_C_COMPILER instead of HOSTCC
- libclc: Add missing change to package/Config.in

Daniel Lang (11):
  package/llvm-project: new group for llvm packages
  package/llvm: move to llvm-project folder
  package/lld: move to llvm-project subfolder
  package/clang: move to llvm-project subfolder
  package/compiler-rt: move to llvm-project subfolder
  package/llvm-project/llvm-cmake: new package
  package/llvm-project/llvm-libunwind: new package
  package/llvm-project: bump to version 15.0.3
  package/spirv-llvm-translator: bump to version 15.0.0-2
  package/libclc: move to llvm-project subfolder and bump to 15.0.3
  DEVELOPERS: add Daniel Lang for llvm-project

 DEVELOPERS                                    | 21 ++++++++-------
 package/Config.in                             |  8 +++---
 package/Config.in.host                        |  2 +-
 ...hains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch |  0
 package/{ => llvm-project}/clang/Config.in    |  0
 package/{ => llvm-project}/clang/clang.hash   |  2 +-
 package/{ => llvm-project}/clang/clang.mk     | 15 +++--------
 .../{ => llvm-project}/compiler-rt/Config.in  |  0
 .../compiler-rt/compiler-rt.hash              |  2 +-
 .../compiler-rt/compiler-rt.mk                |  9 +++----
 .../0001-support-out-of-tree-build.patch      |  0
 package/{ => llvm-project}/libclc/Config.in   |  0
 package/{ => llvm-project}/libclc/libclc.hash |  2 +-
 package/{ => llvm-project}/libclc/libclc.mk   |  4 +--
 package/{ => llvm-project}/lld/Config.in.host |  0
 package/{ => llvm-project}/lld/lld.hash       |  2 +-
 package/{ => llvm-project}/lld/lld.mk         | 13 +++-------
 .../llvm-project/llvm-cmake/llvm-cmake.hash   |  2 ++
 package/llvm-project/llvm-cmake/llvm-cmake.mk | 16 ++++++++++++
 .../llvm-libunwind/llvm-libunwind.hash        |  3 +++
 .../llvm-libunwind/llvm-libunwind.mk          | 18 +++++++++++++
 package/llvm-project/llvm-project.mk          | 11 ++++++++
 package/{ => llvm-project}/llvm/Config.in     |  0
 package/{ => llvm-project}/llvm/llvm.hash     |  2 +-
 package/{ => llvm-project}/llvm/llvm.mk       | 26 ++++++++++---------
 .../llvm/0001-nfc-Fix-missing-include.patch   | 24 -----------------
 .../spirv-llvm-translator.hash                |  2 +-
 .../spirv-llvm-translator.mk                  |  4 +--
 28 files changed, 101 insertions(+), 87 deletions(-)
 rename package/{ => llvm-project}/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch (100%)
 rename package/{ => llvm-project}/clang/Config.in (100%)
 rename package/{ => llvm-project}/clang/clang.hash (52%)
 rename package/{ => llvm-project}/clang/clang.mk (89%)
 rename package/{ => llvm-project}/compiler-rt/Config.in (100%)
 rename package/{ => llvm-project}/compiler-rt/compiler-rt.hash (50%)
 rename package/{ => llvm-project}/compiler-rt/compiler-rt.mk (82%)
 rename package/{ => llvm-project}/libclc/0001-support-out-of-tree-build.patch (100%)
 rename package/{ => llvm-project}/libclc/Config.in (100%)
 rename package/{ => llvm-project}/libclc/libclc.hash (51%)
 rename package/{ => llvm-project}/libclc/libclc.mk (92%)
 rename package/{ => llvm-project}/lld/Config.in.host (100%)
 rename package/{ => llvm-project}/lld/lld.hash (52%)
 rename package/{ => llvm-project}/lld/lld.mk (61%)
 create mode 100644 package/llvm-project/llvm-cmake/llvm-cmake.hash
 create mode 100644 package/llvm-project/llvm-cmake/llvm-cmake.mk
 create mode 100644 package/llvm-project/llvm-libunwind/llvm-libunwind.hash
 create mode 100644 package/llvm-project/llvm-libunwind/llvm-libunwind.mk
 create mode 100644 package/llvm-project/llvm-project.mk
 rename package/{ => llvm-project}/llvm/Config.in (100%)
 rename package/{ => llvm-project}/llvm/llvm.hash (52%)
 rename package/{ => llvm-project}/llvm/llvm.mk (94%)
 delete mode 100644 package/llvm/0001-nfc-Fix-missing-include.patch

-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
