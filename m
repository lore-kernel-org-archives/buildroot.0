Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28214C10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 19:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC6FE40621;
	Tue,  7 May 2024 19:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ycRjTyTeKgnQ; Tue,  7 May 2024 19:05:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61A5840622
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61A5840622;
	Tue,  7 May 2024 19:05:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 747521BF369
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 19:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6056B40621
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 19:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ncVOsxyNieG for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 19:05:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E794A40622
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E794A40622
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E794A40622
 for <buildroot@buildroot.org>; Tue,  7 May 2024 19:05:36 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-6181d032bf9so34260917b3.3
 for <buildroot@buildroot.org>; Tue, 07 May 2024 12:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715108735; x=1715713535;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A+MDddA+fdtj8D4ZckoFDPfp7V+OcchDdDESJGmnUNQ=;
 b=eMVkdsNGvt+uCT/UE/PLPBk6Uv6WAHx844u9r75K3TSLAGwPStUiHUOXucEOuRV1cT
 QZla3y7tdEzjcro3abxslvsVIRRiGXVD8G5JQy2scPc+zI/PTQQKqgTVguVAmjEStgkZ
 fHn37h/36T4hC50fPcUa6icO9F8U2vOjfyYBg7C2w5wAMK7m1+wAvi19C46jfnnDO2jN
 fF3qby8e1icTizQY7SbgTTsK1+R+ZfnZ34cMJg6MDBovBFa56dljaAjUW5Yx8TLF0rRA
 TWDgd0VYhsMyrbI1cY5MuPAC6xOcUJE8TP/t3YXgXcvsyWYao387Lwl4ZwMUoAKrU0tp
 /vZg==
X-Gm-Message-State: AOJu0YzoXSgoL95op3uDQgmn2lw37uu2rw9oVg+54xMbA8WAQapLIF6r
 14Pv73CjZZi2/GviTPZ63kOULe6WDK7xjNWKq/EYVP0obp96uxWFu96SV7aMBerscx+L6HC+jtV
 WVW6mfymnbt054SgLb3Gu99t/ys+znLrPNJA36Q==
X-Google-Smtp-Source: AGHT+IFqTvCvj6KDl8w8jblZ4BAqz0FnkEl0yZhAsVwhozkNC7Hk11vhtqgvTkMud5WwewVeArXbhWie90+lJJ5sNA4=
X-Received: by 2002:a05:690c:600e:b0:61a:ccfc:4543 with SMTP id
 00721157ae682-620862f70eemr7437297b3.47.1715108734166; Tue, 07 May 2024
 12:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240502090939.748610-1-dario.binacchi@amarulasolutions.com>
 <Zjei4EXWx3XZnTuN@landeda>
In-Reply-To: <Zjei4EXWx3XZnTuN@landeda>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 7 May 2024 21:05:23 +0200
Message-ID: <CABGWkvrz9WNB=QrfJuvZ8=T9RrY_P2V2B40sJNPL7eWGwAYpmw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1715108735; x=1715713535;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A+MDddA+fdtj8D4ZckoFDPfp7V+OcchDdDESJGmnUNQ=;
 b=FgXUzS9vyN6n7zEK19jRnv4wdHVrAHMe0ijg9X7TRpDQU3QPUSDgWDvbvBjCtUgnYH
 XmJCU+uLRTyxtsbZeJZsuXoiIK1MmhOVEjDjcgJlzOt7jTc+GPBzO6ku24FJCT5Cl6Ag
 nKYcMcgmnYa7MZeyCoID1URGe7IDEWPwQytvY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FgXUzS9v
