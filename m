Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADA7C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 16:10:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13B1B60F24
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 16:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13B1B60F24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4AE24053F;
	Mon, 27 Sep 2021 16:10:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4hTYhdZTLBGz; Mon, 27 Sep 2021 16:10:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AEB440534;
	Mon, 27 Sep 2021 16:10:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19E111BF955
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 16:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 086BE403AA
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 16:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=impinj.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h0Ohuy6r8yd7 for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 16:10:12 +0000 (UTC)
X-Greylist: delayed 00:07:22 by SQLgrey-1.8.0
Received: from us-smtp-delivery-168.mimecast.com
 (us-smtp-delivery-168.mimecast.com [170.10.133.168])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B2334023D
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 16:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=impinj.com;
 s=mimecast20190405; t=1632759011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iOWzF3HnGIgTz/D2D+8OLuZgXVE3/xBkPhxZKN+iDlo=;
 b=kP5BM267TQIuqKJx0zf7MuZEsaf5VRkVkCbn7SoU3eHWi26YqrI0/e8p2/o/OqeHG5zBA9
 YTC834de/NY6bUbybDiNkbYl/L8ygV6gOD8nJiNeS9oEM2lYl0BOBglkWsrgs6dsz0PqcZ
 Qte7yJZmNgEs/tGtSX9z5Xypp4boH6U=
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-WO4MvuTOOUWUjEkjjHdxcw-1; Mon, 27 Sep 2021 12:02:47 -0400
X-MC-Unique: WO4MvuTOOUWUjEkjjHdxcw-1
Received: from CO6P221MB0710.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:141::7)
 by CO6P221MB0776.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:14b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 27 Sep
 2021 16:02:45 +0000
