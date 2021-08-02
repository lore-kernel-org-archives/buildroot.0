Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD08C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 23:46:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF05C60EE3
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 23:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF05C60EE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7837681B60;
	Mon,  2 Aug 2021 23:46:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KueD_PXJhzw8; Mon,  2 Aug 2021 23:46:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9016A81B4D;
	Mon,  2 Aug 2021 23:46:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E4A0D1BF318
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 23:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3B2481B4D
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 23:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uUJ4vxePuASh for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 23:46:00 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0430881B04
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 23:45:59 +0000 (UTC)
Received: from smtpclient.apple ([146.241.149.252])
 by Aruba Outgoing Smtp  with ESMTPA
 id AhWHmtDFJnyXHAhWImKTmJ; Tue, 03 Aug 2021 01:38:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627947535; bh=pYnN4pCxGFB2tEQmcBtlZjQba5HORJ7nBBrw3uH8mJw=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=QT8j+FipwCbZ9m9U9ywBaCU7nSu21wv7RTr3PHw18xyMGjClDhFXe+7IqFjGMlWcU
 2gXEnE+hn6xwYa7aInAJ+0p8Gz6d+ZJgiTnkAgoGLz94b4f5KwH/v8h/UfUS2n08rw
 0YwKuX0kdUCM9mfTEbCH87bqNFtgQYHDc+yHDFiD/XNvAEG02r5ZLHHmonC6KpI9UH
 GBZkaldsra1rV6P8t5wfjqL4K6+0lvONEpXR8W7fRqD8D+0dTxS795N/u7VvhZI83d
 W//EXFOLl3qklC+yEet6g2D1JDLhRneuNOgeaoIKSPQtI3K0B4LXfSXlwz/z5ZYC+S
 P3+Go1HmGA7jQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 3 Aug 2021 01:38:53 +0200
Message-Id: <5B3863D6-F7A8-42EF-B6AC-4380DEA3AF9B@benettiengineering.com>
References: <0c80668e-d1c0-3516-4a9e-54e6eb32cfd8@benettiengineering.com>
In-Reply-To: <0c80668e-d1c0-3516-4a9e-54e6eb32cfd8@benettiengineering.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org, Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>, Adam Duskett <aduskett@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: iPhone Mail (18F72)
X-CMAE-Envelope: MS4wfE2Z9Yq2zeSMpf3WBe/Vy5rCld57z5D4dfphaarDPigH9heWmOr4Ipc+3utP+qDJK25VMxVdpUcz6r0p9CNVvL7O7PAFC2BBaZRB9YD49OIRLcK7/HiR
 yunhbNRsNKopgfE/gnPA8ChzIaUvgMHR6/NI6rnwP09fo98EY9qJgr2MF2owbjhRsmxT6MXwgMdZ+bbqo30rXXi1skG3xQ+o+4+kRxLdAhDLRAOUeZ1HXTcC
 ezwYwKRJZ7rpbbtopHKipt4S48uZ6PhXAx8VSgUAyEfhktCC1WMXCF4XU1aWFjTiE6v1JCofmpw4JWLlobspejAblX0B4+TmE1HL/aAbEMmZJILwMJv0XPxf
 ytj6GW5nPD2Ox5GvtSjyTtDIa5HVLTo6RMdWuvYQGI41mqLp93Q=
