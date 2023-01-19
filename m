Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4EBC00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9F0940C5F;
	Thu, 19 Jan 2023 10:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9F0940C5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zt0xnoeI94RZ; Thu, 19 Jan 2023 10:17:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C879340C5E;
	Thu, 19 Jan 2023 10:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C879340C5E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E07931BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8ACA40C5E
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8ACA40C5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cNOSx92Nhmgz for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:17:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB1DA40377
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2041.outbound.protection.outlook.com [40.107.7.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB1DA40377
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:17:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMUjzI8jEnM9WET3RaV7Aj7iDp/T2SuDZnCjuoKrNDfoXLwyh89LQjycqQbQrebXRQKWOV74DWyui4ICtdozPd6gn+RU6mt864vyqEYnid8ej8SXjH5gWZDgjBsZzzXNRcNm0Yck24dJ63ZIo/rqmvXBCesE/f5xYuWBLA4vBJtqVVZGa0eotBw1BfNmQ59VsAtW0u5GRUtgvWwvr/B+bSJk+2KX6w1fwJxbjpV/WZx4Av++Ax2E5xMLj6wUeYzeKm4LUDa9RIubRTionUqa/uhDGmdLjiuQWhxyqIjzlrV2+3+C6PQqcYxHF+HBbJFZnQvvWH1O4WXdYvmtFmdk4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbTv6YZZbXhI0xS5zxxov3Aax9sTiZQXqFPCY1F4qoc=;
 b=Dx9OaGzcbr8Wlz91zQEC4T2Th/I/MmYfTf9j+RqadgY1p10Ak7imT7E4oCvPlSoZ7oW+rVZe4uw1k7NldaRAEfj6uDPLwWEGpUX1V7dGx7OFV0JNSC9ZQQFLIt9hoTcrMDkXI+2bTzabqJONf3DI02QA8sNEcf+cUrGGbH6sPVy9MvD0S9gETqpejQ9sbGTdMd0l8SQjxHB7altWM7UC+VSH3bhuIVGphqz+X+zVP8yaqy3CNtMQl+/mm1QMOSClYoa2BgvUcqZ0jT+fEAJsMoExcBXp2gU+XvOXWMLCStIw7Qt+cX0JrXgckQ4HdPmAQfIXIADyVpakxWwJuCcYJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by PRAP190MB1716.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:27a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 10:17:20 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:17:20 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 43/45] package/python-gobject: switch to https download
