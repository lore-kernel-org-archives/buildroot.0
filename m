Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84389C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 06:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15F2E80D37;
	Tue, 25 Oct 2022 06:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15F2E80D37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EoW2aihwM4v8; Tue, 25 Oct 2022 06:09:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 435A880BCE;
	Tue, 25 Oct 2022 06:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 435A880BCE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB9A31BF2BB
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4BBD402C2
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:09:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4BBD402C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PNNFiKXK17BH for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 06:09:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9915C40290
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2068.outbound.protection.outlook.com [40.107.20.68])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9915C40290
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 06:09:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VODlqMb6QmQTLBrGiryT0eBWZSySJoMsCtP720hOHmft3SUjIdJ+h0MJ5cOodzOUvIUbzXowBUfECwudtE86+dcorU1aMo+9kasojQNvrdVDsiIhn4MUqvnU/DOinlJXH242tMpN5flvehdfALzOKfrZWOaMM/W25NkHxcJwUpHqtD+rqRrnO1SIlRTO+yDnXhLk7ziXN/g372TSSJO6Sv1kE4nC+30Ng+bZ5O/SyHIuBLDVOmtkxEe2nZVL7oXrrTn2EB44TA2m8uvrIk+4wfXZId46EqHYX6lk76VUd7lieDvauHAu4mphjBr5/mnZgDIatV2t4d44l5IcFQE9tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRGi1Z+HKtYVr5hFIevOGP4BgzjTekwSP7FS9lgJ6Pg=;
 b=hcNubmpVJV6n5sSNr1OuRe94Ax0dhfCrHXKl+6hpV1u0f2ySLgVDTNd/HrE9SwkstGGgE8Zk6UErZFeqzUwP45Ywc7DRFm9cdBbpI1c/lsTmhOwHH3Tos8Y8t4PLs4/5gvIxqt2DdgtJEshHnR3w7vUqMvatpy/jFmn3xY5v3fZJK4kM64LoeUsPx9lQNvNAJ+Vu0jjdypnHM/jSiCSQohXMBnjeG32uGYzurusYsHWUjkswJuRAyqaSIkcwTEBfzygB6GXp0sszdyj08eRpXttM4gcP8fKv+NTVy6LDSxifOUXw4neBIZBEVLhR6TpQNWu3a6z3Vg2Hfkb3hJF3XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DU0P190MB1803.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:34b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Tue, 25 Oct
 2022 06:09:17 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1%7]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 06:09:17 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 06/11] package/llvm-project/llvm-cmake: new package
