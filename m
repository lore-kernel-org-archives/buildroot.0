Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344D0C001DE
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 02:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7430960B00;
	Wed,  9 Aug 2023 02:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7430960B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CHCUi-c8cT7I; Wed,  9 Aug 2023 02:27:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78C9F60B29;
	Wed,  9 Aug 2023 02:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78C9F60B29
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4DAEE1BF2CE
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 02:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24E6B4179D
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 02:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24E6B4179D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QBOuDuFLBFhm for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 02:27:38 +0000 (UTC)
X-Greylist: delayed 12350 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 09 Aug 2023 02:27:38 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8532E408D1
Received: from mailfo01.lmco.com (mailfo01.lmco.com [192.31.106.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8532E408D1
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 02:27:37 +0000 (UTC)
Received: from lmxpvfgd12w05.us.lmco.com (lmxpvfgd12w05.ems.lmco.com
 [172.23.84.84])
 by mailfo01.lmco.com (8.16.0.42/8.16.0.42) with ESMTP id 378N1hHD088579
 for <buildroot@buildroot.org>; Tue, 8 Aug 2023 23:01:43 GMT
Received: from lmxpvfgd07w02.us.lmco.com (172.23.84.41) by
 lmxpvfgd12w05.us.lmco.com (172.23.84.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.27; Tue, 8 Aug 2023 19:01:42 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (192.91.171.229)
 by lmxpvfgd07w02.us.lmco.com (172.23.84.41) with Microsoft SMTP
 Server id
 15.1.2308.27 via Frontend Transport; Tue, 8 Aug 2023 19:01:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=kuQIHvKyAe4K7yPaQMBkW2G2Z7JSfcAKB7axyMDDlY6nF6YqJMgjKuJNyCjK9AZl21xyY/H/XomPXQTOp9flCckvUqaN7xtDQqRNRRR4WL97jL708uK1Or0YOiERg6uQ1EZVt73IJKqI/Xz5MNdH4G+t5Za30X7/wxCC93xulKtb2geitMGGWxHXKSM8b/K0+NOL7zWfVCRF2egz3AweOeaZYcd173lpbXE1++kptiCqY6U+JjzDwbqPjs121J6W1RiD6zhAPObBl6oyakxbHzRM6zufSE8AT+eNhv69qao0XztlM76joIspcZqJB+4rcEAS4KSUCODmnQnar9PKyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tZNFG0Qub4BR+dCRzSki3IrxbICZQqvTZyQvn7svpM=;
 b=EJ160VU9FvU8SKg3N+PYYVRMrXFwcngAVkQ9yUkP8QZfouXJPpsJ+jP43Ts9h5XtH3rzgJ0mYS/z4cx93keqe54amWJMF9M9YGZPHX9/n92V60inmmLvd2kU/WWz89sqeuIx21uFqPTBS4wdVMYRc1QoCUAQd2b/pPQeYsjPpP0Y9HCorqKlMi70Z3xONvyK0OpsfofuOybLuI3fvjb2cV5aQOSLXQm+Ntp4dFRYSUhIMmo14eZmgGtCUhl8IeIP4vmoW2d66mVf2Bu/Aiw2txgAC8XsI0hV0Hn3oduQDiPkWDqoY8PgFUFuagSnjA3zR0N/DhE3Ija+teT3ZVdm6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lmco.com; dmarc=pass action=none header.from=lmco.com;
 dkim=pass header.d=lmco.com; arc=none
Received: from PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18f::19)
 by PH1P110MB1236.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:189::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 23:01:40 +0000
Received: from PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM
 ([fe80::1f77:559:711d:72d6]) by PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM
 ([fe80::1f77:559:711d:72d6%7]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 23:01:40 +0000
From: "chris.wood@lmco.com" <chris.wood@lmco.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Buildroot Licensing Issue Uncovered 
Thread-Index: AdnKQuJsEf7r/vumR9+PVhtne/eqMwAB4kdQAAAsqbA=
Date: Tue, 8 Aug 2023 23:01:40 +0000
Message-ID: <PH1P110MB1155CA9BDBBEADDFE214E69FE60DA@PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM>
References: <PH1P110MB115562DCC66A2B57EA65AB0CE60DA@PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM>
 <SA1P110MB09929404D9FDB9F5E043A920C60DA@SA1P110MB0992.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <SA1P110MB09929404D9FDB9F5E043A920C60DA@SA1P110MB0992.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_502bc7c3-f152-4da1-98bd-f7a1bebdf752_ActionId=a2b5e12c-f0e6-490f-9ee9-65f8681ed516;
 MSIP_Label_502bc7c3-f152-4da1-98bd-f7a1bebdf752_ContentBits=0;
 MSIP_Label_502bc7c3-f152-4da1-98bd-f7a1bebdf752_Enabled=true;
 MSIP_Label_502bc7c3-f152-4da1-98bd-f7a1bebdf752_Method=Privileged;
 MSIP_Label_502bc7c3-f152-4da1-98bd-f7a1bebdf752_Name=Unrestricted;
 MSIP_Label_502bc7c3-f152-4da1-98bd-f7a1bebdf752_SetDate=2023-08-08T22:23:06Z;
 MSIP_Label_502bc7c3-f152-4da1-98bd-f7a1bebdf752_SiteId=b18f006c-b0fc-467d-b23a-a35b5695b5dc;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1155:EE_|PH1P110MB1236:EE_
x-ms-office365-filtering-correlation-id: b250e8da-6b95-4715-c506-08db98636d31
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /1ODwhoh1FXwtKhs4rXENEHfJrWB95haiiAFJoMyMjreknuxVl36GsqfAyVnXIBEIowvPqqdlN8fIC9RNOP/PTKNsNrdIbWAex4iDgDzioW5rzCJuMBixDiA32Pq2qcBDkecW5SXb9/ZsoNpPGYGlPPdYtRHzAY95C5OZDgc7wYK1jxIgf1IShN8VycBq+vfqhyecenBzs/RuVE4iS6Qevj806PyOynD19/UyKJpjUV4XI29aKEpklHCjVJw0eB/s2rChHvLRt+nXZRR34E9Ll1ljIywsh/KXA0EG1bLmO9YiQHZUNkpiI8fD4MtrQmDiPmKFvUGeufbLiJq3okdDLuYsrsaXMUhrAex3yQOLezK/I/0g22dQAg2Cs4uwmmWJMScVcIdovrN41TaWcojHdvHwtXnG5qtxSkjuknRxkda7YozgHRX+y4RaFOwrMEIHdozUmrkXOpeXYwavDucMmE9YqDPZkpJjyvsX5Qm0UEVNDEo6Y+n0hmFi9ftXIIrZ0BzMlSbqPEZtv05j/Wf0pmgOD/w3TuvoSSHi88035fv1LnsjwPgLXnKLFJh+TPtxgh/5AI592aX4lQsXV7ZiCMMOhQdYpO6g6V6LMRt6D2qaLFo1yTuHjSYm6zjL5Kh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(186006)(451199021)(1800799006)(66899021)(498600001)(8676002)(8936002)(83380400001)(66446008)(6916009)(71200400001)(2906002)(5660300002)(66946007)(66556008)(64756008)(76116006)(52536014)(66476007)(7696005)(6506007)(26005)(122000001)(38100700002)(86362001)(33656002)(4743002)(55016003)(9686003)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: P4nfOqBPO6qmpQKurzOAcz2dCVMel51+u1sAxTRETk9GodytmJfIOp93fD4tpYWxJthkuQARH1Z40pSH4pgTA61Ym5I6YjFn2WxEH7RnVWeSwFcehdPDdgJmxu7Ej+9/4qNevDX8PT5RTWbPk8Ps76FhKNGcDzX48xsQ3KsWQbtnUWB2cngZI0RBTe3DNxFOSkBh6oHJr92N8zg8XB+eAM5enrcd+15EI09w5nBA8gaFQo3Zmmz811Xi0FloTIBevKuaJfDn5tytB1j6s2NBESGea+w0kElgFd7SaA9mcft6EUiwYbC66xIOX5XUV9QTC//k/GTw+i5xmc99fFaGgp/CZh2sJw0fwXCeqVa1t8ZYOvXNE6Yend2vvyUPVUczbm/BsIUfskDFgSqXNU4uZjOFr77DJMtJdZfBOOKAsbc=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b250e8da-6b95-4715-c506-08db98636d31
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 23:01:40.3886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b18f006c-b0fc-467d-b23a-a35b5695b5dc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1236
X-Proofpoint-GUID: N27tubOoGCTw-mfH18TRpJBRK9uWWJGi
X-Proofpoint-ORIG-GUID: N27tubOoGCTw-mfH18TRpJBRK9uWWJGi
X-LM-Outbound: External 172.23.84.84 cntry=**
 g=N27tubOoGCTw-mfH18TRpJBRK9uWWJGi q=378N1hHD088579 m=1
X-LM-OBSENDER: chris.wood@lmco.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.591, 18.0.957
 definitions=2023-08-08_21:2023-08-08,
 2023-08-08 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308080206
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lmco.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=corpgw220615;
 bh=1tZNFG0Qub4BR+dCRzSki3IrxbICZQqvTZyQvn7svpM=;
 b=dsBUn3IF5AHt7tsiLAtuXFPzW9/5i4Th+HbF8xxABzwD+v5WOk/83nNS2M+OE8fuzXWs
 OEcC6STWsLV0q3Hd42kJWjkTGof0lho1q78hOsNLUd2Y5aLMcAOLGFkwidm+NpZL54Us
 aSf+rWJ/Aswd27F+zxCRkUmEdGHr+WHixWlGfhDmFK8tn/u150AmGgWq7I4FphFBiHpc
 Ql/kDxt6KmPK0Hye0Ip6/XIg/te4KkEF+j1REW1KBVZpaeIAD9FBhzn9KpBazyFK8wcY
 823gLdCpvNESzFQL0AzIiUhkl1rDGRm39AB1nD/VMlS/owKXku4HMVyrgEltdKfakmSh OQ== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=lmco.com header.i=@lmco.com
 header.a=rsa-sha256 header.s=corpgw220615 header.b=dsBUn3IF
Subject: [Buildroot] FW: Buildroot Licensing Issue Uncovered
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
Content-Type: multipart/mixed; boundary="===============3575027405351834325=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3575027405351834325==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PH1P110MB1155CA9BDBBEADDFE214E69FE60DAPH1P110MB1155NAMP_"

--_000_PH1P110MB1155CA9BDBBEADDFE214E69FE60DAPH1P110MB1155NAMP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

To: buildroot.org, Attn: Peter Korsgaard, Thomas Petazzoni

We are desiring to use the buildroot software version 2023-5 and were perfo=
rming a licensing scan for the purpose of creating Software Bill of Materia=
l and came across a reference to a license that is not an open-source licen=
se it is an NXP Semiconductor commercial license. The licensed file is loca=
ted in the boot/directory/lpc3200cdl, and the file containing the license r=
eference is "0002-delete_redundant_files.patch". The reference says:
"- * Software that is described herein is for illustrative purposes only
- * which provides customers with programming information regarding the
- * products. This software is supplied "AS IS" without any warranties.
- * NXP Semiconductors assumes no responsibility or liability for the
- * use of the software, conveys no license or title under any patent,
- * copyright, or mask work right to the product. NXP Semiconductors
- * reserves the right to make changes in the software without
- * notification. NXP Semiconductors also make no representation or
- * warranty that such application will be suitable for the specified
- * use without further testing or modification."
To obtain clarification on the statement "...conveys no license or title un=
der any patent, copyright, or mask work right to the product..." we asked N=
XP who responded that the software is freeware offered to customers purchas=
ing their boards, and that it is not open-source software and furthermore s=
tated that they have no relationship to the buildroot software product and =
wondered if you have an agreement with them allowing you to include it in y=
our software.

We are hoping that you can provide licensing permission evidence or other a=
ctions that will be taken to clear up this oversight so that we may use you=
r software without concern.

Best Regards
Dr. Chris Wood

--_000_PH1P110MB1155CA9BDBBEADDFE214E69FE60DAPH1P110MB1155NAMP_
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
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">To: buildroot.org, Attn: Peter Korsgaard, Thomas Pet=
azzoni<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We are desiring to use the buildroot software versio=
n 2023-5 and were performing a licensing scan for the purpose of creating S=
oftware Bill of Material and came across a reference to a license that is n=
ot an open-source license it is an
 NXP Semiconductor commercial license. The licensed file is located in the =
boot/directory/lpc3200cdl, and the file containing the license reference is=
 &#8220;0002-delete_redundant_files.patch&#8221;. The reference says:
<o:p></o:p></p>
<p class=3D"MsoNormal">&#8220;<i>- * <span style=3D"background:yellow;mso-h=
ighlight:yellow">
Software that is described herein is for illustrative purposes only</span><=
/i>&nbsp; <o:p>
</o:p></p>
<p class=3D"MsoNormal">- * <span style=3D"background:yellow;mso-highlight:y=
ellow">which provides customers with programming information regarding the&=
nbsp;
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"background:yellow;mso-highlight:yello=
w">- * products</span>. This software is supplied &quot;AS IS&quot; without=
 any warranties.&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal">- * <span style=3D"background:yellow;mso-highlight:y=
ellow">NXP Semiconductors assumes no responsibility or liability for the
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"background:yellow;mso-highlight:yello=
w">- * use of the software, conveys no license or title under any patent,
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"background:yellow;mso-highlight:yello=
w">- * copyright, or mask work right to the product. NXP Semiconductors
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"background:yellow;mso-highlight:yello=
w">- * reserves the right to make changes in the software without
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"background:yellow;mso-highlight:yello=
w">- * notification. NXP Semiconductors also make no representation or
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"background:yellow;mso-highlight:yello=
w">- * warranty that such application will be suitable for the specified
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"background:yellow;mso-highlight:yello=
w">- * use without further testing or modification.&#8221;</span><o:p></o:p=
></p>
<p class=3D"MsoNormal">To obtain clarification on the statement &#8220;&#82=
30;conveys no license or title under any patent, copyright, or mask work ri=
ght to the product&#8230;&#8221; we asked NXP who responded that the softwa=
re is freeware offered to customers purchasing their boards,
 and that it is not open-source software and furthermore stated that they h=
ave no relationship to the buildroot software product and wondered if you h=
ave an agreement with them allowing you to include it in your software.&nbs=
p;
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We are hoping that you can provide licensing permiss=
ion evidence or other actions that will be taken to clear up this oversight=
 so that we may use your software without concern.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards<o:p></o:p></p>
<p class=3D"MsoNormal">Dr. Chris Wood<o:p></o:p></p>
</div>
</body>
</html>

--_000_PH1P110MB1155CA9BDBBEADDFE214E69FE60DAPH1P110MB1155NAMP_--

--===============3575027405351834325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3575027405351834325==--
