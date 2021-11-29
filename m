Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AF0C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 10:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C16C80F3B;
	Mon, 29 Nov 2021 10:04:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ugEp95Y8eE3U; Mon, 29 Nov 2021 10:04:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 509BA80E48;
	Mon, 29 Nov 2021 10:04:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4AD471BF3E8
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 10:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4087280E48
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 10:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 10uoz9tEwpPc for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 10:04:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60062.outbound.protection.outlook.com [40.107.6.62])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6354E80E19
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 10:04:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsRAN/7bw3i3Qn6l1DDpBSLMAQNIk94Xln/65avgYrhRbP5wupm68dGyEwntcx7grE33HMHx00DFH6yBoA+nCqselZDd8pivAIbNkA2wdP1KHeZkampnkR0N2jpC5r/x0Vn/+iqTWkVazbJ2E7guFM/g6WaNUALsSq02NcL6wKJMjtm6om5xJrwHwIvzPHtLTcfItgl6J1gKzPgip8mEfBOjSsfIbV91eHzF1/0udcR5Czw+DsPOGtta59tWLb4kPb1NcvpJg5YbJf4aF/RpHRne8Lr/0uKhbyDw2fle2DftIBei1XNlnnPzB2u1eIpsykBU/lupplH9N3kh+sN19g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReklwNsh/ONQKxf9SgdyOcn+R+Ob/qfF7MDG+NhUZng=;
 b=W6lGoHuOAcN14sjgYI0JFil/jLvtUCDOEwyqzUcPRj/+Nz52wGrV3Keunagg6O91zGT3jl2X5kVlg7qFXl3Dc16r9Y/+pkYuFvQlJeucSzLQyJ6aXPMPp7y31FRH805ShJuaxzGZBzGdyWbc5l3U6Xy3HIBdhsltPwhq8iDBoO4KLnNCMpjdZaCYwqDjxEYjPXhR7zikLSF/pvsXASmAUmtH0zB5HBUm8QXGB/uqn7vaY2DUEPsiX2/vEJ7qJ8jp6YWCwrjaxfnk2GYgteg8V8H0A/lTi4aKzsuYCZ8kK4PD7/H8TaWY3wjfnbxTmUdqVIUotSzQKr5v0+mkw8CwVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReklwNsh/ONQKxf9SgdyOcn+R+Ob/qfF7MDG+NhUZng=;
 b=UEd4cT1dGz9g5j1Dr6HiFgnTaEKW8heVZR33LKdMpM8T1pkMPI9Knwt6YDwp5X4O9/d/mbNra6YsuBDnoRaLheG6N+DHwGfmB2R97ozGjwN1QcRAwni7keB2S6TiirFsX7cQRkMW8E0Eq6vaXfa+N2z7Vh54VXPEReKgcSYMcuM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM9PR04MB8275.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ec::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19; Mon, 29 Nov
 2021 10:04:00 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 10:03:59 +0000