Thread-Index: AQHY6DegS4J2W3ltjUWy6GqWf6gYKA==
Date: Tue, 25 Oct 2022 06:09:17 +0000
Message-ID: <VI1P190MB0493D84A675F9D98209AE5229F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DU0P190MB1803:EE_
x-ms-office365-filtering-correlation-id: fe8a1aab-fd02-424c-8a83-08dab64f72c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 707NXHjQKA6KjLb5kFs4TTjo7Jc++jUc0X8lfsOVA/OzQKl3hM87pGqnyqDeCX/8WpvhQgSsRhcjM9jRQ10GMi+HdCFemLLW3vnzoFpjE24cb2NYKsYhXFohSCg3H4R+rAUw3Q1tv8uYOoe7sv4dh2GVPKbKmbYkgqfrQa8e5JQowtkA0Ei1GiEg4/61q1DnGrNJLdA03X5pYs9+g2A4OdN4eQ/9/B+gBTy792rhLee+Jv7JZUBEFLOJeDbmWJuOFd2XXhNl0HidNeFmWxBHO2j8XXr29+krmL9RcggWHbrcFyzJCLnqHeQmgnLeN+eKvIgVqaLf7ze6li2d8hHJu+LZGRGjCNbSu9egnhzZr3Z3ygnwdWdyYe9Cgm5iho1gc1c3/5SXXYEUMgHwPA7GoubYHGyq9MhO3tuGNY71iHSRx5KpIff1ydR9KzZE2ut8PQFpXqPkz5TmB7GJZKKp9AVPC1Jzsqm1DKrYE5q73VUueL94RRKZk8rzVYnilc/fCqgf+BtlOCOihmG1CbZc3KNd9aFSaAWB3JRtz1Sc2jcAztBzhq9uv4MRwY0UKQFdwtCWt3amSVovNi8CBWtUuX21oBkvUG3k+ZyD7hxqwuk1gWnWppkQRmuQWT+zMnXoPqAKRKArgRqWsqSo7snOg4XpYcN5eauKm1BXfTO4IG9GNDkUGpssRwDn4oHSHhP7PpYZGsmbKZg2magu0dB4X/dDJRwDG/5fk0WDNNK+CSBxW05PTAZElata8A6q6ggLzWStkLYEqueZm60G5IoYFQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(39840400004)(376002)(396003)(346002)(451199015)(8936002)(41300700001)(52536014)(5660300002)(9686003)(6916009)(66476007)(26005)(76116006)(66556008)(8676002)(64756008)(66446008)(54906003)(4326008)(6506007)(7696005)(316002)(38070700005)(2906002)(66946007)(33656002)(186003)(55016003)(38100700002)(122000001)(86362001)(478600001)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Jqx5pARMTtzdtBA/S/TbDgvvdYUERJ7FUtAI0FaBTbLQF0VUmhLPqWH5J/?=
 =?iso-8859-1?Q?xaerJFcgd1lk9tmZqLS5wQSK7em7joZMtWFeT9DzrzmHEJtQfFpZ2U8ahh?=
 =?iso-8859-1?Q?tzCOkLH61QpkkViEFz4AX7iZ98UiaotYfYuMMxbzilnuS9eqNkwjcl1sFB?=
 =?iso-8859-1?Q?+jwv65mIACsuA/SvyUw866tm63f8ju8wsMiVJIHbcwvUdVMzXUtDmZhIgy?=
 =?iso-8859-1?Q?Fii6S6oTMRgVot9jjBzm2VZ0iYd/ZmKR1KFCaokDLwhLhPvoJmcCspZvIB?=
 =?iso-8859-1?Q?dtsLV9ip8xSFRjG05Si+6VDwVHC282DZo+57k4/v98JeWxgFRre8OlhWu4?=
 =?iso-8859-1?Q?jAE1YFI8upRmUhKVL9pqstY0a38TUkaw6sHmLngQp5Ok7mY6bsqavZXJkt?=
 =?iso-8859-1?Q?QCGq8lkoCGs3Ph//Tjx6ndZtibmxJhgD/G8MQcUktVl3uV5PJ4+K/szx6O?=
 =?iso-8859-1?Q?JzDb+2oNrQHjszzjWPpOcO0iW1XbJsjx27A7q/nsnpnf0+iWfdvE8HXIOT?=
 =?iso-8859-1?Q?OJrwp1uhwiBRa9PpPmbghfFFmpN//A1USsGOKDv/agrqELhQa18S6Y7zPm?=
 =?iso-8859-1?Q?Wu87dI8VP7LQG8FNxkmxigoIx+8BNmTHv5vW4QsEtwEKluXXpx1JI9xbLG?=
 =?iso-8859-1?Q?5lBG4rBaRddK8mj/FFSTFEVfzhaLI6dGHObBAy3Opnvt2iEkENSXAZ/3Gs?=
 =?iso-8859-1?Q?yiZsS3QGp6LKlGdWYYAIUtZ3SbtgP4V5mvPRpmJ8/o3slUSQc19+LBl7tv?=
 =?iso-8859-1?Q?XkB77XaRztEF5W6BgDkryNeQl07rw8nufHw1wIiV2tei0T1QKnyd12E0ys?=
 =?iso-8859-1?Q?ChJPb9ed3UzcbARGNfDj/WoOz7Fo6w/HPPXKqSkE6Y/KfWiH8ABFQ1sDsy?=
 =?iso-8859-1?Q?Fjwz3hm4uw/ALPxc18nJUOiSdUbTWuJVm03cHRnZcnjq8ewItdiPVzfr1p?=
 =?iso-8859-1?Q?9iQ2P7WjBOLIHrVxZ4EylECQbmhCEeCetVSNXlNR2VAiHq6Jk/fMX1zUCl?=
 =?iso-8859-1?Q?R5pmYFCM5di/Pk9pDk90VQ1A8VGYAbiZxVqq30Is3B8dvccimn4qj4PrWw?=
 =?iso-8859-1?Q?FMULqJf73uvdEliKWFmsMwJIPJ/gfzWrh2jUYeUf8CxFaLyskvq0kvajVK?=
 =?iso-8859-1?Q?Wfl+/gf31ffYSsFLysy4vKu8bTSY+0TtrH6uvfFXatUnKKSIdaWtn0ZeQu?=
 =?iso-8859-1?Q?WXhockoJpzSsK4ShXZld5KD97CvyDaNWKQugCt8dUyJI7NqVye/ztr6ges?=
 =?iso-8859-1?Q?k4q69kGO1OxuDxtrF+kAHszjuXNipaCbUUMixbPXAwNKBHyvLnCGsVV+eb?=
 =?iso-8859-1?Q?5t+eptp6pK11BI0Eh7mqByx/h1iiIXCasmjoFGN7Oha7h0NY3YhnOSDZ+T?=
 =?iso-8859-1?Q?OvEuS2I75TueHoGWpDy9DfSM5M8mzA/TVoBTTzKKD3Ks78ai2pOaHVbaed?=
 =?iso-8859-1?Q?oAefu/k92SM0cGyBWXijXxWpt9Q5q7a4QM5FsUxzbUsJ2JvhG866Acws2K?=
 =?iso-8859-1?Q?2X1BneSJju5EliA8FQ+pIOkYOiB3i528oiLCNfCUYDSsqJEfoVXj13Vxfs?=
 =?iso-8859-1?Q?00ByLToPose9C4ezYESz/8efsV0frWysEeC3aMoJWXiRFCOBjJaLI7PJ/8?=
 =?iso-8859-1?Q?h1dvAWqv123RM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8a1aab-fd02-424c-8a83-08dab64f72c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 06:09:17.0254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cLy9CXUO/oRtU2D9BN5OXdSxE2CtidGPFMybVzC/ZYb0IWtj5zxo8dj071oormZ1j01er2DoH4rPb1DJfP+xqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P190MB1803
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRGi1Z+HKtYVr5hFIevOGP4BgzjTekwSP7FS9lgJ6Pg=;
 b=eJbmXFgxSvL18akc3ZXep0fY/+DJxdEK7EYhWyDuR7XhSVXIn81kiex3qQCmKLwO9cfm3rzhBhdO7iz+6Li9SAR7NFeZJRL3Ec6YozRzRWdAgLul5YUpaFJfBTusA9xY8bKzI3BlwVhRrShroWxB3jRx/KxqyYLo9VnfavbwkA4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=eJbmXFgx
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 06/11] package/llvm-project/llvm-cmake: new
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

