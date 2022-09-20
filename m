Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393CAECAAD8
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 08:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8C8060E09;
	Tue, 20 Sep 2022 08:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8C8060E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u3FXSTwo4qgk; Tue, 20 Sep 2022 08:17:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FBC460E08;
	Tue, 20 Sep 2022 08:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FBC460E08
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62AFD1BF30C
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 08:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 180BC41816
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 08:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 180BC41816
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1nMCXkwDLn6j for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 08:17:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A3A34182A
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A3A34182A
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 08:17:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WscH3lfZhnfKVKblWPp1ECVuf1Fu+Gvl28RAY4kC1c6LKp3501/dpmlgpmbnI46wrnKfh1iAtwV5SF7iZxJAPymOYx0TLbF22XsnWYw/AKfxWZ/9rdTFWPHuI7AzAbRTUBKjKkTrIS5xeRMKoXhrClj57ASLKnYrRO4LOZsOoCvNmh09DNrZh0W24bKqF0yYmp2DHhXC600O/zYCQw5bpn5AhZDpjQ+FNQHjja1YZO6Y04WzCAqr/+LagLhkXXotlZ32Brm3UvkK9PS9VpLhoIkwZ+WNJenXL+eUYrB53duNlv4QzrYNQnSHm/IcCHVsCMzn9Y29lm6LfzbFfK+AjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08yiVs176cbrhmbpWOV/nj3GkC3fJt/ao8u1e8l7Jqc=;
 b=MDAPNfj/9LocXIbW6JsBDBKFEN/UVTjaseATTR4QGSEhm7mfrVQ5ZlYOsLP/UogmOQCDIcGe6T6SLh/PO2edSMgLSS9rNYE/h7RWERfjN5ggqlxoPP7iyXArp3G167MZNSkWoNGEwr+bDEoGB8DEEXzszEaANd6BE20lLIUPkn5uGFBUBkzMpvkTbWpwOsUaRCi7TeC4EUkd6kHVX+FbtF/C3FPbXNTXab4/7xZsYSw0B+pjP64NbYWSb49EhAjqOjPgNktPx71ARWjh4pDFnpgUyKu2xj/B/ZZHKb2Zhpz1N+ZLpyGWN4L5mhHtHktZ5fhRj7tKN0YGZMZmSYTJJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB9P190MB1100.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:22f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 08:17:14 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::818c:f70f:e157:b158]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::818c:f70f:e157:b158%5]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 08:17:13 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/freescale-imx/imx-gpu-viv: fix gbm.pc
