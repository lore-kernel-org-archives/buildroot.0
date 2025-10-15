Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC23CCD18E
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 12:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F9DE841FE;
	Wed, 15 Oct 2025 12:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yn761w4oECgY; Wed, 15 Oct 2025 12:58:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 926E484203
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 926E484203;
	Wed, 15 Oct 2025 12:58:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ABCD4C4
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 12:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C82640919
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 12:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0a-_BWMUdh2 for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 12:58:32 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::613;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 32DD840459
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32DD840459
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0613.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::613])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32DD840459
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 12:58:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=obHJg/5VnVYjk+wvPujabenQYKsKtSZat6/sl9BJfmLTrt7xXKeG9yGalrsq1IjNNMilU/gqPTBJtt2ngDwC3wkgDKD0u2QiSH4ayO+xW8zoaMa8MOaOj1yGA8MuOft1aU7/DOMoXoJ4e13DjeKMe4UKicMrCOKKzLvamlcckF5OX1Vfx1X9+AooDQ+JGC+tAoh4YqBOklZrvu5e5ov8STmX+cibbzyGuEA8j/Cff2Tvv+RCpcu0zWyhG8pHwvQJEohl8r4TueqMyyOuaoC5WtM7/b9x1TQffiXIVI/ncNFnncI9MP8dS4IuRn+XI1/mVkbGnFfa7Fkl1Zjh80hnDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/ps7/eqw9lezIDIrJMVvIFW2aNj0aYRQ77IAFNIpOk=;
 b=a2IR78tUjkrzv49e340V64h5GBJTsltDykLmv1ivsRYc+rFdwhwdHj+WgZRfnu1lfFq16nIihwTfeshPNwnq3Hmmsy0F7rnxxL1aHpRpQn0SXQZrhh/1YAUaITqG7fCYynWfo8KLj2++q+gvn9cPXjrkdKm0P8lHCm+ecpN60NDqCoQews+HPMxDuW4/nIpp2zAlDajTfqtiuhDv+s+ZJBiEUhd1ZyvlcNDorn9ZIheGpCtsijWkn93lhVJMDikCgvZCVfw48MJk+TotxCFllyCsjQvdJZGspHfAuIUV6BlfHibMi5nLjtZYNGOIYnaM2njyGuBP1wJKzWSORUN2tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN2P110MB1621.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.23; Wed, 15 Oct
 2025 12:58:24 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%3]) with mapi id 15.20.9182.020; Wed, 15 Oct 2025
 12:58:24 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
