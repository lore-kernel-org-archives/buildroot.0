Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C2CC54EBE
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 16:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FED74016F;
	Thu, 12 Jan 2023 16:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FED74016F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id leYlCCBYx0HZ; Thu, 12 Jan 2023 16:55:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFE1E40154;
	Thu, 12 Jan 2023 16:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFE1E40154
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A9841BF3CE
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 16:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E70B060AB9
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 16:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E70B060AB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s1f4jLarVtJw for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 16:55:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7629C605F6
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2067.outbound.protection.outlook.com [40.107.249.67])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7629C605F6
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 16:55:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ub71PBmVBCjG4Ryj5q+FNBhw/I6YGuI7ujK+5UGmxr34P9bZ4rrAJLinOKofVDEVy4Bmt3Vsvq1+7aCr35LrGdS2+PHCvE1MH1xWz8tk7XK3sULPxJOuImjt1wxGP+lHZ7AeBcS8E0iT1DHyTecJyrl4PHZtTMz/mU5noEsLgbNuKWcNdfc/vt34rAsyYCSk/NlN3oM+oAmK1SnnXFGWLwY64WXX95hXSAu9sg9aoY2LPsi8g8I1wfsmAcG3qdhTrwsGWgIuP82l2OMIXwZYKzwmmlcplHYEnWAxWIDpXvNpoXjP1ceMMEt+VQyOqVTFdOGsC1DyR5K4MawMhq3GVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oCugCJ20+4zCHIYjm3NSvy6o1QLdtzpuG4dIAIpLQ4=;
 b=AW6gKJMrap3kgK3JsUYNU/qdnP6Szt/mEe3roQkkbi1/sSD9/EloIKEJGZjBHJ89s4xdcRv2ceMtPtQMFwht83uhhA86fKcVjZzL51LtgU4D5Ge0cveqQtS2ipcrmNVERRalr/uVVpk5N/5PUnWaote2K5GQ4ccjCQt5i4JHtLve8U2X2lkeHAou6c4e/9EGRaEMiPW0EGCQer9Ii58oxOJnPwVQwwxsrVTu4UEqgLpYZDvOVCTXzGSuXgiNfHR28kKXXMXlSo01/DEClS0RimOcuM5MEYH2AZFJx6o4a8TVUlWNqKlRB6+Usb5XTT6GPB9NF5NKadPZh68F78Gcow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4bf::21)
 by DU0P251MB0673.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:329::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 16:55:25 +0000
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::7431:a93b:4795:8236]) by AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::7431:a93b:4795:8236%8]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 16:55:25 +0000
From: Nicolas Carrier <Nicolas.Carrier@orolia.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>, "arnout@mind.be"
 <arnout@mind.be>
Thread-Topic: [Buildroot] Saving
Thread-Index: AQHZJp0AKDqn2CXwLUCcusXpbKBVSa6a9K2AgAALbYA=
Date: Thu, 12 Jan 2023 16:55:25 +0000
Message-ID: <c1bf5e85e6cb54e5cd95f03622d58948c35d70f1.camel@orolia.com>
References: <e8d2f77866056eea5e9e928ce07952d7cf5ac124.camel@orolia.com>
 <ffe43fbb-135f-1657-80ee-c5cc61079948@mind.be>
