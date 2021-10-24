Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E91C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:40:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F10EB60F4F
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F10EB60F4F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD836400DD;
	Sun, 24 Oct 2021 14:40:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id op4OarFSfICT; Sun, 24 Oct 2021 14:40:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8A8140275;
	Sun, 24 Oct 2021 14:40:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 31A221BF47D
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CF5740275
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:40:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EVKCyVXMLoDM for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 14:40:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E7D9400DD
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 14:40:38 +0000 (UTC)
Received: from smtpclient.apple ([151.68.93.37])
 by Aruba Outgoing Smtp  with ESMTPA
 id eefsmJRXDrIRleefsmx8M1; Sun, 24 Oct 2021 16:40:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635086437; bh=B83uVC2P3dVpWVVY1CSaj3UaR0RM8aHUcK3jYAfN8IM=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=nhljDZUMobrVh9935eTttL+L7tQk1R3Ykm1HvxpIxCne4B43L7We9CqlIW6TybKJ0
 WAIHshPzB6g2csOXMtc47Xumneky1UfJZxUKv/d/r4IykfVBGaqz+6EAc4lqKL90Yy
 ilqBeWLXKDnrSMveFyn2g+3pLh5kLjYkbAp2P/H8UX8/Oc3T1WaOUBA7oi6bgWmnBA
 hmjR31a4HjsvpblhPv8cI5+BAdRi2yHZhJe0m2hv6Mz7kHJJ+6haOGxbShURKz5sc1
 +PCT8EpurEK6cO5zExDrTHEPeJ1MVETjaZ1bG/oDkUuxJulFQT7QK9fkrmGz9xM8kE
 NOnl+wJorCp1g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 24 Oct 2021 16:40:35 +0200
Message-Id: <3646EE4F-A9B4-4C74-9DED-53A5EDC2A3FC@benettiengineering.com>
References: <20211024160940.4d4b6706@windsurf>
In-Reply-To: <20211024160940.4d4b6706@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (18H17)
X-CMAE-Envelope: MS4wfLUcXTN4rVMZEU1DszowxF1g7cGox2HTFpd4g9qtpu0nwlDDzN+L1TMfKQ6imHdSFK2pbGXqU/jJ6pMynLqIRVKLIZLwWlyr0tAe7WuwpSVpTNtO0Wzo
 Zl6fPq1JvBewbmS5AV1DR/F/mj/TrT80S/tEDqw0sUPJ81yOl1LZo56oLQxOu21K+UtffZjCbagLRH6iadQWs9ea1bNPnwx5RzS6e/oBWciAoPxwEFMFT4nr
 ClyNCa2+ywza7A87kWMAyM+bzsihkfb+PeMygn8aCgmz7NzdvagJ8DCTm+miyncPSC706cW+o/1Otd3Q+NQU7GKij7127lW3v1YsbqPnm1qAnkxDGJNk3bow
 g81s1yjA
