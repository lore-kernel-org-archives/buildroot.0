Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF703C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 15:22:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2324E60E08
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 15:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2324E60E08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B40BC400DA;
	Sun, 14 Nov 2021 15:22:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SfqvS8mexHYD; Sun, 14 Nov 2021 15:22:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBB5C40105;
	Sun, 14 Nov 2021 15:22:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A4AB1BF964
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 15:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39920606A6
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 15:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eOVJO0ANKCzX for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 15:22:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7D1B6061A
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 15:22:06 +0000 (UTC)
Received: from smtpclient.apple ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPA
 id mHKWmDZWarIRlmHKWm2meg; Sun, 14 Nov 2021 16:22:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636903325; bh=elOVmi6WxkLhh+PJUXIsSkPncQJmafZgKIVX/3+5xys=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=fiyjSApMWxHYwdkMMbnif5LnyOQLq0KuFt4Dz1HkF94DwxgSRZ64oYfyw+IjUevWQ
 nFbOp2r19u28O8hS9HeHV+jL04LMVxF2MOxmd8irRtyyME3eHwanOCGNDWYCKlj+zD
 oEfeBj+DhWCBV/navamJj9MTRlYcqkmnh+yY3Xi2Ie0DKHz6yTjP6MWEU47FccJglY
 eZIWmHg8nVd6KpdfAKcEoCDkNTUwSZpY7pDye4IJ7QXh7R2NToGqt2nzxan4tnqPN8
 OzH70qkC+WabO7CoZoo9MfOQj520W3CfqWPN+zrEkq03gjqgETOAa74zCi+nc3tl9E
 z9EmVmsoJBUFg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 14 Nov 2021 16:22:04 +0100
Message-Id: <2D876177-054C-452C-93CC-F0AC20702B6A@benettiengineering.com>
References: <20211114152432.419c57f3@windsurf>
In-Reply-To: <20211114152432.419c57f3@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (18H107)
X-CMAE-Envelope: MS4wfEWJoGHKSZKYlP/pnAwWneunkagEn3Ix3lJfEpf7Moe9XIySwSxb14OXJbnMS0mmZ1CLQepXhVEwMXAxASlhVIw7Wk7Fx0kosZw8FzkYNAB03lU6WUig
 wUXOsSuE9MV6cxnDdfTlhBXkzg2cYpKCO0bJipXSdJaF1sQcYunHQlvLdVpMPWVzBZD3zyM0iG3L33F0BdfOlGkRUVXItAMQea74WBd17E2VKpGT/IXCFFBK
 iX4Vu2fGHF0duQiTPc72xfgQbDZoN9sGc3uY3hAL7tt0h+as2493mDJcLJzVeDeK
Subject: Re: [Buildroot] [PATCH] configs/olimex_a64_olinuxino_defconfig:
 backport gcc >= 10 u-boot and linux patch
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKPiBJbCBnaW9ybm8gMTQgbm92IDIwMjEsIGFsbGUgb3JlIDE1OjI0LCBU
aG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBoYSBzY3JpdHRv
Ogo+IAo+IO+7v09uIEZyaSwgMTIgTm92IDIwMjEgMTk6MDU6NTYgKzAxMDAKPiBHaXVsaW8gQmVu
ZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4gCj4+
IFRoZSBvbGQgVS1Cb290IHZlcnNpb24gdXNlZCBkb2VzIG5vdCBidWlsZCB3aXRoIGhvc3RjYyA+
PSAxMC4gQmFja3BvcnQgYQo+PiBwYXRjaCBmaXhpbmcgdGhhdCBpc3N1ZS4gU2FtZSBnb2VzIGZv
ciBMaW51eCBzbyBsZXQncyBiYWNrcG9ydCBhIHBhdGNoIGZvcgo+PiBpdCB0b28uCj4+IAo+PiBG
aXhlczoKPj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9i
cy8xNzU4OTY2MTg4Cj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlv
LmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPj4gLS0tCj4+IC4uLnZlLXJlZHVuZGFu
dC1ZWUxPQy1nbG9iYWwtZGVjbGFyYXRpby5wYXRjaCB8IDUyICsrKysrKysrKysrKysrKysrKysK
Pj4gLi4uZS1yZWR1bmRhbnQtWVlMT0MtZ2xvYmFsLWRlY2xhcmF0aW9uLnBhdGNoIHwgMjggKysr
KysrKysrKwo+PiBjb25maWdzL29saW1leF9hNjRfb2xpbnV4aW5vX2RlZmNvbmZpZyAgICAgICAg
fCAgMyArKwo+PiAzIGZpbGVzIGNoYW5nZWQsIDgzIGluc2VydGlvbnMoKykKPj4gY3JlYXRlIG1v
ZGUgMTAwNjQ0IGJvYXJkL29saW1leC9hNjQtb2xpbnV4aW5vL3BhdGNoZXMvbGludXgvMDAwMS1z
Y3JpcHRzLWR0Yy1SZW1vdmUtcmVkdW5kYW50LVlZTE9DLWdsb2JhbC1kZWNsYXJhdGlvLnBhdGNo
Cj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9vbGltZXgvYTY0LW9saW51eGluby9wYXRjaGVz
L3Vib290LzAwMDEtUmVtb3ZlLXJlZHVuZGFudC1ZWUxPQy1nbG9iYWwtZGVjbGFyYXRpb24ucGF0
Y2gKPiAKPiBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLiBIb3dldmVyLCBpdCB3b3VsZCBiZSBn
cmVhdCAoaWYgeW91IGhhdmUgdGhlCj4gaGFyZHdhcmUpIHRvIHVwZGF0ZSB0byBuZXdlciBVLUJv
b3QvTGludXggdmVyc2lvbnMsIHNvIHdlIG5vIGxvbmdlcgo+IG5lZWQgdGhvc2UgYmFja3BvcnRl
ZCBwYXRjaGVzLgoKWWVzLCBJIGhhZCBhIHBhdGNoIHJlYWR5IHdpdGggbGF0ZXN0IHVib290L0xp
bnV4IGFuZCBtYWluc3RyZWFtIEFURi4gQnV0IG15IGJvYXJkIGlzIGJyb2tlbiBhbmQgSSBjYW7i
gJl0IHRlc3QgYW5kIHRoZXJlIGFyZSB0b28gbWFueSBjaGFuZ2VzLgpBbHNvLCBkdWUgdG8gc2hv
cnRhZ2Ugb2YgY29tcG9uZW50cyhJIHRoaW5rKSBJIGNhbuKAmXQgYnV5IGFuIG9saW51eGlubyBh
NjQgYW55d2hlcmUgOi0vClNvIEnigJltIHdhaXRpbmcgdG8gaGF2ZSBpdCBiZWZvcmUgcmVzZW5k
aW5nLiBTbyBJIHdlbnQgZm9yIHRoZSBzbW9vdGhlciBhbmQgc2FmZSBhcHByb2FjaC4KCktpbmQg
cmVnYXJkcwpHaXVsaW8KCj4gCj4gVGhhbmtzIQo+IAo+IFRob21hcwo+IC0tIAo+IFRob21hcyBQ
ZXRhenpvbmksIENUTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5l
ZXJpbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
