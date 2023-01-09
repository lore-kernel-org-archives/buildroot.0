Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E92C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 08:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AD3F4052A;
	Mon,  9 Jan 2023 08:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AD3F4052A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qJr1KJaDdXWb; Mon,  9 Jan 2023 08:52:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CBF540160;
	Mon,  9 Jan 2023 08:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CBF540160
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E11031BF30E
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 08:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8360C815CA
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 08:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8360C815CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FWy1K9Y9vAva for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 08:52:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5172F815AD
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2040.outbound.protection.outlook.com [40.107.15.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5172F815AD
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 08:51:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCHpGTOj45djerBzRf76C/dsWNlKTjXIQ3DDIRZl21lCC8fP2QkFo/E8Zjj8P2R892xMFNP4JxdDtjGhBLWzUB/nPlqWEINnobalfcEE6vaVkaiI5CihuMFrX8Yf4rLrHr8uojh45ExJOkpMIeSXQidrEYp3qfU2YUSlT/p9EZjENIei7YIg807eFWQ65HntrO7g5akkKAJeOIFeBCebojQZAA7u0yKsuvGiQf7Y07sBFMxpNaj+4tl/6Ys6MQpuSpmcaFqM2jWdawSID6wNPCXR3Cb9gx0ka5C+Uy1jlRkPSoIrFEzdAIKjjKb10WGAzAF81bmwzXzHZlZBuhafUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxvneZb1QDQsfbPL4z8HuFEbxD5PaheKZ8IkIkPvnoQ=;
 b=gUUEXeHg+o6CuLGqHINAN5INFvFKOQ4paYpslQEt6Thor8KNGDVF6HkfOzCP3LWbqf0GvvQBjIHuRXRF6SxPZhkSX6ElSbTPG7zv4VY+4WGhGHjIrWalScueYOLKZ/mOjH7buhBPtXFyHgCuNbMGxICKkVy3zm0pUE2u1yqwsXACtybPXLuhnV+g3LAKw942J0r8KqE08eVgtlvqTxciyDCHX5H43gW6OxFkT0qfxyjK0bf8DI6V7iE/BJP32S4StLynv88loWHuOitSmnnS6MhTtw1dGC5f021Jo3TaWYR9zEhPqofJuEnPEyAQfiW4/qiVOjEibpxdRgKViIqQbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB8P190MB0715.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:12d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 08:51:56 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%4]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 08:51:56 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/3] package/libsigc: bump to version 2.4.0
