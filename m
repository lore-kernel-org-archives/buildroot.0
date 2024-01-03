Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B06DC3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 12:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAF1F40986;
	Wed,  3 Jan 2024 12:41:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAF1F40986
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 82ktbUm-yxc4; Wed,  3 Jan 2024 12:41:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C6F04098F;
	Wed,  3 Jan 2024 12:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C6F04098F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 37AB31BF409
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 12:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E43781E32
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 12:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E43781E32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dcjQiNJjf12E for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 12:41:33 +0000 (UTC)
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D307A81E31
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 12:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D307A81E31
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id AB2C14402F4;
 Wed,  3 Jan 2024 14:39:26 +0200 (IST)
References: <20231208174217.29735-1-louis.chauvet@bootlin.com>
 <87h6ju62xg.fsf@48ers.dk> <87le9662dl.fsf@tarshish>
 <87cyui61o0.fsf@48ers.dk>
User-agent: mu4e 1.10.8; emacs 29.1
To: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Jan 2024 14:39:18 +0200
In-reply-to: <87cyui61o0.fsf@48ers.dk>
Message-ID: <87cyui613a.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1704285566;
 bh=e17hqbxGrUswvD4/LYMxEnW2wyr/744qLVvmlQRcYQk=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=O/vCDwYzjiD/yZvaWmCb3B2RMxv4KlcAK6JEmsORl25P+M0jeAGiCxeSP059J0Jq+
 h+rIQ2Vo2mV/HWn2ZZf1ubzkZrR6iqR6Nj7lqRW/sSSvuB9PfvLkO7b3x+2tChPSSq
 skPTjIBZnJ7guwta0ZvKAYk04Jfq8vyA8+4ZVIRLSaa26WtUfa3bH9F8gvZJr4od3P
 HFrzl7eNqXdRrBDw0ljD8/rpQ45byyLTaQ6GgVtjY5Lu08RAlwk9ckqqhgRnFYAQPv
 prYBPL2vR4eTMx8w/qp6KL25QcjF7JMhiJqWs/IYsBcTgMxFMljFetaWnZR5mUGNcB
 KmjzhDILvDwyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=O/vCDwYz
