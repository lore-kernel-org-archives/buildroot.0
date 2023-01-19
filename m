Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1179EC00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8B65419B1;
	Thu, 19 Jan 2023 10:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8B65419B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qYEHYkVT8e2A; Thu, 19 Jan 2023 10:12:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9053C41972;
	Thu, 19 Jan 2023 10:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9053C41972
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 985671BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F38D4192D
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F38D4192D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ksDSSVyufkKK for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:12:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F212C41942
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2064.outbound.protection.outlook.com [40.107.6.64])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F212C41942
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:12:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3yJ1Ahnkug6/pTrK2/MSFa4afWF3c7e8ASELTyhZ9dNeBCDFY+4ozt714X6ioyxHvc0rfYUPirnohfBkdqAcKFnMSPbbSQlNxpfxOCJK7UouvYPLfGjliJqn3aFXWTAHPs4Uh5Vfj8rw5lkyKuu/aUrwlda8OS8xQEcA50Tav8jJcoachEmkTrisIRvFkqsReAkXZPcXJxkkuiiZFtELalTLF0vHPdbjAhf52sFG737lH2zRSNN6tcRaKZ0e8G4wGR4+K4rsRtnUjsDcgM3KVNtBa98MTURmUvPV5KNhDFcMbc5S/GavC79A9S/dfIC0HCgqnyIvgtaiBDvMWragg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7DwH+CvtKJsqHKAplgrCLQk/lKBphPIuWBGJ0Mmuvo=;
 b=n5u5WJ3k6mWGz1qPZLWQ232vHuItMPvi0vDcwDMPLWEbNsiV1h07fGjrDAX+xBEvqupnJXqCm2ttROHw6JlotcVghjgoA7Q5uABf62qkcyVvG0Uk+wO4j+YGoD4I6ZH/9lvwy+b/bOSr51fXUO/d2Jyatf6rJP5RqIAkbAsqb/b5+IqaLguo3GXp5jtOMHqNMHcM9uoDg7UdUAN8XZDqyLSMeZc5EtxFkTl5foOMRxyh8PDsxBsITyQ1rWiR1CspnxMbE3gkeX//1eT8zPVaH6Vdc3QLCiky4paUZRRXj/Aw252JILOPjnNJCA0itKtvQEtzhuwokxdM1pph6ysx0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM7P190MB0616.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:112::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 10:12:04 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:12:04 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 31/45] package/libmediaart: switch to https download
