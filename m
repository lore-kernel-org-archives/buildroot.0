Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6439BC433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 13:54:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E2FE61056
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 13:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E2FE61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0979884187;
	Fri,  8 Oct 2021 13:54:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mjFlOQAXAKXv; Fri,  8 Oct 2021 13:54:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A7C784167;
	Fri,  8 Oct 2021 13:54:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 535BA1BF591
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 13:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42F0C40372
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 13:54:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=barco.com header.b="XxNsIPzS";
 dkim=pass (1024-bit key) header.d=barcozone.onmicrosoft.com
 header.b="S1KU6xFV"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BPPhB39xmjvu for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 13:54:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa3.barco.c3s2.iphmx.com (esa3.barco.c3s2.iphmx.com
 [68.232.159.70])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72422402D8
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 13:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=barco.com; i=@barco.com; q=dns/txt; s=ces;
 t=1633701290; x=1665237290;
 h=from:to:subject:date:message-id:mime-version;
 bh=Yvzb8NfdfUJ5DDwX3JPsBQrHdQ0jyHk6m9vIOlU/Bp8=;
 b=XxNsIPzS7r80ZJ7FdTW2iMhU3uLchSN6EjrJZ30ctEVD39ZlKOH787/t
 VS4TI7LZJJM/JFQJ13KMrzVGtB+MDhm0Bg1Iz4rFo4bBVH31s6QyJjtkJ
 Go3bkopWMafoqLsCLNVnDD8wI63accP3jkeu7F+ndVew8gFZNBlFJnL8G
 0ivWty7/O1TbqvZtK6RhN/fRycXU+KnrcnnZlf2XI1INGdOYTBq4Jr0Bs
 TVpwmD4NLutaICorzO6JuX/aq3zDMEbyTYFTLX853XunnVmNCzXH2szgp
 7TktIAvhfAfP5NW/SEir7RQteGoezK5uoeqpmZsgaJHcIBKYyI0w7OQVE A==;
X-IronPort-AV: E=Sophos;i="5.85,357,1624323600"; d="scan'208,217";a="25783509"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y72STsObaQpUhY2FXH3ac9C9MDfkOH/BUgQasqcoCEwLWdbKAlyfH4NJ8hay+bbruKyEqZKHHDdH5novHlflIwPNZDzzsuC3Ed7a7g8Jgwfee5s99EUCtRxGegzlm0uEyunp/7iduDfVEkeBXcmCblDJb/7V57fBxfrUnqRhBVpdJ2zTRLKSUqkHEs3wvaJHASU8ifyoJMbDqXM/aD1BMZMcc+r5H/0/N1T+6Vdiu4x2IJbpKMyxe9AjErsxSFQTqSoiEah8wi8mo7c8rp1kx+fU8F9BygFmNYwwil4Xmpk3+ThhEGCtSoSXoUzH41htB4DVLLDC1frusir3QNUYKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lxlw9dBUT0EMPCwvWVZ8sqfI7wnTLk82I1qdkIC1qHo=;
 b=JMPjQxhBseHn67gx/aItZy51zyftu0JebQEuXmIfV8a2t6Fbole0tTEuEWplzuRoG7ly5QxuUpZA61zTOLDQQ2H7SikNpMCmqJnvFjYRrPkUirGJbDbnen/cB8tYi/iC9+orGdTuYu/Z3IfqqWSDfk8n/c0Rh51kvLY7kB5jxDrJvVzdH/qnY9PyZrzz6laagP/VicIyFnKaG6noA0VpCHHk8g6yW3vMc7E9MzHNmp+48qxVv+2DfdxSuOpIhF6uYe6iAWxMBAc5ZL3ovWvaf6g7Ns1CQFPenIhOnTTJcNK5/IBokCTUZTqxQtVbltHG5HW66KUJb4qQtjSpSY6vyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=barco.com; dmarc=pass action=none header.from=barco.com;
 dkim=pass header.d=barco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Barcozone.onmicrosoft.com; s=selector1-Barcozone-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lxlw9dBUT0EMPCwvWVZ8sqfI7wnTLk82I1qdkIC1qHo=;
 b=S1KU6xFVnrBhu8BLm/F3CQPP8kFVeDEGYnrR+rlqWrKIqa3s5pWTakKfZuQ1jGsmskugj7vV6RNai4IoOyC3+pcdYZUzdmi3DS9t+rsn3NsDltiO8YY7hIF4fc5d4v4wlt7j1bUsNj0nc2ROF8Yqf5fVhtkGMyk1G7mIlyqDbGM=
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH/RFC 2/2] package/nodejs: bump version to
 14.17.6
