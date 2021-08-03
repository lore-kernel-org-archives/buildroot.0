Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39EDC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 06:36:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D20560EBB
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 06:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D20560EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DED18605B7;
	Tue,  3 Aug 2021 06:36:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4KlTkbkodrMK; Tue,  3 Aug 2021 06:36:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF56A605C8;
	Tue,  3 Aug 2021 06:36:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBD301BF35D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 06:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D974040270
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 06:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rP3-OduuvdkF for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 06:36:20 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BA044016F
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 06:36:20 +0000 (UTC)
Received: from smtpclient.apple ([146.241.149.252])
 by Aruba Outgoing Smtp  with ESMTPA
 id AnvMmwvyHrIRlAnvNm3FoA; Tue, 03 Aug 2021 08:29:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627972154; bh=G2oLaNSU4biybAHRq/ug0vM/45G0hQzZWjZfWSsVq/U=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=kx7Yu/dpnbagJOgNyRoppSsecZFVJVgqRvm1sK/fDqG8k13Ecrf1psPR6H0Iovexk
 xYPz4bu9EmuWeEymUXPeJXLVciDTql0HiIl8x23TxkrOEOH0k00i0Yffqo05VI+uVC
 SserMiWivQvKoHPRgNcOowyHzx5x2Gk7xGEMnbDAHJRbFeM/MIwHWB3g3fA2wgEum6
 yTRavgk/5Tetjj6QqFSRBFe0sCYbZZRZPt36fMs0JOvoWDsV5t2n3IyN27CxiCz/eO
 1Smi8xgieb3z6xb2TntaVFs4uMcOumcelj91jaG44NmP6lSVJYMw6OCq5W53i6v6tw
 5q6woSlwlBTNA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 3 Aug 2021 08:29:12 +0200