In-Reply-To: <ffe43fbb-135f-1657-80ee-c5cc61079948@mind.be>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3-1+deb11u1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4P251MB0612:EE_|DU0P251MB0673:EE_
x-ms-office365-filtering-correlation-id: 6acb99d9-c2c8-46a3-6a81-08daf4bdcd22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cRwunSaYI55AHKEIsUnZ8zpo9rMVxJVeqyJsZq8ovtxJFfJJLJ5ud2aBVLfUi+ZW7UexOGlL693FGh3+Ap3iC7alEy1o5SRt1pyJht2CBUcIedmJnA8aNCuko6uYMSOBcat9Vlc5WYN2D+eHNF3SZrnIh9RYo3bXflWI3AG5csGHyKKIIGX9uxauPaGbPIGvqjCNn/EDAOXZr0tC/IbBnrTMa6jgY//qbE4+INjrxZClUIn2nh+WpevNWPJ7ayiTolg74uYFpzEWR21wCwhv03BE5oECYVsvCcrdC+cBkI+kX7D2JP6+exByruQhDljlt8fkWs+ah+mbEcyhlALAFLgwHTVwItkRllX3YQsx1D4J38P39ASq3MxHaetNAZ23HGGnbQWgt9Y+xM13JO6mR/0Sd89LF8jt1I0UfPBoh3dD5fadcoRVzVEUGo6nF0iZ2zz6yc0HrsmJa+S60Ws3IINVkNZfe69RB0UOUVlhOtwmpcBHBhSLxlhWDfK0iJKogBDrdnnDH6oQ2VIa8PSO478gAp5ihYRfLLqyvNVP5+/CNpAAPqhXT2zPHgFnvpxP20FC99jKUBMXivelD2OhJ7/CdeuZ73MnrQn3Dq061oc2W48lr07NG0OvAryZlPzDRqSzfb+RBMEcpUOBlvci7f1/AwE3rlaSESpkyWHhXMlZjLtsPC+jIJMMdLU5FWkhqbKNtEzq+rUF6lLuCTkFxYxAXDSVL3QAeoLEW2za2RM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4P251MB0612.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(346002)(366004)(136003)(396003)(376002)(451199015)(41300700001)(316002)(76116006)(36756003)(110136005)(66556008)(64756008)(2616005)(66446008)(66946007)(8676002)(66476007)(86362001)(91956017)(38070700005)(8936002)(122000001)(38100700002)(83380400001)(5660300002)(71200400001)(2906002)(6506007)(53546011)(6486002)(966005)(6512007)(186003)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c09Qbkp3RXdVWk9HM1ZHTVVlVWZzSFVYL2dnNXpTNmIwMnBLWEpIbnBrdDc0?=
 =?utf-8?B?S3RDUUVXMFNCbXJPZjRiOG9JVW9ZYmozaTVlWnhiTU4waGxJbnRsdzBXbE95?=
 =?utf-8?B?bm1PMFB0S1ZKM3Jtelc4NU1xZE5nOFJ1VXhWZmFOQnlDejlUc1pJQVQzTnNI?=
 =?utf-8?B?UElIcVo2a2tUZlBsMW8xVk9FZWhEMkJ3MS9ROGM2aTJlVndoUHhWaVhnR3NP?=
 =?utf-8?B?c1B2aFF4Ull3YnJtTUFwWFROZ29mdUlHWTFFWUdFWnV2dUpGSDZkWFJZTEhX?=
 =?utf-8?B?MHlQVkdTRzZVWjBmT1JHNFM5VkpyZ1ZxeGhGcC9hL0FHa1hTUHdYaWJwSUs1?=
 =?utf-8?B?bjFEdDlYdGFFaElxSTdPUGQ4RWJlMGVvenZyZlBtVGRoakVIK2ZQSHBYK0Ir?=
 =?utf-8?B?cmdkNElVdFp0djdYdjQ2TjFzOUw0b2FEVmNUZVN4aDR1OEhjYlYzY2pTNVBL?=
 =?utf-8?B?TXZraFlmcEpBcy81KzYzM2FpMkJtUmZtbkN5ZUREYzRPUWtvNjhmU0ZsS3BQ?=
 =?utf-8?B?Si9ram1ZdEg0SExWVE5IQSt3Y3hoSXcvd0R1NEo1eGs5QjU4VzZtakRUaVBy?=
 =?utf-8?B?RjNLbkI5L3Nwc1pNMWp2NkJSaTdsL2s2VlIxSEdKQ1FQaU5zNG5TQ2VHOVRG?=
 =?utf-8?B?TnFFZzYzU1BybTNMRzUra3IyZGNsUytRanlpaGJ4aUFwRTNnUktNdlkxQ0t5?=
 =?utf-8?B?QW92K0E1dFVSWmNzRGxMdXdQdFhqWitLV3JvSjlqSDB1YjU3eWF0alg3QTdk?=
 =?utf-8?B?T1FnRTJ2ZW9RMHpGbTZUUXFwN3Q1ZjFYdDhtbkp1ajBGa09rYldFbWUwVmty?=
 =?utf-8?B?aU1TRmtQWEZISVRBR2RpSFQxYTZGZWpudmhmbVY2c0Y3Z1hOajBHN1JOekRP?=
 =?utf-8?B?WEdGeGtTNEpVanBnZXZqMFVjeDlCcmRKLzVtMDJoQ1FUbHNzdzJGWXltWVpl?=
 =?utf-8?B?enY3d2hkQkNJRGJKYnovb0lSVm9sUS95VjM5dW9OU2oyVm5wNWNaRC9Ea0tE?=
 =?utf-8?B?WFYxMmh1TVdBejBWYStaY2dNYWt6eUdIRW9JNmtSdER5T1FBSTBmNUZJUlFx?=
 =?utf-8?B?b2dUWEp0V0tPVDdtUjFBYTNvdVFwTDJXVFExMkVuWGZzMlVZNjlhT1Z5RlhH?=
 =?utf-8?B?RlFCQWJiQ2RSWFEwM3BhRDZ1MWZqUlFISnNzYitoTHRCUkdkV1NIQ3BMa0Q1?=
 =?utf-8?B?Yy9QQ0hUUEFSZHM1Mm5VL1FGcWdsVlVnZWJQVHBOSXZOSi9DalVpeGt4S2FR?=
 =?utf-8?B?aHdxNjBScDVPNzRlc0JSVU5zTVlOUEk3YjZEN1lQZC8vL0ZydzdHUjlucjdO?=
 =?utf-8?B?N2N4YUhxRlo5dW44SWV5cWFjOFhYUDF3RHFRNGZVc3RjZXZGU1pFK0F6STFh?=
 =?utf-8?B?Mm5nNElSU3A3SDZhRHA1VGphRkE3UStXOVptd1ZjNUw2YXBsa29sK3BsRnN3?=
 =?utf-8?B?VHowWkp6N2dSNzdZZVRIdWw0Mjh0RXZoQmhBdHV5T0JqYmFxL0tZaFRYWmFF?=
 =?utf-8?B?MEJyS2wxdHFVaHNSYlRHZG1PQ29xNkRwVlBvN0JERXFmL3gzYmMxQW9YMlE2?=
 =?utf-8?B?OHFyYjBOL0swUXVONkJqRlhQdU9WVFZzbWVHd3BXc3E2L0JTdHV6elBMRHVt?=
 =?utf-8?B?Si8vUjhQckNZc0R3YUtOL0k1RUtKNGdXYktpTTZCbnAxcVM1RnA5NzdFUGpt?=
 =?utf-8?B?VVZJTDRZTWxHd0ZaSi8xVU9VeGtxU1hVRUx1QUtWbWNkelMzQ21UK1VvSC91?=
 =?utf-8?B?T3hPU3lSbWptSktCQUZjSXdVUGliUGVrR2NteTBPYjJnU2t6OFh0dGZ3L3dr?=
 =?utf-8?B?ODB3ZmFqWEVWVDRDb0hDSWJxWUVrblNQSEZCYm1MdlZQRUQxRlQ2VXhsN0lT?=
 =?utf-8?B?YkdzTFdXVUhqVkxzTnRLY3pWU0NSemJkOEcrcTJFUjlJQ0I5bGdNKzdzeGpB?=
 =?utf-8?B?NUxzMTI5cW1lbDFsRzNtamppb2ZKUTZVK0ZzVHFjNnJlR1VGazlYa1pYdlc1?=
 =?utf-8?B?Mm1BaVBidTlMMHJQeVpYUGY4Rk1sNDhCako3MjU3WjBSa1FjdVVXKzUwUnU3?=
 =?utf-8?B?RDlRRFJwZDZ4bHJoaFpjcWYyTEI3cnNwOFdOMStQbDhidmNJQTlOTHJYS3BW?=
 =?utf-8?B?Z2tZUjZKS3pqQ0c5VDd5S010UnlqQnErQWNDV1V2WXhmK2NRUEJCUFEwbkd6?=
 =?utf-8?B?WlFIdndTTDh0bitoWWRFbmozVm9mbU5URW9OTCsxQzBGcWRxSWUyVmIyQlRh?=
 =?utf-8?Q?q2OydJyTT9yculKi63s+r1Rv9+WMjXvO0cCcfCjiiA=3D?=
