Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE571C48297
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 14:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30BB040124;
	Mon, 12 Feb 2024 14:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Wse31ZaguGp; Mon, 12 Feb 2024 14:00:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F07C4012E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F07C4012E;
	Mon, 12 Feb 2024 14:00:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55B2E1BF2B0
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 14:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42D6241A04
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 14:00:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OyOa6qyFTTzy for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 14:00:03 +0000 (UTC)
X-Greylist: delayed 861 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 12 Feb 2024 14:00:02 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 393E141B86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 393E141B86
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::722;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0722.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::722])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 393E141B86
 for <buildroot@uclibc.org>; Mon, 12 Feb 2024 14:00:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=fP5VeIgPAxzNxiGL0IIb1UBuVic4JpU7tOCxcap31Oo1zlsNoknnJB+/11Y/zAkB004Q6AsqTB4SM7dphy4r1MrakkBPsh468KT3cftKajwtsLV5fjXX6MprDPN9JNU5V9UqfzGl7snYdCtcDT6HWuuifr+wPBkiGbeXvKlkhqEjg9fUHL9LNXU2GG6JB+hEehaBydvXFDkQCwDzmWU75Gl4NNIJ39p0JnavApuMGszrEKhYVEHu4S7mJXuo+ypdU5mdE8XR8oG2EEgqayhqkB9TPmnXx1suXDZ3WObhvqpioNRL3av+3GSew3sAyrS/uIGCuYxPUQ4IGSHFZ8r5cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMJUJfH1eGWwlmccFaBZc94FQOsMnk1/Maf+cGu6xGM=;
 b=rFvbdIywWHI+59OlZ+lGp3WavvnxzBTHlI2UxulEcYWZT80xiOUwQe/YMg8X3FNBcnl7pupkvhuoLgTa6uJv70+gkNQJmmvVUs62DBex4LfpLS1tDNcf0/fuHkWDXDlxuSpsfZ8t0Xa6lPey9L0/BvW/QpCxI3o9yqoD8z4vOQ6DDoehvqNuMEgV8hFc7y+jvrnQzkHkExPRdj/kLvYhNysJACLGJQp8n+bY7pylVoE3fhwA9T1a7ENIWft8bGUotL6Jqw/88hnAgsxt3fDrN/IeH4xF8nefHTqmH/mqsUtT+0jue4sea8N2oyWQihIPqh6CvBawvTYCeOnNhsPIKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1474.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:188::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.31; Mon, 12 Feb
 2024 13:45:36 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5a70:14f9:1bc1:eaa]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5a70:14f9:1bc1:eaa%7]) with mapi id 15.20.7249.032; Mon, 12 Feb 2024
 13:45:36 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Adrian Perez de Castro <aperez@igalia.com>, James Hilliard
 <james.hilliard1@gmail.com>
Thread-Topic: [External] - Re: [Buildroot] [git commit] package/python3: bump
 version to 3.12.1
Thread-Index: AQHaW3KtmTjxMrJ//USEwbq/CKqbprEFqWOAgAAZrgCAAPfl4A==
Date: Mon, 12 Feb 2024 13:45:36 +0000
Message-ID: <PH1P110MB16037A595D457174BA0921489F48A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20240206222231.8950D87481@busybox.osuosl.org>
 <CALAjcgVd0VGDZCRpH3cpeikpNH0ZZOkV9c667cH6GQhMa8qtTg__833.063844923743$1707444930$gmane$org@mail.gmail.com>
 <pan$a29b1$235b0aec$c06a1ff$d5539253@ID-313208.user.individual.net>
 <CADvTj4pgwRLcuj10aJ19e+OHiwRacPf2OY2cu=v48GrzuFRWDw@mail.gmail.com>
 <20240212005226.GB2106578@igalia.com>
