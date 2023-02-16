Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2876CC636CC
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 02:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F08D81F61;
	Thu, 16 Feb 2023 02:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F08D81F61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L2g-iVA3x-5g; Thu, 16 Feb 2023 02:43:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE05C81F49;
	Thu, 16 Feb 2023 02:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE05C81F49
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 162701BF3A9
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 02:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E0A040121
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 02:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E0A040121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tAIIqD_KNJqE for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 02:43:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71CD6400A6
Received: from AUS01-SY4-obe.outbound.protection.outlook.com
 (mail-sy4aus01on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7005::706])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71CD6400A6
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 02:43:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrInHuaDqEtEK6ISWAXeK814ldjTs3BtzLtaVzgQtr9UF0Sb0AP6nNvETpz0ME2yUe9IozBd7DcHRdy5nqZ2GKugOtKEjfnboL0eE1H0UnCjJEqmBiInA8MIrp/Vo/OTadnDKp4BBarc+eu42A28MDClNOoX80kxWMN4q477GtWsKD438o0k5+UhBOXozcbApqIhfGKOKUqrl3L11z2GCBDOl87IFVDSUIuvb9/nUi6qKKj9eOjJVtF0QIgHO+G5mCAENBSPuwhtWkYYWhnq/InMj2BfdZTpSFqVcgLBDG0ADarXJ6aCQ8Ss1oPum17iWbWgItgxuhv6WgGFyNg2qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsPPF2rkejBSOWlHLJLCddUnAtpsQOC0dJEtMgKfa6k=;
 b=S3eOkJeejnEj7xieV79DGRDAhmBYB2q+zAy8G+m5mlYDR5CIYXIbOJo9DmI3tc3PO2UsSr5cziFe8nYLDmac5OXG5UKB1Lsld/8TjOOe3UnzyOKy6qQqsCj+RVUXDYAoZJfVaNtcVZUJAIYL2gQhvkH0SEefI5tFVb+jcFywCA1RT+i1T0XufxlF2vBr6KOHaUX4ybS2N46bI/PtYy7y1eubljGAnochAzbvgxL9yBU8g/4pMccjIEtowfighDseZqA2FRAukFQxRm5rPbXmBqsH9qyi+4e6ONEvPrV2HkGpiNLZU95hhWVI9xsIJjd7oNdt10aNIhJzYAw5dkJ20A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
