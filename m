Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C047C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 09:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 354CD40302;
	Tue, 20 Aug 2024 09:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-eiM_wX53iw; Tue, 20 Aug 2024 09:51:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAC1740574
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAC1740574;
	Tue, 20 Aug 2024 09:51:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 661071BF32C
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 09:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5141B81140
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 09:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I11I1sgv90OT for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 09:51:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2612::72e;
 helo=eur05-am6-obe.outbound.protection.outlook.com;
 envelope-from=aleyssens@idtech.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 84D3781147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84D3781147
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2612::72e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84D3781147
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 09:51:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTgkIDM7KOduH+COaUeRaPVrhXZKCLbS8c/hJRaxjKikHmI7jTvgyB+uGK5qQFqQn49tJHy5KfUGqtdcUq6/QGdMKet45NQL/EvIOL0amURj1uOQp83pwT8APkObp0kdW7kZIcDJqgtSO4Jjhd6JDNJSa9Qs1m5ZK+3UYBXrePo6HjM9uVHr8gvHWS330FnIjr290sR5T3tcqecsJRrrJ0bj4yfloJMFZgkU0ty+8cm/0EiM+bEYit8tM0VRMMmx1YFQgHl7tIySIx9674PLdNA8fi1i/DlkqG2825LXwXwyDwdOrP4EvfCWKvWzHr5OGXcADxh7Og7/E7Xoo9kzBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIf78KqyxmmoCYsuSXGjXBbXjIlDGOudqDlsDUAPdcg=;
 b=N546uVo/5eBLrXqtgf2bo9zwhkJyIK4rdwUauL9ei+iJvae5MkE4p325n0ULP5r6LIcfcUCHOcxCgs8S4BGmiTxzSCUkJppcUuMbBTvUkcbCrFrZWE0QrNQkggtqrPAkaGZBAz9Df5L98qvvVVWEwoNk53VoQI1K861+zxiRppCP1I2X/5FIO7/B5Fd1CyYbIQl4EzOfqUBOTec6eYJ9zhYKMpTPkVQeDGsMu5hdmdLV2jOh45Aw4+lFVV10mWaKaQ19UF/n7LV3utK4R2quLVZbyQwfGED5/CZi8Ieu+p0006SziQobSa25koBoTKXIbkcYyUdPpBO9GX7AX2Y2BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=idtech.be; dmarc=pass action=none header.from=idtech.be;
 dkim=pass header.d=idtech.be; arc=none
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com (2603:10a6:800:1dd::19)
 by VI0PR06MB9510.eurprd06.prod.outlook.com (2603:10a6:800:23b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 09:51:07 +0000
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4]) by VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4%7]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 09:51:07 +0000
From: Ayrton Leyssens <aleyssens@idtech.be>
To: Ayrton Leyssens <aleyssens@idtech.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: Python3.11.7 broken?
Thread-Index: Adry4dafB4E70tFJRDaslGbgWxjySwABHbGQ
Date: Tue, 20 Aug 2024 09:51:07 +0000
Message-ID: <VI1PR06MB892673D9FA03B9989133825EAD8D2@VI1PR06MB8926.eurprd06.prod.outlook.com>
References: <VI1PR06MB8926DB768E9ED254FEA86A18AD8D2@VI1PR06MB8926.eurprd06.prod.outlook.com>
In-Reply-To: <VI1PR06MB8926DB768E9ED254FEA86A18AD8D2@VI1PR06MB8926.eurprd06.prod.outlook.com>
Accept-Language: nl-BE, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR06MB8926:EE_|VI0PR06MB9510:EE_
x-ms-office365-filtering-correlation-id: 138225e9-34fc-42ae-b738-08dcc0fd9d12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?HWRsTl2/M/u9Mh98Ic3caAMAwpb6Pybi0LRUmbQhfu4xFIDa8COW7TtxL3LH?=
 =?us-ascii?Q?ytj5Ez4nUjVrt8AKBTXEs5PwpE1wxX+TshoSlbJSBxVxwK5LeaJPWysNepea?=
 =?us-ascii?Q?QzVSuddelEygf/1Yi2Q2lply+Bi46zrdcM/M2/PXfFK0vz8Flrl293Zn+KBm?=
 =?us-ascii?Q?vjEjDHaxB22+X6GGssfID66dehLTZUMV6aRGL1pOFebzWgcbWwGVARPFBUf7?=
 =?us-ascii?Q?uk08GH/xrjn7QApkc308rJN7h241pac8qLzYSzI9K8NY5It2ZdjdidWTPKaZ?=
 =?us-ascii?Q?gSewBhzCdT3DWr2UOAc6FyWQZwrnEiEltptVYJvj+KY+UgATH7NXgYPskZuq?=
 =?us-ascii?Q?nL9QrRhDdv2DuwFX5shQeRumV9QL68xDbafFw3f+/0ydcyE/BwoT2jmxDU64?=
 =?us-ascii?Q?vm94E6WYMneZDvivNuxGvh+m5u6Th0N1rDDSXBPOk9DqYcpDEIS1kNxT8TmU?=
 =?us-ascii?Q?/cnmeWN5LZ71zZyvF11s7jaSyhgkB7GecrrzyGXJGGMvCoICUuH4LS3+iYeU?=
 =?us-ascii?Q?wxqeoAn8VF3La1yXDIQnpqXwRmgmjJRKmZR2KYeqN4HTcO9un9PqbfytVyet?=
 =?us-ascii?Q?3uegmZgVdgtxyM48QjDtpDaFt4tEa0ckOWg586gkwz+wcdD+BTunKVu9u5HC?=
 =?us-ascii?Q?HU9TRwN6FPqDrLLGToYMgbUIytsDoxt/bOnbl95OkCzFA8e8ps93bIEHAEdl?=
 =?us-ascii?Q?VLRzcUBHzd0bKE2aNubo0XURbcclAzS1VbJFQkbopftjgiBuHYii1iK5Odlt?=
 =?us-ascii?Q?eOB/BmVg0wbA5pqhdc/9ltDekJE/Mq7Xh4+4KkyutsrWHPf9JRqA5hwQA8Fq?=
 =?us-ascii?Q?X/fhHpicGg0uUDzWQwU11GwPNMKZFSThv2zpZmdh5hpOHaUJuS4EEziG5Op8?=
 =?us-ascii?Q?06r6gERHANIeaF+nsIGyTZdN6A2mNUxuGVbPi3w5pvVcqWSDihugZ+eOJQBD?=
 =?us-ascii?Q?WU23JIEVcv34koAcsjl/dtpvQtwkimJKABOThErDGpKStV3/XYAWiDmwkn9T?=
 =?us-ascii?Q?NUL84oMvlF2JDsP4hmo6ZY6hbcs393hWYOWUURHdUD/eMxhdpdbBruLNYqMh?=
 =?us-ascii?Q?nmHhAV3vdW8pt7kc40V33AW8gR9ZKRd50Tpi4lvHPfmy3DMRYe5aud0tlu/L?=
 =?us-ascii?Q?py8o40WQQKEMDXLIlTZN/+VPZLHq25bju4boxhxLYVSMrj31LuBD9MGMrERc?=
 =?us-ascii?Q?NOGxu7pjJ77laxcWxRqzef7xECWSpfyQ4+0lc+xlNXSpwCllpdkTsHooDQE8?=
 =?us-ascii?Q?fLCAt2RfQD0wxz8EYUaw90bRkiXCn5QNy8Uxnih0zxTA1eFiiZtASGGh0sNI?=
 =?us-ascii?Q?6hU1rn7qGJEn+40Gw4y5e25hWeHSOYDQ4U+jAK4NVcxAiPhvSp684VldS55+?=
 =?us-ascii?Q?x4s0XXVJmoWASpCs3E7hmGFfVnraIBkJG6bOQop6tUGDo7QbNw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR06MB8926.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f0vRLkV8R80+g/ZDpxVaFl/uHjENPkh4GHlcUxMWI9ohoP5nkz+axa0mQFre?=
 =?us-ascii?Q?Gim8fmFQMkzk3LpfrLJY/9slMTDYwtVO5MQPlM3iKALUSzj1er0q5jIjTHmY?=
 =?us-ascii?Q?MF2GuLKSqFqc/l4IJ9z396fqscb1JlJgOQiS/ozw7N+j66aXFP3jr9O8k+mF?=
 =?us-ascii?Q?UeLBohjsnYwumzduCGR/PcTOuflbzySJ7hi8kzffz/deiIQ1UNfahpoZHEmV?=
 =?us-ascii?Q?Kt/Bh7xP1hLdrG64WlHEcG9P49EhBmse1mWBUDbamFPZgmzpKalf5ymri3+I?=
 =?us-ascii?Q?f1ga0pcMg4F7SBfIeDW6lVFpl0lzLFbEHdl+iyInc8uGXPrs5IBUO9OC/Qg6?=
 =?us-ascii?Q?o4S8e8r2TdVqiq7BjBwR1QXJ+zBsyx3ifJwn/BLkmM18T7/Bv7gOl33IDpeQ?=
 =?us-ascii?Q?7KuPKBYsj1wwMdTypGidhGKB1Z892QdjovnL/VwOrsJGwxrIBEjUcco2tfzs?=
 =?us-ascii?Q?A/rRHdUFK6fPtyniuwA3ZlmJVtZxry/dviyRE1FNWPF7rTqE1OJHn49ADl9o?=
 =?us-ascii?Q?K9krWoFM6qvWI+lG96RQ8L+kgsD9IO4fdQ5Ucz/BBC0gedkj1gm1jhQ/xJFD?=
 =?us-ascii?Q?6At4aqdXb+GAOj3WnpEWi3z3TXCqMQ/5kK5CSIG4YG7kziyKJkdyFVskMa5j?=
 =?us-ascii?Q?uC5q0KFYkdEj63PLLnkrJtkDwLfYxT43ncoddpjSlogUbCvEDEXz2wUtz37W?=
 =?us-ascii?Q?CnwgNza7BA1M2lsT50BkE7PUPk1G2IaU8hEekogAQ8IZv+Kk7ppHmUBawnfg?=
 =?us-ascii?Q?cdMj75NzjhqJByh6kEEBKHvdEGfA/XlcGEnoqGGzsdV7jZgyUp53RfDTLPF7?=
 =?us-ascii?Q?YUP4vLs4Vh6ikaPaACL0lTVJkdKYnXwtN/pOB+KJpzHkQcjZs+maHAqGY0mV?=
 =?us-ascii?Q?zbTHeXy/gaamKTRvYEboUdfKFrC9UD5YR/0vZ2mULRDOK9NIC83Na/M8eQUO?=
 =?us-ascii?Q?enmzfjhtFe6cceazKoeY07IpjSa7Bha0b/FmTYJzv2LIvr59Oe5rlMhjgbkq?=
 =?us-ascii?Q?2ellJjt8tijIurrdw+oHBfLY8J8NRqgzmZOcE7R0aIjHnLzB982NlaKbMetO?=
 =?us-ascii?Q?Tek+uWvB8NF1ua3CtCPHXYWtkZ6xrwVpSNx6D5P5sjXVVF5fM5raKionTYwn?=
 =?us-ascii?Q?tFUCJiMFUSViJzr/Eec7V7BekrbtYKFKfbBTuZxersZp/CYv+jxt+JGEmEzM?=
 =?us-ascii?Q?25oCR0H8AavULCXGzrdcn+de8+DxKIINw1SNZZIEpaoQQ2V/1ynNhkhDMlzT?=
 =?us-ascii?Q?FJCmPcSV1NJsq+Y5jiYuIcTbRfEQ5ydVI2F0KyU8v737Neq9/usNVQ1+Y9hB?=
 =?us-ascii?Q?ZVtB3CXkTmchL7wuquIg7nCEFrEPD9stPTd5s8YltQecImu5fl9zU/Y9Wbbt?=
 =?us-ascii?Q?1vnvRxltTXV+ZmMXRZV48APdsFKHJvmyWCox0OPBRgGi5IFsCOdUeTksy+YV?=
 =?us-ascii?Q?Yq+yemnia6G+qxGhldXD98n7JTjoXZF915wcprg+ujcxmehRTs0naHjibeX9?=
 =?us-ascii?Q?4zyLryf1zHLd07GV8k/sL30JGUv0elf8nEOKkXk0Xf8MqT3SSXPardBFBkM8?=
 =?us-ascii?Q?00LZn7vtshRKrj6ON30=3D?=