Message-Id: <61121F0F-0631-4BE0-B9F0-8A1082C6D4C9@benettiengineering.com>
References: <CADvTj4rCinUU+QmWmtELNvVHz+cdDc9-K0jsCYsvRcWY3RW0Bw@mail.gmail.com>
In-Reply-To: <CADvTj4rCinUU+QmWmtELNvVHz+cdDc9-K0jsCYsvRcWY3RW0Bw@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailer: iPhone Mail (18F72)
X-CMAE-Envelope: MS4wfGgGwnNayurXRoG+V+r/aEwEL42KSwUm3vyts1qOFmmkML3Wsf3prPCRLruzBjYb628L8plHAfAHgreSM6hx2+qptl9+B1xLLGsOPAE2VaCvaCj1j+ct
 H0syLGgR8iTeCFeN4QDxlDhOKYaJIDRtc0yvSK9SRXeik3Gr8yzO5Iv/nTp42X+HtW3TXRHgh0+jKdwqrGB2ljwxJFwZC+moXH7CBt4gXlN9pHndd6brgGQX
 NFR0UocSPNDJKphDl2x1iu9rb0UiWQ90vbmTJ3KONqFMPShAlQgbiMy2gU0G9bByMUyY/aw+ESzTwabl2lMvIKQs0d1WBXATm00v8AmfVqqIHjvIONdfVIvC
 iY/0155GWKSOoruGkkihnt0nEGnlZdvAp79hpg3bPlUVrROuLr8=
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Adam Duskett <aduskett@gmail.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGkgSmFtZXMsCgo+IElsIGdpb3JubyAzIGFnbyAyMDIxLCBhbGxlIG9yZSAwNDo0NCwgSmFtZXMg
SGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IGhhIHNjcml0dG86Cj4gCj4g77u/
T24gTW9uLCBBdWcgMiwgMjAyMSBhdCA0OjU2IFBNIEdpdWxpbyBCZW5ldHRpCj4gPGdpdWxpby5i
ZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+PiAKPj4gSGVsbG8gVGhvbWFz
LCBKYW1lcywgQWxsLAo+PiAKPj4+IE9uIDgvMi8yMSAxMTo0NiBQTSwgVGhvbWFzIFBldGF6em9u
aSB3cm90ZToKPj4+IEhlbGxvLAo+Pj4gCj4+PiBHaXVsaW8sIEJlcm5kLCBBZGFtLCB0aGVyZSBh
cmUgcXVlc3Rpb25zIGZvciB5b3UgYmVsb3cuIFRoYW5rcyBmb3IgeW91cgo+Pj4gc3VwcG9ydCEK
Pj4+IAo+Pj4gT24gTW9uLCAwMiBBdWcgMjAyMSAwNjowOTozOSAtMDAwMAo+Pj4gVGhvbWFzIFBl
dGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4+PiAKPj4+PiAg
ICAgbWFzdGVyICAgfCAxOTAzIHwgODAyIHwgNTMgIHwgMjc1OCB8Cj4+PiAKPj4+IFNvIGl0J3Mg
Z2V0dGluZyBhIGJpdCBiZXR0ZXIsIGJ1dCB3ZSBzdGlsbCBoYXZlIGxvdHMgb2YgYnVpbGQgZmFp
bHVyZXMuCj4+PiAKPj4+PiBDbGFzc2lmaWNhdGlvbiBvZiBmYWlsdXJlcyBieSByZWFzb24gZm9y
IG1hc3Rlcgo+Pj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4+Pj4gICAgICAgICAgICAgICAgICBwaXhtYW4tMC40MC4wIHwgMzEKPj4+IAo+Pj4gSSBo
YXZlIGludmVzdGlnYXRlZCB0aGlzLiBJdCBmYWlscyBvbmx5IG9uIHNoNCwgZHVlIGFuIGludGVy
bmFsCj4+PiBjb21waWxlciBlcnJvci4gSXQgb25seSBvY2N1cnMgYXQgLU9zLCBhdCAtTzAgYW5k
IC1PMiBpdCBidWlsZHMgZmluZS4gSQo+Pj4gaGF2ZSByZXBvcnRlZCBnY2MgYnVnCj4+PiBodHRw
czovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD0xMDE3MzcgZm9yIHRoaXMu
IFNpbmNlIEkKPj4+IHRlc3RlZCBvbmx5IHdpdGggZ2NjIDkuMy4wIGZvciBub3csIEkndmUgc3Rh
cnRlZCBhIGJ1aWxkIHdpdGggZ2NjIDExLngsCj4+PiB0byBzZWUgaG93IGl0IGdvZXMuCj4+PiAK
Pj4+IEJhc2VkIG9uIHRoZSByZXN1bHQsIEknbGwgc2VuZCBhIHBhdGNoIGFkZGluZyBhIG5ldwo+
Pj4gQlIyX1RPT0xDSEFJTl9HQ0NfSEFTX0JVR18xMDE3MzcgYW5kIGRpc2FibGUgLU9zIG9uIHBp
eG1hbiBvbiBTdXBlckgKPj4+IGJhc2VkIG9uIHRoaXMuCj4+IAo+PiBJIGNhbiBkbyB0aGF0IHNp
bmNlIEkndmUgdHJlYXRlZCBhIGxvdCBvZiBnY2MgYnVncy4gSXMgaXQgb2s/Cj4+IAo+Pj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgdW5rbm93biB8IDMxCj4+PiAKPj4+IEkgZGlkIG5vdCBsb29r
IGludG8gdGhlc2UgZm9yIG5vdy4KPj4gCj4+IEkndmUgdGFrZW4gYSBsb29rIGludG8gdGhlIGxh
c3Qgb25lcyBvZiB0b2RheSh0aGUgMzEgb25lcykKPj4gQEphbWVzOiBsb3Qgb2YgeW91ciBidWls
ZHMgc2ltcGx5IHN0dWNrIGFmdGVyIE1ha2UgaGFzIGZpbmlzaGVkKG5vdCBvbgo+PiBsaW5raW5n
IGJ1dCBleGFjdGx5IG9uICdtYWtlOiBMZWF2aW5nIGRpcmVjdG9yeScpLgo+PiAKPj4gSSd2ZSBu
b3RpY2VkIGl0IHRpbWUgYWdvIHNvbWUgdGltZSwgYW5kIG5vdyBpdCBiZWNhbWUgdmVyeSBtb3Jl
Cj4+IGZyZXF1ZW50LiBUaGlzIGlzIDkvMTAgeW91ciBhdXRvYnVpbGRlciBnaXZpbmcgdGhhdCBw
cm9ibGVtLgo+PiBBbmQgdGhpcyBoYXBwZW5zIGF0IGRpZmZlcmVudCBCdWlsZCBEdXJhdGlvbjoK
Pj4gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0Lz9yZWFzb249dW5rbm93bgo+PiBBbHNv
IEkgc2VlIHlvdSB1c2UgL3RtcC8gZm9sZGVyIGJ1dCBJIGRvbid0IHNlZSBhbnlvbmUgZWxzZSBk
b2luZyB0aGF0Lgo+PiBJc24ndCBpdCBtYXliZSB0aGF0IHlvdXIgZGlzdHJvIGF1dG9tYXRpY2Fs
bHkgY2xlYW5zIC90bXAgZm9sZGVyIHVwPyBPcgo+PiBpdCBpcyBtYXBwZWQgc29tZXdoZXJlIHdo
ZXJlIGRpc2sgZ2V0cyBmdWxsIHJhbmRvbWx5Pwo+PiBJIHdvdWxkIG1vdmUgaXQgdG8gYSBzcGVj
aWZpYyB1c2VyIGZvbGRlcihpLmUuIGJ1aWxkcm9vdCB1c2VyKSBhbmQgdGhhdAo+PiBzaG91bGQg
Zml4IHRoZSBwcm9ibGVtLiBJZiB5b3UncmUgdHJ5aW5nIHRvIGRvIHN1Y2ggdGhpbmcgdG8gc2F2
ZSBkaXNrCj4+IHNwYWNlIEkgdGVsbCB5b3UgdGhhdCBJJ3ZlIGFscmVhZHkgZG9uZSBpdCB0aW1l
IGFnbyB3aXRoIHRoaXMgcGF0Y2ggdGhhdAo+PiBub3cgbmVlZHMgdG8gYmUgcmViYXNlZDoKPj4g
aHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDE4
MDkxOTExNDU0MS4xNzY3MC0xLWdpdWxpby5iZW5ldHRpQG1pY3Jvbm92YXNybC5jb20vCj4+IEJ1
dCBpbiBteSBjYXNlIE5PSyB3YXMgY2xlYXIuIEknbSBwcmV0dHkgc3VyZSAvdG1wLyBpcyB0aGUg
cHJvYmxlbS4KPiAKPiBUaGUgYXV0b2J1aWxkIHNlcnZpY2UgaXMgcnVuIHdpdGggYSBwcml2YXRl
IHRlbXBvcmFyeSB0bXAgZGlyZWN0b3J5LAo+IEkgdXNlIGEgc2ltaWxhciBzZXR1cCBmb3IgbXkg
eDM5OSBhdXRvYnVpbGRlcjoKPiBbVW5pdF0KPiBEZXNjcmlwdGlvbj1CdWlsZHJvb3QgYXV0b2J1
aWxkCj4gQWZ0ZXI9bmV0d29yay50YXJnZXQKPiBDb25kaXRpb25QYXRoRXhpc3RzPS9ldGMvZGVm
YXVsdC9idWlsZHJvb3QtYXV0b2J1aWxkCj4gU3RhcnRMaW1pdEludGVydmFsU2VjPTAKPiAKPiBb
U2VydmljZV0KPiBVc2VyPWF1dG9idWlsZAo+IEdyb3VwPWF1dG9idWlsZAo+IFR5cGU9c2ltcGxl
Cj4gUHJpdmF0ZVRtcD15ZXMKPiBXb3JraW5nRGlyZWN0b3J5PS90bXAKPiBFeGVjU3RhcnQ9L29w
dC9idWlsZHJvb3QtdGVzdC9zY3JpcHRzL2F1dG9idWlsZC1ydW4gLS1jb25maWcKPiAvZXRjL2Rl
ZmF1bHQvYnVpbGRyb290LWF1dG9idWlsZAo+IAo+IFJlc3RhcnQ9YWx3YXlzCj4gCj4gW0luc3Rh
bGxdCj4gV2FudGVkQnk9bXVsdGktdXNlci50YXJnZXQKCkFoLCBJIHNvdW5kcyBldmVyeXRoaW5n
IGluIG9yZGVyLiBDYW4geW91IHBsZWFzZSB0cnkgdG8gaXNzdWUgaXQgbWFudWFsbHkgdGhlIGV4
YWN0IHNjcmlwdCBvbiBhIHNoZWxsIGFuZCBzZWUgZm9yIDEgZGF5IGxvbmcgd2hhdCBoYXBwZW5z
PwoKR2l1bGlvCgo+IAo+PiAKPj4gT24gQFRob21hcyBhdXRvYnVpbGRlciBJIHNlZSBmYWlsdXJl
IGZvcjoKPj4gLSBvcHRlZS1jbGllbnQoYWxyZWFkeSBmb3VuZCBOT0spOgo+PiBodHRwOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy81ZTkvNWU5MWJjNTNjM2ZiY2QyZWQyMzJkYjc5
ZGM1Yzk0NzM5NGQ2NmExZS8KPj4gLSBmYWlsdXJlIG9uIGZldGNoaW5nIGFzIG1lbnRpb25lZCBh
Ym92ZQo+PiAKPj4+PiAgICAgICAgICAgICAgICAgICB6ZXJvbXEtNC4zLjQgfCAzMAo+Pj4gCj4+
PiBHaXVsaW86IHRoaXMgaXMgaGFwcGVuaW5nIG9ubHkgb24gb3Ixaywgd2l0aCBhIGJpbnV0aWxz
IGFzc2VydC4gRG8geW91Cj4+PiB0aGluayB0aGlzIGlzIHNvbHZlZCBieSB5b3VyIG9yMWsgZml4
ZXM/Cj4+IAo+PiBJdCBpcy4gVGhvc2UgYnVpbGQgZmFpbHVyZXMgYXJlIGR1ZSB0byB0aGUgdXNl
IG9mIGJpbnV0aWxzLTIuMzMuMSB0aGF0Cj4+IGhhdmUgbm90IHBhdGNoZXMgZm9yIG9yMWsuIFdo
aWxlIGFsbCB0aGUgb3RoZXIgYmludXRpbHMgdmVyc2lvbnMgaGF2ZQo+PiBsb2NhbCBvciB1cHN0
cmVhbWVkIG9yMWsgcGF0Y2hlcy4KPj4gCj4+IE9mIGNvdXJzZSB0aGlzIGNhbiBzdGlsbCBoYXBw
ZW4gd2l0aCBhY3R1YWwgZXh0ZXJuYWwgQm9vdGxpbiBvcjFrCj4+IHRvb2xjaGFpbiB0aGF0IHVz
ZSBleGFjdGx5IGJpbnV0aWxzLTIuMzMuMSBub3QgcGF0Y2hlZC4gU28gdGhlIHByb2JsZW0KPj4g
d2lsbCBiZSBzb2x2ZWQgb25jZSB5b3UgcmVjb21waWxlIGFuZCBidW1wIHRoZW0gd2l0aCBwYXRj
aGVzIHByb3ZpZGVkLiBJCj4+IHN0aWxsIHNlZSB0aGF0IHdlJ3JlIG9uIDIwMjAuMDgtMToKPj4g
aHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvdHJlZS90b29sY2hhaW4vdG9vbGNo
YWluLWV4dGVybmFsL3Rvb2xjaGFpbi1leHRlcm5hbC1ib290bGluL3Rvb2xjaGFpbi1leHRlcm5h
bC1ib290bGluLm1rI241ODYKPj4gCj4+Pj4gICAgICAgICAgICAgICAgbGliZnVzZTMtMy4xMC40
IHwgMjMKPj4+IAo+Pj4gVGhpcyBvbmx5IGhhcHBlbnMgb24gTWljcm9ibGF6ZSwgd2l0aDoKPj4+
IAo+Pj4gLi4vbGliL2Z1c2VfbG9vcF9tdC5jOjM2MToxOiBlcnJvcjogc3ltdmVyIGlzIG9ubHkg
c3VwcG9ydGVkIG9uIEVMRiBwbGF0Zm9ybXMKPj4+IAo+Pj4gR2l1bGlvLCBkb2VzIGl0IHJpbmcg
YSBiZWxsIHRvIHlvdSA/IEl0J3Mgd2VpcmQgYmVjYXVzZSBNaWNyb2JsYXplIGlzCj4+PiB1c2lu
ZyBFTEYgYmluYXJpZXMuCj4+IAo+PiBJJ20gZ29pbmcgdG8gbG9vayBpbnRvIHRoaXMuCj4+IAo+
Pj4+ICAgICAgICAgICAgICAgIG5mcy11dGlscy0yLjUuNCB8IDE5Cj4+PiAKPj4+IEkgYXNzdW1l
IHdvdWxkIGJlIGZpeGVkIGJ5Cj4+PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2pl
Y3QvYnVpbGRyb290L3BhdGNoLzIwMjEwODAyMTcyMTE2LjEwMDczLTEtcGV0ci52b3JlbEBnbWFp
bC5jb20vCj4+IAo+PiBZZXMsIGl0IGRvZXMuIFRoaXMgYnVnIGNvbmZ1c2VkIG1lIGJlY2F1c2Ug
b2YgbGFja2luZyBvZiAtd2Vycm9yLgo+PiAKPj4+PiAgICAgICAgICAgICAgICAgICAgICBncHNk
LTMuMjEgfCAxNwo+Pj4gCj4+PiBHaXVsaW8sIHRoZSB3b3JrYXJvdW5kIHRvIHBhc3MgLU8wIG5v
IGxvbmdlciB3b3JrcyBmb3Igc29tZSByZWFzb24uIC1PMAo+Pj4gaXMgc3RpbGwgcGFzc2VkLCBi
dXQgLU8yIGlzIHBhc3NlZCAqYWZ0ZXIqLCBjYXVzaW5nIHRoZSBidWlsZCBpc3N1ZSB0bwo+Pj4g
cG9wIHVwIGFnYWluLiBDb3VsZCB5b3UgaGF2ZSBhIGxvb2sgPwo+PiAKPj4gU3VyZSwgc29tZSB1
cHN0cmVhbSBjaGFuZ2UgdGhhdCBtYWtlcyBteSB3b3JrLWFyb3VuZCB1c2VsZXNzLgo+PiAKPj4g
Tk9URToKPj4gSSBhbHNvIGFkZCBsaWJuc3MtMy42OCBuZXcgYnVnIG9uIEFhcmNoNjRfQkUgdG8g
YmUgZml4ZWQuIEknbSBhbHJlYWR5Cj4+IHdvcmtpbmcgb24gaXQgb24gc3BhcmUgdGltZS4KPj4g
Cj4+IFBTOiBJJ3ZlIGZvdW5kIG15IGF1dG9idWlsZGVycyBzdG9wcGVkLCBJIHRoaW5rIEkndmUg
Zm9yZ290dGVuIHRvCj4+IHJlc3RhcnQgdGhlIGRhZW1vbiBhZnRlciB1cGRhdGluZyB0aGUgRGlz
dHJvLiBOb3cgdGhleSdyZSB1cCBhbmQgcnVubmluZy4KPj4gCj4+IEJlc3QgcmVnYXJkcwo+PiAt
LQo+PiBHaXVsaW8gQmVuZXR0aQo+PiBCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