Date: Mon, 29 Nov 2021 11:03:58 +0100
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20211129100358.tjhpwco7sxfdmecv@fedora>
References: <20211125155040.90840-1-kory.maincent@bootlin.com>
Content-Disposition: inline
In-Reply-To: <20211125155040.90840-1-kory.maincent@bootlin.com>
X-ClientProxiedBy: AS9PR06CA0359.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::29) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AS9PR06CA0359.eurprd06.prod.outlook.com (2603:10a6:20b:466::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Mon, 29 Nov 2021 10:03:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cb4692b-65e4-46cd-048d-08d9b31f9067
X-MS-TrafficTypeDiagnostic: AM9PR04MB8275:
X-Microsoft-Antispam-PRVS: <AM9PR04MB827524A04B8A8F3B797A3DB0C2669@AM9PR04MB8275.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VR0u7OM9s9S15NvBXHo0AT+0SiggkUILR1t0Hg6JNkbLu1Yon0n9FsJO2ntsSXE/MJx+aFqIrUtt1VQ55JIkft0ZkD9h5DP3DF/wA/FroFNxiWpMp/UJ+CSDqWpS5atcIjxnCzP4horjWIEbTLGTD3xwSG7drDj1ETQni0gYNGiuRMEqRJGFyHjG20uWYCcf4yBGfAdduliJJCWWiVJ/6yy/qx15h34TcPCuj2qH4czHEBp4wLd3zcxKgdOQVR6+8Dodh1P3R08Ntq3jLm7gi/zN1RoldJgt0Xy65oytpRZkIBsQksuziVX6wO9ymsEyb44Kjq/15nI8YiFz9j/uo7KUfey0erQM39Q2/z54rZGzBicpSER97XyFUs2COG+0FpO3dwZHVrV2H5xbnAas85qZybvl13+KOLRK3XKvJ9tG2taBeibH+ywdDctsp3YNG1o5dpXN//9CoKezUvtaRR5LYVpUC3E1O89xN+KuGxMj5AgHkHDs9oq6j+WypI9Z7kMu7+nKcDGS9qcI8lSHxy8UjQ1xUauGFqG9TwQZc0tIqDcUzqQA4s2fDDXw00p7PxO8vSQjpifqLdu3ldPO5XWn+Nl3qVxXMkgMCJl5sf7Ez/TwCHODyfSbMDaaslm0oDQij3XbUWB+xRh8jUw5w/pFAVUYWiZwSYbveJdCNrV12PdsAfxty20A7F2Rqkx2qXIKm7aM1UCmIEtbcOxJy1LbzC9lgM0vJm9iEdsekicJjpATyeGo66trDTPjUYQhsynebhMwHKXqzAxp7TOSoCHZz8LeKu4EUFkmwCQt1Hc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR0402MB3348.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38350700002)(38100700002)(5660300002)(66556008)(316002)(55016003)(1076003)(66476007)(66946007)(9686003)(8676002)(26005)(508600001)(6916009)(9576002)(2906002)(52116002)(44832011)(4326008)(966005)(86362001)(33716001)(6496006)(186003)(8936002)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pG298KBdWVDQwBhJAbaoSmNLH1tZI0UmAawaWgP1zFVjL5PDdXRuInh77d?=
 =?iso-8859-1?Q?EJZi27ImzVSRSgwH7S9Yks1NM/nUx4A2otaFHHBC/bCJ55Vt00MHi2qp8y?=
 =?iso-8859-1?Q?jq0H600bxgBBnBZy95EXMQRnwPRnPO96vV9g5oH2WMKU8dAwEGnAB9ieix?=
 =?iso-8859-1?Q?i+KkdSlWSpgXW8kTMGh929Z3gfezSxEtaFRAcRmrS2IEE9YNHrTsX1h84A?=
 =?iso-8859-1?Q?q/6tmv8owEo1/iI65mkqRXrqbXaqjI2TfhqN0FpBH+vsst745ablTYUE2j?=
 =?iso-8859-1?Q?/kuuDdmagOeeeFkbqZO5oZ31CRNqdPYg+FnYF49B57KnD0nYiXRFfTiQqN?=
 =?iso-8859-1?Q?KAa8ey6hmrCELpTR+4hGyZ1ApKZBaRdWK0jVAUfanRl31JpuZdjUSkBhIl?=
 =?iso-8859-1?Q?9hDw+7wC61W3M0LQI8o74tnKGBlK31xoxpKIFBxZ9ox5ZFnaq+WLRw+qfV?=
 =?iso-8859-1?Q?hVfuK96XSssinIpRGSiMVODEWtbmY8V8Tvu1+fgPajV06QpkSLGT6G1y2Y?=
 =?iso-8859-1?Q?k29PqL007ZhrzXvI7Z0QEiHLvR/l1B1pxSjeD5uXEBh+Z88+XSsohp+mr+?=
 =?iso-8859-1?Q?wHvPiUDDd522uhMRj2BTMRBUozTXXEMcM4y9MNukIVt0JloXZMXrIWy6hB?=
 =?iso-8859-1?Q?/SECs58knRC49wPQFSvvcCd6E7V5W9Hd2W0+yzFDg+wWSO+vfTTc/JrzPP?=
 =?iso-8859-1?Q?HWo9hGKtnZHgLf8v8dUnaNZgDCwGsEb3Nl0SQXSpE7Cc/TgNllE1O6dtwa?=
 =?iso-8859-1?Q?31HDyP4QUbLWk70+aR+da6JAyuxbdlXdxsPXrnWIriros43JUprsdUeNxs?=
 =?iso-8859-1?Q?D4qlOCoBfNTiC3HzDvGXcbD3U+PTS2EOyTmOl04AjtIgbUO4kZ5zyxzNKW?=
 =?iso-8859-1?Q?nddHn1XUE69d0NUALBLJYBulHe16XAwSMbcQ0S5FTGtSlIxGs+PXkAUo/f?=
 =?iso-8859-1?Q?nIU8qzlNiuQIsQ2FIhMRv4SaIZu7hNzWJ2xkYEPKYeZQcO1UXpPgMh03QC?=
 =?iso-8859-1?Q?N3xN34GJRQj5Lz0aTXmLTLlGJPlDH63f4Siojx3Z26oFPQJgckwZoNXsgr?=
 =?iso-8859-1?Q?3R8Mv72qzSF8FDWUBbIv2Yvb9wU6R8GzZ+iemuefrrmOXeyGcRRBmFiRzD?=
 =?iso-8859-1?Q?LDWWXwN+hZDzlh2l/KGM/DI8wF5udzRNZm8Wkv/Mta/7fV5smizHdDk4HS?=
 =?iso-8859-1?Q?jbVc50Q5lrJ/VJo/2gnn5Fwfkr73GXmAbZBO1jZDdB1cCk3Q057z86+slU?=
 =?iso-8859-1?Q?c8BnhtX7Gt/HByedDq01x5iiI1XwX6LGKmxy4XJZZWznxuxhHX0XySvbFV?=
 =?iso-8859-1?Q?KNllxHk30J5LbwEevmJQoCnZdQa9D06PbTf0miruKBBhwGOY3MKY104Ypp?=
 =?iso-8859-1?Q?WljQUZ092RZrJUvsr9nZSMUkS0mYKgkHtU8jojgGoqQmXz5bczYXvptYJ4?=
 =?iso-8859-1?Q?amXUHHLIa1eiemv7/wzxbIdwNs0EEN/WXWUMihBcGDvB9yLZup41i/3TOO?=
 =?iso-8859-1?Q?sRfXDA6MQQAOrMdNFOiRb7G61zmy/LYxDXDKofR0YMGBG70gs4ZYBvd+n3?=
 =?iso-8859-1?Q?X36MUw34pvV7j259a4f2j56MknBMYJfRcZCKxBlVAxkTVF3kOfY/FQXokY?=
 =?iso-8859-1?Q?VqC5fairfUR2JHZSSuo6GJC9oB/qUNpLNdOr1HOcrLS8jblcCFUhxMEgkU?=
 =?iso-8859-1?Q?6+Bv+Ewsk2YodlW3ry+DwCGkrrFxHe2AErQVnZVLRvLoVVPrfwhe+PCwfI?=
 =?iso-8859-1?Q?mUuK5RevHUUcjpOeS8A/IWh06Tn5+s1mQuE2kmWsTGk8FGIgdWbauKeRCA?=
 =?iso-8859-1?Q?vcn5m63dCQ=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb4692b-65e4-46cd-048d-08d9b31f9067
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 10:03:59.8833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZ+x07FYfd8kqtIAK2ZJ+gf+Q/tEZolKtP1QHhBb4cpm1cZKpuvHZ63PUbmNhw+ofhOI8irOG78vOl8HgfT8oLFDiXCyKG7mGKYP4IBoIlC5QGyGEN3k/DWqTlIA7Dzh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8275
Subject: Re: [Buildroot] [PATCH] package/rkdeveloptool: add new package
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi K=F6ry,

On Thu, Nov 25, 2021 at 04:50:40PM +0100, Kory Maincent wrote:
> This package is a tool from Rockchip to communicate with Rockusb devices.
> =

> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  DEVELOPERS                             |  3 +++
>  package/Config.in.host                 |  1 +
>  package/rkdeveloptool/Config.in.host   |  7 +++++++
>  package/rkdeveloptool/rkdeveloptool.mk | 15 +++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/rkdeveloptool/Config.in.host
>  create mode 100644 package/rkdeveloptool/rkdeveloptool.mk
> =

> diff --git a/DEVELOPERS b/DEVELOPERS
> index b190c0f356..b92727a3f5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1562,6 +1562,9 @@ N:	Koen Martens <gmc@sonologic.nl>
>  F:	package/capnproto/
>  F:	package/linuxconsoletools/
>  =

> +N:	K=F6ry Maincent <kory.maincent@bootlin.com>
> +F:	package/rkdeveloptool/
> +
>  N:	Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
>  F:	package/bcusdk/
>  F:	package/libpthsem/
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 6e5a5c5fc5..dfdd4c3eb1 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -76,6 +76,7 @@ menu "Host utilities"
>  	source "package/qoriq-rcw/Config.in.host"
>  	source "package/raspberrypi-usbboot/Config.in.host"
>  	source "package/rauc/Config.in.host"
> +	source "package/rkdeveloptool/Config.in.host"
>  	source "package/rustc/Config.in.host"
>  	source "package/s6-rc/Config.in.host"
>  	source "package/sam-ba/Config.in.host"
> diff --git a/package/rkdeveloptool/Config.in.host b/package/rkdeveloptool=
/Config.in.host
> new file mode 100644
> index 0000000000..c5af34510d
> --- /dev/null
> +++ b/package/rkdeveloptool/Config.in.host
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_RKDEVELOPTOOL
> +	bool "host rkdeveloptool"
> +	help
> +	  rkdeveloptool gives you a simple way to read/write rockusb
> +	  devices.
> +
> +	  https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_roc=
kchip-2Dlinux_rkdeveloptool&d=3DDwIGaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLe=
xDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3Dn5eBBRFXU6F=
d9z7euAAt8lQcSXD_gx0NejtlfudGc6ABGfTrEYVwVjfWd7jqfDDo&s=3DSOxg93OG8XbLFuec6=
FWRdGDRNly00jjChoJL1CWYCPE&e=3D =

> diff --git a/package/rkdeveloptool/rkdeveloptool.mk b/package/rkdevelopto=
ol/rkdeveloptool.mk
> new file mode 100644
> index 0000000000..2345dcefc0
> --- /dev/null
> +++ b/package/rkdeveloptool/rkdeveloptool.mk
> @@ -0,0 +1,15 @@
> +########################################################################=
########
> +#
> +# rkdeveloptool
> +#
> +########################################################################=
########
> +
> +RKDEVELOPTOOL_VERSION =3D 46bb4c073624226c3f05b37b9ecc50bbcf543f5a
> +RKDEVELOPTOOL_SITE =3D $(call github,rockchip-linux,rkdeveloptool,$(RKDE=
VELOPTOOL_VERSION))
> +RKDEVELOPTOOL_LICENSE =3D GPL2
> +RKDEVELOPTOOL_LICENSE_FILES =3D license.txt
> +HOST_RKDEVELOPTOOL_DEPENDENCIES =3D host-libusb
> +

Isn't it missing the host-eudev? I had it in my local package that I
forgot to upstream. I assume building it in a minimal container would
give us the answer.

c.f.
https://github.com/rockchip-linux/rkdeveloptool/blob/master/Readme.txt#L4-L5

Otherwise, I had the same for everything else.

By the way, no .hash in this patch.. Is this expected/okay?

Otherwise, looks good :)

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