Thread-Index: AQHZJAbhDuSj2AaTckmxVYlqwJCEyQ==
Date: Mon, 9 Jan 2023 08:51:56 +0000
Message-ID: <VI1P190MB0493F90F07090CE62B6B7B859FFE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB8P190MB0715:EE_
x-ms-office365-filtering-correlation-id: a0fc67cd-ebd7-4979-055f-08daf21ec31e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OnxPKxjct9fyCCfhPHh2185X/ebfZPtdTk8iUjK2NuhhicocGBaEkvO3FonUVc4oxVQXB2CljZpyz7wr0n3hHroduJJv/3MggNNY+qwyBr+XeXN/B6VE+8oKPA+wAKiD2JryJJTn1yAVsH31X/h/ES4TD7mRQ+LiXi0GhLL2FunaHvLyPd8BLG20RsiiysL0x6/Uy1RSrmC0PMYq8RpulgbXr9KcGFpe8TU9fWJ3c6fp4xchY76GZWC5bq+IsSi4szQdM74RACRUa9HilAgzjd9Y+TLKQL+S4SEN1uza+sPSx9hwtvoNh7yMhUcJh6hrftcFKIwAFGW9K8poZ8xsum6EFDgX1DL4+ESvBWu9s9ecqvm1fqmUZ3MsgX+4D5HK/pRidCin5t+8M+q8Lkxc49X1h7EPZf0IPgje/CHy6Dfj0aOFdPzjQM8QS44YcG8EvJN18dIcOWOS8TTSF9Myhy0H8Bo0zRD6EZtS5p7iHcLXNghzMch2HcMUeTErw5krK8YbH54C/sXnDT2PsSWGPBRwa+337RHf2dR+HkSR06gb1zYkIcwtratzMmpJksV2NSKyJDIhMie631nceTT5psrOZFuc3DrpIcJDTZszHWf5U7qOuYilSaA2GuXie4gG0+Ur/vs9p9dkJeRjjCmZ0/ieKPo96zaUxsrVdtAcxvY+/gl8HzDpRYR4fKre2QYH6Uaag4PkH8MqTWaoGeN20I6hWtPWyz8OjliNBkyrsCo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(346002)(396003)(376002)(136003)(366004)(451199015)(6506007)(38100700002)(122000001)(2906002)(478600001)(966005)(33656002)(7696005)(26005)(9686003)(186003)(5660300002)(316002)(71200400001)(83380400001)(8936002)(52536014)(55016003)(38070700005)(86362001)(41300700001)(66476007)(8676002)(66946007)(76116006)(66556008)(6916009)(64756008)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?OvRurdcRnMwObiCFo5frzOOM+JyMLglYtF1cj4ZJaflyrBnRuJaldo2CbV?=
 =?iso-8859-1?Q?uD5X51HXCvzck4ZLJ1REwrWCwmndTxYDps7jZnp0gmEHmxXLL5g3asIQUG?=
 =?iso-8859-1?Q?mvYcrdkBTG/UKZcCefjqzxoS8NsSPO1Vv7kcRd6Bksp2cebbUb1hVBaRzl?=
 =?iso-8859-1?Q?kCsF6sStBAwMH11csz/qaALcUEvcqUMLsRyLJG0RfrK7x3B/HQUoN5rcnp?=
 =?iso-8859-1?Q?PhxNjsOMcCjeGV/9vBtzua5syvOtqsN/MTWK+VIEyU4Snl+KiMQ+RXEwKz?=
 =?iso-8859-1?Q?sKd2S2RsFh2OvMdst3aTiM0IO+AR0jt+qxLZdIlO1BomsX3OpghPbPyTnr?=
 =?iso-8859-1?Q?Uy3W8RPdE90cZigjZ80kvLju2033ynHFDCYmw7QUSJh1AkUwBbxAPt68ae?=
 =?iso-8859-1?Q?QCe15ly2JTDwv4c95gEbJpGmdWcafMk69DfIq/3jiTH9/B4gZvugr6UX/x?=
 =?iso-8859-1?Q?iODXP9ApdM5klHMsZLWu3gSF754mLCUyPeVBhTGghCg69XMRdkxqnn/9EG?=
 =?iso-8859-1?Q?xZIEoSjnHUgf78w7l9hv/b14+Cs/+cgN3amfkda72EQScbWspnuwraWYVx?=
 =?iso-8859-1?Q?Xjt1hkiwKYBGhZDYTBv6BL+0aCetuWPCGq+NOYZi7gI3b61RIXyprdmC/+?=
 =?iso-8859-1?Q?ud5qy0Q8xPDPHM5Dexk+hAwyOVyDYOZ68N+xr4mILfNjK80pS9DpZhwULa?=
 =?iso-8859-1?Q?vA4cgXjmhCQ1fAFBofd82hXkk1QzL4BuxSvuPuMEIt3JZR+bvSfjomPB1i?=
 =?iso-8859-1?Q?9JoNinpkjtizEoy9xB35WJWa91jsJf0UO7dGPMmZ8+8Ucs34KMiMEjo7Su?=
 =?iso-8859-1?Q?UJBxlJn4q9AQwI8303zp1046x1AoKmglhprYLheoTJZ52/8yjNhyIYaf3R?=
 =?iso-8859-1?Q?Injk4GHmwHxFkdGwV7GDkmnweaMRl51VQcz5gKqVckBd6Bwx2JJTlVJs6Y?=
 =?iso-8859-1?Q?W2Yti+T2k//8Gky5JNSMCdxcAcvZRx8gIkmF3gyA/G8h0MoGWvQadzcEaA?=
 =?iso-8859-1?Q?HBVxxRRXE3IumoEi3DkZZUn1bUvLGhdfnK+AkNF6H5ezJONXQPRTluVnJg?=
 =?iso-8859-1?Q?VIc8KOj7jh05Ew7xfxGVwXGAFmbGg+uqAbBTLIoUvdJVtKc907pMhhKzOS?=
 =?iso-8859-1?Q?XTydFEz2hPOwkKG8CoAVf6Imcnu4AoXOuwLcpmXB1cKsiz94qhVWbv4h51?=
 =?iso-8859-1?Q?bq066WlAmCD2D7aE6AGXS526CE0DkD8eafKlmykD93IHapzYeggxYxWtrv?=
 =?iso-8859-1?Q?m1ZO8mmyIbBTW3rqE6FYyqvuyUSnW9wa7JKF+jScuMWsXKJfpThqQp3qpY?=
 =?iso-8859-1?Q?S3pBaIiNlNWJFEfKvF1wp6ZcPFTZzAMF9NBngzM5vCltalwrO19gHf3HlH?=
 =?iso-8859-1?Q?ADgva2UmNDZD2/YvHrMvi/ff9uKruPXUaNJCAYC6fW8vvICquRGmonRqOD?=
 =?iso-8859-1?Q?JejvQB5mHooPWxaxSnG3JTtJt9vKnaQHvPJxSoCrRWgr8zFv4EtyS7R55H?=
 =?iso-8859-1?Q?rBo66FMezSsp5zb9HsDfLsC6dK6lWIqIy9swH9fIwVQXqhuDOxcpehzuj9?=
 =?iso-8859-1?Q?w9FzeFJLNFeBPxVteiy7Tj3b7YO2f6fRLd6XNq6D8rF0RRcN2KN4A/HHqA?=
 =?iso-8859-1?Q?KkCXyTk4CYG4o=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fc67cd-ebd7-4979-055f-08daf21ec31e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 08:51:56.2186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mf0ePobiqYP731u5FR6sTV0pqkcRem5NBwQ879buQxJuZe+p621h8cvTLM729gqKRgh2T/j53bo0hF7f4dd4lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0715
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxvneZb1QDQsfbPL4z8HuFEbxD5PaheKZ8IkIkPvnoQ=;
 b=lOx3ERpYdZO8d2Favp5fpJ9QGRaSwF2TdIgJp4rVV52wuFwal1sqhewf5XFH8zL1w7+5VUSDAzpQhWmtHS5FbvkdVgZ5R067bmqd5zqSV4oFtXBmHXFay/86TY9iY4fRe7D1/r4Zg3gDkudC37shjAnltp8Xw33sKT9M+nkl3/k=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=lOx3ERpY
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 1/3] package/libsigc: bump to version 2.4.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/libsigcplusplus/libsigcplusplus/blob/3.4.0/NEWS

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/libsigc/libsigc.hash | 4 ++--
 package/libsigc/libsigc.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libsigc/libsigc.hash b/package/libsigc/libsigc.hash
