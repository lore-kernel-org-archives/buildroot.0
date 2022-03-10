Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C76C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 13:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C95184737;
	Thu, 10 Mar 2022 13:47:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GRhxHY688P3Y; Thu, 10 Mar 2022 13:47:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A459484730;
	Thu, 10 Mar 2022 13:47:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E7131BF386
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 13:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D46C60FDB
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 13:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oyWZlBa-7BKX for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 13:47:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E21E660B4E
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 13:47:28 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-279-WNtWEPmENgGh9Vi9K2574A-1; Thu, 10 Mar 2022 13:47:25 +0000
X-MC-Unique: WNtWEPmENgGh9Vi9K2574A-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Thu, 10 Mar 2022 13:47:24 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Thu, 10 Mar 2022 13:47:24 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Mathieu Mirmont' <mat@parad0x.org>
Thread-Topic: [Buildroot] [PATCH 1/1] fs/common.mk: use find instead of shell
 glob patterns
Thread-Index: AQHYNGk1T+9nJKOaGEy6uS9IhKyXC6y4bnOAgAAN+YCAAAD6QIAACZyAgAAaiqA=
Date: Thu, 10 Mar 2022 13:47:24 +0000
Message-ID: <2c3fb2b6d5c54261a4e0a8538ec6ea3c@AcuMS.aculab.com>
References: <20220310101826.GA2353@parad0x.org>
 <34cb1e87c9ff49b897ae79c543278d03@AcuMS.aculab.com>
 <20220310113310.GA9122@parad0x.org>
 <35a9243ae72142ac8380675e9caa0fcf@AcuMS.aculab.com>
 <20220310121105.GB11974@parad0x.org>
In-Reply-To: <20220310121105.GB11974@parad0x.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 1/1] fs/common.mk: use find instead of shell
 glob patterns
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogTWF0aGlldSBNaXJtb250DQo+IFNlbnQ6IDEwIE1hcmNoIDIwMjIgMTI6MTENCj4gDQo+
IE9uIFRodSwgTWFyIDEwLCAyMDIyIGF0IDExOjUyOjA4QU0gKzAwMDAsIERhdmlkIExhaWdodCB3
cm90ZToNCj4gPiBJdCBpcyB3b3J0aCBjaGVja2luZyB3aGV0aGVyIERlYmlhbiBoYXZlIGNoYW5n
ZWQgdGhlIGJlaGF2aW91ciBvZiBkYXNoDQo+ID4gb3Igd2hldGhlciB0aGV5J3ZlIGp1c3QgY2hh
bmdlZCB0aGUgZGVmYXVsdCByb290IHNoZWxsIHRvIGRhc2guDQo+IA0KPiBUaGV5J3ZlIHN3aXRj
aGVkIHRvIHRoZSBpbnRlcm5hbCBmbm1hdGNoIGltcGxlbWVudGF0aW9uIG9mIGRhc2ggWzFdIGlu
DQo+IHRoaXMgY29tbWl0IFsxXS4gQmVmb3JlIHRoYXQgdGhleSB3ZXJlIHVzaW5nIGZubWF0Y2go
MykgZnJvbSB0aGUNCj4gZ2xpYmMuDQo+IA0KPiBbMV0gaHR0cHM6Ly9zYWxzYS5kZWJpYW4ub3Jn
L2RlYmlhbi9kYXNoLy0vY29tbWl0L2Q3YjEyNjllZWViNTc0OWNjYzU3N2Y2ZTAxZGZjY2MyOTE2
YjAxMzANCg0KSG1tbToNCg0KICAgIEV4dGVybmFsIGltcGxlbWVudGF0aW9ucyBjaGFuZ2UgaW4g
c3VidGxlIHdheXMsIGxlYWRpbmcgdG8gaGFyZCB0bw0KICAgIGRpYWdub3NlIGJ1Z3MuIEl04oCZ
cyBiZXR0ZXIgdG8gcmVseSBvbiB0aGUgYnVpbHQtaW4gaW1wbGVtZW50YXRpb24NCiAgICBpbnN0
ZWFkLg0KDQpBcyBkb2VzIHJhbmRvbWx5IGNoYW5naW5nIHRoZSBpbXBsZW1lbnRhdGlvbiENCg0K
QW55b25lIHNpZ25lZCB1cCB0byB0aGUgZGViaWFuIGxpc3RzIHRvIGNvbW1lbnQ/DQoNCglEYXZp
ZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQg
RmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4
NiAoV2FsZXMpDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