Thread-Index: AQHZK+11x1D2du0H0kSzl/y65ef1vQ==
Date: Thu, 19 Jan 2023 10:12:04 +0000
Message-ID: <VI1P190MB0493CDD76F748BA0E8F28D449FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM7P190MB0616:EE_
x-ms-office365-filtering-correlation-id: f8b0fe6e-2dc3-41e8-abae-08dafa059cfa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rM2uGOoTUzTiODAAOQTP1ig4XyVhU//QdCOWRSqV6ZnLxY50bpIZWx7grGdYE6FINknHEGimtjnEV3WdJMlOxd7gq8/5XMEKv9UpE+zMVSzvAfb4xlnJ8wT/WD/fvBj+QtDUCIKUxfF0+FagEWRM7nDeDg1FMUMDVxPK6pLiEBdwE8QoUVXPUK8S/C/Sbc3/7E6IMuEfjZfRTr6gL+5GZLqbPM340UFkIpYyrXq7IarBh++/dA6+emfZzHZeq5UJEmIpgx3DZMO1Y5qPaj0vzLCIHMsoqIgpeAsrlKEnnjzOuetgghc1qu2v6WPdWiBfB6BNQVHX0WQ2fswyy2NFNBOa+JBoiq0XzNlrTZhURilA/mQL8eNcKRN5ZSYG3kZqcjQ2AOUOPncMDFD4Tk3aHQFrKnifcs5+hXXXW8rCwT2MgQ/uW0YBSCt45AdE4siayezKF8/mFvtQ2fvnCcUnDc8iXyf3pSpK377IlMqNwHqnMRqZ+7aRenb2FKEZIRB79Vk6rlGh0FW34wLFSCbeT91WeYydDvLZQWsMqISFD+wul/WpbSt/ecoO3LnQhk5IBv/1dBRIhl76tpBFtdiglLahTL1q8YoKAPspLES4XD/vtGugLYhrwvHkrzj8YjS/YgvxK4nl39q5S5iV2ywNUSeqyY/LD7jEgQnuzYkZzExqe01HOBgfYziz480P2GXon6aGJWo9rfMgxD8wvEtL3arBD4Yj9mXY/yO/aJ/+0JQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(366004)(39840400004)(451199015)(66946007)(64756008)(6916009)(33656002)(76116006)(66476007)(26005)(4326008)(9686003)(41300700001)(8676002)(66446008)(186003)(86362001)(66556008)(5660300002)(38100700002)(8936002)(52536014)(55016003)(316002)(83380400001)(6506007)(478600001)(7696005)(2906002)(966005)(71200400001)(38070700005)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2SxUSVhN9DXNy68R9tra/9i/tNgueP1IkrAnxWPKGNRGNaCohE9t6i4hYi?=
 =?iso-8859-1?Q?vzizAfOlDv3pTu2bDB2LjJAPMEEXX2hAulAtp3XIiPLl0Uun+RUH/QGmSn?=
 =?iso-8859-1?Q?yVuc6LKRNjt7xvJ2+GLxZZrl62izceAhu9hkRABjFFrjkT4CpPDrzHUisi?=
 =?iso-8859-1?Q?YQvAWruP7h7v1aLEE6PI72AMtrj5PSJcbLLO464dCcWai6+OywnfsRza/O?=
 =?iso-8859-1?Q?lUWPnqHzQUF2ENP84tJ+ak3hV9ZvnTuTpmFYcf3IBND65Iox0PILFyYngt?=
 =?iso-8859-1?Q?d7q/1Mdwr5E3UbyEfbZlpXBIOru7EibpIWoYJoI5OJG9XhxlH3SFYIjymX?=
 =?iso-8859-1?Q?xlcq7Y/M7ravZKF8mYidNwQQyAQx21DLfxFxSI+CL/XxixzmVm5ptjuZP5?=
 =?iso-8859-1?Q?ETvxcrckllzET+rMjQSJi+2t9PCOTJXoPMu8P6L6rTdvc9ilt89k+4paEP?=
 =?iso-8859-1?Q?OF+1KK14frsQh9gaxgOPzSyZEB9nhDL0bsBce8K0w+ujMC0IA46blNfCvC?=
 =?iso-8859-1?Q?Auu4jY6cE4vULPJnI0ZCJPnXlUF5of8UZplFVzd4d+VDGrgJtWZ+H4hiGq?=
 =?iso-8859-1?Q?OiK29q9PA2yqzHZMYHxTQIP5odR5VXoTxjSp5uTfp4K2b3daBU0ePfunXX?=
 =?iso-8859-1?Q?J44fuZR4BGgbGpF//yee2KIMtHPUhrD3Nhz96yUcr5GTVxhpAPU8RDMuPL?=
 =?iso-8859-1?Q?0ojMXYmPehOcsm0GZ6oqL0g04usV8lChJqe0Tjbyu7hfXsudp2Ln+nCQuU?=
 =?iso-8859-1?Q?Hx1lx3D66c7eYwEjq5lnkz5hnTOzoHgLNZqnk6HpDGQ1Vh8eW+j3hXqJdQ?=
 =?iso-8859-1?Q?Ifxsz0V28rokKS3JTSnNnz+9zPe/gSUe9PmCj/7lsDHuHoJxHgVd7Pmf1U?=
 =?iso-8859-1?Q?4ILIz+oHWJBaqWeUO9GPSodqSDovWoWYIejTCyJyLbMDrKNJ+shIziQT61?=
 =?iso-8859-1?Q?BlAy3n/E6IrQs7XpGvWnt2z7ya9ZXqp0aakz2yFlXMNQAXldRrxySHEUJ0?=
 =?iso-8859-1?Q?x6lHgq8uHaw2Farjz7g3SAihXgEZH4RbwIA80jPyUBX7LtD+GOIhXxItRT?=
 =?iso-8859-1?Q?up4MCD5/KnOJKILyeMIKPElXs4DHY2xheLO6q7LQ23G+ng4jx4HsTWoU+I?=
 =?iso-8859-1?Q?mrUyF/FSWL4sRoSuBKcywvyPc0jvR7qVj/xRKJBEbWUl68I7qydlz9zPll?=
 =?iso-8859-1?Q?Tdt79mibb8vhczmC0BiFfpnAxPRgQBS4m6cMMCwVGmZR2sTALw1G+Dpfmh?=
 =?iso-8859-1?Q?C55OiUkknOsX68E+WBvEKTcV03OPA2YDNM5zA3aGQc8a4NPNY54cTRCDql?=
 =?iso-8859-1?Q?rD4LHc/WHcOVi1e8ff8JGUUDPg4QqNfIT3O3hQTwK4cFKtRGEzZ1xKJAN+?=
 =?iso-8859-1?Q?HwQqvLCtGjFFXDRG6HGKDiClfCx2uAari2Xf8EEeWd3K18+qy9t5iCLsKo?=
 =?iso-8859-1?Q?lXWwuJr0gDNlJ/0EjS5PfqROmlxHeA2cPjZpbLyqmvoYU9Rlr9Aasse1Mb?=
 =?iso-8859-1?Q?dnmYEMhl9nUBgKzlNoTTZM5ehpBk5lCtqqKWqGA4Wn3+94XPau5ZNMN0GL?=
 =?iso-8859-1?Q?GcrMN6nGe4bpovmfmheB0udawdRBjkZ1mMMD0nv2CeDy11hEK/4BdGNqmi?=
 =?iso-8859-1?Q?BlziBVhhApfuU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b0fe6e-2dc3-41e8-abae-08dafa059cfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:12:04.1488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p9XmcRUOMOsvNUxFakOj93U7ArSFieNCL6G1Lj896Pd/VWX7UKZprPTjqLdoTnLeJKMjwfydnGj61fswsflaLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P190MB0616
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7DwH+CvtKJsqHKAplgrCLQk/lKBphPIuWBGJ0Mmuvo=;
 b=SZMnxmKM+Dhgt88L9QGa9dAKU0PyUS7rB9vwZ88m+LnwRROZrtoQfZdj7I9/z9sdxJtS4zEH3FZiah1C6DlS4N5DsxgjZfKG2D9rCWrXaz3+nMBVZHmzGnWaV76UJ8R5qW9b6sIpdKC+USLrVGpVFrExbQAKKzklf2VPPzPgZYA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=SZMnxmKM
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 31/45] package/libmediaart: switch to https
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/libmediaart/libmediaart.hash | 2 +-
 package/libmediaart/libmediaart.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmediaart/libmediaart.hash b/package/libmediaart/libmediaart.hash
