Return-Path: <SRS0=trv6=NC=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5462C4338F
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 13:49:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AE6E604D7
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 13:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AE6E604D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=midmark.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 039994021C;
	Wed, 11 Aug 2021 13:49:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8k-W6klX2tWC; Wed, 11 Aug 2021 13:49:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FAAB4021E;
	Wed, 11 Aug 2021 13:49:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C7E5D1BF3E0
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 13:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4BD983A67
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 13:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=midmark.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OSg9rlsA46wT for <buildroot@lists.busybox.net>;
 Wed, 11 Aug 2021 13:49:10 +0000 (UTC)
X-Greylist: delayed 00:07:06 by SQLgrey-1.8.0
Received: from esa1.midmark.iphmx.com (esa1.midmark.iphmx.com [68.232.141.191])
 by smtp1.osuosl.org (Postfix) with ESMTP id C45CD83AAF
 for <buildroot@busybox.net>; Wed, 11 Aug 2021 13:49:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.84,313,1620705600"; d="scan'208,217";a="53536309"
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.midmark.iphmx.com with ESMTP; 11 Aug 2021 09:42:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FH3WEfFelebarDOK64jiIDi9oe2+R7+9BLiVU+oecnbJbzZ79uLglVYp/J1hWLBqNyHj5PnkQL97W3F53ClrJqZPNGY3w5DdhDsJ+wOSB6UgPzBtSk9g03HvTiOFRYKZvtn5h2G/UK2fFc1kMIbdY6lWr/F8odyy+cAHD9pUEuIoWcYMmV+qpHNN/S6X2S13lxJ4mHn5vx7XJ8NwWUa40INBvAWZG8o2ZIMl6Y4QcynQmPO3OfEzN5CBtUrfZnW3WrGiaQ6EXdpfs4kQc+VwWv/cGPi/5T9C2ZDu9ImV2J7b9l4iROI92ZqbAUdsOKPxQowktRCUksGdW2NsurU4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImbSI0YEigGfRze7zZu0UqV2UdrsCCHrM1dAy950Vsk=;
 b=d4akERN36XA7fE+TGSMPTpvBe6MBQBOXyuCA8fCaj5N6zB0OCmuDHp6PqRiwt9mRc68zh7ndOIv2bwnu0WZPriERsAx8RXmRYgLuv1zV6phAPxK/JSuPbnILsx6n4qIZMN++RO/AvFZBkv5td6kdJ7Spj8vdfcsLbwuNoU5o6p8aiM7zA50RqMlg0n1CY0xaCeT0YnxI1y1oNNllpE04IjOx+wJyZxHfC1kqThYqCULNiOYpK2k0BknukpvHPV25bGpP5spey+OdBY0O6NdyKxFMSkwBtEG6/fX10l46IHp+gH5JX52TgJ4/96TbJcWZlmo9StRwHFizgyOoNt/R8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=midmark.com; dmarc=pass action=none header.from=midmark.com;
 dkim=pass header.d=midmark.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=midmark.onmicrosoft.com; s=selector2-midmark-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImbSI0YEigGfRze7zZu0UqV2UdrsCCHrM1dAy950Vsk=;
 b=i0bDB1AV9CJ1wZrUhNHxIZSIpb8wnM+nmTnJcBv3JscXo9SZn/XDmR4d7VdHlhp5RmP9pQPbsZ5byER5JOtlMhp5iO1BNpVDrdXF1F3OqPR0oxaSIKwQgt640CKOqkRumlugd9iEHhg2WPS0Mrwn40RUM6H99EGeEFZa/TEcPLA=
