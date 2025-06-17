Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57369C71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 15:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E089C81359;
	Tue, 17 Jun 2025 15:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99A1hbTtYWiL; Tue, 17 Jun 2025 15:28:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CA0A81332
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CA0A81332;
	Tue, 17 Jun 2025 15:28:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D87D216B
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 15:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5B2F405B5
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 15:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DB9JuDhZbNr for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 15:28:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c409::2;
 helo=ma0pr01cu012.outbound.protection.outlook.com;
 envelope-from=sunilkumar.dora@blackfigtech.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 26DAE4058B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26DAE4058B
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c409::2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26DAE4058B
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 15:28:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLis/f4n0oquOorhBIHrGOZ4UBzRSnXv1fyjRgz+bQKdi4qgHnDJv8RkukNvnG7csBNAUwj0MgiYY9aLAvHMAAe9RCGL2eA5MJu+Q8DX/PZgmhtMSRf6fgrrchMnn7VC2uPmceusKEXROy9iRAhTp32xCtic1y10ko1gF0lZY2yLnJXOX2DrhITHFgN17L9V1dyNnjYbqOd8IEDdDPIFYBIizHd2Jz6DAX/pG7JNzksjAJ48tUSshwoEw09cPZs6UIpWuYklxK39HrwmjSTQ8eLrGOwG5z9AlZYJ3DHcItniRLmbrDaqK6ax/4sCUBGl7HcDq/tkej50vJR+4YNQ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVGZTmb9QwM6XIxVFWRFgSOoPFN1Rw46wZUodEDYguo=;
 b=JKLXyhuCaIUd3JImb+pBiHigKue7aqn+QgSLN+F1CrQbJ3Mqn+eq73oknmDGQpZkAteHSQb9UCLlvsxtMXQjiDek9RphTDF1Uej5J4H2xV3RxRgFVSOC2PafVSduY25qXTC5oOM0qU1yoGUk5UtviFRa8eGhhGlbl3qA38L74qT8dbdb0pxggUR9TC49p+KI9KvUOuqP2CoMj5+KRMVmRDZPjVWIMbCbFBw2lCFoTedwP2xbWci+YlMj9wiJz2J5lZ9XkefEQmRTpAQI6Mf/8EpNh1ETOU6/t8Fr7UNnFP6kKXAOsh4A61v0CI67nqUZmiCEXuebrMf9L8SOPIKSqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blackfigtech.com; dmarc=pass action=none
 header.from=blackfigtech.com; dkim=pass header.d=blackfigtech.com; arc=none
Received: from PNZPR01MB8378.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:3c::6)
 by PN2PR01MB9843.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:12d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 15:28:25 +0000
Received: from PNZPR01MB8378.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bf93:20d6:d08f:2561]) by PNZPR01MB8378.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bf93:20d6:d08f:2561%2]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 15:28:25 +0000
From: Sunil Kumar Dora <sunilkumar.dora@blackfigtech.com>
To: Arnout Vandecappelle <arnout@rnout.be>, Baruch Siach <baruch@tkos.co.il>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] EXTERNAL-Re: [Question] -- Inquiry: GCC's
 -Wpoison-system-directories in Buildroot
Thread-Index: AQHb3vD/xfmeGGX1JUe69917pZfsRbQHeqNO
Date: Tue, 17 Jun 2025 15:28:25 +0000
Message-ID: <PNZPR01MB83783B558A937F9081456B2C9B73A@PNZPR01MB8378.INDPRD01.PROD.OUTLOOK.COM>
References: <MAZPR01MB837141FB4F42F5F5EA84F1F29B6BA@MAZPR01MB8371.INDPRD01.PROD.OUTLOOK.COM>
 <87bjqwx0j5.fsf@tarshish>
 <MAZPR01MB83717C749CFCEBC3CA78E91A9B6AA@MAZPR01MB8371.INDPRD01.PROD.OUTLOOK.COM>
 <63b331b6-b4fe-4fdb-9eef-0bb49ed688d9@rnout.be>
