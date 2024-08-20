Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0BCC5320E
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 09:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6C4D403F9;
	Tue, 20 Aug 2024 09:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2v6T203m_co3; Tue, 20 Aug 2024 09:23:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 917CA40570
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 917CA40570;
	Tue, 20 Aug 2024 09:23:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 619A11BF32C
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 09:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F9588112E
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 09:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kgWAHHrRRq4Y for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 09:23:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:260c::718;
 helo=eur03-vi1-obe.outbound.protection.outlook.com;
 envelope-from=aleyssens@idtech.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D7328112D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D7328112D
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20718.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:260c::718])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D7328112D
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 09:23:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o9AaW1+AyA0UkyieDnworcItFG/DuDlf7mbSgorzulfU+hFhGFYhakNARGpXoRuPC+OXYhmoJQo1qvq64VQ0Vk5II057dNlGtRRF8LrNby5f34BuKMzxw9bSTEAgOfdLrz65uoOLfwD6eZPZh3b3EZE7NJvirfRXf7L2/WdFO+lEzLaNST/58GTgBmFFKuYWXgbh9pYxDD3vM3GEVnKTsrJFS8b4e2+OBBvmo5u7MQv/+9pB3UKwzriF+v3r+XNKC4T3bEps6QM0qfuDId8Do5Z5LWhUqxPCTS09qQi0qLsfFk07waMQXEdD1+3Nqv8FJ/IEDF/V+PypZwfaEYvrKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DU6S/pTjQreFJaWXwh+1YROTj9NOmfBs7wD1n9cDDd8=;
 b=vF6TG94P0tqYVJ+N7Tgd0jB+CXnR4Wh9bnhSIXXvkfPuZRx9kZ6q3M7fwUX92xbDza8bnttgF0aavUcdGKB8jcUmICwxdVyqvGjeBTbhG24paaxOy7i+iyxYTacDpYh+3H/yMc2lAOEDwm9OQq5m99BENwTu9eaWZXBuAPxByGnmpV3J48V/UbdeKRFegquezN85+rrm6lDwuQxSxz4nwR65utp5mRQ0Rc9ROEH0lLOf8gzKuKRhhAvn1nGKLalgUtE5kn8LRuezhCTTSq5P1r+pfz/QFbMNDh5lN6+boqzV/Kw9KTBlOuVRHq5TZWF10SBgLgJ4QYcBOyNYWxivtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=idtech.be; dmarc=pass action=none header.from=idtech.be;
 dkim=pass header.d=idtech.be; arc=none
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com (2603:10a6:800:1dd::19)
 by DU2PR06MB8336.eurprd06.prod.outlook.com (2603:10a6:10:2e7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 09:23:27 +0000
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4]) by VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4%7]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 09:23:26 +0000
From: Ayrton Leyssens <aleyssens@idtech.be>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Python3.11.7 broken?
Thread-Index: Adry4dafB4E70tFJRDaslGbgWxjySw==
Date: Tue, 20 Aug 2024 09:23:26 +0000
Message-ID: <VI1PR06MB8926DB768E9ED254FEA86A18AD8D2@VI1PR06MB8926.eurprd06.prod.outlook.com>
Accept-Language: nl-BE, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR06MB8926:EE_|DU2PR06MB8336:EE_
x-ms-office365-filtering-correlation-id: 976c8c97-e985-4607-e332-08dcc0f9bf20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?0czswpx1UmG9THBRAA4BjffXbdnGDBGwO4aphMTZChcXwlzs0MRwkYk/BhpH?=
 =?us-ascii?Q?kf7AaYfH8TUJpSTj1mDmA1yVohV9d/SgYlUWwncyhoqtnGdfoVfa4SuY7BaP?=
 =?us-ascii?Q?tkhdeVExyywpLMdKw1bNXJ8e3GEUatHAIqGw/gnGogtIg0b+5hhVuYJvglny?=
 =?us-ascii?Q?HT0+RQ4XjbHhDFNVDv9QrnXUo6XfjZl+iOyx83TSUSk6aVBkMRM61YPMdN9i?=
 =?us-ascii?Q?1GuvY8SPG2d6N9TUNNvuWVUH/LLUP6HdC3G5ZFWbIA5Je3YUq7IkKjXRPulj?=
 =?us-ascii?Q?m836nO9n65cOqMgPPFVwVSQkMlKaahdcuaIwKOdJ9d1nXuYP6w8Tw7kDi3yX?=
 =?us-ascii?Q?sboz/AZ4TfCF34LTACWdnEMvtz8k5s8X0IJ1gNRgAYGSmG4EKO2uhdrvCWQT?=
 =?us-ascii?Q?HaBTzTwUhR/IigbEy4jjLUXON0iPMT7FWGt62EnLbmN0DvM47NQ+b3/kYCbq?=
 =?us-ascii?Q?Y/u6Ngei+aMUvO2A1XBuZRvt/xQZXOiQkcdemWs6hcPZzB0ObUZmSjEOiiCe?=
 =?us-ascii?Q?IoSm52v5xWZmqpUPDhiP5HqcAMYBiTsHfEn7B/UYywLEERre57B7lVtAHY/j?=
 =?us-ascii?Q?jU35iPDgpiWJNv+c9HsCUKnyJUhnktF5mS5vEivc54jiJEfN+OlMX5lpSAze?=
 =?us-ascii?Q?vKxgJ2MizHocZxOAzHeFzY53KzvMd6qD6ckDAbrHFkwgUlj+4r+nCez5KLJe?=
 =?us-ascii?Q?oF+I8ZR4nAvbHl/4z869YdDOEsYiw+k0NlhWh8d0WPc/QdVXtZ+bOCBzyCnI?=
 =?us-ascii?Q?q4rm0riUXFLeKg0qTTxMPdYkaELMd8UNSNVrG6hUyOGzK4Q7N61ezENuMgq0?=
 =?us-ascii?Q?6H+mpNe/T2y1C90yV1MIuBfWTxlOwYJ8dCO0Wp8LayCkCBCK1QON0zylHSfF?=
 =?us-ascii?Q?O4LauG2/4lCUpj9oZcVybh7Glv4/UZyDqhcIw4ORjWWglbZeY4bAoceQrtto?=
 =?us-ascii?Q?VcPpmxLgE3jHJexCdUPtvOHPnPgCikubQjA6OncZyB9Y1kDRBg4zpn9eMWek?=
 =?us-ascii?Q?N41E5VIDRmaDs03Sh2Okf/cxka2RWLZ+OPQXQTXPW51bvnuJxxPrhKGlGsCq?=
 =?us-ascii?Q?joYI7//BeD8sn2CeozR8fNhG7cUHHbkKBN3EvqHrsf1OJc56Y3c33keKOWH4?=
 =?us-ascii?Q?JDYsrNMWq5coq5yaWk1UeMajImm0PQkq16F2IHtLcz0hZViRPkW7Kk9ytSsX?=
 =?us-ascii?Q?Ka88dkQzV+e7i+PnLDTIu4NsyADk8JNYloc5xrGqYS0mITJgq/m63CVTetho?=
 =?us-ascii?Q?kRGBJwfjfqBOJr0Qdlgkv+hixB81VNk+TVS4o2H34CywH1T58qGqCTZs0Va0?=
 =?us-ascii?Q?1X+m58fy/2iumqoqwhPOR7BY6utqck+8LKpzY2lBLdAb70nAbyOwnwDHdhgm?=
 =?us-ascii?Q?iScDlAoJ2Vqh+VTv56TdPWzGKswf1d/oOuqTuJKNoHHbngpvgA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR06MB8926.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eCd/YK152S3NnuHqPEInPKk5TfVXRzZQxo7LbfVWOGqxKrGbUE0TlnK7WQc/?=
 =?us-ascii?Q?qdPuImWgNrR/XTRwzQd+XbjKMTlQu4OUeao9jB6PDO6FKcqjspz6jVIZxWcK?=
 =?us-ascii?Q?azr8iKNzz7BOtf4eI+Z69CqFVbIjsszeMkcPMAk2v139bq66m7rZBaLWqbtn?=
 =?us-ascii?Q?OgOT+Qt2xUKicvas1eO1aQIQuF9u1jEvSj1v4XXj1nlwwDh5/j/ivIyNZB8o?=
 =?us-ascii?Q?jAcE9KbnTDLJMmEedbiFa8elFFOPsI2i7W7XGo2q7J6yFLg3xiwJDaIgTqAf?=
 =?us-ascii?Q?HB8gulnQSbOltnNtaYYHjRrj4ZP2l++4cRS2ubErQrqBG8ZhdgnVm/3sTeLg?=
 =?us-ascii?Q?EBbf9BHyULA3J4VXOpLSqNUTjBVqWe7r3k5ZUf6cDoa2HDpLCvQPlYlThrOp?=
 =?us-ascii?Q?DuxLv6aJUo1CeOBJrOM6CVtVMSh0sSUfJ+/J0lenRdGP7Jnfpbit6nQiB4so?=
 =?us-ascii?Q?zxr77E40UieMDuyiNDSuGv80gn1pzqKrmak3l70jU2S6mgUgSdxTaKzKBthI?=
 =?us-ascii?Q?Nqsz11tAyAWMNz2xovBaSxChGaY/sZM0xKKTIkTyzOs5CqCe6OiBfX9B/pSw?=
 =?us-ascii?Q?rLeWS/FP/Q+DSY8TQYpz4LjQB1pTbERpvOatL0aWGB35AeSkoxToIDi/C04x?=
 =?us-ascii?Q?/oiW42kuyjJY+B/PIQfo5VzuBNEicrbVVb1UetWW3UMl4uAajWPNVRB2BlpA?=
 =?us-ascii?Q?BgVfFMX1778xS2Smy4EWcOhH3OKWEaKzZXG+28CjrMV8sVRnOgb83kN4Zaaj?=
 =?us-ascii?Q?I9U0HIhwI1qAH7C/Bo6F6FjWAqInbqXqTIXBSmaSOcEB3CszKvXo1p+NRx6a?=
 =?us-ascii?Q?02GO6UytvDJMQnKY4J2pzr3wi9CZlQouYn+yXOmiJg0CyQk5/9OQIzfBA0wX?=
 =?us-ascii?Q?w2EXNcZ2UyRtMWEoIvctWUIJkGsyJIY4VjS5GgEntEHuryivRk7K+Lv5IWig?=
 =?us-ascii?Q?cyfPv3JtKZI8oMfQ+Bfx9u5nThDRdE5YcvkbP0Rn14WAqhK+tjIhuubyStzi?=
 =?us-ascii?Q?ksRb7cTdyaeUQjYfwQYs67zWUf/mE+HVSWz/u0ffQx+4rHMlrXCy+wKMh69k?=
 =?us-ascii?Q?JAGifIyPcipRk63zQlFnBLYAVG6nZWGLOM6B4F2WEywNujNCfsAY4jMfjuaJ?=
 =?us-ascii?Q?LGG+JI6zPW5lpZJxM1k6DVf1r3ooi70iLqyZPYvwRJm8H79RTNpph//gKuZC?=
 =?us-ascii?Q?W+U1RVI/VI570cz5aOy3riX2WxBjatsj4Nscl97Ufra3cpRNPEQLfgyoyLim?=
 =?us-ascii?Q?MrfG5JlEduetCcuIl4f6iwgSfgVJiAAgJ0w3t/wRVM1gpc7RwZGP908hU4mF?=
 =?us-ascii?Q?TUQ7hMXFR2UwIty0YjCzbaXnpQvaZc8IhNkwSzF+Dt1uLPo+BJ/YCtpSwd/P?=
 =?us-ascii?Q?9i4pCKXWGCe/SDqWjYx8VFr6sq7MeftcRuRi1Fmxf1epuwUHoLmZP3f8eHo+?=
 =?us-ascii?Q?pIjdqdxeEoOvkYBVdwkxnNbE2qLdO7chzbu2RzUtf105qPmgbHBm6dMJ+RYs?=
 =?us-ascii?Q?HZcBgJqJ7YUgcsNyNor6R7OgAmytJ6kKp1Gvkclm14kUMQh+Xl+Qh0N7MiZW?=
 =?us-ascii?Q?f/msDIk3EqcZ9e7lb0I=3D?=
