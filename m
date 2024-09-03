Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BC4CD3427
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 08:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CD7580A4D;
	Tue,  3 Sep 2024 08:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vs4KGsW2rPfZ; Tue,  3 Sep 2024 08:45:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93D2680A56
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93D2680A56;
	Tue,  3 Sep 2024 08:45:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9338F1BF34B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 08:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ECD34028D
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 08:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6RDJzWSCYALQ for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 08:44:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B4CA40210
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B4CA40210
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B4CA40210
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 08:44:57 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 78A9A440CD1;
 Tue,  3 Sep 2024 11:42:54 +0300 (IDT)
To: Lars Wikman <lars@underjord.io>
In-Reply-To: <CADqW+qm-jkPWT29uFgMqEpur4Y5WpJZhrGUzjL5s==Nu6sySEw@mail.gmail.com>
 (Lars Wikman's message of "Tue, 3 Sep 2024 10:39:15 +0200")
References: <20240903073929.3717568-1-lars@underjord.io>
 <871q21i38z.fsf@tarshish>
 <CADqW+qn3TnF3LyUaYs3jfMSDT3wMC57q+r3gV0+UoOsxSVKYOA@mail.gmail.com>
 <87wmjtgnny.fsf@tarshish>
 <CADqW+qm-jkPWT29uFgMqEpur4Y5WpJZhrGUzjL5s==Nu6sySEw@mail.gmail.com>
Date: Tue, 03 Sep 2024 11:44:54 +0300
Message-ID: <87seuhgm7t.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1725352974;
 bh=pOhR7lfnhFt01KIskHxceFBJA2vmhq6osT4k1eM5Cgs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qeLpnGzBqiT1CzYFOzGzXoUTKsvHK6YVCCC6GnK4rWPOs4q5ddqLOQKVgUFEgCeDX
 v4FGKTQFtBTE5y9xgE6/Q2vTED2vRbcZfqGtQgMPteemKG5GaxANVFJQ6RHxuop7Op
 Ct7AS++iiIzSHCviDk5oQOwvDb/pGuvnubR8kf9J+moHdJadXCOyScjiMBNMAb/zB2
 qwgg4o0eUxiYNDFM+gjhLTElWmyhgMxFELLzX4GnB+eOQLz1rFuqNrTg6UCCMy2Lx2
 2kXyKF0bmt+mhxaltIVJtlExQY6S77UFBTiT/6PI/hmLs6JxTInlLkYIvnRMXPeKHa
 2rmaRCY245ovg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=qeLpnGzB
Subject: Re: [Buildroot] [PATCH v2] package/wpa_supplicant: add Smart card
 option
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTGFycywKCk9uIFR1ZSwgU2VwIDAzIDIwMjQsIExhcnMgV2lrbWFuIHdyb3RlOgo+IFRoaXMg
d2FzIHRoZSBvbmx5IGluaXRpYWwgYXNzaWdubWVudCBmb3IgRElTQUJMRSBiZWluZyBtYWRlLiBB
bmQgbm93Cj4gaXQgaXMgY29uZGl0aW9uYWwgb24gdGhlIG5ldyBvcHRpb24uIFdoYXQgd291bGQg
YmUgdGhlIHByZWZlcnJlZCB3YXkKPiB0byBkbyBpdD8KPgo+IENhbiBESVNBQkxFIGJlIGxlZnQg
Ymxhbms/IE9yIGxlZnQgb3V0IHVudGlsIGl0IGlzIGNvbmRpdGlvbmFsbHkgc2V0Pwo+Cj4gSGFw
cHkgdG8gZG8gaXQgZWl0aGVyIHdheSwgaXQgd2FzIG5vdCBvYnZpb3VzIHRvIG1lIGhvdyBpdCBz
aG91bGQgYmUKPiBoYW5kbGVkIHNvIEkgZGlkIHRoaXMuCgpKdXN0IHJlbW92ZSB0aGUgaW5pdGlh
bCBhc3NpZ25tZW50IGFzIHlvdSBkaWQuIE5vIG5lZWQgdG8gaW5pdGlhbGl6ZSB0bwpibGFuay4g
VGhpcyBpcyB0aGUgY29tbW9uIGNvbnZlbnRpb24gaW4gQnVpbGRyb290LgoKVGhhbmtzLApiYXJ1
Y2gKCj4gT24gVHVlLCAzIFNlcCAyMDI0IGF0IDEwOjEzLCBCYXJ1Y2ggU2lhY2ggPGJhcnVjaEB0
a29zLmNvLmlsPiB3cm90ZToKPiAgT24gVHVlLCBTZXAgMDMgMjAyNCwgTGFycyBXaWttYW4gd3Jv
dGU6Cj4gID4gVGhlIGV4aXN0aW5nIGxpbmUgd2FzID0gYXMgaXQgd2FzIHRoZSBmaXJzdCByZWZl
cmVuY2UgdG8gV1BBX1NVUFBMSUNBTlRfQ09ORklHX0RJU0FCTEUuCj4gID4gU28gSSBrZXB0IGl0
IHRoYXQgd2F5Lgo+Cj4gIFRoZSBleGlzdGluZyBsaW5lIGlzIGZpcnN0IGFzc2lnbm1lbnQgdGhh
dCBpbml0aWFsaXplcwo+ICBXUEFfU1VQUExJQ0FOVF9DT05GSUdfRElTQUJMRS4gQWxsIGluaXRp
YWwgYXNzaWdubWVudHMgdXNlID0gaW4gdGhpcwo+ICBmaWxlIGFuZCBvdGhlcnMuCj4KPiAgRm9s
bG93aW5nIGNvbmRpdGlvbmFsIGFzc2lnbm1lbnRzIHNob3VsZCBvbmx5IGFkZCB0byBleGlzdGlu
ZyB2YWx1ZSwgbm90Cj4gIG92ZXJ3cml0ZSBpdC4KPgo+ICBiYXJ1Y2gKPgo+ICA+IEhhcHB5IHRv
IGNoYW5nZSBpdCBpZiBJIHNob3VsZCBzdGlsbC4gSSdtIG5vdCBwYXJ0aWN1bGFybHkgdXNlZCB0
bwo+ICA+IHRoZXNlIGZpbGVzIG9yIGNvbnZlbnRpb25zLgo+ICA+Cj4gID4gLSBMYXJzCj4gID4K
PiAgPiBPbiBUdWUsIFNlcCAzLCAyMDI0IGF0IDk6NTHigK9BTSBCYXJ1Y2ggU2lhY2ggPGJhcnVj
aEB0a29zLmNvLmlsPiB3cm90ZToKPiAgPiAgT24gVHVlLCBTZXAgMDMgMjAyNCwgTGFycyBXaWtt
YW4gd3JvdGU6Cj4gID4gID4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvd3Bh
X3N1cHBsaWNhbnQubWvimqDvuI/imqDvuI8gYi9wYWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9z
dXBwbGljYW50Lm1r4pqg77iP4pqg77iPCj4gID4gID4gaW5kZXggOTg0OTU5ZjY3OS4uYTdiNzgw
MGM5OSAxMDA2NDQKPiAgPiAgPiAtLS0gYS9wYWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9zdXBw
bGljYW50Lm1r4pqg77iP4pqg77iPCj4gID4gID4gKysrIGIvcGFja2FnZS93cGFfc3VwcGxpY2Fu
dC93cGFfc3VwcGxpY2FudC5ta+KaoO+4j+KaoO+4jwo+ICA+ICA+IEBAIC0yNCw4ICsyNCwxMSBA
QCBXUEFfU1VQUExJQ0FOVF9DT05GSUdfRU5BQkxFID0gXAo+ICA+ICA+ICAgICAgIENPTkZJR19J
TlRFUk5BTF9MSUJUT01NQVRIIFwKPiAgPiAgPiAgICAgICBDT05GSUdfTUFUQ0hfSUZBQ0UKPiAg
PiAgPiAgCj4gID4gID4gLVdQQV9TVVBQTElDQU5UX0NPTkZJR19ESVNBQkxFID0gXAo+ICA+ICA+
IC0gICAgIENPTkZJR19TTUFSVENBUkQKPiAgPiAgPiAraWZlcSAoJChCUjJfUEFDS0FHRV9XUEFf
U1VQUExJQ0FOVF9TTUFSVENBUkQpLHkpCj4gID4gID4gK1dQQV9TVVBQTElDQU5UX0NPTkZJR19F
TkFCTEUgKz0gQ09ORklHX1NNQVJUQ0FSRAo+ICA+ICA+ICtlbHNlCj4gID4gID4gK1dQQV9TVVBQ
TElDQU5UX0NPTkZJR19ESVNBQkxFID0gQ09ORklHX1NNQVJUQ0FSRAo+ICA+Cj4gID4gIFNob3Vs
ZCBiZSArPSBoZXJlLiBPdGhlcndpc2UgV1BBX1NVUFBMSUNBTlRfQ09ORklHX0RJU0FCTEUgaXMK
PiAgPiAgb3ZlcndyaXR0ZW4uCj4gID4KPiAgPiAgYmFydWNoCj4gID4KPiAgPiAgPiArZW5kaWYK
PiAgPiAgPiAgCj4gID4gID4gICMgbGlibmwtMyBuZWVkcyAtbG0gKGZvciByaW50KSBhbmQgLWxw
dGhyZWFkIGlmIGxpbmtpbmcgc3RhdGljYWxseQo+ICA+ICA+ICAjIEFuZCBsaWJyYXJ5IG9yZGVy
IG1hdHRlcnMgaGVuY2Ugc3RpY2sgLWxubC0zIGZpcnN0IHNpbmNlIGl0J3MgYXBwZW5kZWQKCi0t
IAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH4u
IC5+ICAgVGsgT3BlbiBTeXN0ZW1zCj19LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tb29PLS1VLS1Pb28tLS0tLS0tLS0tLS17PQogICAtIGJhcnVjaEB0a29z
LmNvLmlsIC0gdGVsOiArOTcyLjUyLjM2OC40NjU2LCBodHRwOi8vd3d3LnRrb3MuY28uaWwgLQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
