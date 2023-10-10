Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83457CD8CB1
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 18:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FA6C4051A;
	Tue, 10 Oct 2023 18:55:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FA6C4051A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AVQ8xeYpmbMX; Tue, 10 Oct 2023 18:55:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DE0240541;
	Tue, 10 Oct 2023 18:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DE0240541
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A637C1BF2B0
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 18:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CC9040181
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 18:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CC9040181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4_YW-eQ5BiAJ for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 18:55:33 +0000 (UTC)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46F7440012
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 18:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46F7440012
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-d862533ea85so7050078276.0
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 11:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696964132; x=1697568932;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+2WS/987qs8LZQl4DXCDApMNBFDbb4brb2mssNC4KZs=;
 b=lXZm9vkGsnltQyIpP5Xtv0ycZVGCWLAVQA3mLWq1WzSjeJA/Ns7+RuicKNkEpekTc5
 y0dd/yF3UuKs2JtHtHvS/T7wcoAAOMyZAMtbEdUbOHv+65uqiDGlkrGxkC/4khA6ozTZ
 fnTN8osxkr6uMV5LtGeEhJ9hhSAPG2V9ktMIskaeW83tTEvg0qnycsMPc3HuqJG2mJUr
 hRDz0DDahvTiP+4rKQZQsj/cQ8ZzLTQEXGYLzNXjMODXU5+enqdPeuJ8IPaGLtBnix3x
 snZ3RFAEtXUgELWvKWsZCZT+KkF+SOORLaCLEyjztWW7N4qNHmqxLgu+0vQCU9TS14cZ
 x4eQ==
X-Gm-Message-State: AOJu0YzqmA6ksm97D4EmXotG1LGxDHX1CrPtE87lat9QbYQo3VTiX85e
 RgKFVOlzOYPvElQCSD8LXL28GvUxNyn1owF6HRS87C6LtKY=
X-Google-Smtp-Source: AGHT+IHxmoKPfrgPCmxF9SV9l31F/8PkZskRZZW/B76hKrm2mLEcuJtWbu1S83+fxcmFFP6yhkOHs5wXpxHS7t23DQA=
X-Received: by 2002:a5b:1c8:0:b0:d9a:54c2:1b92 with SMTP id
 f8-20020a5b01c8000000b00d9a54c21b92mr2715103ybp.14.1696964131885; Tue, 10 Oct
 2023 11:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <4fa235baaa88440e806f3c5f8f8bcb58@physiomed.de>
 <94908e37-932a-4626-8fcb-c39d3293fe38@benettiengineering.com>
 <5ea9bca9-6e26-ad12-6bd0-c131a3281460@mind.be>
In-Reply-To: <5ea9bca9-6e26-ad12-6bd0-c131a3281460@mind.be>
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Tue, 10 Oct 2023 20:55:20 +0200
Message-ID: <CAMdwsN-jxks4PzNd5dSZufgWVRSkBKMNMVzrTUv5ermh8TyY1A@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696964132; x=1697568932; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+2WS/987qs8LZQl4DXCDApMNBFDbb4brb2mssNC4KZs=;
 b=bksKTLrfOyAPybILpEibWimcOAne1oQz34ZJtTzitK3ds1s+K6on7MYUxQHMrQpCE9
 YSKq+28fU3asGEGZs5xcAe3ETsGxWVoBmQvmCh8Zheec6BGbnyGm9GggYLpDYYlU6StF
 WOTS6NRCGVp496iETMzzCurfQ6Qq35Bzi7Wk3weE+dRYSiMfeeOWMooFLMJMgGUQr2z1
 5YuqhAyPkRksHht+preramqZ0zcszy3aGYkDYbAtO0drEYpzWEpUxr2OxcCU0mztPY1D
 3iJ//glXYqbT3kDpRah7rONks3bMR15Bqzhd6/SWDN2L0+OQoZNj7qJIxhmWwdID/k36
 dZ+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bksKTLrf