MIME-Version: 1.0
X-OriginatorOrg: idtech.be
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR06MB8926.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 976c8c97-e985-4607-e332-08dcc0f9bf20
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2024 09:23:26.5157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 982732bf-7da9-409c-87ae-889ccf886826
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XDjvJWd59FqlG2uHkORYUTrZDzzi7OsmlGKZqi6PynwY0+XX7InWi4Y17jpeURcLAuyLiu88IG7vGR2yPwhzUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR06MB8336
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idtechoffice.onmicrosoft.com; s=selector1-idtechoffice-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DU6S/pTjQreFJaWXwh+1YROTj9NOmfBs7wD1n9cDDd8=;
 b=vjDPz7goPHYeDoUg3Hz71RaCUl08zxRjKvfq8wiYxaj9isXhdcuuEzheC9YgwpImoh7FHuxrbwtE4cpuNE+eRNUjMpxgu7ZDGt95IRN7OfyAgEVYVJK5Vq6AQsIFj5n81x05wWCNm39nhdOj2b6stjtJNZtCyJVPKcyt7ZFjXq8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=idtech.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=idtechoffice.onmicrosoft.com
 header.i=@idtechoffice.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-idtechoffice-onmicrosoft-com header.b=vjDPz7go
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=idtech.be;
Subject: [Buildroot] Python3.11.7 broken?
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
Content-Type: multipart/mixed; boundary="===============5677666863443120118=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5677666863443120118==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR06MB8926DB768E9ED254FEA86A18AD8D2VI1PR06MB8926eurp_"

--_000_VI1PR06MB8926DB768E9ED254FEA86A18AD8D2VI1PR06MB8926eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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

--_000_VI1PR06MB8926DB768E9ED254FEA86A18AD8D2VI1PR06MB8926eurp_
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
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-fareast-language:EN-US;}
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

--_000_VI1PR06MB8926DB768E9ED254FEA86A18AD8D2VI1PR06MB8926eurp_--

--===============5677666863443120118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5677666863443120118==--
