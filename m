Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A500FC00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43F7B8209D;
	Thu, 19 Jan 2023 10:09:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43F7B8209D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YKEdT4_OnAi0; Thu, 19 Jan 2023 10:09:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B89D8209A;
	Thu, 19 Jan 2023 10:09:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B89D8209A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2A271BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D35860A46
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D35860A46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x0z2IOYAqC1J for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:09:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 909E8607CE
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2053.outbound.protection.outlook.com [40.107.13.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 909E8607CE
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:09:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZ0u7Bh213BYeEj+pSTIIjp0nobhUlNYRDPiHuDpG8C8eiptJ1So+1mdwJDNdqL/hyaugSYFOxZY7QvaoOYuIu1goURETUOW5YurbCBKtr/RgDdf0/By1mq/KtYDTvhCVUIa5Vdil8ljnHmThWukOs1vC6+m1dfauc+cM0P5syVKxFRNp5GChzAvsIKcJnjU/MlQYETOD6NP/vtKscTdxoc8aw99W4RR6guVxiwGkOFu8GbVhk1QwcXDKhAwyTnOvc8Pp6ev6UAIHWaWeXyYWomXJpXwRDcm6YSojsv72aDND7KL9blAe1Gu4VZKBroo/nrovLiKvNMXDYSdVJNT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ab39n3LlwPLu3qqDmIKu8czOEDD+O6NPZmWSGq1vkXM=;
 b=g4QepLeCO0Vu2GRNP2H/fH4NcCx4NYonWHwWvNgIJm/meF5I/a671xw0pA/vTCL40GFNIaz5Y6q8frdjTsFrgtiLuksM4jm4t1Wg8ROLU7U+OIHgX7AX8bATErkcL+Ulf2X5YaozrOfx63F4RtlxLlxtfW1N5zBhOB/BMAvICu0BpDa2ozicmhOEfFJwrhd9ambtqCZYRVMo3WZuofdOV6MiaHhtf9WuRPlPmBRU4X6SEg9aSir6/tFD9eNcVJvzFoPNElxU0Kmv/O7woGCtMnecjpsGUOGS5DzlcfBjnppHq2KHFe/bJqY0X7M4Ld/MhUs1zF6marenKl9VrRWvvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by PR3P190MB0826.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:92::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 10:09:38 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:09:38 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 27/45] package/libglib2: switch to https download
