Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1B1C00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 09:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41C6541978;
	Thu, 19 Jan 2023 09:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41C6541978
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 53XQx1BXN2Sq; Thu, 19 Jan 2023 09:59:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39A5440357;
	Thu, 19 Jan 2023 09:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39A5440357
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 33FC01BF25F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C4A260A68
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C4A260A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WOLQ7q_kPCH8 for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 09:59:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11B2660A46
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2084.outbound.protection.outlook.com [40.107.7.84])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11B2660A46
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 09:59:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7JoP0Xdn2toEX8h6tV4ENdumZ2TSNvFiWY9pGpz+oF4EEW3rdQTC7a3dECuMYiPMnq/1JI/9R0XRNXadtsVQ4HVT6RUKlHGKrCETQIXowAqHR+SJ4aRhZuCbsJTd2y8GYSxjqhDMve4xsiSrdS5224ZYj/FDp9ZOFz1Y8iuJRs+9aX/k/oicKM59p16RQ6RqlBXA3bOUAzLqTu8o9wGEvi7wyZ+jpii86KNCb1u6tkVDPI3N1il3RzhFsuoJ96XJBXTHiD/HrUVQY6BuFtXnm2FszzRVG3Q+wQFZ8sL2AYPu6DsSTqV81lY5dh06H/j3whRY9ReNVEu2gWQant0fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTZbyVxInWH9GiyGwOci4WKWk4CsnKK4ebX/aJd4rPQ=;
 b=Ki/HMnzd8LftebSImIbrQboxc3kj/Yioa9T2QaIsXarNHqcaletnGokr0zrR8/EBvQ73EizO1t2x39/RaoCtqeYRasdVyRHaPnPwj5oIId3TNpLM1QCPV9cppyfgXAUBoDXQqUtB6BED8cwGQVMFLi6YsSGJODdsJAYCh21If5aHGze+oaWPiOVRU3Z7gUcxEoVb/Q7fzWPFDaFi0zMuaMuwKiIm6N7E4n0HEZvF+Vm8tgTL4RHjKM4pNGi3KNGuNx3q/wpUioySydkxPaXe7P70bEE4DucqMKcvcCC+8wJncaVnY5tx4V9yIyTToS8pLT0zUWxSQBa8uMn0H8xIKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB9P190MB1698.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:331::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Thu, 19 Jan
 2023 09:59:30 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 09:59:30 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 15/45] package/gtksourceview: switch to https download