Thread-Index: AQHZK+6D7Y8kGLaOOUCP5AQ+TJk0Kw==
Date: Thu, 19 Jan 2023 10:17:20 +0000
Message-ID: <VI1P190MB0493D01F4C6F8B0C56FD2EEA9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|PRAP190MB1716:EE_
x-ms-office365-filtering-correlation-id: 5bf8e07d-8d66-4c63-babc-08dafa0659a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +W3jxH+eqWZTM30ojmoRLanblqlwE8wBZUkxhvwmNiIZQNmHXfKO0h0FM0atNzJ98BDzfhKwv5RkuzX7n5dxbD09J5ibXYjmuNHozbSte9S1whdYD+WYBbgVU30AE5eNGQTgfkh7b7HTqORH5KnvUSDjXmRTLoi89oZ4idKqdqUj6hiM/csI30ugprnmFV8JfBT4juH0nftuXHteOJ0aQz2W79/bt/7+VphHGXXfjhk3GlRhPjEksviVjcdF7JZX2V62AW30q9+OIEtCRmzd9AOaY+MqlpKjOv6oP1TitpuCQo7xrUHs/Vl9rN2meNbvE69VtC/Qk3wHIGZJ/wMBg3PBT0aJsCvHg1xJvHsRAvTjoVTuR3qTF4rQwLC3yDdHVOLW1HXmWIQlWOZp8j3gC9A3CsSjK760Bqd6g/ZU33uutjb3Xglk5uH7yohbPAiicslmW+EASQKJERVx6N5lGPdb2+Zl2JStSqFzNVExWVYS6z/5QeQM24VEan9I7Yc2hLA64KBIO+VhKjhG5Mbpra31zEz6r1U+Eq2P4YhAIzZd1HHRXYxGKqSxQ5wYz26mVo9ldqX+l1PFGgLUERhwgjrlI/QOtJiabVFRx9JKClJV8R1aBJk8iATvjAfeGrtPeS2ld7jY6FJFI8T/nNKzEgFBQZ9lVmwup5skl7R+Ud9NEdWeRNFdCmUFHYq4DUSFdj4+cPi9QY3Q94IS9ZGhiqiAfjGjbk9RDNqz84+aa5g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(39840400004)(396003)(366004)(451199015)(478600001)(8676002)(6916009)(9686003)(26005)(4326008)(52536014)(86362001)(41300700001)(83380400001)(966005)(71200400001)(8936002)(186003)(7696005)(5660300002)(38100700002)(33656002)(6506007)(316002)(122000001)(76116006)(64756008)(66446008)(66946007)(38070700005)(66556008)(66476007)(2906002)(54906003)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?32TOcNMGamKtyNFGbFIb7Per/nFqimqzS6KlmiWzBQDvBSni3Nkr+qdLAU?=
 =?iso-8859-1?Q?0aqx8ze93/TTwfepLUZaFmf+WQgrl1xkRtQOQi2LtR+bESyUKcu0TBU624?=
 =?iso-8859-1?Q?7PQdZRWapwb9UIei9+tH2F4MkSxMHGofwqPQmwXvnKfKRrySoYVIRGKVv/?=
 =?iso-8859-1?Q?m4xYiLSgNt+gbP/BujXp1F2bslezVI6+SHFM/tJjaLJEwJeTwh4avBeuAn?=
 =?iso-8859-1?Q?5m6fhnoZI9eWEKNzvfSTU5ZXNZSIsReWQmDWy5SCdRllaplGSGcQrpZwiA?=
 =?iso-8859-1?Q?dvMdREBZe2JdADJjcQPDoKtDaJK23UMo54MITS39yMPNjTenf0Lea/aHmK?=
 =?iso-8859-1?Q?M3G61YM6RA6h5HcuTQYXQraTyS+Z0/YzSgR8oWOgTNbO7+rZuN42Is/rUy?=
 =?iso-8859-1?Q?gpGkg8H6k0baftuzyJvPD0HtAFoKwerL7/MvjptcNj4E8gk68cTEjAB/wU?=
 =?iso-8859-1?Q?gKDie4wWp5kS/mAA8f3/dvbwYwVuUj47uRMIXwgO7rKdH/VzkW6tariRsI?=
 =?iso-8859-1?Q?AIxJNF/VyOBY6my9qE3TG80nORvHowv6dRf4Q1UEaE4jwsewsRuiL8wrBA?=
 =?iso-8859-1?Q?h+RAePVmfI1we2gb4EJjCdqhmxEpX5w4NkzuFRxpC0psI5F8+yNfh3tsls?=
 =?iso-8859-1?Q?xzD0APzeJmCly0EIH59GevWinsbnPGJPr/PE+PSVvyjbCj9f9YAHHJV9ZX?=
 =?iso-8859-1?Q?uNLyYB6BUjiBs3DnSmp+jqm3m1v9fNHb9d3l44Zms9/fBTsZL/uwjIHWAD?=
 =?iso-8859-1?Q?TenChn/34hlsjGVKfnkkuGmxB5t9HEqzE/XyBLOOfNc8SwQR4O9U6Y6jui?=
 =?iso-8859-1?Q?Itr/AfSTWIAABNgJJsWFK17j4ilJSOC8sLlOwQgqXOz4/VH8BxNX4V1snn?=
 =?iso-8859-1?Q?VnO3TsWwUrWhBs7GNMLeQ6yg3LUGxhS5oENDsMpKTYGduLqAtRiD/kEF8E?=
 =?iso-8859-1?Q?3a3RwJ8fyf+28h9pZjk0+4U44zE3bb14JdlVIcy7ZQmJ+Q57rcTKpBRFmn?=
 =?iso-8859-1?Q?hkz7E1FwvKljHASKbTWUfbYuOelqlGcI9obHLcoR5kIk+S056pIErjro6a?=
 =?iso-8859-1?Q?zIBvzloClEQDzZliaNWuHQQq+LF/KYqV1+6nhrfSNZt/Ybyu5Vc0n2pY75?=
 =?iso-8859-1?Q?Porv5b8aOKJeMp0+gM9IKqnJNFln5APIi0MvMzRSpimBmJnveLPEZEKkgT?=
 =?iso-8859-1?Q?9xmTViIZWWVxnCOLAmoavByK1nuOCZOYec20TevDlWHLpshRP27MuxZC4U?=
 =?iso-8859-1?Q?+lWTRGhyojAAjJ57Hvh0hbQlkRY7XC2BbKT51HdBgss409MBr1gcS9hKFn?=
 =?iso-8859-1?Q?DDdaA06p5zyzz9er9yizN8TB5Pm2Zea6mAKvxH5fM9UZAxj9yb3Xen0mZJ?=
 =?iso-8859-1?Q?p4q7ESDAMw07Uh5HIOOL7EOWcCUSCEitTzvx0TyZmcdHHdCMBuxjFndMhy?=
 =?iso-8859-1?Q?59sHwl3g2U/VIlEz341AErLxHubUqjiZiPIo1QxWW1S6d8PQ4rXOiL6/NJ?=
 =?iso-8859-1?Q?ZuIsMmKBqwn25rXf5lezQik7FoGYQM0UB7ImmyKU4yVS7y0yAEnTOxwu9a?=
 =?iso-8859-1?Q?4WeACqPcUCHvfOmnKoldP6DfPXURetxq4DShbbdwsloqnmN1DuuEP/GXm+?=
 =?iso-8859-1?Q?VHgtRvuW9el8Y=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf8e07d-8d66-4c63-babc-08dafa0659a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:17:20.6568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mS25v9lLNY3bjSBzp3WlbBveQqSVt982rJBo1ZOwT5U+VJk8NW0Xg+4t5TLzjADWEEALRHySa+T3J0o7LpKzPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP190MB1716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbTv6YZZbXhI0xS5zxxov3Aax9sTiZQXqFPCY1F4qoc=;
 b=l5i8fzDo7f58ABoFt9lrk+0tKfPr3EqerqFi/cpOOFcsSgDavHH+CTTXb3VaRCgcg4JtbuepENg8g0/4arzgKojXVbAPrQRf+zdhHYbPTM0phxs2S2fVfpOMphr0hNW7FOYbRHSpi9TBy0pMJUVZsor27IzvamHu5OybDvTFT8U=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=l5i8fzDo
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 43/45] package/python-gobject: switch to https
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/python-gobject/python-gobject.hash | 2 +-
 package/python-gobject/python-gobject.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 4398356006..2fb9d38ab0 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.42/pygobject-3.42.2.sha256sum
+# from https://download.gnome.org/sources/pygobject/3.42/pygobject-3.42.2.sha256sum
 sha256  ade8695e2a7073849dd0316d31d8728e15e1e0bc71d9ff6d1c09e86be52bc957  pygobject-3.42.2.tar.xz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index 014090540f..a12ce5c107 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -7,7 +7,7 @@
 PYTHON_GOBJECT_VERSION_MAJOR = 3.42
 PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).2
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.xz
-PYTHON_GOBJECT_SITE = https://ftp.gnome.org/pub/gnome/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
+PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
 PYTHON_GOBJECT_LICENSE_FILES = COPYING
 PYTHON_GOBJECT_INSTALL_STAGING = YES
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