Received: from CO6P221MB0710.NAMP221.PROD.OUTLOOK.COM
 ([fe80::f88c:e8b0:49:f4e9]) by CO6P221MB0710.NAMP221.PROD.OUTLOOK.COM
 ([fe80::f88c:e8b0:49:f4e9%2]) with mapi id 15.20.4523.018; Mon, 27 Sep 2021
 16:02:45 +0000
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/python-inflection: needs python3
Thread-Index: AQHXs2HjUuPggHZQr0+X4/IUnAIr0qu4BL8i
Date: Mon, 27 Sep 2021 16:02:45 +0000
Message-ID: <CO6P221MB071002144E76B47D0CF7CEEAB4A79@CO6P221MB0710.NAMP221.PROD.OUTLOOK.COM>
References: <20210927053740.1060569-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20210927053740.1060569-1-fontaine.fabrice@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 5d2bf526-c84a-7cf1-bce7-16cbaf7969dc
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd5db064-8c14-40c6-4702-08d981d03eea
x-ms-traffictypediagnostic: CO6P221MB0776:
x-microsoft-antispam-prvs: <CO6P221MB077625BA7F11155D194DCC04B4A79@CO6P221MB0776.NAMP221.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:595
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 6ObFhvdexetd4rpAoSw8EBBKtwDcRM4loTXNg6Y8IY4PfCZEkp74brxQYu8KnKpT3/mOWlyJpeacc4jvEA5Nrg9LKSjTmuJq3dACf1wM7NxxFNGKXZNtHydJMp0X3u41Z90p40GuGxy8m4PW8CQBluVP7yC9MejozxwKSDe9+yh1RAbcLqVcmFZ/3l337bx7JZTZwzYBo3iz2vf3Cai1WHoMMD56peIjRT9D7L4ei062xjQ6fMwirB2GVBusVJGXqKoHan8r5bSW1bhRv8jwj4gmfKdM7E7N2PD9BmqRpDfyO8AXene+kcO3ToRpP+JGBtzRgaIB05airkeO4lgVlSc7Ctot69yEAcxsvWV0qrNG46jYN1DGKbX2lbiY88XEHW8g3ynylD/thEp77SYaa0YvG15wBQctEvsB3CSXuROYJOYtQ9C/v+1nsR4HiGBWv69h/nr9xf7b5QKLaZWHDV0Jwagq0xJmtiAGUGHWhe/9sm+VGqHQrdsut72FstF12RoqG8b0f5H0aW/3L0qid2qSBpj8p3eu/th5Ehc6vsFabYXhJNnPaARCVw1vNGO4YyvlDgHz7iBdN+fqdTMmpxKJpykgpinxRoSwd/SAWeLeTtgJZdZ+oOvuxFZ9APZ1imS/dtQsG1V9dQVsI/AoxcMNAGHiUAprpZIyKpuiRLTon2nx0Ak/2xoOdnvlKpfpBNgWpbZ404Y+6eZz8IbCh9wccZrCNEmo9evDJsnavh6r70JFVcu39fjt5YqzofANzYE7NdVAkXPoE9RyT7Xes1b1+fwwtFzYojPMyEjOT4I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6P221MB0710.NAMP221.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(966005)(7696005)(71200400001)(508600001)(5660300002)(316002)(122000001)(8676002)(2906002)(64756008)(66476007)(9686003)(66556008)(55016002)(110136005)(26005)(8936002)(53546011)(52536014)(38100700002)(54906003)(66446008)(66946007)(38070700005)(83380400001)(186003)(6506007)(86362001)(4326008)(33656002)(76116006);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?a7x/zhjFQV/efGTzV0S2A+CtHtQdWUcCS+ZUggKqgoyHbc2QoUdSf4sgC/?=
 =?iso-8859-1?Q?n/Sd686acvdqn+vmLLOrGcuYBnR4h/LOUdqAXZXaeQJ4C8MGpM7Vrh17dQ?=
 =?iso-8859-1?Q?G03eo119KPApXV4kWUowO6hnMKQUpdr5T8oP1y7hlLLm+runyaMmB37fc/?=
 =?iso-8859-1?Q?ikX1z0szQ0sDd3e5WNGPcCRpcBD1OUhs2PFaAiyqabLfl1+AibwGftZ8Ym?=
 =?iso-8859-1?Q?lvKGEM1e2Xqnoi2bNCwC9C9ZcjeltuhBipaBB2S4HBC+Fwrqa3h4qSqWH4?=
 =?iso-8859-1?Q?MBQim93daikJIIoW0QmvVf/BWZmjaOcQY5qYBr+8VCcB9IP0S+DvK5w+dm?=
 =?iso-8859-1?Q?FVOEd0UXtsm3izuqmjSi2ElZBUbHoohXfDzZdZZmIwmSgCQUOeCTrC9eHw?=
 =?iso-8859-1?Q?HFZRu/L2495BfiGvC0m34IeskKjrclfCacm4Add2bGx4Z9RjnbIxCq2/Si?=
 =?iso-8859-1?Q?9baHoFuD4wRfZoU3FJT2ppOwgoTqY2+I+oxw6LJjhjUZD6eWMh61rAkrbt?=
 =?iso-8859-1?Q?0TlnsC6iXIt4E/+HhH4+yCVyjDVl3qbTZncUjiA1wga69FL8JVKvMrzALF?=
 =?iso-8859-1?Q?h0A2mYvoEPwUj3WoX1Oz79i19hrLEaZKGUUjQM8l7DvqqYuY92l2N/k08G?=
 =?iso-8859-1?Q?pCy7bGaxTXE63adjkzAK7bqVNuR8T9K47kPHGHwMWan9+soIIh5VAvVqzg?=
 =?iso-8859-1?Q?W3+9cXM89u0ONHx7/ttYQZI+fftgGAReKkcRVf03ex0Y5l5arS35JVLYb5?=
 =?iso-8859-1?Q?kIpVnolWN8kAJiwVyS7OQuUFk4SeKW1T32ZFk1Ek1QRDa9iBHQLMxEU+Wp?=
 =?iso-8859-1?Q?rghS4pGlmJt8KoU/qfG+yaQCG9KaeWD8QZIWmdt9W9mde54cDO8qB7EFlT?=
 =?iso-8859-1?Q?QDBhsb+jXXiHBnkX7ZtHvDleCy2ZaWZzpLU2Z+ThhRXZcEwAyeptkP0PBQ?=
 =?iso-8859-1?Q?GLZAlUFIBT7X31xiB+GlNgZRyU5RiwjO9mWEexx1QFGKuRM6rr7rdFOfm3?=
 =?iso-8859-1?Q?4k62m2IDt1+c2Sl0zWedph6hHhWlIc6rCV77Y7QC4asY8nzUMRFSD0eFu7?=
 =?iso-8859-1?Q?i0WwZ7XQZTu5oW4P5HE/O2AgY61xrhuhE/aOsN6l+eVW2eSqFBnQ8v4DJJ?=
 =?iso-8859-1?Q?q0LAdViTgOCbgk+1gE26v7pugAyBy50GBtN/5EB+R3xEu83EunbTBXoADE?=
 =?iso-8859-1?Q?Z/a/nXzfODU+DicAzojUYkloeWLfb8ffGvDWf1BoWsmAoROdRblSMr625U?=
 =?iso-8859-1?Q?7YXHa2VnWxx0I1V3UqP9QkYCAZehwR1HLiiSxGD1f8xKYENIv4Phd97Qsx?=
 =?iso-8859-1?Q?xOAXhpqO40uQoDczzCCNpNs9Ha+V/ZPQp3zWDvotyVXLyklhCUtBH2QAv5?=
 =?iso-8859-1?Q?dEDanM7rJS?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: impinj.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6P221MB0710.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5db064-8c14-40c6-4702-08d981d03eea
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 16:02:45.7053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6de70f0f-7357-4529-a415-d8cbb7e93e5e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 33berulahOpyrkBA6cK8ws2STpL1h80AHrkfb0p3hOsFpscDxG/ioNb81YEP68nSkXDKx/Knby/DovnufPb9VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6P221MB0776
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA68A241 smtp.mailfrom=jfaith@impinj.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: impinj.com
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 1/1] package/python-inflection: needs python3
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
From: John Faith via buildroot <buildroot@buildroot.org>
Reply-To: John Faith <jfaith@impinj.com>
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Sent: Sunday, September 26, 2021 10:37 PM
> To: buildroot@buildroot.org <buildroot@buildroot.org>
> Cc: John Faith <jfaith@impinj.com>; Thomas Petazzoni <thomas.petazzoni@bo=
otlin.com>; > > Asaf Kahlon <asafka7@gmail.com>; Yegor Yefremov <yegorslist=
s@googlemail.com>; Fabrice > Fontaine <fontaine.fabrice@gmail.com>
> Subject: [PATCH 1/1] package/python-inflection: needs python3 =