MIME-Version: 1.0
X-OriginatorOrg: idtech.be
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR06MB8926.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 138225e9-34fc-42ae-b738-08dcc0fd9d12
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2024 09:51:07.3834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 982732bf-7da9-409c-87ae-889ccf886826
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Z1Ev6Yb8VT/02NtCS883zV/NcV8JsFAvV34Js3/0wwAmh0zubZVM+lenbucWPTLNaPqgCY/9K1ekOgfqcsesg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9510
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idtechoffice.onmicrosoft.com; s=selector1-idtechoffice-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIf78KqyxmmoCYsuSXGjXBbXjIlDGOudqDlsDUAPdcg=;
 b=sPFcP2zY6Qjl4Rzm0FuAK2bxrC0oZPfXaArWqgST0l727KF5+s+cSXw4QlkgoBeisG5iJSBkjjaU/NgXHEdXcV9DmKQdUmjoEcqZVB3woo5OGLlfS4EX/nrV7uCRlYB7ze9yCX0qTyYIt4Kd+GA34dzFnp2E55phZTP585iZl/c=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=idtech.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=idtechoffice.onmicrosoft.com
 header.i=@idtechoffice.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-idtechoffice-onmicrosoft-com header.b=sPFcP2zY
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=idtech.be;
Subject: Re: [Buildroot] Python3.11.7 broken?
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
Content-Type: multipart/mixed; boundary="===============3290088326065542298=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3290088326065542298==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR06MB892673D9FA03B9989133825EAD8D2VI1PR06MB8926eurp_"

