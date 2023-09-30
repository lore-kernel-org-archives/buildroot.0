Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB28E7737E
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 17:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAA9F40C11;
	Sat, 30 Sep 2023 17:57:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAA9F40C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j9wwMRQrJsSY; Sat, 30 Sep 2023 17:57:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1AF1400C6;
	Sat, 30 Sep 2023 17:57:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1AF1400C6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 391BD1BF3EB
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 17:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 124558207C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 17:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 124558207C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5hTIdl2Dy8Gs for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 17:57:24 +0000 (UTC)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC60D82062
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 17:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC60D82062
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-4197310af61so16387811cf.3
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 10:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696096642; x=1696701442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UAC7qWv5jhV8IzmfEoWoNFSEPtxMB0V7G1z6/8JoD4s=;
 b=XR7ulMXXZe3e5KkDnPwRclcEsSgHsXE/5fhb57xaPzxSi/WAp+I/gsjpaBPjcUWTrR
 VkXpEpNN3WMQQpnQGmQbnstv1Jfi7ollk9WRjDMrWcMXb1f1KIQbWkDRF29Myr+jbaib
 T/nTHEIzJAPKjq14CkTnpw3zGpa6rvUmkUFZItcrlUg5ygB9ngZrzEtlajqKzJnPU1g4
 Xtn6RFbSr8JKRI85LVj8qeQXVLUGJF4JK/j9eYkNjtsy5AvOAKSR+ZXtgqdRjV+jUn71
 qslghf/GvEZPpgPEZgp1nOV+hKPGsnFL/Nflrij/qpie8WC7xNNGJbYoOkv2aRQkqqHq
 maIQ==
X-Gm-Message-State: AOJu0Yy0Zwuc6HGh6fnqLEY2BDqykvTBG96tDPFr1KADIKLR2wIjZNI0
 a50utiliy+LbQ37H4th0BGwpj/fdNez5ztqgqQs=
X-Google-Smtp-Source: AGHT+IEBl4GSwrK9WbkXFmL4zqewDWN3h68yhv8wdrgdd0Ioy4rEbssALhveGVEQpi7frYjQm+Sc0D7CxBGm+Fo1GyA=
X-Received: by 2002:ac8:5fcf:0:b0:417:cdc5:847a with SMTP id
 k15-20020ac85fcf000000b00417cdc5847amr9793375qta.39.1696096642636; Sat, 30
 Sep 2023 10:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220809094109.2279598-1-james.hilliard1@gmail.com>
 <507e45e1-3a75-536a-8e8a-7f9b997b6974@mind.be>
 <CADvTj4pekaH4L-VhJXxLsBWhH25Z6iG+D=D5Ap9F2VgHfUrvsw@mail.gmail.com>
 <69be23ee-2902-033b-0e8d-1b2624a32d97@mind.be>
In-Reply-To: <69be23ee-2902-033b-0e8d-1b2624a32d97@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 30 Sep 2023 11:57:10 -0600
Message-ID: <CADvTj4ogVg+_3xJxTvEDV9CxCq3Fa2J-M63Y9-ET6wCbT3_iZg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696096642; x=1696701442; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UAC7qWv5jhV8IzmfEoWoNFSEPtxMB0V7G1z6/8JoD4s=;
 b=j4hx6DEMHZNJ7DaTF6mlPenZtYPUhW+YHiBqpHkVVkP5QOyxagT1C3AktpfiEZys/3
 YvhlHGEehEF229xJluIs1aHppZ0YgaS9SnDqceImVGNyOHnhZqDI408cRW2vpIuLt5P1
 L9wiG0kI9ZeIlovwjfmIYL8eiPUsWC3wabMOrwOrAAebswiHgVuE15av0aDr1Xgqse6p
 OxYUEvoWJe3MzxKSVpUWybXM/VbJEW3Kc7IVeKxAZYl0iQUhL/FjSoYJcDlk7+QLoGl+
 oCB7pum6qD8zHZgPtkr7GxB+XZKFplTOngUS4WLyffG3D2sRRNPqzuCUfkXxxnmWff06
 k9DA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j4hx6DEM
