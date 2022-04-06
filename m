Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BB8C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 12:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EA7140B56;
	Wed,  6 Apr 2022 12:59:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7xSUVbJOsvla; Wed,  6 Apr 2022 12:59:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 891F740B5A;
	Wed,  6 Apr 2022 12:59:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDA911BF2F2
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 12:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B43F7408F3
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 12:59:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=orolia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 452tSFI5mzyS for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 12:59:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::626])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 033CA414C5
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 12:59:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSwxKSET/FvUJ7pfbkq99zHrr5Z03gqqCx/Y3pezFMQo89rfDtyGRyZ3tnWNUgtNol9dI/0VGWfJ7SilA+SLJ2nTJj6sSzDDUWnXKghGcmHO3hVKiZ26v/VSTGfM0FdA+iGuewjRWSZvSf4I6GjM3O9k5r00i87ZNLB49bHninkvAgz5tHL+iNiRQQkNa404eVhha9zVbG/O/hafbLBvAMrcJopX3hUhgdQ3xYqIZMmbbWK1KE5dLONOmV0bv3p2WrbV/H/88S71sVgTHBJJrz3jdn0F3UXD1WMEeDABl59tREibEbUcZSeqqFKfgT1gLllDHNvH6PwjUl4iww0WpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0ZefLHsUWFVaPeFpzAqshDcPEa+4RI1xT3MvE6HYz4=;
 b=bLpTpSX5TF7dMS+SlLTw+rVTiMW65pj3Lj61wO3s0FH5/1c77Sm3wA3xUNXq5StYg20XBGKEJMUQo7hKjaUjTi5HVZxVNKl+a5WlgHeeubV4KmBU4Romgfs5KUApeFiG2kjVWugrOTYXpIa5jBrKrbsmhSbM8xptx104lauQoeNKGz4hcG2lj89/YxuT5wqVtM0BArnnh2vLPMB4sAJMmyyHKDRwASw90q27RMFUiyJDHxwgbfrEnVg+ATMB0LU0UpJ2p5JPXf4tvYgV6Kar5JfUezQgF6kOzfWQ9DGlznP98rL5T0zJyIpBzgHvRAnIxi8ufZP9uj6kmnieMzOlTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orolia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0ZefLHsUWFVaPeFpzAqshDcPEa+4RI1xT3MvE6HYz4=;
 b=DORC34gV19upiqo/RgI0N2RcOWeeDsGeu+ozmu5UN4ZcHqpEOW7UI0LzXoXHF1g/3kulQLvXQQmDNpQ/sjmv4rEZ/+IGzEPcB3mtzbgR9bRQyKoZ94YQpwvknV3XSXe9rbgD0zQZKYupmE0wADbg+iXKCDjh7qwNBJSJmiCuvi8=
Received: from DU0P251MB0779.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:3a4::16)
 by AS8P251MB0294.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:34e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 12:58:57 +0000
Received: from DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
 ([fe80::bd71:8465:bc3:b72e]) by DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
 ([fe80::bd71:8465:bc3:b72e%6]) with mapi id 15.20.5144.019; Wed, 6 Apr 2022
 12:58:57 +0000
From: Tim Hammer <Tim.Hammer@orolia.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
Thread-Index: AQHYSLVQ1NO7vzXZKUeYGkY5EMcBFKzhOUPggABG04CAAJ+9cIAAWSAAgABNQHA=
Date: Wed, 6 Apr 2022 12:58:57 +0000
Message-ID: <DU0P251MB0779CECB98F51521C578D9F2E3E79@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
References: <DU0P251MB0779CD19DBCAA7F149788B41E3E49@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
 <CAPi7W83fzfin6_1KXV8BTy=AmcguoAK86mm4bFRrviFHBKmPbw@mail.gmail.com>
 <DU0P251MB07793F7BF68D17755B50F5F1E3E49@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
 <20220405181815.5dd6d85e@gmx.net>
 <GV1P251MB0771B70C2179F1A7FEFD76FBE3E79@GV1P251MB0771.EURP251.PROD.OUTLOOK.COM>
 <CAPi7W81e46JtetOtwT-RX8sJzVmEL_YMZrp89KBn1GCGrJfbyg@mail.gmail.com>
