Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A02DC61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 21:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24A0D60B3B;
	Tue, 14 Feb 2023 21:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24A0D60B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AX4cWcGodQJQ; Tue, 14 Feb 2023 21:13:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4119B60C33;
	Tue, 14 Feb 2023 21:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4119B60C33
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E573B1BF2B3
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 21:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E3B84059C
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 21:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E3B84059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S2J_l3LNCVAt for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 21:13:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE856403C4
Received: from AUS01-ME3-obe.outbound.protection.outlook.com
 (mail-me3aus01on20714.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7004::714])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE856403C4
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 21:13:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuR+oeNxvEwkhdyEWQZD/gm8QE5m3tm/4snSmp9IpMSXnRM6myvnVDqTACo4CRKBxAhvRwFz8aiDRLePao8VM0i4bkd4vTnQw6R6wwC4sRJWEz1JOfNHFnA2wt7WogUyMfmmeseLM3oJsqK2wNj9WaCACsB723NoqeVvjgZaWovBL9cOjObkkho0kWIxZsWq03YEkw5i8oXzDzHTmQDvtHfvKG+QUTE1EMtaZLb9Mlm2M6tfbY1KPDtbH9dIW1qSF6CnWTuDnOHEsMziZx49mfCOHUVsI8qSsVO+PqCv60XQtPk20JKniixTK/DQHCElOt85dKdoo4lCKwAqnPPKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qv5phjPStcL/X2x9nNYgmo8FtsGAPeulXqKTM5qr92g=;
 b=RJVsIw7KmBhzaUaI53gYCwvWwLX4QWjwjfEtKnEjLwJX3V5afAqa6EOePd1cWMwJIUVZeLwqC5/5hj4GBIbwl7uMAvzlAf+ta92HQjtlu8ChPoS6tAY5OT3Khm7t0bOf7Y5eD//EqcQorR85SIR/Q92Gu2Xp8dtBnVm3YeQlxKRctGpyc74Fi6XeHyD56gaYPNjxp+29lOMFu/fatcjJtD3oTjnTcn/RXFRTQnmRkDgdiB/xSUlv+qLy3QGwvawNGNT3j3N0XTYEtfqakxSsVpxBttuW7hiOewfFv9TdYorq85+7j+LYDfXxPuqWzy2CI7WA06MBWX+Cb+15bmKT1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
