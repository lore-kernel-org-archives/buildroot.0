Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEF2C30653
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 09:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D182960F02;
	Tue, 25 Jun 2024 09:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RskcX5F8_Aih; Tue, 25 Jun 2024 09:04:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D956860FCF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D956860FCF;
	Tue, 25 Jun 2024 09:04:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 46E031BF424
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 09:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33FC860FCF
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 09:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPoNrkwTdHpO for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 09:04:11 +0000 (UTC)
X-Greylist: delayed 903 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 25 Jun 2024 09:04:09 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4080860F02
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4080860F02
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.181.117.226;
 helo=mail.actia.se; envelope-from=john.ernberg@actia.se; receiver=<UNKNOWN> 
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4080860F02
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 09:04:09 +0000 (UTC)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Jun
 2024 10:49:01 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.039; Tue, 25 Jun 2024 10:49:01 +0200
From: John Ernberg <john.ernberg@actia.se>
To: Arnout Vandecappelle <arnout@mind.be>, "jacob-chen@iotwrt.com"
 <jacob-chen@iotwrt.com>, "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/1] package/pkg-utils.mk: fix incorrect
 handling of per-package rebuilds
Thread-Index: AQHalHNYnL8mQZ4nZ0mh5Dufo79garHYRWaAgAApOIA=
Date: Tue, 25 Jun 2024 08:49:01 +0000
Message-ID: <89d003bf-cd19-4b55-85d3-7d232bd8f06a@actia.se>
References: <tencent_7A5A407C574E45921E432385B01446CC4506@qq.com>
 <852e6bae-dce6-422d-98f2-947c4a71e6c2@mind.be>
In-Reply-To: <852e6bae-dce6-422d-98f2-947c4a71e6c2@mind.be>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.11]
x-esetresult: clean, is OK
x-esetid: 37303A2955B144576C7167
Content-ID: <2219E0B8BCE54246A4E6AF12171A79A3@actia.se>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=actia.se
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-utils.mk: fix incorrect
 handling of per-package rebuilds
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
Cc: chenhao <chenhao37@lixiang.com>,
 "zhouxiufeng@lixiang.com" <zhouxiufeng@lixiang.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFjb2IsIEFybm91dCwNCg0KT24gNi8yNS8yNCA4OjIxIEFNLCBBcm5vdXQgVmFuZGVjYXBw
