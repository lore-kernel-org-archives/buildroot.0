Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42FADC433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 19:17:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EFFA600CD
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 19:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7EFFA600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xes-inc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E3BF40015;
	Thu,  4 Nov 2021 19:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMZwuYD7FUWu; Thu,  4 Nov 2021 19:17:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27D9A40018;
	Thu,  4 Nov 2021 19:17:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 91D0E1BF30B
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 19:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7189340018
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 19:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XuRMdUgP3R2X for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 19:17:04 +0000 (UTC)
X-Greylist: delayed 02:00:32 by SQLgrey-1.8.0
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0728.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::728])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A2C240015
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 19:17:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=EBU4TRz5k+fK9Z8CGu17/kCS3zlmLn++3fv7As4G8/2mH1GEcVWkz6knJwMVP4MN1mreRjcTPPc3sVDz/oANIUX5meYRa/cCjz4LowKdo3mp8QPFabJyOv3z4KL8lk4R8w00Azg6GSa7qi7j/59orVuuXw30+5JgU+U8AfaWoRG5tq5pEEntcVE05aOgFuLzvMo0S3xm3e0e+YJAsfXemCS6I/pMB7GeJJ4poqS2Mra2MO2pKRaRm/OPbW2+bYZprdcpA4/KioSjqmC8I1c2RH24ZNF+dUf5iIMi1DKEJ00YhL8zbgQo5IkKzhFkV1GV75DRUC55cBDDYTISf4oazw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=+9GJBsKmRN9tbnRyhwKszc97vZ3xeSk/tDZZ4EYQvDs=;
 b=pMMX34tmdp3dyoakyyDgOLyk5yb30h7SoIRYagIe8JdcF80BIZvksSmZl1cURQTU2XwRou+MoLilnN2UT1j5gNSKdP56njLuwVgTtypLiR9ivPdEITMDwp3vYdlGht8Yo9ZAg40rCZ6lif7gYgD0g2yp5buBlqtMSyeaqhYNRhHcvra64sUHUHaPMqkBLN1A2zuPmx7Ze+JbOak380oOzkj/CvIQib3jU2RtXE+tXiXb5N9R48hTefmnQtyAuk1h12KB1NTFuelfzOwF+HpG8s+SXeqg1unS0/PUXeQeoDCvNxFm+qjed6mUp6UUoAekV3Le0MBFPKeQBH+Mb5ydeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9GJBsKmRN9tbnRyhwKszc97vZ3xeSk/tDZZ4EYQvDs=;
 b=enEA24PEMyYDqiSRgJnzjjetwp7PzVei/mpXRPP/8bkcNmkq2z5M5nHdJkoZEAijLRtdsYRoQ6GjCK+PYpKQw19Jrekla36f3GSuiRghqlo3laokEQ2WSQzk1xWPcHVta7ict0tKUnVvDtPXV1PulOPYr9PbgrepbtgAqTiBsf/QYwkChHXYvOYLIkdNn0LYoVVMyVXkkel7Lt3vbk3amKQZvu6l6IgYKJPKeJ9O2ZjQo6+0auzYZi4j5elZV2w/HmhuIdiBcYC8azhTE4KUbCFbOVc3rToI9a51A63z5DoKSBBl/fv2m+J01CdokZNDu9WBSLzHAkCS7/6465jLRQ==
Received: from BN1P110MB0937.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:132::16)
 by BN1P110MB0788.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:132::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Thu, 4 Nov
 2021 14:40:39 +0000
Received: from BN1P110MB0937.NAMP110.PROD.OUTLOOK.COM
 ([fe80::b822:a073:9069:368b]) by BN1P110MB0937.NAMP110.PROD.OUTLOOK.COM
 ([fe80::b822:a073:9069:368b%5]) with mapi id 15.20.4649.017; Thu, 4 Nov 2021
 14:40:39 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Tal Lubko <tallubko@yahoo.com>
Thread-Topic: [Buildroot] nvidia kernel module build fails
Thread-Index: AdfRietlUJwHIewOQZCcgGyVIYrUnw==
Date: Thu, 4 Nov 2021 14:40:39 +0000
Message-ID: <BN1P110MB0937C2C574DB76B7CBE93C309F8D9@BN1P110MB0937.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: yahoo.com; dkim=none (message not signed)
 header.d=none;yahoo.com; dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e417168b-5881-4249-7c46-08d99fa1122f
