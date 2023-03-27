Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DB7C7619A
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 05:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19B38402F2;
	Mon, 27 Mar 2023 05:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19B38402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BCzeDn0vnfid; Mon, 27 Mar 2023 05:45:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57871401B7;
	Mon, 27 Mar 2023 05:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57871401B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DBD901BF3EA
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 05:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86586414C8
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 05:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86586414C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Ue15Eto_eHc for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 05:45:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B2564149F
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::613])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B2564149F
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 05:45:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQi7AFOSqw7w15fnKnUVdi72KSpMP3KVEPnT9xcctVI8N6Tnf4ZB1uZ/XvdFHL6U+Ws/WnkNhgu3LU/XyvyG6WeN0RgI1ZPWZwhMHe3xHAEsurgK+4wQ9i+XvC9SThhG/IIHWqf4eEO8lW0vpHKPdftwBkTPnAXYBwq0bgOYtvOHPVD9R2Aq6TKTYop8spygC4Ij12WOFmzy747g93uR8TXRlirubGjye/mdzF1vGRZjwtBQP8QW3P3egLV3HiecquuQsOlIjspo4LO1DiOW8PDUmuNuudK0WlzLS6HMCOTMEhfiFlGVw1d0/aBqYXWov0BZ3oYjcbjKDlgwiJ+cug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QafUYJgzcyUj3D3x8s89xmK85OCVKHWQX9wR18i8q68=;
 b=cTxu56Z45IV8FGXsYWH/vVDA8S7/IZEbSsXz/znKi2b2A3JhV8pt3KRajYb0JKkDZ0SDEyvdELxoQS0/wp0p3l0P5freS4VigBRfMVLqTqjg96JT4WN4kBLhJql3inQQXyCgXT0ofbMdGoNh7yuq6PNNbZtFtyukXAEzS4Dd4cSRtkGoyJn2vTD3D7JlcLAlL4ELYp51bAiYGr3zpeStmxQD33DkoGXCPcajms/KE/HJY+hzUvxTqryg2GIrRpDwPdgLYEljW4K6OvgQg8iR2TIlHPXDdK+T3FbOqOlHLob7AVpeWdYayN5pwX9gA1/tS6DO5R3ZXe2W7zg3qdz+RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SN7PR12MB7251.namprd12.prod.outlook.com (2603:10b6:806:2ab::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 05:45:46 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::9ef9:3671:7fbe:3ec]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::9ef9:3671:7fbe:3ec%3]) with mapi id 15.20.6222.028; Mon, 27 Mar 2023
 05:45:46 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v1 1/2] package/zynqmp-firmware: new package