Subject: Re: [Buildroot] [RFC PATCH 1/1] support/scripts/apply-patches.sh:
 set the maximum fuzz factor to 1
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIFN1biwgTWF5IDUsIDIwMjQgYXQgNToxNuKAr1BNIFlhbm4gRS4gTU9SSU4g
PHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+Cj4gRGFyaW8sIEFsbCwKPgo+IE9u
IDIwMjQtMDUtMDIgMTE6MDkgKzAyMDAsIERhcmlvIEJpbmFjY2hpIHNwYWtlIHRodXNseToKPiBb
LS1TTklQLS1dCj4gPiBCeSBzZXR0aW5nIHRoZSBtYXhpbXVtIGZ1enogZmFjdG9yIHRvIDEsIHdl
IHJlZHVjZSB0aGUgcG9zc2liaWxpdHkgdGhhdAo+ID4gcGF0Y2hlcyB3aGljaCBjYW5ub3QgYmUg
YXBwbGllZCBhcmUgaW5jb3JyZWN0bHkgcmVwb3J0ZWQgYXMgdmFsaWQuCj4KPiBJIHRoaW5rIGl0
IGlzIGEgZ29vZCBpZGVhIG92ZXJhbGwuCj4KPiBEaWQgeW91IGFzc2VzcyBob3cgbWFueSBvZiBv
dXIgcGF0Y2hlcyB0aHVzIG5vIGxvbmdlciBhcHBseSB3aXRoIHRoaXMKPiBjaGFuZ2U/CgpObywg
YnV0IEkgaGF2ZSBzdGFydGVkIHRlc3RpbmcgYWJvdXQgaXQuCgo+Cj4gTm90ZSB0aGF0LCBleGNl
cHQgZm9yIHRoZSBodWdlIGFtb3VudCBpdCB3b3VsZCByZXF1aXJlLCBJIHdvdWxkIHByZXR0eQo+
IG11Y2ggYmUgaW4gZmF2b3VyIG9mIGJlaW5nIGV2ZW4gc3RyaWN0ZXIsIGFuZCByZWZ1c2UgYW55
IGZ1enogYXQgYWxsLAo+IHRodXMgZWZmZWN0aXZlbHkgcmVxdWlyaW5nIHRoYXQgcGF0Y2hlcyBh
Y3R1YWxseSBiZSBwcm9wZXJseSByZWZyZXNoZWQKPiBmb3IgYSB2ZXJzaW9uIGJ1bXAuCgpJIGFn
cmVlIHdpdGggeW91LiBJIGhhZCBhbHNvIHRob3VnaHQgYWJvdXQgaXQsIGJ1dCBJIGRpZG4ndCB3
YW50IHRvIG1ha2UgYSB0b28KYWdncmVzc2l2ZSBwYXRjaCBmb3IgdGhlIGZpcnN0IHZlcnNpb24u
CgpJIGFtIHJ1bm5pbmcgdGVzdHMgd2l0aCAtRjAgYW5kIC1GMSB0byBzZWUgdGhlIG51bWJlciBv
ZiBwYXRjaGVzIHRoYXQKZmFpbCBpbiBib3RoIGNhc2VzLiBJIGFtIHVzaW5nIHRoZSBgbGVnYWwt
aW5mb2AgdGFyZ2V0LCB3aGljaCBzdG9wcyBhdCBhcHBseWluZwogcGF0Y2hlcyB3aXRob3V0IGNv
bXBpbGluZyB0aGUgcGFja2FnZXMuIEl0IHdpbGwgdGFrZSBtZSBzb21lIHRpbWUsIGJ1dCBhcwpz
b29uIGFzIEkgaGF2ZSB0aGUgcmVzdWx0cywgSSB3aWxsIHVwZGF0ZSB5b3UuCgpUaGFua3MgYW5k
IHJlZ2FyZHMsCkRhcmlvCgo+Cj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9u
cy5jb20+Cj4gPiAtLS0KPiA+ICBzdXBwb3J0L3NjcmlwdHMvYXBwbHktcGF0Y2hlcy5zaCB8IDIg
Ky0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9zY3JpcHRzL2FwcGx5LXBhdGNoZXMuc2ggYi9zdXBw
b3J0L3NjcmlwdHMvYXBwbHktcGF0Y2hlcy5zaAo+ID4gaW5kZXggNmRhODNmNjgyNmU5Li45OTkz
ODRjYmJkNWIgMTAwNzU1Cj4gPiAtLS0gYS9zdXBwb3J0L3NjcmlwdHMvYXBwbHktcGF0Y2hlcy5z
aAo+ID4gKysrIGIvc3VwcG9ydC9zY3JpcHRzL2FwcGx5LXBhdGNoZXMuc2gKPiA+IEBAIC0xMTQs
NyArMTE0LDcgQEAgZnVuY3Rpb24gYXBwbHlfcGF0Y2ggewo+ID4gICAgICAgICAgZXhpdCAxCj4g
PiAgICAgIGZpCj4gPiAgICAgIGVjaG8gIiR7cGF0aH0vJHtwYXRjaH0iID4+ICR7YnVpbGRkaXJ9
Ly5hcHBsaWVkX3BhdGNoZXNfbGlzdAo+ID4gLSAgICAke3VuY29tcH0gIiR7cGF0aH0vJHBhdGNo
IiB8IHBhdGNoIC1nMCAtcDEgLS1uby1iYWNrdXAtaWYtbWlzbWF0Y2ggLWQgIiR7YnVpbGRkaXJ9
IiAtdCAtTiAkc2lsZW50Cj4gPiArICAgICR7dW5jb21wfSAiJHtwYXRofS8kcGF0Y2giIHwgcGF0
Y2ggLUYxIC1nMCAtcDEgLS1uby1iYWNrdXAtaWYtbWlzbWF0Y2ggLWQgIiR7YnVpbGRkaXJ9IiAt
dCAtTiAkc2lsZW50Cj4gPiAgICAgIGlmIFsgJD8gIT0gMCBdIDsgdGhlbgo+ID4gICAgICAgICAg
ZWNobyAiUGF0Y2ggZmFpbGVkISAgUGxlYXNlIGZpeCAke3BhdGNofSEiCj4gPiAgICAgICAgICBl
eGl0IDEKPiA+IC0tCj4gPiAyLjQzLjAKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+
IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJP
TiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAg
RGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICsz
MyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAg
XGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8v
KlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS0tLScKCgoKLS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVtYmVkZGVkIExp
bnV4IERldmVsb3BlcgoKZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9ucyBTUkwKClZp
YSBMZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5IDA0MiAy
NDMgNTMxMAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0aW9ucy5j
b20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