Thread-Index: AQHYzMh6oDEdKnrwWkydjSqherusbQ==
Date: Tue, 20 Sep 2022 08:17:13 +0000
Message-ID: <VI1P190MB0493C482B0410D1BA4C37F849F4C9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB9P190MB1100:EE_
x-ms-office365-filtering-correlation-id: efc406d7-8814-4aac-7524-08da9ae08618
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0RsN5HK+EN5+V7bZKHw+QOJ+LcuJJJ7Gh9ILZftQ5aIEbARr0P0IdujoGTPUVvg28l06PZOE4heeivRhdBJ7lZ6o8pW6D2nF+mzUtktRnegF2oUkYX3Uy3fhWyyvFbRz9M/tsXJhVPrUETWZDv55abKzI+UHR+KvcPcsu7kZH8L/kVdJj7HnRaFi2tr09EK0Iboxx/uOlVGSmOEKhgM01il5zJ04omVDoFeYn7dOkVWtqTP59b892KUkcoIM8shx5ItnE9+6dBa5Hjj9CXdx3ra7lx3XQJTniHT7/521U+Gqk7bjmo6mF36rxcOQGl08wrdMAxb8r50+yWqBLU8hXUJinWH7f0pf8c+C1Z8HwyngeIWzg9PBQbyY9gSSxULxA0oBLqanvFNiRKnwAGlS5n+UUOYSWOboNlBSfr/vwTAILqYZwzqoIeL/KFhnCbTdh7f1ElUCDvlZ7Dmlqz+RyIeWD2zS5yqqyJjkmfQQIPhsGFxpuyVPYclndbjcsNRutc+KJn8J0PfZ2XxHY7TsWl+ys8kxFjpPHuk7G05QzdL2D0t+BnT3cJpES7lH/HyYBW6o2Xs0HRMVbYOkD9nL2vwaaPNVO/FDE2gMlwx7yOAmFoPLVW8Edov2bien4AidnKobR2wLeKAW2HlBz0Si//t8oRKbC6K8ajO780eILSclJPeedUsnf+ULtjwAxYHknJsEOe7xsztYG6cRrIGBwZQfB9muD1ywUaN1m88eaUqM2dLjL5fyKrQqRiIBZe4+DN91Y05GdO99Ew5PGxw8BQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(451199015)(33656002)(54906003)(6916009)(316002)(71200400001)(86362001)(4326008)(38070700005)(122000001)(186003)(38100700002)(76116006)(6506007)(478600001)(66946007)(66476007)(66556008)(64756008)(66446008)(9686003)(26005)(8676002)(41300700001)(7696005)(52536014)(8936002)(4744005)(5660300002)(83380400001)(2906002)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?M8JF9BdWhQapP1HiVGgtjZF6gUnPT7P5QgAIBjUIRUv0tNK7Qh/9LDd3xw?=
 =?iso-8859-1?Q?RWuKcwpNOjJjzDBuQUlIE3nv0yE+rGsKcdS/r7oL/cH3qst3hGAioUAVtT?=
 =?iso-8859-1?Q?Ja+cfcpZ1v0s9Rt7z2Mqdk0BqPoJoGBAniKn+H0VQ/oTP60zP2xRbTm69U?=
 =?iso-8859-1?Q?vxC7soLrJzLsomuQtjpBn+INikiZV6N4I++2xCv31VsHutQC1zBwcch3YH?=
 =?iso-8859-1?Q?I+2NRwmt3A3ug9NKkwkKkJFY5Ro6EcSejmxN8Bn9Z/f7frGpnIsoLUudaq?=
 =?iso-8859-1?Q?SOCrbrJBxKrVViyYoFJCOxS+dNeA3BHYqu0QWs+0Mt0SiOMfm67UMsm6T2?=
 =?iso-8859-1?Q?15q+qIZPzzQB/3WWoxrUFp2we+fCr7eF5S9DR19r5NKNg3QBP/qA8SC/TJ?=
 =?iso-8859-1?Q?6ARgiLMgsaPC72urpfXb/pTPP3XSzwF2SdOTu6BZ3+eyrBJIEmv3XK9u6y?=
 =?iso-8859-1?Q?eHLfV0O1GNDxC88pSfDOyMwzykCoeQjQnEWsECjOGdMv5iVT+VYhKzVh80?=
 =?iso-8859-1?Q?1WZWeBbHSysaaw/AyI+tKm6AFXAJsMkWtRjhmMNDMS6j4aKjRKg3vWH9uE?=
 =?iso-8859-1?Q?R4fj5fWHha1+Pv601XIRruor8HCiCOt5PGOkfXzOZgtfYDb1rpeNuM4PqI?=
 =?iso-8859-1?Q?4CPTbNIV5hYhfxzc2573SHml/zANYV7Mbh11eLCO5UA+XnlEN3e33Q6cxc?=
 =?iso-8859-1?Q?iw8eYHeb9ZfQpCBAY4fp+vMmYL373p5ksryIbghGBrDGgsyDbHvO1uATG4?=
 =?iso-8859-1?Q?llMoxKj8vSfdUU6GFc7a6ftR3ra0ZN1cmyCS+ke7LbYjiZ5wkBeqwfgnl8?=
 =?iso-8859-1?Q?/1bIlyykjjZLzG8HCSW1hvhIeqQzYGkDiPC0F4l6uLKIBBUmK94Bph9X2/?=
 =?iso-8859-1?Q?lxiIGb06R2eKrczkv+j4eRG6S2N/GueaE4mF9ivURgaELuQSqyu4BY3cuD?=
 =?iso-8859-1?Q?ichc4NAIBAm7S0NiW0EnUesApfA1z+yqogv7MmirIpNEsQFbKkj197wMX+?=
 =?iso-8859-1?Q?0J9tFKjwBhefwl5MPuRlX5fMBYLSyG+BELjtTEvf0/t/zpyVYJ+LI6si56?=
 =?iso-8859-1?Q?FAxTqmyvFgo1V2dHYKAgNNPxPFUR/VQBO5PFA4b0S6J89s4iu+F2Sa94iw?=
 =?iso-8859-1?Q?gjqK8crl0h9akPyMmV0XrT+0xObHRkCE68GOZf72qPnxwXv21TL4j1jma/?=
 =?iso-8859-1?Q?FtxDyFEf55FnnrOoxs+mQzNnyhFe+zlLxRc9/2DT+7okMIcWhTwu4kdwb0?=
 =?iso-8859-1?Q?QkfViYNi6IywUHQmZa8AI5lO68fVy7rjSQrEI3D1e608Fpa8fyVXEa7cbD?=
 =?iso-8859-1?Q?UFd5JnZNBWRQUDW9gPVZRqJLjMhVFtc3jIncxDeqJKPTJMYf+9gvILBQd6?=
 =?iso-8859-1?Q?DOt1GVrlU/jGIWluAndfjDVi8oAD6EgCWmbuDAvXRzB1ZXeGvtWfZ2PE3Z?=
 =?iso-8859-1?Q?DEH/run8aJacTCAX/4dflTkkbzucMBu4ci3Es+x3/Kora0KxgVZL2zzi+/?=
 =?iso-8859-1?Q?Zhfs9RLLR5f16l1fJPCHyPXSg1gVVsq9+YgPJcVC+fgXdDmMQvpj5rnCxm?=
 =?iso-8859-1?Q?1tAzSgRjg0aif1x3/hQsTHUyEQcf/CILu/2lduzCmNpgWUWrv1cZDf49L6?=
 =?iso-8859-1?Q?zb1FVqnk9Nsyw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: efc406d7-8814-4aac-7524-08da9ae08618
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2022 08:17:13.8823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5vOqi9a/1MxslGSf0YTwQ5VcK40T3T4be2tLmvsx9uVwg+q5pa6FUu5G2jZUNU+QxmyCoKkgzlD4iGkEtlIS6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1100
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08yiVs176cbrhmbpWOV/nj3GkC3fJt/ao8u1e8l7Jqc=;
 b=pMZqJBx8xHHtcpEDWXZRBVwG4/+ukeseJHrVKzUsmLWbvWl8Vg5pLoHYfCF/vymY7ZnDvwjW6crq1CyIn86MoBI6mxptYVx+nr8KYU9Du+qc/ez2SI3H8l/PMEOcEifzPHwOgcgJKpnqhFuJFefpaulsA4vgOQsYMNrouQoQG5U=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=pMZqJBx8
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-gpu-viv: fix
 gbm.pc
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
Cc: "tuzakli.refik@gmail.com" <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libgbm isn't output/target specific, only one version is included
in gpu-core/usr/lib/libgbm.so.
Similarly only gbm.pc is included and not gbm_x11.pc.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 63d5d3c2ea..3c88b8b11e 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -57,7 +57,7 @@ define IMX_GPU_VIV_FIXUP_PKGCONFIG
 endef
 else ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
-	$(foreach lib,egl gbm glesv1_cm glesv2 vg, \
+	$(foreach lib,egl glesv1_cm glesv2 vg, \
 		ln -sf $(lib)_x11.pc $(@D)/gpu-core/usr/lib/pkgconfig/$(lib).pc
 	)
 endef
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