Subject: Re: [Buildroot] Future buildroot with QtQuick/QML Support
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?Q?Sch=C3=A4ffner=2C_Florian?= <florian.schaeffner@physiomed.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpPcCBkaSAxMCBva3QgMjAyMyBvbSAyMDoyNCBzY2hyZWVmIEFybm91dCBWYW5kZWNhcHBl
bGxlIDxhcm5vdXRAbWluZC5iZT46Cj4KPgo+Cj4gT24gMTAvMTAvMjAyMyAxNToxOCwgR2l1bGlv
IEJlbmV0dGkgd3JvdGU6Cj4gPiBIZWxsbyBGbG9yaWFuLAo+ID4KPiA+IE9uIDEwLzEwLzIzIDE0
OjU5LCBTY2jDpGZmbmVyLCBGbG9yaWFuIHdyb3RlOgo+ID4+IEhlbGxvLAo+ID4+Cj4gPj4gb3Vy
IGFwcGxpY2F0aW9uIGlzIGJ1aWx0IGluIHRoZSBkZXZlbG9wbWVudCBlbnZpcm9ubWVudCB3aXRo
IFF0IDYgYW5kCj4gPj4gUXRRdWljay9RTUwuIE5vdyBpIHRyaWVkLCBidXQgd2FzbuKAmXQgYWJs
ZSB0byBzZXR1cCBhIHdvcmtpbmcgYnVpbGRyb290IGZvciBvdXIKPiA+PiBhcHBsaWNhdGlvbiB0
byBydW4gb24gYSBlbWJlZGRlZCBkZXZpY2UuCj4gPj4KPiA+PiBJIGZvdW5kIHRoZSBjb252ZXJz
YXRpb24gYWJvdXQgcXQ2IGFuZCBRTUwgU3VwcG9ydCBvbiB0aGUgYnVpbGRyb290IG1haWxpbmcK
PiA+PiBsaXN0IGFuZCB0aGF0IGl0IHNlZW1zIHRvIGJlIG5vdCBwb3NzaWJsZSB0byBzZXR1cCBh
IGJ1aWxkcm9vdCBmb3Igb3VyIG5lZWRzCj4gPj4gd2l0aCBRdDYgYW5kIFFNTCBzdXBwb3J0Lgo+
ID4+Cj4gPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290L2YyMmNlMDZkLWQ5Y2Yt
YzU2MS03NDU1LTE5ZGNlNzI0YzE1OEBiZW5ldHRpZW5naW5lZXJpbmcuY29tLwo+ID4+Cj4gPj4g
SWYgSSB1bmRlcnN0b29kIHRoZSBhbnN3ZXIgZnJvbSBHaXVsaW8gQmVuZXR0aSBjb3JyZWN0bHks
IHRoZXJlIGlzIGN1cnJlbnRseQo+ID4+IG5vIGNoYW5jZSB0byBtYWtlIHRoaXMgY29uZmlndXJh
dGlvbiB3b3JrIGZvciBvdXIgZW1iZWRkZWQgYm9hcmQgd2l0aCBidWlsZHJvb3Q/Cj4gPj4KPiA+
PiBDYW4geW91IHBsZWFzZSB0ZWxsIG1lIGlmIHRoZXJlIHdpbGwgYmUgc3VwcG9ydCBmb3IgdGhp
cyBpbiB0aGUgbmV4dCBtYWpvcgo+ID4+IGJ1aWxkcm9vdCB2ZXJzaW9uPyBPciBpcyBpdCBub3Qg
cGxhbm5lZCBvciBmb3Jlc2VlYWJsZSB3aGVuIGEgUU1MIHN1cHBvcnQgaXMKPiA+PiBwb3NzaWJs
ZSB3aXRoIGJ1aWxkcm9vdD8KPgo+ICAgQnVpbGRyb290IGlzIGEgdm9sdW50ZWVyIHByb2plY3Qg
LSBub3RoaW5nIGlzICJwbGFubmVkIiB1bmxlc3Mgc29tZW9uZSBnb2VzCj4gdGhyb3VnaCB0aGUg
ZWZmb3J0IG9mIGNvbnRyaWJ1dGluZyBpdC4KPgo+ID4gYXMgSSBjYW4gc2VlIGZyb20gQnVpbGRy
b290IHBhdGNob3JrIGF0IHRoZSBtb21lbnQgdGhlcmUgaXMgbm8gcGVuZGluZwo+ID4gcGF0Y2hl
cyB0byBhZGQgZmVhdHVyZXMsIGJ1dCB0aGlzIGRvZXNuJ3QgbWVhbiBpdCB3b24ndCBiZSBhZGRl
ZC4KPiA+Cj4gPiBXaGljaCBtb2R1bGVzIHdvdWxkIHlvdSBiZSBpbnRlcmVzdGVkIGluIG1vc3Qg
b2YgYWxsPwo+Cj4gICBJZiB5b3UncmUgbm90IGFibGUgb3Igd2lsbGluZyB0byBkZXZlbG9wIHRo
ZSBRdDYgUU1MIHN1cHBvcnQgeW91cnNlbGYsIHlvdSBtYXkKPiB3YW50IHRvIGhpcmUgc29tZSBo
ZWxwIHRvIGRvIGl0LiBBdCB0aGUgYm90dG9tIG9mIHRoZSAic3VwcG9ydCIgcGFnZSBvbiB0aGUK
PiB3ZWJzaXRlIFsxXSBzb21lIGNvbXBhbmllcyBhcmUgbWVudGlvbmVkIHRoYXQgY2FuIHByb3Zp
ZGUgdGhhdCBoZWxwIChJIHdvcmsgZm9yCj4gb25lIG9mIHRoZW0pLiBPciB5b3UgY2FuIGZpbmQg
YSBmcmVlbGFuY2VyIC0gbGlrZSBHaXVsaW8uCj4KPiAgIFlvdSBjYW4gYWxzbyBhc2sgdGhlIG9y
aWdpbmFsIGNvbnRyaWJ1dG9yIG9mIFF0NiAoSmVzc2UsIGFkZGVkIGluIENjKSBpZiB0aGV5Cj4g
cGVyaGFwcyBoYXZlIHNvbWUgUG9DIGZvciBRTUwgYWxyZWFkeS4gT3IgcGVyaGFwcyB0aGVpciBl
bXBsb3llciB3b3VsZCBiZQo+IHdpbGxpbmcgdG8gc2hhcmUgdGhlIGNvc3Qgb2YgZGV2ZWxvcGlu
ZyBpdC4KCkkgZG8gaGF2ZSBhIHdvcmtpbmcgUE9DIHRvIGJ1aWxkIFFNTCB3aXRoIGEgcGxhbiBm
b3Igc3VwcG9ydGluZwpRdFF1aWNrLCB3aGljaCBJIHZlcnkgbXVjaCB3YW50ZWQgdG8gZ2V0IHVw
c3RyZWFtZWQsIGhvd2V2ZXIgSSd2ZSBiZWVuCnN3YW1wZWQgd2l0aCBvdGhlciBub24tYnVpbGRy
b290IHdvcmsgc2FkbHkuClRoYXQgc2FpZCwgaXQgc2hvdWxkIGJlIHZlcnkgZG9hYmxlIHRvIGFk
ZCB0aGlzIHN1cHBvcnQgd2l0aCBub3QgdG9vIG11Y2ggd29yay4KSW4gYSBudXRzaGVsbDoKWW91
IG5lZWQgdG8gYWRkIHF0c2hhZGVydG9vbHMgYmVjYXVzZSBvZiB0aGUgcXNiIHRvb2wgaXQgYnVp
bGRzLCB0aGlzCmlzIGEgZGVwZW5kZW5jeSBmb3IgcXRkZWNsYXJhdGl2ZSB0byBidWlsZCBRdFF1
aWNrClRoaXMgcGF0Y2ggd2lsbCBiZSBpbXBvcnRhbnQ6Cmh0dHA6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIzMDgwODE3MjIzMS4xMTE0Njk2LTEtamVz
c2UudmFuZ2F2ZXJlQHNjaW90ZXEuY29tLwpUaGUgdHJpY2t5IHRoaW5nIHRoZXJlIGlzIHRoYXQg
dGhlIGhvc3QgcXQgcGFja2FnZSBkb2VzIG5vdCBidWlsZCB0aGUKR1VJIGJ5IGRlZmF1bHQsIGhv
d2V2ZXIgc2luY2UgcXQ2IGNlcnRhaW4gdG9vbHMgbmVlZCB0byBiZSBidWlsdAp0aHJvdWdoIHRo
ZSBob3N0IHBhY2thZ2UsIHFzYiBpcyBvbmUgb2YgdGhvc2UsIGFuZCB0byBhY3R1YWxseSBidWls
ZApxc2IgdGhyb3VnaCB0aGUgcXRzaGFkZXJ0b29scyBwYWNrYWdlIHlvdSBuZWVkIEdVSSBzdXBw
b3J0IGluIHRoZSBob3N0CmJ1aWxkLCBUaG9tYXMgaGFzIHByb3ZpZGVkIHNvbWUgdmFsdWFibGUg
ZmVlZGJhY2sgdGhlcmUgaG93IGEgcHJvcGVyCmZvbGxvdyB1cCBwYXRjaCBjb3VsZCBsb29rIGxp
a2UgdG8gYWRkIHRoaXMgZnVuY3Rpb25hbGl0eSB0aGUgcmlnaHQKd2F5LgoKT25jZSB0aGF0J3Mg
ZG9uZSBRTUwvUXRRdWljayB3aWxsIGJlIHF1aXRlIHRyaXZpYWwgdG8gYWRkLCBJIGFscmVhZHkK
aGF2ZSBhIHF0NmRlY2xhcmF0aXZlIHBhY2thZ2UgeW91IGNvdWxkIHdvcmsgd2l0aCBhbmQgKHdp
dGggc29tZQpyZWZyZXNoaW5nIG9mIG15IG1lbW9yeSkgSSBjb3VsZCBwcm92aWRlIHlvdSB0aGUg
bmVjZXNzYXJ5IGNvbmZpZwpvcHRpb25zIHRvIGFkZCBRdFF1aWNrIGFsb25nc2lkZSBpdC4KCkFz
IHNhaWQgSSBkb24ndCBoYXZlIHRoZSB0aW1lIG15c2VsZiBhdCB0aGUgbW9tZW50IHRvIGRvIGl0
IHJpZ2h0LCBhbmQKSSBkb24ndCBoYXZlIGEgdGltZWxpbmUgZm9yIHdoZW4gSSdsbCBiZSBhYmxl
IHRvIGRvIHNvLCBidXQgaWYgeW91J3JlCndpbGxpbmcgdG8gY29udGludWUgb24gdGhlIHdvcmsg
SSBoYXZlIHRvIGdldCBpdCBtZXJnZWQgaW4sIEknbGwKZ2xhZGx5IGhlbHAgb3V0IHdoZXJlIEkg
Y2FuIHdpdGggc29tZSBvZiBteSBpbml0aWFsIHdvcmsgYW5kIHdoYXQgSQprbm93IG9mIGhvdyB0
byBnZXQgaXQgYWxsIHdvcmtpbmcsIHRoZSBmaW5pc2hpbmcgdG91Y2hlcyBhbmQgdGVzdGluZwp3
aWxsIGJlIHVwIHRvIHlvdSBob3dldmVyIDopCgo+Cj4gICBSZWdhcmRzLAo+ICAgQXJub3V0Cj4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