In-Reply-To: <CAPi7W81e46JtetOtwT-RX8sJzVmEL_YMZrp89KBn1GCGrJfbyg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9f7d43f-53ee-4a71-6088-08da17cd3661
x-ms-traffictypediagnostic: AS8P251MB0294:EE_
x-microsoft-antispam-prvs: <AS8P251MB0294FD835078E9F4C565C7AEE3E79@AS8P251MB0294.EURP251.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KDbVpAsPQN5giUnJiokYBkUgMTehlktftzZiHuClRznkQHVNfsbhmY7EWfOgMiwIpKt4Gc/PVRUqYNAsVaM52+2+OLAHwD85vCaRHplguQIy1DKlBHwHPM7S4AvCCmxDWvPTii8U23XqfhXcQo6z6bJu28reZKhTalR1B/Se7GNCV3+A3odzl5iF2DvmEnx5671XEgMXDp2PFBdi1Dzorxgd1oXccj+/svSs/EO6uxXruEc8qOuBZCQv5lcFsQNtriKG4qzn9FcyS2+D06uGV0CPvmB3uGHp9jBSHHZdhlx+Cc71Co6XSGpJOFwcAAdzxWR6dbcnO3fLd2C4Q6NGXUiq+/dkFVEtuPyFFy6BXAyOlWDNFQMsv8LU7QXztrI/HNzNwDpXL6KSeP/EhsWPfkNHH2FmFyHPqJmetYMZbM7zReGnryd5PJm0b7frPJ+tpfCpWOZ/MPFFPm9aSUgigjmdCOix4pBTF0kfSQZ2Mi1FbpGYQ/1gZvlqLrPXHGEDms30c/WQFSCBrefdvIMFwIutvxhZ3E4aUnd9D7mLi+ZvfxT7dhNv8hiW4HeZw2H27//D1iVBBfqPkOmd+GakGtG/Fnu6s+yNpJ5ghPNnEzOtsfivJh72jhUE3p+Rn6LeYzlyrjx1pPfN5ei/CiSJtvSftjpD0vCXEbaqcwrKReFfp14FOnD8830APgpZaOanCp9FauN1viy8/NV/LYUDR7Bwn4bNtiI8bIExMdkGya9PLYkz/K50IMbGruNx3e0xxfPsTrhzwg2Gw6FKomHalUZF5LdfoiMRSp0hF2cgx/w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0P251MB0779.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(122000001)(7696005)(5660300002)(6506007)(2906002)(316002)(508600001)(33656002)(186003)(55016003)(83380400001)(9686003)(54906003)(6916009)(66946007)(66476007)(71200400001)(8676002)(38100700002)(52536014)(4326008)(76116006)(86362001)(966005)(8936002)(66574015)(66556008)(64756008)(38070700005)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHllSHpXalE0cDJlRGl5ZVEwSDhpemkzWURVdFp5cGJPcXpqQmw3UUwrMzVt?=
 =?utf-8?B?NkF2MnJNUDNJbjNqSWc5RFFIVnpobXo2T0RLNG8wS2FyOVQ3bDZ5KzN6bGJq?=
 =?utf-8?B?ZmFwMEROVnUvTW1SeFhnTE5zclp5UzduOVB0THpsOHJ2S2xLWDRhNUV2SHdu?=
 =?utf-8?B?R1ByU2pmZ3Raa2szNmkvTEZYbUN5NURNUjRXRkpCcTdaZVpqUGhtZ2JEV3BR?=
 =?utf-8?B?bTZHT3laTTlrYVoxWGNFRVdxZjhYMlVYZ0Q4WUljNW5zejQvcUlXK25aMGpW?=
 =?utf-8?B?bDhhYkZ5UjYrRG1GbDFnOXBKMjAydzM4bDE3SlNqRHNrSkFpM0ZNeDBTVWtU?=
 =?utf-8?B?bTZBa3ZiZUE0ekR0cnUvWUtGVUZRUHhwcTNVbEtGMlhQRlZjWkE1dDR2OG9r?=
 =?utf-8?B?OFpZV0grcHRpcXBDRHVydE5xL0ZiT2xmUmpFMmpXYjFtZE1wcnlYdm92aDJE?=
 =?utf-8?B?UG96aldLb2IwWFRJVmNsVG02RE45OUNkL1hUR1FqTFlaRlNsS05VM0QvTDQz?=
 =?utf-8?B?U0FqRUZrM1EvVG0zSzNNWDhscmEzazQwMFdsd2JhU2J5UzhXN0psL0Y0QVFq?=
 =?utf-8?B?Q1BvZFg2bWVVN3NSSUtRVEJMTkUvVzYxNU5Ddm5SVXcrNzlnT3BLRjkrODlI?=
 =?utf-8?B?cWlrb0FSbGNuczI1Z1docm01V3FTcFlsK0ZhV2JvTWRMbm5xTXVUTXBVSjdM?=
 =?utf-8?B?elU0a0U1SHRCWjVraFFVNzcrVVZMaFdWZElNOHhkK043dlpJczBuTklGSWlo?=
 =?utf-8?B?Z1g3WWUzcUk5Z3hVTW1WRUVGenZzaGF0QTRjdlh4TzZnbDZXV1VCSm5MYjR0?=
 =?utf-8?B?S0hOcGo0bW5BZkE5aklocFgvcnZGMDVLZlVLcGJIeXY4QzdtYjZhb3h4SUhK?=
 =?utf-8?B?SmV1bXVqSkhKeFQwUVMrQlB3T3QyKzNoTHVhdnhyWUJsL09GU3RkWFo0eTVU?=
 =?utf-8?B?Q2prcS8ydnFScXBZaGhLUFFDQlkxYTdNZ3Q4VEIrdFFPeEdNSHYrSW53cVJO?=
 =?utf-8?B?bVY1SmcrYUczT2JMK1RSQ25Mait2V1VPaGJ0ZitwZ0dXaHo2VHVobHA1TnQ1?=
 =?utf-8?B?cFZxRndVNlh4dGJOVElBMkdnQWhub0NWNWZJVnVzdFNidGVRMkpyTUY1WUU2?=
 =?utf-8?B?T3kzZkJNYVZTejZDTVhyMmoxVEdneXJlOWR5T3ZGYTlsMExaU3FMRE5mNGhC?=
 =?utf-8?B?OGRKOFptRHN6SHBzVkFwejhJRXBEclc3cGtHeWN1QkNHYWtFZWI4dDBrTEk0?=
 =?utf-8?B?U0Q3QWp1SGRXY0dGamZBRGlkUis3VERNdE94SlhnSldhMWtRLzdjZE9nUlNx?=
 =?utf-8?B?Mld0eHBqa2MybU9ZTnpXRlFkd3hua0FFaHc5R0R6S1FCSHhZOTVia3drRndR?=
 =?utf-8?B?ZGFUdjNMbTZnT0RQTEs1OGQ0M3hPSWVSWnRyMGcxYWpVSDdDbGdEeFF1aXA1?=
 =?utf-8?B?T3pTYmNwTmtTZXFLZlNOMlZkcndROXNhaHJuLzIzUVp3bURtYVRzcUxraGpQ?=
 =?utf-8?B?SkxrT2Q1c29nd0ZkNUV5U3cvbitrMDY4SmhtVE9kUmZ2d3NQNElxcTFpL250?=
 =?utf-8?B?N0plMEpVV1o0Yko1Nmw3b05BZHptY2ZGRXM4cE1SM21EZkZ0c0JoeDBRcW05?=
 =?utf-8?B?aFdHUlhhdXMvNE16UzhpZ1NKQW1BZDVSSkt1YU96ZGFFNHQwMnR6elFuTkph?=
 =?utf-8?B?QTdJZnhBb0JiVXhGT21rYkIremI4amNqeVBOVzYyZEJFS29Tc085QnYybWNW?=
 =?utf-8?B?TlE3ZnY0STc0c2hENEFuYUpyMkN6ODdZa2owQ0xZSGFEQXhKYm1WVm5Fejcy?=
 =?utf-8?B?V2c3Sk9mb0ZQRit0dzVUYlJ6TFZlYkQvRXNod3NzNFNZWDl2YVRFRGF3TzND?=
 =?utf-8?B?cHRVVGk4WHd4eFl1Q0dabHg0Vlh3MmwvejhtQnQ0WWZXY2FtMjhpa0xoRFZF?=
 =?utf-8?B?MG9aNml2RUYvS2xsRGhBNnFPUGhsZU1XVW5JK3ZoTDVHUStkV2FWL1lldU0r?=
 =?utf-8?B?OWlYYkhkZkNMa256M0piVDBzRXZiN0swTiswRFJ0Zi8zM091N3V6blk5dVA0?=
 =?utf-8?B?QzBaS2tIclo2NElGNFpQUC9ZQ3pnNWs2RzdYK1k3WVg5M09jMUVRanErM1FD?=
 =?utf-8?B?WGVNMkNiS1kyRjNGQkZ4dXNROHJpdW9zOGxNNXdIK3BNYjhsSjltL0FpUEox?=
 =?utf-8?B?N3RHRS9scG1CSmh0aDJ3czBhM2M3ZWpkRFJrdUlYbUFPSFlZRHliaW5nZ3kv?=
 =?utf-8?B?THF4QVgrY2wwZTlhWlREZlNuNHZBYlJlT0w2cUQvdFRYMU40d0dSYmkvc28y?=
 =?utf-8?B?WG9PYzB4MHNSMmMrMzNKVDRvbXlBbGg0VnpraWhRL2p2N09MWUpJamFRdkRR?=
 =?utf-8?Q?3sJen/AMuBGzSWrztGN/DHeFSa3sOeSXkKcjczSDhjwaR?=
