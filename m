Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557A0C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 21:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0137981227;
	Sun, 23 Jun 2024 21:05:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhxXTmmyLCfG; Sun, 23 Jun 2024 21:05:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E292B811F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E292B811F3;
	Sun, 23 Jun 2024 21:05:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72C3E1BF580
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 21:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6091160837
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 21:05:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9GD5z4xa96b for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 21:05:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::31; helo=mail-oa1-x31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6177960638
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6177960638
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6177960638
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 21:05:13 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-2598ae41389so2039002fac.3
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 14:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719176712; x=1719781512;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KRVezl5aNyZWYsm+a92X8j+S8Z1MQsVUzd3yNRh2DXI=;
 b=snnpWQKsBpLanifQVfWcjGpQJJ4ZYtIkym4rd2c1rTp7Y4WFO+3ncWZAxpym5puTug
 HrSDDnbqgyEwdQb78ujQDKAMJ/lVMzWQsJJVlMSKMPwVyrFVWcCz0xTZKzGt75BEJz5y
 TF5gv39TeHLgkLCqXVCoWXspOv6nR7/PGfwJYlAOFNzV5R/pxhsOmIej3Rv7Dyg01Vhp
 SKFBC7kRQ7qSOf46hcUpVlUuQdSsL22LsQCVNdUYWIny+T72f0Up89MQnj0FOzaC/Egy
 tRrHDsDlkGoGE6KT/6kGNDOZTKfIdTLZRusiBOBucZDE8LtX0cjnsQkEwHvdM4Sxco9c
 z3mw==
X-Gm-Message-State: AOJu0YwQNStyQQdfmI+/HqACUcj1Ev2bm6jLyUIhekEWt2tuX6lhFpzd
 jSIjc0reQl434b7TRrAApmHaR/X9d9vI1qHeuuD0BnJeWu+lGAymKZqFi3Y3IYXQfXVOCVR/yQQ
 xQB9WsHBA9BWiOEm72b/1poWo5pJn+xjh
X-Google-Smtp-Source: AGHT+IGbNEYYW8jXLu3wT2vb6E9EFbEMDQRNQM47/BZOViKHVrtDzYQ2HX8LGipSn3et87h1EPl3AMYvhagS1TkxIf4=
X-Received: by 2002:a05:6870:89aa:b0:24f:dad3:97c with SMTP id
 586e51a60fabf-25d06e57b0bmr3284829fac.46.1719176711874; Sun, 23 Jun 2024
 14:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718382114.git.yann.morin.1998@free.fr>
 <185f954c798e7d8e7e1400a8b39abe1b273e849b.1718382114.git.yann.morin.1998@free.fr>
 <CADvTj4p=iYe8wK4UMnvCSmsV02JesvY9BWQDZOfcbV_PeSAkNQ@mail.gmail.com>
 <Zm9KqRyiYxLxVfwy@landeda>
 <CADvTj4r+O-RTMRMTSWmhW-Tb1UThcjsRM0mA1=H0DsNM3cGuTg@mail.gmail.com>
 <ZnXbepvruXKajEcz@landeda>
In-Reply-To: <ZnXbepvruXKajEcz@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 23 Jun 2024 15:05:00 -0600
Message-ID: <CADvTj4qMjDsW6CWNwo0sNJ9SbOKsUaQ7fDBg6z=gHB5uesZ1WA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719176712; x=1719781512; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KRVezl5aNyZWYsm+a92X8j+S8Z1MQsVUzd3yNRh2DXI=;
 b=cgxUTcQMAk1d45WY11rnUjTuqXuCqWL0DpWTPVReBEeV/eybhRhsnQNLQFkY9n1xTq
 nO1twwjDN2KIE5w4fj2bINCoJ98YeE7Y9DWtzQ4k3od+MyWd24qaz0oXkbrSJ/FtLAqw
 aRbOYEBldtfD7ht4iM4bgZqBtb8e/BdSHw12VL9/SzWBNjZeCf1QQj4EholN6Boi4tSb
 a0c12HaqzFm+hf4vxg+27Tyq4rJAnyTj7izOVcnhPvRlaLQT2TzU+toNz1ogGmNbHuaG
 TTlQiGYwzfo4fLRIj7PDL1/qqzbKYQYeXsgGkvIALyjWra7vS8vJuXuIA3wlCwaCQAA+
 EMMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cgxUTcQM