Thread-Index: AQHZK+uI8JWlD0fmJUi5qsylxWIc2Q==
Date: Thu, 19 Jan 2023 09:59:30 +0000
Message-ID: <VI1P190MB049302F9E50F4F783D2423F19FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB9P190MB1698:EE_
x-ms-office365-filtering-correlation-id: 7676936a-6984-4352-d792-08dafa03db97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TRyz5c1ye1UcNqlYfX68VUwezSgCjocFRoj1S+DfXUjK3U6j8UpQ3139Ta1G8z1H77FJbC3NDiT9eHKCTYX5vYgMr8M9970SkSqaj/LSEoFn/5QFJl57CeIcpXuhCHx3RnighdvCqOur8lePOWeWwM1qPUisPMQRs73H44MqQZXrmTCpS4y9z1SH1Iz5eA/faEaJ4yv2F8G75A/iUyx9N4Ws1JfsAO7O0aTP9GkJ/a1xXMXURn8ZhCzA8FW2p5zzesrJGF8euPE7BJgBxzPlNgmiUhBM1y0sybRzZqrK42KJDpviodTh+i1s9TKqk7yzANiun5WbILOoPiYlpFubyD8BBv0N4uQW5smOGsvJvjtN6sdCOMn7iwbrqrgZk0KHYb+AnQaqmfH08nmDqKghwLPelwZuQ1i/ZLGf2z+/Se1zguOOU1DEZwCPWnw8lMNhb33C6FHVTn020Eu0QjVxoMI8YGmGJb2j8BqtsZok8xjP6uEI78RZVTohN6TnkcqXfE6Ilf9S5K0BjZr3p0z6gPdS3MCYsjLu5tISSx00Rcra3d7pRnoR+ivZ2BuJtw2Z8yl30PnD0zovdy5XjxabxhEvyH2af15Cw4K18OJessaBogNmEPWkksFcKwrAO1OZOR2yfMrDkaNfV7TGbO5wy9f+kPqW6pNokOH0obobf9w6ue5QWqdjMHKZfEZS7o0WWO2/OW9ikqm6GGzQdXdgNu7cNzJgXxorS1dM+BC6TKY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39840400004)(136003)(346002)(376002)(451199015)(6506007)(26005)(186003)(9686003)(7696005)(122000001)(71200400001)(966005)(33656002)(478600001)(316002)(4326008)(66946007)(66476007)(64756008)(76116006)(66556008)(66446008)(8676002)(6916009)(41300700001)(8936002)(83380400001)(52536014)(55016003)(5660300002)(2906002)(38070700005)(38100700002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?vSBYvF40y8oqEdF14UNou2ndFEy7qLlw8inHz7SNkbfSfwNMXtRput5R2K?=
 =?iso-8859-1?Q?I6xFGeUZWOM0rZEpR/hF7kqCIA2SY7SDIQ7tT0V9oE/GkUpC6cloTHYT/g?=
 =?iso-8859-1?Q?AWEIeffoDIXLZk5LmUgU8yJz087NIHrIhdRgH1D0r84lYs0V6OFuImot2J?=
 =?iso-8859-1?Q?4q1vtbOKkD2cLxJHEVIS7KRQKqrNwDu5FUnaNrWei7PvQT4sSerKi5x9qp?=
 =?iso-8859-1?Q?Y3X3u/flwpGj4MkyH258gomMiuXiULV64PA9JRlZGuoYcv7ByR9rjTdxSy?=
 =?iso-8859-1?Q?+EPOrUjt/ooLqwfRxYq4ZIFyW4dnbdbC4LmL/DULr/JMJbOrNd10wFLDL8?=
 =?iso-8859-1?Q?VhjL83IPjCGsKuVYcA07beTQ9eduoM3B8nzFKOICTA9HCxBEI0m27guAud?=
 =?iso-8859-1?Q?vbLyMW4EbeXv5n5QzDgbKJEbvtXY4Y+hoFTTqsItymZhws4W7hxytpexys?=
 =?iso-8859-1?Q?QDy1+sYcHwT8wcNjES5nQ+taqMp4LDqtZMlgrFHfUQUPEJgMv+iC+2OsVs?=
 =?iso-8859-1?Q?lGm7praOpSX627rUIdmmM7OgB70zhZTR++gpWiXjW3W9Q6b1Q3+Io++ZQu?=
 =?iso-8859-1?Q?oDlpiIeuKaelQnTVHbd9jRGma2SHK5aBZqvCiyGHmYca3ZQkaieu/1RoIL?=
 =?iso-8859-1?Q?tCMzxx6wi3tLf48hkMssuRD1qWKaZhPGV1gjxESFpVY2RPEsqcb09tBX/Q?=
 =?iso-8859-1?Q?muizfKoG5edverbPpJKbEt0krW0+S+z3/gl4cj3m0LiYepVX8JtjpKrrDL?=
 =?iso-8859-1?Q?YZSuC68fjSv9ZewBP94eGDDJhj3kky5EagtCSPM/6dpccjRLFuo2y+veqY?=
 =?iso-8859-1?Q?uh3JdLh5Uv2jxfVNUQPvYokPpJb6S4ac58iD0TzaiaUYhGbTgA89DvNgui?=
 =?iso-8859-1?Q?ypvVPfOeUKU2xXeY0JvhSTkiqGLk9vybsSJz4fCqzUmAJTusMtmlpd2nvx?=
 =?iso-8859-1?Q?lpgFXlwGhpFoMggyk/OpZPYGBv8JrKyXZTf2QVWYeZCdHKoyqTIvwOjXe9?=
 =?iso-8859-1?Q?mfR43lRDExIwB/OIyKsrqXQ/s/eqSleu4TYPDZq5Te1QmHYOVfx9UT7bVE?=
 =?iso-8859-1?Q?zJhW836ycflDF3oT525IeJDOn93ecHDAzIquA6piT0pqtklKiP3zfTRlXA?=
 =?iso-8859-1?Q?E0DTvrqyO9q4/uFWD+9rOSuenXWtWcEmgUe3PgccbhIMtEfd+EtcPfMQTQ?=
 =?iso-8859-1?Q?KuKU0ZC+wVmOpAqSvraxCOPb7CXMAN3OKa9wXw2SNGQdSRjqGkpI2VUdCU?=
 =?iso-8859-1?Q?Xon1cS+I+vOiW7rbh6TB+fmEbvMM2/uroAgnzbAtgyCd1OJaFh/kewln1h?=
 =?iso-8859-1?Q?j4hp8gVvOeA6sH2X6N+SNh1/7IRhUVXrZujRMO3mTcb6aqjGK696PKrwcJ?=
 =?iso-8859-1?Q?0l8UFgZGfssEegA/h5VO4pdrcQV0VTu85VMHJclpyreYgGU8EfdhfZ1L2Z?=
 =?iso-8859-1?Q?OsXiQTor94x3+VvcGjXHQHyYzwHVNboslOld84J4j9WjJM9hRlGPkGjJrK?=
 =?iso-8859-1?Q?OZuzRjHi79Pmcjfla+tOsQ5ANAL3FyI+Pb4TxcxyS/VK1Rk0t4Umsw99BI?=
 =?iso-8859-1?Q?8YBn0+bPhCQ52Jwd9O8bj0z2sKcKpHGoWGw64j6gt9yHOQPnc3DmmtOaVL?=
 =?iso-8859-1?Q?leuRYEc0v9cQY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7676936a-6984-4352-d792-08dafa03db97
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 09:59:30.1885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Skfte9M5lv6OCqj0bEPF/XmJGQp4vnzuTi4FKAVXuA8fGYSz2bq9BWF+U4/Bli5JTlG6I6O3vPE7te3/HSvDnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1698
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTZbyVxInWH9GiyGwOci4WKWk4CsnKK4ebX/aJd4rPQ=;
 b=RNBYXdxY8peh7mdJLuFE1/FRnr+Rsuk884hi/6jytmk4eGhZdj25EB4RlcBV0JDUrogMdzrjzn0M3FhKunx+p9mAAaK6nHC6Tfis73z2XcazvP+XMnQk92rkKOiP0FANBt82he6JmA3j9P1OKJhdP9nSt3YOb1ezmqNcoHjVJnM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=RNBYXdxY
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 15/45] package/gtksourceview: switch to https
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
 package/gtksourceview/gtksourceview.hash | 2 +-
 package/gtksourceview/gtksourceview.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gtksourceview/gtksourceview.hash b/package/gtksourceview/gtksourceview.hash
