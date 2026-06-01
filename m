Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47881CD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 21:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0477880742;
	Mon,  1 Jun 2026 21:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZ3qp0sLBJqi; Mon,  1 Jun 2026 21:47:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 048DC807B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780350461;
	bh=KrgdthpcznWFZLq/17KlThU8Yo9QKc9qF4M5M1MuVTI=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=p1OKtMvP+T9JfQQR2QPdPPVeGwvBDUPPfkHCNS9mmEXyMPMJVMOrHxzwoJCYKzQSt
	 IvuGq8mAkqyX14K5o84/6G57p/DpuoDHcd2igTWVN152Fto5rz/bHT/3tZWHcJXZhk
	 s5QQK3K79/fHUr5pQBKIrCQ4Y5IC78Zs2RYfzjDP5th92sL2b6RKU4kbyrlNvb4mi5
	 54zdkyN8jwi69cxQo5sZdTYGkxGTg1CEgTukK6u18H1cKYgQYERNEUdt5lBKjePs5v
	 +nZoqWmkAwVz0reI6pmzLDSlNrfIjTvQeagyWoFY/ao9FL++INpmxyv21a0YaojVjp
	 bK2gLFGdwgTPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 048DC807B1;
	Mon,  1 Jun 2026 21:47:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D63F3D3
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC506605E8
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ktKfSMnyNqW for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 21:47:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 90764605DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90764605DF
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90764605DF
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:47:38 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-490a765d410so20532285e9.1
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 14:47:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780350456; cv=none;
 d=google.com; s=arc-20240605;
 b=WloyMXQR3BRE/hXGwaVnYvQZ6zdVg3zBA1CnCmbxEMU/8gaZsY15L9GCTvfywSilp2
 Cb0V/cQS0SUZfT+Csw1kKok7udy2mlPKWEzjIBuuGxZ2I3EP0nkoPftLoGY/tmzG2PlM
 2VdxIxieb/EseJbFQH6IWAu0kO+qNwLDmW2rz4kAX9xnEU9QeERlcbB3vFvhYUVb6QHM
 p6RIPev9VuJf8AAG3/+qzpFiJ3ZGE1OlrAzc+S5EMLPWF3hxtNC/k3a5OUYB1YDtRNi+
 +1xZTlGImvtW2C5xuR/L+4145TnoAY49/5GtWwW2UhHCQA1yE9e09orRKsosquWFxgYd
 qL6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=zaiQjo9JUgNLWzMIIoySwmvp5LtDbq3B32VUjh1ZtTQ=;
 fh=Iu3XZPUh2GqofpvGihVE9h9LEtijPnaguZ1r2XCVSco=;
 b=Iup9hLEFE/OfBsRWafIOHlT/GS2LkKQ0k33vYekx7XEfx4p+yaBTXX8n1GD3d4B6Qk
 YyWNKjK3wpMpXR8wvLUZpMFHWaFTA6GSda3OeJuElcWvhoaT5v2iNwEaytA8zXKZ6swI
 SaWC9tFqIpm8QQKkgReapnBmJgjrFBu2G3GHrEFJrUcZZjYIMIzXmrlq9qsH2vFHFJ1q
 4U01IeqHwp0gD4zjOKAkBLlgxv97kwseu5MslOCG46PCPWNGzZ3KOwD9aQTAwDuU9ctR
 7ODheR2hlNy9Bh1FUA7x++L0rzcFbMWOUuX4BL8t7T7scyHcVEl9syOlanb9YD6lzS1i
 oNFw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780350456; x=1780955256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zaiQjo9JUgNLWzMIIoySwmvp5LtDbq3B32VUjh1ZtTQ=;
 b=Vo+Y/+L1BvJOa67FQZ9tKpAxmvzJnmHWUx6UEVy41Bo3MGUKbX9ZV9AJQUzNW5pH2q
 Gvyq3456MVGFzOh+KQp0gdaMcotS83vkgIeCG2gawhmjLsmqmRtg9RaXZZdknWhj2jiN
 sjcLbPBo2oUFep0sFN5SH9wU8c+gsIYkK81nu+C7bOP/xVK0blHMtfchLsxWxqpBhjo/
 djO+VTNyogClwTkqPoTdJnohNQMGpJO5NG1Bc0Y4zqp3iOunq0JAEWXOov/yJcbUE9u+
 j2y6KvwtXKlmPRNBQsj6+KamY00fJe5ierS/IcFtTx1TZ/dBCvzTiycrOStXLeDDsMYu
 QwzQ==
X-Gm-Message-State: AOJu0Yxp/TU1rrFFaHGj8ZsyC9hPiSO70gNOxrrd/jaI8xbjMaoAUOlh
 iRGaCDQli9riWXbS5kszNJvJRW7uijy4O67tzvX7x/K5mzWBrSVtoy3jP8NbykRKuqbJ9K5t9se
 yW8YaUVr/405CbnuDmKZgnECp3mDa0uY=
