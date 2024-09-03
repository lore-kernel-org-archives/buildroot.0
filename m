Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7533DCD13CF
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 08:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 164BA40313;
	Tue,  3 Sep 2024 08:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kcnVEV8m-kP0; Tue,  3 Sep 2024 08:13:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5A0840314
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5A0840314;
	Tue,  3 Sep 2024 08:13:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F8771BF34B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 08:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B823403A9
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 08:13:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ZqFBlp6pdx8 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 08:13:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E933E40025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E933E40025
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E933E40025
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 08:13:39 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id DE905440DA8;
 Tue,  3 Sep 2024 11:11:36 +0300 (IDT)
To: Lars Wikman <lars@underjord.io>
In-Reply-To: <CADqW+qn3TnF3LyUaYs3jfMSDT3wMC57q+r3gV0+UoOsxSVKYOA@mail.gmail.com>
 (Lars Wikman's message of "Tue, 3 Sep 2024 10:00:00 +0200")
References: <20240903073929.3717568-1-lars@underjord.io>
 <871q21i38z.fsf@tarshish>
 <CADqW+qn3TnF3LyUaYs3jfMSDT3wMC57q+r3gV0+UoOsxSVKYOA@mail.gmail.com>
Date: Tue, 03 Sep 2024 11:13:37 +0300
Message-ID: <87wmjtgnny.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1725351096;
 bh=DYbpl0IGPpqpG4FYrOqmOrKGk/io4wmoNY3IJhQrOHU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=LLAP484d1bQT6YYz90eYduCR+cxG7eNg084SN+QSQJw9HupPcSYG6hlnN9zIEJlPE
 0nXM0A2tFGptbmR3wNu/PdXxW7lqSiPLyOgILuQC65bsUB5JlbIVKQhEwjtbTnj/gv
 FuqD00Q1Z4D+lveVRSBWVfJGXNE+K2gdf7N+SiqufbJTgVqMPIllULWwBeODShCxEW
 MizE8HPShCvPjs2pZGmEiGIlLHwoswcO8yyzSvMaYqYk76MvAf7bGon4/NwLB0oBxX
 6H4pAqjlkLal8XWwRv2EGc0CmZdgTHXC1XymI9xVwrLUZfA9Ifja66Zq/FcJULy+nG
 b1RAt3XVj+Yxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=LLAP484d
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

SGkgTGFycywKCk9uIFR1ZSwgU2VwIDAzIDIwMjQsIExhcnMgV2lrbWFuIHdyb3RlOgo+IFRoZSBl
eGlzdGluZyBsaW5lIHdhcyA9IGFzIGl0IHdhcyB0aGUgZmlyc3QgcmVmZXJlbmNlIHRvIFdQQV9T
VVBQTElDQU5UX0NPTkZJR19ESVNBQkxFLgo+IFNvIEkga2VwdCBpdCB0aGF0IHdheS4KClRoZSBl
eGlzdGluZyBsaW5lIGlzIGZpcnN0IGFzc2lnbm1lbnQgdGhhdCBpbml0aWFsaXplcwpXUEFfU1VQ
UExJQ0FOVF9DT05GSUdfRElTQUJMRS4gQWxsIGluaXRpYWwgYXNzaWdubWVudHMgdXNlID0gaW4g
dGhpcwpmaWxlIGFuZCBvdGhlcnMuCgpGb2xsb3dpbmcgY29uZGl0aW9uYWwgYXNzaWdubWVudHMg
c2hvdWxkIG9ubHkgYWRkIHRvIGV4aXN0aW5nIHZhbHVlLCBub3QKb3ZlcndyaXRlIGl0LgoKYmFy
dWNoCgo+IEhhcHB5IHRvIGNoYW5nZSBpdCBpZiBJIHNob3VsZCBzdGlsbC4gSSdtIG5vdCBwYXJ0
aWN1bGFybHkgdXNlZCB0bwo+IHRoZXNlIGZpbGVzIG9yIGNvbnZlbnRpb25zLgo+Cj4gLSBMYXJz
Cj4KPiBPbiBUdWUsIFNlcCAzLCAyMDI0IGF0IDk6NTHigK9BTSBCYXJ1Y2ggU2lhY2ggPGJhcnVj
aEB0a29zLmNvLmlsPiB3cm90ZToKPiAgT24gVHVlLCBTZXAgMDMgMjAyNCwgTGFycyBXaWttYW4g
d3JvdGU6Cj4gID4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvd3BhX3N1cHBs
aWNhbnQubWvimqDvuI8gYi9wYWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9zdXBwbGljYW50Lm1r
4pqg77iPCj4gID4gaW5kZXggOTg0OTU5ZjY3OS4uYTdiNzgwMGM5OSAxMDA2NDQKPiAgPiAtLS0g
YS9wYWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9zdXBwbGljYW50Lm1r4pqg77iPCj4gID4gKysr
IGIvcGFja2FnZS93cGFfc3VwcGxpY2FudC93cGFfc3VwcGxpY2FudC5ta+KaoO+4jwo+ICA+IEBA
IC0yNCw4ICsyNCwxMSBAQCBXUEFfU1VQUExJQ0FOVF9DT05GSUdfRU5BQkxFID0gXAo+ICA+ICAg
ICAgIENPTkZJR19JTlRFUk5BTF9MSUJUT01NQVRIIFwKPiAgPiAgICAgICBDT05GSUdfTUFUQ0hf
SUZBQ0UKPiAgPiAgCj4gID4gLVdQQV9TVVBQTElDQU5UX0NPTkZJR19ESVNBQkxFID0gXAo+ICA+
IC0gICAgIENPTkZJR19TTUFSVENBUkQKPiAgPiAraWZlcSAoJChCUjJfUEFDS0FHRV9XUEFfU1VQ
UExJQ0FOVF9TTUFSVENBUkQpLHkpCj4gID4gK1dQQV9TVVBQTElDQU5UX0NPTkZJR19FTkFCTEUg
Kz0gQ09ORklHX1NNQVJUQ0FSRAo+ICA+ICtlbHNlCj4gID4gK1dQQV9TVVBQTElDQU5UX0NPTkZJ
R19ESVNBQkxFID0gQ09ORklHX1NNQVJUQ0FSRAo+Cj4gIFNob3VsZCBiZSArPSBoZXJlLiBPdGhl
cndpc2UgV1BBX1NVUFBMSUNBTlRfQ09ORklHX0RJU0FCTEUgaXMKPiAgb3ZlcndyaXR0ZW4uCj4K
PiAgYmFydWNoCj4KPiAgPiArZW5kaWYKPiAgPiAgCj4gID4gICMgbGlibmwtMyBuZWVkcyAtbG0g
KGZvciByaW50KSBhbmQgLWxwdGhyZWFkIGlmIGxpbmtpbmcgc3RhdGljYWxseQo+ICA+ICAjIEFu
ZCBsaWJyYXJ5IG9yZGVyIG1hdHRlcnMgaGVuY2Ugc3RpY2sgLWxubC0zIGZpcnN0IHNpbmNlIGl0
J3MgYXBwZW5kZWQKCi0tIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIH4uIC5+ICAgVGsgT3BlbiBTeXN0ZW1zCj19LS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tb29PLS1VLS1Pb28tLS0tLS0tLS0tLS17PQog
ICAtIGJhcnVjaEB0a29zLmNvLmlsIC0gdGVsOiArOTcyLjUyLjM2OC40NjU2LCBodHRwOi8vd3d3
LnRrb3MuY28uaWwgLQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