Content-ID: <A6B0954E4E140A43BC088DBED5E52695@EURP251.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6acb99d9-c2c8-46a3-6a81-08daf4bdcd22
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 16:55:25.3458 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nY91CujWaqB9xRQccFUBx777WPVRLDnLLzc141DrGHLnKtQ82BZsR1bmQ/THolU1ocYjKgt7CBthRf5L5kM6uUyl6a6i+F690OZ6mPMTa4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P251MB0673
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orolia.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oCugCJ20+4zCHIYjm3NSvy6o1QLdtzpuG4dIAIpLQ4=;
 b=Rm8hdrn22rXDoJl9ORscCmkPhS01RQ6bOG6bAtFI4LEAF2CaBH26Lp6jZNyLzYyMlxbADrWt6+i7Z8kL7C+8wM35U91N0aK4GWDkf382XcqgO5s7nF+uKgaNGkdWpuXXwLT6AuP/AkaZii1/EFIK4moErmMpB5ym6BCVSeA4jPI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=orolia.com header.i=@orolia.com header.a=rsa-sha256
 header.s=selector1 header.b=Rm8hdrn2
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
Subject: Re: [Buildroot] Saving
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rmlyc3Qgb2YgYWxsLCBzb3JyeSBmb3IgdGhlIHBvb3IgdGl0bGUsIEkgcHJvb2YgcmVhZCBteSBl
bWFpbCA0IHRpbWVzIGJ1dCBmb3Jnb3QgdGhlIHRpdGxlIDopDQoNCj4gT24gMTIvMDEvMjAyMyAx
Njo0NiwgTmljb2xhcyBDYXJyaWVyIHdyb3RlOg0KPiA+IEhlbGxvIQ0KPiA+IEknbSBoYXZpbmcg
YSBsb29rIGF0IGxlZ2FsLWluZm8gZ2VuZXJhdGlvbiwgdGhlIHNvdXJjZSBzYXZpbmcgc3RlcCBz
YXZlcyBuZWl0aGVyIGxvY2FsIG5vcg0KPiA+IG92ZXJyaWRlDQo+ID4gcGFja2FnZXMuDQo+ID4g
DQo+ID4gVGhpcyBpcyBhIHByb2JsZW0sIGJlY2F1c2UgaXQncyB0aG9zZSBwYWNrYWdlcywgd2hl
biBmb3JrZWQgZnJvbSBPU1MsIHdoaWNoIHdvdWxkIHJlcXVpcmUNCj4gPiBwdWJsaXNoaW5nDQo+
ID4gdGhlIG1vZGlmaWVkIHNvdXJjZXMuDQo+ID4gSXMgdGhlcmUgYSB0ZWNobmljYWwgLyBwaGls
b3NvcGhpY2FsIC8gd2hhdGV2ZXIgcmVhc29uIGZvciBubyBzdXBwb3J0aW5nIHRoZW0/DQo+IA0K
PiDCoCBJIHRoaW5rIHRoZSByZWFzb24gaXMgcHVyZWx5IHRlY2huaWNhbDogZm9yIHRoZXNlIHBh
Y2thZ2VzLCB3ZSBkb24ndCBoYXZlIGENCj4gdGFyYmFsbCBhdmFpbGFibGUgdGhhdCBjYW4gYmUg
cmVhZGlseSB1c2VkLiBTaW5lIHdlIG5vdyBoYXZlIHBvc3RfcHJvY2Vzc19yZXBhY2sNCj4gaW4g
c3VwcG9ydC9kb3dubG9hZC9oZWxwZXJzLCBpdCdzIGFjdHVhbGx5IGZhaXJseSBlYXN5IHRvIGFk
ZCB0aGlzIGZlYXR1cmUuDQo+IA0KDQpJdCBpcyBub3QgY2xlYXIgdG8gbWUgeWV0IGhvdyBJIGNh
biB1c2UgcG9zdF9wcm9jZXNzX3JlcGFjay4gSSdsbCB0cnkgdG8gZ3JvayB0aGUgY29kZSB0b21v
cnJvdyBhbmQNCnNlZSBpZiBJIGNhbiB1bmRlcnN0YW5kIHRoYXQuDQoNCj4gwqAgQSBzZWNvbmRh
cnkgcmVhc29uIGlzIHRoYXQgdGhlIGlkZWEgZm9yICJsb2NhbCIgcGFja2FnZXMgd2FzIHRoYXQg
dGhleSdyZQ0KPiBwcm9iYWJseSBwcm9wcmlldGFyeS4gSG93ZXZlciwgaW4gcmVhbGl0eSB0aGVy
ZSBpc24ndCB0b28gbXVjaCBjb3JyZWxhdGlvbg0KPiBiZXR3ZWVuIGRvd25sb2FkIG1ldGhvZCBh
bmQgcHJvcHJpZXRhcnkuIEFuZCB3ZSBhbnl3YXkgaGF2ZSBGT09fUkVESVNUUklCVVRFIHRvDQo+
IGhhbmRsZSB0aGlzLg0KDQpZZXMsIHdlIGhhdmUgYSBtaXggb2YgcHJvcHJpZXRhcnkgYW5kIG9w
ZW4gc291cmNlIHBhY2thZ2VzLCBmb3IgZXhhbXBsZSwgbGludXhwdHAgb3IgdGhlIGxpbnV4DQpr
ZXJuZWwsIGZvciB3aGljaCB3ZSBoYXZlIGEgY291cGxlIG9mIHBhdGNoZXMgd2UnZCBsaWtlIHRv
IHJlZGlzdHJpYnV0ZSBwcm9wZXJseS4NCg0KQnV0IGV2ZW4gZm9yIHByb3ByaWV0YXJ5IG9uZXMs
IGlmIHRoZXkgY291bGQgYmUgaGFuZGxlZCAicHJvcGVybHkiIHRoYXQgaXMsIHdpdGggX1JFRElT
VFJJQlVURSA9IE5PDQpiZWluZyBob25vcmVkIGFuZCBhdm9pZGluZyB0aGUgZ2VuZXJhdGlvbiBv
ZiBhIHdhcm5pbmcsIHRoYXQgd291bGQgYmUgaGVscGZ1bCB3aGVuIHdhbnRpbmcgdG8gbGlzdA0K
dGhlIHJlYWwgbGVnYWwtaW5mbyB3YXJuaW5ncyBpbiBvcmRlciB0byBmaXggdGhlbS4NCg0KPiAN
Cj4gwqAgUmVnYXJkcywNCj4gwqAgQXJub3V0DQo+IA0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIGZv
ciB5b3VyIGFuc3dlciENCg0KPiANCj4gPiBJZiBub25lLCBJJ2QgYmUgd2lsbGluZyB0byBkZXZl
bG9wIHN1cHBvcnQgZm9yIHRoYXQsIGlmIGFueW9uZSBoYXMgcG9pbnRlcnMgYXMgaG93IHRvIHBy
b2NlZWQgLw0KPiA+IHdoZXJlIHRvIHBhdGNoIC8gbWlzdGFrZXMgdG8gYXZvaWQsIGRvbid0IGhl
c2l0YXRlIHRvIHNoYXJlIDopDQo+ID4gDQo+ID4gRlRSLCBJJ20gdXNpbmcgYSAobGlnaHR3ZWln
aHQpIGZvcmsgb2YgMjAyMi4wMi4NCj4gPiANCj4gPiBUaGFuayB5b3UgYnkgYWR2YW5jZSENCj4g
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+IGJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QNCj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZw0KPiA+IGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdA0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
