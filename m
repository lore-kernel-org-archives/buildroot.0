Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99591D13590
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 02:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45D2C605B7;
	Mon, 28 Oct 2024 02:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BzTTSFgrLNai; Mon, 28 Oct 2024 02:41:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E2CA605C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E2CA605C4;
	Mon, 28 Oct 2024 02:41:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE6B54EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 02:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D90C0605C4
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 02:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K5TKDZkNeZsW for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 02:41:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2c; helo=mail-vs1-xe2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E849E605B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E849E605B7
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E849E605B7
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 02:41:09 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id
 ada2fe7eead31-4a48839bc89so1015796137.1
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 19:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730083268; x=1730688068;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wB3aDT0VDqPEXsdZa+KcZbcTDTyNR7CfG9ovfQRcJec=;
 b=xD/xiynbDGRz3eQmzf0AerlMtlUAOx5wS+xiCAyRujzyf5Tvla4IDBexQ4befHUnKO
 6+4HqWIG/3Yrs1k3Icel7MBQs7LCSSB7xY8CzVo7qDbRjYPwaU8TePrRUwRTr8OG84/l
 cednKeLePzz76P4l5+SZDEqtzj+XxjZd9KlFrV2iNMlCY56MsVS04mtS2LdSj/2ZKmDx
 VpYSt85tovJb+YimOQGVwyOdC8nrxPvCMMUzNddabkGgVaZTRMeuGzXV6qMgmJxlfZFM
 M1QvL6Yo5TGOAsK003OMvWFJ1gMfW5SWdwfgd6IDfC+0HpDsz+K22nm1YSidYFeg3wyR
 0PGQ==
X-Gm-Message-State: AOJu0Yy5jmioUQHAfxuNpIX1RKsdZDDVN7r0lyrQwaMwbOLW0jovDig5
 ohhxtIh/8Lhm5m071SPTiQNqJ6rINfp8xX4fCdjbjHAcpwO4zahaMvRNFIDUpuVICcpzCDCbRhX
 g2oxAVTybNfNXPo7Fs4vU/02RMDQ=
X-Google-Smtp-Source: AGHT+IE0Q+xuJQhCCfLz3y8/zAsybuQ80fisy76pQQ4ArMuC0x9s8CtVJEKeMXedDirRr4/4iCzN+H587kPjg8p45pU=
X-Received: by 2002:a05:6102:3a07:b0:4a7:4900:4b83 with SMTP id
 ada2fe7eead31-4a8cfb7c821mr3683340137.15.1730083268486; Sun, 27 Oct 2024
 19:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240924023919.1502635-1-james.hilliard1@gmail.com>
 <1a58f-6718aa80-1-76c39280@156352477>
In-Reply-To: <1a58f-6718aa80-1-76c39280@156352477>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Oct 2024 20:40:57 -0600
Message-ID: <CADvTj4pgB3y4smJh_MYVT7fTfkSDuRADk_QhU0Ku_tjusLg72w@mail.gmail.com>
To: Michael Nosthoff <buildroot@heine.tech>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730083268; x=1730688068; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wB3aDT0VDqPEXsdZa+KcZbcTDTyNR7CfG9ovfQRcJec=;
 b=aljWdKEKWFSaMhGCl5xifZYgc2i7W7egp6V55On8AIjZT+KVUPuivlDnFtfKgJp8jV
 yGER51wOzUY3MBO0IG2/xL969S7suNU6hhUyBbmSf8ScR7ZXqc1WXaj4ofqSBWU5IovD
 S/BT4L0hYP2LLKzQ4HcGQDC3BEUwyR3yeMO89aYLm8h5XPo/DjXItnTq4rbRdPAgLvbh
 dPgMbFGkcqLvklJI5nMWfh5iyiUXmzTzbzsEJvQ9lO+YKHCevR+GkFxHxXtTaAUu6D6C
 HpdiuWB1/zngWcq9oH1isTwHNiPgXYFMhFHsXCI9yjFthQFTAYil6Gz/bvq8+vhmOPjh
 hz5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aljWdKEK
