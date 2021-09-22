Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60813C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 14:23:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D09A7611C9
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 14:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D09A7611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7621340587;
	Wed, 22 Sep 2021 14:23:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nOtQAEyMefQJ; Wed, 22 Sep 2021 14:23:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5155640480;
	Wed, 22 Sep 2021 14:23:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C54D1BF3AF
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 14:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEF5C60873
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 14:23:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pttIu0CtEtAo for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 14:23:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72B1360744
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 14:23:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A9A460F56;
 Wed, 22 Sep 2021 14:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632320623;
 bh=0nFnDQAn5yayzxFwiAIkiOFXTimHkAm/SkXNC1YpCQA=;
 h=In-Reply-To:References:Subject:Cc:To:From:Date:From;
 b=IrIhWLkzJE0tud7pwmrJ3d27lc/jkMiKRK3BD2vwby2wsoU63/F5ERZNcqodP11bp
 cILjuu2xETNTVK6Nxwkw2soU3JJZT43vUm01KMND+O5ShKcWiV4WsaTCwgw70AgiuZ
 fT4BxuPwORPmLfdDNW+sE7Qge73rjS/zbtew2ZsTf8o7DliG1SAGdxcEurcDH3l1nT
 w+QHeBdTVTyj4M3wtjTLxSGWi47WDMaZK5ELgsSqu4VS3YaF4yzyffda1H+o27u6OW
 oAoP4ZbRF9XPf6VCypMSJJJQFM6fTXk9URKeW5OzSQJGEL7BthCdLu/fgdtEGckFw1
 +9u6yd21un3OQ==
MIME-Version: 1.0
In-Reply-To: <CAJPV9Mp-6PBtw5G2YDORJ_5cqypjtrc2CR3cMrzfe36RpUW2oQ@mail.gmail.com>
References: <20210830114531.2285178-1-jose.pekkarinen@unikie.com>
 <CAJPV9Mphsf6BhYHhsD7BFRXms2Psbi0xFX9SUaBbyu40iZCecQ@mail.gmail.com>
 <163214406368.4283.14394760824414034461@kwain>
 <CAJPV9MrgZcVw3cmO1+w_zn6M2yub+nCZ73H_YJ0g=OTpuu1MeA@mail.gmail.com>
 <163214596519.4283.5229631383777844599@kwain>
 <CAJPV9MqsdZa5oCYSE-+ZsNi4w1w8CWVeUPd4CohXddt5pcr7zQ@mail.gmail.com>
 <163220836697.4283.6363157164675068449@kwain>
 <CAJPV9MpNh0rXA6ZTJJyj5A58goFtt7GnPNimddk94eZw8S2bdQ@mail.gmail.com>
 <163223176981.4283.2007173106051805069@kwain>
 <CAJPV9Mp-6PBtw5G2YDORJ_5cqypjtrc2CR3cMrzfe36RpUW2oQ@mail.gmail.com>
To: José Pekkarinen <jose.pekkarinen@unikie.com>
From: Antoine Tenart <atenart@kernel.org>
Message-ID: <163232062091.4283.13096713479109144471@kwain>
Date: Wed, 22 Sep 2021 16:23:40 +0200
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

