Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34970ECAAD8
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 07:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB1BD40AD1;
	Tue, 20 Sep 2022 07:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB1BD40AD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1-j5XX3VOGwe; Tue, 20 Sep 2022 07:52:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC4044063F;
	Tue, 20 Sep 2022 07:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC4044063F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A13D81BF338
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 07:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46C724063F
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 07:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46C724063F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P52NjwAlCr9k for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 07:52:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAD58401AF
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2056.outbound.protection.outlook.com [40.107.20.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CAD58401AF
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 07:52:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1ji0T3ppd77fCVRvRtprxl68HZr7zYvNnCR2JCUtmfGGigRIxeTO84L1ndec/w9dV62KoeMA/TIAaz4nvA73kwmVK5J9m/3jLD0e8ka0vzuy6ExhZ57XN0VVW8KHX2qaT2kZvJe6QXHOAFgGCw68rSZ56AkDWnyCVjjBH5wMlwz0r36dMjB9hx8R8SLKs8xbKEyUysoalozUhGIFFSwItxyKSwLOnRit+RI2OGa/HA8Zty4XgwEqAMcml3SQ31a6b0sjGmWClZXPsqNs0R0tWIwBcvz/0VPX9kb6Lnl5HFmkN2OdVRJkUCRm2qIJ+kJSrkRk/Qu+F/SwrQaW81wQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMgDQj+/yYKSOs4j/qgd6TtQ0/3+gv/JA/cTZPcVuro=;
 b=DIXyxqISIZuL7qErgBZvvfUeNM7PMVY65QghxyerkG8I6Uqs64m67lva9o9WfM2G3NejrjKRzfY+hJqihRUyy7Ms+x2jDgJ/j6CNLAniiWmaqOqh/MLk72UT3gqqdp44mRyVsGqmfj8RAergr2eC7lvzH125E3bNohURnVtPyzRyccGNbFbgtaQ72dwoqva5+uJzpOW2nf7cv7e24oUtj+4dLyxKD8MLFFrAvdGXD4ovVrv56YdAFfEKbgpVc0NbT1N2A40s77yF7xT3yigQdafSPW0Eknw33rX6zCg3JJJUEBX0dhd4QLFY0Y5uZ+8YyoO12MMtOAeIOEfQoiAD2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB8P190MB0667.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:12c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Tue, 20 Sep
 2022 07:52:30 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::818c:f70f:e157:b158]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::818c:f70f:e157:b158%5]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 07:52:30 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/libubootenv: bump to version 0.3.3
