Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D36C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 07:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E30E083E46;
	Wed, 27 Apr 2022 07:15:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0dbqyBTg0bip; Wed, 27 Apr 2022 07:15:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB71780A4E;
	Wed, 27 Apr 2022 07:15:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A320D1BF48C
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C62D80A4E
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:15:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nGYGKnbUr8qt for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 07:15:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpgw.computec.de (smtpgw.computec.de [93.104.202.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 486B680316
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 07:15:28 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=acGmNdeUEqn0kjG0408MYcf7pZADtAXuX7lu9SKaHYTocbKwhhkXBUgGYLUXtxRV6zh4PGd4AsYzN8Hm4MStOAIHKz01ZgeE0eX9f4wmXi14RS2JBX4wGVN0GlCn/f2hvs/wPNsfjPTCJ1Qo0ngTtWr3rdam8DEUDaAE+dNttDNbfiChiDbB/pfBy17BozyYSjb5T7iXug4TXPFJlDE9e3WDmjyXSAr8Abbm6wJRRpQ+p7nUMLg9KU4FZpnhV+6OJHJQOvSc9qgI4PYVoR0HGej422ZJgfEWLBkzngh2UKFF1igXvpfdeQMkOt5lmi8vwDC0cBPCeJ1AS/LBWMuk3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfaToZ4Sn08OsKOEOYuWUIgPeCnPX2nwbbtklazHM80=;
 b=cNkV0my1CVmu1Q8ustVHuwQvGJcN/d+Cb5tX4fJk4I5VQs3/V+zpauPnswMRKNQ4FKN0PnjGIi8G2s+Kzbe2gk+9n5/MI7SI/+4COL8ZEDi5sPl7DTN6ieFVDQ1MN10pyU2uqyZ9gCCmTvQ8NeEodpCxjAjkHHlHUTtDAXmKZjX5I1bWGkEfyFs3g6nOP+w3VH/uBCWYwRMwDoczIbBiEo9xd844fwYWmfw79W5O5kRiwndYo2PsZLMlFSHKeOii5Skm4B6pusRA6sUTZffbMvQvQiVOByCeJxtqxV0oQdZfyCUZ9eUBrqFJxBFJGTvmBTzuVttfX6pwkKdQ4X/OTg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.79.220.33) smtp.rcpttodomain=buildroot.org smtp.mailfrom=computec.de;
 dmarc=permerror action=none header.from=computec.de; dkim=none (message not
 signed); arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=computec365.onmicrosoft.com; s=selector2-computec365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfaToZ4Sn08OsKOEOYuWUIgPeCnPX2nwbbtklazHM80=;
 b=HLV6BSvLIyNhrb0SKkew/qKBKZi9zs9nNIKTkRB3KgxOBlga0NEkx8RS8Yk3KyR7VIAY0lGmaCpvianosHAk0SdLlUTSuDdTPClLPsFkVLUhSfR/UftqKkB2DI2ejNyLQzlDhLpAA8lWsVUrZRpX9J9alwAf/YYRQ5GY7RqLzc0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.220.33)
 smtp.mailfrom=computec.de; dkim=none (message not signed)
 header.d=none;dmarc=permerror action=none header.from=computec.de;