index 2e3c430ac0..7a9cf00655 100644
--- a/package/gtksourceview/gtksourceview.hash
+++ b/package/gtksourceview/gtksourceview.hash
@@ -1,4 +1,4 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.24/gtksourceview-3.24.7.sha256sum:
+# Hash from: https://download.gnome.org/sources/gtksourceview/3.24/gtksourceview-3.24.7.sha256sum:
 sha256  a5c20d3a6347533689358f3ea52486409f6dd41d5a69c65eab7570cfaffee8e6  gtksourceview-3.24.7.tar.xz
 
 # Locally computed:
diff --git a/package/gtksourceview/gtksourceview.mk b/package/gtksourceview/gtksourceview.mk
index ae1d3ff295..3f5aaea4ae 100644
--- a/package/gtksourceview/gtksourceview.mk
+++ b/package/gtksourceview/gtksourceview.mk
@@ -8,7 +8,7 @@ GTKSOURCEVIEW_VERSION_MAJOR = 3.24
 GTKSOURCEVIEW_VERSION = $(GTKSOURCEVIEW_VERSION_MAJOR).7
 GTKSOURCEVIEW_SOURCE = gtksourceview-$(GTKSOURCEVIEW_VERSION).tar.xz
 GTKSOURCEVIEW_SITE = \
-	http://ftp.gnome.org/pub/gnome/sources/gtksourceview/$(GTKSOURCEVIEW_VERSION_MAJOR)
+	https://download.gnome.org/sources/gtksourceview/$(GTKSOURCEVIEW_VERSION_MAJOR)
 GTKSOURCEVIEW_LICENSE = LGPL-2.1+
 GTKSOURCEVIEW_LICENSE_FILES = COPYING
 GTKSOURCEVIEW_INSTALL_STAGING = YES
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
