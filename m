Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722ABC5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 14:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7021605E7;
	Mon, 26 Aug 2024 14:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N9kPFR3Fb9wk; Mon, 26 Aug 2024 14:52:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01B15605F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01B15605F8;
	Mon, 26 Aug 2024 14:52:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42B531BF281
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 14:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31DC5606C5
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 14:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJqgAVk22y4J for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 14:52:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 528E3605F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 528E3605F8
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 528E3605F8
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 14:52:05 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-533488ffaddso5483245e87.1
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 07:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724683923; x=1725288723;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z45/jQWRiY48kmtZ9Ca2bKqq1D4Pjne3vOY0uTcD+v0=;
 b=Fez3aQWGD4ljxyHKg8t50Ni0ynBfnFoeMtNqVMyOiUYiylEMPA2m4kP1lTiYrf5FRM
 +D0j6wYhOiv6X1I69XX7YU154yZJTLko+toLPduAYP4OQCKIbcwm3b6mxGhHKLdN/8zt
 V/Ft81+k+2wb29+yBeh9M8DKYU38BVXKy6Y5SLkuHAtfeEo6UO/0FS4Df9WIC4L/o2oj
 g5xAv3wiiBIL/E3Nxq1W5tNbJnkEeBez+Fb5X9iZJJEif9RY080QK5cj/8zGFcQtk05V
 qiHcEPyLc6v/B/t3jrpsUBWgcP3da8mXGRshvXvGp5lueeeKszj2tS3YMeWLri88w2Fc
 buqA==
X-Gm-Message-State: AOJu0YyPmFQQLZ/H6fIw0HNdoqo69S/Kdpi6p5euR6bf/zHYuO1XPlvo
 Y6n+ueG7fJm8k+gZkfF1MGyqHWoyQckSLk3750dTxEygGehPSWdeBnPgXIowgTC4BMWjScSuKvh
 FyU+x6zuxK2+tW1/D1FK2tV5sOoyXjw==
X-Google-Smtp-Source: AGHT+IGFOJ/oo3HuSyDDuGhuFwNaH470Fvimw17I0ep91qR+smeh9mR1V5wA+9Q3e7t3HerbMQ7w+nbSJ+p/ywHk36o=
X-Received: by 2002:a05:6512:39ca:b0:530:e1f6:6ed6 with SMTP id
 2adb3069b0e04-5343875fd3fmr8222047e87.10.1724683922400; Mon, 26 Aug 2024
 07:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240807143318.439619-1-johan.oudinet@gmail.com>
 <20240807215156.35ad1fdc@windsurf>
In-Reply-To: <20240807215156.35ad1fdc@windsurf>
From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 26 Aug 2024 16:51:51 +0200
Message-ID: <CAJtjsKa4tkQETQzMAsLddXMjOkQbw74zaXqYOTtGW0vQEHroHA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724683923; x=1725288723; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z45/jQWRiY48kmtZ9Ca2bKqq1D4Pjne3vOY0uTcD+v0=;
 b=KbvIco8X2j5E+x2lQBisKORt5N1DmN/IdJjHoKvgikJEexCaB1IVsY+BV/Myeq+1gp
 J8UoPW+UhbTwnupqZl294+QdezeWU81Cqg0oUxHI9YMkSSa0iCntqX4ku/Yj6AU8friy
 GbQFVdmyZ+DUcpuRi8GQ99AuOBGRTGRS6/51dJKHylJglyuUB7EpcVWgL34OSjWjJ1SW
 j1Vp5+KTqKZqD3Qk4ONO+gD8jwIrlOMHAWsuxgpAkSTcUcJ+ttqRttu3sT2De9oe9/Ct
 1nq1k96L01wDmb7qrt0UeUBMDlU8etW31uCEs/1Ze8fCm4pyka2DpN0WuZzTbqDwOLxu
 pT3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KbvIco8X