Subject: Re: [Buildroot] [PATCH 2/6] utils/update-rust: add script to
 automatically update the rust version
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

T24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgMTo1OOKAr1BNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEphbWVzLCBBbGwsCj4KPiBPbiAyMDI0LTA2LTIw
IDEyOjEzIC0wNjAwLCBKYW1lcyBIaWxsaWFyZCBzcGFrZSB0aHVzbHk6Cj4gWy0tU05JUC0tXQo+
ID4gSSBkb24ndCB0aGluayB0aGVyZSdzIHJlYWxseSBhbnkgbWVhbmluZ2Z1bCBhZHZhbnRhZ2Ug
dG8gcmVxdWVzdHMgdnMKPiA+IHVybGxpYi5yZXF1ZXN0LnVybG9wZW4gd2hpY2ggaXMgcGFydCBv
ZiB0aGUgc3RhbmRhcmQgbGlicmFyeSBmb3IgdGhpcwo+ID4gcGFydGljdWxhciB1c2UgY2FzZS4K
Pgo+IHJlcXVlc3RzLmdldCgpIGlzIHNob3J0ZXIhIDstKQo+Cj4gU28sIEkgZW5kZWQgdXAga2Vl
cGluZyB1c2Ugb2YgcmVxdWVzdHMuIFRoaXMgc2NyaXB0IGlzIG5vdCBwYXJ0IG9mIHRoZQo+IGJ1
aWxkIHByb2Nlc3M7IGl0IGlzIGp1cyB0YSBoZWxwZXIgc2NyaXB0LCBzbyBpdCBpcyBhY2NlcHRh
YmxlIHRoYXQgd2UKPiBkZXBlbmQgb24gYSBub24tc3RkbGliIG1vZHVsZSwgZXNwZWNpYWx5IHN1
Y2ggYSB3aWRlbHkgYXZhaWxhYmxlIG9uZSBhcwo+IHJlcXVlc3RzIGlzLgoKVGhlIG1haW4gaXNz
dWUgd2l0aCByZXF1ZXN0cyBJIHRoaW5rIGlzIHRoYXQgdGhlcmUncyBzb21lIHBvdGVudGlhbCBm
b3IgdmVyc2lvbgppbmNvbXBhdGliaWxpdGllcyB3aXRoIHJlcXVlc3RzIGRlcGVuZGVuY2llcyBh
cyBpdCBkZXBlbmRzIG9uIG5vbi1zdGRsaWIKcGFja2FnZXMuCgpGb3IgZXhhbXBsZSBJIHNlZSB0
aGlzIHdhcm5pbmcgd2hlbiBydW5uaW5nIHRoZSBzY3JpcHQgd2l0aCByZXF1ZXN0cyBvbgpvbmUg
c3lzdGVtIG9mIG1pbmU6Ci91c3IvbGliL3B5dGhvbjMvZGlzdC1wYWNrYWdlcy9yZXF1ZXN0cy9f
X2luaXRfXy5weTo4NzoKUmVxdWVzdHNEZXBlbmRlbmN5V2FybmluZzogdXJsbGliMyAoMS4yNi41
KSBvciBjaGFyZGV0ICg1LjEuMCkgZG9lc24ndAptYXRjaCBhIHN1cHBvcnRlZCB2ZXJzaW9uIQog
IHdhcm5pbmdzLndhcm4oInVybGxpYjMgKHt9KSBvciBjaGFyZGV0ICh7fSkgZG9lc24ndCBtYXRj
aCBhIHN1cHBvcnRlZCAiCgpBbnl3YXlzIHdlIGNhbiB1c2UgdXJsbGliLnJlcXVlc3Qgd2l0aG91
dCBhbnkgZXh0cmEgbGluZXMgb2YgY29kZSwgc2VlOgpodHRwczovL3BhdGNod29yay5vemxhYnMu
b3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwNjIzMjAzNTU3LjM4MzAxMjItMS1qYW1l
cy5oaWxsaWFyZDFAZ21haWwuY29tLwoKPgo+ID4gPiAgICAgb3MucGF0aC5iYXNlbmFtZShta19m
aWxlKVs6LTNdLnVwcGVyKCkucmVwbGFjZSgiLSIsICJfIikgKyAiX1ZFUlNJT04iCj4gPiA+ICAg
ICBwYXRobGliLlBhdGgobWtfZmlsZSkubmFtZVs6LTNdLnVwcGVyKCkucmVwbGFjZSgiLSIsICJf
IikgKyAiX1ZFUlNJT04iCj4gPiA+IE9uZSBjaGFyIGxvbmdlci4uLiA7LSkKPiA+IHBhdGhsaWIu
UGF0aChta19maWxlKS5zdGVtLnVwcGVyKCkucmVwbGFjZSgiLSIsICJfIikgKyAiX1ZFUlNJT04i
Cj4gPiBGb3VyIGNoYXJhY3RlcnMgc2hvcnRlci4gOy0pCj4KPiBPSywgeW91IHdpbi4gOy0pCj4K
PiBJIHVzZWQgdGhhdCBpbiB0aGUgZmluYWwgc2NyaXB0Lgo+Cj4gWy0tU05JUC0tXQo+ID4gPiBJ
cyB0aGF0IHJlYWxseSBpbXBvcnRhbnQgdGhhdCB0aGUgc2NyaXB0IGNhbiBiZSBydW4gZnJvbSBh
bnl3aGVyZT8gSQo+ID4gPiBkb24ndCB0aGluayBzby4gSSBjYW4gaG93ZXZlciBhZGQgYSBjaGVj
ayB0aGF0IHRoZSBmaWxlcyB3ZSB3YW50IHRvCj4gPiA+IGdlbmVyYXRlIGFuZCB0d2VhayBkbyBh
bHJlYWR5IGV4aXN0LCB0aG91Z2g7IHRoYXQncyBhIGdvb2QgcG9pbnQuCj4gPiBJJ20gbm90IHN1
cmUsIGJ1dCBpdCBzaG91bGQgYmUgcHJldHR5IGVhc3kgdG8gaW1wbGVtZW50LCBtYXkgYWxzbwo+
ID4gd2FudCB0byB1c2UgcGF0aGxpYiB0eXBlcyBoZXJlLgo+Cj4gSSB3YW50ZWQgdG8ga2VlcCB0
aGUgc2NyaXB0IGFzIHNpbXBsZS1zdHVwaWQgYXMgcG9zc2libGUuIFJlcXVpcmluZyB0aGF0Cj4g
aXQgYmUgcnVuIGZyb20gQnVpbGRyb290J3MgdG9wIGRpciBpcyBub3QgdG9vIHN0cm9uZyBhIGxp
bWl0YXRpb24sIGFuZAo+IGFkZGluZyBzdXBwb3J0IGZvciBydW5uaW5nIGZyb20gYW55d2hlcmUg
d291bGQganVzdCBhZGQgbW9yZSBjb21wbGV4aXR5Cj4gKGV2ZW5tIGlmIG5vdCB0b28gbXVjaCku
IFNvLCBJIGVycmVkIG9uIHRoZSBzaW1wbGljaXR5IHNpZGUsIGFuZCBqdXN0Cj4gY2F0Y2hlcyB0
aGUgY2FzZSB3aGVyZSBhIGZpbGUgaXMgbm90IGZvdW5kLCBhc3N1bWluZyB0aGVuIHRoYXQgd2Un
cmUgbm90Cj4gcnVubmluZyBmcm9tIHRoZSB0b3AgZGlyLgoKSXQncyBwb3NzaWJsZSB0byByZW1v
dmUgdGhhdCBsaW1pdGF0aW9uIHdoaWxlIHNpbXBsaWZ5aW5nIGl0IGZ1cnRoZXIgdXNpbmcKcGF0
aGxpYiwgaXQncyBsZXNzIG92ZXJhbGwgbGluZXMgb2YgY29kZSBldmVuLCBzZWU6Cmh0dHBzOi8v
cGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNDA2MjMyMDU4
MjEuMzgzMzMyMS0xLWphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20vCgo+Cj4gVGhhbmsgeW91IGZv
ciB0aGUgcmV2aWV3IGluIGFueSBjYXNlLCBpdCBpcyBhbHdheXMgaW50ZXJlc3RpbmcgdG8gYmUK
PiBjaGFsbGVuZ2VkIGFuZCB0byBleHBsYWluIHRoZSBjaG9pY2VzLiBUaGFua3MhCj4KPiBSZWdh
cmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiAtLQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4g
fCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9O
IHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBE
ZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+IHwgKzMz
IDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBc
ZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8q
XF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