In-Reply-To: <20240212005226.GB2106578@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1474:EE_
x-ms-office365-filtering-correlation-id: c483b9d2-c130-4dbf-dbb5-08dc2bd0e48d
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QIFUrczoEHAUAk5S5EcCDkRh7OMOV+Kp8+HtwXOyzjUWA7nM6odBZHqPjSjmbKI750DWWYmVPppff8Q2f/EGVlQJ9sN7/bPLl1va1ShAl4uGhtnu/QkGIB+vb3LuCjAhngAb2hQso5a1mbSjLJvZ1nKvq17CsEk8VeSbc/sDPZhnEfS//6CyWKyGgbVfFaW4qQ8+/mIb8YS5TZx7zCgz4thQjndRlMp/eSLH93TPOYEscPYAKpeQucKeYLd361Jzm7f4Grg/drw2XuNCi4pY/gBv6HgUqFVUrKE5NMW5reTmR611ggagnibVP2e140lwEpEha8sj70GQXKSPWyf0GC7XiOpd6OxzWKPMqVihbzJnBScBxbD9BZRgm8NQ7wtFdyelXKPCnQ/m6vBLLOB8MS+Weu3625BjDp1vSDpLJTsUjSqKTuVb96CnTgxWxLQmdR0m2sNrsJ9ts8Gq4pGTGHr8zyvZ3ZoTfyUKPzW4XUL8JxhJMEblGqLJXwlzqxNI2cxQxuSpTKpOVCavZ1SILV9ZDGMU+IclLfmU04VKpcEiS8/GoZskjNaEcSkDqReJzIKiR4QWteB93VLDDkBXEQsNj5RWUQxFhyXLWZm4E5M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39830400003)(396003)(366004)(136003)(230922051799003)(230273577357003)(451199024)(64100799003)(1800799012)(186009)(76116006)(66476007)(66556008)(64756008)(66446008)(966005)(38070700009)(54906003)(66946007)(8676002)(8936002)(4326008)(52536014)(53546011)(83380400001)(38100700002)(26005)(86362001)(71200400001)(9686003)(508600001)(7696005)(6506007)(33656002)(110136005)(122000001)(5660300002)(41300700001)(2906002)(41320700001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGZybnVRaWYwZUd6d3RZK0Ftajg2Z1hIbi9WMVJJOWFrY2VvOEFCbHFRbjk5?=
 =?utf-8?B?VVdRZkhveS9JU3hmWDJYbjdweEhMUUlvN3JLU0gyeEk5WVN0ZEcrREdDU1g1?=
 =?utf-8?B?NitHdExXU2JmdEtIUVhSbElaem1VVXRLQW1UL1ZreitKTzJLQmUxVVZaa2xP?=
 =?utf-8?B?ejZFSC93RnM5dkNFVnhuOGR1MWNVSEFUclBZaEQ3dXQ3RnlIelBtQ0toNXRj?=
 =?utf-8?B?RGNWNVhqRDNSd2UrVVJNY2VxN2FjQzJ1L1BJU2U1RTVURFVKdXNnZktNd1dn?=
 =?utf-8?B?VDYzaXhHS3M0bjRYZVU0QXVlTWNZNzl2TGJLcmVEbGticTFMQnk4Vy9tWjN2?=
 =?utf-8?B?cDkvTkFYWHc1Q0dGV2pUNTZrRVc5VG03NXBQbEtnTXU4dFZnVzBvblkvU0FG?=
 =?utf-8?B?T280TFd0bFJKTEJYd1VOR1Y5djlaRGk1TmkyR0Z0cWVtVzhZYUZtQ0owR2U5?=
 =?utf-8?B?N0VkdzhreGxhQ3E1dnJubm9SSnM2dW4wOUEvWU1JL0tSaG9LVlBaU3M4QTZW?=
 =?utf-8?B?UHZ5eWxYNHFiZndpdmlTeEpPL25VaGZySXcwZG16enJBb21MSVVtQUtLU3lM?=
 =?utf-8?B?SUxPaUUwN280bDhRN3hTallWMG1Rb0UrdlZkbUtvN2NGRUh4M1MvMWk1TnhD?=
 =?utf-8?B?dktxcVl1NFdSU2V2UUhFNHRxS2FqWWFodjVHa1RMOTc4Q3pXbEFQSzEyRWh2?=
 =?utf-8?B?ODlsd3Q1RitucUo0MWg4S09PUzl1SkRaZittVGlQNEtRTWhmSlJFVjl2TGNZ?=
 =?utf-8?B?QzJTV3pRR0RuOXlHTE9wdHVvbGNENkFCNWJOYTVDY0RZWWRZamJGTjEwb21P?=
 =?utf-8?B?STNDWnJlMmV5MEgzL2h1eUFjOHRLc0Z4dC9JWE52emM3ZzBzTGROUERoYnp3?=
 =?utf-8?B?NlFFRWRQZTkvY3VwRFZLNkFYV2tRd0ZkQ2tvZDVraXRySW11TzlKUTJ5K010?=
 =?utf-8?B?V3V5cFlMUXBMVEtKNFE1NVRvaTZFRWczWGtydXJDSzFUQktQU0MwTnR4Y2N2?=
 =?utf-8?B?ZlpZUUJwbjg3TklOcU5zSGgxTU1LQzNUN0gwalgvZlNBSDFuWTJMZUtodHFm?=
 =?utf-8?B?ZlBTN1hucnlUR0VxWUs1WVBNYVIwQTRadWlHSFVYcHVNZUVzazFWbHIwcCtp?=
 =?utf-8?B?aFNzRkZZeTE3ZThZdmdwZDUrZGdJdktLcU4zMzJJRjdHY3o3aFlqTDNsVmVN?=
 =?utf-8?B?NmtTRW1rbFBxc3RlQlhoN0RTcGZTT1U4MHBmQzlSaEduRFV4Wlg3dlVIZVkv?=
 =?utf-8?B?aExtcDBtTGE5Vm1UbTRSWEIyenBYejlxemErWnR3NjBXcU15andhZXdSSjAr?=
 =?utf-8?B?SUJxR0JFTHRzOExVd1YxeVlzSDA3bTg1V2I5S1psUnJZbnM3SG8yNjhjeTFQ?=
 =?utf-8?B?M28waEYvZTFLSE56VzJ3czZhT0p1NmxrZWtySjQreEtiRCtKelNsSElwN0dI?=
 =?utf-8?B?TUhaWWF5U3BENEliU0lkMkQ3d3pBcVZ0ck1sZnE2cjNBTXhYMThrb3lpU29z?=
 =?utf-8?B?aXFLeE1jV1JmV1ZvRVM4YVgyQjdEbmpLOFNpc05IY1o4NlcyKzF1UGd0MUd6?=
 =?utf-8?B?VWdSbVp2RGorcit0bDY3djRuY3VhbDZubktNaXlSNEJNMHJLMnhnclcwUnZu?=
 =?utf-8?B?V05kMGVvOXVYamFQc0RxclJWYTFUZG1oM29Zd0pPVS96VnNKbm5wcDkyR1Jo?=
 =?utf-8?B?NUdGbDVqaWxOVGN1WERnZkNTbG1LOFlOd2ZuTDRQaTBqNHdGVmEydGxFa2l3?=
 =?utf-8?B?eEp2ZnBybnVrTVA2M3FObCtvTi9pRVU4QlZJWm5GNTVDVVZ1eEhnSmZicEdX?=
 =?utf-8?B?THgrZDgrN3E2VG9RUXpoeVd3RWF5ODFVYjlKY0dQU2VhKysyZTFRb1ZLaVNj?=
 =?utf-8?B?ZU1DREdvNXlFaGFESGpHZExCYTZaSE11VVY1cVlNaEtOa1lQRGVKY2dVa0xQ?=
 =?utf-8?B?by9NK3F3S2FMZUExajhsT1VnSHVaYXFWcTk3WGRUVFJkZ1NibTFFZ3M0MG5G?=
 =?utf-8?Q?uhAKt26RtIJ4CNtZEf5eg8XdtTjIfc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c483b9d2-c130-4dbf-dbb5-08dc2bd0e48d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2024 13:45:36.7201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1474
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMJUJfH1eGWwlmccFaBZc94FQOsMnk1/Maf+cGu6xGM=;
 b=NzKEjkWcN2DaSKPnPfnzjJY0rJgRZOgaNQStK8Oqb4q5k1982Ufw7tahsY6v/1pHsRLPkfc9I7pZyL7Fc7YabQ6Oa3+5OKcHzd1+/I0L4xXsLIEHGzARc3S3WzP+u27dfV/GIUMk+2NfLjZNFT16yu2wk04HsPoyvvSCUTPZPi+VMf0hkxzvmDmKKC+CbW8oPaIlSuWod4oCpDqcBtEPs6e8X8767fFTsTMLcCE0m7lthSgwdKrmSlUqV7emqiX8h96hyagtgs/OpjbpE3RNNUgHmo3qU3WDTyRS83Myoj3LxdKzp4WofLQrx+cxiOQGSzO55QbKK2iDbYj0P5msCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=NzKEjkWc
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - Re: [git commit] package/python3: bump
 version to 3.12.1
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 "buildroot@uclibc.org" <buildroot@uclibc.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYnVpbGRyb290IDxi
dWlsZHJvb3QtYm91bmNlc0BidWlsZHJvb3Qub3JnPiBPbiBCZWhhbGYgT2YgQWRyaWFuDQo+IFBl
cmV6IGRlIENhc3Rybw0KPiBTZW50OiBTdW5kYXksIEZlYnJ1YXJ5IDExLCAyMDI0IDQ6NTIgUE0N
Cj4gVG86IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPg0KPiBDYzog
QmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD47IGJ1aWxkcm9vdEB1Y2xpYmMub3JnDQo+IFN1
YmplY3Q6IFtFeHRlcm5hbF0gLSBSZTogW0J1aWxkcm9vdF0gW2dpdCBjb21taXRdIHBhY2thZ2Uv
cHl0aG9uMzogYnVtcA0KPiB2ZXJzaW9uIHRvIDMuMTIuMQ0KPiANCj4gSGksDQo+IA0KPiBPbiBT
dW4sIDExIEZlYiAyMDI0IDE0OjIwOjMxIC0wNzAwIEphbWVzIEhpbGxpYXJkDQo+IDxqYW1lcy5o
aWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToNCj4gPiBPbiBGcmksIEZlYiA5LCAyMDI0IGF0IDk6
MTHigK9BTSBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PiB3cm90ZToNCj4gPiA+DQo+ID4g
PiBBbSBUaHUsIDggRmViIDIwMjQgMjE6MTQ6NTIgLTA1MDAgc2NocmllYiBKYW1lcyBLbmlnaHQ6
DQo+ID4gPg0KPiA+ID4gPiAgICAgICAgIGltcG9ydCBtYXRoDQo+ID4gPiA+ICAgICBJbXBvcnRF
cnJvcjogL2xpYi94ODZfNjQtbGludXgtZ251L2xpYm0uc28uNjogdmVyc2lvbiBgR0xJQkNfMi4z
OCcNCj4gPiA+ID4gbm90IGZvdW5kIChyZXF1aXJlZCBieQ0KPiA+ID4gPiAvYnVpbGRzL2J1aWxk
cm9vdC9vdXRwdXQvYnVpbGQvcHl0aG9uMy0zLjEyLjEvYnVpbGQvbGliLmxpbnV4LQ0KPiA+ID4g
eDg2XzY0LTMuMTIvbWF0aC5jcHl0aG9uLTMxMi14ODZfNjQtbGludXgtZ251LnNvKQ0KPiA+ID4N
Cj4gPiA+IEhpIEphbWVzLA0KPiA+ID4NCj4gPiA+IHNhbWUgaGVyZSBvbiBEZWJpYW4gMTIuNC9i
b29rd29ybSwgdHJ5IHRoaXMgcGF0Y2g6DQo+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vYmt1aGxz
L2J1aWxkcm9vdC9jb21taXQvDQo+ID4gPiBkY2E4YjViZWU3NzQyZmZlZGY4MWEwMjdhZmZhZGQ0
YjdlMThmYzNmDQoNClRoaXMgY2VydGFpbmx5IGF2b2lkcyB0aGUgaXNzdWUgYnkgbm90IHJ1bm5p
bmcgdGhlIHByb2JsZW1hdGljIGNoZWNrLiBJIGFtIGEgbGl0dGxlIGNvbmNlcm5lZCBhYm91dCB0
aGUgcm9vdCBjYXVzZS4NCg0KSSBoYXZlbid0IGhhZCBhIGNoYW5jZSB0byB0ZXN0IDMuMTEsIGJ1
dCBmcm9tIHRoZSBkZWJ1Z2dpbmcgSSBkaWQgb24gRnJpZGF5LCBJIGtub3cgdGhhdCB3aGVuIHRo
ZSBob3N0IHB5dGhvbiBpcyBleGVjdXRlZCB0byBjaGVjayB0aGUgYnVpbHQgbW9kdWxlcyBmb3Ig
dGhlIGZvcmVpZ24gcHl0aG9uLCBiZWNhdXNlIFBZVEhPTlBBVEggaW5jbHVkZXMgdGhlIHBhdGgg
dG8gdGhlIGZvcmVpZ24gImJ1aWx0aW4iIGxpYnJhcmllcyBhbmQgYmVjYXVzZSB0aGV5IGFyZSB0
aGUgc2FtZSBhcmNoaXRlY3R1cmUsIHRob3NlIGxpYnJhcmllcyBnZXQgdXNlZCBpbnN0ZWFkIG9m
IHRoZSBvbmVzIGZyb20gdGhlIGhvc3QncyBidWlsZC4gU28gdGhlIGhvc3QgcHl0aG9uIGF0dGVt
cHRzIHRvIGxvYWQgYW5kIGV4ZWN1dGUgbGlicmFyaWVzIHRoYXQgbWF5IGhhdmUgYmVlbiBidWls
dCBmb3IgYSBkaWZmZXJlbnQgbGliYy4gSSBmb3VuZCBzaW1wbHkgZHJvcHBpbmcgdGhlIGZvcmVp
Z24gcHl0aG9uJ3MgcGF0aCBmcm9tIFBZVEhPTlBBVEggY2F1c2VkIHRoZSBzY3JpcHQgdG8gZXhl
Y3V0ZSBmaW5lLCBidXQgSSBkb24ndCBrbm93IHRoZSBmdWxsIHJhbWlmaWNhdGlvbnMgZm9yIGRy
b3BwaW5nIHRoYXQgcGF0aCBhcyBwYXJ0IG9mIFBZVEhPTl9GT1JfQlVJTEQgd2hpY2ggaXMgdXNl
ZCBpbiB0aGUgYm9keSBvZiB0aGlzIHByb2JsZW1hdGljIG1ha2UgdGFyZ2V0IGFuZCBhIGZldyBv
dGhlcnMuDQoNCj4gPg0KPiA+IFllYWgsIHRoaXMgZml4ZXMgdGhlIGlzc3VlIGZvciBtZSBhcyB3
ZWxsLg0KPiANCj4gU2FtZSBoZXJlIG9uIEFyY2gsIEkgbmVlZGVkIHRvIGFwcGx5IHRoZSBjb21t
aXQgdG8gZ2V0IGhvc3QtcHl0aG9uMyBidWlsdC4NCj4gDQo+IENoZWVycywNCj4g4oCUQWRyacOh
bg0KPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBv
cmdhbml6YXRpb24uIERvIG5vdCBjbGljaw0KPiBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVu
bGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlDQo+IGNvbnRlbnQgaXMg
c2FmZS4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