Subject: Re: [Buildroot] [PATCH 00/18] Update Ejabberd and its dependencies
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gV2VkLCBBdWcgNywgMjAyNCBhdCA5OjUx4oCvUE0gVGhvbWFzIFBl
dGF6em9uaQo8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4gT24gV2VkLCAg
NyBBdWcgMjAyNCAxNjozMzowMCArMDIwMAo+IEpvaGFuIE91ZGluZXQgPGpvaGFuLm91ZGluZXRA
Z21haWwuY29tPiB3cm90ZToKPgo+ID4gSm9oYW4gT3VkaW5ldCAoMTgpOgo+ID4gICBwYWNrYWdl
L2VybGFuZy1zdHVuOiByZW5hbWVkIGZyb20gZXJsYW5nLXAxLXN0dW4KPiA+ICAgcGFja2FnZS9l
cmxhbmctZmFzdC14bWw6IHJlbmFtZWQgZnJvbSBlcmxhbmctcDEteG1sCj4gPiAgIHBhY2thZ2Uv
ZXJsYW5nLXhtcHA6IHJlbmFtZWQgZnJvbSBlcmxhbmctcDEteG1wcAo+Cj4gSSB3YXMgYSBiaXQg
Y29uZnVzZWQgYWJvdXQgdGhlc2UgcGF0Y2hlcy4gSSB3YXMgd29uZGVyaW5nIHdoeSB0aGUgbmFt
ZQo+IG9mIHRoZSBwYWNrYWdlIG1hdHRlcmVkLCBhbmQgd2h5IGl0IHdhcyBpbmZsdWVuY2luZyB3
aGVyZSB0aGUgZmlsZXMKPiBpbnN0YWxsZWQgYnkgdGhpcyBwYWNrYWdlIGFyZSBhY3R1YWxseSBp
bnN0YWxsZWQuLi4KPgo+IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIGl0IGFsbCBjb21lcyBm
cm9tOgo+Cj4gJCgyKV9FUkxBTkdfQVBQID0gJChzdWJzdCAtLF8sJChwYXRzdWJzdCBlcmxhbmct
JSwlLCQocGF0c3Vic3QgaG9zdC0lLCUsJCgxKSkpKQo+Cj4gd2hpY2ggZGVyaXZlcyB0aGUgRVJM
QU5HX0FQUCBuYW1lIGZyb20gdGhlIHBhY2thZ2UgbmFtZSwgc28KPiBlcmxhbmctcDEtc3R1biBi
ZWNvbWVzIHAxX3N0dW4uIElzIHRoYXQgY29ycmVjdD8KClRoYXQncyBjb3JyZWN0LgoKPgo+IEkg
dGhpbmsgaXQncyBxdWl0ZSB1bmlxdWUgaW4gQnVpbGRyb290IHRvIGRvIHNvbWV0aGluZyBsaWtl
IHRoaXMuIE90aGVyCj4gcGFja2FnZXMgbm9ybWFsbHkgaW5zdGFsbCB0aGVpciBzdHVmZiBpbnRv
IGEgbG9jYXRpb24gdGhhdCBpc24ndAo+IGRlcGVuZGVudCBvbiB0aGUgcGFja2FnZSBuYW1lIGNo
b3NlbiBieSBCdWlsZHJvb3QuCj4KPiBUaGF0IGJlaW5nIHNhaWQsIEkgYXNzdW1lIHlvdXIgY2hh
bmdlcyBhcmUgT0ssIGJ1dDoKPgo+IC0gV2h5IGFyZSB3ZSByZW5hbWluZyBvbmx5IHRob3NlIDMg
cGFja2FnZXMsIGFuZCBub3QgdGhlIG51bWVyb3VzIG90aGVyCj4gICBlcmxhbmctcDEgcGFja2Fn
ZXMgPwoKSSB0cmllZCB0byBtaW5pbWl6ZSB0aGUgbnVtYmVyIG9mIHJlbmFtaW5nIGFuZCBkaWQg
aXQgb25seSBmb3IKcGFja2FnZXMgd2hlcmUgdGhlcmUgd2FzIGF0IGxlYXN0IG9uZSBwYXRjaCBp
biBhbm90aGVyIHBhY2thZ2UgdGhhdAp3YXMgaGVyZSBvbmx5IGJlY2F1c2Ugb2YgdGhlIGluY29y
cmVjdCBuYW1lLgoKPgo+IC0gQ2FuIHdlIHNlcGFyYXRlIHRoZSByZW5hbWUgZnJvbSB0aGUgYnVt
cD8KClllcywgSSBjYW4uCgo+Cj4gLSBXZSBzaG91bGQgYWRkIENvbmZpZy5pbi5sZWdhY3kgZW50
cmllcyBtYXRjaGluZyB0aGUgbmFtZSBvZiB0aGUgb2xkCj4gICBwYWNrYWdlcywgc28gdGhhdCB0
aGUgbmV3IHBhY2thZ2VzIGdldCBhdXRvbWF0aWNhbGx5IHNlbGVjdGVkCgpPay4gSSBjb21wbGV0
ZWx5IGZvcmdvdCBhYm91dCB0aGlzIGxlZ2FjeSBmaWxlLiBUaGFua3MgZm9yIHRoZSByZW1pbmRl
ci4KCkknbGwgZG8gdGhlIGNoYW5nZXMgYW5kIHN1Ym1pdCBhIHYyIG9mIHRoaXMgcGF0Y2ggc2Vy
aWVzLiBUaGFua3MuCi0tIApKb2hhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