In-Reply-To: <63b331b6-b4fe-4fdb-9eef-0bb49ed688d9@rnout.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB8378:EE_|PN2PR01MB9843:EE_
x-ms-office365-filtering-correlation-id: 6b47fc92-0cf9-48fa-0aa6-08ddadb39a65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|38070700018|3613699012|7053199007|13003099007;
x-microsoft-antispam-message-info: =?Windows-1252?Q?dqjlZJuGrOKSdLJro9oXqlwoMu8ivezJyG2ZeLIo6KGL6RBlDlyxLerY?=
 =?Windows-1252?Q?hIF9ouehwqF6TsDhlnyPixj259m6ChNM2ZWNGlaW784HuEX5SNIYDAz2?=
 =?Windows-1252?Q?Jvb844Walv04oQzQonBpl/2Dv4LAUY/B1cTbms0BiBqlyRAvh4P+kSLZ?=
 =?Windows-1252?Q?vqwqRV7t+2FfIUKEr3w7cHhLS4IGovWI4V3RC81lVFiWJwq01LyfZVfn?=
 =?Windows-1252?Q?G1QgG3ehMlhdJjQF4G+KmQW7OVMUj23V8yoekYyGlSCs8KxrB72w22Vp?=
 =?Windows-1252?Q?bbkl8/MRQFeWA2FWWq0hB4RKgZL2jIDmDMS6wKU9L8hD7pV5FgzURkp2?=
 =?Windows-1252?Q?cHTmYXKsMYMifZkIAm26F2CtmPap8UvLCPQB8zBJSIzWpMmIo73HZI0V?=
 =?Windows-1252?Q?Y8yRCgN7CjmesSXbMznj+zTFQsF312ne5aFOvnxPLDxOO09bgIeXUIAi?=
 =?Windows-1252?Q?ZxCpQD5QRipUIm2xUXJ8EYVggof8RcvMR1LKulCfXpyKYYotIt3hDyE5?=
 =?Windows-1252?Q?KvSFxXXtu5MsfuCpCMCfC2GLB15Y4jDyF54nGTFcegaUism0Vxh3Wh3V?=
 =?Windows-1252?Q?hJ9yHwLk+lM36MugCJkutGZi7HomUFSOFTh7lbBu3EesbtAcGXG5O2gL?=
 =?Windows-1252?Q?gA31dFcTLpRJqNTCnhSf1abhL7jY3eIFTTn9K9msWowr5UqvZHrjh2dE?=
 =?Windows-1252?Q?6+Acx5VFpjgAnu6W08Jp3XT+/U5YUY6ZQwn4itDOyUYcexXwJsYUQQGK?=
 =?Windows-1252?Q?K0dHOiGy2JhA6ST28tWTT/cYeMLlfPqwS9sv/GcfscyBqQzWC3uZ5ime?=
 =?Windows-1252?Q?Uhnk/itA6NrwYcSs75cwCBgCdlBmuMC/yPaKwiLTJtYVifQA96v8Co/N?=
 =?Windows-1252?Q?2EdtyE3Mwvfjtc/eHDFlEgp0nLPgHSl6xCTkA92dCi0bS3S2E7dyUD0V?=
 =?Windows-1252?Q?0g5M5xJxpHJYQF02VF1PswfyULPLWdv9ihSO+BlfNqqkbu/U2chuZvyW?=
 =?Windows-1252?Q?AiXglfNGsnfYsIJdaB8hoeveCq3UTEW/mfC4CFCpobGFf7j8TwzpguWB?=
 =?Windows-1252?Q?W02XJxo2Hsk9x6ft4FwRz1fGwW5y2lp1i+LBVT0RhJEZ0tpT6QvFD1BN?=
 =?Windows-1252?Q?5KEubacESSf4YqvMChw6N6O1YQA5tIZCw9q8KDAyhTUrieESX7jtXsGm?=
 =?Windows-1252?Q?aTqBXvJ6EX+m5oH3kzs03UnPcM+YIJ55XLE2vAckEuEaUCn2rqOj4jVS?=
 =?Windows-1252?Q?ahWEGCKO3ohy4+6BJPnPgV5o2CmcO93pjo48Ag09zTOUpFatFjLpz/Rv?=
 =?Windows-1252?Q?etcJmhwu6mIBRfuL/PAyQOy7h6NklOWzbXoyJhm3rrLp7prSINgwK50c?=
 =?Windows-1252?Q?m3bKijkDCrQM8ymAllPos+mVv5/99OMsMSvDPKuZUc1NwUb2qzHJ4eqc?=
 =?Windows-1252?Q?vu2eBl3+IsRAitc9HB5QrLlYtSfR4mdvSJ/uBz/awYtjAwJ6MkCAOEez?=
 =?Windows-1252?Q?0c3TddtsTRPM/H6OcL6b4d+mMpVve1w8MHt8EkDvUqZLONMntFeN3W/h?=
 =?Windows-1252?Q?pzKsoE307FVn+5P7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PNZPR01MB8378.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(38070700018)(3613699012)(7053199007)(13003099007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?GAMUjNyhksMXIFIczOy/vt+Ghr728obrr1DA7ib0TlUWIsp82TUChdiK?=
 =?Windows-1252?Q?Ozyu9yQ4uiRRg31EEOkXICMRSND74htb+2Q+Sw1bvYTb/cruXF2hjUd1?=
 =?Windows-1252?Q?A1JCpf/Kd2RP6v3T40jYjpUJd0JTYVWxp5aQHFeH6AfGktRWBWz1Bcea?=
 =?Windows-1252?Q?SguDE9BpVm1COauppAfnsR5XNno3qS7YSn/oyVFhcxSOtJJbcqBXMiSd?=
 =?Windows-1252?Q?37H4dCG/F4qfw0EbeNWOH4PjLtFvyZn00NDt6fg52JWzU6aDAWiTpU4C?=
 =?Windows-1252?Q?elcY/1EPtJh8ZKryKLboGVEVmWiUc8Ew7hdyBGCSSDWt9B1mA7W31hDv?=
 =?Windows-1252?Q?4Vkns+aj+J45WiTd6hEQGlQCV1ENemY3o0aYMMOwbVB1muzWkN2x4yr+?=
 =?Windows-1252?Q?4q4Eef4mBSVvoXZIkJ0Z1jCgyJlQyDzILIleoOiceX2akbFeEhCnRFhx?=
 =?Windows-1252?Q?WCopFkTMc871MIvUXX0h46E1joNls6a+DlYsMxuSpviDGEIv/vfzpGgo?=
 =?Windows-1252?Q?EPDnsaWhmy38d8FIEZruzQqGVAbvotwl2VBvNUJlpHk4aMQzgB1DY3jL?=
 =?Windows-1252?Q?xjf9ABsFmJ/nnxIhVI/g2RufWytfJ2tQSDIgKyhMRJ7yVUiUObsqY51e?=
 =?Windows-1252?Q?vHUI2g5n97AyKsPH2UF+EA31y5WOK4SDL7/RE0dkilgqHtIYP/kHurJn?=
 =?Windows-1252?Q?nZM4i3sYlQ6TNOZQT0oq5KBbW+G2a6jf4DEyKcMYpBBDrhLZleZZMWPC?=
 =?Windows-1252?Q?dNR3iQQDBq11w4NkMG2RU9Y9QpRDpOAd+uAl90YDSFfeSeKJUvIxMKNC?=
 =?Windows-1252?Q?tpWwXza1BMwMBlemfGpo1Em58pHbsXcYT8qgjc+p2+1uigM2vDMuSe0z?=
 =?Windows-1252?Q?v9+J88OnbvOxL3g/lLuPzaJ1Tqx0gCUtVNKKqdSyPQJ+Y6gpvYawQ83v?=
 =?Windows-1252?Q?XxixQy8iYxtpxoHKjg7LuH+dBv1hJYavc8tTJyJ7nOn/FxZJ40w63Oaz?=
 =?Windows-1252?Q?nkOW2Um9zpqtt+WszPEfknn6LuX3bRXkE+u3M16DFr9wYVUy9FIB6I4M?=
 =?Windows-1252?Q?RUH/RTyhvoNR6Lnw4o1rSzIeYeNu5gHT+sOX9NYVUmrLMocnWqF7zR7n?=
 =?Windows-1252?Q?peGsqYmQx0xsnUEAPDwifXJFzQMv8jYM5Fs6fU5yOV7Kv7L3SINSQZq0?=
 =?Windows-1252?Q?iw++Z7kOZzp6E5yBfMLBf9767Ve7l1hpX/sXmNCVnU8xsXLVTcDpDgXW?=
 =?Windows-1252?Q?IABkZxbQuV9Y8PNXmd7JMBLlHh03AtFeG3z5Wm7XO3OzcfcMvDDOw4mC?=
 =?Windows-1252?Q?ajt65fwo5vVlnWbrd3c13TboPyD5n9EAXGWGn/45SnCZLLQYo7wuicmf?=
 =?Windows-1252?Q?zYvqiBrPYDqJFOKxPNCfx80eOQOWVcL10tMCvWSUzxNQaPT0RsW+h9DR?=
 =?Windows-1252?Q?piP6WdgmX9nfxbVDyqLB0bz5mFXdHTy716x1Q/qa/zH8GQBx+GToUkrT?=
 =?Windows-1252?Q?d//medtT95G3QadpUubj0mRxlJj9B0M06YFdXKsu4xl7PanVVM7IVbSQ?=
 =?Windows-1252?Q?XW7ernt7M82g1Fgr6MQKry0riaTZIa2xCxNDlC+SlpIy6fb2IOBsYVl8?=
 =?Windows-1252?Q?35A3jd5IFv5NnhriEpM3T4R0wuy/1yFBkg3jf+pRMo35SYCcCip6/lMv?=
 =?Windows-1252?Q?Cz1Mf9b7OI/Dvav5ucVkHXwynIBeRrWKsgdqT2AWOxmnSU6b+4yzEA?=
 =?Windows-1252?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: blackfigtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB8378.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b47fc92-0cf9-48fa-0aa6-08ddadb39a65
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 15:28:25.7484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75dd016f-4b86-42d9-9a4d-6df5b9790019
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VHW7UvSgzFm8NiAQMC/ObQPL1g2eebz6kInEgD1V84dIQpwDfQwLKli8/++3orN4yJvaTpr+mGp/QMwhCc5QxQ89WyBdQ+7nLqGBV/YvaAZxeyYdL9ek8TRp5uAUPEAl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9843
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blackfig.onmicrosoft.com; s=selector2-blackfig-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVGZTmb9QwM6XIxVFWRFgSOoPFN1Rw46wZUodEDYguo=;
 b=aEiBD9/p5uoz/PEphu7wbS1bGNikUG6SZABfjUjovcK1j4gwg1AEXj0uTzRos7t+86oaURi4zS79WqFOMwQOzBiQME79sClSCbEyAHkrzW04St8fUSHEXdBJVa0/mrxpLzx7x2F5Hi5q4bModeCxoWHet250oll39QDwJ1TlBvY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blackfigtech.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=blackfig.onmicrosoft.com
 header.i=@blackfig.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-blackfig-onmicrosoft-com header.b=aEiBD9/p
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=blackfigtech.com;
Subject: Re: [Buildroot] EXTERNAL-Re: [Question] -- Inquiry: GCC's
 -Wpoison-system-directories in Buildroot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4170829585569713853=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4170829585569713853==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PNZPR01MB83783B558A937F9081456B2C9B73APNZPR01MB8378INDP_"

--_000_PNZPR01MB83783B558A937F9081456B2C9B73APNZPR01MB8378INDP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Thank you so much for the information.

Kind Regards
Sunil Dora
________________________________
From: Arnout Vandecappelle <arnout@rnout.be>
Sent: Tuesday, June 17, 2025 12:30 AM
To: Sunil Kumar Dora <sunilkumar.dora@blackfigtech.com>; Baruch Siach <baru=
ch@tkos.co.il>
Cc: buildroot@buildroot.org <buildroot@buildroot.org>
Subject: Re: [Buildroot] EXTERNAL-Re: [Question] -- Inquiry: GCC's -Wpoison=
-system-directories in Buildroot

[You don't often get email from arnout@rnout.be. Learn why this is importan=
t at https://aka.ms/LearnAboutSenderIdentification ]

On 10/06/2025 04:57, Sunil Kumar Dora wrote:
> Thank you, Baruch for the update.
>
> The current poison-system-directories patch in Binutils effectively block=
s
> unsafe library paths (via -L flags), but cross-compilation safety also de=
pends
> on preventing accidental use of host headers (via -I flags). Since Buildr=
oot
> doesn=92t patch GCC to warn about -I paths to directories like /usr/inclu=
de, this
> leaves a potential gap:

  The `gcc` that Buildroot puts in $HOST_DIR/bin is not the actual gcc, but=
 a
wrapper (the source of which is in toolchain/toolchain-wrapper.c). We moved=
 the
functionality from a patch of GCC itself to the wrapper.

  Just try running output/host/bin/*-gcc -I/usr/include to see the effect.

  With this, Buildroot is able to have the poisoning functionality also wit=
h
external toolchains (which obviously can't be patched).

  ld, when called directly, doesn't use the wrapper, so there we still rely=
 on
the patch. This means that for external toolchains, no checking is done. Bu=
t ld
is very rarely called directly, I don't think we ever had any package that =
used
ld directly and added -L/usr/lib.

  A few years ago we did consider adding the wrapper for ld as well, but it=
's
not trivial (because the options accepted by ld are widely different than t=
hose
of gcc/g++/etc.) and nobody ever got around to doing it.

  Regards,
  Arnout

> *Risk*: Projects might still pick up host headers during compilation, lea=
ding to
> subtle breaks.
> *Comparison*: Yocto addresses this by patching both GCC (for -I) and Binu=
tils
> (for -L).
>
> Questions:
> Is this intentional (e.g., deemed unnecessary for typical Buildroot use c=
ases)?
> Would a GCC patch for -I paths align with Buildroot=92s goals?
> *Am I missing any existing mechanisms* (e.g., environment variables, wrap=
per
> scripts) that mitigate this?
>
> Thanks,
> Sunil Dora
> -------------------------------------------------------------------------=
-------
> *From:* buildroot <buildroot-bounces@buildroot.org> on behalf of Baruch S=
iach
> via buildroot <buildroot@buildroot.org>
> *Sent:* Monday, June 9, 2025 11:25 PM
> *To:* Sunil Kumar Dora <sunilkumar.dora@blackfigtech.com>
> *Cc:* buildroot@buildroot.org <buildroot@buildroot.org>
> *Subject:* EXTERNAL-Re: [Buildroot] [Question] -- Inquiry: GCC's -Wpoison=
-
> system-directories in Buildroot
> CAUTION: This email originated from outside of the organization. Do not c=
lick
> links or open attachments unless you recognize the sender and know the co=
ntent
> is safe.
>
>
> Hi Sunil Kumar,
>
> On Mon, Jun 09 2025, Sunil Kumar Dora wrote:
>> I noticed that GCC once had a `-Wpoison-system-directories` flag to
>> warn about unsafe system include paths, but it seems absent in modern
>> GCC. Does Buildroot apply any patches to handle this case (e.g.,
>> preventing accidental mixing of system and local headers)? If not, is
>> there a recommended alternative for embedded builds?
>
> This is a binutils patch that Buildroot applies to its toolchaind:
>
> https://ind01.safelinks.protection.outlook.com/?
> url=3Dhttps%3A%2F%2Fgitlab.com%2Fbuildroot.org%2Fbuildroot%2F-
> %2Fblob%2Fmaster%2Fpackage%2Fbinutils%2F2.44%2F0002-poison-system-
> directories.patch&data=3D05%7C02%7Csunilkumar.dora%40blackfigtech.com%7C4=
c6349104c1543a8fd7608dda77ed77b%7C75dd016f4b8642d99a4d6df5b9790019%7C0%7C0%=
7C638850885432217898%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOi=
IwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C=
&sdata=3DMOYMBxa7Qt7dkj3kf3Rkmfewgv5bBJsOMQnZI2omQxQ%3D&reserved=3D0 <https=
://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.com%2=
Fbuildroot.org%2Fbuildroot%2F-%2Fblob%2Fmaster%2Fpackage%2Fbinutils%2F2.44%=
2F0002-poison-system-directories.patch&data=3D05%7C02%7Csunilkumar.dora%40b=
lackfigtech.com%7Ccf5e00dc3e4a40fb403808ddad081e4f%7C75dd016f4b8642d99a4d6d=
f5b9790019%7C0%7C0%7C638856972603584545%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1=
hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ=
%3D%3D%7C0%7C%7C%7C&sdata=3DmFQsf5%2FG12rpq8TFGrEpxIYSOEeO9NHriZeuKR1gm8c%3=
D&reserved=3D0<https://gitlab.com/buildroot.org/buildroot/-/blob/master/pac=
kage/binutils/2.44/0002-poison-system-directories.patch>>
>
> baruch
>
> --
>                                                       ~. .~   Tk Open Sys=
tems
> =3D}------------------------------------------------ooO--U--Ooo----------=
--{=3D
>     - baruch@tkos.co.il - tel: +972.52.368.4656, https://
> ind01.safelinks.protection.outlook.com/?
> url=3Dhttp%3A%2F%2Fwww.tkos.co.il%2F&data=3D05%7C02%7Csunilkumar.dora%40b=
lackfigtech.com%7C4c6349104c1543a8fd7608dda77ed77b%7C75dd016f4b8642d99a4d6d=
f5b9790019%7C0%7C0%7C638850885432242858%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1=
hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ=
%3D%3D%7C0%7C%7C%7C&sdata=3DPjqW7n6fUT8hn%2FYw3EOAZy4%2F5T66O4HUzW9UQjrjgR4=
%3D&reserved=3D0 <https://ind01.safelinks.protection.outlook.com/?url=3Dhtt=
p%3A%2F%2Fwww.tkos.co.il%2F&data=3D05%7C02%7Csunilkumar.dora%40blackfigtech=
.com%7Ccf5e00dc3e4a40fb403808ddad081e4f%7C75dd016f4b8642d99a4d6df5b9790019%=
7C0%7C0%7C638856972603602565%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydW=
UsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%=
7C%7C%7C&sdata=3Dy%2FpldJi%2FNSKHwUIq2yC2Syqa4ruPrYBND%2BqheweASXE%3D&reser=
ved=3D0<http://www.tkos.co.il/>> -
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://ind01.safelinks.protection.outlook.com/?
> url=3Dhttps%3A%2F%2Flists.buildroot.org%2Fmailman%2Flistinfo%2Fbuildroot&=
data=3D05%7C02%7Csunilkumar.dora%40blackfigtech.com%7C4c6349104c1543a8fd760=
8dda77ed77b%7C75dd016f4b8642d99a4d6df5b9790019%7C0%7C0%7C638850885432255555=
%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOi=
JXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DVE%2BHwNQgR=
8%2Ft1hr1t055jmANb6gQ6IlrmPxArfg25BQ%3D&reserved=3D0 <https://ind01.safelin=
ks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.buildroot.org%2Fmailma=
n%2Flistinfo%2Fbuildroot&data=3D05%7C02%7Csunilkumar.dora%40blackfigtech.co=
m%7Ccf5e00dc3e4a40fb403808ddad081e4f%7C75dd016f4b8642d99a4d6df5b9790019%7C0=
%7C0%7C638856972603621814%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsI=
lYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%=
7C%7C&sdata=3DIJISPWd3ms1ttbT5wroz2WQnDeQF%2F0PMf7B5aIv96D8%3D&reserved=3D0=
<https://lists.buildroot.org/mailman/listinfo/buildroot>>
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.buildroot.org%2Fmailman%2Flistinfo%2Fbuildroot&data=3D05%7C02%7Csunilkumar=
.dora%40blackfigtech.com%7Ccf5e00dc3e4a40fb403808ddad081e4f%7C75dd016f4b864=
2d99a4d6df5b9790019%7C0%7C0%7C638856972603635990%7CUnknown%7CTWFpbGZsb3d8ey=
JFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsI=
ldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DHxtwXOYluub680YtS7vZusM4si68fGh%2BKQcn=
FK7qdgs%3D&reserved=3D0<https://lists.buildroot.org/mailman/listinfo/buildr=
oot>


--_000_PNZPR01MB83783B558A937F9081456B2C9B73APNZPR01MB8378INDP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thank you so much for the information.&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Kind Regards</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Sunil Dora<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif=
;"><br>
</span></div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Arnout Vandecappelle &lt;arnout@rnout.be&gt;<br>
<b>Sent:</b>&nbsp;Tuesday, June 17, 2025 12:30 AM<br>
<b>To:</b>&nbsp;Sunil Kumar Dora &lt;sunilkumar.dora@blackfigtech.com&gt;; =
Baruch Siach &lt;baruch@tkos.co.il&gt;<br>
<b>Cc:</b>&nbsp;buildroot@buildroot.org &lt;buildroot@buildroot.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [Buildroot] EXTERNAL-Re: [Question] -- Inquiry: GC=
C's -Wpoison-system-directories in Buildroot
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">[You don't often get email from arnout@rnou=
t.be. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification" id=3D"OWA1641058e=
-accd-007c-f88c-59e79fec2b7c" class=3D"OWAAutoLink" data-auth=3D"NotApplica=
ble">
https://aka.ms/LearnAboutSenderIdentification</a>&nbsp;]<br>
<br>
On 10/06/2025 04:57, Sunil Kumar Dora wrote:<br>
&gt; Thank you, Baruch for the update.<br>
&gt;<br>
&gt; The current poison-system-directories patch in Binutils effectively bl=
ocks<br>
&gt; unsafe library paths (via -L flags), but cross-compilation safety also=
 depends<br>
&gt; on preventing accidental use of host headers (via -I flags). Since Bui=
ldroot<br>
&gt; doesn=92t patch GCC to warn about -I paths to directories like /usr/in=
clude, this<br>
&gt; leaves a potential gap:<br>
<br>
&nbsp; The `gcc` that Buildroot puts in $HOST_DIR/bin is not the actual gcc=
, but a<br>
wrapper (the source of which is in toolchain/toolchain-wrapper.c). We moved=
 the<br>
functionality from a patch of GCC itself to the wrapper.<br>
<br>
&nbsp; Just try running output/host/bin/*-gcc -I/usr/include to see the eff=
ect.<br>
<br>
&nbsp; With this, Buildroot is able to have the poisoning functionality als=
o with<br>
external toolchains (which obviously can't be patched).<br>
<br>
&nbsp; ld, when called directly, doesn't use the wrapper, so there we still=
 rely on<br>
the patch. This means that for external toolchains, no checking is done. Bu=
t ld<br>
is very rarely called directly, I don't think we ever had any package that =
used<br>
ld directly and added -L/usr/lib.<br>
<br>
&nbsp; A few years ago we did consider adding the wrapper for ld as well, b=
ut it's<br>
not trivial (because the options accepted by ld are widely different than t=
hose<br>
of gcc/g++/etc.) and nobody ever got around to doing it.<br>
<br>
&nbsp; Regards,<br>
&nbsp; Arnout<br>
<br>
&gt; *Risk*: Projects might still pick up host headers during compilation, =
leading to<br>
&gt; subtle breaks.<br>
&gt; *Comparison*: Yocto addresses this by patching both GCC (for -I) and B=
inutils<br>
&gt; (for -L).<br>
&gt;<br>
&gt; Questions:<br>
&gt; Is this intentional (e.g., deemed unnecessary for typical Buildroot us=
e cases)?<br>
&gt; Would a GCC patch for -I paths align with Buildroot=92s goals?<br>
&gt; *Am I missing any existing mechanisms* (e.g., environment variables, w=
rapper<br>
&gt; scripts) that mitigate this?<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Sunil Dora<br>
&gt; ----------------------------------------------------------------------=
----------<br>
&gt; *From:* buildroot &lt;buildroot-bounces@buildroot.org&gt; on behalf of=
 Baruch Siach<br>
&gt; via buildroot &lt;buildroot@buildroot.org&gt;<br>
&gt; *Sent:* Monday, June 9, 2025 11:25 PM<br>
&gt; *To:* Sunil Kumar Dora &lt;sunilkumar.dora@blackfigtech.com&gt;<br>
&gt; *Cc:* buildroot@buildroot.org &lt;buildroot@buildroot.org&gt;<br>
&gt; *Subject:* EXTERNAL-Re: [Buildroot] [Question] -- Inquiry: GCC's -Wpoi=
son-<br>
&gt; system-directories in Buildroot<br>
&gt; CAUTION: This email originated from outside of the organization. Do no=
t click<br>
&gt; links or open attachments unless you recognize the sender and know the=
 content<br>
&gt; is safe.<br>
&gt;<br>
&gt;<br>
&gt; Hi Sunil Kumar,<br>
&gt;<br>
&gt; On Mon, Jun 09 2025, Sunil Kumar Dora wrote:<br>
&gt;&gt; I noticed that GCC once had a `-Wpoison-system-directories` flag t=
o<br>
&gt;&gt; warn about unsafe system include paths, but it seems absent in mod=
ern<br>
&gt;&gt; GCC. Does Buildroot apply any patches to handle this case (e.g.,<b=
r>
&gt;&gt; preventing accidental mixing of system and local headers)? If not,=
 is<br>
&gt;&gt; there a recommended alternative for embedded builds?<br>
&gt;<br>
&gt; This is a binutils patch that Buildroot applies to its toolchaind:<br>
&gt;<br>
&gt; <a href=3D"https://ind01.safelinks.protection.outlook.com/?" id=3D"OWA=
c08423af-a277-b368-efb4-518d131b4562" class=3D"OWAAutoLink" data-auth=3D"No=
tApplicable">
https://ind01.safelinks.protection.outlook.com/?</a><br>
&gt; url=3Dhttps%3A%2F%2Fgitlab.com%2Fbuildroot.org%2Fbuildroot%2F-<br>
&gt; %2Fblob%2Fmaster%2Fpackage%2Fbinutils%2F2.44%2F0002-poison-system-<br>
&gt; directories.patch&amp;data=3D05%7C02%7Csunilkumar.dora%40blackfigtech.=
com%7C4c6349104c1543a8fd7608dda77ed77b%7C75dd016f4b8642d99a4d6df5b9790019%7=
C0%7C0%7C638850885432217898%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWU=
sIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7=
C%7C%7C&amp;sdata=3DMOYMBxa7Qt7dkj3kf3Rkmfewgv5bBJsOMQnZI2omQxQ%3D&amp;rese=
rved=3D0
 &lt;<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/blob/master/pa=
ckage/binutils/2.44/0002-poison-system-directories.patch" id=3D"OWA5e6957db=
-1b3f-d73a-f5a2-118449b3e4f3" class=3D"OWAAutoLink" data-auth=3D"NotApplica=
ble">https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
tlab.com%2Fbuildroot.org%2Fbuildroot%2F-%2Fblob%2Fmaster%2Fpackage%2Fbinuti=
ls%2F2.44%2F0002-poison-system-directories.patch&amp;data=3D05%7C02%7Csunil=
kumar.dora%40blackfigtech.com%7Ccf5e00dc3e4a40fb403808ddad081e4f%7C75dd016f=
4b8642d99a4d6df5b9790019%7C0%7C0%7C638856972603584545%7CUnknown%7CTWFpbGZsb=
3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFp=
bCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DmFQsf5%2FG12rpq8TFGrEpxIYSOEe=
O9NHriZeuKR1gm8c%3D&amp;reserved=3D0</a>&gt;<br>
&gt;<br>
&gt; baruch<br>
&gt;<br>
&gt; --<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; ~. .~&nbsp;&nbsp; Tk Open Systems<br>
&gt; =3D}------------------------------------------------ooO--U--Ooo-------=
-----{=3D<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - baruch@tkos.co.il - tel: +972.52.368.4656, h=
ttps://<br>
&gt; ind01.safelinks.protection.outlook.com/?<br>
&gt; url=3Dhttp%3A%2F%2Fwww.tkos.co.il%2F&amp;data=3D05%7C02%7Csunilkumar.d=
ora%40blackfigtech.com%7C4c6349104c1543a8fd7608dda77ed77b%7C75dd016f4b8642d=
99a4d6df5b9790019%7C0%7C0%7C638850885432242858%7CUnknown%7CTWFpbGZsb3d8eyJF=
bXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIld=
UIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DPjqW7n6fUT8hn%2FYw3EOAZy4%2F5T66O4HU=
zW9UQjrjgR4%3D&amp;reserved=3D0
 &lt;<a href=3D"http://www.tkos.co.il/" id=3D"OWA1db17105-b854-686a-9029-45=
17ee9fcfa2" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://ind01=
.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.tkos.co.il%2F&amp=
;data=3D05%7C02%7Csunilkumar.dora%40blackfigtech.com%7Ccf5e00dc3e4a40fb4038=
08ddad081e4f%7C75dd016f4b8642d99a4d6df5b9790019%7C0%7C0%7C63885697260360256=
5%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiO=
iJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3Dy%2Fpl=
dJi%2FNSKHwUIq2yC2Syqa4ruPrYBND%2BqheweASXE%3D&amp;reserved=3D0</a>&gt;
 -<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; buildroot@buildroot.org<br>
&gt; <a href=3D"https://ind01.safelinks.protection.outlook.com/?" id=3D"OWA=
1efde055-9d8f-28ca-b34d-5933e49dab01" class=3D"OWAAutoLink" data-auth=3D"No=
tApplicable">
https://ind01.safelinks.protection.outlook.com/?</a><br>
&gt; url=3Dhttps%3A%2F%2Flists.buildroot.org%2Fmailman%2Flistinfo%2Fbuildro=
ot&amp;data=3D05%7C02%7Csunilkumar.dora%40blackfigtech.com%7C4c6349104c1543=
a8fd7608dda77ed77b%7C75dd016f4b8642d99a4d6df5b9790019%7C0%7C0%7C63885088543=
2255555%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCI=
sIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3D=
VE%2BHwNQgR8%2Ft1hr1t055jmANb6gQ6IlrmPxArfg25BQ%3D&amp;reserved=3D0
 &lt;<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" id=
=3D"OWA960d9dcf-b13f-1aa6-6f7f-866f2823a212" class=3D"OWAAutoLink" data-aut=
h=3D"NotApplicable">https://ind01.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Flists.buildroot.org%2Fmailman%2Flistinfo%2Fbuildroot&amp;data=
=3D05%7C02%7Csunilkumar.dora%40blackfigtech.com%7Ccf5e00dc3e4a40fb403808dda=
d081e4f%7C75dd016f4b8642d99a4d6df5b9790019%7C0%7C0%7C638856972603621814%7CU=
nknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW=
4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DIJISPWd3ms1=
ttbT5wroz2WQnDeQF%2F0PMf7B5aIv96D8%3D&amp;reserved=3D0</a>&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; buildroot@buildroot.org<br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" id=
=3D"OWA8869ffa7-cfe4-2939-241b-80ad3a1a2ed6" class=3D"OWAAutoLink" data-aut=
h=3D"NotApplicable">
https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.b=
uildroot.org%2Fmailman%2Flistinfo%2Fbuildroot&amp;data=3D05%7C02%7Csunilkum=
ar.dora%40blackfigtech.com%7Ccf5e00dc3e4a40fb403808ddad081e4f%7C75dd016f4b8=
642d99a4d6df5b9790019%7C0%7C0%7C638856972603635990%7CUnknown%7CTWFpbGZsb3d8=
eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCI=
sIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DHxtwXOYluub680YtS7vZusM4si68fGh%=
2BKQcnFK7qdgs%3D&amp;reserved=3D0</a><br>
<br>
</div>
</body>
</html>

--_000_PNZPR01MB83783B558A937F9081456B2C9B73APNZPR01MB8378INDP_--

--===============4170829585569713853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4170829585569713853==--