Received: from SJ0PR08MB6528.namprd08.prod.outlook.com (2603:10b6:a03:2d6::24)
 by BY3PR08MB7041.namprd08.prod.outlook.com (2603:10b6:a03:365::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 13:42:01 +0000
Received: from SJ0PR08MB6528.namprd08.prod.outlook.com
 ([fe80::245e:7d5e:750d:6c66]) by SJ0PR08MB6528.namprd08.prod.outlook.com
 ([fe80::245e:7d5e:750d:6c66%6]) with mapi id 15.20.4415.016; Wed, 11 Aug 2021
 13:42:01 +0000
From: Michael John <MJohn@midmark.com>
To: "buildroot@busybox.net" <buildroot@busybox.net>
Thread-Topic: Patching U-Boot
Thread-Index: AdeOtdGFvm75iBToRFCarQMgZlkciQ==
Date: Wed, 11 Aug 2021 13:42:01 +0000
Message-ID: <SJ0PR08MB65289DD5E9B820FAC5765B90AEF89@SJ0PR08MB6528.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: busybox.net; dkim=none (message not signed)
 header.d=none;busybox.net; dmarc=none action=none header.from=midmark.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c57d3d7e-1b82-47d0-ffba-08d95ccdcc6e
x-ms-traffictypediagnostic: BY3PR08MB7041:
x-microsoft-antispam-prvs: <BY3PR08MB70418F31CF9FE12CCB61416EAEF89@BY3PR08MB7041.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qufdt8CL25fpqD2QbCnOyyQQFNjcAa1/fN9KzU+97Zdm7J/8BaChgbXK50DnelfGwdj4SQzQmEHNycsy2jQ8XTHxazmvGJ9hinFPxZd0wiEfEiLDK/avrSGWQLo2bkM/g7DUGz0smJhAl2lUls6deGLeBSqtgo4SLCUTjk6knlk8d1iNvccpKEduFipy/sTuFqXoKBxsH/vh1jMUZaqg3GyYiTMgjG42VJYKDIm+62aQbtkBUqw4whopau39J29PwlXPusl/pBlLR8Qky424SvF7W5re2EV+MyaTYHBkw4oWybPaSna2MCGXLf5PpsAXVsQD04xnIPnaDgiCzR5CV8QVTpq3J/0lp/Oc5+CjzqKapVmrKD6Ka2UzBp01Ie9mWlqIMCUDb5ti+6lj21DM9srFbDFDX60uVxTjXwrtO8seOBkAD1eMAjsRs53MtNv3+EsGAlXG7oY6IbxQFvaB6x+ATm5Sy33Cvdlxr8fEl6j+cgt6FgJSdee1UWx+ORKmqJ0DQURgKFHcAcNiZ5ryY1OyewE3DMJ+NtVu+tjplKy0Ooswvh/8/bwAeIqXJIqdVj846bpdpbFuPnSXHRnCvYKzR+DqVzPv/PqffxFCJ/EaXx5w4I7TqR4VTMUV8A2PIpSF7KPHpYspXUav7urtHimb6p70fBSBa9vNbgcY9dWrBFVit5m2s22ansFx+CP0IVDIMwxOW4MAquQll7hrHw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR08MB6528.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(376002)(136003)(39850400004)(346002)(38100700002)(6916009)(83380400001)(66446008)(66556008)(66476007)(5660300002)(64756008)(7696005)(2906002)(8936002)(122000001)(66946007)(6506007)(4744005)(186003)(33656002)(55016002)(316002)(52536014)(8676002)(3480700007)(71200400001)(38070700005)(26005)(86362001)(76116006)(9326002)(478600001)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OCSQaKNFduJC7pm8o56ZZ1be+OpNmM+qEVTSgq+2A8ztCOvBjRXKMCK2QRpR?=
 =?us-ascii?Q?lbxMOZtDhCczLHqsxFhM+9eNUnxPq90P2hAuitd9rgpmcl3lqjGhlYGXvb4W?=
 =?us-ascii?Q?mCDYJD2QA9KJ7IqtPfNHzpkvDiycDxaVGY6tZqdP774p4F7aDqdpvTrmI82u?=
 =?us-ascii?Q?UwvHd6/SOoYYPxm2LmKHHNZKSz+8B38p9lDVf4rXn0DxY1A1d27TQWxLPiAv?=
 =?us-ascii?Q?SochxcroIJkUAhl8GCvLfi8hdXZ78w+c8sQV6lEJbGmpCSYyXF+Kc+ZxG7Z1?=
 =?us-ascii?Q?+xAZ1BZEXX9JdElirCHeqB5CyCTQs4TvGxAnER++MorWEXjyPy1kgmw9i9w3?=
 =?us-ascii?Q?RMotOIujQ6m1zG5xD/m679jb0bUMuBlr2vpu2kC92gzZ9+91D1HE5LIUbUoY?=
 =?us-ascii?Q?YMyRNKWWLD5k7Qwm12q5mF3wmitsDb/t7QPge3xJLtg2FiZkCmi/ZIdbAjgl?=
 =?us-ascii?Q?QNpVWfiRlp7w641KP9wxTfpc9/epCE02NBckwDqJ3JCDRTogPS4dBDgrJtqh?=
 =?us-ascii?Q?UDaTkrqNqUOKWz+dWJt04FERd3SbUJrMDF68Oh+cA+wVmj5RKqzvjnRc66RW?=
 =?us-ascii?Q?ebukf7WPpvS7X1yXYksH1UPRMmweEGbO9+KVIUzsG7P4K4L2ScOPjeWR8zUt?=
 =?us-ascii?Q?nzOjSRIX3fO0QelP3gx51kBMw3J1NmDLnWSYcf9qxeuBMZxbyPK9x79OZP/5?=
 =?us-ascii?Q?zyX3HppXPmqyvYvCxWY/Ow+4LzXOXT4EqInBbe3zgbbC6Bnz29l3AQ6CFe2g?=
 =?us-ascii?Q?9soV/7+g667Qloc0y9d6yUy6abw/f+3+tVC5JmFqzCGhXWt0NjrCqnJMLPc7?=
 =?us-ascii?Q?UqjruuC4Le8SLoaOGPWm1nhwEl9zBTY98NKT6EDOlwOBzxf+2aYR0vxfrGYO?=
 =?us-ascii?Q?bJLtv42qMX3+dijaZ9Pv0Go8ep/QaMGxIUrBfIy+4q1I9CNOoy1CncYL5BPi?=
 =?us-ascii?Q?zRgB0KXDgjUhZibQ1vlePecqaopwwUMEZeB3XLp/43V85gZ/jaoTEID89uM7?=
 =?us-ascii?Q?u9bOOltBoiAgmRj8Kp525Lwt8Vpl5AKtnggv4C/+BBzgRCXYnplwrcuHsZiX?=
 =?us-ascii?Q?AZlPM3egWdD67bBeeIbQpqnoUaagFJ6hW8A9ttHkPCL6GqFINQRuGuQN6JbJ?=
 =?us-ascii?Q?ntJqzAqkl+7M+Mn/TenSQX00b68oqhr8AFoRMqg5E+4VHKvKp1dSSVxQV2BY?=
 =?us-ascii?Q?nkSvF0QboNJwxo2516lyL5xnnUBEu+BP5WD52JyBdEQi5PCd464Zztkc+ZzJ?=
 =?us-ascii?Q?ZiIw82WM2B3ZPCRGWCwfNePjl8AYBjyqe2j4OlcKysoyRgo2kwbEUafp/eEV?=
 =?us-ascii?Q?7Dw/npSxcNJppikiWkznOKRV?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: midmark.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6528.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c57d3d7e-1b82-47d0-ffba-08d95ccdcc6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 13:42:01.5940 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3c2a020d-f343-4ca1-b6ef-91768380352f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q1k9b/uxwq49PKaBPXeoHW/d7KroaOf6OaPT4tcHpmyeEPag0OtThW/hccoL5PnQffdwL+C1s4Y47KaYsqp+kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR08MB7041
Subject: [Buildroot] Patching U-Boot
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3575496102045795653=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============3575496102045795653==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR08MB65289DD5E9B820FAC5765B90AEF89SJ0PR08MB6528namp_"

--_000_SJ0PR08MB65289DD5E9B820FAC5765B90AEF89SJ0PR08MB6528namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I'm trying to add some project specific patches for u-boot. I've created th=
e <global-patch-dir>/uboot directory with my patch inside that. I've export=
ed BR2_GLOBAL_PATCH_DIR and set it to this path of <global-patch-dir>. When=
 I run make on buildroot it downloads u-boot and then configures and starts=
 building, skipping any patching. What am I missing in order to get my patc=
hes applied to u-boot?

Thanks,
Michael


CONFIDENTIALITY NOTICE: This message, including any attachments, contains c=
onfidential information intended for a specific individual and purpose. If =
you are not the intended recipient, you should delete this message and any =
disclosure, copying, or distribution of this message, or the taking of any =
action based on it, by you is strictly prohibited.

--_000_SJ0PR08MB65289DD5E9B820FAC5765B90AEF89SJ0PR08MB6528namp_
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
@font-face
	{font-family:"Century Gothic";
	panose-1:2 11 5 2 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Century Gothic",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Century Gothic&quot=
;,sans-serif">Hello,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Century Gothic&quot=
;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Century Gothic&quot=
;,sans-serif">I&#8217;m trying to add some project specific patches for u-b=
oot. I&#8217;ve created the &lt;global-patch-dir&gt;/uboot directory with m=
y patch inside that. I&#8217;ve exported BR2_GLOBAL_PATCH_DIR and set
 it to this path of &lt;global-patch-dir&gt;. When I run make on buildroot =
it downloads u-boot and then configures and starts building, skipping any p=
atching. What am I missing in order to get my patches applied to u-boot?<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Century Gothic&quot=
;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Century Gothic&quot=
;,sans-serif">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Century Gothic&quot=
;,sans-serif">Michael<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<p style=3D"color:grey; font-size:11px; font-family:Century Gothic">CONFIDE=
NTIALITY NOTICE: This message, including any attachments, contains confiden=
tial information intended for a specific individual and purpose. If you are=
 not the intended recipient, you should
 delete this message and any disclosure, copying, or distribution of this m=
essage, or the taking of any action based on it, by you is strictly prohibi=
ted.</p>
</body>
</html>

--_000_SJ0PR08MB65289DD5E9B820FAC5765B90AEF89SJ0PR08MB6528namp_--

--===============3575496102045795653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============3575496102045795653==--
