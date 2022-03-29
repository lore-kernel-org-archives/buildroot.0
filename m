Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9096BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 05:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E61F18418A;
	Tue, 29 Mar 2022 05:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T93N2PGM1Ohq; Tue, 29 Mar 2022 05:58:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A07CB84150;
	Tue, 29 Mar 2022 05:58:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E5C91BF33B
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 05:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E62284116
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 05:58:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eiEkk03UMu4u for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 05:58:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B82A684114
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 05:58:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6zxsMmKToi7eX3ZmHqwqNDLBC/7lj1GGh4da2zVdVKwI9/OiPoLK6BLZm0r5hAIv/gXkO7pclW0Bj+CexQMM7n5/+zKocviIdWT4fWDn3i1WDK/iVhKvrJw9o5vr0C6Ul0O/9BpbpANVRZMvPN6Zaa9yNDyCjQwWNUC3UFsVog+X+k9qOs5RZuWg1qpwB7FWnNDzfQnM/JNi/16Tv7remBpSgWDmEEmUgslPbxiBZ8FA+Zs10uLnsIjRU0zBA5FvDTXORRa7AEk1j2fA5DauW5W/eNi1G3sM0ZkiKqa9UeTupu+W6Dk+ZcgTRKNCGwJ4LHF0KA/hba19oRieoBYZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLsqDKkz9PlEUfm+3xMjqwKreRyOE8scj+l8EQ3QrrM=;
 b=SLvK5LxMDail6F7BaJCxQrLxKNV9yAvmUTGfQbc0XndXCzLAFTcvDL7LxKgJ8F8EuHbX+NmiyLJnSpxF3iihRAJ+vR9Kr9Qt3pq1Ndb57w7odv2gEKAIkT4KDFJk029gn+StB76pJFSwa/4DfKhXCjPjFEhJ80c9ROjQH+kE4jZQqZxiiv+nBRacQfpjUcOULQhQ7dVpeUDYZyiWdNg8JW+T1qaIDjaWC5HMr6/BcLIUmeUPMkKdeH5ZUI9jfiwdCIWPOCyqUQDO+G3iYfnh3zL08Ov6PegL+AxTUs6HnjRN+XDllA2bVq7pce1fSGtqdIysMVSe95tnYBPOZclXiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thejacksons.uk; dmarc=pass action=none
 header.from=thejacksons.uk; dkim=pass header.d=thejacksons.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jackodemononcascadec.onmicrosoft.com;
 s=selector2-jackodemononcascadec-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLsqDKkz9PlEUfm+3xMjqwKreRyOE8scj+l8EQ3QrrM=;
 b=j68lIWdZkIeHa4vXPDmPswhxKk3XhW5pNgY15080e9wnl65OOKeultqufDvv0YRICbiPk/b9fA+Zgl3TvM9tLUBW8HAK/nXjfuxewa2ERdeaCc4x9Jf2X3Orv/DQkX6xzgexZkzHtFlYF789BMJDApSfFETpIRlvfDvoNOc8Skk=