ZWxsZSB2aWEgYnVpbGRyb290IHdyb3RlOg0KPiANCj4gDQo+IE9uIDIyLzA0LzIwMjQgMDc6MDks
IGphY29iLWNoZW5AaW90d3J0LmNvbSB3cm90ZToNCj4+IEZyb206IGNoZW5oYW8gPGNoZW5oYW8z
N0BsaXhpYW5nLmNvbT4NCj4+DQo+PiBUaGUgY3VycmVudCBwZXItcGFja2FnZSBlbmFibGVkIGJ1
aWxkIHByb2Nlc3MgaW5jb3JyZWN0bHkgaGFuZGxlcyANCj4+IHJlYnVpbGQgdGFyZ2V0cywNCj4+
IHdoaWNoIGJyZWFrIGxvY2FsIGRldmVsb3BtZW50IHdvcmtmbG93cygibWFrZSBwYWNrYWdlLXJl
YnVpbGQgJiYgbWFrZSANCj4+IGFsbC4iKS4NCj4+IFRoZXJlIGlzIGFuIGVhcmxpZXIgcmVwb3J0
IHJlZ2FyZGluZyB0aGUgYnVnKCANCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9v
dC8yMDE5MTIxMjEzMDI1My4yY2I1NDNiYUB3aW5kc3VyZi8gKQ0KPj4NCj4+IFRvIGFkZHJlc3Mg
dGhpcyBpc3N1ZSwgd2UgY2hhbmdlIHJzeW5jIGNvbW1hbmQgdXNlZCBkdXJpbmcgdGhlIA0KPj4g
ZmluYWxpemUgc3RlcCB0byB1c2UgdGhlICd1cGRhdGUnIHBhcmFtZXRlci4NCj4+IFRoaXMgZW5z
dXJlcyB0aGF0IHRoZSBtb3N0IHJlY2VudCBmaWxlcyBhcmUgaW5zdGFsbGVkIGludG8gdGhlIHJv
b3Rmcy4NCj4gDQo+ICDCoFRoaXMgd2lsbCBmaXggdGhlIGlzc3VlLCBidXQgbWF5IGJyZWFrIG90
aGVyIHNpdHVhdGlvbnMuIElmIGEgZmlsZSBpcw0KPiBpbnN0YWxsZWQgYnkgYm90aCBwYWNrYWdl
IEEgYW5kIHBhY2thZ2UgQiwgYW5kIHBhY2thZ2UgQiBoYXMgYSANCj4gZGVwZW5kZW5jeSBvbg0K
PiBwYWNrYWdlIEEsIGJ1dCBpdCBkb2Vzbid0IHNldCBhIG5ld2VyIHRpbWVzdGFtcCAoZS5nLiBi
ZWNhdXNlIGl0J3MgYSANCj4gc2NyaXB0IHRoYXQNCj4gaXMgY29waWVkIGRpcmVjdGx5IGZyb20g
c291cmNlLCBub3QgYSBjb21waWxlZCBmaWxlKSwgdGhlbiB0aGUgLS11cGRhdGUgDQo+IGFyZ3Vt
ZW50DQo+IHdpbGwgY2F1c2UgdXMgdG8gdXNlIHRoZSB2ZXJzaW9uIGZyb20gcGFja2FnZSBBIGlu
c3RlYWQgb2YgdGhlIG9uZSBmcm9tIA0KPiBwYWNrYWdlIEIuDQo+IA0KPiAgwqBJIGRvbid0IGtu
b3cgaG93IGhpZ2ggdGhlIHJpc2sgaXMgb2YgdGhpcyBoYXBwZW5pbmcsIGJ1dCBJTUhPIGl0cyAN
Cj4gaW1wYWN0IGlzDQo+IGZhciB3b3JzZSB0aGFuIGZvby1yZWJ1aWxkIG5vdCB3b3JraW5nLg0K
DQpUaGlzIGFscmVhZHkgZG9lc24ndCB3b3JrIHRvZGF5LCB0aGUgdGFyZ2V0LyBwb3B1bGF0aW9u
IGlzIHRyYXZlcnNpbmcgDQp0aGUgcGFja2FnZXMgYWxwaGFiZXRpY2FsbHkuIElmIHlvdSByZXZl
cnNlIHRoZSBwYWNrYWdlIG5hbWVzIGluIHlvdXIgDQpleGFtcGxlLCBzbyB5b3UgZ2V0OiBQYWNr
YWdlIEEgaGFzIGEgZGVwZW5kZW5jeSBvbiBCLCBhbmQgQSBhbmQgQiBib3RoIA0KcHJvdmlkZSB0
aGUgc2FtZSBmaWxlLCBhbmQgdGhlIGZpbGUgZnJvbSBwYWNrYWdlIEEgaXMgbWVhbnQgdG8gYmUg
cGlja2VkLg0KLT4gSXQgd2lsbCBub3QgaGFwcGVuIGJlY2F1c2UgQiB3aWxsIGJlIGNvcGllZCB0
byB0YXJnZXQvIGFmdGVyIEEuDQoNCg0KV2UgaGF2ZSB0aGlzIHBhY2thZ2UgcmVidWlsZCBpc3N1
ZSBhcyB3ZWxsIFswXSBhbmQgSSBoYXZlIHNvIGZhciBub3QgDQpmb3VuZCBhbnkgZ29vZCBzb2x1
dGlvbiB0byB0aGUgcHJvYmxlbSBlaXRoZXIuIE91ciB3b3JrLWFyb3VuZCBmb3Igbm93IA0KaXMg
dG8gcmVjb25maWd1cmUgYWxsIHRoZSBkZXBlbmRlbnRzIHRoYXQgY29tZSBhZnRlciB0aGUgcGFj
a2FnZSANCmFscGhhYmV0aWNhbGx5LCBhbmQgdGhlbiB0aGVpciBkZXBlbmRlbnRzLCBhbmQgc28g
b24uDQoNCkkgd2FzIGV4cGVjdGluZyAyM2VkZjk4MzdjOTMgKCJwYWNrYWdlL3BrZy11dGlsczog
dGVhY2ggDQpwZXItcGFja2FnZS1yc3luYyB0byBjb3B5IG9yIGhhcmRsaW5rIGRlc3QiKSB0byBm
aXggdGhlIGlzc3VlIHNpbmNlIHRoZSANCnByZXBhcmVkIHBlci1wYWNrYWdlIGRpcmVjdG9yaWVz
IGFyZSBoYXJkbGlua3MgdG8gZWFjaCBwcm92aWRpbmcgDQpwYWNrYWdlcyBmaWxlcy4NCg0KQnV0
IHNpbmNlIHdlIHVwZ3JhZGVkIHRvIDIwMjQuMDIueCBsYXN0IG1vbnRoIHdlIHN0aWxsIHNlZSB0
aGUgaXNzdWUuIChJIA0KbWFkZSBhIGNsZWFuIGJ1aWxkIHRvIGJlIHN1cmUgSSBkaWRuJ3QgaGF2
ZSBvbGQgc3R1ZmYgbGF5aW5nIGFyb3VuZCANCmludGVyZmVyaW5nKQ0KDQpDb3VsZCBzb21ldGhp
bmcgYmUgcHJldmVudGluZyB0aGUgaGFyZGxpbmtzIGZyb20gYmVpbmcgYWN0dWFsIGhhcmRsaW5r
cz8NCg0KUmVnYXJkcyAvLyBKb2huIEVybmJlcmcNCg0KWzBdOiANCmh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2J1aWxkcm9vdC8yMDIzMTExMDE0MTI0Mi4zNzk2MTYxLTEtam9obi5lcm5iZXJnQGFj
dGlhLnNlLwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