index ebc914526b..34094744a9 100644
--- a/package/libmediaart/libmediaart.hash
+++ b/package/libmediaart/libmediaart.hash
@@ -1,4 +1,4 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/libmediaart/1.9/libmediaart-1.9.6.sha256sum:
+# Hash from: https://download.gnome.org/sources/libmediaart/1.9/libmediaart-1.9.6.sha256sum:
 sha256  c3bc5025d7db380587f9c8eb800c611f6b5a16d6b4b78fcff93f62876a677f17  libmediaart-1.9.6.tar.xz
 
 # Locally computed:
diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index 429e0c20de..d4480dbe5d 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -8,7 +8,7 @@ LIBMEDIAART_VERSION_MAJOR = 1.9
 LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).6
 LIBMEDIAART_SOURCE = libmediaart-$(LIBMEDIAART_VERSION).tar.xz
 LIBMEDIAART_SITE = \
-	http://ftp.gnome.org/pub/gnome/sources/libmediaart/$(LIBMEDIAART_VERSION_MAJOR)
+	https://download.gnome.org/sources/libmediaart/$(LIBMEDIAART_VERSION_MAJOR)
 LIBMEDIAART_LICENSE = LGPL-2.1+
 LIBMEDIAART_LICENSE_FILES = COPYING.LESSER
 LIBMEDIAART_INSTALL_STAGING = YES
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
