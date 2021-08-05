Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD74C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:31:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D90960E53
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 10:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D90960E53
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=theobroma-systems.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04F814026F;
	Thu,  5 Aug 2021 10:31:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R_8ojq4yCcKv; Thu,  5 Aug 2021 10:31:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF0704027A;
	Thu,  5 Aug 2021 10:31:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34B971BF853
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23ABA83083
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 10:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hCJqCTzN1Dhd for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 10:31:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DD5782B61
 for <buildroot@busybox.net>; Thu,  5 Aug 2021 10:31:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIRhJUA6b4a5h34W+jLMfN0gofvmbGYGmExpk7g96LcAPxNwdlNwMp0GCfS/FLUi61S/956skzOCTHfAPeAWYG3BInK96PFITjWu5xRC4S5pHTcxhvewnS/gAm3CzWxh9NJQ8pm/Ezvl6RDzCKdgtBmeUqigqvkKUGayD2GK4mO7lW25xez/sXV6lYrGDQT3q0YoSCCPyHDrC/+/Bjb/ykphneiG7VE7+MZdz2tac4UrvG4jZwAaDNjHFeCO42nYCuU3pUF21PH93S3mc0XE/Xgl2zsr46AzHNCQvdheoB/X9AYyaRc+pVPcs1Kf9VcdBVpEOKSUWdV/SG9sHQlKUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MI1V7+dRUof7Tb10+gVUhQ9jrCEQux/Gk1SpFFBIJz8=;
 b=T3pUkMYtlDsvN3Ar5E4HuNpeRU34zjCzMVb6MB7G3ZDKlswCOIdEute/sQHsBgpk82IBDGwU2Fc1BYbJSmxs1SyQ7Z+x6bd8KVvzewH99BZdlkVRzp8iWeNSgkddglbMBVVGZvDnoVqgSikasHjy+4GUrXVajmLz6OtlMfM2lReui4c0O54N7wtiw8FWQ/sAJeoVy6zArxgM+PBrArXEAT/CWDZ9nGDCSbYY9bHWOX46Hps7CC2QyeTpBxIOhOuAxc67JEVJAZhA7lASD2yG73ejTB8CE8T8Jzsc5EnA5J1Jk5mreIi2uGz7Y/hgVAD53S9Ng8A0TuRnznz6v8a/Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MI1V7+dRUof7Tb10+gVUhQ9jrCEQux/Gk1SpFFBIJz8=;
 b=shz5BIh3d999ZoxODOqKvxkeIIm/EAPxgEX9y46QBjF32UivRgMKbxOVNKVAJR6XU75glymlf6LMP9yniZ1wpngLNAqBBdVIReVdPKz+XN6Vslz+xlw4/0zSfczTpe9d5Y/6loo6c5rwSe1UkXvnigti3+eMIXDDmD1sGE+4Abs=
Authentication-Results: busybox.net; dkim=none (message not signed)
 header.d=none;busybox.net; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB7154.eurprd04.prod.outlook.com
 (2603:10a6:208:19f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Thu, 5 Aug
 2021 10:31:26 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::459d:3240:1c4e:b920%6]) with mapi id 15.20.4394.016; Thu, 5 Aug 2021
 10:31:26 +0000
Date: Thu, 5 Aug 2021 12:31:24 +0200
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: buildroot@busybox.net
Message-ID: <20210805103124.tnyy4uqurvngvq5g@fedora>
Content-Disposition: inline
X-ClientProxiedBy: FR3P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::23) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by FR3P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.4 via Frontend
 Transport; Thu, 5 Aug 2021 10:31:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20b37559-ed80-4c1c-1621-08d957fc2de5
