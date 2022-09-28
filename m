Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C86C32771
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 14:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F02D81399;
	Wed, 28 Sep 2022 14:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F02D81399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mq_f0omtOKH5; Wed, 28 Sep 2022 14:28:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E0F78135F;
	Wed, 28 Sep 2022 14:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E0F78135F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9132F1BF368
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA4A980C3A
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA4A980C3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rLkdsw_TvFQW for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 14:28:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F60080C0A
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2059.outbound.protection.outlook.com [40.107.249.59])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F60080C0A
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 14:28:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P15MCskDuB1PFA8tX4AE0q0YU8Untp8+HJ+49lVzyDeaIPyHH3f/el7O8qFp3RDzvlVo+fsXji84FJwhYckto7yAatSO2roANw9awHcfPCdZL8ypKpr6MIcyrYAFBwWeLs9SYwBvu7ACZxJbUr1lMohwubUf3YwpmBOrDLD+nNrfe4m0Y2ixijvxCu6PWl26JSwMv7SdllAixnXsFGuwe3YkF0oPko/bOQZs2frIzjUzyRUxNsvkdCQe1WPS6w3TB4IX0kK1QYAQx0usoyQLVYgeZlqXg27HTmjUdHiTFGPxTr2vJ6YTC3mJJ9Sw+abziya/B205W4fKHL5XoFpwFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1my48K4xobCmd2IA6X2bY370rBhFSjuATb6k59pk6lY=;
 b=XmPUVl9XqsxIeuXi4bwYabFf2zOnL3RPb774teUG6wkA/bTmQzX2xHdzoEVgitfm77WYxlDHs+O4zLmpolX6BKLAKMWSIS+iN7M8rtzpI3GvxZSK99A/14FI+8J60eOo+ek9qsG8ixfXj9lbwspzzkhkrNGWEY2+aKgieE9JQQleHe0Xw2oju3ka6g9QOt/Dhreh7CJQo3ZdcLfhoOH/W3hlqjOIt3lDUbovPHUGeeZeOUwCMkISJlfPMxZQOaVeVV5hQ3qjXQaQ6mfj7B44RpycDj/j7DVoAUNPnj8dEfLC4dQz8uAJTOMCQ1caR12zdN3pVK0UuXpQAELIdQ/nKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:32::11) by
 AS8P190MB1983.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:52f::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.26; Wed, 28 Sep 2022 14:28:28 +0000
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b]) by DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b%5]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 14:28:22 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 00/11] group llvm projects and bump to version 15.0.1
Thread-Index: AQHY00SvFooKXzODH0ivAsTu0SlQbg==
Date: Wed, 28 Sep 2022 14:28:22 +0000
Message-ID: <DB6P190MB04884DE77110D6DED0A835A89F549@DB6P190MB0488.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6P190MB0488:EE_|AS8P190MB1983:EE_
x-ms-office365-filtering-correlation-id: c664ce2f-fea9-40bc-ce8a-08daa15db247
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5arO0hctYCFqDNeWJ4eF62j4qqmF8yMb0yl8WxanYOG+Ap6eZRY5j+2dcjsEamVQyVpaau/F4cs9LdY9HkjEyCojzZSvHzzaBuSKlJ2T+PPPNSrfD8XgkcxmkeAJuyoXm/fh2sBzC0xyQDRymiGH/vfQMiTDd7mnXYEOe/1P25p3IVORNPZr2ovXbmmmWQ+RYDWUf3QLRNZ5WM/JVVoxaHL7tlSJW1OEdJvmfHI9HWt7vlIazqweuIaUHpwDg4k6DN8WVYXizfs8cW5Jd9ORSxK4DM6v/aSnQBaZrcK10QTNlYqsl5wshNeAMNNFYnmdCAcvIdqtE8QGMbtetmblAIiJN16BspPCqePfsQ54xbn1aBdCrtiWaSrgoJCc7ntFd9rwRPEr+keWRTL+E2wq4up2Y+tEajvQXXlqt2+1UrnF8NJV4R+qBW8OAmxEMbPy1IFXZ5BGOW2NazesMDVpmcV4z6h4v5DqkMbRSlTh1bzlaBBV34Ph3oME4xl3yHzFohcKviopSmyKEOGF4DMo3PgRYFKAq8D15XG0XO6HKLggxDvNp0S+iYd+cdA92xNVPfn1Te9rCMV6r8hErWgIhw6ltpku2FSdXSFld1gXqv5N6O0GlGfDvnPimPJVVTYR1zLNRnnkKDqEeXJHKzLsmGqTHDwEFbmtNdSEDRragXZjx330SZyI8IqMQBqAaA0PUhiRcx0JThS4bldE7yn+HKwWuAplEHaYwpDY0nQAHUMxteEQf+tcWpFOXk8XaDU5DmGPWiywXLfwwK7exFK6JQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6P190MB0488.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(366004)(396003)(346002)(136003)(376002)(451199015)(41300700001)(5660300002)(478600001)(52536014)(33656002)(8936002)(38070700005)(2906002)(4326008)(54906003)(86362001)(316002)(91956017)(66946007)(66446008)(8676002)(66476007)(64756008)(66556008)(55016003)(6916009)(122000001)(186003)(76116006)(71200400001)(83380400001)(26005)(7696005)(38100700002)(9686003)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?bZBnKD2AO4McOh9B3NdGaINPecPQTwG9Fn6GldmenB1+ZvqOX/06JMr7ei?=
 =?iso-8859-1?Q?bMYIwqo08N2jNoKuAP3Fyp7i9nm7+tlaSqynwC+yeedajvaCuVTBHzgU9Z?=
 =?iso-8859-1?Q?WqXlts+Jz3mrZZmviJKlicibtCJvVRyTfCJsbvXBLWYlacI0dwTgxA5ULf?=
 =?iso-8859-1?Q?smSeNgOBwZuz9DJCUbu+mViEyKA8dz6jrce4BVgkQ6Tiv7l0ne2ReYaWh/?=
 =?iso-8859-1?Q?oBVqmS4KnPTCmjWnuHcjRoTrctKM0Cb9+r0aTm+icl8QS1u3soR1oJ9Hby?=
 =?iso-8859-1?Q?JVmPUoh0QA7+MJMcb3xDTc/av/rV4m8t6sYeQNZcoNr/jLA0pVRTwW7SuS?=
 =?iso-8859-1?Q?y8cf7Xejj/H+Vc25dgDFYq7JPgdoAwTzOKDEPOTznPNCpkBoaOCjTf81Jh?=
 =?iso-8859-1?Q?foNdKh/NHNsYYVk1WoT4Bqf66yHFdfeFuFIxEMvvIrwb2jem63/RX7dRek?=
 =?iso-8859-1?Q?ggXqx6lsnnYwpaLMyStOqrTCN+PdXIjvKUa98SrPvV0mMAwyuXhS2+RC4Z?=
 =?iso-8859-1?Q?dzmpQCGsWkVUwvkqPn7dOT98WrIAWmugGBH309uYzZkLQ0IKpZKk4xfcfh?=
 =?iso-8859-1?Q?VyiW1hYxCQ0k30BO7uXSAOkUrF2YmTWDB6F8j+xTC+AT3FRZriC5uQSzTu?=
 =?iso-8859-1?Q?Wqjax9bEtIRd48yCjhSmu7y/x+WLuZK12CY4A1J9XjPd0OODGcl1dTIzMu?=
 =?iso-8859-1?Q?zi0OWiC8zQWNlZgxT9M2TUebZ8xb9B+ak/p0fng8sCU6RTgdmEGk0Pv4tZ?=
 =?iso-8859-1?Q?4mePzIsnjDLCzhohwViRM7/xDOZrG7aDl/IYCFY8POVQjJkowiT3vhdDxR?=
 =?iso-8859-1?Q?x3GbkYQYQ5Fx9lMAjFJ1eTmZF56QqZR8vm5QDV2Nikc4ZxwiS1NWn20QAP?=
 =?iso-8859-1?Q?J6ZVbP4tYTrpjEYM+e5J2vF1c3XdycfbBe132HdkH9VVb7JL7ZLryuQ5cy?=
 =?iso-8859-1?Q?IaM4vlo/XPOg5O97hCOI7Fvy40Wx90ab08Qy59SOMZzA8TqNLNYjxl5V6a?=
 =?iso-8859-1?Q?D2Olvua84NQTiydzACrCfS8/knNqlFfRBGzZJXCwwuMOAxus7p6VmHP2yb?=
 =?iso-8859-1?Q?HqT8poXuEybAczO0XU1smHaVCUYEDkE/7tSyZMNe/ZvGPAJfvstVa+6CiG?=
 =?iso-8859-1?Q?I1jKBvUR2/qTz2kOeLcsC/scvAx52psyQfrwyS4TY4JJYSSYaxoO1VdfNO?=
 =?iso-8859-1?Q?QeJRxIiOA8Yr9FIKUa+q54xd58Dpgvw5IDQA/2gYocYDONXa+XxxFAWVKY?=
 =?iso-8859-1?Q?hHh9tXUvjOr+VIP6LEGsiazId2pC1KGbB+GmNr/a2bX75X5pkqnFKP+Q8X?=
 =?iso-8859-1?Q?ElyenGgNxtVewTJMh1cBh4hsH8oujTmZL9Qu2oAKwYex6UPRamnAWY195l?=
 =?iso-8859-1?Q?+7iCBUSVNk7w5RGpkN3pOgsIzwHMDXeFeAVJ+nBIecD4xYXr/lQ9BvWu0Z?=
 =?iso-8859-1?Q?1tvAEMPMJhYUSLYW2n075DsyY/qCNq1B8n09PQj0OJsgx0634I8LAE+6QJ?=
 =?iso-8859-1?Q?c9biLKHmYx6wgbl5C8jztk5RO0gN679DtVZ+tB5dtWJKvqGv3eYNamHfcs?=
 =?iso-8859-1?Q?9uNXS9t0q+f0p3FbDLWia0psS6Wo+bNaFumPCWAhybdYvFQXaVNNsIAWOs?=
 =?iso-8859-1?Q?kt0XRbBK+6gBA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c664ce2f-fea9-40bc-ce8a-08daa15db247
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 14:28:22.0958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uw3IX/+x39slxStcrIl2AZNbGgaRP6xM5NTqtlmIzVAf63CQyLSXweA3GdCorCf0gLtpyV6qRhEFgJ2ngtrl0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P190MB1983
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1my48K4xobCmd2IA6X2bY370rBhFSjuATb6k59pk6lY=;
 b=FgD/3xs0BRaMs2wLKVLOHNd9TIPuuwkke92JaHNhL+aKQvnMrbaBdO4Qs+rwH9/LcopltEiYeghcdSxY3X26dpFoEJSNsgEXx4iFVR/dFF8YcshCq5StACKZUaO0p9Bq3xBr9hLSeLxGgvX4ikYyVZlDJoB5jpuoJjMFH0rBfqc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=FgD/3xs0
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 00/11] group llvm projects and bump to version
 15.0.1
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

- Bump the version to the latest 15.0.1

Starting with version 12 different subprojects added
dependencies or sources that would be available when
building from the "monorepo". These have been added
as new host packages.

Daniel Lang (11):
  package/llvm-project: new group for llvm packages
  package/llvm: move to llvm-project folder
  package/lld: move to llvm-project subfolder
  package/clang: move to llvm-project subfolder
  package/compiler-rt: move to llvm-project subfolder
  package/llvm-project/llvm-cmake: new package
  package/llvm-project/llvm-libunwind: new package
  package/llvm-project: bump to version 15.0.1
  package/spirv-llvm-translator: bump to version 15.0.0
  package/libclc: move to llvm-project subfolder and bump to 15.0.1
  DEVELOPERS: add Daniel Lang for llvm-project

 DEVELOPERS                                    | 21 ++++++++-------
 package/Config.in                             |  6 ++---
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
 .../spirv-llvm-translator.mk                  |  6 ++---
 28 files changed, 100 insertions(+), 88 deletions(-)
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