x-ms-traffictypediagnostic: BN1P110MB0788:
x-microsoft-antispam-prvs: <BN1P110MB078807B351080D83227E2E0E9F8D9@BN1P110MB0788.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zLykijL3cP3YsbxwONPFmU1UJim0+13bKkR22cYYWnfJFGdnYcQKjC2ZgcwGVE5/yRny4Y0FSZTrNFKBdLUi63CqFsQhg0zMKB/yp0kriqRjcleuPam+4v1uEOKilosKlaUpXyWqR7BW/GU/fTZyOM3XeOLI+FUZzmrhNVHGCAhCsNRTGt+ueXfiPaHgM/69qGOWfRlVtsrEmT3oosBaJhzCETuW9DsDPgybEiq8cAtMZdlcpLZflwUAcICWglVxvUtJMNZIuWWI1k34PWUFhAM6XVr52JNWX7GPIMewYN7IR0Pj5X0mMsqscTwvygVL+qjRZj4zK7y96hyMedXU1DfRfFqri8TaMgpdsG+BprhnpcyjwUx1X2jFROAUIq+LsSItXvSOaHorEjwjPVApiO7bMBW0soAfbCDTaaTpUfpP87acKgP+GJ/fblfyO9gQf5VMCv6mFfLjN0CzhZkdsHB9W8dJdCRkYC5vXM9upyPeJo9y88ugxtTXCrXWlNNb1LSs0MWGSReBQDom2Py63p1j3zdUzy2Lqx59BKi6O4EQmWr/v7EBXO8A4G8Za8I9eq9w9Rzlf0CcNhOUO8DxImQrQIeSt/Z2vkuqY3GCLbTlr3QzsblnkpIAO53b4wBdqKp4OseFemJKKSP+2WTGDJ0KysUPAdctsGsVH7Q9mFrsn/4v0WxfEwqMqUNT0iNYURZvRFjmet5ZsFYLPMDSiFdFOAjZwz+mPdaq4dKR4/JTfabZIZmm9wCYLtX2YOqW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN1P110MB0937.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(6506007)(38100700002)(122000001)(53546011)(8936002)(508600001)(2906002)(6916009)(83380400001)(966005)(5660300002)(8676002)(64756008)(55016002)(38070700005)(9686003)(52536014)(7696005)(4326008)(33656002)(66946007)(71200400001)(66556008)(66476007)(26005)(76116006)(186003)(66446008)(86362001)(2004002)(18886065003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: Mni2D/4hsro+tmRR2Nz13pfLhb1Uj/VVAMCz0knXQwVG7cxjMd/Sljswvbv68LGFus/zBns6e3/A+MdrPkpGNiu4XBo84rU7w9xjja4Qw/rxdLLJx1+H52Dl2DiMyLWJKlXGAWLy31bfRP7ZpChT+zFStbkHR1VRWX7EwUXF0cK4hzeR1ztecbd6AMITyaF+LkEtuTug8U/3sL7PYHSS4fvgs66OB7Z2Y1+J2JCROofWY1cYghMg+0vOdvym+bISxRBvgpfCFmxpMPoyeDOt1/8n8rVrH+5ubykj9FUY+hfHfREznH5nX+BSghUdoK5hnqjldkIYhCN1KOjUspL8tnW2kWRnN0F+uMMQMwgUMZbJas1VGbLVndDKTKOHdnUS1o829m6qZU3fxUVGdV7LeGUfUQ+QC2pruuUP15eCXlAndKnFrjuFK06QRRNG7wUiCgUzQwZ0WLxHgd6EFbrfsKXsvrwCUSs6hWIsNiMimYIKq+fZJ0j/jKlIa1Apzegw1dkj7sYMjUDZufwZ01z5LvW4UHSSZZoeKHCve7T7x2VkSC83yqdVvQDb6RmWMBJmJCmr47REB5k+yi1jac37gJ9qF4Ate5mAsVcQBhFBMGp/f5yyZiam1uPenPwpLAc8vlIozBfvK0kK2iKSt01OHDrreCTgfEoiqBe6JCo74A1RgOgk9LqQKP/AKAN1XIAUFEKF/rcj6NBIdW5k1BVZyg==
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN1P110MB0937.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e417168b-5881-4249-7c46-08d99fa1122f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2021 14:40:39.1999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1P110MB0788
Subject: Re: [Buildroot] nvidia kernel module build fails
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

VGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGJ1aWxkcm9vdCA8
YnVpbGRyb290LWJvdW5jZXNAYnVpbGRyb290Lm9yZz4gT24gQmVoYWxmIE9mIFRhbCBMdWJrbw0K
PiB2aWEgYnVpbGRyb290DQo+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMSwgMjAyMSAxMjowNCBQ
TQ0KPiBUbzogYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcNCj4gU3ViamVjdDogW0V4dGVybmFsXSAt
IFtCdWlsZHJvb3RdIG52aWRpYSBrZXJuZWwgbW9kdWxlIGJ1aWxkIGZhaWxzDQo+IA0KPiBIaQ0K
PiANCj4gSSdtIHRyeWluZyB0byBidWlsZCBudmlkaWEga2VybmVsIG1vZHVsZQ0KPiAoQlIyX1BB
Q0tBR0VfTlZJRElBX0RSSVZFUl9NT0RVTEUgb3B0aW9uKSBidXQgSSBnZXQgdGhlIGZvbGxvd2lu
Zw0KPiBlcnJvcjoNCj4gDQo+ID09PQ0KPiBDb21waWxlciB2ZXJzaW9uIGNoZWNrIGZhaWxlZDoN
Cj4gDQo+IFRoZSBtYWpvciBhbmQgbWlub3IgbnVtYmVyIG9mIHRoZSBjb21waWxlciB1c2VkIHRv
IGNvbXBpbGUgdGhlIGtlcm5lbDoNCj4gDQo+IHg4Nl82NC1saW51eC1nY2MuYnJfcmVhbCAoQnVp
bGRyb290IDIwMjAuMDgtMTQtZ2U1YTJhOTApIDkuMy4wLCBHTlUgbGQgKEdOVQ0KPiBCaW51dGls
cykgMi4zMy4xDQo+IA0KPiBkb2VzIG5vdCBtYXRjaCB0aGUgY29tcGlsZXIgdXNlZCBoZXJlOg0K
PiANCj4geDg2XzY0LWxpbnV4LWdjYy5icl9yZWFsIChCdWlsZHJvb3QgMjAyMC4wOC0xNC1nZTVh
MmE5MCkgOS4zLjAgQ29weXJpZ2h0IChDKQ0KPiAyMDE5IEZyZWUgU29mdHdhcmUgRm91bmRhdGlv
biwgSW5jLg0KPiBUaGlzIGlzIGZyZWUgc29mdHdhcmU7IHNlZSB0aGUgc291cmNlIGZvciBjb3B5
aW5nIGNvbmRpdGlvbnMuICBUaGVyZSBpcyBOTw0KPiB3YXJyYW50eTsgbm90IGV2ZW4gZm9yIE1F
UkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVINCj4gUFVSUE9TRS4NCj4g
DQoNClRoaXMgaXMgYmVjYXVzZSB0aGUgTlZJRElBIGNvbmZ0ZXN0LnNoIHNjcmlwdCBpcyBtYXRj
aGluZyB0aGUgcGtndmVyc2lvbiBzdHJpbmcgQnVpbGRyb290IGRlZmluZWQgd2hlbiBidWlsZGlu
ZyBHQ0MgYW5kIG5vdCB0aGUgYWN0dWFsIEdDQyB2ZXJzaW9uLiANCg0KSSd2ZSBzdWJtaXR0ZWQg
YSBwYXRjaCB0byB3b3JrIGFyb3VuZCB0aGlzIGhlcmU6DQpodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3QvP3Nlcmllcz0yNzA0MTUNCg0KPiANCj4gSXQg
aXMgcmVjb21tZW5kZWQgdG8gc2V0IHRoZSBDQyBlbnZpcm9ubWVudCB2YXJpYWJsZSB0byB0aGUg
Y29tcGlsZXIgdGhhdA0KPiB3YXMgdXNlZCB0byBjb21waWxlIHRoZSBrZXJuZWwuDQo+IA0KPiBU
aGUgY29tcGlsZXIgdmVyc2lvbiBjaGVjayBjYW4gYmUgZGlzYWJsZWQgYnkgc2V0dGluZyB0aGUN
Cj4gSUdOT1JFX0NDX01JU01BVENIIGVudmlyb25tZW50IHZhcmlhYmxlIHRvICIxIi4NCj4gSG93
ZXZlciwgbWl4aW5nIGNvbXBpbGVyIHZlcnNpb25zIGJldHdlZW4gdGhlIGtlcm5lbCBhbmQga2Vy
bmVsIG1vZHVsZXMNCj4gY2FuIHJlc3VsdCBpbiBzdWJ0bGUgYnVncyB0aGF0IGFyZSBkaWZmaWN1
bHQgdG8gZGlhZ25vc2UuDQo+IA0KPiAqKiogRmFpbGVkIENDIHZlcnNpb24gY2hlY2suIEJhaWxp
bmcgb3V0ISAqKiogPT09DQo+IA0KPiANCj4gSG9zdCBtYWNoaW5lOiBVYnVudHUgMTguMDQuNg0K
PiBCdWlsZHJvb3QgdmVyc2lvbjogMjAyMS4wMi42DQo+IFRhcmdldDogeDg2XzY0IChjb3JlaTcp
DQo+IA0KPiANCj4gSXMgdGhpcyB0aGUgcGxhY2UgZm9yIHJlcG9ydGluZyBpc3N1ZXM/DQo+IA0K
PiANCj4gUmVnYXJkcywNCj4gVGFsDQo+IA0KPiANCj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmln
aW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sNCj4g
bGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVy
IGFuZCBrbm93IHRoZQ0KPiBjb250ZW50IGlzIHNhZmUuDQoNCi0tDQpWaW5jZW50IEZhemlvDQpF
bWJlZGRlZCBTb2Z0d2FyZSBFbmdpbmVlciDigJMgQVRTDQpFeHRyZW1lIEVuZ2luZWVyaW5nIFNv
bHV0aW9ucywgSW5jDQpodHRwOi8vd3d3Lnhlcy1pbmMuY29tDQoNCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