X-MS-TrafficTypeDiagnostic: AM0PR04MB7154:
X-Microsoft-Antispam-PRVS: <AM0PR04MB71541CA0F93407F05761CAB8C2F29@AM0PR04MB7154.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CHxH/UVDyDUwqRK6OSumufj8vb77RUMgOXmwINNUgX3XAF/j9uWcllhaN9p1iUbJu/bh26N0cmGk0LZdtiZs4rt53XVdFZxqG9ZiIOui/Rc4ibxbNfJSJ2OTTqGItgJlbdggi599+kVOZBStgfUKyVa2JlSDaH5RkPqro38k+a9F8KCGMEmb4z4kyU8qMgShLWwz720JCDZJZCnY5SgxoFWbuPXOkWBPOaltn6fjqrBlItdAZgH0VOXmFVS+T4mBipUSZEY4gOVAF5T95sNcyX9XDzgmWmEbgmUqzGpUzJdOmcTnBwYVGk5YdwXWVbzbZZ38jZO6ThrUjwGMCRWkjDPjIF6WPfXqhDXUwBBwFqnLZYC0WIBXWAjqIH6JPc+zCni67bzDMePRTQZje3aiGtb/QhrSJKyKw2i4BNpxNtV+ua6oGkAy1IIe9xVIQIQUzrDFVROj4t568OZq4hSzvrO9aB9Ku8Nm/EumKdCp+06IrUPR+qnceFoiEqwvcQ3SaiRLIOptOQtZOO3VGsa3OlNqt6qID7zCWwwJNy3/GxG76Hk2RbqLE6pX0RVFIN+BDFrrtE2mtNVeJkm+cI709nzhaGcYeusJtdAl1z/CUgHkkOH6BLXQ5UMVXfNervs34Ds10ksMPWUC4whCrb46Sx+kAdNuY9KdUwCoD6fLe6gJo5D58ar+ivplNdDVDXS0gP+W9gwZcZt2DEpWDjmCt1g0+sGIHZ9i7MawqAkCM+GpWvPzFwGQ1QotIadfiGw9RTC5mBbk2h3GkNvt1NAQlg816yXiLWr3+ElrIMWfw1GRrYZhn6pzK6043NKq2Z3L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR0402MB3348.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(136003)(39840400004)(396003)(366004)(966005)(9686003)(478600001)(55016002)(33716001)(30864003)(66946007)(1076003)(8936002)(8676002)(6496006)(66556008)(83380400001)(66476007)(52116002)(6916009)(38350700002)(5660300002)(316002)(186003)(2906002)(26005)(9576002)(86362001)(38100700002)(956004)(4326008)(44832011)(42413003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LZrYo/B4en/pvwVLokUuyEd+RdtfDNFt/+yaYPoJQv7CI8XpkwPkAGp7WcLV?=
 =?us-ascii?Q?y0bnQd5E5flb9FhYnZu0H5ffpsUQttIU8Tf+gD/xMU1N2hB3SQqr3bYQ3Qlz?=
 =?us-ascii?Q?jpEocWSoa9A5YQsXvj+xUVo/7mjhLXkfIGTtZ0nuZW0d0iSJ8sqCzhG8OvPP?=
 =?us-ascii?Q?34d0ZfXClosK/vzyRJ9Yy5weewmjDwZOMYtUvzq1iYeAaJdd+nasFzKsaCLG?=
 =?us-ascii?Q?PGCvha+yfmsvHRp19v5HOsX2+h6r+zFW6c9SzsiXnrhL/jZ+egfnjovOU9ux?=
 =?us-ascii?Q?WZCyhf45zNFz5/5j1vqqlfPfZPyEUSqutGwgqNTpVSyEGYU1M/VcPlyxotW3?=
 =?us-ascii?Q?i01n5PttkJdLy9gkomVDffgiJpd5cnDrnp+g3E6ifkruX+x+15sI5355/0NF?=
 =?us-ascii?Q?lIk0xtvsdSH3IueiM2nk7KFrUk1pINBhoXp0WwaDCjES5Auy0mGbjO9ebIKW?=
 =?us-ascii?Q?UfndfJsV+c/Cvuf0c1ghMtC1dIFaIarSTiRwtMHdK77ncByXavFoK2c5TqwV?=
 =?us-ascii?Q?amIX8eoqjsIWjENg8EoPlq2TV4HMKXxlPiAGz+H7Z9V3ijALZSoTtznnY2/j?=
 =?us-ascii?Q?nj7d7VJK9QfIZQrVl5PfQT9Gn9jAkRVwnYwunLEVPorAEFjwsm3ElmO49yiC?=
 =?us-ascii?Q?DrrRH0yFHsqQw/t2ZCiIrKCzrnQXhFJhmk4NoKVvbI9dZnhfOZi32CjglUG6?=
 =?us-ascii?Q?8lIascdamcyzqOeyXnPlxb3/inE3NF5LMYgcG99sLRIj6llRPSOE11L47APb?=
 =?us-ascii?Q?e0NOmJRQeWwicMVV3XLN1EyzA+yCqKak4JmfAPEH5fq1j7MzAXHNiYftv0k9?=
 =?us-ascii?Q?VubIiwUUpeD/dqG8O+fz8kfmuBjCIpHWnhxA9Wu5uB5ZL4h1tzzFSwkWYOcC?=
 =?us-ascii?Q?Yjw5FoqvJ51peStb2F8oDAzDJipxP6KspcGFwjrs+uvmer3fvW42sJ/J4Rm8?=
 =?us-ascii?Q?2iAEzjuKxvBLg7B1aBOuLZmnj7VHSAD0Epf6ExdBEzTxD9AKGABgOBEIQQPL?=
 =?us-ascii?Q?iBMi3cvb5nsTidSrmli7JLR2mSBsx3ln2uGpA6jhbs5YvPvO0o+9fuoiuFBC?=
 =?us-ascii?Q?ZWLYSOKpNobIkL2K6FM4XlIicdyp2jr8rFWGYMpYR6bkGtmFZzDarIA7WZB6?=
 =?us-ascii?Q?yn32lj2y+3RXUs3eTkllEwi1MF6NHYWlfFX3GgIlyxAUziw+OARiw7SLJ7He?=
 =?us-ascii?Q?v/T7IKgFdLq9T4n1MBRUP5L5Ozlus8Wfe+dA/QuBBv8HTf2r4zDrQ8rhJlTy?=
 =?us-ascii?Q?KsS5e4D3n634y9Y0Je44mlMuWIh7MXo+LJEv2FSUKygqnVR5gs+i1Otnhymq?=
 =?us-ascii?Q?glWARquuN84RmF5rc4M1mI+l?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b37559-ed80-4c1c-1621-08d957fc2de5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 10:31:26.3902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqT8hb8s1bD3EYTXPjkBJoNHfcKnjF47aN4iZqBP+TVl/iXUA49hOqU+vF3Lrlv2vGDQK+5YipOy2J8NTh5fJvlkkVKd07fM77ubEAHTIgSokrFDREPp3n0eIkONhV2+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7154
Subject: [Buildroot] [BUG] qt5declarative not building on host distro
 without libatomic.so
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: ps.report@gmx.net, yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi all,

I've been trying to compile qt5declarative from the master branch of
Buildroot (8d56423d3d2308c620e61a952e36999c89e4d682
"package/zstd: observe Buildroot optimisation flags") on Fedora 34 without
success.

Here's the log:

```
>>> qt5declarative 5.15.2 Building
PATH="/home/qschulz/work/upstream/buildroot/output/host/bin:/home/qschulz/work/upstream/buildroot/output/host/sbin:/home/qschulz/.local/bin:/usr/lib64/ccache:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/qschulz/bin"  /usr/bin/make -j9 -C /home/qschulz/work/upstream/buildroot/output/build/qt5declarative-5.15.2/
make[1]: Entering directory '/home/qschulz/work/upstream/buildroot/output/build/qt5declarative-5.15.2'
/home/qschulz/work/upstream/buildroot/output/host/bin/qmake -o Makefile qtdeclarative.pro -spec devices/linux-buildroot-g++

Running configuration tests...
Done running configuration tests.

Configure summary:

Qt QML:
  QML network support .................... yes
  QML debugging and profiling support .... yes
  QML just-in-time compiler .............. yes
  QML sequence object .................... yes
  QML XML http request ................... yes
  QML Locale ............................. yes
Qt QML Models:
  QML list model ......................... yes
  QML delegate model ..................... yes
Qt Quick:
  Direct3D 12 ............................ no
  AnimatedImage item ..................... yes
  Canvas item ............................ yes
  Support for Qt Quick Designer .......... yes
  Flipable item .......................... yes
  GridView item .......................... yes
  ListView item .......................... yes
  TableView item ......................... yes
  Path support ........................... yes
  PathView item .......................... yes
  Positioner items ....................... yes
  Repeater item .......................... yes
  ShaderEffect item ...................... yes
  Sprite item ............................ yes

Qt is now configured for building. Just run 'make'.
Once everything is built, you must run 'make install'.
Qt will be installed into '/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr'.

Prior to reconfiguration, make sure you remove any leftovers from
the previous build.

cd src/ && ( test -e Makefile || /home/qschulz/work/upstream/buildroot/output/host/bin/qmake -o Makefile /home/qschulz/work/upstream/buildroot/output/build/qt5declarative-5.15.2/src/src.pro -spec devices/linux-buildroot-g++ ) && /usr/bin/make -f Makefile
make[2]: Entering directory '/home/qschulz/work/upstream/buildroot/output/build/qt5declarative-5.15.2/src'
/home/qschulz/work/upstream/buildroot/output/host/bin/qmake -o Makefile src.pro -spec devices/linux-buildroot-g++
cd qmltyperegistrar/ && ( test -e Makefile || /home/qschulz/work/upstream/buildroot/output/host/bin/qmake -o Makefile /home/qschulz/work/upstream/buildroot/output/build/qt5declarative-5.15.2/src/qmltyperegistrar/qmltyperegistrar.pro -spec devices/linux-buildroot-g++ ) && /usr/bin/make -f Makefile
make[3]: Entering directory '/home/qschulz/work/upstream/buildroot/output/build/qt5declarative-5.15.2/src/qmltyperegistrar'
/home/qschulz/work/upstream/buildroot/output/host/bin/qmake -o Makefile qmltyperegistrar.pro -spec devices/linux-buildroot-g++
g++ -c -pipe -std=c++11 -fno-exceptions -Wall -Wextra -ffunction-sections -fdata-sections -D_REENTRANT -fPIC -DQT_NO_LINKED_LIST -DQT_NO_LINKED_LIST -DQT_NO_JAVA_STYLE_ITERATORS -DQT_NO_CAST_TO_ASCII -DQT_NO_CAST_FROM_ASCII -DQT_NO_NARROWING_CONVERSIONS_IN_CONNECT -DQT_USE_QSTRINGBUILDER -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -DQT_BOOTSTRAP_LIB -DQT_VERSION_STR='"5.15.2"' -DQT_VERSION_MAJOR=5 -DQT_VERSION_MINOR=15 -DQT_VERSION_PATCH=2 -DQT_BOOTSTRAPPED -DQT_NO_CAST_TO_ASCII -I. -I../../tools/shared -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore/5.15.2 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore/5.15.2/QtCore 
 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtXml -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtXml/5.15.2 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtXml/5.15.2/QtXml -I/home/qschulz/work/upstream/buildroot/output/host/mkspecs/devices/linux-buildroot-g++ -o .obj/resourcefilemapper.o ../../tools/shared/resourcefilemapper.cpp
g++ -c -pipe -std=c++11 -fno-exceptions -Wall -Wextra -ffunction-sections -fdata-sections -D_REENTRANT -fPIC -DQT_NO_LINKED_LIST -DQT_NO_LINKED_LIST -DQT_NO_JAVA_STYLE_ITERATORS -DQT_NO_CAST_TO_ASCII -DQT_NO_CAST_FROM_ASCII -DQT_NO_NARROWING_CONVERSIONS_IN_CONNECT -DQT_USE_QSTRINGBUILDER -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -DQT_BOOTSTRAP_LIB -DQT_VERSION_STR='"5.15.2"' -DQT_VERSION_MAJOR=5 -DQT_VERSION_MINOR=15 -DQT_VERSION_PATCH=2 -DQT_BOOTSTRAPPED -DQT_NO_CAST_TO_ASCII -I. -I../../tools/shared -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore/5.15.2 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore/5.15.2/QtCore 
 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtXml -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtXml/5.15.2 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtXml/5.15.2/QtXml -I/home/qschulz/work/upstream/buildroot/output/host/mkspecs/devices/linux-buildroot-g++ -o .obj/qmlstreamwriter.o ../../tools/shared/qmlstreamwriter.cpp
g++ -c -pipe -std=c++11 -fno-exceptions -Wall -Wextra -ffunction-sections -fdata-sections -D_REENTRANT -fPIC -DQT_NO_LINKED_LIST -DQT_NO_LINKED_LIST -DQT_NO_JAVA_STYLE_ITERATORS -DQT_NO_CAST_TO_ASCII -DQT_NO_CAST_FROM_ASCII -DQT_NO_NARROWING_CONVERSIONS_IN_CONNECT -DQT_USE_QSTRINGBUILDER -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -DQT_BOOTSTRAP_LIB -DQT_VERSION_STR='"5.15.2"' -DQT_VERSION_MAJOR=5 -DQT_VERSION_MINOR=15 -DQT_VERSION_PATCH=2 -DQT_BOOTSTRAPPED -DQT_NO_CAST_TO_ASCII -I. -I../../tools/shared -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore/5.15.2 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore/5.15.2/QtCore 
 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtXml -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtXml/5.15.2 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtXml/5.15.2/QtXml -I/home/qschulz/work/upstream/buildroot/output/host/mkspecs/devices/linux-buildroot-g++ -o .obj/qmltyperegistrar.o qmltyperegistrar.cpp
g++ -c -pipe -std=c++11 -fno-exceptions -Wall -Wextra -ffunction-sections -fdata-sections -D_REENTRANT -fPIC -DQT_NO_LINKED_LIST -DQT_NO_LINKED_LIST -DQT_NO_JAVA_STYLE_ITERATORS -DQT_NO_CAST_TO_ASCII -DQT_NO_CAST_FROM_ASCII -DQT_NO_NARROWING_CONVERSIONS_IN_CONNECT -DQT_USE_QSTRINGBUILDER -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -DQT_BOOTSTRAP_LIB -DQT_VERSION_STR='"5.15.2"' -DQT_VERSION_MAJOR=5 -DQT_VERSION_MINOR=15 -DQT_VERSION_PATCH=2 -DQT_BOOTSTRAPPED -DQT_NO_CAST_TO_ASCII -I. -I../../tools/shared -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore/5.15.2 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore/5.15.2/QtCore 
 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtXml -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtXml/5.15.2 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtXml/5.15.2/QtXml -I/home/qschulz/work/upstream/buildroot/output/host/mkspecs/devices/linux-buildroot-g++ -o .obj/qmltypesclassdescription.o qmltypesclassdescription.cpp
g++ -c -pipe -std=c++11 -fno-exceptions -Wall -Wextra -ffunction-sections -fdata-sections -D_REENTRANT -fPIC -DQT_NO_LINKED_LIST -DQT_NO_LINKED_LIST -DQT_NO_JAVA_STYLE_ITERATORS -DQT_NO_CAST_TO_ASCII -DQT_NO_CAST_FROM_ASCII -DQT_NO_NARROWING_CONVERSIONS_IN_CONNECT -DQT_USE_QSTRINGBUILDER -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -DQT_BOOTSTRAP_LIB -DQT_VERSION_STR='"5.15.2"' -DQT_VERSION_MAJOR=5 -DQT_VERSION_MINOR=15 -DQT_VERSION_PATCH=2 -DQT_BOOTSTRAPPED -DQT_NO_CAST_TO_ASCII -I. -I../../tools/shared -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore/5.15.2 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore/5.15.2/QtCore 
 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtXml -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtXml/5.15.2 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtXml/5.15.2/QtXml -I/home/qschulz/work/upstream/buildroot/output/host/mkspecs/devices/linux-buildroot-g++ -o .obj/qmltypescreator.o qmltypescreator.cpp
g++ -Wl,-O1 -Wl,--gc-sections -o ../../bin/qmltyperegistrar .obj/resourcefilemapper.o .obj/qmlstreamwriter.o .obj/qmltyperegistrar.o .obj/qmltypesclassdescription.o .obj/qmltypescreator.o   -latomic /home/qschulz/work/upstream/buildroot/output/host/lib/libQt5Bootstrap.a -lpthread  -lrt -lpthread -ldl
/usr/bin/ld: cannot find /usr/lib64/libatomic.so.1.2.0
collect2: error: ld returned 1 exit status
make[3]: *** [Makefile:87: ../../bin/qmltyperegistrar] Error 1
make[3]: Leaving directory '/home/qschulz/work/upstream/buildroot/output/build/qt5declarative-5.15.2/src/qmltyperegistrar'
make[2]: *** [Makefile:57: sub-qmltyperegistrar-make_first-ordered] Error 2
make[2]: Leaving directory '/home/qschulz/work/upstream/buildroot/output/build/qt5declarative-5.15.2/src'
make[1]: *** [Makefile:50: sub-src-make_first] Error 2
make[1]: Leaving directory '/home/qschulz/work/upstream/buildroot/output/build/qt5declarative-5.15.2'
make: *** [package/pkg-generic.mk:270: /home/qschulz/work/upstream/buildroot/output/build/qt5declarative-5.15.2/.stamp_built] Error 2
```

On Fedora 34 (probably 33 and earlier too), gcc package does not bring
libatomic so it is absent from the host rootfs.

```
$ find /usr -name "libatomic.so*"
/usr/lib/gcc/x86_64-redhat-linux/11/32/libatomic.so
/usr/lib/gcc/x86_64-redhat-linux/11/libatomic.so
$ cat /usr/lib/gcc/x86_64-redhat-linux/11/libatomic.so
INPUT ( /usr/lib64/libatomic.so.1.2.0 )
```

After installing libatomic from the package repository (c.f.
https://fedora.pkgs.org/34/fedora-updates-x86_64/libatomic-11.2.1-1.fc34.x86_64.rpm.html)
qt5declarative builds just fine.

In a (successful) build done on Debian Buster, I can see that qmltyperegistrar
is supposed to be built for the host.

Here are the .pro and resulting Makefile:

```
$ cat src/qmltyperegistrar/qmltyperegistrar.pro
option(host_build)

QT       = core-private
DEFINES += QT_NO_CAST_TO_ASCII QT_NO_CAST_FROM_ASCII

QMAKE_TARGET_DESCRIPTION = QML Types Registrar

include(../../tools/shared/shared.pri)

SOURCES += \
    qmltyperegistrar.cpp \
    qmltypesclassdescription.cpp \
    qmltypescreator.cpp

HEADERS += \
    qmltypesclassdescription.h \
    qmltypescreator.h

build_integration.files = qmltypes.prf
build_integration.path = $$[QT_HOST_DATA]/mkspecs/features

prefix_build {
    load(qt_build_paths)
    qmltypes_to_builddir.files = qmltypes.prf
    qmltypes_to_builddir.path = $$MODULE_BASE_OUTDIR/mkspecs/features
    COPIES += qmltypes_to_builddir
    INSTALLS += build_integration
} else {
    COPIES += build_integration
}

load(qt_tool)

# cat src/qmltyperegistrar/Makefile
#############################################################################
# Makefile for building: ../../bin/qmltyperegistrar
# Generated by qmake (3.1) (Qt 5.15.2)
# Project:  qmltyperegistrar.pro
# Template: app
# Command: /home/qschulz/work/upstream/buildroot/output/host/bin/qmake -o Makefile qmltyperegistrar.pro -spec devices/linux-buildroot-g++
#############################################################################

MAKEFILE      = Makefile

EQ            = =

####### Compiler, tools and options

CC            = gcc
CXX           = g++
DEFINES       = -DQT_NO_LINKED_LIST -DQT_NO_LINKED_LIST -DQT_NO_JAVA_STYLE_ITERATORS -DQT_NO_CAST_TO_ASCII -DQT_NO_CAST_FROM_ASCII -DQT_NO_NARROWING_CONVERSIONS_IN_CONNECT -DQT_USE_QSTRINGBUILDER -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -DQT_NO_DEBUG -DQT_BOOTSTRAP_LIB -DQT_VERSION_STR='"5.15.2"' -DQT_VERSION_MAJOR=5 -DQT_VERSION_MINOR=15 -DQT_VERSION_PATCH=2 -DQT_BOOTSTRAPPED -DQT_NO_CAST_TO_ASCII
CFLAGS        = -pipe -std=gnu11 -fno-exceptions -Wall -Wextra -ffunction-sections -fdata-sections -D_REENTRANT -fPIC $(DEFINES)
CXXFLAGS      = -pipe -std=c++11 -fno-exceptions -Wall -Wextra -ffunction-sections -fdata-sections -D_REENTRANT -fPIC $(DEFINES)
INCPATH       = -I. -I../../tools/shared -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore/5.15.2 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore/5.15.2/QtCore -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtXml -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtXml/5.15.2 -I/home/qschulz/work/upstream/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/qt5/QtXml/5.15.2/QtXml -I/home/qschulz/work/upstream/buildroot/output/host/mkspecs/devices/linux-buildroot-g++
QMAKE         = /home/qschulz/work/upstream/buildroot/output/host/bin/qmake
DEL_FILE      = rm -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p
COPY          = cp -f
COPY_FILE     = cp -f
COPY_DIR      = cp -f -R
INSTALL_FILE  = install -m 644 -p
INSTALL_PROGRAM = install -m 755 -p
INSTALL_DIR   = cp -f -R
QINSTALL      = /home/qschulz/work/upstream/buildroot/output/host/bin/qmake -install qinstall
QINSTALL_PROGRAM = /home/qschulz/work/upstream/buildroot/output/host/bin/qmake -install qinstall -exe
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
TAR           = tar -cf
COMPRESS      = gzip -9f
DISTNAME      = qmltyperegistrar5.15.2
DISTDIR = /home/qschulz/work/upstream/buildroot/output/build/qt5declarative-5.15.2/src/qmltyperegistrar/.obj/qmltyperegistrar5.15.2
LINK          = g++
LFLAGS        = -Wl,-O1 -Wl,--gc-sections
LIBS          = $(SUBLIBS) -latomic /home/qschulz/work/upstream/buildroot/output/host/lib/libQt5Bootstrap.a -lpthread  -lrt -lpthread -ldl
AR            = ar cqs
RANLIB        =
SED           = sed
STRIP         = strip
[...]
```
[full makefile can be found here: https://paste.ack.tf/a77eed]

From the logs and also the Makefile, it seems that qmltyperegistrar is
built with the wrong -spec passed to qmake. It should be
common/g++-base.conf (or something similar) and not
devices/linux-buildroot-g++ as currently.

This is confirmed a bit later in the Makefile with `-latomic` making it to LIBS
which might not be what's wanted?

This `-latomic` was added in
7d286be4f96cfb731e184c3e8cfea27a031bde3c "package/qt5base: link with -latomic when needed".

Here's the minimal defconfig I used to reproduce the issue:
```
BR2_aarch64=y
BR2_cortex_a35=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5DECLARATIVE=y
```

Let me know if there's anything I can do to help,
Thanks,
Quentin
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