Received-SPF: Pass (protection.outlook.com: domain of computec.de designates
 20.79.220.33 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.79.220.33; helo=de1-emailsignatures-cloud.codetwo.com;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5aQ+DbWHdk9bua3ULKurziJBOULxg6oc6HZpT+ww8qhzDr94s5JdwNwRkouUQ3iy8/lVxw87af3OgiAIZf5Z2zfjre2G1fnwKhSn+n6vnbtrVXo7EwxmzAgLb7ECmY7zt/MPEy5540iKYxJYZ2/f0GRRY1DGO0GxMcfybqncAm00OlP/MPVRHvldru6dzJLumsypqkv2YCCiuKCcXCAP5ESdL2u1mS4KjU12iU6CT3mzZ/nJRSM2kUD60ijzgH2v0/P9B87fZ/v4corTBhd4nDv2tKswcDzXUr91zhV16u8pZrAeyJQbSUutOLo9yuk6XH5m7o/rfAS2g5qieyZ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78Ugup8mVRngRu6QBYUyuNt4CReAKWaLPAY0iYmq23Y=;
 b=CNgu2G5MUX5lmLHudeGrmMbkjk8jlVAtkdYHlPafYioocbcwxZT2LL/3DluLFkpe59o6POal9yYh/hi02X6UiTBK3TeRaxqu5RQf8oVbFGkc+yexUXYdlCKnvY3V5jJkzEDt0C1tEk5A8LOjlx4XRI0FUawSDhP8SE7TV//ccCpZ2Fh44h+RJaUbr+JcxJyVcUiSstiQWdot+9Xfp1j1ZRki5L1mnHEXjKrGjqfgM6kP4P6unUKXOiAyCb0eC7bLwPHw2DeNBh21ijXSV+3bSa+x2c7RwJkGXtFk9uLBLX9c4Vp0FJjA84ROZf5q6fQcZSBGHU8PpSd2JA+XMOlXAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=computec.de; dmarc=pass action=none header.from=computec.de;
 dkim=pass header.d=computec.de; arc=none
From: Jens-Christoph Brendel <jens-christoph.brendel@computec.de>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: press request
Thread-Index: AdhaBnLJtWkIZvSSTGiTE616SuitaQ==
Date: Wed, 27 Apr 2022 07:15:21 +0000
Message-ID: <PR3PR08MB5593678BA0C11723E9506505C4FA9@PR3PR08MB5593.eurprd08.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=computec.de;
X-MS-Office365-Filtering-Correlation-Id: 14b46968-306a-4e33-5fc6-08da281db270
x-ms-traffictypediagnostic: AM8PR08MB6625:EE_|VI1EUR05FT056:EE_|AM0PR08MB3618:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB36188051F18D785DF426D072C4FA9@AM0PR08MB3618.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: oPMOo2qs9mLk7VF4+qcFydgpjVZDD5bpsCpTxBvGbkD3lcmVm552aq51mrd9mYuhUDxtgCb0IDb9YsH2QFa9keJPrGkAg+t1b2OaR9xHXCe67IO++fF49c9wmLm9UcIr+Ln390uUQeitxO5gT0+NZnCLHt5sIEMr/uGoOrfkxs4SMoqevekNQ2yOjPH8CtoWCj4p8MgRLk92uVgW33HkJLkN8tbZYYNblls/dqEEnI4d/+z2u+vz2JT+ct4Ow1BrLyKELvTErMkVG/oEOJUOFeyLmJYXFA5GSPwxjxKCwIuaF3txyXiOarC5rGM1HyHgGRvANx++dnwVBrqko1gtk2CIH8A+Wysm5pOM+rJNM18Xvl4C1DltG4AdMIIO+lKTmjAmjdCkPkMEQyCohb4IrFWaYBL8G9FcIMIrs+UuV4Z6+YDPaa/5OgsI0kj/BE7e42vY1j0D5YiOqVM801TkHxk0BkkmZw6Wr6u27fI8T2tQ1MXa7W8ifE4l57QajCPgzFeEcYIyotUXE8AL2DlCyAQLOMLkrnNozti0NR8W7o1EMFEKTMJGviEewZn12n4BCNiM09EqIWzOKEg8caNxtLD+3suDOTeoabpEytjhjwLXcYeQ1DW7XdQTpbwkuCXmMhpRBId0toj7MOlZDPxM2/O5InhdN5eA2C+zM9zbXPJEZd6+1mmcVutAGS+Xz04k691LeohxFQjv3wetXGwVFQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PR3PR08MB5593.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230001)(39840400004)(376002)(366004)(346002)(396003)(136003)(66946007)(122000001)(2906002)(64756008)(19627235002)(71200400001)(5660300002)(508600001)(38070700005)(55016003)(38100700002)(52536014)(7116003)(33656002)(6916009)(8936002)(8676002)(316002)(66446008)(66476007)(76116006)(66556008)(186003)(3480700007)(86362001)(7696005)(6506007)(26005)(83380400001)(9686003);
 DIR:OUT; SFP:1101; 
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6625
X-CodeTwo-MessageID: 783482ce-07ff-4f64-94d5-6e0ed15b4161.20220427071523@de1-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
References: <82d17f75-915d-485f-9353-f091fb3576e8.8d5b84c6-3d2e-4c12-b2dd-1cea205060bd.05b36973-3f8d-47c8-982b-7fde04d5179e@emailsignatures365.codetwo.com>
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VI1EUR05FT056.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: cddaf10a-ae7d-44ad-dcea-08da281db119
X-AntiLoop-Smarthost: True
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xW+C5saJpKciYHkLdMH13pTEhwaP35vNiHNRk1wmRe4jE6IL2REXspvKUGYaDx/34MfGoVxWR+Grb3jpNVlGK78iTc5ap7w4wfuG9OFeRDcPl81gAT8mUpRgVO+4pFc8kHh/dM/YECSfFScnSgN9azV8+g4daw1vgmPJC743MVYGFGRuiQdfDdkaVWD63L6ExlQL82MKIMvE7SRM/WiDXAWf1S/85GHg6ua/RBn+5VkGB1aOWdQjdb/gfIKKjknCdMcnmG04BjZkFHErGZdJc06s0cJ3brVoC/h3pojd+jp6vRLvfl5u+TVIQtDVMs6MtNY+eUheS12V3JSkFL02mrMnEORQot5SkoNsRXtlueUNkIaojCoPwgVqpp2v3wOm5OksUgSfGnwfPp0Q4rIP5woEyTBkCHhmRhsLt4fP+2LHRo4XproPCsB0WziP/jxT8/VMx30KHdVE5px8/Lwh9FRINj1x8uggl9wdxLvjc40cmhCHn+HEcF5AdJS5Pet2ZGqvJE7HGD0MrBmIJtOKtXfIUNvAKeiv76d9ElkcG1WjMVPPPmRq15naxcY6If4PLlibMoQkuEuxt+yhKcTeeQjVTu26NNh48ppye1dF3BITlAPdfv2uVTznjPqg1Yze4KJPcAmOUXrECM+hJn1VaMmkc+p2OO/lHcFORUHrk64nDzB1OoYCQb9D/xAZr+MdIlRH+2gXAMCTfVlUeIgUOiK1v4TjnvC/3gIm3m6x1icIHhhUJEC1FEy4ODTPnMP3aAlDOBg45m2ApUXyGi9MDA==
X-Forefront-Antispam-Report: CIP:20.79.220.33; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:de1-emailsignatures-cloud.codetwo.com;
 PTR:de1-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230001)(346002)(376002)(39840400004)(396003)(136003)(46966006)(36840700001)(70206006)(26005)(7116003)(316002)(70586007)(83380400001)(3480700007)(19627235002)(9686003)(966005)(36860700001)(8676002)(7636003)(86362001)(166002)(7596003)(336012)(6506007)(508600001)(7696005)(6916009)(186003)(356005)(66574015)(47076005)(33656002)(2906002)(5660300002)(8936002)(52536014)(55016003)(82310400005)(40480700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: computec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 07:15:23.8905 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b46968-306a-4e33-5fc6-08da281db270
X-MS-Exchange-CrossTenant-Id: c25330ea-993f-4793-bc95-30465766ea2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c25330ea-993f-4793-bc95-30465766ea2a; Ip=[20.79.220.33];
 Helo=[de1-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR05FT056.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3618
Subject: [Buildroot] press request
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
Content-Type: multipart/mixed; boundary="===============8116065425441289096=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8116065425441289096==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_PR3PR08MB5593678BA0C11723E9506505C4FA9PR3PR08MB5593eurp_"

--_000_PR3PR08MB5593678BA0C11723E9506505C4FA9PR3PR08MB5593eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello everybody,

We, the German Linux magazine, are planning a focus on Linux distributions =
for the IoT in the 07/22 issue. One of them we have in mind is Buildroot. W=
e are therefore looking for an author who can introduce Buildroot to our re=
aders in an article. Such an article should be four to six pages (about 400=
0 characters each) and cover questions such as:

- What is Buildroot? (main purpose, target audience, compatibility)
- Scope of services
- Differences and similarities compared to similar operating systems
- Advantages and disadvantages
- Examples of use

We need the text no later than June 1. It would be better if you can manage=
 to deliver a few days earlier, because then we will have more time to disc=
uss details, if necessary.A plain text file (ISO8859-1, aka Latin1) is perf=
ect. Illustrations (at least one per page) should be delivered as separate =
image files.

The target audience consists of IT professionals, developers, administrator=
s and IT managers. So we don't explain the basics. On the other hand, your =
reader may not know much about Buildroot. Imagine a person looking for an o=
perating system for an IoT project. The author will give her all the detail=
s she needs to make an informed decision.

Is there anyone out there who would like and have the time to write such an=
 article for us? We would pay 80 Euro per printed page. Please contact me a=
t jens-christoph.brendel@computec.de.

Many thanks in advance
Jens-Christoph

. . . .
Disclaimer: The recipient acknowledges that Computec Media GmbH is unable t=
o exercise control over the content of information contained in transmissio=
ns made via the Internet. Computec Media GmbH hereby excludes any warranty,=
 written or implied, as to the quality or accuracy of any information conta=
ined in this message and any liability of any kind for the information cont=
ained, therein, or for its transmission, reception, storage or usage in any=
 way, whatsoever.
Sitz der Gesellschaft und Registergericht: F?rth (HRB 14364) Gesch?ftsf?hre=
r: Christian M?ller, Rainer Rosenbusch Umsatzsteuer-Identifikationsnummer: =
DE812575276
Informationen zur Datenverarbeitung und Datenschutz: https://www.computec.d=
e/datenschutz<https://www.computec.de/datenschutz/>
. . . .

--_000_PR3PR08MB5593678BA0C11723E9506505C4FA9PR3PR08MB5593eurp_
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
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.E-MailFormatvorlage17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"DE" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello everybody,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We, the German Linux magazine, are planning a focus =
on Linux distributions for the IoT in the 07/22 issue. One of them we have =
in mind is Buildroot. We are therefore looking for an author who can introd=
uce Buildroot to our readers in an
 article. Such an article should be four to six pages (about 4000 character=
s each) and cover questions such as:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">- What is Buildroot? (main purpose, target audience,=
 compatibility)<o:p></o:p></p>
<p class=3D"MsoNormal">- Scope of services<o:p></o:p></p>
<p class=3D"MsoNormal">- Differences and similarities compared to similar o=
perating systems<o:p></o:p></p>
<p class=3D"MsoNormal">- Advantages and disadvantages<o:p></o:p></p>
<p class=3D"MsoNormal">- Examples of use<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We need the text no later than June 1. It would be b=
etter if you can manage to deliver a few days earlier, because then we will=
 have more time to discuss details, if necessary.A plain text file (ISO8859=
-1, aka Latin1) is perfect. Illustrations
 (at least one per page) should be delivered as separate image files.<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The target audience consists of IT professionals, de=
velopers, administrators and IT managers. So we don't explain the basics. O=
n the other hand, your reader may not know much about Buildroot. Imagine a =
person looking for an operating system
 for an IoT project. The author will give her all the details she needs to =
make an informed decision.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is there anyone out there who would like and have th=
e time to write such an article for us? We would pay 80 Euro per printed pa=
ge. Please contact me at jens-christoph.brendel@computec.de.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Many thanks in advance<o:p></o:p></p>
<p class=3D"MsoNormal">Jens-Christoph<o:p></o:p></p>
</div>
=0A=
<P =0A=
style=3D'FONT-SIZE: 8pt; FONT-FAMILY: "Neutraface 2 Text Book", Calibri, Ar=
ial; COLOR: #d2d2d2'>. =0A=
. . . <BR>Disclaimer: The recipient acknowledges that Computec Media GmbH i=
s =0A=
unable to exercise control over the content of information contained in =0A=
transmissions made via the Internet. Computec Media GmbH hereby excludes an=
y =0A=
warranty, written or implied, as to the quality or accuracy of any informat=
ion =0A=
contained in this message and any liability of any kind for the information=
 =0A=
contained, therein, or for its transmission, reception, storage or usage in=
 any =0A=
way, whatsoever.<BR>Sitz der Gesellschaft und Registergericht: F&#xFC;rth (=
HRB 14364) =0A=
Gesch&#xE4;ftsf&#xFC;hrer: Christian M&#xFC;ller, Rainer Rosenbusch =0A=
Umsatzsteuer-Identifikationsnummer: DE812575276<BR>Informationen zur =0A=
Datenverarbeitung und Datenschutz: <A =0A=
style=3D'FONT-SIZE: 8pt; TEXT-DECORATION: none; FONT-FAMILY: "Neutraface 2 =
Text Book", Calibri, Arial; COLOR: #d2d2d2' =0A=
href=3D"https://www.computec.de/datenschutz/">https://www.computec.de/daten=
schutz</A><BR>. =0A=
. . . </P></body>
</html>

--_000_PR3PR08MB5593678BA0C11723E9506505C4FA9PR3PR08MB5593eurp_--


--===============8116065425441289096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8116065425441289096==--