Subject: Re: [Buildroot] [PATCH v2 1/3] package/{python-}protobuf: bump to
 version 28.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>, Robert Rose <robertroyrose@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBPY3QgMjMsIDIwMjQgYXQgMTo0OeKAr0FNIE1pY2hhZWwgTm9zdGhvZmYgPGJ1aWxk
cm9vdEBoZWluZS50ZWNoPiB3cm90ZToKPgo+IEhpIEphbWVzLAo+Cj4gSSBmaW5hbGx5IGZvdW5k
IHRpbWUgdG8gdGVzdCB0aGUgcGF0Y2hzZXQuCj4KPiBPbiBUdWVzZGF5LCBTZXB0ZW1iZXIgMjQs
IDIwMjQgMDQ6MzkgQ0VTVCwgSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gPiBNaWdyYXRlIHByb3RvYnVmIGJ1aWxkIGZyb20gYXV0b3Rvb2xzIHRv
IGNtYWtlLgo+ID4KPiA+IE1pZ3JhdGUgcHJvdG9idWYtcHl0aG9uIHRvIHVzZSBweXBpIHNvdXJj
ZXMgd2hpY2ggYXJlIG5vdyByZXF1aXJlZAo+ID4gZm9yIHNldHVwLnB5IGJ1aWxkczoKPiA+IGh0
dHBzOi8vZ2l0aHViLmNvbS9wcm90b2NvbGJ1ZmZlcnMvcHJvdG9idWYvdHJlZS92MjguMS9weXRo
b24jYnVpbGRpbmctZnJvbS1zZXR1cHB5Cj4gPgo+Cj4gQWZ0ZXIgYXBwbHlpbmcgdGhlIHBhdGNo
c2V0IHRoZSBwa2djb25mIGRldGVjdGlvbiBvZiAoaG9zdC0pcHJvdG9idWYgc2VlbXMgdG8gYmUg
YnJva2VuLgo+IEF0IGxlYXN0IG9uIG15IHN5c3RlbSBpdCBqdXN0IGdvZXMgaW50byBhbiBlbmRs
ZXNzIGxvb3AuIFdoaWNoIGlzIG5vdCBoYXBwZW5pbmcgYmVmb3JlIHRoZSBidW1wLgo+Cj4gVGhp
cyBicmVha3MgZS5nLiwgcHJvdG9idWYtYyBhbmQgY29sbGVjdGQgYXMgdGhlaXIgY29uZmlndXJl
IHN0ZXAganVzdCBibG9ja3MgaW5kZWZpbml0ZWx5Lgo+Cj4gRGVmY29uZmlnIHRvIHJlcHJvZHVj
ZToKPgo+IEJSMl9hcm09eQo+IEJSMl9jb3J0ZXhfYTE1PXkKPiBCUjJfVE9PTENIQUlOX0VYVEVS
TkFMPXkKPiBCUjJfUEFDS0FHRV9QUk9UT0JVRl9DPXkKPgo+IHNlcGFyYXRlZCBjb21tYW5kIHdo
aWNoIG5ldmVyIHJldHVybnM6Cj4KPiAgIC4vb3V0cHV0L2hvc3QvYmluL3BrZ2NvbmYgLS1jZmxh
Z3MgcHJvdG9idWYKPgo+IENhbiB5b3UgcmVwcm9kdWNlIHRoYXQ/IEFueSBpZGVhIHdoYXQgY291
bGQgYmUgY2F1c2luZyB0aGlzPwoKSXQgYXBwZWFycyB0byBiZSByZWxhdGVkIHRvIHVzIHVzaW5n
IGEgdmVyeSBvdXRkYXRlZCBwa2djb25mLCB3aGljaCBJIGFjdHVhbGx5CmhhZCBzZW50IGEgcGF0
Y2ggYnVtcGluZyBidXQgd2hpY2ggaGFzbid0IHlldCBiZWVuIG1lcmdlZCBhcHBhcmVudGx5LCB0
aGlzCmRvZXMgYXBwZWFyIHRvIGZpeCB0aGF0IHNwZWNpZmljIGlzc3VlIGZvciBtZToKaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI0MTAwMjE2
MjU1OC4zMzc1NDE0LTEtamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbS8KCj4KPiBSZWdhcmRzLAo+
IE1pY2hhZWwKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