Subject: Re: [Buildroot] [PATCH v2] boot/arm-trusted-firmware: fix the RPATH
 of fiptool
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: =?utf-8?Q?K=C3=B6ry?= Maincent <kory.maincent@bootlin.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpPbiBXZWQsIEphbiAwMyAyMDI0LCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6Cj4+
Pj4+PiAiQmFydWNoIiA9PSBCYXJ1Y2ggU2lhY2ggPGJhcnVjaEB0a29zLmNvLmlsPiB3cml0ZXM6
Cj4KPiAgPiBIaSBQZXRlciwKPiAgPiBPbiBXZWQsIEphbiAwMyAyMDI0LCBQZXRlciBLb3JzZ2Fh
cmQgd3JvdGU6Cj4gID4+Pj4+Pj4gIkxvdWlzIiA9PSBMb3VpcyBDaGF1dmV0IHZpYSBidWlsZHJv
b3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6Cj4gID4+IAo+ICA+PiA+IFRoZSBh
cm0tdHJ1c3RlZC1maXJtd2FyZSBwYWNrYWdlIGJ1aWxkcyBhIGhvc3QgdG9vbCBjYWxsZWQgImZp
cHRvb2wiLAo+ICA+PiA+IHdoaWNoIGlzIHVzZWQgZHVyaW5nIHRoZSBidWlsZCBwcm9jZXNzIG9m
IGFybS10cnVzdGVkLWZpcm13YXJlCj4gID4+ID4gaXRzZWxmLiBUaGlzIHRvb2wgbGlua3MgYWdh
aW5zdCB0aGUgT3BlblNTTCBob3N0IGxpYnJhcnksIGFuZAo+ICA+PiA+IHRoZXJlZm9yZSBuZWVk
cyB0byBiZSBidWlsdCB3aXRoIHRoZSBjb3JyZWN0IFJQQVRIIHBvaW50aW5nIHRvCj4gID4+ID4g
JEhPU1RfRElSL2xpYi4KPiAgPj4gCj4gID4+ID4gVGhpcyBpcyB3aHkgY29tbWl0IGE5NTdkOWE5
MGFkZTQxOTRkZmZlM2ViMmZjMDEzNmJjNWQwNzdjMjgKPiAgPj4gPiAoImJvb3QvYXJtLXRydXN0
ZWQtZmlybXdhcmU6IGJ1aWxkIGZpcHRvb2wgc2VwYXJhdGVseSB3aXRoIGRlcGVuZGVuY3kKPiAg
Pj4gPiBvIG4gaG9zdC1vcGVuc3NsIikgYWRkZWQgdGhlIEFSTV9UUlVTVEVEX0ZJUk1XQVJFX0JV
SUxEX0ZJUFRPT0wKPiAgPj4gPiB2YXJpYWJsZSwgd2hpY2ggYnVpbGRzIHRoZSBmaXB0b29sIHRv
b2wgZmlyc3QsIHdpdGggdGhlIHJpZ2h0Cj4gID4+ID4gdmFyaWFibGVzIHNldCwgYmVmb3JlIGlu
dm9raW5nIHRoZSBmdWxsIGJ1aWxkIG9mIFRGLUEuIFRoaXMgZW5zdXJlZAo+ICA+PiA+IHRoYXQg
ZmlwdG9vbCB3YXMgYnVpbHQgd2l0aCB0aGUgY29ycmVjdCBSUEFUSC4KPiAgPj4gCj4gID4+ID4g
SG93ZXZlciwgbW9yZSByZWNlbnQgdmVyc2lvbnMgb2YgVEYtQSBoYXZlIG1vZGlmaWVkIHRoZWly
IE1ha2VmaWxlCj4gID4+ID4gbWFjaGluZXJ5LCBhbmQgZmlwdG9vbCBpcyBiZWluZyByZWJ1aWx0
IGV2ZW4gaWYgaXQgd2FzIGJ1aWx0Cj4gID4+ID4gYmVmb3JlLiBVbmZvcnR1bmF0ZWx5LCB0aGlz
IHJlYnVpbGQgaXMgbm8gbG9uZ2VyIGRvbmUgd2l0aCB0aGUgcmlnaHQKPiAgPj4gPiBmbGFncywg
c28gd2UgZW5kIHVwIHdpdGggYSBmaXB0b29sIGJpbmFyeSB0aGF0IG5vIGxvbmdlciBoYXMgdGhl
IHJpZ2h0Cj4gID4+ID4gUlBBVEgsIGFuZCBmaXB0b29sIGZhaWxzIHRvIGZpbmQgdGhlIE9wZW5T
U0wgbGlicmFyaWVzIGZyb20KPiAgPj4gPiAkSE9TVF9ESVIvbGliLgo+ICA+PiAKPiAgPj4gPiBJ
biBvcmRlciB0byBmaXggdGhpcywgd2UgdGFrZSBhIGRpZmZlcmVudCBhcHByb2FjaDogd2UgZG8g
bm90IGJ1aWxkCj4gID4+ID4gZmlwdG9vbCBzZXBhcmF0ZWx5IGZpcnN0LCBidXQgd2UgaW5qZWN0
IHRoZSBuZWNlc3NhcnkgZmxhZ3MgdGhyb3VnaAo+ICA+PiA+IHRoZSBIT1NUQ0MgdmFyaWFibGUu
IEluZGVlZCwgdGhlcmUncyBubyBIT1NUX0xERkxBR1Mgb3IgSE9TVF9MRExJQlMKPiAgPj4gPiB2
YXJpYWJsZSBvciBzaW1pbGFyIHRoYXQgd291bGQgYWxsb3cgdXMgdG8gcGFzcyB0aGUgLVdsLC1y
cGF0aCBmbGFnCj4gID4+ID4gdGhhdCBpcyBuZWVkZWQuIFNob2UtaG9ybmluZyB0aGlzIGZsYWcg
aW50byBIT1NUQ0MgZ2V0cyB0aGUgam9iIGRvbmUsCj4gID4+ID4gYW5kIGFjdHVhbGx5IHNpbXBs
aWZpZXMgb3VyIGFybS10cnVzdGVkLWZpcm13YXJlLm1rLgo+ICA+PiAKPiAgPj4gPiBUaGlzIHBh
dGNoIGJyZWFrIHRoZSBjb21wYXRpYmlsaXR5IHdpdGggdmVyc2lvbiBwcmlvciB0byAxLjQgKHVw
c3RyZWFtCj4gID4+ID4gY29tbWl0IDcyNjEwYzQxMDI5OTAgKCJidWlsZDogSW50cm9kdWNlIEhP
U1RDQyBmbGFnIikpLiB2MS40IGlzIHZlcnkgb2xkCj4gID4+ID4gKEp1bHkgMjAxNyksIG5vdCB1
c2VkIGFueW1vcmUgaW4tdHJlZSBhbmQgcHJvYmFibHkgbm90IHVzZWQgYW55bW9yZQo+ICA+PiA+
IG91dHNpZGUgdGhlIHRyZWUuCj4gID4+IAo+ICA+PiA+IFNpZ25lZC1vZmYtYnk6IExvdWlzIENo
YXV2ZXQgPGxvdWlzLmNoYXV2ZXRAYm9vdGxpbi5jb20+Cj4gID4+ID4gQ28tYXV0aG9yZWQtYnk6
IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gID4+ID4g
LS0tCj4gID4+ID4gUHJldmlvdXMgdmVyc2lvbjoKPiAgPj4gPiAgICBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9idWlsZHJvb3QvMjAyMzEyMDYxNjQ0MzcuMjIxOTEtMS1sb3Vpcy5jaGF1dmV0QGJv
b3RsaW4uY29tLwo+ICA+PiAKPiAgPj4gPiBDaGFuZ2VzIHYxLT52MjoKPiAgPj4gPiAgICBVcGRh
dGUgY29tbWl0IGxvZyBhYm91dCBjb21wYXRpYmlsdHkKPiAgPj4gCj4gID4+IENvbW1pdHRlZCB0
byAyMDIzLjAyLnggYW5kIDIwMjMuMTEueCwgdGhhbmtzLgo+Cj4gID4gS8O2cnkgTWFpbmNlbnQg
cmVwb3J0ZWQgdGhhdCB0aGlzIGNvbW1pdCBicmVha3MgZmlwdG9vbCBidWlsZCBmb3Igc29tZQo+
ICA+IHBsYXRmb3Jtcy4KPgo+ICA+ICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMx
MjI0MTYyMjU0LjU4OWIzOTVjQGttYWluY2VudC1YUFMtMTMtNzM5MC8KPgo+IEhtbSwgeWVzLiBJ
IGRpZG4ndCBzZWUgYW55IGNvbW11bmljYXRpb24gYWJvdXQgdGhpcyBzaW5jZSB0aGVuIG9yCj4g
ZGVmY29uZmlnIGZhaWx1cmVzLCBidXQgSSBtYXkgaGF2ZSBtaXNzZWQgdGhlbS4gTG91aXM/CgpU
aGUgbGFzdCBkZWZjb25maWcgdGVzdCByZXBvcnQgc2hvd3MgdGhlc2UgZmFpbHVyZXM6CgogIGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjMtRGVjZW1i
ZXIvNjgxODM1Lmh0bWwKCkZvciBleGFtcGxlIChzb2xpZHJ1bl9tYWNjaGlhdG9iaW4pOgoKICBo
dHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzU4MzQ3NTg3
NzcKCmJhcnVjaAoKLS0gCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfi4gLn4gICBUayBPcGVuIFN5c3RlbXMKPX0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1vb08tLVUtLU9vby0tLS0tLS0tLS0tLXs9CiAg
IC0gYmFydWNoQHRrb3MuY28uaWwgLSB0ZWw6ICs5NzIuNTIuMzY4LjQ2NTYsIGh0dHA6Ly93d3cu
dGtvcy5jby5pbCAtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