This is a small host package containing shared cmake modules
that are needed by various projects during configuration.
For example llvm 15 needs it.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/llvm-project/llvm-cmake/llvm-cmake.hash |  2 ++
 package/llvm-project/llvm-cmake/llvm-cmake.mk   | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 package/llvm-project/llvm-cmake/llvm-cmake.hash
 create mode 100644 package/llvm-project/llvm-cmake/llvm-cmake.mk

diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash b/package/llvm-project/llvm-cmake/llvm-cmake.hash
new file mode 100644
index 0000000000..b76013e810
--- /dev/null
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.hash
@@ -0,0 +1,2 @@
+# locally calculated
+sha256  21cf3f52c53dc8b8972122ae35a5c18de09c7df693b48b5cd8553c3e3fed090d  cmake-15.0.3.src.tar.xz
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.mk b/package/llvm-project/llvm-cmake/llvm-cmake.mk
new file mode 100644
index 0000000000..2527b95063
--- /dev/null
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# llvm-cmake
+#
+################################################################################
+
+LLVM_CMAKE_VERSION = $(LLVM_PROJECT_VERSION)
+LLVM_CMAKE_SITE = $(LLVM_PROJECT_SITE)
+LLVM_CMAKE_SOURCE = cmake-$(LLVM_CMAKE_VERSION).src.tar.xz
+
+define HOST_LLVM_CMAKE_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/lib/cmake/llvm
+	cp -Rv $(@D)/Modules/* $(HOST_DIR)/lib/cmake/llvm
+endef
+
+$(eval $(host-generic-package))
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