Subject: Re: [Buildroot] [PATCH 0/8] Olimex boards u-boot/linux update
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, Leon Anavi <leon.anavi@konsulko.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKPiBJbCBnaW9ybm8gMjQgb3R0IDIwMjEsIGFsbGUgb3JlIDE2OjA5LCBUaG9t
YXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBoYSBzY3JpdHRvOgo+
IAo+IO+7v0hlbGxvIEdpdWxpbywKPiAKPj4gT24gRnJpLCAyMiBPY3QgMjAyMSAwMDowMDoxNSAr
MDIwMAo+PiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5n
LmNvbT4gd3JvdGU6Cj4+IAo+PiBHaXVsaW8gQmVuZXR0aSAoOCk6Cj4+ICBjb25maWdzL29saW1l
eF9hMTBfb2xpbnV4aW5vOiBidW1wIHRvIExpbnV4IGtlcm5lbCA1LjE0LjEzIGFuZCB1LWJvb3QK
Pj4gICAgMjAyMS4xMAo+PiAgY29uZmlncy9vbGltZXhfYTEwX29saW51eGlubzogdXNlIEZQVSBO
RU9OIHN0cmF0ZWd5Cj4+ICBjb25maWdzL29saW1leF9hMTNfb2xpbnV4aW5vOiBidW1wIHRvIExp
bnV4IGtlcm5lbCA1LjE0LjEzIGFuZCB1LWJvb3QKPj4gICAgMjAyMS4xMAo+PiAgY29uZmlncy9v
bGltZXhfYTEzX29saW51eGlubzogdXNlIEZQVSBORU9OIHN0cmF0ZWd5Cj4+ICBjb25maWdzL29s
aW1leF9hMjBfb2xpbnV4aW5vX2xpbWUyOiBidW1wIHRvIExpbnV4IGtlcm5lbCA1LjE0LjEzIGFu
ZAo+PiAgICB1LWJvb3QgMjAyMS4xMAo+PiAgY29uZmlncy9vbGltZXhfYTIwX29saW51eGlub19s
aW1lOiBidW1wIHRvIExpbnV4IGtlcm5lbCA1LjE0LjEzIGFuZAo+PiAgICB1LWJvb3QgMjAyMS4x
MAo+PiAgY29uZmlncy9vbGltZXhfYTIwX29saW51eGlub19taWNybzogYnVtcCB0byBMaW51eCBr
ZXJuZWwgNS4xNC4xMyBhbmQKPj4gICAgdS1ib290IDIwMjEuMTAKPj4gIGNvbmZpZ3Mvb2xpbWV4
X2EzM19vbGludXhpbm86IGJ1bXAgdG8gTGludXgga2VybmVsIDUuMTQuMTMgYW5kIHUtYm9vdAo+
PiAgICAyMDIxLjEwCj4gCj4gSSBoYXZlIGFwcGxpZWQgYWxsIHRoZSBwYXRjaGVzIGJ1bXBpbmcg
VS1Cb290L0xpbnV4LCBJIGhvcGUgdGhhdCB5b3UKPiB3ZXJlIGFibGUgdG8gdGVzdCB0aGVtIG9u
IHJlYWwgaGFyZHdhcmUuCgpZZXMgSeKAmXZlIHRlc3RlZCBvbiByZWFsIGJvYXJkIGV4Y2VwdCBh
MTAgdGhhdCBJIGRvbuKAmXQgb3duIGFuZCBJ4oCZdmUgYnJva2VuIHRoZSBhMzMgdGhhdCBJ4oCZ
bGwgaGF2ZSBvbiBUdWVzZGF5IHNvIEkgd2lsbCB0ZXN0IGl0LgoKPiBNYWtlIHN1cmUgdG8gbW9u
aXRvciB0aGUgbmV4dAo+IEdpdGxhYiBDSSBidWlsZCByZXN1bHRzIHRvIHNlZSBpZiB0aGVyZSdz
IGFueSBuZXcgYnVpbGQgZmFpbHVyZS4KClN1cmUgSSB3aWxsCgo+IAo+IEhvd2V2ZXIsIGZvciB0
aGUgdHdvIHBhdGNoZXMgZW5hYmxpbmcgTkVPTiBhcyB0aGUgRlBVLCBJIG1hcmtlZCB0aGVtIGFz
Cj4gcmVqZWN0ZWQuIEluZGVlZCwgdXNpbmcgTkVPTiBhcyB0aGUgRlBVIGlzIG5vdCBhbHdheXMg
YSBnb29kIGlkZWEsIGFzCj4gaXQgZXhwbGFpbmVkIGluIHRoZSBDb25maWcuaW4uaGVscCB0ZXh0
Ogo+IAo+ICAgICAgICAgIFRoaXMgb3B0aW9uIGFsbG93cyB0byB1c2UgdGhlIE5FT04gU0lNRCB1
bml0LCBhcyBhdmFpbGFibGUKPiAgICAgICAgICBpbiBzb21lIEFSTXY3IHByb2Nlc3NvcnMsIGFz
IGEgZmxvYXRpbmctcG9pbnQgdW5pdC4gSXQKPiAgICAgICAgICBzaG91bGQgaG93ZXZlciBiZSBu
b3RlZCB0aGF0IHVzaW5nIE5FT04gZm9yIGZsb2F0aW5nIHBvaW50Cj4gICAgICAgICAgb3BlcmF0
aW9ucyBkb2Vzbid0IHByb3ZpZGUgYSBjb21wbGV0ZSBjb21wYXRpYmlsaXR5IHdpdGggdGhlCj4g
ICAgICAgICAgSUVFRSA3NTQuCgpUaGFuayB5b3UgZm9yIHBvaW50aW5nIEkgZGlkbuKAmXQga25v
dyBhbmQgZm91bmQgaXQgb24gQXJtIHdlYnNpdGUgdG9vLiBTbyBub3cgSSB1bmRlcnN0YW5kIHRo
ZSByZWFzb24gdG8gbm90IHByZWZlciBORU9OIG9ubHkgb24gY29ydGV4IGE4LgpXaGlsZSBvbiBh
NyBpbnN0ZWFkIHdlIGhhdmUgdGhlIE5FT04rVkZQVjQKdGhhdCBjb3ZlciBJRUVFIDc1NC4KCkJl
c3QgcmVnYXJkcwpHaXVsaW8gQmVuZXR0aQoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gCj4gVGhvbWFz
IFBldGF6em9uaQo+IC0tIAo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJv
b3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmlu
Zwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