Received: from AM6PR02MB4884.eurprd02.prod.outlook.com (2603:10a6:20b:32::21)
 by HE1PR02MB3036.eurprd02.prod.outlook.com (2603:10a6:7:36::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Tue, 29 Mar
 2022 05:57:56 +0000
Received: from AM6PR02MB4884.eurprd02.prod.outlook.com
 ([fe80::5c61:b5c0:8686:2528]) by AM6PR02MB4884.eurprd02.prod.outlook.com
 ([fe80::5c61:b5c0:8686:2528%7]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 05:57:56 +0000
From: Dan Jackson <dan@thejacksons.uk>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Adding USB support to existing device on 2.6.39.3 kernel -
 possible?
Thread-Index: AdhDMRJ69qa/wFnoQWuRT988ItKpbQ==
Date: Tue, 29 Mar 2022 05:57:55 +0000
Message-ID: <AM6PR02MB48842B06ECB95353B61E5A22DA1E9@AM6PR02MB4884.eurprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=thejacksons.uk;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eea374d5-f4f7-486b-322f-08da11491236
x-ms-traffictypediagnostic: HE1PR02MB3036:EE_
x-microsoft-antispam-prvs: <HE1PR02MB3036EEE7AF598236CEB37E05DA1E9@HE1PR02MB3036.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +YP3x8VmwD4DlCXSExHLyxJVUuu97Kx2IAnh+GcC3JLo4VHW0NxMp2GGOEuDyfONTwWqIvlnXr4GBFoF6FMQrK5eHgPQAMYsP1nBjDvTfyh5ZRM04/mDoIBN8SzcFYxqsMWfzo/+Y7HzMD47vla2qpbZQnO3cnqwjeZuXGB4rHtG1oycsKhMk1S38jwbqiGRU840DLYcqTcz7KtKl8nSF81NPQ0EC36qyQ3YXNY2aokkBYpl0REt+TR4c1fl7xXpHSgBV23MjkDZMY1qpnyVeFWzHWZzUOUIyjcPgJpzokbRqMNO3Ts4dvo6x1djQZ7o5mSSgwnALJclv9fqZBhEeyGIEs39T9aDw6LufZskpVb0hh55xF1QRwLCwY0oFjoxVc1shiaMdBIHsmxzZd7lNFGUvjWDjnTo5R2r+bYJ69HiVd8lVM2kB+AwHQhoOZDekaD/Tgl9qeLJDdWNCkHAunn26xRKZvMtVgt5oxiQdSpBEWtF4gau1tQn5LhaQukbKyH3zlB+Yaspwh8qCpIVKB67ASU16j4dGOUGTPfd4VIOuuRfYX21mtCVzKY7+3sgypPodnDxvmcIn+JFHioQ+nfC0L5shstNrTuQeFgdTCG+q1e4uDjL05Fr3QJO8pc4rf+9CQ2aQ/6zTzk77+T+2e78saFFaXRjz+p/YbNd0i2jOl0QkeJ3O46b5uLxvAKXFTd/OqWcp2cztNcxREDhCw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR02MB4884.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39830400003)(136003)(376002)(396003)(366004)(346002)(38100700002)(316002)(6916009)(71200400001)(9686003)(38070700005)(8676002)(86362001)(508600001)(9326002)(52536014)(6506007)(7696005)(76116006)(122000001)(4744005)(66946007)(66476007)(66574015)(5660300002)(33656002)(8936002)(2906002)(26005)(66556008)(55016003)(64756008)(186003)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6HTDF93ERj1sCRKJ5f0TI18mOaMkFjCUoPkpsxTr0QYEpsFkSQwe3GgOpYtd?=
 =?us-ascii?Q?rv9NP/m8tdloa0uoVw4+c656OAUAtazPqoTULpAcQ/XrFtOzqu6aREKcRaEX?=
 =?us-ascii?Q?Jcpl1U738/4Mf8+NhxwQwEeYHsJwz0C3RhT4XlkzUEwtuFK4k+bvdtPMX4eO?=
 =?us-ascii?Q?f6+Oi/nYE4t8qHOcih7Sfgfuq0vUHl17m4TFhrk+f/g7NwAFr1cuZiTvPEcT?=
 =?us-ascii?Q?9s4lBmTLug4ZyRCG4KFUugsEIMWkEh8QoV8bi0ORdkJmZMWwVVQgAun5u0FW?=
 =?us-ascii?Q?25O1GkEfL9IDchFjB6u+DKRkAQmEPIvHKFiRHxFCphg1+8562MMmvr/F+wQq?=
 =?us-ascii?Q?B0FtYuqJv0EjnjOK05oS4/lMgV64x1FXCgp4+rsJbQdZL1kgx0hSkFF4Upx4?=
 =?us-ascii?Q?VCGZ4xd6zfbbao96sqvLxv0ya0w0eqEkLHUFSGdP48fovht8XuMmEpsXRxD0?=
 =?us-ascii?Q?UwNoFAG5eZTNAhtnh2tNmpBhz7LFOgWI4SHCON29w5De/HJ+Jyn1EzAB1xGN?=
 =?us-ascii?Q?8PWsnvvokLdtWVSy/wL+bYc5G9GJsIX65vm2sp7B1ZTrlPOGHbz/E/Kcd0W3?=
 =?us-ascii?Q?Bxb7/XEzXWWYU4QJfgpsDO5EVzEto4KpYxVQ4DX7IVLO/MSB3awn7/BS6MWI?=
 =?us-ascii?Q?B6jSG610F7S2dgEZjBbxToWE15cF/lbdxWRhiy7Gq/Cuem6PhRfzonzS/+xm?=
 =?us-ascii?Q?1y88uHf/AdkbkHGsohCv94JFEYWcysUk5lfqvlVT4xvmd0vSATGuLKTYyrZr?=
 =?us-ascii?Q?KkxVykczPLsncfARrU0v3ajhf9rCgV04obHksyw+OR+Rw3J77Jeq9GEcAYMI?=
 =?us-ascii?Q?R9+2y9/q5aurqnQgkCA9AzpJL3ZTcNCo2wX8lBYvGyT86M0CcudVPiMf9/RV?=
 =?us-ascii?Q?sKO69QRhyY+F/oOy74TSx+56ivIpwyyMlXA121HPV9c/N5I/05uKcQOYHoeV?=
 =?us-ascii?Q?PH73C5cQneiMPjc3S3YAEOjky9Zp0xZYVc8ZpMt95pj4wjIS/ZjTAgUcVHZ2?=
 =?us-ascii?Q?evaJlMW3Eb9cCJvaB5WvS43XcayQupYm7MxQ5H0PEUhkUrYbNTWK8HZQv/22?=
 =?us-ascii?Q?1ii0xi0rOhVqUrHQWmAEVuT0HiQ2SJc0md9RmqS7t5xhWIRP40mdtkF+THW9?=
 =?us-ascii?Q?pH19fe44kt46WE86sQuj3Rcaaok1lbk3lv8VNuagyHjLFv+1JVRFSSOIxx1i?=
 =?us-ascii?Q?33QWEVz9ZrWlaAGu2MlrPXt5cy9Jh/9JLIv47WbeA8jZXPLHHWZ7tKa72SrI?=
 =?us-ascii?Q?BYnmLGVQc3al6WtsgNgXiEb95QdVXPMXyi7Go0M4OsMb0NHSpCxaRUhRPGDy?=
 =?us-ascii?Q?8usH3T3BXanewHFIy3UtK8Vyvobg9/jcUCVgOSBop8QtxeUmvCwVvSosNtaj?=
 =?us-ascii?Q?hWbIRxdpbLHcSxiE0Yrx4yav4nhoMIXQZdQdDfZK46NTXqRDY7Z7U+VXK5FW?=
 =?us-ascii?Q?6LeUb6m9bdJcpiLBJXv1ZikzC2b77+cG7VYUqzg9WaZ5MzpRzz0BvOJcA0RJ?=
 =?us-ascii?Q?gDCChhC10ic1eVK5vCgUWwxN7mu3rHFwp50w7CTcEKZ9887JQa2yCI0O3SDS?=
 =?us-ascii?Q?4gkIdfcH8v3/xeClLk4Qzfp1EH5DaLcfCuIb3B0rMEMY7WyELWE6O89N/f3v?=
 =?us-ascii?Q?MLavUd40sNoprPpKXhcOxsHnSxH4//tB7bEQcBdV4dBhN6cx4/cYAJlOILrX?=
 =?us-ascii?Q?s5IW2DvPxo96hZgpCPrpY+LjGh2CXonO2phZLOXgNRdSM0Cl?=
MIME-Version: 1.0
X-OriginatorOrg: thejacksons.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR02MB4884.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eea374d5-f4f7-486b-322f-08da11491236
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2022 05:57:56.0766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e3dbf3de-d91d-474c-a156-23562e023d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h/We8wDSvM/1/ky7wtAOKlivCp08IHVd5cv/H4prOq7PpjiIvYHtnRYVBBKncHaYriINVhIiqTb7wjUBFaUnIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR02MB3036
Subject: [Buildroot] Adding USB support to existing device on 2.6.39.3
 kernel - possible?
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
Content-Type: multipart/mixed; boundary="===============5088982510488514742=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5088982510488514742==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM6PR02MB48842B06ECB95353B61E5A22DA1E9AM6PR02MB4884eurp_"

--_000_AM6PR02MB48842B06ECB95353B61E5A22DA1E9AM6PR02MB4884eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Sorry once again if this is a silly/noob question.

If I have an existing router device running a 2.6.39.3 kernel, which has a =
USB port and is capable of supporting USB devices, but the manufacturer has=
 removed/not installed the necessary kernel modules, can I use Buildroot to=
 recreate the missing modules and thus re-enable the missing USB support?

If so, how would I do it?

This time I successfully managed to build other binaries (e.g. dropbear, bu=
sybox) which run OK on the device.

Thanks,
Dan Jackson.

--_000_AM6PR02MB48842B06ECB95353B61E5A22DA1E9AM6PR02MB4884eurp_
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
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sorry once again if this is a silly/noob question.<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If I have an existing router device running a 2.6.39=
.3 kernel, which has a USB port and is capable of supporting USB devices, b=
ut the manufacturer has removed/not installed the necessary kernel modules,=
 can I use Buildroot to recreate the
 missing modules and thus re-enable the missing USB support?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If so, how would I do it?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This time I successfully managed to build other bina=
ries (e.g. dropbear, busybox) which run OK on the device.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Dan Jackson.<o:p></o:p></p>
</div>
</body>
</html>

--_000_AM6PR02MB48842B06ECB95353B61E5A22DA1E9AM6PR02MB4884eurp_--

--===============5088982510488514742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5088982510488514742==--