Received: from SY2PR01MB2778.ausprd01.prod.outlook.com (2603:10c6:1:25::22) by
 SY6PR01MB8492.ausprd01.prod.outlook.com (2603:10c6:10:1df::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.10; Tue, 14 Feb 2023 21:13:09 +0000
Received: from SY2PR01MB2778.ausprd01.prod.outlook.com
 ([fe80::da47:405c:794b:7d68]) by SY2PR01MB2778.ausprd01.prod.outlook.com
 ([fe80::da47:405c:794b:7d68%4]) with mapi id 15.20.6111.010; Tue, 14 Feb 2023
 21:13:09 +0000
From: Afshin Pir <Afshin.Pir@gallagher.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Define dependency package only in staging
Thread-Index: AdlAuSMUlgoy2IcdQjG7t9MusSnjUw==
Date: Tue, 14 Feb 2023 21:13:09 +0000
Message-ID: <SY2PR01MB277812C5F0180DAA6B2A1D2994A29@SY2PR01MB2778.ausprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY2PR01MB2778:EE_|SY6PR01MB8492:EE_
x-ms-office365-filtering-correlation-id: 2e271f0f-7bb4-4ceb-3bac-08db0ed04646
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bjf0AkHZFwWAw+OyA87CTYJAiS8psabXQo4DUYEXTML/r7LHnyRThL4hTSmZroDQsV9OmZQdXeTwCz4Ov03qa4T+UBLjhbzMX0OoF+0cZfySTzxGPx0owP43WVWJgkUnwfVMxUeQQ3rYqLoSUfXKbSAQlqpblG3amuuQfmXsXYdRB2wFuyYAvkTXe/RE2n/dLsQPZEwL0rX41GcjgIFMXU5P6TBLtIkNOqIjXoW7BkppPJLdJpgfeBixAd4HANfh5qywlSa/cMRpiD834N1hqGG5KRzycAjIP4wqV5p4I/w4XdQ9fFg9FLTNGReW/AO/fWmDRBVas6w4Kpa2vy4KpykjfpulbGAbbR+3rnZyzv+NqYIXDYqA2RnNW8irs4ui2q4RXD9pCPV6QZWEyVaRo0nBmbh8lSt1wN0cWU577EZNu3+jTSw7s+7MYFYSQJuXtj+kMA0ip10wBnQduAFxqHWu3xlUANHD9eCz1C0AUwos0ig64WdP+M4yaP7nvjZsuKigsDGEmULjpxB0sp2zikOalnqax5ite7//3RgVgIMzjN13kRFHYG/pCspTUXIS3/387MZla8aH76wTUkjQQXk4L5npoxdTRUIDgQ2wD9yHWm6cnBX0q2fZclhmjQ4BI3eAwMA8bUK6QSTtAufiA3UzXCFM2spvuPfM9pvw08gXLSm76FBYRi0q4fkGRMPTdjpJNxVExw/GkiOLK6EUVw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SY2PR01MB2778.ausprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199018)(186003)(26005)(38070700005)(9686003)(5660300002)(316002)(52536014)(41300700001)(6506007)(2906002)(8936002)(4744005)(66556008)(8676002)(66446008)(66476007)(6916009)(64756008)(76116006)(38100700002)(33656002)(66946007)(83380400001)(55016003)(86362001)(71200400001)(7696005)(508600001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TgjfQ1WNgiPynqbEbPNKE2enut+sUfiOphZQJG/NHlTMXDzoJdSJvE/HMN5W?=
 =?us-ascii?Q?nrLVeFyUub9Z8xpkVjZxuFVOdrreyKFGDgc/Qfxu3O5q/eC8mWWONa2Tny35?=
 =?us-ascii?Q?d650uC2AOgvbvy2GOjIFFZCc8yJ2+JCawbC5s/CxIA3DILdBW6onEsmkboZT?=
 =?us-ascii?Q?plOdIWWQjctVsYL3K7zxb2WCjoVEE5RalqUM3Vx1IkK+MR5oW5Mjem0vaJyg?=
 =?us-ascii?Q?AL3gUNupykj/2/I6yDtI0R4RVwXxNnXE0b50jC0WJPv5eeItx35Hzmadrqfh?=
 =?us-ascii?Q?liosV4riPDdmCbwcArpmB5H3QYTCoaWK7pn95qdo3ctoNxavLNSXc2Dw/LyF?=
 =?us-ascii?Q?9MBrYjvxNey3xDeIn4tY/b0Qv8TAXnkb9nAb7ZrLm812YP3U8Ex3DpHCTNRu?=
 =?us-ascii?Q?MKhpM6seALtxH22HfcfZdQMForEUO7VKvbOFfuwfGbI02zOUgFcJuwcgGDr+?=
 =?us-ascii?Q?6ih61vJCxqSPKW61s8A3llIAdNYZj/h4zAXqoEEYhDmz/eVv2nIolnQmKcXz?=
 =?us-ascii?Q?a+K2fVLx5GqrH0jlraXDEn1A7MB7j81PKR4QOnqWelKVi6qS1v0tp+hUJP5S?=
 =?us-ascii?Q?0X8isEUNEQk02DPBQVHTrK8Gdcn3ae2Z7pWg23P1iTVp1GKa+GO8uXe1Ice/?=
 =?us-ascii?Q?ASU+fJCMastXqe/VsgO8s5otHmbZJFLkFpcC3+3kPns5DN7yQ7GCwnWlPr/i?=
 =?us-ascii?Q?dPVw5B/L2L3vQyP+wGs+64wzutHma3CwPAL8ks+0CS+aTDJOBvziFcFbJuUb?=
 =?us-ascii?Q?hixiteItPEqVMmz2ZR9nTLAt4Rh7DQTW+eCBbdxGuwdTvUjbUJJmA9BOmHpg?=
 =?us-ascii?Q?d/ehU+786oKMKluL5/IkSFMf4kXLiU5r1LRe4gyyd15IL1au7fID1hVIGxoF?=
 =?us-ascii?Q?NJfsdqz2pGOWdCf3fu7GCP4OkYpBgI/sXcVpg0qe9hooaLrgiW+cHodwRJPW?=
 =?us-ascii?Q?yZXOkK70CaNh0kmERH3/+06ZaJAGeA3YdUu2POyMW+oEa6+rj6tIfrIiY+2H?=
 =?us-ascii?Q?i6LXfSgCJEotyjykT4TWpQ0W/rWlh1QhZ7Lu98g7Jnm9H9SMNFOvqwKCS6ft?=
 =?us-ascii?Q?paG0kBiac7bnE16GpOTmpDrZHOoWwO0TDoRTKj2soRoPSDGSkJX10DgAHROa?=
 =?us-ascii?Q?ByyxdGkUy2/EXHXWYHGERJQQNFUvk/k27DHcTC4Bv7xv/xb01fD4VCB/SNHO?=
 =?us-ascii?Q?uptcNuLatSAPVGaFsEyJuFRgY4cNZ6MqlgFKszbDzLHTudNpqm0ZbkeyPVkZ?=
 =?us-ascii?Q?d8yEtOcavvF5faTNWY+vadOljl3+JTGp+LPZp2TFBBwzZsxC+qQW/DuJrz2e?=
 =?us-ascii?Q?X5i5s7oMfJDchmAq0IrBSeBIg3jGCfcgpVxxRyLFkOVYHpaxVSZcWBUyNBWY?=
 =?us-ascii?Q?Ywe1JUIsTxDa7VUXJptXiliYqHs/grDNsK51rNPhXUjUV56UvwyYcwB/PGch?=
 =?us-ascii?Q?nh2d8t1tfm6drdA+JZN+eL4TGfzly2nlVEUCdC0WUNP5ww7g4xmbLxunU6J0?=
 =?us-ascii?Q?O6yDLEnn5APE5JKeGuHvxwijBY0ovv8XsyY88fEzpUlfOMp1RI7/TfulwSfW?=
 =?us-ascii?Q?TUQmUxKjXTFU9vx1pXsW+0nb1ZS5Y5C7hzMaU+V6?=
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY2PR01MB2778.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e271f0f-7bb4-4ceb-3bac-08db0ed04646
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 21:13:09.7739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i5PzI86Nn+SS1P9drdpxVJ5bUgY0+5Drrr0MNV3JX6lyi2z3V/jBnTOL+l098on1EwaXK7+nIL3urPM0HTP7uO6XAjMsAiwhkV4uAxFRGBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY6PR01MB8492
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gallagher.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qv5phjPStcL/X2x9nNYgmo8FtsGAPeulXqKTM5qr92g=;
 b=e2drIwc90jjV09yoPxY/HZ/x7AZqBpAP1v2Yqd6WAL4znchRe77eS1++atgdvLETz4psp52qLirxhAhowQ9k+w+gPHa0pVo1UFqwAOpA/b6r3Co03GbKGjhMtjCWGD/F6bMapHN6GM5PCAdOIKpulsaXH+fvp5fTQ9yNYY1guU0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=gallagher.com header.i=@gallagher.com
 header.a=rsa-sha256 header.s=selector1 header.b=e2drIwc9
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gallagher.com;
Subject: [Buildroot] Define dependency package only in staging
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
Content-Type: multipart/mixed; boundary="===============2841494383596408049=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2841494383596408049==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SY2PR01MB277812C5F0180DAA6B2A1D2994A29SY2PR01MB2778ausp_"

--_000_SY2PR01MB277812C5F0180DAA6B2A1D2994A29SY2PR01MB2778ausp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All

I wonder if it is possible that to force the dependant package to be instal=
led only in staging folder. For example, I have written package A which dep=
end on Package B like this:
config BR2_PACKAGE_A
               bool "my-a-provider"
               select BR2_PACKAGE_B
               help
                       Test A Package
The problem is that the above configuration installs B in the target, but i=
n reality, it is enough to be installed in staging directory (since it prov=
ides a header-only version). In there anyway to define a dependency for sta=
ging only?

Best Regards,
Afshin
________________________________
This email is confidential and may contain information subject to legal pri=
vilege. If you are not the intended recipient please advise us of our error=
 by return e-mail then delete this email and any attached files. You may no=
t copy, disclose or use the contents in any way. The views expressed in thi=
s email may not be those of Gallagher Group Ltd or subsidiary companies the=
reof.
________________________________

--_000_SY2PR01MB277812C5F0180DAA6B2A1D2994A29SY2PR01MB2778ausp_
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
<body lang=3D"EN-NZ" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi All<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I wonder if it is possible that to force the dependa=
nt package to be installed only in staging folder. For example, I have writ=
ten package A which depend on Package B like this:<o:p></o:p></p>
<p class=3D"MsoNormal">config BR2_PACKAGE_A<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool &quot;my-a-provider&quot;<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;select BR2_PACKAGE_B<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; help<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;Test A Package<o:p></o:p></p>
<p class=3D"MsoNormal">The problem is that the above configuration installs=
 B in the target, but in reality, it is enough to be installed in staging d=
irectory (since it provides a header-only version). In there anyway to defi=
ne a dependency for staging only?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Afshin<o:p></o:p></p>
</div>
<hr>
This email is confidential and may contain information subject to legal pri=
vilege. If you are not the intended recipient please advise us of our error=
 by return e-mail then delete this email and any attached files. You may no=
t copy, disclose or use the contents
 in any way. The views expressed in this email may not be those of Gallaghe=
r Group Ltd or subsidiary companies thereof.
<hr>
</body>
</html>

--_000_SY2PR01MB277812C5F0180DAA6B2A1D2994A29SY2PR01MB2778ausp_--

--===============2841494383596408049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2841494383596408049==--