Thread-Index: Ade8SzqULdNNK/kfSvyrnn8Iknk/Xg==
Date: Fri, 8 Oct 2021 13:54:47 +0000
Message-ID: <AM0PR09MB3907D9CFEE70F772597A1E7896B29@AM0PR09MB3907.eurprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: buildroot.org; dkim=none (message not signed)
 header.d=none;buildroot.org; dmarc=none action=none header.from=barco.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcdac8a1-87fb-49fe-dae3-08d98a633112
x-ms-traffictypediagnostic: AM0PR09MB4354:
x-microsoft-antispam-prvs: <AM0PR09MB4354C3EC8A0F7E2C736BBC0696B29@AM0PR09MB4354.eurprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 03q/TnYGuj9bC+tMkXg/RneYxb9W8L0mZNDu+4800AAw+UsJ0cnBOTVTM+ZRprocClufe0iswRFarHqqhZE5NdlX/EtyxWD2rv6vV5kWtRe4tzq4/cH8B5j7og8k+fGgWmz7NU3p2c4t11hiGllcqwoWw6vGC4TwhgvRZJkI0rL+7mU4+pdVbnPdWBUEbSB+cccPKfS2wxqlbzP9Hp6UqYcIQUwi2Au04T6sUHGSjK+bnsI1DjIeQGPBFk9OUtmokqILJh++cbJENpu31OC1fG8fXMueA7V/Pz+dytywQ6nb1ebaJ/HcSjhtqoOoq13LcHbY6GFeBnTCaXFHxgjNAwuqfyLxNtfPBAvMBwsROYetjW6SwNO7fEcMhZf2A6wz1D1ZDSeNc6x9341QfVT9/L1G74oEbMFx238bfeNK/ZRuWcn+GiLVmLVrFyrWQ0sp8pBOB+ammY6wA6qWgnU6CtoiBUXTrRApQBPCyExAEzX643+Hq5rx0AmYr0uyWtfeMgP2KSItR70c6xkyWIP6teRPDOUY92NBX7T+jaXwuTsJFQWmjwSD0db8bkAIf61B9TAc011dL5dusb37atYp7avLdDnZmndI3xGfTbasgI5e5HTRL9mjNmW6I6iBltuCPg0QG8OYjq+MsK3Xp4zvsfH5t2cJa27eHDCXodX5OFp+l5eCX8cs+3GXD4JqA2BQMs7AjftIqCmj+/pp9XXGbQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR09MB3907.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(2906002)(508600001)(122000001)(55016002)(6506007)(316002)(38100700002)(6916009)(76116006)(9686003)(7696005)(186003)(66446008)(66556008)(66476007)(66946007)(64756008)(71200400001)(8676002)(86362001)(8936002)(33656002)(52536014)(4744005)(83380400001)(5660300002)(166002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4o3zEfu8Yg3hbGu2kpVUwTR8qnYR3cYV9RKOYBu1wDdeQI2OU9ub3+79y+2e?=
 =?us-ascii?Q?AoFkm4hN6NbkHQnaAt4Oeicx7V1rkXh3A86HKtVljcA7ThFabgT6ht46xReL?=
 =?us-ascii?Q?CAWhyLE0D8iu6E6Jimeg8eVSZ7vGT0UCmUvnloUKhU+4I67bZiviaBLZdtt9?=
 =?us-ascii?Q?wKLqOFTs3jJ/kF0AzyPNRlRDz+Bb3O0DAucU33XmBMjBjHmRFnKqRSetCWfX?=
 =?us-ascii?Q?K8GU92kb7A1y+6v3bJ8sZqji/OWvG8+Rd2IGqtRJ3wf2Shi7ACtXPdPcda6f?=
 =?us-ascii?Q?m0JNlGP29A5K504GJPDEFYruZRJcnhvB5jMhbUGl86TUoi+oLIp++vdIzOvs?=
 =?us-ascii?Q?SbB3ceoJFM9IecvqFt0tzt0NCH4EfOuSuvqOWi8UYykzpYBcLrjJvdC3zG0T?=
 =?us-ascii?Q?FnMbvkA/KYgIJ9Y2h+nF5oqtSOW1UJHKDnCFcq5Lq12jRa5RIULbUjVRHazl?=
 =?us-ascii?Q?a5USatXomnYDoYmDVo9lG0yNA4PouCboLkJduREyR8qfo1xW0ALs9j8MmJka?=
 =?us-ascii?Q?c3KbXIKQsiPbJ1mbrmt/Uh5gNaKbmezhAvTS0bUH2ff8/1VZ6STzw4iGpSim?=
 =?us-ascii?Q?eyv3mu4AuIeyUzX/7YuIwn9wxfNQdBwmxzqEzK5QLl5lM/UzKEiF+bjPPEfR?=
 =?us-ascii?Q?aMzVuQVZR/EWcc2Tp8egCdLIDjeghX++hS1sB2jts6743rLTzJY6qAh9qtDV?=
 =?us-ascii?Q?TNvdxgtvIME9oPGxHVWD46mPRIDIoeqbUAjsE0l97TGngCp8hKvohUanGFjh?=
 =?us-ascii?Q?iwRnYGxtP3BlRbYLUZEJOaMJv8PLZxArXEZ3ZSp/CsffW1cGCgmCigJqD4Mo?=
 =?us-ascii?Q?oGbr0/Mu1+owkTKJ90k/zsYr2gSPzq2UIEmzkjCsBxn6ii450cWUUaLoTpzh?=
 =?us-ascii?Q?g5fV0Li+m+vC5qoPt7F2Thr9SRzRezQ4OaMRWtCJLqc2yTs9HA7GB63lax26?=
 =?us-ascii?Q?1yUK8mhnbtuRW8kD2wNHGyBrEdQC120a4Oox5xFO7KnBvqPfWh4N9B0hl7ZI?=
 =?us-ascii?Q?YgMLDviTHcRDTt1fwSDXeWYA4r8hEp6XYbYBLbCbHxnQQR4fLVtesRgbxGxi?=
 =?us-ascii?Q?dZGmqOxRsmGUBnJoQnXKJJaIPpN56lZB7cTsYwl356KKkGOJzCJckNvnxwk1?=
 =?us-ascii?Q?UtANpkMlUTrGswXmPo0ILQL0eLxIgJg/U6S7O8+dk96ESaYpE31UC0oLfWc0?=
 =?us-ascii?Q?XkDvbARgqJUzo2AqBDvPYraT1i4xl+Z8bx+Yt8vCXrfjJFkFrxkxK+37YJ43?=
 =?us-ascii?Q?7a1esj39zeVOCsx6644CRwjwj0/scpFGsotl/DvM3PZONs0Y6TjO/7g74IpQ?=
 =?us-ascii?Q?gBA=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: barco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR09MB3907.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcdac8a1-87fb-49fe-dae3-08d98a633112
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2021 13:54:47.8683 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: aeb84c91-6270-4446-ada5-d71ceba1d535
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3eZRQe4/YlfQiPOyOLayoWFzg6H8pBH+9amSj2xQbpbJy9mEHVk8hvaRBVRnNiSYEXoe2nTMrs95NBOYr/L5fpRYY9Ps7TEq0FbDvQIDb70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4354
Subject: [Buildroot] [PATCH/RFC 2/2] package/nodejs: bump version to 14.17.6
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
From: "Loridon, Martin via buildroot" <buildroot@buildroot.org>
Reply-To: "Loridon, Martin" <martin.loridon@barco.com>
Content-Type: multipart/mixed; boundary="===============7300904593447155450=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7300904593447155450==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM0PR09MB3907D9CFEE70F772597A1E7896B29AM0PR09MB3907eurp_"

--_000_AM0PR09MB3907D9CFEE70F772597A1E7896B29AM0PR09MB3907eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Just letting you know that this patch contains a wrong LICENSE hash.
sha256 for the LICENSE file being part of that nodejs version is: 4c3016fb2=
67bc473af18b305068f7f2d206ccd5ab98297ec593e1c32d73ad4fc
and not the b85d503ce644bad3849a4d53a99c332845cde94394c8ebba5f0345dc1f69608=
6 as specified in this patch.
I know there is already a V2 of this patch, but also there it is still the =
same sha256 hash

Kind regards,

Martin

This message is subject to the following terms and conditions: MAIL DISCLAI=
MER<https://www.barco.com/en/maildisclaimer>

--_000_AM0PR09MB3907D9CFEE70F772597A1E7896B29AM0PR09MB3907eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"en-BE" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Just letting you know that this=
 patch contains a wrong LICENSE hash.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">sha256 for the LICENSE file bei=
ng part of that nodejs version is:
</span><span lang=3D"en-BE" style=3D"background:yellow;mso-highlight:yellow=
">4c3016fb267bc473af18b305068f7f2d206ccd5ab98297ec593e1c32d73ad4fc</span><s=
pan lang=3D"en-BE"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">and not the </span><span lang=
=3D"en-BE" style=3D"background:yellow;mso-highlight:yellow">b85d503ce644bad=
3849a4d53a99c332845cde94394c8ebba5f0345dc1f696086</span><span lang=3D"EN-US=
"> as specified in this patch.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I know there is already a V2 of=
 this patch, but also there it is still the same sha256 hash
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Kind regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Martin<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-BE"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-BE"></span><span lang=3D"EN-US"><o:=
p></o:p></span></p>
</div>
This message is subject to the following terms and conditions: <a href=3D"h=
ttps://www.barco.com/en/maildisclaimer">
MAIL DISCLAIMER</a>
</body>
</html>

--_000_AM0PR09MB3907D9CFEE70F772597A1E7896B29AM0PR09MB3907eurp_--

--===============7300904593447155450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7300904593447155450==--