CC: James Hilliard <james.hilliard1@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH] package/python-trio: bump to 0.31.0
Thread-Index: Adw90jIGyNf4ryqsT6ehhGb6EGwAyw==
Date: Wed, 15 Oct 2025 12:58:24 +0000
Message-ID: <PH1P110MB1603DEF8759C63142ED9FEEC9FE8A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN2P110MB1621:EE_
x-ms-office365-filtering-correlation-id: 3258166c-653d-4c04-3628-08de0bea86f1
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|41320700013|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?2lyW5p4rwbf/VOwmvzP71nRcZZdqbpHOZWQ8jJbCCIMwJiCxo3vRuPfEMjTi?=
 =?us-ascii?Q?y7jFauUtyWOACKetZBbPEadj2X2x+QpFnMUBjVilp4VCGTuKY0c4sq1x16Cn?=
 =?us-ascii?Q?eN0lss/pkk6em3uiP9RqSzdoPlyzMzp5C1Q053vzBlJB2XhJ/Unc6NtnI+0Q?=
 =?us-ascii?Q?yB4S5cGEdFI2l1EtMerhz/Mmg6NIDsmOqAcHoaDBJsWINd3pEueHMceayRUa?=
 =?us-ascii?Q?kIp3crR0iM3Ddln2jSDzvWHM60kLxt+DTRDUteKpXIDD1muTvHAzK9Jb7PLu?=
 =?us-ascii?Q?iIl8bdUjK//KtId8yyapcOgzhCIcuW4bB5D1WWhwPY6tDbDVXvQpPkFA2d9j?=
 =?us-ascii?Q?uxE5ewd99qgYlZ/tRBDv9mdzBmiZVLv1qCQ009e8Mn+tXIEp63qQpp+TZnXD?=
 =?us-ascii?Q?kGJVxKDUHC5kH2kmsQrp7zGfHSmM5dLfIOh6HcvcQGfB20Dmf+6s/m9mwo36?=
 =?us-ascii?Q?c9Rfuymh1YddesSgK2qAQkVP2keJJy5xm5m36xWzeDzJf7e+yN94a/PbskzE?=
 =?us-ascii?Q?2iKrm2JHeUdA3t0s1hQijAwQMTwlsiEcA/NfTKVEQz9NuNGIe/QNvzsz2q5U?=
 =?us-ascii?Q?fK08qopFK+d0Vp+Iu/lq8hHID7RkECXuWnuNe9FYTrmtrCHyJSctK9dNppcG?=
 =?us-ascii?Q?8UG86v2KLDhmD2zAjA7MVA7sRbiy1tsvJBZIZLYdECWAaOlB8T4W0B6WOwnX?=
 =?us-ascii?Q?F504RLejJZ1hj5gjm+oHAnW0H73ewpCHkW+uBpFOrJ5Jqgs3yp6Y7ZR6PS+Z?=
 =?us-ascii?Q?f8zOBX9p8f2yuuTVVUDCIwa8N9GH5J6DRDcFP63iW8nCVQ0K0WDUHTV6wVEk?=
 =?us-ascii?Q?CjzBmnw72pBWIO+zcdyw8GftnKpdellufa7APcI+rVjDRZHUiZt5n3itLxPX?=
 =?us-ascii?Q?viZmFdqVFwV/hgotRkkk3ZgmgvkRFbk291lnD/SaqG7+B4CTgbDTqXF5Glmt?=
 =?us-ascii?Q?CobzS2ANteKmCrTLQjbUBHlZVf1xazhl0PvwzuK0d1R8/6c2N2rmynAtY3FG?=
 =?us-ascii?Q?QtbNboCJWgv67HAUgbNsApFvGCTXLZRqzHJtTAIVT8WMtTQiCAROZRgypBs7?=
 =?us-ascii?Q?SDWiL444jyt1zUAnCPKYEu7On1bbm3ktAFjY7li0uVnOh/9lGHi3D2ZJrW4s?=
 =?us-ascii?Q?FKSt1pYXEAg+YnrPboELWs3k+8mAC8CXB4S2CftxGsN8oubs5tFbr4OcbDLy?=
 =?us-ascii?Q?je/Ba0eCWUFu8UufStaRbl7LER6uuB9U+oX0lTxAbL9XZOxFAh6wDOaL/lhy?=
 =?us-ascii?Q?cndYrrFLOIoY/nIb0UeB+tjqkk0TCquDO6ovHcTsVYdpy2tVkFkSYw9BLUaA?=
 =?us-ascii?Q?7IA15c9kMOypxelzIgVAM53pcDC39v2RWtRk4afVd3rA8icW53zE4YHqc6/B?=
 =?us-ascii?Q?EkF4XEY+wzBRvD773rzS5ODmlKA9KBGDWsg1uqodgnWkId2qSzaznyyw+oB9?=
 =?us-ascii?Q?yaCcXK0hgLZEizxK6NzYVhdjjPLbMOHDB1OiI9s5NTZCazdHnTHX6Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(41320700013)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2LqAefAsZCqJsyjVAJDk06CmEguRp2fhiU6H2mzD5feGro4d2t71husblAc/?=
 =?us-ascii?Q?NPbb/BxT60FJ0Cee9YVYiIZngPS4Lh4yXT2gr2wyB4iOlCP1oZ16ghTmhXib?=
 =?us-ascii?Q?VHRNM/3G49fW8jrk1fQPIKXLZCUUlSTJvBr48HgaLvMDd3lTqDaMrwtSx2Ru?=
 =?us-ascii?Q?SdiNAO6kJiBTFYJiqk0Di8SfOfdiqYxHXphFIr4wgRFieMvwlEPXZb+gv5FO?=
 =?us-ascii?Q?vn36sxP8L8CaXJ6POk/gos44Ts1Ohb6uKZUzr/+vwAFvoAm2ehCjxK5RbssV?=
 =?us-ascii?Q?e82I9rjdAA8EAPq9MGG4XoCnb/Ilt5sjA33FIUwxIBN9CTy9DnY8dB78G6vI?=
 =?us-ascii?Q?a3bHanboCw7He66W30L68bY0A1lW2WKnox2lnB5izdS4F347wiIjjC6bd5m8?=
 =?us-ascii?Q?zXB9bwJH+rzguOd6lXig3Eb9ws2ct07y4+MXk8rHdV9Zki6kIjo9Ezqc+ytc?=
 =?us-ascii?Q?o42ZNklRdHydTLQVJIBP36eFgox02wCL3KapTnGQUZSwopTQ0oezuD2B99DG?=
 =?us-ascii?Q?7A59FW2wVKns5M7FOV8BefiDYKaSzRhzMBtdVpSFSc9EVtF3jgJccJVI7C58?=
 =?us-ascii?Q?pD4QfYTl+TxlOuq4ZOm1fM1GIhjcajZDGo5diGCpfR/5qT2Wk7+TshMOTYJ7?=
 =?us-ascii?Q?edXuj4q/mlOa/bHARPZOfNoSiYr1mF+9+MY4hNJWnuFlZkboZj4A3IT16zXn?=
 =?us-ascii?Q?8Z0aU5M3OhhGeyYfumEHa0uV4s0hXJsez1D7tF4TVkbP2qmxwm81MqLmRcJZ?=
 =?us-ascii?Q?2BU/allQqrsQECgNf+P/Gf7d2I6/w3mEkpxt64qN6bavB6438b/z4po0LvcI?=
 =?us-ascii?Q?iUt8kg77kZuqG9zNN5/ZNsT/KyDK7Z3yvm2IHY5jw3HtqZBWzDjMZFCyGRL5?=
 =?us-ascii?Q?HEfZzjnr8FKbn9AW5UOdcYKb829jM5fYt1NcA3OlA1+WgmG9muusYBZHzEnn?=
 =?us-ascii?Q?pcWOfjh7qT2iC8jbs6c0dnstSwl9ZXcqH1pItxh+0I21f0qsOmHu7oCJgZcR?=
 =?us-ascii?Q?hqyL0eH8nmuQUEv5QZfZlfAe/MiDbrhckdyYn+9UTbstjHZwuyQEERLEeMQ3?=
 =?us-ascii?Q?2nJUljX0LbH5GwM6tAqavXZYcrYS+o/tRzDGxMqVPBF53sfi69aRDjdjj4/F?=
 =?us-ascii?Q?Fiu9WmdgMy7t0Ihlsejuk3c2pFNQhDjFokpdn2+JdUYUx0Xli42UPNPKjETA?=
 =?us-ascii?Q?/8ehA3lfEm2mN99ol/OhrYV75feLpZfT025kCVNkYBumZdxZY0k6EelIF9gq?=
 =?us-ascii?Q?Ehz0ojw7KeNMuXyJhO+QwZ6Paa8FX4xJdrZgWzjSlJBiE4KN/3kOdoLhY/gf?=
 =?us-ascii?Q?3NKUh88Ng3v2+bBIgcxSlq4M5+mUn4iCdVRnOGVFQr+ZWrL9SabOEWfeRphY?=
 =?us-ascii?Q?ymS0STmgKTZhCykN6SkGZIv/3rVM+fsADFlmFe4MsAAUHF6KLsXkdoY5yMbe?=
 =?us-ascii?Q?YnHVRRv0Kpqa+Dx6WiMxRNBWQ1zfLuBKxoRdhxAVpVoqQsiqoBueV33wTE9B?=
 =?us-ascii?Q?ei9oWIuQJm3A9BQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3258166c-653d-4c04-3628-08de0bea86f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 12:58:24.7024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB1621
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/ps7/eqw9lezIDIrJMVvIFW2aNj0aYRQ77IAFNIpOk=;
 b=QOdw/70wBOwjXX8UgRcq9XO2E26BbV44OYLhB7fwbJdfyiOluZKoxmbufD8sBrqfdSp69MOWf+vl/1vxBHy7NGoUBU3Gztg63wLrL0CWq1QQ3XESyFREy/cM4Xp4u4WOwmc9IgYEsbF8iKgJJ3N6If09q5ehEOLLKayGZ5YSSc5sK6ziXYa9JkReHVrz3TYUvFmiiVCuHv8CHerOhfPFZQHfvoEtqJUIcT0BNsytSfihMyNd+wDggTqbWFY53ScBWFv1qUJMIGYfqLooCB9cNBLKpLQ98Y/qp+uCY/njbuIzOm3jywOxFKhB1fqUAI2d0DJzST2KluO8W0BJSPjmvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=QOdw/70w
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [PATCH] package/python-trio: bump to 0.31.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Marcus
> Hoffmann via buildroot
> Sent: Tuesday, October 14, 2025 11:12 AM
> To: buildroot@buildroot.org
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Subject: [Buildroot] [PATCH] package/python-trio: bump to
> 0.31.0
> 
> Changelog: https://trio.readthedocs.io/en/latest/history.html#trio-0-31-0-
> 2025-09-09
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Thanks for submitting this so quickly!

Maintainers, this is a dependency of https://patchwork.ozlabs.org/project/buildroot/patch/20251014142954.2579135-1-buildroot@bubu1.eu/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
