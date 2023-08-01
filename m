Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB46EB64DD
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 04:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3775B60DFC;
	Tue,  1 Aug 2023 04:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3775B60DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FU7ZF-sO43Q0; Tue,  1 Aug 2023 04:36:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EC0160BDC;
	Tue,  1 Aug 2023 04:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EC0160BDC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CC211BF35A
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 04:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C642340213
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 04:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C642340213
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2kIMegkcPZoh for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 04:36:33 +0000 (UTC)
Received: from AUS01-SY4-obe.outbound.protection.outlook.com
 (mail-sy4aus01on20714.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7005::714])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A47B402EC
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 04:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A47B402EC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcUCQ02GRNqjjH+iWlrSHGiG43Nvu0ImoA6iwmgwdUvKTf3Hmi4nYEmjvqgWyph1Nztz412iltQUGXFp6y0ien0Ta5uPJE00NcPlBK24ZL8JRhovondDWTvToDo2Mj0GPNm3r08TbglAXXHIrPzKdB16JSFe72GPUgfc2m4fLN77oVVDMwuAnAiaj4mKsdKNeR8YrHMcx70WjdeRBuS4ScP0ymmAR/2aR3xQmSZmMhmKZ9LxDclbd5BhaB544OmxQUi8EQNzGbR/JoBWm5trbW1C2WOf9tvBe3lTRVmdN5vbEWKaldyxsKny7ApGzaxYJbQBlYVu0Zwi5Z89jYtmGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvyCtmsNz5IHRu2BH19uBV96ZUbTs3P12cU42r5U1vE=;
 b=dfmHxzTKfdiXL5S/DXGTD9aYy+uOAGR4FeMW1KCcnCEQeyLEbNJgO98zxUoBkPluGURKZC7H8UQs1ierEIxqs5mmikX647RH8SEYtpBaysNPQEgojiFBw+//TxYDhAGk+xPUF10VErnVGD7mUw40XL/VZkjwW2teeviFyWGCKKYQaJ8FZzVCZif/21D9WxcFtQU9Hbb0oXyWxS3Yr5IthgNN1LOhBhqo8Kt42ONCUYS7jMBGXQ332cg4ut9d8vnCKxAg9J7HuXi8NKyKXR3YBwbLijLabTGonOyC6tbyvq+caxjYqrPB5FpqrLnArl/dzbcOHgUsfK17CaXbzP9SjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