Received: from SY2PR01MB2778.ausprd01.prod.outlook.com (2603:10c6:1:25::22) by
 ME3PR01MB6210.ausprd01.prod.outlook.com (2603:10c6:220:100::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.6; Thu, 16 Feb 2023 02:43:31 +0000
Received: from SY2PR01MB2778.ausprd01.prod.outlook.com
 ([fe80::da47:405c:794b:7d68]) by SY2PR01MB2778.ausprd01.prod.outlook.com
 ([fe80::da47:405c:794b:7d68%4]) with mapi id 15.20.6111.010; Thu, 16 Feb 2023
 02:43:31 +0000
From: Afshin Pir <Afshin.Pir@gallagher.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Can I enable a config option from command line?
Thread-Index: AdlBsHPfaFgGiZC7TRGGoeoyjjdi4w==
Date: Thu, 16 Feb 2023 02:43:30 +0000
Message-ID: <SY2PR01MB27780FE651C1964CD2B732A094A09@SY2PR01MB2778.ausprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY2PR01MB2778:EE_|ME3PR01MB6210:EE_
x-ms-office365-filtering-correlation-id: 7539851f-4581-4f09-8240-08db0fc79706
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8/CABDmNXsXf2s+hx9jPxeSeqc+ChGvgc4cMS1SLRLrGAw8bROWGcyUcY34r3FNGK+VHLXJ68ubqxwGnyC2tmaoWY3PAcBTwtBzHHdjNSh6JARSrAHxMICZ+lIgfftL/zbY6DuhlAflWykcZqZPs6O7soFILgiUwpRnOntVHr/K6Ri8caqKHnL3PrBs9dwDWKBP0DJ1+rqyQkVme0mNPMkm1VN+GL/LKbPhSZkW2J+2wye6k39uetNhG5lx/+2YpdPKxKwk+1tvEG7oHa9XLhrdmFKDpmw4kJGFqi4ZN4fXDJ+WrCXxJDV8/NhdbNNgDHfjtywKswkxQlv6r2llqCE8Fb02oi8s3J1QpolKju2hSdZODfyyMhBUoWibBVLIzJQZE2A9AtH+T2Pko4vFlUiRJifVXeNxfTP7hrs7Vdzc2q/U8GlccFkOEA7gylBsBV+NpC19bZYjZLnYcO8BijkfGo5xLYiyBp7qDiYICZS4Bw6c66t85VTizMF48B6yGEP7Y57l15PKH8zjtI8QDAxCHns/awmq3XX1bFJCY0h/nOzIyoiPHDGFRD7rmZ384NcjIIO0eiQRpoPTMc1rXVasq8s/Baf2+uGwBg1MAFTbJryKunYN3i+gbJnBxn0+YnOAKfzRoq3V62W9Pz1TJQNzDl0NlqdPiD8VWrIfDbujQ+ODi9mOlM4kVbriPsZSQuJNRwl4ketqTNClmXTEgag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SY2PR01MB2778.ausprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199018)(52536014)(41300700001)(508600001)(9326002)(8936002)(316002)(66556008)(66946007)(66476007)(76116006)(66446008)(64756008)(6916009)(8676002)(5660300002)(4744005)(122000001)(7696005)(38100700002)(2906002)(71200400001)(186003)(38070700005)(33656002)(26005)(55016003)(9686003)(86362001)(83380400001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kCdAtNAVVM6iXyR79n6SshI+dep9rZSLdJ2g3Q93Vte7NKyfD0XDGJGvl1Lk?=
 =?us-ascii?Q?S03V63uBP4Yjc1JX08jNp+Qc4+kcIuOYr4J27ubPbmXcXKa5uy71JCM6jfmo?=
 =?us-ascii?Q?YPITgE65QhbSDCHlnVOrk8rdhdy3g7z8SVC66HXztBlPMvVQRisRBp+AK8nP?=
 =?us-ascii?Q?XhKctOJ+bQdHruE8ABSeM5jKsbiDRFoTn2UBWpVRH5gqEAqC9ZjeS4wh+7jU?=
 =?us-ascii?Q?GCQ9wfPVpWn2/IR+dh/aPEMl8ZeQfC6+OsSCT+ME6gInAh8BoioMXe5beDcO?=
 =?us-ascii?Q?kxxYGwxwYslKWw0yMWr/HQJYVKZlFSmfbXhbiFD7wjwVGFOxUZeYPR8geNKQ?=
 =?us-ascii?Q?fh3mZdDweDB5wwyrXO8oFur1N9htoq9SZuM5gNLGytxSXQE//9CAgn1NkPe8?=
 =?us-ascii?Q?KvZImVqPyValudsOcg9hR4/j+kJEXjBgUMzXS0dVAEZz6NJOIOSnawsuPzJl?=
 =?us-ascii?Q?uCJsoQEZRUQ0NnpddXY8kNS+cbm88Df071+ar5YscQyiF6ZBxSCt4iknhVXN?=
 =?us-ascii?Q?nvRbdMSBrT9K0frnbs1fYUqqykTUSHfTxYD3hI5XElGjhfyJqxgTNNz25qjk?=
 =?us-ascii?Q?X5//NG0OkVVQAPn28x4E7FJIRKHT0b+afe1TOdddnp6bh1Upml3i/fPW/1OX?=
 =?us-ascii?Q?Si5SbL+/UQK5rvJrk2NkFuSL4PH+K0oFdtD4AgjrVkukeIoNYkFtYGtJ+/xH?=
 =?us-ascii?Q?0Z3w0/KjnDlswci8i8SMJJMNapDJ15fXt5WZRV8HChiX+diIcuES2PVO2/2f?=
 =?us-ascii?Q?TDAT7K0wAvJvzT87xR3SThFkSnOaWQX5T9w5zIECz2DMwDTs4kXzOcHrONir?=
 =?us-ascii?Q?KfkEmvY9R8FV06itLWxp5TnSYtCJsyppRn2E3kxC6F8nbVkFwX4fkyBbjhme?=
 =?us-ascii?Q?UZEkUoAQGYXvTOTqIJbkXiJxsxqQZJGDf7wQNmPXD1mtBBHysNRKfBJPK9aZ?=
 =?us-ascii?Q?nRlQGIRySgHQsRhYGypL+jXLK7oamlZ/w2Di80zmi+r6N389pxAYToKgTPzF?=
 =?us-ascii?Q?AK4MamgkT5vRphjzXf7x9biFc8KnRm8/23WyeOXVTnNns/XbCRI11Lf1niBQ?=
 =?us-ascii?Q?qcScP6peWWSka/Sao38e08lq5aspsl2rE4hFxKF52FokLOdgzsvgozEcxiaU?=
 =?us-ascii?Q?eTkwl5H5+oITc1lAtbzyD0csbtislHAIJS06Ah5OObCAzcqKp5C8WuTjb3uc?=
 =?us-ascii?Q?PstUx15ZdncF1mXg8hpX/XtnCNUBCScX+5RQJNLinb3GGxMyYzfC0U6M2yAB?=
 =?us-ascii?Q?5AyoVm/KMM35d/uM+UaE+AoH7Kf6xKtFGc79VCy/irhOIj41n8vzn5PFrrgh?=
 =?us-ascii?Q?QzBQhYUAIU8Suedp9j49wjgbVJKXGiD6QXfUsA8Su5tQyOax/UNr1lGqK7Lu?=
 =?us-ascii?Q?/qOkZvnLZtIk5dE6zIvMSNXcTx+Eob9gHcHFqGUnzxnSdjnkaYFAhgkP/TrM?=
 =?us-ascii?Q?Frp5wsBC3bvmQmM0Bq5BG/e5ymv35iwLIxFuNiFw0c6xI/q/9XLtNOjHkfaP?=
 =?us-ascii?Q?d9ktf5Dlc0yzBkJtryrPcN9od4Dx+2UePznnjMymG7aLVSlsxPY4v4stAeY5?=
 =?us-ascii?Q?wF+AHL3mzTVg6TiX476cl5Jn2X/8B2CrnF0Fke7E?=
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY2PR01MB2778.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7539851f-4581-4f09-8240-08db0fc79706
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 02:43:30.9283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7+70MykFOp2j1Sz6zTpowSpO/Nz8IgsmDw76deOdzdd+iidcc6r1+E8ngjV/IykFQp+EONTMmWFUk9YYh4MRtFx9tYzJGetOeU9F70AgvjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3PR01MB6210
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gallagher.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsPPF2rkejBSOWlHLJLCddUnAtpsQOC0dJEtMgKfa6k=;
 b=tXMwYxVleekqGMRSrQJXUrmC1/LMFW+uCbBt+Sg8C3YpvczXtHntTALLCUxcsKJOQcRmUDgFZqKySpKd2U64kt9BE36j/xRM9oH2GT8XdZCycIVWsy2wKptT0N3HHEIN95BlV9KuUP4UEDDxNCui8rm0etW/F+ev8sqizL2PQw4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=gallagher.com header.i=@gallagher.com
 header.a=rsa-sha256 header.s=selector1 header.b=tXMwYxVl
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gallagher.com;
Subject: [Buildroot] Can I enable a config option from command line?
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
Content-Type: multipart/mixed; boundary="===============0886685514056118362=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0886685514056118362==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SY2PR01MB27780FE651C1964CD2B732A094A09SY2PR01MB2778ausp_"

--_000_SY2PR01MB27780FE651C1964CD2B732A094A09SY2PR01MB2778ausp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

When building buildroot, I use a default config file. But there is only 1 o=
ption (BR2_ENABLE_RUNTIME_DEBUG=3Dy) which is not in config file by default=
, and I want to enable it by command line when building buildroot.
Is there any way to achieve this?

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

--_000_SY2PR01MB27780FE651C1964CD2B732A094A09SY2PR01MB2778ausp_
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
<p class=3D"MsoNormal">When building buildroot, I use a default config file=
. But there is only 1 option (BR2_ENABLE_RUNTIME_DEBUG=3Dy) which is not in=
 config file by default, and I want to enable it by command line when build=
ing buildroot.<o:p></o:p></p>
<p class=3D"MsoNormal">Is there any way to achieve this?<o:p></o:p></p>
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

--_000_SY2PR01MB27780FE651C1964CD2B732A094A09SY2PR01MB2778ausp_--

--===============0886685514056118362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0886685514056118362==--