Thread-Index: AQHZX+ylwlDcnFpbP0+plEFQFRl0H68NfNeAgACiAgA=
Date: Mon, 27 Mar 2023 05:45:45 +0000
Message-ID: <B1C2F9E6-C87B-4B1A-A6F9-9A312663D946@amd.com>
References: <20230326220543.057f381d@windsurf>
In-Reply-To: <20230326220543.057f381d@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SN7PR12MB7251:EE_
x-ms-office365-filtering-correlation-id: 30cbb2b5-dd8f-4c9c-b128-08db2e8682e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kBlp4qGOda7fIk05KiUROI8zFT8akMWIp9Nvn2WVwrgHY805BKTqZBNoIhHQwhr6/dAblCkZvKHF2LnC0B+S/nBDnrRl6rQnur4b9vYMUoA4XWV2To61KyPYFGaDzlapeNxNjyVcKb8FTDPpW2OTLy5qDq9bhii+XG5O7rqaWhQqo9yOFQvsh5eQ82R4XwGoo4s1zR4T9DGeps20UR7a8MelIVGwIv0Xubkih8Jwilli+/sP6AWQl+7vsnYd+nyTBNDxLaB9tN61eMIjJ4HPpMpRCNB3oOM07wa3sb5Bol60TyBCepoqCyCXE+1AtcE/0fr9m03xCsZfL+XkrtN2HYpWJKDOdjOM0pjvEjNQG8JSqLnyVO6HxIiypKrfHQjjEV0L9Czwz/oz87F+oZq5kSKeQyOPf5/gQGiusySgX/kiMfXgmgD9UuBoSyS5jIrN9QeeY9UcR38duASvG4thGJ+6tkgrH0liENtfoEA0ibud/JNPYtMUXJ/w56B98JuM+JOGF4Xg3gtLcFrS0M/DEgtG6JxxQtj+4xy4BPcUSd/MqC0FjVOzao3tZaYxWH0xjwFKAjWEeb+8my8+qP/zoSxpd7vKhE1qN3Phgnageyy/R8O8GSqIvlqzAKbJPuYMNIGZRGRfD0rb/4+5nFUjzg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199021)(6916009)(122000001)(38100700002)(38070700005)(36756003)(33656002)(66446008)(86362001)(66946007)(66556008)(66476007)(76116006)(64756008)(8676002)(91956017)(316002)(186003)(8936002)(5660300002)(2616005)(41300700001)(478600001)(966005)(6486002)(71200400001)(6512007)(6506007)(54906003)(4326008)(66574015)(2906002)(83380400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NEN3cXNDK0dsekVQUWNXQjc0T3BoQURFeW1uWmJlbnpyNjVBMnRiU3FpOGs2?=
 =?utf-8?B?Z2xyZXFha0dJSE5yK08rYm5xOVBWbzAxOFNCbDJudGNGNmIvMnFJQ1pBM0k2?=
 =?utf-8?B?L0F2MGhxamQ4T2pVOFVJa2YxQlgzQUppaWhzTHRjdUthODNLeERWMVhrbGRt?=
 =?utf-8?B?REpEMGs2ZEZPbk5NOGN6QVo3djhwOWlBcUozYTd1UmdrS0hGOXQrUStVaUZG?=
 =?utf-8?B?eEQwSDlWSFRaTlpEUUdiaHdybTlPZ3NUYXQ2RGg2QlUwdE90N1BqelQybm9F?=
 =?utf-8?B?WGN3ODZrTWMzUUt5TnJKM0d0ekRxQmJ0OXlTbE1rTXlxazhlY1QzOUk0dnQ1?=
 =?utf-8?B?TGJ6RFNmVUhxTklISjNBSDk1QVN6WWVxVXVzY0ZUTHNuQWtrNGJ5K1dWMjBF?=
 =?utf-8?B?VjRYamlGZDBUNjgxazd6UVlHOXF2ZUVRWVJDOVFPL1J5N1dOTzhxVlhOV1Fk?=
 =?utf-8?B?YkhDOHNocjNDL005TDNLVXBzdHYxNGFHSnRUSk93d25aK204alpIRzltU205?=
 =?utf-8?B?TlZ6ekhTTktmRTZ6WlRhbVhSeXFXTldkbE5nWExEYUYxM2NCMVptaGJrMlRD?=
 =?utf-8?B?Q0UzUXNqRXZCRG01VXRxcytCVCswSjZheHE1aEJubnhpbUFEOUJrRXJwOWJy?=
 =?utf-8?B?Uy9jc2JyMTE3RHYrc3UrNFlMVTliMzMxSHRlcjlDN0U0UTJadG5WTXU5OVlE?=
 =?utf-8?B?S283YktBNTdwcWRjM1pOUnliNXJpQW9FZDgvZWxPd0prZnB5MnM4RzhnZ08x?=
 =?utf-8?B?OWJ4bFhjYVRmbEk2SHJyb01Vc09XNzZkeTgyL2o3Q3N5alZOWTNxTm1wUVFK?=
 =?utf-8?B?dkhycGhnTXZnVllIS0hjblU0eFBFQVdNblVpRXZmTnRTLzhaSkhpaEFQcjB5?=
 =?utf-8?B?QWdndSthMEtibDFROEozT0xMYWF0dGJQbDBWcTB5Ymk5WVB1NEt1KzZpMUtG?=
 =?utf-8?B?dGw3QTkzS2trek8zVlFlZmFDczlqZTJrektONk9jbHV5cTA5TUorWENiNGpP?=
 =?utf-8?B?SGJBb2VsYVNUdU1zYlZyTjdrWjJwWTYrQy84bHFSRUNoL1p1TW5TUWNHd2kv?=
 =?utf-8?B?cXM0aG1ielJMMTJDRUxIeHQ3elJTcDFRRktqbDluTm5ORUpzRURJVUJlb2xC?=
 =?utf-8?B?c2dEeHFEczRYVnNFaS9QQWJFa3hzSS9rS2djTGNnQTI3QktMN2tNaGhTZU9Z?=
 =?utf-8?B?b1JueEZRb242UlJ3bit6VVBhc3NXRVo4L0NhemVrOUpRL1BvUVVFR29FanVS?=
 =?utf-8?B?ZWozK04zTkRaZ0xDNFJwQWRyUk4rcVVSamJ6NE5pbkpJVytpd3daaExzTDhQ?=
 =?utf-8?B?ckoxTktBaExmdUl6QkJ6SjlQbkJZSEtxZktTUHZXYzh3YWtMenQyYi9MZ0lC?=
 =?utf-8?B?ZUNFR29qSFhxcWZ1d080MkRIV3BzclF3Vnk4OUxYMVBjT1FKRWpTTlJzOEtX?=
 =?utf-8?B?U3pVLzZ3ZDVyVXlMazhTbWU1ZkJFZGZzb1VxWDJkUFJRRjl2QkV3TnQ3MHVY?=
 =?utf-8?B?bm04VjVlTnMvL0ptS25hcWFzTUxLbGdoK1h0UXE1azRoV0szK3Q5L3pYNlN1?=
 =?utf-8?B?bWowanZvcUc4WkM3cFhKUTU1Qitqa0RmTWJidlNYbjFEN29HUWptNVIwTThP?=
 =?utf-8?B?MlFxMjFMaTNwNGoydHhwUSs1YjAwYXNZSkRRK2NIKzJEVTJqT3VCMFlsRk0x?=
 =?utf-8?B?aFcwYjlMM3gxZjFpaGV2L09veUtPL3M4UzNUTzhZTzRjU09oWTR5ejFVYWdQ?=
 =?utf-8?B?SmtzZENKZnBQYVNIY2lvUFJoRnUvck52OURqYmcxTlg4RTEwbjhXZFRZTGpS?=
 =?utf-8?B?UEJFRVVuZ3hVU3NJZEdLY3hqU0JHMWRPN2REWWtpNzhDL3pvSHRMRzIxcFY4?=
 =?utf-8?B?SmpaNmRrNC9DaXFESW80L0JzQkQ5bEVZNGJmeHFKdmhTMzJEYlFrRVhWelNV?=
 =?utf-8?B?YjAvRDc0SENIakhvS2t5bjg0Z2ZoVjlCZlZyYm9zaDlROUtGMTFTYithNzBF?=
 =?utf-8?B?bFI0SHQrNFBPM1FTbDdkaGw4YWtLR1h2ZUJqWVVPYXkvOVJHd1NMMGVaMUNB?=
 =?utf-8?B?MG04ZS9HbmJtdU9ENElOWGFqaHhCSVc1WGJmbStucE5vKzM0cXlQcUxFaXZU?=
 =?utf-8?B?N3RXb1QxT3d1SC8rNXg4c29ramgwaHRtZmFvMGk1UDZkcXJYeloyRFRVdzNt?=
 =?utf-8?Q?mDj9dVPZY5oRf3IhIJjCUAA=3D?=
Content-ID: <61E436E2A7878046BD48FE39A6F70D42@amdcloud.onmicrosoft.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30cbb2b5-dd8f-4c9c-b128-08db2e8682e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2023 05:45:45.9616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mJmR7n0pY+dYHEXze9hemqRQFrFFE7rgAuO9o6d4qn7qhO5el4ljOuplSFgDbv9I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7251
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QafUYJgzcyUj3D3x8s89xmK85OCVKHWQX9wR18i8q68=;
 b=jZtuEqPt5Xk1WmJhHypOnkp42YnPWRHx1verf7+6N436RsYCZJRRJ+c4tTswR1jdyXwqn5vhCXCt/RGmktUzeAR71CApVpqt2vnmhvMOESBF/4cY4vv4qat4MIkeFyDPFhV1S7zt77MWLBffCGVIiHYldvDA8/6GkG+x39ZI8Dk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=jZtuEqPt
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/2] package/zynqmp-firmware: new package
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Simek, Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLA0KDQo+IExlIDI2IG1hcnMgMjAyMyDDoCAyMjowNSwgVGhvbWFzIFBldGF6em9u
aSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gYSDDqWNyaXQgOg0KPiANCj4g77u/SGVs
bG8gTmVhbCwNCj4gDQo+PiBPbiBTdW4sIDI2IE1hciAyMDIzIDE1OjA5OjQ4ICswMTAwDQo+PiBO
ZWFsIEZyYWdlciB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6
DQo+PiANCj4+IFRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBwYWNrYWdlIHRvIGJ1aWxkcm9vdCBmb3Ig
YnVpbGRpbmcgdGhlIHp5bnFtcCBwbXVmdw0KPj4gd2l0aCB0aGUgcmVxdWlyZW1lbnQgdGhhdCB0
aGUgdXNlciBtdXN0IHByb3ZpZGUgYW4gZXh0ZXJuYWwgbWljcm9ibGF6ZQ0KPj4gdG9vbGNoYWlu
Lg0KPiANCj4gVGhpcyBpcyBub3QgcmVhbGx5IG5pY2UgOi0vIFdhcyB0aGlzIHRoZSBjb25jbHVz
aW9uIG9mIHRoZSBkaXNjdXNzaW9uDQo+IHdlIGhhZCBvbiB0aGlzIHRvcGljPw0KDQpJIHdvdWxk
IG5vdCBzYXkgdGhpcyBpcyB0aGUgY29uY2x1c2lvbiBvZiBvdXIgZGlzY3Vzc2lvbiwgYnV0IHJh
dGhlciBhIG5leHQgc3RlcC4gIE9uY2Ugd2UgaGF2ZSBhIG1pY3JvYmxhemUgY29tcGlsZXIgcGFj
a2FnZSwgd2UgY2FuIHVwZGF0ZSB0aGUgenlucW1wLWZpcm13YXJlIHBhY2thZ2UgdG8gdXNlIHRo
ZSBpbmNsdWRlZCBjb21waWxlciBieSBkZWZhdWx0IG9yIGFsbG93IHVzZXJzIHRvIHNlbGVjdCBh
biBleHRlcm5hbCBvbmUsIGluIGNhc2UgdGhleSBwcmVmZXIgdG8gdXNlIHRoZSBYaWxpbnggZGlz
dHJpYnV0ZWQgY29tcGlsZXIuDQoNCj4gDQo+PiArY29uZmlnIEJSMl9QQUNLQUdFX1pZTlFNUF9G
SVJNV0FSRV9LUklBX0syNg0KPj4gKyAgICBib29sICJrcmlhLWsyNiINCj4+ICsgICAgaGVscA0K
Pj4gKyAgICAgIEFkZHMgYWRkaXRpb25hbCBDRkxBR1MgZm9yIEtyaWEgSzI2IFNPTXMuDQo+IA0K
PiBUaGlzIGRvZXNuJ3QgbG9vayBzdXBlciBleHRlbnNpYmxlLiBXaHkgYXJlIHRoZXNlIENGTEFH
UyBuZWVkZWQgaW4NCj4gcGFydGljdWxhciBmb3IgdGhpcyBwbGF0Zm9ybT8gSXMgdGhpcyBhIHBl
ci1Tb0Mgb3IgcGVyLWJvYXJkDQo+IGNvbmZpZ3VyYXRpb24/IERvIHdlIGV4cGVjdCBtb3JlIHBs
YXRmb3JtcyB0byBuZWVkIGN1c3RvbSBDRkxBR1M/DQoNClRoZXNlIENGTEFHUyBhcmUgbmVlZGVk
IGZvciB0aGUgazI2IFNPTXMsIHNvIHdlIHdpbGwgbmVlZCB0byBpbmNsdWRlIHRoZW0gZm9yIHRo
ZSBrdjI2MCBhbmQga3IyNjAgZGVmY29uZmlncy4gIEkgYWdyZWUgd2l0aCB5b3UgdGhhdCBjdXN0
b20gZmxhZ3MgYXJlIG5vdCBzbyBuaWNlLCBhbmQgaG9wZWZ1bGx5IFhpbGlueCB3aWxsIGZpbmQg
YSBiZXR0ZXIgc29sdXRpb24gZm9yIHRoaXMgaW4gZnV0dXJlIHZlcnNpb25zLg0KDQpGb3Igbm93
LCBJIHRoaW5rIHdlIGhhdmUgdG8gbGl2ZSB3aXRoIGl0Lg0KDQo+IA0KPj4gK1pZTlFNUF9GSVJN
V0FSRV9WRVJTSU9OID0gJChjYWxsIHFzdHJpcCwkKEJSMl9QQUNLQUdFX1pZTlFNUF9GSVJNV0FS
RV9WRVJTSU9OKSkNCj4+ICtaWU5RTVBfRklSTVdBUkVfU09VUkNFID0geGlsaW54XyQoWllOUU1Q
X0ZJUk1XQVJFX1ZFUlNJT04pLnRhci5neg0KPj4gK1pZTlFNUF9GSVJNV0FSRV9TSVRFID0gaHR0
cHM6Ly9naXRodWIuY29tL1hpbGlueC9lbWJlZGRlZHN3L2FyY2hpdmUvcmVmcy90YWdzDQo+IA0K
PiBVc2UgJChjYWxsIGdpdGh1YiwuLi4pIGluc3RlYWQNCj4gDQoNCk9rDQoNCj4+ICtpZmVxICgk
KEJSMl9QQUNLQUdFX1pZTlFNUF9GSVJNV0FSRV9LUklBX0syNikseSkNCj4+ICtaWU5RTVBfQ0ZM
QUdTID0gIi1PcyAtZmx0byAtZmZhdC1sdG8tb2JqZWN0cyAtREJPQVJEX1NIVVRET1dOX1BJTj0y
IC1EQk9BUkRfU0hVVERPV05fUElOX1NUQVRFPTAgXA0KPj4gKyAgICAgICAgLURFTkFCTEVfRU0g
LURFTkFCTEVfTU9EX09WRVJURU1QIC1ERU5BQkxFX0RZTkFNSUNfTUlPX0NPTkZJRyAtREVOQUJM
RV9JT0NUTCBcDQo+PiArICAgICAgICAtRENPTk5FQ1RfUE1VX0dQT18yX1ZBTD0wIg0KPiANCj4g
QWxsIHRoZXNlIENGTEFHUyBhcmUgcmVhbGx5IHdlaXJkLi4uIHdoeSBpc24ndCB0aGlzIHBhcnQg
b2YgdGhlDQo+IHp5bnFtcC1maXJtd2FyZSBidWlsZCBzeXN0ZW0gaXRzZWxmPw0KPiANCj4+ICtl
bHNlDQo+PiArWllOUU1QX0NGTEFHUyA9ICItT3MgLWZsdG8gLWZmYXQtbHRvLW9iamVjdHMiDQo+
PiArZW5kaWYNCj4gDQo+IEluIGFueSBjYXNlLCB0aGlzIHNob3VsZCBiZToNCj4gDQo+IFpZTlFN
UF9DRkxBR1MgPSAtT3MgLWZsdG8gLWZmYXQtbHRvLW9iamVjdHMNCj4gDQo+IGlmZXEgKCQoQlIy
X1BBQ0tBR0VfWllOUU1QX0ZJUk1XQVJFX0tSSUFfSzI2KSx5KQ0KPiBaWU5RTVBfQ0ZMQUdTICs9
IFwNCj4gICAgLURCT0FSRF9TSFVURE9XTl9QSU49MiBcDQo+ICAgIC1EQk9BUkRfU0hVVERPV05f
UElOX1NUQVRFPTAgXA0KPiAgICAtREVOQUJMRV9FTSBcDQo+ICAgIC1ERU5BQkxFX01PRF9PVkVS
VEVNUCBcDQo+ICAgIC1ERU5BQkxFX0RZTkFNSUNfTUlPX0NPTkZJRyBcDQo+ICAgIC1ERU5BQkxF
X0lPQ1RMIFwNCj4gICAgLURDT05ORUNUX1BNVV9HUE9fMl9WQUw9MA0KPiBlbmRpZg0KPiANCg0K
T2sNCg0KPj4gKw0KPj4gK2RlZmluZSBaWU5RTVBfRklSTVdBUkVfQlVJTERfQ01EUw0KPj4gKyAg
ICBjZCAkKEBEKS9saWIvc3dfYXBwcy96eW5xbXBfcG11Zncvc3JjICYmIG1ha2UgXA0KPj4gKyAg
ICAgICAgQ09NUElMRVI9JChaWU5RTVBfRklSTVdBUkVfVE9PTENIQUlOX1BBVEgpLyQoWllOUU1Q
X0ZJUk1XQVJFX1RPT0xDSEFJTl9QUkVGSVgpZ2NjIFwNCj4+ICsgICAgICAgIEFSQ0hJVkVSPSQo
WllOUU1QX0ZJUk1XQVJFX1RPT0xDSEFJTl9QQVRIKS8kKFpZTlFNUF9GSVJNV0FSRV9UT09MQ0hB
SU5fUFJFRklYKWdjYy1hciBcDQo+PiArICAgICAgICBDQz0kKFpZTlFNUF9GSVJNV0FSRV9UT09M
Q0hBSU5fUEFUSCkvJChaWU5RTVBfRklSTVdBUkVfVE9PTENIQUlOX1BSRUZJWClnY2MgXA0KPj4g
KyAgICAgICAgQ0ZMQUdTPSQoWllOUU1QX0NGTEFHUykNCj4gDQo+IFBsZWFzZSB1c2U6DQo+IA0K
PiAgICAkKE1BS0UpIC1DICQoQEQpL2xpYi9zd19hcHBzL3p5bnFtcF9wbXVmdy9zcmMgXA0KPiAg
ICAgICAgLi4uDQo+IA0KDQpPaw0KDQo+IFRoYW5rcyENCj4gDQo+IFRob21hcw0KPiAtLSANCj4g
VGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbg0KPiBFbWJlZGRlZCBM
aW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZw0KPiBodHRwczovL2Jvb3Rs
aW4uY29tDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuICBJIHdpbGwgdXBkYXRlIGFsbCBvZiB0
aGlzIHdpdGggdjIgb2YgdGhlIHBhdGNoIHNldC4NCg0KQmVzdCByZWdhcmRzLA0KTmVhbCBGcmFn
ZXINCkFNRA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