Thread-Index: AQHYzMW4Z53jdsKyF0+4FxU6BA0mwA==
Date: Tue, 20 Sep 2022 07:52:29 +0000
Message-ID: <VI1P190MB049339702A088B8ABC4110729F4C9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB8P190MB0667:EE_
x-ms-office365-filtering-correlation-id: 7d06d982-5f2e-44af-c340-08da9add118d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vxBlMpj8AVSUct/3h1GnPAwrQi0gt88JFXVd1kjoBujrjU7LqOjmcFHv0A7DBnQniGl9PMNz/oh8qJrr1K9TKd5yHdUXACgiMZZGUSBDrCnml7Bd/kFVGJ2Dq0nnA0QOqJhVXxTthc+1ZBdZB6JXvCJc50EpkTuN31fMxIwVOLzLRd62dp8AD8uQd575eb1KnJRPPyIu8pJ27RPMYZR8sLqsE+uhwR9XQEK2CgQyymQzYiMUwtaitgug0aezd7cLe0pEnLvCSnRuOya0Br29SAf1J1RWZg95sMqw/Z8D0jB73xZ2/ZZ/jE6uO3W02oZxEBWXfNJBfk/2NtFi2aSNtoGlqzov5WjrH0KhQ1O57p+Sx0BSDjR1HExKnT+46NLC0XsoObEOE7RQ4HIWs3k8iP9D6WYQgopPmlxu5wmkaVetLRgYUkFIp4WZlRKWMESL2dhQsXwA8C7S8DvCO7LqJUaYS/2Vhirjr7fC5IYDdTN5YaD6CmkTpjJzKoODkM4W4v1YYARz9JIvRjKWZm1LrvqFdo4X1NJgJ6+qc5E1xlDv0HHB0iooMYbR+TsCkcNCesfZBeC2vKTcNkNWTHLkrYO5DXV2QIG6+LazI4raKc6gunNwQkKTffdtabO25+Hrp8Blf/MPDQVfdK6nPc0oO/FDwmMaNimia/8rA9cNHosQbY21y+ogQsasOAiIriyrHCbsKQn2e1JTWi+2rO5Ie/7hWRJZKdslLnc6N9Shgrgz7dm3FN6IZGLo48mgnGsHBkija4gV2FSSo96BgzLvGg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(396003)(39840400004)(376002)(136003)(451199015)(55016003)(2906002)(33656002)(122000001)(316002)(8676002)(38100700002)(4326008)(66476007)(66446008)(76116006)(5660300002)(66556008)(64756008)(66946007)(6916009)(8936002)(86362001)(186003)(478600001)(38070700005)(9686003)(26005)(41300700001)(6506007)(83380400001)(52536014)(71200400001)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2GhghXtfL3BeqIRZW482PiZlvV+mMC48kRFPskQAb/fS4pse4P28Y71YH7?=
 =?iso-8859-1?Q?vhKKSewRAuf9wM1AgappD7s8BHVNqHLpA8gcy4P41ef1+0teeUyjOR55lu?=
 =?iso-8859-1?Q?OOdNJBl5ucAz8okesnDVSfdOuwvPJ6zp9ytMeihj0XcqQhi1egbOQlrx8L?=
 =?iso-8859-1?Q?Ro9sY+sR53143qh8PiNZgU590kxs704I7zIiwVSSDIBEiZezNUdYWYFF3v?=
 =?iso-8859-1?Q?HBBEjA+hbfqgzlzEs7RYt3t8B0JE1ll2UCH7m8YY7XsD9DYvxtcjMm3kiT?=
 =?iso-8859-1?Q?rxcFDkmPE6kOf5u9cZD8uU4BdLIRulFTClRUJ8oG65x3fmqcwD3z+4plUZ?=
 =?iso-8859-1?Q?anncyfflIskg9VWAunkizJSQUNvjupgfXU8z7O1439roNWAf1+S+EVikTx?=
 =?iso-8859-1?Q?Y932xqsDZLOGHHei5hLOnl55i9jN27GDddHcinYCu2fE9JcJ6KcAXoHgxC?=
 =?iso-8859-1?Q?h/77TeiKLyoaODMV/BFCFlBDFq6SUaGV5ezmax+oZ/EOJV9CLiEaBEN/Nm?=
 =?iso-8859-1?Q?3juKqQVFfFDYmeOmPu499xBk+JfXPfOE1uOYZ/rShH73imU+Ckl4nKEN13?=
 =?iso-8859-1?Q?pa7RJH4ayAnzavNzoE78ZihPHSrlp1LCJGmu/Gb693FsCipXOpOWIo4Xzj?=
 =?iso-8859-1?Q?+hbY6A6AkmmTG5jlQdy0iO54zeaA56+9vec217IceAn0EOXu/LyIgPZO3T?=
 =?iso-8859-1?Q?hV0OzMWxyf5ReXCGFkmeQJdZmUCzZjNJyUf5gyqfVCvCMU/d3GxzhaAQgE?=
 =?iso-8859-1?Q?kIjmrECKTiQe9i2RT7K7Z8MaM1bUZnwg3lfdoVHFKVnyBotiD7nwaCX90e?=
 =?iso-8859-1?Q?n8OhQMNuQxxl11khWzwJ4rwN5Ncy5G0pCAV3/b8Rb1ssuuSw0YxIweHbgj?=
 =?iso-8859-1?Q?doaZNAku9TooSfHFhW0SrRiZ8GsGRkgLxnaB7Rzl29Hnj1QuxAeAlrGkzN?=
 =?iso-8859-1?Q?fF7a36w2w0JdpboR+fXvR9kmKq26mE6TdyXClH9XO5c6k03fGkNArqroac?=
 =?iso-8859-1?Q?v16G9VZiTf+2siC+9qBGZER93peFsBcdQGABVFOPG7jpA6KY+HlAuzeBDf?=
 =?iso-8859-1?Q?qritgjhdne+Vipsg+KDSJqKaT/qzTRbHz9CUkVk2nZUa3u0mZVFNtFOr7D?=
 =?iso-8859-1?Q?UQuMbddfFUq8mVGFYZhVLZPKx2e/5aONvnBwF3DmBIXdADU91N7TOTgweq?=
 =?iso-8859-1?Q?HxgUM7sERH5KL/xvssfPprvJ03rOBZ2pRnpcXjQABN389sN5ESssX54xAm?=
 =?iso-8859-1?Q?94zNU9cyusDXJNDenWLLOreOy7fFDLEvfNVhUjL5iXVsTT5NHagw4et4NP?=
 =?iso-8859-1?Q?oq3Wt5zIT43a/kCWiP9X19eVnUdCKqIAbilEwIiP4TPaMTJQC7xNeUbRIJ?=
 =?iso-8859-1?Q?E1LMHbQDNL4RgS7j3BbZb53NLhfYRDdIblUFz20DZ56nrKxHgQ00GwmmkA?=
 =?iso-8859-1?Q?38JZJskWZ+vrNCKMpJmqPbr/MjvcfToK+SYmnd6JG1HJi8aPmKiFmPVi0t?=
 =?iso-8859-1?Q?mLe9ErqYM8LV0Uk9d4iVF6jwx8DccNR3NJyeZizPHxpWjHPHAZL6YUGE5D?=
 =?iso-8859-1?Q?NkoOKA6gltalFlfx5rCnKlyMkDtZHRk9RBiH/jULwXQhgQcLzP2qGglB2k?=
 =?iso-8859-1?Q?nhfgMXDFDQb3o=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d06d982-5f2e-44af-c340-08da9add118d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2022 07:52:29.8674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0mbYMnpXmC24pCPe7qFPCy1x+Cx0JLFFD31tQM/8MkHZ+JMhHTAdr2/k2273VDowvBBRpNn0dTICFj/Yirewgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0667
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMgDQj+/yYKSOs4j/qgd6TtQ0/3+gv/JA/cTZPcVuro=;
 b=B8wnGqbqvJdzY6CqTzy9EPaICDqNbLdwk2pOptk9qzNijYsYoC/xiok06JLtRdB+tdSMdbyYLed3Og4mO0QmgxcTqWN4DuVWuIbN8/lHE/4afEEW7p46gd31VMKC5VqwnI6NXqZfAxCMNf/vrohb7VGOJAnZ9FTUf6bxzuQMZDA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=B8wnGqbq
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 1/1] package/libubootenv: bump to version 0.3.3
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/libubootenv/libubootenv.hash | 2 +-
 package/libubootenv/libubootenv.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
