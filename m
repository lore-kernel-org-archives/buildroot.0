Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4B4C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52B5D813EB;
	Tue,  6 Feb 2024 17:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ze-OPIxRzvCv; Tue,  6 Feb 2024 17:34:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 545E781B26
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 545E781B26;
	Tue,  6 Feb 2024 17:34:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78C571BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C71740A4D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C71740A4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C3BGvqEdyICN for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:34:31 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02olkn20800.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2c05::800])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4DA440A39
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4DA440A39
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVrgZ731gn9m1fXLSjgmcGREiod/EtrZ5YTxsPyTGPmu7mIAmyGXkYh2+KCnwNJr16rZslmGkIJ5oRkMjiDAGGHiXxP/C3OOsqYRwO++dIZv73rF+8GziYatDHnVp7TgUy9o/DikkE0qk2zqye0IghPib9WiB8yonv7mJhdJmbu0yzb0aPp6pIYcuXr2pntAXJzr7bpovEXA81/2/X0shnC9ZiqyMhNEwNV924KPh34bMz8jE6jaTJFEQRYkgbZgVa++glt1nGpGEshNr897jL6tGZu1OzFNr08Rfzj6FkZSSc65hAsyAuRcht7ATjSoIhWuHbb4uxKTsRE2vLrB2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cn0nOy0S4teXm9IcRfk2X7tv8g/qMcifLdUWf3bV1aY=;
 b=keihAGtNxzAZYE4d27T+/aEf1husd2roH3q9ZCwwKgsVzciaq473OOiNiLZODqGAJ0pbDY8YLa3MiHhb4m6MMdPlFDAOm3JwXPOwNw6vwWjLS+wnmxgDe412ekhC5LAZwUxxtlhzDu0A2In7KSRNdiO/+BHIQmOIQ12iDZ11FVLeXHnNixW7xys8Zm/2j7vedoHk2rwvyqs0FB1Y6ZQkucZUlVl16gHnUt2GgBRqQ04ap8CPLF9qWjZtWaZJJqMh9owFbJy3GQdpj3PZ4/b0ufp/xqL+h8srHTTRF0YZPZpHy5mIJzHXpu37ED9dL/wqLEJvrREkhQxaPd1t3KV0Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from PH0PR19MB5409.namprd19.prod.outlook.com (2603:10b6:510:f9::21)
 by SJ2PR19MB7485.namprd19.prod.outlook.com (2603:10b6:a03:4c3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Tue, 6 Feb
 2024 17:34:26 +0000
Received: from PH0PR19MB5409.namprd19.prod.outlook.com
 ([fe80::fd93:9a21:97c9:807]) by PH0PR19MB5409.namprd19.prod.outlook.com
 ([fe80::fd93:9a21:97c9:807%6]) with mapi id 15.20.7249.027; Tue, 6 Feb 2024
 17:34:26 +0000
From: franco ariel <fran.millocs@live.com.ar>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>, Thomas Petazzoni
 via buildroot <buildroot@buildroot.org>
Thread-Topic: [Buildroot] Best board to fast boot
Thread-Index: AQHaWKlG8tvJrfQHJUKLNdjjShuIxrD9ExMAgAB3yKM=
Date: Tue, 6 Feb 2024 17:34:26 +0000
Message-ID: <PH0PR19MB54097969BD5D5FAEF521E458D0462@PH0PR19MB5409.namprd19.prod.outlook.com>
References: <PH0PR19MB5409C4B7C56D0550E15A83ABD0462@PH0PR19MB5409.namprd19.prod.outlook.com>
 <71301602-56ac-46b4-a853-bd71ed74da27@benettiengineering.com>
In-Reply-To: <71301602-56ac-46b4-a853-bd71ed74da27@benettiengineering.com>
Accept-Language: es-AR, en-US
Content-Language: es-AR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [wyB9Kt8WndNeUSgmVOtQen+YWhuU2TbtP4sVLKdrMaOjnbkAsDa5aj8z+0qSwBEL]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR19MB5409:EE_|SJ2PR19MB7485:EE_
x-ms-office365-filtering-correlation-id: 2bb6105a-f8c9-4f24-a568-08dc2739dd65
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BsKxrEEc7Q7GH2IHaoMoKgSlidg43jf+TL1VOw6A/hNNd1PvLpisDwsvIbmULLLffsoTX17nKtHcvj2FPDr1VKod9fomww8jYXYQ8LZJQB+gFR2ZyDhMGMgO3IP9Ql82qzygzmxjXYZsComa/fK+EcwJeiQhHYWq4NZ8NJHgBaYdjvzE0IRQJE757pNW54BQAk21LREwumUK3vk6EGzd9uteTN6njh08/nmWHZVluIbS7w6jmriCastVVK62yaWyBx9yyKOy3K7WAnKl5B8Q+b4Yd8JP9CAXNomPYkQm/oFwjxpsW7iATT9b479Mm6EXE1FpmyIDnx/9WGDYe/6v4EIan4ShkOLcIibdgkblXAGhLorUmVY4tWk++3xMHBE8qVJdA/a4F8EyJ5uBHLbLXuxsPYGfjTNAugzMiM4kEahHGizgCx8c065JSyZs+ogtZZlc7rFGJsWckCEGibNHvzwIdvyHKO6l6jrXn+R9F2zZJ+PaXxCLeqZEXu5NCT4ElTH2Fb/cBtVvnlG4sqvNGG2c55W2yh+TVWp4oOoSvAO7pI8nFmFVVn/IVBGzczoIIq9fSu7CwqCOwMZabITHQnTB0EYCi3ce+LhmNgXv/KY=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?CrAUIAxyNN2mN0PT++GoRjSQDF6Etp4ZlNaW0M4P/b2zBdMKdVRh3/r0nl?=
 =?iso-8859-1?Q?qg3t5+JnXThkIxSFgeYiXkPKXlrsJOlFTUOkmCrq8HTMzorfYBXMj88bnH?=
 =?iso-8859-1?Q?1zu9K/jlO0eubfj1Ca6iNRUwbPzqBWT359jfrP8hKILaxfzUzSoU+A6DyN?=
 =?iso-8859-1?Q?hsb3a7jsDxMdbjsb9T+rg236WtdNT++yYkruN1Qnh+WK0zOMF6RiFCsoW3?=
 =?iso-8859-1?Q?wlabqiw3R0uWa1b/7iI7sZM5ny8+4mS16yvzMCQZKj96kE7TpfPtDDTQnI?=
 =?iso-8859-1?Q?G50WRDyqfOsPeRKst2Lu24TXKipl3Y3ocFFRJ6UerjVTbuE1P7YhThxb96?=
 =?iso-8859-1?Q?MvMwdh/cePR+DX3K/rmt47Rl2oqetKU+Y2iTf0TcJGStqODTF2hf4e7ydA?=
 =?iso-8859-1?Q?LoM2WtEfapn+/fYJoAREAaMM0ht45XC4pGhFVoOFAFwt/q+13uasy6PQVV?=
 =?iso-8859-1?Q?XegYToXa+OPHUaPD3uVUcPJmuFn3hIGfq3tW//NRrUj9pwacD5bjz5lNER?=
 =?iso-8859-1?Q?jZUoua220HAVxsXDXIaR7V5w8szBQOEsO9kUGvx/wu7+PqTV88oErJr9Lc?=
 =?iso-8859-1?Q?NlCyhe6W2zLku4QEPCY/0iLWN/WABmKqgerm5Jg8hZ5wl1awI/HJgRTZZC?=
 =?iso-8859-1?Q?yv2oMESaYSLaH2bT4osCOv2XWv3JW3wRbRqCwcf6JjsuTQmuP9ndHqAQbZ?=
 =?iso-8859-1?Q?KqhouNH+bi4IJqGkLgrAkqu3jobgQWkEs96ixDZxRn/b4GyXFUa/UW7rH2?=
 =?iso-8859-1?Q?maDffg4FJG8TZayiTLM4ZJxoDcOdZv4eT3p6IEIvNQO8Rcjb8QFChwdGbD?=
 =?iso-8859-1?Q?+XCoSLjTbDcuiW4S2I8pmQTtRL7p1Tnd/O0funfN/cujKG1PunqEiQlsG/?=
 =?iso-8859-1?Q?8NAgPFRqQua+DhE71Bc5sPHF63BBhFhGW8gr5facZsC8oYU7PsBv5viWw2?=
 =?iso-8859-1?Q?a7i4XFb6ZoZ3BcGzDUTsKaKYb8rRjImVMo4zUrVwqMdakfvIKBAhQgTiaF?=
 =?iso-8859-1?Q?haRTj/R5BYAnWzu3vkOl0xbu6k7s5Sn99jDNRcobtcaLN/SKb2kiJ04Vmq?=
 =?iso-8859-1?Q?d3dkXTBjEHMt0UClme79raoYrgbzH8cDi4vpU22/cIETzdU4Mykah0f8//?=
 =?iso-8859-1?Q?miymVXiSppqjDy3MYHcsmrJ41bRaV1OWPG+4YnK60qWL7NfTYaSCqEDHWN?=
 =?iso-8859-1?Q?4uFXX6Paut6pOitG4VUoQBAmEIIaMQgfeeuTcWgbBqyHdINLuoT9+1UNOh?=
 =?iso-8859-1?Q?TI3qFqlLIdqrbbeJczu5G2qTyqw1DGPIHmYRFVMrxeTG96MS64P9ox1MCT?=
 =?iso-8859-1?Q?2md/fEz+rnuRNjXgWsmEHYX+iA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-e7757.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR19MB5409.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb6105a-f8c9-4f24-a568-08dc2739dd65
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 17:34:26.0705 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB7485
Subject: Re: [Buildroot] Best board to fast boot
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
Content-Type: multipart/mixed; boundary="===============1765595514923329303=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1765595514923329303==
Content-Language: es-AR
Content-Type: multipart/alternative;
	boundary="_000_PH0PR19MB54097969BD5D5FAEF521E458D0462PH0PR19MB5409namp_"

--_000_PH0PR19MB54097969BD5D5FAEF521E458D0462PH0PR19MB5409namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Giulio,

Thank you for you answer.

Based on the PDF I see that I can't do those optimizations on my rpi4, beca=
use the bootloader is not open source, right? So, the Beagleboard looks goo=
d but, the RAM is quite low, I was looking for something better to run my q=
t application, which has smooth animations and transitions, BLE, touchscree=
n support, etc. witch board, with the bootloader open source, can I use to =
boot as fast as possible into the qt app?

Thank you,
Franco



________________________________
De: Giulio Benetti <giulio.benetti@benettiengineering.com>
Enviado: martes, 6 de febrero de 2024 06:52
Para: franco ariel <fran.millocs@live.com.ar>; Thomas Petazzoni via buildro=
ot <buildroot@buildroot.org>
Asunto: Re: [Buildroot] Best board to fast boot

Hi Franco,

On 06/02/24 05:14, franco ariel wrote:
> Hello guys!
> I few weeks ago I started working with buildroot on rpi4, and it's look
> amazing, thanks to the community I was able to run a flutter app on my
> rpi4. But now, I want to keep going forward with my project, so =BFWitch
> one are the best board to achieve te best boot time to a Qt application?
> I was looking for the Rockpro64 from pine but I'm not sure, since there
> is not so much information about this board.
>
> What do you think it will be good for my project? On rpi4 I was able to
> get 10sec boot time until the qt app shows up. And I want to achieve
> less than 7s.

This depends a lot on optimization you do on bootloader, linux and init
script.

I suggest you to take a look at these slides:
https://bootlin.com/doc/training/boot-time/boot-time-slides.pdf

Best regards
--
Giulio Benetti
CEO&CTO@Benetti Engineering sas

--_000_PH0PR19MB54097969BD5D5FAEF521E458D0462PH0PR19MB5409namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi Giulio,&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thank you for you answer.</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Based on the PDF I see that I can't do those optimizations on my rpi4, beca=
use the bootloader is not open source, right? So, the Beagleboard looks goo=
d but, the RAM is quite low, I was looking for something better to run my q=
t application, which has smooth
 animations and transitions, BLE, touchscreen support, etc. witch board, wi=
th the bootloader open source, can I use to boot as fast as possible into t=
he qt app?</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thank you,</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Franco</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>De:</b>&nbsp;Giulio B=
enetti &lt;giulio.benetti@benettiengineering.com&gt;<br>
<b>Enviado:</b>&nbsp;martes, 6 de febrero de 2024 06:52<br>
<b>Para:</b>&nbsp;franco ariel &lt;fran.millocs@live.com.ar&gt;; Thomas Pet=
azzoni via buildroot &lt;buildroot@buildroot.org&gt;<br>
<b>Asunto:</b>&nbsp;Re: [Buildroot] Best board to fast boot</span>
<div>&nbsp;</div>
</div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 11pt; color: rgb(0, 0, 0);">Hi Franco,<br>
<br>
On 06/02/24 05:14, franco ariel wrote:<br>
&gt; Hello guys!<br>
&gt; I few weeks ago I started working with buildroot on rpi4, and it's loo=
k<br>
&gt; amazing, thanks to the community I was able to run a flutter app on my=
<br>
&gt; rpi4. But now, I want to keep going forward with my project, so =BFWit=
ch<br>
&gt; one are the best board to achieve te best boot time to a Qt applicatio=
n?<br>
&gt; I was looking for the Rockpro64 from pine but I'm not sure, since ther=
e<br>
&gt; is not so much information about this board.<br>
&gt;<br>
&gt; What do you think it will be good for my project? On rpi4 I was able t=
o<br>
&gt; get 10sec boot time until the qt app shows up. And I want to achieve<b=
r>
&gt; less than 7s.<br>
<br>
This depends a lot on optimization you do on bootloader, linux and init<br>
script.<br>
<br>
I suggest you to take a look at these slides:<br>
<a href=3D"https://bootlin.com/doc/training/boot-time/boot-time-slides.pdf"=
 id=3D"OWA4071e8e9-2bcc-bf4f-d1d4-3a8189791ba8" class=3D"OWAAutoLink" data-=
auth=3D"NotApplicable">https://bootlin.com/doc/training/boot-time/boot-time=
-slides.pdf</a><br>
<br>
Best regards<br>
--<br>
Giulio Benetti<br>
CEO&amp;CTO@Benetti Engineering sas</span></div>
</body>
</html>

--_000_PH0PR19MB54097969BD5D5FAEF521E458D0462PH0PR19MB5409namp_--

--===============1765595514923329303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1765595514923329303==--