UXVvdGluZyBKb3PDqSBQZWtrYXJpbmVuICgyMDIxLTA5LTIyIDE2OjAwOjE5KQo+ICAgIE9uIFR1
ZSwgU2VwIDIxLCAyMDIxIGF0IDQ6NDIgUE0gQW50b2luZSBUZW5hcnQgPFsxXWF0ZW5hcnRAa2Vy
bmVsLm9yZz4KPiAgICB3cm90ZToKPiAgICAgIFF1b3RpbmcgSm9zw6kgUGVra2FyaW5lbiAoMjAy
MS0wOS0yMSAxNTozMjozMikKPiAgICAgID4gT24gVHVlLCBTZXAgMjEsIDIwMjEgYXQgMTA6MTIg
QU0gQW50b2luZSBUZW5hcnQKPiAgICAgIDxbMV1bMl1hdGVuYXJ0QGtlcm5lbC5vcmc+Cj4gICAg
ICA+IHdyb3RlOgo+ICAgICAgPgo+ICAgICAgPiBJIHRlc3RlZCB0b2RheSB0byBidWlsZCB0aGUg
c3lzdGVtIHdpdGggYnVpbGRyb290IDIwMjEuMDUuMih3aXRob3V0Cj4gICAgICA+IHRoZSBwYXRj
aCkgYW5kIGl0IHJlcHJvZHVjZXMgZXhhY3RseSB0aGUgc2FtZSBiZWhhdmlvdXIsCj4gICAgICA+
IHBvbGljeS9tb2R1bGVzLmNvbmYgZG9lc24ndCByZWNlaXZlIHRoZSBsaW5lIHRvIGFjdGl2YXRl
IHRoZSBzZWN1cmUKPiAgICAgID4gbW9kdWxlLCBhbmQgaWYgSSBzZWFyY2ggaW4gcG9saWN5LmNv
bmYgb3IgcG9saWN5LjMyIHRocm91Z2ggc2VzZWFyY2ggSQo+ICAgICAgPiBmaW5kIG5vIHNpZ24g
b2YgdGhlIHBvbGljaWVzIGRlZmluZWQgaW4gdGhlIG1vZHVsZS7CoCBJJ2xsIGF0dGVtcHQgdGhl
Cj4gICAgICA+IHVwZ3JhZGUgdG8gMjAyMS4wOCwgYnV0IHRoYXQgd2lsbCByZXF1aXJlIGEgYml0
IG1vcmUgdGltZS4KPiAKPiAgICAgIEFsdGVybmF0aXZlbHkgeW91IGNhbiBqdXN0IHRlc3Qgd2l0
aCBuZXdlciByZWZwb2xpY3kgdmVyc2lvbnMsIG91dHNpZGUKPiAgICAgIG9mIEJ1aWxkcm9vdCBh
bmQgbG9vayBhdCB0aGUgZ2VuZXJhdGVkIG1vZHVsZXMuY29uZi4gVGhpcyB3aWxsIGdpdmUgdGhl
Cj4gICAgICBzYW1lIGluZm9ybWF0aW9uIGFuZCBzaG91bGQgYmUgZWFzaWVyIHRvIGRvLiAoTXkg
ZmVlbGluZyBpcyB0aGlzIHdvbid0Cj4gICAgICBjaGFuZ2UgYW5kIHdlJ2xsIGhhdmUgdG8gZGl2
ZSBpbnRvIHRoZSByZWZwb2xpY3kgbG9naWMgZm9yIGVuYWJsaW5nCj4gICAgICBtb2R1bGVzIHdo
ZW4gcnVubmluZyAnbWFrZSBjb25mJykuCj4gCj4gICAgVGhlIGNvbmZpZyBnZW5lcmF0b3IgcmVx
dWlyZXMgYSBzdW1tYXJ5IGxpbmUgaW4gdGhlIG1vZHVsZS5pZiBmaWxlCj4gICAgdG8gYmUgYWRk
ZWQgaW4gcG9saWN5L21vZHVsZXMuY29uZiwgb3RoZXJ3aXNlIGl0IGRvZXNuJ3QgcHJvY2Vzcwo+
ICAgIGFueSBmdXJ0aGVyLiAgSXQgc2VlbXMgdG8gYmUgc29tZXRoaW5nIHRyaWNreSB0byBhZGRy
ZXNzLCBpbiB5b3VyCj4gICAgZW5kIGRldmVsb3BpbmcgYSBjaGVjayB0aGUgc3VtbWFyeSBpcyBp
biBwbGFjZSBkb2Vzbid0IG1ha2Ugc2Vuc2UsCj4gICAgaW4gdGhlaXIgZW5kLCBub3QgdXNpbmcg
dGhhdCBob29rIHRvIGxlYXJuIHRoZSBtb2R1bGVzIGZyb20gdGhlIHhtbAo+ICAgIG1ha2UgYmUg
YWxzbyBjb21wbGljYXRlZC4KCkkgYWdyZWUsIGhhdmluZyBhIGNoZWNrIGZvciB0aGUgc3VtbWFy
eSB3b3VsZCBiZSBvdXRzaWRlIG9mIEJ1aWxkcm9vdCdzCnNjb3BlLiBJdCdzIGxpbmtlZCB0byBo
b3cgU0VMaW51eCBtb2R1bGVzIHNob3VsZCBiZSB3cml0dGVuLgoKSG93ZXZlciBJJ20gc3VycHJp
c2VkIGFzIG15IHVuZGVyc3RhbmRpbmcgd2FzIHRoZSBzdW1tYXJ5IHdhcyByZXF1aXJlZApmb3Ig
dGhlIHJlZnBvbGljeSBjb25maWd1cmF0aW9uIHN0ZXAgdG8gc3VjY2VlZCAoSSBkaWQgdXNlIGEg
c3VtbWFyeQpmb3IgYWxsIG15IHRlc3RzIGJlY2F1c2Ugb2YgdGhpcykuIFdoZW4gcmVtb3Zpbmcg
YSBzdW1tYXJ5IGZyb20gYSBtb2R1bGUKSSBhbHdheXMgZ2V0IHRoZSBmb2xsb3dpbmcgZXJyb3Is
IGFuZCB0aGUgQnVpbGRyb290IGJ1aWxkIHN0b3BzLgoKICBkb2MvcG9saWN5LnhtbDo4Mzc2OiBl
bGVtZW50IG1vZHVsZTogdmFsaWRpdHkgZXJyb3IgOiBFbGVtZW50IG1vZHVsZSBjb250ZW50IGRv
ZXMgbm90IGZvbGxvdyB0aGUgRFRELCBleHBlY3RpbmcgKHN1bW1hcnkgLCBkZXNjPyAsIHJlcXVp
cmVkPyAsIChpbnRlcmZhY2UgfCB0ZW1wbGF0ZSkqICwgKGJvb2wgfCB0dW5hYmxlKSopLCBnb3Qg
KCkKICBEb2N1bWVudCBkb2MvcG9saWN5LnhtbCBkb2VzIG5vdCB2YWxpZGF0ZSBhZ2FpbnN0IGRv
Yy9wb2xpY3kuZHRkCgpEbyB5b3UgaGF2ZSBhbiBpZGVhIHdoYXQgbWFkZSB5b3VyIGJ1aWxkIHRv
IHN1Y2NlZWQgZXZlbiB0aG91Z2ggeW91IGRpZApub3QgaGF2ZSBhIHN1bW1hcnkgaW4geW91ciBt
b2R1bGU/CgpBbnRvaW5lCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