x-ms-exchange-antispam-messagedata-1: 2UO6tOGfdhtUCA==
MIME-Version: 1.0
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f7d43f-53ee-4a71-6088-08da17cd3661
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2022 12:58:57.3495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C2bNb+7DIVsSrGV2CTKdFcQxsKKQAqnxQrXPOz9tqYEt4sf4r04yvlwSlVlSvTfiw7XavUkx7gu2PGKfKmK3UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P251MB0294
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBBcHIgMDYsIDIwMjIgYXQgMDk6MDg6NThBTSArMDIwMCwgRmFicmljZSBGb250YWlu
ZSB3cm90ZToNCj4gTGUgbWVyLiA2IGF2ci4gMjAyMiDDoCAwMzo1OCwgVGltIEhhbW1lciA8VGlt
LkhhbW1lckBvcm9saWEuY29tPiBhIMOpY3JpdCA6DQo+ID4NCj4gPiBPbiBUdWUsIEFwciAwNSwg
MjAyMiBhdCAwNjoxODoxNVBNICswMjAwLCBQZXRlciBTZWlkZXJlciB3cm90ZToNCj4gPiA+IEhl
bGxvIFRpbSwNCj4gPiA+DQo+ID4gPiBPbiBUdWUsIDUgQXByIDIwMjIgMTI6MTU6MTQgKzAwMDAs
IFRpbSBIYW1tZXIgPFRpbS5IYW1tZXJAb3JvbGlhLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4g
PiBPbiBUdWUsIEFwciAwNSwgMjAyMiBhdCAwODoxOTowOEFNICswMjAwLCBGYWJyaWNlIEZvbnRh
aW5lIHdyb3RlOg0KPiA+ID4gPiA+IERlYXIgVGltLA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gTGUg
bWFyLiA1IGF2ci4gMjAyMiDDoCAwNTo1NCwgVGltIEhhbW1lciA8VGltLkhhbW1lckBvcm9saWEu
Y29tPiBhIMOpY3JpdCA6DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gT24gU3VuLCBBcHIgMDMs
IDIwMjIgYXQgMTI6MDM6MThQTSArMDIwMCwgRmFicmljZSBGb250YWluZSB3cm90ZToNCj4gPiA+
ID4gPiA+ID4gVXNlIGludGVybmFsIGJpbmQgYXMgZGhjcCBkb2Vzbid0IGJ1aWxkIHNpbmNlIGJ1
bXAgb2YgYmluZCB0byB2ZXJzaW9uDQo+ID4gPiA+ID4gPiA+IDkuMTYuMjYgaW4gY29tbWl0IDhh
ZGVhZWM4YWZhY2JjNjgwZWRlYmFlOTE1MjRmNjE0NDkyNmFjOTIgYW5kIHVwc3RyZWFtDQo+ID4g
PiA+ID4gPiA+IGRvZXNuJ3QgcGxhbiB0byBmaXggaXQgYW55IHRpbWUgc29vbjoNCj4gPiA+ID4g
PiA+ID4gaHR0cHM6Ly9naXRsYWIuaXNjLm9yZy9pc2MtcHJvamVjdHMvZGhjcC8tL2lzc3Vlcy8y
MzMjbm90ZV8yNzY4ODMNCj4gPiA+ID4gPiA+ID4NCi4uLg0KPiA+ID4gPg0KPiA+ID4gPg0KPiA+
ID4gPiA+IEhvd2V2ZXIsIEkgYXNzdW1lIHRoYXQgQlVJTERfQ0MgYW5kIEJVSUxEX0NGTEFHUyBp
biBiaW5kLm1rIHNob3VsZA0KPiA+ID4gPiA+IGFsc28gYmUgdXBkYXRlZD8NCj4gPiA+ID4NCj4g
PiA+ID4gSSBkbyBub3QgaGF2ZSB0aGUgaXNzdWUgYnVpbGRpbmcgYmluZCAoOS4xNi4yNiksIHRo
ZXJlIGxpYi9kbnMvTWFrZWZpbGUuaW4gc2VlbXMgdG8gYmUgYmV0dGVyIHdyaXR0ZW46DQo+ID4g
PiA+DQo+ID4gPiA+ICAgICAgZ2VuOiBnZW4uYw0KPiA+ID4gPiAgICAgJHtIT1NUQ0N9ICR7SE9T
VF9DRkxBR1N9IC1JJHt0b3Bfc3JjZGlyfS9saWIvaXNjL2luY2x1ZGUgXA0KPiA+ID4gPiAgICAg
JHtIT1NUX0xERkxBR1N9IC1vICRAICR7c3JjZGlyfS9nZW4uYw0KPiA+ID4gPg0KPiA+ID4gPiBQ
ZXJoYXBzIHdlIHNob3VsZCBiZSBwYXRjaGluZyB0aGF0IGZpbGUgaW5zdGVhZCBvZiB0aGUgY29u
ZmlnPw0KPiA+ID4NCj4gPiA+IFNlZSBodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9v
dC90cmVlL3BhY2thZ2UvYmluZC8wMDAxLWNyb3NzLnBhdGNoDQo+ID4gPg0KPiA+ID4gUmVnYXJk
cywNCj4gPiA+IFBldGVyDQo+ID4gPg0KPiA+DQo+ID4gWWVzLCB0aGF0IHJlaW5mb3JjZXMgbXkg
dGhpbmtpbmcuIFVuZm9ydHVuYXRlbHksIHRoZSBidW5kbGVkIGJpbmQgaXMgbm90IHVuemlwcGVk
IHVudGlsIHRoZSBidWlsZCBzdGVwDQo+ID4gYW5kIEkgaGF2ZSBub3QgZmlndXJlZCBvdXQgYSBn
b29kIHdheSB0byBnZXQgdGhpcyBkaWZmIGluIHBsYWNlLg0KPiA+IFBlcmhhcHMgc29tZW9uZSB3
aXRoIG1vcmUgZXhwZXJpZW5jZSBjYW4gc2VlIHRoZSBzb2x1dGlvbiB0aGF0IGlzIGVsdWRpbmcg
bWU/DQo+IA0KPiBNeSBiYWQsIEkgbWFkZSBhIHR5cG8gaW4gbXkgZmlyc3QgbWFpbCwgeW91IHNo
b3VsZCB1c2UgJChIT1NUQ0MpIGFuZA0KPiBub3QgJChIT1NUX0NDKS4NCg0KV293LCBob3cgbWFu
eSB0aW1lcyBkaWQgSSBsb29rIGF0IHRob3NlIGxpbmVzIGFuZCBub3Qgc2VlIHRoZSBkaWZmZXJl
bmNlISA7LSgNClRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhhdCENCg0KPiBQYXRjaGluZyBiaW5kIGlz
IG5vdCBuZWVkZWQuDQo+IEkgY2FuIHNlbmQgdGhlIHBhdGNoIG9yIGxldCB5b3UgaGFuZGxlIGl0
Lg0KDQpJIGFtIHN0aWxsIGNvbmNlcm5lZCBhYm91dCBteSBhYmlsaXR5IHRvIHZlcmlmeS0NCkkg
YWRkZWQgImNvcnJlY3Rpb25zIiBmb3IgQlVJTERfQ0ZMQUdTICYgQlVJTERfTERGTEFHUyBzbyB0
aG9zZSBtYXRjaCB0aGUgY2hhbmdlcyBpbiBiaW5kLm1rLA0KICAgICAgICAtREhDUF9CSU5EX0VY
VFJBX0NPTkZJRyA9IEJVSUxEX0NDPSckKFRBUkdFVF9DQyknDQogICAgICAgICsNCiAgICAgICAg
K0RIQ1BfQklORF9FWFRSQV9DT05GSUcgPSBCVUlMRF9DQz0nJChIT1NUQ0MpJw0KICAgICAgICAr
REhDUF9CSU5EX0VYVFJBX0NPTkZJRyArPSBCVUlMRF9DRkxBR1M9JyQoSE9TVF9DRkxBR1MpJw0K
ICAgICAgICArREhDUF9CSU5EX0VYVFJBX0NPTkZJRyArPSBCVUlMRF9MREZMQUdTPSckKEhPU1Rf
TERGTEFHUyknDQpidXQgSSBhbSB1bnN1cmUgYWJvdXQgdGhlIG90aGVycyB1c2VkIChCVUlMRF9D
UFBGTEFHUywgQlVJTERfTElCUywgTEZTXyopLi4uDQogICAgICAgICR7QlVJTERfQ0N9ICR7QlVJ
TERfQ0ZMQUdTfSAtSSR7dG9wX3NyY2Rpcn0vbGliL2lzYy9pbmNsdWRlIFwNCiAgICAgICAgJHtM
RlNfQ0ZMQUdTfSAke0xGU19MREZMQUdTfSBcDQogICAgICAgICR7QlVJTERfQ1BQRkxBR1N9ICR7
QlVJTERfTERGTEFHU30gLW8gJEAgJHtzcmNkaXJ9L2dlbi5jIFwNCiAgICAgICAgJHtCVUlMRF9M
SUJTfSAke0xGU19MSUJTfQ0KU2hvdWxkIHRob3NlIGJlIHNldCB0byBlbXB0eSBzdHJpbmdzPyBP
ciBpcyBpdCBzYWZlIHRvIGFzc3VtZSB0aGV5IGFyZSB1bmRlZmluZWQgYnkgZGVmYXVsdD8NCg0K
Pg0KLi4uDQo+IA0KPiBCZXN0IFJlZ2FyZHMsDQo+IA0KPiBGYWJyaWNlDQoNCi5UaW0NClRpbSBE
LiBIYW1tZXINCnRpbS5oYW1tZXJAb3JvbGlhLmNvbQ0KDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