X-Gm-Gg: Acq92OHdf+etymxFd6nncYdrpOFhtzfHofNYx2EDv+VVsrun2W6290dfdCm8Jy55WLm
 6Nsqi3XJUubkmd08r9qsufXCvWfDrHRjlxvHmtczR8shILJj3C/uoAo/11uIsAap1e89WNiTobM
 vwewHlFUZbrRf1IkMDZRbGXI7hXHs3jqCUuXl6tz0p5o8HfIDGjmnnod1okPrv/8XOmMZRx7/wL
 mFRufNYBw81GBNfo9vyATr+K8uZswWmnrSAsW7XXQjHE3LAzy4MNSSiFziTrSYjtZN5D5lRq1vJ
 c1UqSTrbVthmHww6iQ==
X-Received: by 2002:a05:600c:818c:b0:490:81cb:d7a with SMTP id
 5b1f17b1804b1-490a297085emr240241675e9.29.1780350456079; Mon, 01 Jun 2026
 14:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260601204735.888967-1-j@j-ernberg.se>
 <20260601204735.888967-9-j@j-ernberg.se>
In-Reply-To: <20260601204735.888967-9-j@j-ernberg.se>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 1 Jun 2026 14:46:57 -0700
X-Gm-Features: AVHnY4L5f-B2pIXqDia4e_ZyY3WOgUu5FIecbZNwHwqtvX7uVmk3UvH8Y8_xy_Y
Message-ID: <CAMWSM7jDvvMMZitr1sY9Z8ix_N7NaNm0pNiejOL4Y=qf8ranFw@mail.gmail.com>
To: John Ernberg <j@j-ernberg.se>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780350456; x=1780955256; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zaiQjo9JUgNLWzMIIoySwmvp5LtDbq3B32VUjh1ZtTQ=;
 b=AfvYNKFTpV+xPc1LqV0wU05M8QCSYu8X4s73+V4Z4vYeWcneskDXC8i0cJYjaKrF/O
 3YN3seOPuWwk7aMd4eWWpXLXsdX4lMIbtMbL7UgkKMDslDpkrSeJtmzuK60PJubLhSGK
 Qb4l0xv5I8qz9n+JItjG3K+6nWHCiIABXIV5zjLBSGNq+gS9So2jo1uo/tD5wY/cMO5C
 bf9QcS152oYSN5SnaxOk4V7d6/2VdIDh+w1+Zb18OPuPY+kLtCU8k39NIFL2PbWik6hc
 VkYgUGjck/V2i2v1UhGRl2L5gvi63cEgDC3YhGCxV6+RaDbCrbPDTewkjWPVrEhkhdkk
 RvnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=AfvYNKFT
Subject: Re: [Buildroot] [RFC PATCH 8/9] package/python-xlib: Drop the
 package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 John Ernberg <john.ernberg@actia.se>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBNb24sIEp1biAxLCAyMDI2IGF0IDE6NDjigK9QTSBKb2huIEVybmJlcmcgPGpA