--_000_VI1PR06MB892673D9FA03B9989133825EAD8D2VI1PR06MB8926eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All

Being my own response and answer is great...
Noticed I had the HOST-PYTHON package enabled as well.
Removing this solved the issue.

Just posting this for future reference

Kind regards
Ayrton

From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Ayrton Leyss=
ens
Sent: Tuesday, August 20, 2024 11:23 AM
To: buildroot@buildroot.org
Subject: [Buildroot] Python3.11.7 broken?

Hi

I am trying to cross-compile Python3.11.8 for my project using Buildroot 20=
24.5.
Unfortunately, it throws some errors, well it gives me one.

host/include/python3.11/pyport.h:596:2: error: #error "LONG_BIT definition =
appears wrong for platform (bad gcc/glibc config?)."
  596 | #error "LONG_BIT definition appears wrong for platform (bad gcc/gli=
bc config?)."

I am building a board based on the AM335X processor and need python3 for so=
me user 'scripts'.
This is build on a virtual machine running Ubuntu 24.04 LTS.

Any help on this?

--_000_VI1PR06MB892673D9FA03B9989133825EAD8D2VI1PR06MB8926eurp_
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
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"FR-BE" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:#2000">Hi All<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:#2000"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:#2000">Being my own response and =
answer is great&#8230;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:#2000">Noticed I had the HOST-PYT=
HON package enabled as well.<br>
Removing this solved the issue.<br>
<br>
Just posting this for future reference<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:#2000"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:#2000">Kind regards<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:#2000">Ayrton<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;mso-fareast-language:#2000"><o:p>&nbsp;</o:p></span></=
p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif;mso-ligatures:none;mso-fareast-lan=
guage:FR-BE">From:</span></b><span lang=3D"EN-US" style=3D"font-size:11.0pt=
;font-family:&quot;Calibri&quot;,sans-serif;mso-ligatures:none;mso-fareast-=
language:FR-BE">
 buildroot &lt;buildroot-bounces@buildroot.org&gt; <b>On Behalf Of </b>Ayrt=
on Leyssens<br>
<b>Sent:</b> Tuesday, August 20, 2024 11:23 AM<br>
<b>To:</b> buildroot@buildroot.org<br>
<b>Subject:</b> [Buildroot] Python3.11.7 broken?<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">Hi<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I am trying to cross-compile Py=
thon3.11.8 for my project using Buildroot 2024.5.<br>
Unfortunately, it throws some errors, well it gives me one.<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">host/include/python3.11/pyport.=
h:596:2: error: #error &quot;LONG_BIT definition appears wrong for platform=
 (bad gcc/glibc config?).&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp; 596 | #error &quot;LONG_=
BIT definition appears wrong for platform (bad gcc/glibc config?).&quot;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I am building a board based on =
the AM335X processor and need python3 for some user &#8216;scripts&#8217;.
<br>
This is build on a virtual machine running Ubuntu 24.04 LTS.<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Any help on this?<o:p></o:p></s=
pan></p>
</div>
</body>
</html>

--_000_VI1PR06MB892673D9FA03B9989133825EAD8D2VI1PR06MB8926eurp_--

--===============3290088326065542298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3290088326065542298==--