Received: from SY2PR01MB2778.ausprd01.prod.outlook.com (2603:10c6:1:25::22) by
 SY4PR01MB5865.ausprd01.prod.outlook.com (2603:10c6:10:f8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.44; Tue, 1 Aug 2023 04:36:24 +0000
Received: from SY2PR01MB2778.ausprd01.prod.outlook.com
 ([fe80::c574:9949:1619:eac5]) by SY2PR01MB2778.ausprd01.prod.outlook.com
 ([fe80::c574:9949:1619:eac5%3]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 04:36:24 +0000
From: Afshin Pir <Afshin.Pir@gallagher.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Update schedule of sources.buildroot.org
Thread-Index: AdnEMbW/GqCIjib8R+iHlW1XZFDX9Q==
Date: Tue, 1 Aug 2023 04:36:24 +0000
Message-ID: <SY2PR01MB2778500474B41D29E8E7D54C940AA@SY2PR01MB2778.ausprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY2PR01MB2778:EE_|SY4PR01MB5865:EE_
x-ms-office365-filtering-correlation-id: ef7f45ec-951f-4102-0ea8-08db9248dcb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1uQrA9hEkNAh5rl+C6Nj1ContF6qowL2Kc3A2ZfzVcEwYsgsS+/Gj6Q9imd6MLvQsCxPx8v9UTOvAzWfuv8li5bNZ46+ZVX9IH5I3B2tLuuJoseJnqhkZn/4ztsJxYL4FxWrszcBK2DlTAhC8SH2b+ePP8C/LDgyenhfa4Z1zfetHIR12aBtPOTjNM1cGc2a8hnj0JZj9ZCs7agE5wkvICokI371cY8Bwm+MRvmfe7hR1Vvl1ef7r3TgDdRgQlR/33OtBVStuoAwrQgqfG4SOPUnqjtFk/u1wf7zLoSOLUG+914aKC92VlZO3YhJXaIbztmRBzBirAXgzurzilHq4EDsETekPjJ1lmtFToXYizuxY/k9CPOsZoUy6jD0aQ/057dSP+ZJgRND8sKeUI0hi06lm+/zHCGMriIZ5S4jaThvCDFQQH+uqkH9cyHWbENYGTWWBIa0lFG2ePZfwSECqEA8GcfX6rE4+tKO7585JZ1jHUfPqNNr08sZi4PKLU3mwZd2whjOEx2Bqe0lROKcTXQdyzuklKMnTo4AJ1EL6yB4DEmm/nw8k9YZ3BINbBvwXcpAUGPST19CSJjk+vRgl52K+BGy65N23EhobtezNR8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SY2PR01MB2778.ausprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199021)(7696005)(966005)(9686003)(166002)(66946007)(66446008)(66476007)(64756008)(71200400001)(76116006)(66556008)(478600001)(38070700005)(52536014)(41300700001)(6916009)(316002)(83380400001)(5660300002)(186003)(26005)(9326002)(6506007)(8676002)(8936002)(2906002)(86362001)(38100700002)(33656002)(15650500001)(55016003)(4744005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9OAeYIm8T99byjj9kMP1zCeH44ezRxr1jKc1U9yyDhhmmIWNQC7D+KBpEXKD?=
 =?us-ascii?Q?Vt15lxd6RkHHWRhi2vKCeCXXFVmwPDMPQ5r8Syi/i5H4AbQolXag/yDMQiq/?=
 =?us-ascii?Q?kikaC4+z3eZZ6N0VeZDSQFcZGtkuk6o8REnNzXOvNtTZ48ruj98oUfiSMQBW?=
 =?us-ascii?Q?utDKjIQhuxepT2UglcUqNIz9Pg1o6/yrJuBZmc9UnW/YzkswcByUc0/Ht2KV?=
 =?us-ascii?Q?XnjguVf1dwdF6rxUXRTv/UF6Inr10/2SVN/6xrmcl9Wxr2rb//sYcvnlJGYo?=
 =?us-ascii?Q?tVjN/I7ZnfV7Nu20rQ3PPJvunPYzo1JCeSwG8RSz1kWutf61THCoCjO9p8ba?=
 =?us-ascii?Q?QqLP6rPvf2xCS2X9ZFGQS2b9pAg2lZYVanuxIWjVWEpUuojoixVt9XbcblVH?=
 =?us-ascii?Q?xca9sqN9coBRMpCBhpKVyk5BRELDU19WRikFI7ts5M4Dvw4ntfY1nvHdV7ak?=
 =?us-ascii?Q?TK37DU1bJsduTSb83JgoKl+ZkIO92nfPmA+8pRqCSMSZNaDpSHYpCvPQXyLq?=
 =?us-ascii?Q?zfbGCFkA8OX2ncC3g+Nr3C/mgG/oqhAkVNkoscAVNA7H3U8n0FYQpJf9gSlQ?=
 =?us-ascii?Q?LisaUjhUM06p2KHF+Y3vLnpO9ufVnqnohXRhDyZYftm19E0PSYtr6GiRgnI4?=
 =?us-ascii?Q?IxYFTdLhvegU6of0nI+T7D7KMv+IP+7abSrMethzkQfem3yxzrRPSmf31vCC?=
 =?us-ascii?Q?FAPuTSscsqoVab8Cns1/gLCGGnrFSl22biJ4uijCxG57uYGQSw+4gxoNghvM?=
 =?us-ascii?Q?M4yyQ++xt2XuJg7dul1XFltz8Urn2PHE/hHDMOAzMvlnQXRb+41OQfr9UqLc?=
 =?us-ascii?Q?layI1yKrnWE+7QChyIGcDIbAyfL58+dStmzaJn9N6AggCgahpih3NkwHSg9w?=
 =?us-ascii?Q?wE1Bfw/wHA4hhuvkZgC6qg0n7Cz8n27k+Wjcl3zzhVoaGgUOepV4jGTN4qqH?=
 =?us-ascii?Q?ZavHc/VTGJq8DISHKkPgF64iV27K915owSsvXAY5Gvq5uvLW2Tdi9W5lfRGk?=
 =?us-ascii?Q?Hir1H2yCnCHK5iQ5TyDEcNmvGXBjHCwUFpEv31Ef8aZnhq33LlRQEQvLxc7d?=
 =?us-ascii?Q?wZD+H/HrX8pLCH4uQlWYTBL4xp11fsyOZKPpNKMCZkFefGqmopBksrXKiv+o?=
 =?us-ascii?Q?cMAyWREY8DKscRDb9wEa43OLd6voolsldZhrqfrLS6eqnEBfLZoA+LN7F5jq?=
 =?us-ascii?Q?t7SIQ/PEldQmtoaA9xySjdeY/OPjkfT9lORCH5jntqgZNAumxp4m+35FBxE3?=
 =?us-ascii?Q?NYN9b0v1mqUCf/YBbiDJXPf4goRkwyi+Ywev8hCpsEFzGo3ATebHLWCF9P7F?=
 =?us-ascii?Q?OX0h898u+L+NWqjpIkguvW2+oHR1/Rq2yFiGN4bCqHUAOIPty2taFvRoBVdn?=
 =?us-ascii?Q?dA8qm1UgKHltooYCWNcrPJbtqdzlGoidifWgo3FjVFrBPqObqDA3xgsMzqMi?=
 =?us-ascii?Q?vwhGl7/uID2tlDEFm9cZRF48Js1P+t3mFUaKrGVLUAl7OFP97EgTvmYkdI8q?=
 =?us-ascii?Q?STuEuZA/r+u6HIb9/8bt3nL3dK3Euwa5ATxutzzpax3Uz2dcU2+Mj65Iu8ys?=
 =?us-ascii?Q?spLTXX4fkjYL0M+q18WMQyCstyVvuo4DJ71uTAfJ?=
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY2PR01MB2778.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7f45ec-951f-4102-0ea8-08db9248dcb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 04:36:24.0503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 39KnWgwKSsqGnreVtPXtqkbGfkSO2wWm7IYfEPMtvbe+xODAuFsk3czXQBhoKaXXQ5psUukV8mSPckKkrS/ITVZ4eTdRYYkxh6+6HDqpCyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY4PR01MB5865
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gallagher.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvyCtmsNz5IHRu2BH19uBV96ZUbTs3P12cU42r5U1vE=;
 b=s0TSsaXkUQVQqcU9ldfNetNBSL4KuFdB8vaVSt5UDZGFtTsCMffNPiKap5zQ+b9pIB3VGbss/orsjqYSgXCGYB77l5XFJ9vsfpDPxiajxY1lOMKd6UKStpuzjMHfb91aEElu1YM5V/aGpvB4P0MJdbU88Mx4rFLxfFPUrl6QxB+FnHAHGcWBADFaGhjA2rlYD52EIRjjvhSX2S01H7vcKcE6fVBRmAEW+aLwlSumdXXxQ44DNUfQgmWE6ww+cRx/GgvSd+U8vlUTs8n72VByB3JJHtJDblXF3M4Y8IkQWdZZjt1/AlAUWaBzFwHEqXP4WRCmR3CiUH7EfH6E6v2Rpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gallagher.com header.i=@gallagher.com
 header.a=rsa-sha256 header.s=selector2 header.b=s0TSsaXk
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gallagher.com;
Subject: [Buildroot] Update schedule of sources.buildroot.org
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
Content-Type: multipart/mixed; boundary="===============5248643203840509725=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5248643203840509725==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SY2PR01MB2778500474B41D29E8E7D54C940AASY2PR01MB2778ausp_"

--_000_SY2PR01MB2778500474B41D29E8E7D54C940AASY2PR01MB2778ausp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

I wonder when http://sources.buildroot.org is updated normally. Because fro=
m what I see, it is normally updates pretty quickly when packages are chang=
ed, but there has been no update for last 2 weeks while some packages like =
openssh have been updated.

Best Regards
Afshin
________________________________
This email is confidential and may contain information subject to legal pri=
vilege. If you are not the intended recipient please advise us of our error=
 by return e-mail then delete this email and any attached files. You may no=
t copy, disclose or use the contents in any way. The views expressed in thi=
s email may not be those of Gallagher Group Ltd or subsidiary companies the=
reof.
________________________________

--_000_SY2PR01MB2778500474B41D29E8E7D54C940AASY2PR01MB2778ausp_
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
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
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
<p class=3D"MsoNormal">I wonder when <a href=3D"http://sources.buildroot.or=
g">http://sources.buildroot.org</a> is updated normally. Because from what =
I see, it is normally updates pretty quickly when packages are changed, but=
 there has been no update for last 2
 weeks while some packages like openssh have been updated.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards<o:p></o:p></p>
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

--_000_SY2PR01MB2778500474B41D29E8E7D54C940AASY2PR01MB2778ausp_--

--===============5248643203840509725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5248643203840509725==--