> =A0
> =

> python 2 support has been removed since version 0.4.0 and
> https://github.com/jpvanhal/inflection/commit/a826dac7a562e67881ab704adbe=
f45440566836e
> resulting in the following build failure since bump to version 0.5.1 in
> commit 6c09567e6b6f2cc826e64cd9b36fb41ed7c6e00c:
> =

> File "/home/giuliobenetti/autobuild/run/instance-1/output-1/build/host-py=
thon-inflection-0.5.1/inflection/__init__.py", line 91
> def _irregular(singular: str, plural: str) -> None:
> ^
> =

> Propagate host-python3 dependency to host-sdbusplus
> =

> Fixes:
> - http://autobuild.buildroot.org/results/6d6e937135ef95c63001359fec5f8c28=
183fc0a9
> =

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> package/python-inflection/Config.in | 4 ++--
> package/sdbusplus/sdbusplus.mk | 2 +-
> 2 files changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/package/python-inflection/Config.in b/package/python-inflect=
ion/Config.in
> index 427275bc71..5b6a26fead 100644
> --- a/package/python-inflection/Config.in
> +++ b/package/python-inflection/Config.in
> @@ -1,7 +1,7 @@
> config BR2_PACKAGE_PYTHON_INFLECTION
> bool "python-inflection"
> - select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON
> - select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3
> + depends on BR2_PACKAGE_PYTHON3
> + select BR2_PACKAGE_PYTHON3_UNICODEDATA
> help
> A string transformation library that singularizes and
> pluralizes English words, and transforms strings from
> diff --git a/package/sdbusplus/sdbusplus.mk b/package/sdbusplus/sdbusplus=
.mk
> index f4e258089b..498b835052 100644
> --- a/package/sdbusplus/sdbusplus.mk
> +++ b/package/sdbusplus/sdbusplus.mk
> @@ -10,7 +10,7 @@ SDBUSPLUS_DEPENDENCIES =3D host-autoconf-archive host-p=
kgconf systemd
> HOST_SDBUSPLUS_DEPENDENCIES =3D \
> host-autoconf-archive \
> host-pkgconf \
> - $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python) \
> + host-python3 \
> host-python-inflection \
> host-python-mako \
> host-python-pyyaml
> -- =

> 2.33.0

Reviewed-by: John Faith <jfaith@impinj.com>


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