Subject: Re: [Buildroot] Some analysis of the major build failure reasons
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Cj4gSWwgZ2lvcm5vIDMgYWdvIDIwMjEsIGFsbGUgb3JlIDAwOjU2LCBHaXVsaW8gQmVuZXR0aSA8
Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gaGEgc2NyaXR0bzoKPiAKPiDv
u79IZWxsbyBUaG9tYXMsIEphbWVzLCBBbGwsCj4gCj4+IE9uIDgvMi8yMSAxMTo0NiBQTSwgVGhv
bWFzIFBldGF6em9uaSB3cm90ZToKPj4gSGVsbG8sCj4+IEdpdWxpbywgQmVybmQsIEFkYW0sIHRo
ZXJlIGFyZSBxdWVzdGlvbnMgZm9yIHlvdSBiZWxvdy4gVGhhbmtzIGZvciB5b3VyCj4+IHN1cHBv
cnQhCj4+PiBPbiBNb24sIDAyIEF1ZyAyMDIxIDA2OjA5OjM5IC0wMDAwCj4+PiBUaG9tYXMgUGV0
YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPj4+ICAgICBtYXN0
ZXIgICB8IDE5MDMgfCA4MDIgfCA1MyAgfCAyNzU4IHwKPj4gU28gaXQncyBnZXR0aW5nIGEgYml0
IGJldHRlciwgYnV0IHdlIHN0aWxsIGhhdmUgbG90cyBvZiBidWlsZCBmYWlsdXJlcy4KPj4+IENs
YXNzaWZpY2F0aW9uIG9mIGZhaWx1cmVzIGJ5IHJlYXNvbiBmb3IgbWFzdGVyCj4+PiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gICAgICAgICAgICAg
ICAgICBwaXhtYW4tMC40MC4wIHwgMzEKPj4gSSBoYXZlIGludmVzdGlnYXRlZCB0aGlzLiBJdCBm
YWlscyBvbmx5IG9uIHNoNCwgZHVlIGFuIGludGVybmFsCj4+IGNvbXBpbGVyIGVycm9yLiBJdCBv
bmx5IG9jY3VycyBhdCAtT3MsIGF0IC1PMCBhbmQgLU8yIGl0IGJ1aWxkcyBmaW5lLiBJCj4+IGhh
dmUgcmVwb3J0ZWQgZ2NjIGJ1Zwo+PiBodHRwczovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3df
YnVnLmNnaT9pZD0xMDE3MzcgZm9yIHRoaXMuIFNpbmNlIEkKPj4gdGVzdGVkIG9ubHkgd2l0aCBn
Y2MgOS4zLjAgZm9yIG5vdywgSSd2ZSBzdGFydGVkIGEgYnVpbGQgd2l0aCBnY2MgMTEueCwKPj4g
dG8gc2VlIGhvdyBpdCBnb2VzLgo+PiBCYXNlZCBvbiB0aGUgcmVzdWx0LCBJJ2xsIHNlbmQgYSBw
YXRjaCBhZGRpbmcgYSBuZXcKPj4gQlIyX1RPT0xDSEFJTl9HQ0NfSEFTX0JVR18xMDE3MzcgYW5k
IGRpc2FibGUgLU9zIG9uIHBpeG1hbiBvbiBTdXBlckgKPj4gYmFzZWQgb24gdGhpcy4KPiAKPiBJ
IGNhbiBkbyB0aGF0IHNpbmNlIEkndmUgdHJlYXRlZCBhIGxvdCBvZiBnY2MgYnVncy4gSXMgaXQg
b2s/Cj4gCj4+PiAgICAgICAgICAgICAgICAgICAgICAgIHVua25vd24gfCAzMQo+PiBJIGRpZCBu
b3QgbG9vayBpbnRvIHRoZXNlIGZvciBub3cuCj4gCj4gSSd2ZSB0YWtlbiBhIGxvb2sgaW50byB0
aGUgbGFzdCBvbmVzIG9mIHRvZGF5KHRoZSAzMSBvbmVzKQo+IEBKYW1lczogbG90IG9mIHlvdXIg
YnVpbGRzIHNpbXBseSBzdHVjayBhZnRlciBNYWtlIGhhcyBmaW5pc2hlZChub3Qgb24gbGlua2lu
ZyBidXQgZXhhY3RseSBvbiAnbWFrZTogTGVhdmluZyBkaXJlY3RvcnknKS4KPiAKPiBJJ3ZlIG5v
dGljZWQgaXQgdGltZSBhZ28gc29tZSB0aW1lLCBhbmQgbm93IGl0IGJlY2FtZSB2ZXJ5IG1vcmUg
ZnJlcXVlbnQuIFRoaXMgaXMgOS8xMCB5b3VyIGF1dG9idWlsZGVyIGdpdmluZyB0aGF0IHByb2Js
ZW0uCj4gQW5kIHRoaXMgaGFwcGVucyBhdCBkaWZmZXJlbnQgQnVpbGQgRHVyYXRpb246Cj4gaHR0
cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0Lz9yZWFzb249dW5rbm93bgo+IEFsc28gSSBzZWUg
eW91IHVzZSAvdG1wLyBmb2xkZXIgYnV0IEkgZG9uJ3Qgc2VlIGFueW9uZSBlbHNlIGRvaW5nIHRo
YXQuIElzbid0IGl0IG1heWJlIHRoYXQgeW91ciBkaXN0cm8gYXV0b21hdGljYWxseSBjbGVhbnMg
L3RtcCBmb2xkZXIgdXA/IE9yIGl0IGlzIG1hcHBlZCBzb21ld2hlcmUgd2hlcmUgZGlzayBnZXRz
IGZ1bGwgcmFuZG9tbHk/Cj4gSSB3b3VsZCBtb3ZlIGl0IHRvIGEgc3BlY2lmaWMgdXNlciBmb2xk
ZXIoaS5lLiBidWlsZHJvb3QgdXNlcikgYW5kIHRoYXQgc2hvdWxkIGZpeCB0aGUgcHJvYmxlbS4g
SWYgeW91J3JlIHRyeWluZyB0byBkbyBzdWNoIHRoaW5nIHRvIHNhdmUgZGlzayBzcGFjZSBJIHRl
bGwgeW91IHRoYXQgSSd2ZSBhbHJlYWR5IGRvbmUgaXQgdGltZSBhZ28gd2l0aCB0aGlzIHBhdGNo
IHRoYXQgbm93IG5lZWRzIHRvIGJlIHJlYmFzZWQ6Cj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDE4MDkxOTExNDU0MS4xNzY3MC0xLWdpdWxp
by5iZW5ldHRpQG1pY3Jvbm92YXNybC5jb20vCj4gQnV0IGluIG15IGNhc2UgTk9LIHdhcyBjbGVh
ci4gSSdtIHByZXR0eSBzdXJlIC90bXAvIGlzIHRoZSBwcm9ibGVtLgo+IAo+IE9uIEBUaG9tYXMg
YXV0b2J1aWxkZXIgSSBzZWUgZmFpbHVyZSBmb3I6Cj4gLSBvcHRlZS1jbGllbnQoYWxyZWFkeSBm
b3VuZCBOT0spOgo+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzVlOS81
ZTkxYmM1M2MzZmJjZDJlZDIzMmRiNzlkYzVjOTQ3Mzk0ZDY2YTFlLwo+IC0gZmFpbHVyZSBvbiBm
ZXRjaGluZyBhcyBtZW50aW9uZWQgYWJvdmUKPiAKPj4+ICAgICAgICAgICAgICAgICAgIHplcm9t
cS00LjMuNCB8IDMwCj4+IEdpdWxpbzogdGhpcyBpcyBoYXBwZW5pbmcgb25seSBvbiBvcjFrLCB3
aXRoIGEgYmludXRpbHMgYXNzZXJ0LiBEbyB5b3UKPj4gdGhpbmsgdGhpcyBpcyBzb2x2ZWQgYnkg
eW91ciBvcjFrIGZpeGVzPwo+IAo+IEl0IGlzLiBUaG9zZSBidWlsZCBmYWlsdXJlcyBhcmUgZHVl
IHRvIHRoZSB1c2Ugb2YgYmludXRpbHMtMi4zMy4xIHRoYXQgaGF2ZSBub3QgcGF0Y2hlcyBmb3Ig
b3Ixay4gV2hpbGUgYWxsIHRoZSBvdGhlciBiaW51dGlscyB2ZXJzaW9ucyBoYXZlCj4gbG9jYWwg
b3IgdXBzdHJlYW1lZCBvcjFrIHBhdGNoZXMuCgpCdWlsZHJvb3QgZG9lc27igJl0IHVzZSBiaW51
dGlscy0yLjMzLjEgc2/igKYKCj4gCj4gT2YgY291cnNlIHRoaXMgY2FuIHN0aWxsIGhhcHBlbiB3
aXRoIGFjdHVhbCBleHRlcm5hbCBCb290bGluIG9yMWsgdG9vbGNoYWluIHRoYXQgdXNlIGV4YWN0
bHkgYmludXRpbHMtMi4zMy4xIG5vdCBwYXRjaGVkLgoK4oCmdGhlIHByb2JsZW0gaGFwcGVucyBv
bmx5IHdpdGggZXh0ZXJuYWwgQm9vdGxpbiB0b29sY2hhaW4uIFNvIHVwZGF0aW5nIHRoZW0gc2hv
dWxkIGZpeCBpdCB0b3RhbGx5LgoKQmVzdCByZWdhcmRzCkdpdWxpbwoKPiBTbyB0aGUgcHJvYmxl
bSB3aWxsIGJlIHNvbHZlZCBvbmNlIHlvdSByZWNvbXBpbGUgYW5kIGJ1bXAgdGhlbSB3aXRoIHBh
dGNoZXMgcHJvdmlkZWQuIEkgc3RpbGwgc2VlIHRoYXQgd2UncmUgb24gMjAyMC4wOC0xOgo+IGh0
dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L3RyZWUvdG9vbGNoYWluL3Rvb2xjaGFp
bi1leHRlcm5hbC90b29sY2hhaW4tZXh0ZXJuYWwtYm9vdGxpbi90b29sY2hhaW4tZXh0ZXJuYWwt
Ym9vdGxpbi5tayNuNTg2Cj4gCj4+PiAgICAgICAgICAgICAgICBsaWJmdXNlMy0zLjEwLjQgfCAy
Mwo+PiBUaGlzIG9ubHkgaGFwcGVucyBvbiBNaWNyb2JsYXplLCB3aXRoOgo+PiAuLi9saWIvZnVz
ZV9sb29wX210LmM6MzYxOjE6IGVycm9yOiBzeW12ZXIgaXMgb25seSBzdXBwb3J0ZWQgb24gRUxG
IHBsYXRmb3Jtcwo+PiBHaXVsaW8sIGRvZXMgaXQgcmluZyBhIGJlbGwgdG8geW91ID8gSXQncyB3
ZWlyZCBiZWNhdXNlIE1pY3JvYmxhemUgaXMKPj4gdXNpbmcgRUxGIGJpbmFyaWVzLgo+IAo+IEkn
bSBnb2luZyB0byBsb29rIGludG8gdGhpcy4KPiAKPj4+ICAgICAgICAgICAgICAgIG5mcy11dGls
cy0yLjUuNCB8IDE5Cj4+IEkgYXNzdW1lIHdvdWxkIGJlIGZpeGVkIGJ5Cj4+IGh0dHBzOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMTA4MDIxNzIxMTYu
MTAwNzMtMS1wZXRyLnZvcmVsQGdtYWlsLmNvbS8KPiAKPiBZZXMsIGl0IGRvZXMuIFRoaXMgYnVn
IGNvbmZ1c2VkIG1lIGJlY2F1c2Ugb2YgbGFja2luZyBvZiAtd2Vycm9yLgo+IAo+Pj4gICAgICAg
ICAgICAgICAgICAgICAgZ3BzZC0zLjIxIHwgMTcKPj4gR2l1bGlvLCB0aGUgd29ya2Fyb3VuZCB0
byBwYXNzIC1PMCBubyBsb25nZXIgd29ya3MgZm9yIHNvbWUgcmVhc29uLiAtTzAKPj4gaXMgc3Rp
bGwgcGFzc2VkLCBidXQgLU8yIGlzIHBhc3NlZCAqYWZ0ZXIqLCBjYXVzaW5nIHRoZSBidWlsZCBp
c3N1ZSB0bwo+PiBwb3AgdXAgYWdhaW4uIENvdWxkIHlvdSBoYXZlIGEgbG9vayA/Cj4gCj4gU3Vy
ZSwgc29tZSB1cHN0cmVhbSBjaGFuZ2UgdGhhdCBtYWtlcyBteSB3b3JrLWFyb3VuZCB1c2VsZXNz
Lgo+IAo+IE5PVEU6Cj4gSSBhbHNvIGFkZCBsaWJuc3MtMy42OCBuZXcgYnVnIG9uIEFhcmNoNjRf
QkUgdG8gYmUgZml4ZWQuIEknbSBhbHJlYWR5IHdvcmtpbmcgb24gaXQgb24gc3BhcmUgdGltZS4K
PiAKPiBQUzogSSd2ZSBmb3VuZCBteSBhdXRvYnVpbGRlcnMgc3RvcHBlZCwgSSB0aGluayBJJ3Zl
IGZvcmdvdHRlbiB0byByZXN0YXJ0IHRoZSBkYWVtb24gYWZ0ZXIgdXBkYXRpbmcgdGhlIERpc3Ry
by4gTm93IHRoZXkncmUgdXAgYW5kIHJ1bm5pbmcuCj4gCj4gQmVzdCByZWdhcmRzCj4gLS0gCj4g
R2l1bGlvIEJlbmV0dGkKPiBCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