index 5ff7450806..6863b7fcf7 100644
--- a/package/libubootenv/libubootenv.hash
+++ b/package/libubootenv/libubootenv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  760fe53ca20ced93a09dea0f123eb429c820b565c103920afa738873e8cd16b7  libubootenv-7dbfffa4cc0e42ad3febb122a711fe9d1b20e9f7.tar.gz
+sha256  8fc9498b557bbf4ae4d39a2dbd15a2ef44f8ea8de4686cc971c6788a65cd1ec0  libubootenv-0.3.3.tar.gz
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/MIT.txt
diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
index 51ea02e678..e841e0b843 100644
--- a/package/libubootenv/libubootenv.mk
+++ b/package/libubootenv/libubootenv.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBUBOOTENV_VERSION = 7dbfffa4cc0e42ad3febb122a711fe9d1b20e9f7
-LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,$(LIBUBOOTENV_VERSION))
+LIBUBOOTENV_VERSION = 0.3.3
+LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,v$(LIBUBOOTENV_VERSION))
 LIBUBOOTENV_LICENSE = LGPL-2.1+, MIT, CC0-1.0
 LIBUBOOTENV_LICENSE_FILES = LICENSES/CC0-1.0.txt \
 	LICENSES/LGPL-2.1-or-later.txt \
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
