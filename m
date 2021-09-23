Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B86C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 08:33:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 386FD6105A
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 08:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 386FD6105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4940400D8;
	Thu, 23 Sep 2021 08:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wf0VUzPgXhqf; Thu, 23 Sep 2021 08:33:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D80CB40151;
	Thu, 23 Sep 2021 08:33:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51A151BF325
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 08:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DC8B61553
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 08:33:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K0oPGb7I8jAe for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 08:33:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A51846154D
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 08:33:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EF616103C;
 Thu, 23 Sep 2021 08:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632385987;
 bh=UJVk5CkAcIwvajLgVqX46J6nb9oRr4VqaqXfVLrOqOw=;
 h=In-Reply-To:References:From:To:Subject:Cc:Date:From;
 b=MvnBc1wWmy2eq48G3v+QYbcBTECjgtuLI78Wml8VGD2w4TxoT3xMLAIb9Tj7ims5A
 PR+aXAZg61hCWIR3hs1owTqrS72f7ciu89cEPY8RACFGcDnasAoXZpFDtaLt4VTs/x
 o/a/lUlLSCCJ4wy/FkQLRMCsyCHvly4GcOjodv3qJlIsEEveS6/RaaOkkGoUoYHIah
 0z9DgGguZwzSM28GKwJ02KuKWQb1r2JCUaLXzzY5m7kbYS/yey6aryAmvIplEXkVb6
 BACS55/krTqCCLeKm1+9Y9Hd0tASTAsy/pGcYv7uuiPw4uwdNvfn2IbJs9kQjtzzwW
 c02qrWdpu3OGA==
MIME-Version: 1.0
In-Reply-To: <163238398624.3979.10768324598204859494@kwain>
References: <20210830114531.2285178-1-jose.pekkarinen@unikie.com>
 <163214596519.4283.5229631383777844599@kwain>
 <CAJPV9MqsdZa5oCYSE-+ZsNi4w1w8CWVeUPd4CohXddt5pcr7zQ@mail.gmail.com>
 <163220836697.4283.6363157164675068449@kwain>
 <CAJPV9MpNh0rXA6ZTJJyj5A58goFtt7GnPNimddk94eZw8S2bdQ@mail.gmail.com>
 <163223176981.4283.2007173106051805069@kwain>
 <CAJPV9Mp-6PBtw5G2YDORJ_5cqypjtrc2CR3cMrzfe36RpUW2oQ@mail.gmail.com>
 <163232062091.4283.13096713479109144471@kwain>
 <CAJPV9MpWep997PN1v+R0E6RKhe4EOwY=ogFECnyfG0ppz2ekww@mail.gmail.com>
 <163238398624.3979.10768324598204859494@kwain>
From: Antoine Tenart <atenart@kernel.org>
To: José Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <163238598414.3979.800122284643311265@kwain>
Date: Thu, 23 Sep 2021 10:33:04 +0200
Subject: Re: [Buildroot] [PATCH] package/refpolicy: Treat all modules as
 custom
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

