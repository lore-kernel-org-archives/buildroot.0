Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA327E6FE49
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 07:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D6AF4033F;
	Mon,  9 Sep 2024 07:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ijE9h_Vmg8ib; Mon,  9 Sep 2024 07:47:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D10774022B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D10774022B;
	Mon,  9 Sep 2024 07:47:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D3B391BF3BF
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 07:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C09F3605D1
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 07:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0LQkterhjmtz for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 07:47:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E4AF9605C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4AF9605C6
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4AF9605C6
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 07:47:00 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id EE6D1440CDB;
 Mon,  9 Sep 2024 10:44:44 +0300 (IDT)
To: Lars Wikman <lars@underjord.io>
In-Reply-To: <CADqW+qk-VLMa2m510NvmTZv927DWyt8dgD6ir55ZHeHtS8AzKg@mail.gmail.com>
 (Lars Wikman's message of "Mon, 9 Sep 2024 09:18:39 +0200")
References: <20240903100952.3789698-1-lars@underjord.io>
 <CADqW+qk-VLMa2m510NvmTZv927DWyt8dgD6ir55ZHeHtS8AzKg@mail.gmail.com>
Date: Mon, 09 Sep 2024 10:46:53 +0300
Message-ID: <875xr56zgy.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1725867884;
 bh=mJQ+goM0QGwHImGuhPWap0lNGsf2YOXinUN17ZB1jYI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=YmRxAHq5KIEfGNzt0Ah1PcdsS2krddCjxpCbQbWo/CEU1eSjx5o6y7Cl2DUJZVOSX
 tbI4dpr1s5zbhnbpgpHnrMqq63V9NYeZnSSf06BXKt3LlxoZDbeIlBb19Lcq87OoIt
 qxFXwpyfHg2J0jtvxjaTbuOJxddEuY8K1utYlDwOk4aeNC7fpfZxFceChzNIZBfg/k
 RUw2rtwpmMEhyLd6bbPmp/McIUh48aEXhXSRgY+eGrIBffu7UHeyE2EZ29VnExJMt6
 6++y+0CZINPq7yz9YabJoWs6B7ajwWLj2HJVKGc30+k/+M5o2khYvN+9xiw/fxE1IE
 b8Kx8U2FoWL8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=YmRxAHq5
Subject: Re: [Buildroot] [PATCH v3] package/wpa_supplicant: add Smart card
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

SGkgTGFycywKCk9uIE1vbiwgU2VwIDA5IDIwMjQsIExhcnMgV2lrbWFuIHdyb3RlOgo+IEkgc3Vi
bWl0dGVkIGEgdjMgd2hpY2ggSSBzZWUgaW4gcGF0Y2h3b3JrIGJ1dCBJIGRvbid0IHNlZSBpdCBp
biBteQo+IHNlbnQgZW1haWwgc28gSSdtIHVuY2VydGFpbiBhYm91dCB3aGV0aGVyIGl0IHJlYWNo
ZWQgdGhlIGxpc3Qgb2theS4KPgo+IExpbmsgaW4gcGF0Y2h3b3JrOiBodHRwczovL3BhdGNod29y
ay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwOTAzMTAwOTUyLjM3ODk2
OTgtMS1sYXJzQHVuZGVyam9yZC5pby8KClBhdGNoZXMgYXJlIHRyYWNrZWQgb24gcGF0Y2h3b3Jr
LiBJZiB5b3VyIHBhdGNoIGlzIHRoZXJlLCBtYWludGFpbmVycwp3aWxsIGdldCB0byBpdCBzb29u
ZXIgb3IgbGF0ZXIuCgpZb3VyIHBhdGNoIGlzIGFsc28gb24gdGhlIGxpc3QgYXJjaGl2ZToKCiAg
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwOTAzMTAwOTUyLjM3ODk2OTgtMS1sYXJz
QHVuZGVyam9yZC5pby8KClNvIGFsbCBsb29rcyBPSy4KCmJhcnVjaAoKPiBPbiBUdWUsIFNlcCAz
LCAyMDI0IGF0IDEyOjA54oCvUE0gTGFycyBXaWttYW4gPGxhcnNAdW5kZXJqb3JkLmlvPiB3cm90
ZToKPgo+ICBDT05GSUdfU01BUlRDQVJEIHdhcyB1bmNvbmRpdGlvbmFsbHkgZGlzYWJsZWQgd2hp
Y2ggaGFzIG1lYW50IHRoYXQKPiAgZXZlbiBpZiBPcGVuU1NMIGlzIGNvbXBpbGVkIHdpdGggZW5n
aW5lIHN1cHBvcnQgYW5kIHRoZSBzdXBwbGljYW50Cj4gIGlzIGNvbmZpZ3VyZWQgdG8gdXNlIGFu
IGVuZ2luZSBpdCB3b3VsZCB3YXJuIHRoYXQgaXQgd2FzIGNvbXBpbGVkCj4gIHdpdGhvdXQgZW5n
aW5lIHN1cHBvcnQuCj4KPiAgVGhpcyBtZWNoYW5pc20gaXMgdXNlZCB0byBlbmFibGUgdGhlIG1v
cmUgc2VjdXJlIGZvcm1zIG9mIDgwMi4xeAo+ICBuZXR3b3JraW5nIGF1dGhlbnRpY2F0aW9uIHN1
Y2ggYXMgRUFQLVRMUyB3aXRoIGhhcmR3YXJlLWRlbGVnYXRlZAo+ICBjcnlwdG9ncmFwaHkgYW5k
IHByaXZhdGUga2V5cyBwcm90ZWN0ZWQgaW4gaGFyZHdhcmUuCj4KPiAgSXQgaXMgc3RpbGwgZGlz
YWJsZWQgYnkgZGVmYXVsdCBpbiBjYXNlIHRoZXJlIHdhcyBhbiBvcmlnaW5hbCByZWFzb24uCj4K
PiAgRW5hYmxpbmcgdGhlIG9wdGlvbiB3aWxsIGFsbG93IGRlbGVnYXRpbmcgcHJpdmF0ZSBrZXkg
YWNjZXNzIHRvIFRQTTIsCj4gIEFSTSBUcnVzdFpvbmUgYW5kIG90aGVyIHNwZWNpYWxpemVkIHNl
Y3VyZSBoYXJkd2FyZSBmb3IgZXN0YWJsaXNoaW5nCj4gIGEgbmV0d29yayBjb25uZWN0aW9uLgo+
Cj4gIFNpZ25lZC1vZmYtYnk6IExhcnMgV2lrbWFuIDxsYXJzQHVuZGVyam9yZC5pbz4KPgo+ICAt
LS0KPiAgQ2hhbmdlcyB2MSAtPiB2MjoKPiAgICAtIENoYW5nZSBvcHRpb24gbmFtZSB0byBmb2N1
cyBvbiBzbWFydGNhcmQgIChzdWdnZXN0ZWQgYnkgU2VyZ2V5KQo+ICBDaGFuZ2VzIHYyIC0+IHYz
Ogo+ICAgIC0gQ2hhbmdlIHNldHRpbmcgZGlzYWJsZWQgdG8gbWF0Y2ggY29udmVudGlvbiAoc3Vn
Z2VzdGVkIGJ5IEJhcnVjaCkKPgo+ICBTaWduZWQtb2ZmLWJ5OiBMYXJzIFdpa21hbiA8bGFyc0B1
bmRlcmpvcmQuaW8+Cj4gIC0tLQo+ICAgcGFja2FnZS93cGFfc3VwcGxpY2FudC9Db25maWcuaW4g
ICAgICAgICB8IDYgKysrKysrCj4gICBwYWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9zdXBwbGlj
YW50Lm1r4pqg77iPIHwgOSArKysrKystLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+ICBkaWZmIC0tZ2l0IGEvcGFja2FnZS93cGFfc3Vw
cGxpY2FudC9Db25maWcuaW4gYi9wYWNrYWdlL3dwYV9zdXBwbGljYW50L0NvbmZpZy5pbgo+ICBp
bmRleCA5Mjk1M2Y2OWYwLi4yYWVlMTA4ZmMxIDEwMDY0NAo+ICAtLS0gYS9wYWNrYWdlL3dwYV9z
dXBwbGljYW50L0NvbmZpZy5pbgo+ICArKysgYi9wYWNrYWdlL3dwYV9zdXBwbGljYW50L0NvbmZp
Zy5pbgo+ICBAQCAtMTc1LDQgKzE3NSwxMCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfV1BBX1NVUFBM
SUNBTlRfREJVU19JTlRST1NQRUNUSU9OCj4gICAgICAgICAgaGVscAo+ICAgICAgICAgICAgQWRk
IGludHJvc3BlY3Rpb24gc3VwcG9ydCBmb3IgdGhlIERCdXMgY29udHJvbCBpbnRlcmZhY2UuCj4K
PiAgK2NvbmZpZyBCUjJfUEFDS0FHRV9XUEFfU1VQUExJQ0FOVF9TTUFSVENBUkQKPiAgKyAgICAg
ICBib29sICJTbWFydGNhcmQgc3VwcG9ydCIKPiAgKyAgICAgICBoZWxwCj4gICsgICAgICAgICBF
bmFibGUgdGhlIHNtYXJ0IGNhcmQgc3VwcG9ydC4gUmVxdWlyZWQgZm9yIE9wZW5TU0wgZW5naW5l
cwo+ICArICAgICAgICAgdG8gd29yayB1c2luZyBQS0NTMTEgYW5kIDgwMi4xeAo+ICArCj4gICBl
bmRpZgo+ICBkaWZmIC0tZ2l0IGEvcGFja2FnZS93cGFfc3VwcGxpY2FudC93cGFfc3VwcGxpY2Fu
dC5ta+KaoO+4jyBiL3BhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvd3BhX3N1cHBsaWNhbnQubWvimqDv
uI8KPiAgaW5kZXggOTg0OTU5ZjY3OS4uNjE5OWU1ODRkMCAxMDA2NDQKPiAgLS0tIGEvcGFja2Fn
ZS93cGFfc3VwcGxpY2FudC93cGFfc3VwcGxpY2FudC5ta+KaoO+4jwo+ICArKysgYi9wYWNrYWdl
L3dwYV9zdXBwbGljYW50L3dwYV9zdXBwbGljYW50Lm1r4pqg77iPCj4gIEBAIC0yNCw5ICsyNCw2
IEBAIFdQQV9TVVBQTElDQU5UX0NPTkZJR19FTkFCTEUgPSBcCj4gICAgICAgICAgQ09ORklHX0lO
VEVSTkFMX0xJQlRPTU1BVEggXAo+ICAgICAgICAgIENPTkZJR19NQVRDSF9JRkFDRQo+Cj4gIC1X
UEFfU1VQUExJQ0FOVF9DT05GSUdfRElTQUJMRSA9IFwKPiAgLSAgICAgICBDT05GSUdfU01BUlRD
QVJECj4gIC0KPiAgICMgbGlibmwtMyBuZWVkcyAtbG0gKGZvciByaW50KSBhbmQgLWxwdGhyZWFk
IGlmIGxpbmtpbmcgc3RhdGljYWxseQo+ICAgIyBBbmQgbGlicmFyeSBvcmRlciBtYXR0ZXJzIGhl
bmNlIHN0aWNrIC1sbmwtMyBmaXJzdCBzaW5jZSBpdCdzIGFwcGVuZGVkCj4gICAjIGluIHRoZSB3
cGFfc3VwcGxpY2FudCBNYWtlZmlsZXMgYXMgaW4gTElCUys9LWxubC0zIC4uLiB0aHVzIGZhaWxp
bmcKPiAgQEAgLTE4MCw2ICsxNzcsMTIgQEAgV1BBX1NVUFBMSUNBTlRfREVQRU5ERU5DSUVTICs9
IHJlYWRsaW5lCj4gICBXUEFfU1VQUExJQ0FOVF9DT05GSUdfRU5BQkxFICs9IENPTkZJR19SRUFE
TElORQo+ICAgZW5kaWYKPgo+ICAraWZlcSAoJChCUjJfUEFDS0FHRV9XUEFfU1VQUExJQ0FOVF9T
TUFSVENBUkQpLHkpCj4gICtXUEFfU1VQUExJQ0FOVF9DT05GSUdfRU5BQkxFICs9IENPTkZJR19T
TUFSVENBUkQKPiAgK2Vsc2UKPiAgK1dQQV9TVVBQTElDQU5UX0NPTkZJR19ESVNBQkxFICs9IENP
TkZJR19TTUFSVENBUkQKPiAgK2VuZGlmCj4gICsKPiAgIGlmZXEgKCQoQlIyX1BBQ0tBR0VfV1BB
X1NVUFBMSUNBTlRfQ1RSTF9JRkFDRSkseSkKPiAgIGRlZmluZSBXUEFfU1VQUExJQ0FOVF9FTkFC
TEVfQ1RSTF9JRkFDRQo+ICAgICAgICAgIHNlZCAtaSAnL2N0cmxfaW50ZXJmYWNlL3MvXiMvL2cn
ICQoVEFSR0VUX0RJUikvZXRjL3dwYV9zdXBwbGljYW50LmNvbmYKPiAgLS0gCj4gIDIuMzQuMQo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH4uIC5+ICAgVGsg
T3BlbiBTeXN0ZW1zCj19LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tb29PLS1VLS1Pb28tLS0tLS0tLS0tLS17PQogICAtIGJhcnVjaEB0a29zLmNvLmlsIC0g
dGVsOiArOTcyLjUyLjM2OC40NjU2LCBodHRwOi8vd3d3LnRrb3MuY28uaWwgLQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
