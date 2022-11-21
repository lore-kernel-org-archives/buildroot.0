Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346C7C4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 06:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EEA5818E6;
	Mon, 21 Nov 2022 06:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EEA5818E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WW4bGrbufbBl; Mon, 21 Nov 2022 06:34:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B3388141F;
	Mon, 21 Nov 2022 06:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B3388141F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 806691BF313
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 06:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5561B81098
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 06:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5561B81098
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7_Jn9gt3bG2c for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 06:33:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9A6581062
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9A6581062
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 06:33:56 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 21153440764;
 Mon, 21 Nov 2022 08:31:13 +0200 (IST)
References: <20221120181955.851456-1-anisse@astier.eu>
User-agent: mu4e 1.8.10; emacs 27.1
To: Anisse Astier <anisse@astier.eu>
Date: Mon, 21 Nov 2022 08:27:09 +0200
In-reply-to: <20221120181955.851456-1-anisse@astier.eu>
Message-ID: <878rk4g6jz.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1669012273;
 bh=33BQ/+k3joz0o11/HvnQBKiDa4rlIgkRLP185nCsTmg=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=CMxsYFlpA3MS2mIXo8JkP/oYsw07i3U/CCrlTy0WEfFUHqp/AwQwloFZM5pUAVlMJ
 HD7l7hlm5TOeTnZlLDWGnMpQt8g9A6FU+KcTN6wkZWeR3ahSIe9AXhDMjhyleTfhwl
 zA1E78tvrqS9AtSdr09SrsvlmS+JXg4sqBERPaRcJ9rrrqV5Pq6ePSknDBlcecZEIc
 usMI11HZFjcJGG6eCCbda1s3GxgsunVaYBkdJ5B0dSI3rOryvXKznK3fvK00R3yXg5
 rXxUb5AxxgOAyfaUnTQcA2ibmECQlhfmYZeItSJDKGXluAkxsjYUUAkHe4OoBH1OCn
 doC/iKyICXseQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=CMxsYFlp
Subject: Re: [Buildroot] [PATCH RFC] package/go: disable cgo support with
 static libs
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQW5pc3NlLAoKT24gU3VuLCBOb3YgMjAgMjAyMiwgQW5pc3NlIEFzdGllciB3cm90ZToKPiBU
aGUgZ28gc3RkbGliICJwbHVnaW4i4oCvcGFja2FnZSByZWxpZXMgb24gZGxmY24uaCB3aGljaCBp
c24ndCBhdmFpbGFibGUKPiB3aGVuIHdlIGhhdmUgQlIyX1NUQVRJQ19MSUJTPXkuCj4KPiBUaGlz
IHNob3VsZCBmaXggdGhpcyBidWlsZCBlcnJvciBmcm9tIGF1dG9idWlsZGVyczoKPgo+IC9idWls
ZHJvb3QvaTY4Ni1ob3N0Z28tZmFpbC9idWlsZC9ob3N0LWdvLTEuMTkuMy9zcmMvcGx1Z2luL3Bs
dWdpbl9kbG9wZW4uZ286MTE6MTA6IGZhdGFsIGVycm9yOiBkbGZjbi5oOiBObyBzdWNoIGZpbGUg
b3IgZGlyZWN0b3J5Cj4gICAgMTEgfCAjaW5jbHVkZSA8ZGxmY24uaD4KPgo+IFRoZSBtb3JlIGxv
bmd0ZXJtIGFwcHJvYWNoIHdvdWxkIGJlIHRvIGFzayB1cHN0cmVhbSBmb3IgYSBidWlsZCB0YWcg
dG8KPiBkaXNhYmxlIHRoZSBwbHVnaW4gcGFja2FnZSwgYWtpbiB0byB0aGUgb3N1c2VyZ28gb3Ig
bmV0Z28gdGFnczoKPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9nb2xhbmcvZ28vaXNzdWVzLzIzMjY1
Cj4KPiBXaGlsZSBpdCB3b3VsZCBiZSBxdWl0ZSBzaW1wbGUsIEkgZG9uJ3QgdGhpbmsgYSBidWls
ZHJvb3QgcGF0Y2ggZm9yIHRoaXMKPiB3aXRob3V0IHVwc3RyZWFtIHN1cHBvcnQgd291bGQgYmUg
aWRlYWwuCgpZb3VyIHNpZ24tb2ZmIGhlcmUgaXMgbWlzc2luZy4KCj4gLS0tCj4gIHBhY2thZ2Uv
Z28vZ28ubWsgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ28vZ28ubWsgYi9wYWNrYWdlL2dvL2dv
Lm1rCj4gaW5kZXggZmQ0Y2FhMmU1YS4uMWMzY2ZhOTRkNCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdl
L2dvL2dvLm1rCj4gKysrIGIvcGFja2FnZS9nby9nby5tawo+IEBAIC04Nyw3ICs4Nyw3IEBAIEhP
U1RfR09fVEFSR0VUX0VOViA9IFwKPiAgIyBzZXQsIGJ1aWxkIGluIGNnbyBzdXBwb3J0IGZvciBh
bnkgZ28gcHJvZ3JhbXMgdGhhdCBtYXkgbmVlZCBpdC4gIE5vdGUgdGhhdAo+ICAjIGFueSB0YXJn
ZXQgcGFja2FnZSBuZWVkaW5nIGNnbyBzdXBwb3J0IG11c3QgaW5jbHVkZQo+ICAjICdkZXBlbmRz
IG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMnIGluIGl0cyBjb25maWcgZmlsZS4KPiAtaWZl
cSAoJChCUjJfVE9PTENIQUlOX0hBU19USFJFQURTKSx5KQo+ICtpZmVxICgkKEJSMl9UT09MQ0hB
SU5fSEFTX1RIUkVBRFMpJChCUjJfU1RBVElDX0xJQlMpLHluKQoKVGhpcyB3aWxsIG5vdCB3b3Jr
IGFzIHlvdSBpbnRlbmQuICQoQlIyX1NUQVRJQ19MSUJTKSByZXNvbHZlIHRvIGFuIGVtcHR5CnN0
cmluZyB3aGVuIEJSMl9TVEFUSUNfTElCUyBpcyBub3Qgc2V0LiBZb3Ugd2FudCBzb21ldGhpbmcg
bGlrZToKCmlmZXEgKCQoQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyk6JChCUjJfU1RBVElDX0xJ
QlMpLHk6KQoKYmFydWNoCgo+ICBIT1NUX0dPX0NHT19FTkFCTEVEID0gMQo+ICBlbHNlCj4gIEhP
U1RfR09fQ0dPX0VOQUJMRUQgPSAwCgoKLS0gCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfi4gLn4gICBUayBPcGVuIFN5c3RlbXMKPX0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1vb08tLVUtLU9vby0tLS0t
LS0tLS0tLXs9CiAgIC0gYmFydWNoQHRrb3MuY28uaWwgLSB0ZWw6ICs5NzIuNTIuMzY4LjQ2NTYs
IGh0dHA6Ly93d3cudGtvcy5jby5pbCAtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
