Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE8CC636D3
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 19:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E579400C4;
	Wed,  8 Feb 2023 19:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E579400C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BdfRfiVxzCtJ; Wed,  8 Feb 2023 19:45:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AF3540338;
	Wed,  8 Feb 2023 19:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AF3540338
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6FC461BF2FE
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 19:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E36140338
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 19:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E36140338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pV0YtdbZ7LDw for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 19:44:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0794400C4
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2070e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::70e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0794400C4
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 19:44:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ige5kSag0kAxt/mpKbEmrgsCcdtGeLEZVFXsHRSZ5SBRkbzOASOutWZ7yNrUznbSRZ59VhMO+n3jogRTlOHWBDrjNB+VPpz5jwLiupucA5qNCOXOe008zOTMgukaGzuraHTLpAvNQVxFVoT5sH9K5FUF6ghkmByi0pTZPrwIa+T8RQtOEy+pehUaX2H6QojE7gNpkcwznkEa01QImvIEvbN7ULI/N+qlTuGG2fEDatRSrv/oxSX3wKpRMCh/Xhh9YddX7JtBcUaANjLUnY5Z5uPlKoinqfj0dg+PCYYJ74wLI/A9+iHeh6d5HEuQv05Uupm4oIbLFlmiQ5EdxvJxTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xk6zz0sEC/mtMuxWo1jVeKhKOsOx1oQfPol1cHq65MA=;
 b=lZOeS5XTnYWVIKg4Wxv4aztOBiDWgmAD31aOW6cRb5sTQbjThWziRNW87k7WTiBw+YI30YLGJsLsHwOCdlE8UJlTRrFXvHzjSuT46bQCHKyI4uSsBr5I1K/peX4c0TvUr/ZMV8sCzjJRvE9ZzUIEVyeLNs6GMpV1oAnMHcVNopOoo/cA759XUYEEk1rQOtYZC8DXxnTbH09Bk+mpyV3mV26rJkopQwnYAdL1H2Nf3kJyCZcSU7ddwHz2f2KLTO4HpJW9J2NUyxV//hVX+75QR+x+RyYsxFQlckvygsZVp5D1edF4XaEyFspuaMRh/oW0rAEQ9QFQSJAAhxS7wEtr6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