index 046584fc2b..a358732faa 100644
--- a/package/libsigc/libsigc.hash
+++ b/package/libsigc/libsigc.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/3.2/libsigc++-3.2.0.sha256sum
-sha256  8cdcb986e3f0a7c5b4474aa3c833d676e62469509f4899110ddf118f04082651  libsigc++-3.2.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/3.4/libsigc++-3.4.0.sha256sum
+sha256  02e2630ffb5ce93cd52c38423521dfe7063328863a6e96d41d765a6116b8707e  libsigc++-3.4.0.tar.xz
 
 # Locally calculated
 sha256  97628afebc60f026f5c2b25d7491c46a5c4ee61f693e7cfa07fbd2c03605979b  COPYING
diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index eca4111ff6..2de49a0c1c 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSIGC_VERSION_MAJOR = 3.2
+LIBSIGC_VERSION_MAJOR = 3.4
 LIBSIGC_VERSION = $(LIBSIGC_VERSION_MAJOR).0
 LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.xz
 LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/$(LIBSIGC_VERSION_MAJOR)
@@ -13,6 +13,7 @@ LIBSIGC_LICENSE = LGPL-3.0+
 LIBSIGC_LICENSE_FILES = COPYING
 LIBSIGC_CONF_OPTS = \
 	-Dbuild-examples=false \
+	-Dbuild-tests=false \
 	-Dvalidation=false
 
 $(eval $(meson-package))
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