UXVvdGluZyBBbnRvaW5lIFRlbmFydCAoMjAyMS0wOS0yMyAwOTo1OTo0NikKPiBRdW90aW5nIEpv
c8OpIFBla2thcmluZW4gKDIwMjEtMDktMjMgMDg6MjY6MDIpCj4gPiAgT24gV2VkLCBTZXAgMjIs
IDIwMjEgYXQgNToyMyBQTSBBbnRvaW5lIFRlbmFydCA8WzFdYXRlbmFydEBrZXJuZWwub3JnPgo+
ID4gIHdyb3RlOgo+ID4KPiA+ICAgIEhvd2V2ZXIgSSdtIHN1cnByaXNlZCBhcyBteSB1bmRlcnN0
YW5kaW5nIHdhcyB0aGUgc3VtbWFyeSB3YXMgcmVxdWlyZWQKPiA+ICAgIGZvciB0aGUgcmVmcG9s
aWN5IGNvbmZpZ3VyYXRpb24gc3RlcCB0byBzdWNjZWVkIChJIGRpZCB1c2UgYSBzdW1tYXJ5Cj4g
PiAgICBmb3IgYWxsIG15IHRlc3RzIGJlY2F1c2Ugb2YgdGhpcykuIFdoZW4gcmVtb3ZpbmcgYSBz
dW1tYXJ5IGZyb20gYSBtb2R1bGUKPiA+ICAgIEkgYWx3YXlzIGdldCB0aGUgZm9sbG93aW5nIGVy
cm9yLCBhbmQgdGhlIEJ1aWxkcm9vdCBidWlsZCBzdG9wcy4KPiA+Cj4gPiAgICDCoCBkb2MvcG9s
aWN5LnhtbDo4Mzc2OiBlbGVtZW50IG1vZHVsZTogdmFsaWRpdHkgZXJyb3IgOiBFbGVtZW50IG1v
ZHVsZQo+ID4gICAgY29udGVudCBkb2VzIG5vdCBmb2xsb3cgdGhlIERURCwgZXhwZWN0aW5nIChz
dW1tYXJ5ICwgZGVzYz8gLCByZXF1aXJlZD8KPiA+ICAgICwgKGludGVyZmFjZSB8IHRlbXBsYXRl
KSogLCAoYm9vbCB8IHR1bmFibGUpKiksIGdvdCAoKQo+ID4gICAgwqAgRG9jdW1lbnQgZG9jL3Bv
bGljeS54bWwgZG9lcyBub3QgdmFsaWRhdGUgYWdhaW5zdCBkb2MvcG9saWN5LmR0ZAo+ID4KPiA+
ICAgIERvIHlvdSBoYXZlIGFuIGlkZWEgd2hhdCBtYWRlIHlvdXIgYnVpbGQgdG8gc3VjY2VlZCBl
dmVuIHRob3VnaCB5b3UgZGlkCj4gPiAgICBub3QgaGF2ZSBhIHN1bW1hcnkgaW4geW91ciBtb2R1
bGU/Cj4gPgo+ID4gIEkgYmVsaWV2ZSBpdCBpcyB2YWxpZGF0aW5nIHRvIHRoZSBzdW1tYXJ5IHBy
aW9yIHRvIHRoZSBtb2R1bGUsCj4gPiAgdGhlIG9uZSB5b3UgcHV0IGluIG1ldGFkYXRhLnhtbCwg
YnV0IG5vdCBhbnkgaW50ZXJuYWwgc3VtbWFyeSBmb3IKPiA+ICB0aGUgaW50ZXJmYWNlLiBUaGlz
IGlzIGhvdyBwb2xpY3kueG1sIGxvb2tzIGxpa2UgaW4gYSBjYXNlIHdoZXJlIEkgZGlkbid0Cj4g
PiAgYXBwbHkgdGhlIG1pdGlnYXRpb246Cj4gPiAgPGxheWVyIG5hbWU9ImJ1aWxkcm9vdCI+Cj4g
PiAgPHN1bW1hcnk+QnVpbGRyb290IGV4dHJhIG1vZHVsZXM8L3N1bW1hcnk+Cj4gPiAgPG1vZHVs
ZSBuYW1lPSJiYXNlIiBmaWxlbmFtZT0icG9saWN5L21vZHVsZXMvYnVpbGRyb290L2Jhc2UuaWYi
Pgo+ID4gIDwvbW9kdWxlPgo+ID4gIDxtb2R1bGUgbmFtZT0ic2VjdXJlIiBmaWxlbmFtZT0icG9s
aWN5L21vZHVsZXMvYnVpbGRyb290L3NlY3VyZS5pZiI+Cj4gPiAgPC9tb2R1bGU+Cj4gPiAgPC9s
YXllcj4KPiA+Cj4gPiAgV2l0aCB0aGlzIHRoZSBtb2R1bGVzLmNvbmYgY29tZXMgYXM6Cj4gPgo+
ID4gICMgTGF5ZXI6IGJ1aWxkcm9vdAo+ID4gICMgTW9kdWxlOiBiYXNlCj4gPiAgIwo+ID4gICMg
TGF5ZXI6IGJ1aWxkcm9vdAo+ID4gICMgTW9kdWxlOiBzZWN1cmUKPiA+ICAjCj4gPgo+ID4gIFRo
ZXJlIGlzIGEgc3VtbWFyeSBmb2xsb3dlZCBieSBhIG1vZHVsZSwgdmFsaWRhdGlvbiBwYXNzLCBi
dXQKPiA+Cj4gPiAgdGhlIG1vZHVsZSBpcyBub3QgYnVpbHQuIElmIEkgYWRkIHRoZSBmb2xsb3dp
bmcgbGluZXMgaW4gdGhlIGJ1aWxkIGZvbGRlcgo+ID4gIG1vZHVsZXNbMV0KPiA+ICBhbmQgcnVu
IG1ha2UuY29uZjoKPiA+ICBbMV3CoHJlZnBvbGljeS0yLjIwMjAwODE4L3BvbGljeS9tb2R1bGVz
L2J1aWxkcm9vdC9zZWN1cmUuaWY6ICMjCj4gPiAgPHN1bW1hcnk+RXh0ZXJuYWwgc2VjdXJlIG1v
ZHVsZS48L3N1bW1hcnk+Cj4gPiAgcmVmcG9saWN5LTIuMjAyMDA4MTgvcG9saWN5L21vZHVsZXMv
YnVpbGRyb290L2Jhc2UuaWY6ICMjCj4gPiAgPHN1bW1hcnk+RXh0ZXJuYWwgYmFzZSBtb2R1bGUu
PC9zdW1tYXJ5Pgo+ID4KPiA+ICBUaGUgcG9saWN5LnhtbCBsb29rcyBsaWtlOgo+ID4KPiA+ICA8
bGF5ZXIgbmFtZT0iYnVpbGRyb290Ij4KPiA+ICA8c3VtbWFyeT5CdWlsZHJvb3QgZXh0cmEgbW9k
dWxlczwvc3VtbWFyeT4KPiA+ICA8bW9kdWxlIG5hbWU9ImJhc2UiIGZpbGVuYW1lPSJwb2xpY3kv
bW9kdWxlcy9idWlsZHJvb3QvYmFzZS5pZiI+Cj4gPiAgPHN1bW1hcnk+RXh0ZXJuYWwgYmFzZSBt
b2R1bGVzLjwvc3VtbWFyeT4KPiA+ICA8L21vZHVsZT4KPiA+ICA8bW9kdWxlIG5hbWU9InNlY3Vy
ZSIgZmlsZW5hbWU9InBvbGljeS9tb2R1bGVzL2J1aWxkcm9vdC9zZWN1cmUuaWYiPgo+ID4gIDxz
dW1tYXJ5PkV4dGVybmFsIHNlY3VyZSBvcyB2bSBtb2R1bGUuPC9zdW1tYXJ5Pgo+ID4gIDwvbW9k
dWxlPgo+ID4gIDwvbGF5ZXI+Cj4gPgo+ID4gIFRoZW4gcG9saWN5L21vZHVsZXMuY29uZiBsb29r
cyB0aGlzIHdheToKPiA+Cj4gPiAgIyBMYXllcjogYnVpbGRyb290Cj4gPiAgIyBNb2R1bGU6IGJh
c2UKPiA+ICAjCj4gPiAgIyBFeHRlcm5hbCBiYXNlIG1vZHVsZXMuCj4gPiAgIyDCoAo+ID4gIGJh
c2UgPSBtb2R1bGUKPiA+Cj4gPiAgIyBMYXllcjogYnVpbGRyb290Cj4gPiAgIyBNb2R1bGU6IHNl
Y3VyZQo+ID4gICMKPiA+ICAjIEV4dGVybmFsIHNlY3VyZSBvcyB2bSBtb2R1bGUuCj4gPiAgIyDC
oAo+ID4gIHNlY3VyZSA9IG1vZHVsZQo+ID4KPiA+ICBBbmQgdGhpcyBwcm9kdWNlcyB0aGUgbW9k
dWxlcyB0byBnZXQgaW50byB0aGUgcG9saWN5LjMyIGZpbGUuCj4gPiAgRG9lcyBpdCBtYWtlcyBh
bnkgc2Vuc2Ugb24geW91ciBlbmQ/Cj4gCj4gVGhlIGFib3ZlIGRvZXMgbm90IHJlcHJvZHVjZSBm
b3IgbWUuIEJ1dCBJIG1pZ2h0IGtub3cgd2hhdCdzIGdvaW5nIG9uOgo+IGRvIHlvdSBoYXZlIHht
bGxpbnQgaW5zdGFsbGVkIG9uIHlvdXIgbWFjaGluZT8KCk9yIG5vdCBhdCAvdXNyL2Jpbi94bWxs
aW50Cgo+IElmIG5vdCwgdGhlIHZhbGlkYXRpb24gc3RlcCBpcyBza2lwcGVkIGJ1dCB0aGUgYnVp
bGQgaXMgbm90IHN0b3BwZWQsCj4gd2hpY2ggd291bGQgZXhwbGFpbiB0aGUgZGlmZmVyZW5jZSBp
biBiZWhhdmlvdXIgd2UgaGF2ZSBiZXR3ZWVuIG91cgo+IHRlc3RzOgo+IAo+ICAgTWFrZWZpbGU6
NDUzOgo+ICAgJCh2ZXJib3NlKSBpZiB0ZXN0IC14ICQoWE1MTElOVCkgJiYgdGVzdCAtZiAkKHht
bGR0ZCk7IHRoZW4gXAo+ICAgICAgICAgICAkKFhNTExJTlQpIC0tbm9vdXQgLS1wYXRoICQoZGly
ICQoeG1sZHRkKSkgLS1kdGR2YWxpZCAkKHhtbGR0ZCkgJEAgO1wKPiAgICAgICAgICAgZWxzZSBc
Cj4gICAgICAgICAgIGVjaG8gIiRAIFhNTCB2YWxpZGF0aW9uIG5vdCBydW4uIFBsZWFzZSBpbnN0
YWxsIHRoZSB4bWxsaW50IHRvb2wuIiA7XAo+ICAgZmkKPiAKPiBJIGJlbGlldmUgd2Ugc2hvdWxk
IG1ha2UgcmVmcG9saWN5IGRlcGVuZCBvbiBob3N0LWxpYnhtbDIgYW5kIGZvcmNlIGl0Cj4gdG8g
dXNlIHRoZSBCdWlsZHJvb3QgdmVyc2lvbiBvZiB4bWxsaW50IGJ5IHNldHRpbmcgWE1MTElOVCBp
biB0aGUKPiBjb25maWd1cmF0aW9uIHN0ZXAuCj4gCj4gRG8gdGhlIGZvbGxvd2luZyBmaXhlcyB0
aGUgaXNzdWVbMV0gb24geW91ciBzaWRlPwo+IAo+ICAgZGlmZiAtLWdpdCBhL3BhY2thZ2UvcmVm
cG9saWN5L3JlZnBvbGljeS5tayBiL3BhY2thZ2UvcmVmcG9saWN5L3JlZnBvbGljeS5tawo+ICAg
aW5kZXggMTE4MGYwZDM4YmFlLi5lY2Q4Y2YyMjZiNDUgMTAwNjQ0Cj4gICAtLS0gYS9wYWNrYWdl
L3JlZnBvbGljeS9yZWZwb2xpY3kubWsKPiAgICsrKyBiL3BhY2thZ2UvcmVmcG9saWN5L3JlZnBv
bGljeS5tawo+ICAgQEAgLTE0LDcgKzE0LDggQEAgUkVGUE9MSUNZX0RFUEVOREVOQ0lFUyA9IFwK
PiAgICAgICAgICAgaG9zdC1wb2xpY3ljb3JldXRpbHMgXAo+ICAgICAgICAgICBob3N0LXB5dGhv
bjMgXAo+ICAgICAgICAgICBob3N0LXNldG9vbHMgXAo+ICAgLSAgICAgICBob3N0LWdhd2sKPiAg
ICsgICAgICAgaG9zdC1nYXdrIFwKPiAgICsgICAgICAgaG9zdC1saWJ4bWwyCj4gCj4gICAgaWZl
cSAoJChCUjJfUEFDS0FHRV9SRUZQT0xJQ1lfQ1VTVE9NX0dJVCkseSkKPiAgICBSRUZQT0xJQ1lf
VkVSU0lPTiA9ICQoY2FsbCBxc3RyaXAsJChCUjJfUEFDS0FHRV9SRUZQT0xJQ1lfQ1VTVE9NX1JF
UE9fVkVSU0lPTikpCj4gICBAQCAtMzAsNiArMzEsNyBAQCBlbmRpZgo+ICAgICMgQ2Fubm90IHVz
ZSBtdWx0aXBsZSB0aHJlYWRzIHRvIGJ1aWxkIHRoZSByZWZlcmVuY2UgcG9saWN5Cj4gICAgUkVG
UE9MSUNZX01BS0UgPSBcCj4gICAgICAgICAgIFBZVEhPTj0kKEhPU1RfRElSKS91c3IvYmluL3B5
dGhvbjMgXAo+ICAgKyAgICAgICBYTUxMSU5UPSQoTElCWE1MMl9IT1NUX0JJTkFSWSkgXAo+ICAg
ICAgICAgICBURVNUX1RPT0xDSEFJTj0kKEhPU1RfRElSKSBcCj4gICAgICAgICAgICQoVEFSR0VU
X01BS0VfRU5WKSBcCj4gICAgICAgICAgICQoTUFLRTEpCj4gCj4gKEkgYWxzbyBjaGVja2VkIGZv
ciBvdGhlciBgdGVzdCAteGAgY29uZGl0aW9ucyBpbiB0aGUgcmVmcG9saWN5Cj4gTWFrZWZpbGU7
IHhtbGxpbnQgc2VlbXMgdG8gYmUgdGhlIG9ubHkgb25lKS4KPiAKPiBbMV0gImZpeCB0aGUgaXNz
dWUiIGFrYSB0aHJvdyBhbiBlcnJvciB3aGlsZSBhZGRpbmcgbW9kdWxlcyB3aXRob3V0IGEKPiAg
ICAgc3VtbWFyeS4KPiAKPiBUaGFua3MsCj4gQW50b2luZQo+IApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBsaXN0cy5idWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