Received: from SY2PR01MB2778.ausprd01.prod.outlook.com (2603:10c6:1:25::22) by
 SYBPR01MB6414.ausprd01.prod.outlook.com (2603:10c6:10:101::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.18; Wed, 8 Feb 2023 19:44:52 +0000
Received: from SY2PR01MB2778.ausprd01.prod.outlook.com
 ([fe80::da47:405c:794b:7d68]) by SY2PR01MB2778.ausprd01.prod.outlook.com
 ([fe80::da47:405c:794b:7d68%4]) with mapi id 15.20.6086.019; Wed, 8 Feb 2023
 19:44:52 +0000
From: Afshin Pir <Afshin.Pir@gallagher.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: OpenSSL v3.0
Thread-Index: Adk79PJFVe2GuDjARCOOVxzprfwxyw==
Date: Wed, 8 Feb 2023 19:44:51 +0000
Message-ID: <SY2PR01MB27781C2BC99C40BB9F67F69E94D89@SY2PR01MB2778.ausprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY2PR01MB2778:EE_|SYBPR01MB6414:EE_
x-ms-office365-filtering-correlation-id: 5c9d1a61-de35-4ef3-8bb0-08db0a0cf230
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qu7psOp6WQZ9jv7nQ63MQLRwzKja1beJ/dcBm8wfCtc0GmChcqGo5FDQ7TQom4DFBNJSPWmyj1kMGQ7q116FnjL7Piljh79dpIt6jq3nRNDkPn8KM+VhIVIEAh8FVakIB0zuC5NYx/5TOmi578ZxwD5DcSanPvAHBeU5ujH5L3Fv7WJmOyrn9hwKisAYyESaK2xTkD+dX+fJluyxNrgurJibHv5CIf8u0G/uw0vT67pur8vkZx6TQegk6LUo0XutahYnKZF6AbaZHWD3i69BFKKzxbffSfs9yQ8pyY1cZhy1rOrAMZWGIJLaxPGeAwWiI9VYh2D4zWwQYr1J6WfxIC6Z6fd23Pq6a+AIBR4IYWWs92ldrSGGPSFc+WO00XnCR2LsMrgQBCy1qcfIb2hkVOBaSjbVReLVA/YgSWQD4f5eWBYysAX6Zl+Hpyoa9MSUaOmJD5OOga0E9WyLmMbzN58/uN54b8mVptZ0IUDMna+Tln3rdry2KTph3HlkNy6c/JVsr37pNrf72A+rJqwnDG8d4Hp6Bt6eWCBZRVUx9Yxxt3bT+UCGnXOuVCuHRartF6estUQGOL/xXHvyDuB6t0MhuO4yzttOop9zWqTLWTXUnCjc4sNhpOAKD+OycMaYAnCYrQKWZGj53WXkrBj3thpe0jGDGwbhS74KhgihGQFMmx24t/p+wwKKyWe5dsnj+hHzWQ4632eoCJ35ijm0IQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SY2PR01MB2778.ausprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199018)(508600001)(7696005)(9686003)(26005)(186003)(71200400001)(83380400001)(33656002)(2906002)(38070700005)(122000001)(86362001)(6506007)(8676002)(76116006)(66446008)(66556008)(66946007)(66476007)(64756008)(9326002)(38100700002)(52536014)(41300700001)(55016003)(8936002)(6916009)(316002)(4744005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MyLfOuxu42CSCjuEX6YF99TXXEOvhB8bC9+G9oMwkwqR5ajebKx/TfazmoP3?=
 =?us-ascii?Q?tWc6RrrDrOH95ppo+zsnYbIDuP9RTVZVV/ecrlmas5ppWDmh9hAYKZVuVxCu?=
 =?us-ascii?Q?gOMjv/gDh9KayiAnUwZ2C50fKpcNHrbZAXu13iXHIZqWv5eJeane3EB3HHl9?=
 =?us-ascii?Q?YWcHuXtJhBOTAYhcSy/Vwpdw+5dC+42Xt4ZjdZOcB3Y9FHayR4DoO4nRbTwm?=
 =?us-ascii?Q?Ht9qYuGV1MoPVksh5WZeDhlWWObrgcUmOZ7TcZDpoU5S00vhlQXPAi8TYZzY?=
 =?us-ascii?Q?oqjclF2QaWtLvChcFHg/DAIShczjCbFgRbbywjpA6J9HVKn9eyg0BL1Lzu4i?=
 =?us-ascii?Q?n6t7mWKlt5qQwt98FThX/9aBEdZbiFUovWX2wwfN8WKoAi0zO9/OnQ9PFGM2?=
 =?us-ascii?Q?VakZcqMZvVjxb+Qe2uOF8NgyzHP/mF/xFRCkFxt7zNVOi9+zLth2zbhPRrR2?=
 =?us-ascii?Q?F1+ZAFKPYbBWNhhNvpfQH4AMcsxk17iIdarcDlHh/rtsBR7+osywEt9FiVmT?=
 =?us-ascii?Q?PmUcNdwh/cx3WoIxfDXA7bvSYQMwbeHrGOEdB906McyDtrvMkQE45iXlVWjz?=
 =?us-ascii?Q?GhphPrHSQGF5YMhXBBRCtsx+dhGm/GHP9CZqu9G1sQDpCO+MNRC302EAHzEZ?=
 =?us-ascii?Q?ed56qtrxyT2yfbZ/062SZu5QOFubc1TP7tp+XLFIJpFEvymG45jOcBOH84wD?=
 =?us-ascii?Q?9DxV4d95gxfwtNju3A5U2R5yU72SaqRvQkmd8hUlw7G3Aku28Nk8O7FJDMG8?=
 =?us-ascii?Q?H1FPkwRBlvb2lXxx9xPb4vxmP6DIhbBL1E9IikSVL1Ee4lhfwlGsreCoyQOk?=
 =?us-ascii?Q?1/5oNaBT5anEapZ2Kr+GtyyOizxFwNImE3o29uGHyaka740pzHAjJcU087Z+?=
 =?us-ascii?Q?lzIt7XvTqeeFwcLhs4GZndw8qJJLpU44fcVNXs6QMnKsLkQ7+DXvOfYLY8Na?=
 =?us-ascii?Q?fytuI20cgaBPFL1PYu4t1U+2d8yo3NvHGNGDOEuYL1MQo6Mvo2l9Py7VjAer?=
 =?us-ascii?Q?vuRz6sjGrEkuqOBy3rpE+mzuUEer1nBsAwf4iksHIeSLGqZVNg9IJ2vVrdWm?=
 =?us-ascii?Q?FoHJrc+4zs7ZsEgPiKm7X434gWVQN4uOCflTUxb7XMZ0sRa6xUZYXn/Bsi5R?=
 =?us-ascii?Q?jGgjSZwcPoix35C+WTlNd48QEzz3z2KKzSEV7lJNMReDf9U5srQA/dshf+Lk?=
 =?us-ascii?Q?Wo3vkzsAPsuRfCojhG47PTKC9ZpBQRYsYBukoe0IY+Zu5HRppdCBV0rqSP3H?=
 =?us-ascii?Q?e6J2/meZt3Ug0JYJYheqcHi4KPGqJO8N00cIcaMDDLgKrg0Yrg7lC36p0+AP?=
 =?us-ascii?Q?fzy2l4FFvrP0pFFQrsc5YXT4Z62XGaRAwxEqCdwaSyQjwAS8ri8X6n3KBGE7?=
 =?us-ascii?Q?qFV/Qe7Sgw2nK3L2Q+gP1kiq64852Itd5Am8KsbKKLsqMMmk+2k1svAHUEq/?=
 =?us-ascii?Q?FNGk2I6Q2rGUVd+r/kChW+9aXZ+r8y+WggArWQ6aWWL9cNhyI6xufB8Vi2QW?=
 =?us-ascii?Q?EGKNMMGE9lDOOJqGwTt1fvFjJ7ijhlow+p75ULt/NHpngekUVhQ+jOqTRuSV?=
 =?us-ascii?Q?CiLS693QYbeUGcMJNXSDcf/N7aqvOzGxrwhfRc71?=
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY2PR01MB2778.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9d1a61-de35-4ef3-8bb0-08db0a0cf230
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2023 19:44:52.1897 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PyRpsNNoUdP4LYymtzohZL1NjG7dE0yLYn2gbEz9zt7faOCSE1jYhvzkp0C6+fTnD3S97jhMZBy5LvTujYgwRxOssC4soFIJI1JOUKCNot4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYBPR01MB6414
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gallagher.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xk6zz0sEC/mtMuxWo1jVeKhKOsOx1oQfPol1cHq65MA=;
 b=nNJEvL9ciOSMPUPakNhQ7mzefYYMV5UwkDiLEtdLMauJxR31UcZ/9D/wvpwy9nkboHHFbFVtnGUacfuvlw06m0lsG3Z43qFTpMJuI1QLWC9rYQp6fls7VkCZzaHex+Z9cZf6Ch6KOLWbx2I066QFusvVDM2HJQRun2/d/eXPHL8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=gallagher.com header.i=@gallagher.com
 header.a=rsa-sha256 header.s=selector1 header.b=nNJEvL9c
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gallagher.com;
Subject: [Buildroot] OpenSSL v3.0
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
Content-Type: multipart/mixed; boundary="===============1546415149517575248=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1546415149517575248==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SY2PR01MB27781C2BC99C40BB9F67F69E94D89SY2PR01MB2778ausp_"

--_000_SY2PR01MB27781C2BC99C40BB9F67F69E94D89SY2PR01MB2778ausp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

I wonder whether buildroot currently working on OpenSSL v3.0 package def or=
 not. If not, what are the challenges for building this package? Because I =
need to migrate to OpenSSL v3.0 in my buildroot and I like to know how I ca=
n do it.

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

--_000_SY2PR01MB27781C2BC99C40BB9F67F69E94D89SY2PR01MB2778ausp_
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
<p class=3D"MsoNormal">Hi<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I wonder whether buildroot currently working on Open=
SSL v3.0 package def or not. If not, what are the challenges for building t=
his package? Because I need to migrate to OpenSSL v3.0 in my buildroot and =
I like to know how I can do it.<o:p></o:p></p>
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

--_000_SY2PR01MB27781C2BC99C40BB9F67F69E94D89SY2PR01MB2778ausp_--

--===============1546415149517575248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1546415149517575248==--