Thread-Index: AQHZK+yzn730NtG5NUqt94pgup+SFA==
Date: Thu, 19 Jan 2023 10:09:37 +0000
Message-ID: <VI1P190MB04934F10A8A3D4B1CF02F4CE9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|PR3P190MB0826:EE_
x-ms-office365-filtering-correlation-id: 5644cdb5-8473-4737-f025-08dafa0545cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4yAGITOUAyVjZu6Qoj7xDcBJqf1voj+Q7tI1J9WHANR7kgRmjkxZSaOk6vZ74/c6vQg7iL1GD6HXMQwCO8l7LDx4LBi5bQ06P7cdBQ9yIM/YaEjMtCPkuh1hKm+W92cv3b1e650MzorLeHzNvs4qeWVU+wXrPh9Y9vnsCFYfv7aWdHAqu9zBsXoMB/Kfm6+KY4gmkUKvcj3rH6x0OeIbL8+r68v2nyxqBYQPPrmt7Z6lmfji2zKXD+VJ1e11xEqQVxElspRnK1Aqf8/QZmXhOQVCm7cbHAFvJg7JbfIjwK/lFkb4goKWRsKBFhOqkPMjuW+MuJI2+DGVQzFFP8HtjvX7jJ0aYjMg7TrEYcMord7Ut4RszmNjoueLTIU9TwPaRYY/8mh9x2cCPNjKzry4HmeOioOQg1woIn4qH48xkE9N0vQfH5u9eMwZOGp5YYJABWh0hAiA5GFQ83MwCcO4xLBnp1NM7Jj+Yrs6Hbs8+a49vzj6MRJwmDM7cbsnfATPYLCFQzcYfUxYarZkDz0fRp6vAWFFI9/1VnDFeRrjcxt5b609Dj4BUCFlbhPjFvXbAaxvhB7bfQizBEij3zpPY0mLaD1C/XHyVuOfwk4t2IVCreQz3yZSiw1U5/xQUY1uwThQILIC5CgdMOLWWiC7xb60sjkhGkMGYZ+ZasFssUfuCuP90rC3UPsIk7tsMzn96gcYgnuCUgv8N2JcBdvfbNkkP/K/mUg20n7pQui7b8I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39840400004)(366004)(451199015)(86362001)(6506007)(33656002)(966005)(478600001)(7696005)(71200400001)(8936002)(122000001)(52536014)(5660300002)(316002)(4744005)(38100700002)(66556008)(66946007)(66446008)(66476007)(4326008)(6916009)(8676002)(64756008)(76116006)(41300700001)(9686003)(186003)(26005)(2906002)(38070700005)(55016003)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?L45cWt7ZqxbfAjYXS/oD6nHS4Tvsm7fSGYN9h3jUsTQ6tmgJMHISlAbvwA?=
 =?iso-8859-1?Q?ZOnIA8j3ewLMtSeqeaj2EDe/htPy/9xYM/WQRtHOSnosixr1IP5jf3h3lp?=
 =?iso-8859-1?Q?MAbEMZKF3yiWN+H/dKR7m5NW8NiXGATT3iAYPMuc85ccXHSq3gflCTVxtD?=
 =?iso-8859-1?Q?+5fqik6woaAIOiivl7Wssdi9+BUMLmnNjr0DBIonJavF5GrYvMPLTPpzpT?=
 =?iso-8859-1?Q?dIUfvP0qWxqI7YbtNSgRb9TRUBrFnrzVgrQeFD4wIt7IMcanusDGfjcBc2?=
 =?iso-8859-1?Q?x440bbGO+szRXP2wQ6eo2QtWXA9NGhcY/N6WO/OmLJMCQZjcDyTq4P9OFh?=
 =?iso-8859-1?Q?wjK501cExQ+i3ARVdiNTclYnOPmNl53YmQEVucw167FWgyhLC3qJqfeLiR?=
 =?iso-8859-1?Q?jtzMZ2HqreAF4iPwZGcHKxR4D9itjSFI3p8OGTShH3TiqylRUVyON49NAI?=
 =?iso-8859-1?Q?LvV1YTVHRidaPKv//m4WcBvS1OzXmWCo/qiRnsE5XxdfXq4MdRe99JWVq0?=
 =?iso-8859-1?Q?iz5MipgPTDDZBuF0gPTgRix0auPW7YRwsJuDew3wrM0BBHNeClV7LKGy2/?=
 =?iso-8859-1?Q?MO6+QZPEPEOYwq9qCCcCnW+H7HzFRO5qjYlXC0bkvxFdTGH35J4Vv4fJud?=
 =?iso-8859-1?Q?iqLEDJXqXhG8cLyrivl7Spn+A7lwxtUdiDZmTMb3FZrPQa6o938WNCCDVq?=
 =?iso-8859-1?Q?ad3/IiUj9XAs2uyKB9vZ6vX7kkIJq6sm/B1xLf5y4sgi66wS1/53w0k3sC?=
 =?iso-8859-1?Q?+JGznSTnyDkKq5L6D5V69KjSqpazWG8O4Q4qrTf7rvkcVigWXGpNpEB0dv?=
 =?iso-8859-1?Q?ZvYW23P4+qw2xSdmiQ5MLjl5ZGzg9Jx5pnk6VFDV131Ch7kAawgk8YlRtj?=
 =?iso-8859-1?Q?4DRRlDWO2IMjmbUtbPKH/wQ7duTr6YOKTEH471w+hfBevhaplV/KYfoTAR?=
 =?iso-8859-1?Q?bFm/oihpjEad2QwUry1yrvwNqq6qfsruND4hQzBUuVaDUwQR3KYhA/pcjy?=
 =?iso-8859-1?Q?8yOaw3/ROloPWvN5yoykIjuMGUpSHbP2oAHJ1A2zSk8hIqdGo/9YUYKtkV?=
 =?iso-8859-1?Q?WAw7zxKhTKizDeXq3C6+olitR7kMYi4K0q1LF2YLaUT1cJ1Z0UnH5Ppq8C?=
 =?iso-8859-1?Q?IDEQBsb4gIqVTmz4BBHqq/coWtZJ50ADu/ofx+NkT/VzTbqQVYuMSAyS6M?=
 =?iso-8859-1?Q?rJjD0sjOGEMJSpuiEe7fqg3ltq6ctcYFj/4BXaVfNgHyr9ygR2YmCpOC3A?=
 =?iso-8859-1?Q?ObR0hgf0Bn4NiekLr3tY/aHTXumw94g1qA7RcRGrYmilGSx1h7apyyUxgv?=
 =?iso-8859-1?Q?DkL44Jfb9ycvGuMvf7aazAxHaidwBn2v0yhXqizEPkf8uCZggvLBYRXcif?=
 =?iso-8859-1?Q?6lbogsI76v7P2Fx6uUBF9L/gzk4AJHEam4dOaWEEAJFXS7QNSwsOznw6Kc?=
 =?iso-8859-1?Q?su1fD4h+ElwVvOg61XoTr0BrD6CK84iMsHIzOyIqqJLNGBonBNz/sdBCgj?=
 =?iso-8859-1?Q?T5cjYXSDFkUlG46ZdmJcIB+m7mg50QSSVV30beghbFGK1z/M+uvu2k+HSl?=
 =?iso-8859-1?Q?vbCBY+zoHr+sVswB1xNrR26HoO6dKnH/cT4wYoxrhqZKGNuk4qVTeDl5sB?=
 =?iso-8859-1?Q?h9vMeP3je5Jtc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5644cdb5-8473-4737-f025-08dafa0545cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:09:37.9094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xzmmKl18Qxzp43v/cl+scMB2DlFxRSrUh6w5oeBb/oYx4aQSg+VYGm+0rjvjS+k+jl/e5Yb2O768kSyOVwqsTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P190MB0826
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ab39n3LlwPLu3qqDmIKu8czOEDD+O6NPZmWSGq1vkXM=;
 b=jHotrmuomIrbOtbsQa6z2xA1i5IGeAtarD26Ro9pdLZ41DIhwTH6tshqnnMaas6EwZwjaUmYly2E0c6jN7P/hhuNkjJ3rTPyocIc16I5CAw76RiBPr8/Ar+9fylnhURh1TclhTpy3jZh+SUgeJ2AHXe+A2XWnnI3GNx8ABz5/88=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=jHotrmuo
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 27/45] package/libglib2: switch to https download
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
 package/libglib2/libglib2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 2970d5a7a9..3084aa6cb8 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -7,7 +7,7 @@
 LIBGLIB2_VERSION_MAJOR = 2.72
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
-LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
+LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
 LIBGLIB2_LICENSE_FILES = COPYING
 LIBGLIB2_CPE_ID_VENDOR = gnome
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