Subject: Re: [Buildroot] [PATCH 1/2] package/gcc/gcc-bpf: add BPF target
 support
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
Cc: "Jose E . Marchesi" <jose.marchesi@oracle.com>,
 David Faust <david.faust@oracle.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBTZXAgMzAsIDIwMjMgYXQgMTA6MjbigK9BTSBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8
YXJub3V0QG1pbmQuYmU+IHdyb3RlOgo+Cj4gICBIaSBKYW1lcywKPgo+IE9uIDMwLzA5LzIwMjMg
MTc6NTYsIEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+ID4gT24gU2F0LCBTZXAgMzAsIDIwMjMgYXQg
OTowNuKAr0FNIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4g
Pj4KPiA+PiAgICBIaSBKYW1lcywKPiA+Pgo+ID4+ICAgIEFmdGVyIG1vcmUgdGhhbiBhIHllYXIg
d2UncmUgZmluYWxseSBnZXR0aW5nIGJhY2sgdG8gdGhpcyBwYXRjaC4uLgo+ID4+Cj4gPj4gT24g
MDkvMDgvMjAyMiAxMTo0MSwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gPj4+IFRoaXMgYWRkcyBH
Q0MgQlBGIHRhcmdldCBzdXBwb3J0LCBob3dldmVyIHVubGlrZSB0cmFkaXRpb25hbCB0YXJnZXRz
Cj4gPj4+IHRoZSBCUEYgdGFyZ2V0IGlzIGVmZmVjdGl2ZWx5IHVzZWQgYnkgcGFja2FnZXMgc3Vj
aCBhcyBzeXN0ZW1kIGFzCj4gPj4+IGEgc2VwYXJhdGUgbGFuZ3VhZ2UgcmF0aGVyIHRoYW4gYW4g
ZW50aXJlbHkgc2VwYXJhdGUgYXJjaGl0ZWN0dXJlLgo+ID4+Cj4gPj4gICAgSSBsb29rZWQgYXQg
dGhlIHN5c3RlbWQgbWVzb25maWxlIGFuZCBpdCBsb29rcyBsaWtlIGl0IHVuY29uZGl0aW9uYWxs
eSB1c2VzCj4gPj4gZ2NjLWJwZiBpZiBpdCBjYW4gZmluZCBicGYtbm9uZS1nY2MgaW4gUEFUSC4g
VGhhdCdzIGFubm95aW5nLCBiZWNhdXNlIGl0IG1lYW5zCj4gPj4gdGhhdCBjdXJyZW50bHksIGl0
J2xsIGFscmVhZHkgdXNlIGl0IGlmIGl0IGlzIGluc3RhbGxlZCBpbiAvdXNyL2Jpbi4uLiBJZGVh
bGx5Cj4gPj4gd2Ugc2hvdWxkIGVuYWJsZS9kaXNhYmxlIGl0IGluIHN5c3RlbWQgZGVwZW5kaW4g
b24gd2hldGhlciBnY2MtYnBmIGlzIGVuYWJsZWQgb3IKPiA+PiBub3QuCj4gPgo+ID4gQWN0dWFs
bHkgaXQgd29uJ3Qgc2luY2UgaXQgd2lsbCBvbmx5IHRyeSB0byB1c2UgY2xhbmcgdW5sZXNzIHlv
dSBzZXQKPiA+IC1EYnBmLWNvbXBpbGVyPWdjYywKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0
ZW1kL3N5c3RlbWQvYmxvYi92MjU0L21lc29uLmJ1aWxkI0wxMDkzCj4KPiAgIFllcyBpbmRlZWQs
IGl0IHNlZW1zIHRvIGRlZmF1bHQgdG8gY2xhbmcsIEkgaGFkIG1pc3NlZCB0aGF0Lgo+Cj4KPiA+
IFByb2JhYmx5IGEgZ29vZCBpZGVhIHRvIGV4cGxpY2l0bHkgZGlzYWJsZSBmb3Igbm93IHdpdGgg
LURicGYtZnJhbWV3b3JrPWZhbHNlIGFzCj4gPiB0aGF0IGNvdWxkIGFjdHVhbGx5IGJlIGFuIGlz
c3VlIHdpdGggY2xhbmcuCj4KPiAgIEluZGVlZC4KPgo+Cj4gPj4+IEFzIHN1Y2ggd2UgbmVlZCB0
byBidWlsZCB3aGF0IGlzIGVmZmVjdGl2ZWx5IGEgbXVsdGktYXJjaCB0b29sY2hhaW4KPiA+Pgo+
ID4+ICAgIEl0J3Mgbm90IHJlYWxseSBhIHRvb2xjaGFpbiBiZWNhdXNlIHRoZXJlJ3Mgbm8gbGli
YywganVzdCB0aGUgY29tcGlsZXIgaXRzZWxmLi4uCj4gPgo+ID4gSSByZWNhbGwgaXQgZG9lcyBt
YWtlIHVzZSBvZiBhIHN0YXRpYyBsaWJnY2MuYSBvciBzb21ldGhpbmcgbGlrZSB0aGF0LAo+ID4g
bm90IGEgZnVsbAo+ID4gbGliYyBBRkFJVSBidXQgdGhlcmUgYXJlIHNvbWUgaXNzdWVzIHdpdGgg
aGFuZGxpbmcgbGlua2luZyBzdGlsbC4KPgo+ICAgbGliZ2NjIGlzIHBhcnQgb2YgZ2NjIChvYnZp
b3VzbHkpLgo+Cj4gICBsaWJjIGlzbid0IGJ1aWx0IGZvciBCUEYgc28gdGhlcmUgd291bGQgYmUg
bm8gcG9pbnQgZGVwZW5kaW5nIG9uIGl0LgoKSXNuJ3QgbGliYyBuZWVkZWQgYnkgZ2NjIGl0c2Vs
Zj8KCj4KPgo+ID4+PiBmb3IgR0NDIEJQRiBzdXBwb3J0LCBhcyB0aGUgQlBGIHRhcmdldCBpcyBl
ZmZlY3RpdmVseSBhIGJhcmUgbWV0YWwKPiA+Pj4gdGFyZ2V0IHRoaXMgaXNuJ3QgdGhlIHNhbWUg
YXMgYSBtdWx0aS1saWIgdG9vbGNoYWluIGFuZCBnZW5lcmFsbHkKPiA+Pj4gYXZvaWRzIGxpYnJh
cnkgY29uZmxpY3QgaXNzdWVzIGFzIHRoZSBCUEYgdGFyZ2V0IGRvZXMgbm90IGhhdmUKPiA+Pj4g
dXNlcnNwYWNlIGxpYnJhcmllcy4KPiA+Pgo+ID4+ICAgIC4uLiB3aGljaCB5b3UgYWxyZWFkeSBz
YXkgaGVyZSA6LSkKPiA+Pgo+ID4+Cj4gPj4+IFRoaXMgYWRkcyBhbiBhZGRpdGlvbmFsIGdjYyBi
dWlsZCBzdGFnZSB3aGljaCBpcyBzaW1pbGFyIHRvIGdjYy1maW5hbAo+ID4+PiBhbmQgYWRkZWQg
YXMgYSB0b29sY2hhaW4gZGVwZW5kZW5jeSB3aGVuIEJQRiB0YXJnZXQgc3VwcG9ydCBpcwo+ID4+
PiBlbmFibGVkLgo+ID4+Cj4gPj4gICAgSSBkb24ndCBzZWUgd2h5IHRoaXMgaXMgYW4gYWRkaXRp
b25hbCBnY2MgYnVpbGQgc3RhZ2UuIEl0IHNlZW1zIHRvIG1lIHRoYXQKPiA+PiBnY2MtYnBmIHNo
b3VsZG4ndCBuZWVkIGEgZGVwZW5kZW5jeSBvbiBsaWJjIG9yIG9uIGhvc3QtZ2NjLWluaXRpYWwu
IEl0IHByb2JhYmx5Cj4gPj4gX2RvZXNfIGhhdmUgYSBkZXBlbmRlbmN5IG9uIGtlcm5lbCBoZWFk
ZXJzIHRob3VnaC4uLgo+ID4KPiA+IEhtbSwgbm90IGVudGlyZWx5IHN1cmUgb24gdGhlIGxpYmMg
ZGVwZW5kZW5jeSwgSSB0aGluayBJIGhhdmUgaXQgZGVwZW5kaW5nIG9uCj4gPiBob3N0LWdjYy1p
bml0aWFsIHNvIHRoYXQgaXQncyBidWlsdCBzaW1pbGFyIHRvIGhvc3QtZ2NjLWZpbmFsLgo+ID4K
PiA+Pgo+ID4+Cj4gPj4+IFNpbWlsYXIgdG8gb3VyIGdjYyB0b29sY2hhaW4gd2UgYWxzbyBuZWVk
IGEgdG9vbGNoYWluIHdyYXBwZXIsIHRoaXMKPiA+Pj4gaXMgc2VwYXJhdGUgZnJvbSBvdXIgbm9y
bWFsIHRvb2xjaGFpbiB3cmFwcGVyLgo+ID4+Cj4gPj4gICAgQXJlIHlvdSBzdXJlIHRoaXMgdG9v
bGNoYWluIHdyYXBwZXIgaXMgbmVlZGVkPyBNb3N0IG9mIHRoZSBmaXh1cHMgdGhhdCBhcmUKPiA+
PiBhcHBsaWVkIGJ5IHRoZSB3cmFwcGVyIHJlbGF0ZSB0byB0aGUgdGFyZ2V0IGFyY2hpdGVjdHVy
ZSBvcHRpb25zIC0gLW1hcmNoLAo+ID4+IC1tdHVuZSwgZXRjLiBJIHdvdWxkIGV4cGVjdCB0aGF0
IHRob3NlIHdvdWxkIHNpbXBseSBicmVhayBnY2MtYnBmIGVudGlyZWx5Li4uCj4gPj4gT3RoZXIg
b3B0aW9ucyBhcmUgZm9yIG9wdGltaXNhdGlvbiwgZGVidWdnaW5nLCBoYXJkZW5pbmcsIGV0Yy4g
SSdtIG5vdCBzdXJlIGlmCj4gPj4gaXQncyBhIGdvb2QgaWRlYSB0byBhcHBseSB0aG9zZSB3aGVu
IGNvbXBpbGluZyB0byBCUEYgZWl0aGVyLiBUaGVuIHRoZXJlJ3MKPiA+PiBwb2ludGluZyB0byB0
aGUgc3lzcm9vdCAtIGdpdmVuIHRoYXQgdGhpcyBpcyBhIGJhcmUgbWV0YWwgdG9vbGNoYWluLCBp
dAo+ID4+IHNob3VsZG4ndCBiZSBuZWVkZWQuIEFuZCBmaW5hbGx5IHRoZXJlIGlzIGNjYWNoZSwg
d2hpY2ggSSdtIGFsc28gbm90IHN1cmUgb2YgaWYKPiA+PiBpdCdzIGdvaW5nIHRvIHdvcmsgd2Vs
bCB3aXRoIEJQRiBjb2RlIGdlbmVyYXRpb24uCj4gPgo+ID4gSXNuJ3QgdGhlIHRvb2xjaGFpbiB3
cmFwcGVyIG5lZWRlZCB0byBtYWtlIHN1cmUgaXQgd29yayB3aGVuIGJ1bmRsZWQgYXMgcGFydAo+
ID4gb2YgYW4gZXh0ZXJuYWwgdG9vbGNoYWluPwo+Cj4gICBObywgbm90IGF0IGFsbC4gSW4gZmFj
dCwgdGhlIHdyYXBwZXIgaXMgaW4gdGhlIHdheSB3aGVuIHlvdSB1c2UgaXQgYXMgYW4KPiBleHRl
cm5hbCB0b29sY2hhaW4sIGFuZCB3ZSBoYXZlIHNwZWNpYWwgaGFuZGxpbmcgZm9yIHRoYXQgY2Fz
ZS4KPgo+IFtzbmlwXQo+ID4+ICAgIEhvd2V2ZXIsIGZvciBnY2MtYnBmLCBJIGRvbid0IHRoaW5r
IGl0IG5lZWRzIHRvIGJlIHRpZWQgdG8gdGhlIGludGVybmFsCj4gPj4gdG9vbGNoYWluIGF0IGFs
bC4gRm9yIG1lLCBpdCBtYWtlcyBtb3JlIHNlbnNlIHRvIGhhdmUgaXQgYXMgYSBzZXBlcmF0ZSBw
YWNrYWdlLAo+ID4+IHVucmVsYXRlZCB0byBnY2MsIHdpdGggYSBmaXhlZCB2ZXJzaW9uLiBIYXZp
bmcgdGhlc2Ugc2VsZWN0YWJsZSB2ZXJzaW9ucyBpcwo+ID4+IGFueXdheSBhIHBhaW4gOi0pLiBB
bmQgSSBkb24ndCB0aGluayB0aGVyZSdzIGFueSByZWFzb24gdG8gbmVlZCB0byBsaW5rIHRoZQo+
ID4+IHZlcnNpb24gb2YgZ2NjLWJwZiB3aXRoIGdjYy10YXJnZXQuCj4gPgo+ID4gSSB0aGluayBJ
IGRpZCBpdCB0aGlzIHdheSBtb3N0bHkgZm9yIGNvbnNpc3RlbmN5LCBJIG1lYW4gaWYgeW91J3Jl
IGRvd25sb2FkaW5nCj4gPiBhbiBleHRlcm5hbCB0b29sY2hhaW4gd2l0aCBhIHNwZWNpZmljIGdj
YyB2ZXJzaW9uIGl0IHdvdWxkIGJlIGEgYml0IHVuZXhwZWN0ZWQKPiA+IGlmIHNheSB0aGUgZ2Nj
LWJwZiBjb21waWxlciB3YXMgYSBkaWZmZXJlbnQgdmVyc2lvbiBmcm9tIHRoZSByZXN0IG9mIHRo
ZSBnY2MKPiA+IHRvb2xjaGFpbi4KPgo+ICAgSSB0aGluayBpdCdzIGEgbWlzdGFrZSB0byB0aGlu
ayBvZiBnY2MtYnBmIGFzIHBhcnQgb2YgdGhlIHRvb2xjaGFpbi4gRXZlbiBpZgo+IHlvdSBidWls
ZCBzeXN0ZW1kIHdpdGggZ2NjLCB5b3UgY2FuIHN0aWxsIGVhc2lseSB1c2UgY2xhbmctYnBmIHRv
IGJ1aWxkIHRoZSBCUEYKPiBzdHVmZi4gVGhpcyBhbHJlYWR5IGluZGljYXRlcyB0aGF0IHRoZSBi
cGYgY29tcGlsZXIgaXMgbm90IHBhcnQgb2YgdGhlCj4gdG9vbGNoYWluLiBZb3UgY291bGQgYWxz
byBjb21wYXJlIGl0IHRvIHRoZSB0aS1jZ3QtcHJ1IGNvbXBpbGVyIGZvciB0aGUgUFJVCj4gY29u
dHJvbGxlcjogaXQncyBqdXN0IGEgY29tcGlsZXIgZm9yIHNvbWV0aGluZyBlbHNlIHRoYW4gb3Vy
IHRhcmdldCwgc28gaXQgaGFzCj4gbm8gcmVhbCByZWxhdGlvbnNoaXAgd2l0aCB0aGUgdG9vbGNo
YWluLgoKSG1tLCBzbyBob3N0LWNsYW5nIGFsc28gaGFzIGEgdG9vbGNoYWluIHdyYXBwZXIgZnJv
bSB0aGUgbG9va3Mgb2YgaXQsCkknbSBjb25mdXNlZAp3aHkgdGhhdCB3b3VsZCBuZWVkIG9uZSBh
bmQgdGhpcyB3b3VsZG4ndC4KCkknbSBub3Qgc3VyZSBob3cgdGktY2d0LXBydSBjb21wYXJlcyBp
biB0aGlzIGNhc2Ugc2luY2UgZ2NjLWJwZiBpcwpjb21waWxpbmcgY29kZQp0byBydW4gb24gb3Vy
IHRhcmdldCBDUFUuIEEgY2xhbmcvbGx2bSB0b29sY2hhaW4gY2FuIHRhcmdldCBib3RoIGJwZiBh
bmQgb3VyCnByaW1hcnkgQ1BVIGFyY2hpdGVjdHVyZSB3aXRoaW4gdGhlIHNhbWUgdG9vbGNoYWlu
IGFzIHdlbGwuCgo+Cj4KPiAgIFJlZ2FyZHMsCj4gICBBcm5vdXQKPgo+Cj4gW3NuaXBdCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