ai1lcm5iZXJnLnNlPiB3cm90ZToKPgo+IFVwc3RyZWFtIGhhcyBub3Qgc2VlbiBhbnkgYWN0aXZl
IHdvcmsgc2luY2UgbGF0ZSAyMDIyLiBbMV0KPiBUaGVyZSB3YXMgYW4gYXR0ZW1wdCBhdCBmaW5k
aW5nIGEgbmV3IG1haW50YWluZXIgaW4gMjAyNCwgd2hpY2ggZGlkbid0Cj4gbGVhZCBhbnl3aGVy
ZS4gWzJdCj4KPiBUaGUgcGFja2FnZSB3aWxsIG5vIGxvbmdlciBidWlsZCB3aXRoIHNldHVwdG9v
bHMgPj0gODIuIFszXQo+Cj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi14bGliL3B5
dGhvbi14bGliL2NvbW1pdHMvbWFzdGVyLyBbMV0KPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20v
cHl0aG9uLXhsaWIvcHl0aG9uLXhsaWIvZGlzY3Vzc2lvbnMvMjczIFsyXQo+IExpbms6IGh0dHBz
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8zM2VmMjg1OWM0OGY3ODU1MmRkNGE3
ZDUzYjEzOTU1ZDNkOWIwNWQzLyBbM10KPiBDYzogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxp
YXJkMUBnbWFpbC5jb20+Cj4gQ2M6IEpvc2VwaCBLb2d1dCA8am9zZXBoLmtvZ3V0QGdtYWlsLmNv
bT4KPiBDYzogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IEpvaG4gRXJuYmVyZyA8akBqLWVybmJlcmcuc2U+Cj4gLS0tCj4gIENvbmZp
Zy5pbi5sZWdhY3kgICAgICAgICAgICAgICAgICAgICB8ICA3ICsrKysrKysKPiAgREVWRUxPUEVS
UyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQo+ICBwYWNrYWdlL0NvbmZpZy5pbiAg
ICAgICAgICAgICAgICAgICAgfCAgMSAtCj4gIHBhY2thZ2UvcHl0aG9uLXhsaWIvQ29uZmlnLmlu
ICAgICAgICB8ICA3IC0tLS0tLS0KPiAgcGFja2FnZS9weXRob24teGxpYi9weXRob24teGxpYi5o
YXNoIHwgIDUgLS0tLS0KPiAgcGFja2FnZS9weXRob24teGxpYi9weXRob24teGxpYi5tayAgIHwg
MTQgLS0tLS0tLS0tLS0tLS0KPiAgNiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDI4
IGRlbGV0aW9ucygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24teGxpYi9D
b25maWcuaW4KPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLXhsaWIvcHl0aG9u
LXhsaWIuaGFzaAo+ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24teGxpYi9weXRo
b24teGxpYi5tawo+Cj4gZGlmZiAtLWdpdCBhL0NvbmZpZy5pbi5sZWdhY3kgYi9Db25maWcuaW4u
bGVnYWN5Cj4gaW5kZXggN2ZkYjAxNGMwYi4uZjc0ZWU4NWJhOCAxMDA2NDQKPiAtLS0gYS9Db25m
aWcuaW4ubGVnYWN5Cj4gKysrIGIvQ29uZmlnLmluLmxlZ2FjeQo+IEBAIC0xNDYsNiArMTQ2LDEz
IEBAIGVuZGlmCj4KPiAgY29tbWVudCAiTGVnYWN5IG9wdGlvbnMgcmVtb3ZlZCBpbiAyMDI2Lnh4
Igo+Cj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fWExJQgo+ICsgICAgICAgYm9vbCAicHl0
aG9uLXhsaWIgcmVtb3ZlZCIKPiArICAgICAgIHNlbGVjdCBCUjJfTEVHQUNZCj4gKyAgICAgICBo
ZWxwCj4gKyAgICAgICAgIFVwc3RyZWFtIGlzIG5vIGxvbmdlciBtYWludGFpbmVkLCBhbmQgdGhl
IHBhY2thZ2UgZG9lcyBub3QKPiArICAgICAgICAgYnVpbGQgd2l0aCBzZXR1cHRvb2xzID49IDgy
Lgo+ICsKPiAgY29uZmlnIEJSMl9QQUNLQUdFX0pBSUxIT1VTRV9IRUxQRVJfU0NSSVBUUwo+ICAg
ICAgICAgYm9vbCAiamFpbGhvdXNlIGhlbHBlciBzY3JpcHRzIHJlbW92ZWQiCj4gICAgICAgICBz
ZWxlY3QgQlIyX1BBQ0tBR0VfSkFJTEhPVVNFCj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9E
RVZFTE9QRVJTCj4gaW5kZXggMDMwOGQxZWY0MS4uMjY5MmNmYmRlZiAxMDA2NDQKPiAtLS0gYS9E
RVZFTE9QRVJTCj4gKysrIGIvREVWRUxPUEVSUwo+IEBAIC0xNzUwLDcgKzE3NTAsNiBAQCBGOiAg
ICAgICAgcGFja2FnZS9weXRob24tcmF2ZW4vCj4gIEY6ICAgICBwYWNrYWdlL3B5dGhvbi1zY2hl
ZHVsZS8KPiAgRjogICAgIHBhY2thZ2UvcHl0aG9uLXNlbnRyeS1zZGsvCj4gIEY6ICAgICBwYWNr
YWdlL3B5dGhvbi13ZWJzb2NrZXRzLwo+IC1GOiAgICAgcGFja2FnZS9weXRob24teGxpYi8KPiAg
RjogICAgIHBhY2thZ2Uvc2VudHJ5LWNsaS8KPiAgRjogICAgIHBhY2thZ2Uvc2VudHJ5LW5hdGl2
ZS8KPiAgRjogICAgIHBhY2thZ2UvdW5jbHV0dGVyLXhmaXhlcy8KPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgo+IGluZGV4IGI2OTc4MmVjNmIuLjQ2
OWFmZDc1MWYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdl
L0NvbmZpZy5pbgo+IEBAIC0xNTEyLDcgKzE1MTIsNiBAQCBtZW51ICJFeHRlcm5hbCBweXRob24g
bW9kdWxlcyIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24td3NhY2NlbC9Db25maWcu
aW4iCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXdzcHJvdG8vQ29uZmlnLmluIgo+
ICAgICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi13dGZvcm1zL0NvbmZpZy5pbiIKPiAtICAg
ICAgIHNvdXJjZSAicGFja2FnZS9weXRob24teGxpYi9Db25maWcuaW4iCj4gICAgICAgICBzb3Vy
Y2UgInBhY2thZ2UvcHl0aG9uLXhscmQvQ29uZmlnLmluIgo+ICAgICAgICAgc291cmNlICJwYWNr
YWdlL3B5dGhvbi14bHN4d3JpdGVyL0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2Fn
ZS9weXRob24teGx1dGlscy9Db25maWcuaW4iCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9u
LXhsaWIvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24teGxpYi9Db25maWcuaW4KPiBkZWxldGVk
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwODFhZjZhMmZjLi4wMDAwMDAwMDAwCj4gLS0tIGEv
cGFja2FnZS9weXRob24teGxpYi9Db25maWcuaW4KPiArKysgL2Rldi9udWxsCj4gQEAgLTEsNyAr
MCwwIEBACj4gLWNvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fWExJQgo+IC0gICAgICAgYm9vbCAi
cHl0aG9uLXhsaWIiCj4gLSAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1NJWCAjIHJ1
bnRpbWUKPiAtICAgICAgIGhlbHAKPiAtICAgICAgICAgWExpYiBpbiBwdXJlIFB5dGhvbiAoUHky
L1B5MyBjb21wYXRpYmxlKQo+IC0KPiAtICAgICAgICAgaHR0cHM6Ly9naXRodWIuY29tL3B5dGhv
bi14bGliL3B5dGhvbi14bGliCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXhsaWIvcHl0
aG9uLXhsaWIuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLXhsaWIvcHl0aG9uLXhsaWIuaGFzaAo+IGRl
bGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IGY1MTZkN2I0YzQuLjAwMDAwMDAwMDAKPiAt
LS0gYS9wYWNrYWdlL3B5dGhvbi14bGliL3B5dGhvbi14bGliLmhhc2gKPiArKysgL2Rldi9udWxs
Cj4gQEAgLTEsNSArMCwwIEBACj4gLSMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3Jn
L3B5cGkvcHl0aG9uLXhsaWIvanNvbgo+IC1tZDUgIDIwYTY4N2FjODRlZTYzMmFlYTliOTg2MTIw
NmFhMGViICBweXRob24teGxpYi0wLjMzLnRhci5nego+IC1zaGEyNTYgIDU1YWY3OTA2YTJjNzVj
ZTZjYjI4MGE1ODQ3NzYwODA2MDI0NDRmNzU4MTVhN2FmZjRkMjg3YmIyZDcwMThiMzIgIHB5dGhv
bi14bGliLTAuMzMudGFyLmd6Cj4gLSMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1z
Cj4gLXNoYTI1NiAgM2JiNmY2YmVjOTRiOTllMjkyN2E4ODgwYmY0OWM0MDFmNWU4ZjQ4YTIwZGRl
YTk2MzEwODYwMjY0Y2FlMjBiMCAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhv
bi14bGliL3B5dGhvbi14bGliLm1rIGIvcGFja2FnZS9weXRob24teGxpYi9weXRob24teGxpYi5t
awo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDIzYzdiMzk5NzQuLjAwMDAwMDAw
MDAKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi14bGliL3B5dGhvbi14bGliLm1rCj4gKysrIC9kZXYv
bnVsbAo+IEBAIC0xLDE0ICswLDAgQEAKPiAtIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAtIwo+
IC0jIHB5dGhvbi14bGliCj4gLSMKPiAtIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAtCj4gLVBZ
VEhPTl9YTElCX1ZFUlNJT04gPSAwLjMzCj4gLVBZVEhPTl9YTElCX1NJVEUgPSBodHRwczovL2Zp
bGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvODYvZjUvOGMwNjUzZTViYjU0ZTBjYmRmZTI3
YmYzMmQ0MWYyN2JjNGUxMmZhYTg3NDI3NzhjMTdmMmE3MWJlMmMwCj4gLVBZVEhPTl9YTElCX1NF
VFVQX1RZUEUgPSBzZXR1cHRvb2xzCj4gLVBZVEhPTl9YTElCX0xJQ0VOU0UgPSBMR1BMLTIuMSsK
PiAtUFlUSE9OX1hMSUJfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiAtUFlUSE9OX1hMSUJfREVQ
RU5ERU5DSUVTID0gaG9zdC1weXRob24tc2V0dXB0b29scy1zY20KPiAtCj4gLSQoZXZhbCAkKHB5
dGhvbi1wYWNrYWdlKSkKPiAtLQo+IDIuNTMuMAo+CgpSZXZpZXdlZC1ieTogSm9zZXBoIEtvZ3V0
IDxqb3NlcGgua29ndXRAZ21haWwuY29tPgoKQmVzdCwKSm9zZXBoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
