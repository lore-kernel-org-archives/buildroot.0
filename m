Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4272FC5DF71
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 05:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D1BC60B1B;
	Tue,  2 Jun 2026 05:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0eEXElwyqRZ; Tue,  2 Jun 2026 05:55:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 176AF60B1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780379717;
	bh=pcXbkQq5NN0cNcG3bMHCcaSgFANvWTwVvn87J9EUSEs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PUqa2ei7ZNbEPv2yng/LuacGJtDWYdHlDXE8VB91kV++LiwP7H8W3wAXMR1r9fEJB
	 E0JvwNj+FbcIJZYgW00Lz9AfqMkFGwLSlFaW5grGU2T4xFgajWJdAMqYEL/Yd5hV11
	 r0P1HAhB6zhxyDL7yGC4LV4M0Sye1LdLKaA/EjKcoIMYFEBDAIZMn7Ep9/jGWiPN/K
	 KAK4ZPjl6J1mY7Oxgmk5ynpRn20rDLzRcq9h0I7tY1ey2PZvi2t+YTySDzEUvbx4qv
	 kZauxWfmGsXcnyOyobFNcYJKumrrXSgkLnDqGg37eBtrkDwl4/uh9KiAW5ZsX2Clya
	 0t+BsfmUnSC6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 176AF60B1C;
	Tue,  2 Jun 2026 05:55:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41D38F4
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 05:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4307040458
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 05:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GwWej-2283_x for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 05:55:14 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::122b; helo=mail-dl1-x122b.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 721584045C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 721584045C
Received: from mail-dl1-x122b.google.com (mail-dl1-x122b.google.com
 [IPv6:2607:f8b0:4864:20::122b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 721584045C
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 05:55:14 +0000 (UTC)
Received: by mail-dl1-x122b.google.com with SMTP id
 a92af1059eb24-137d464c47eso1657499c88.1
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 22:55:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780379713; cv=none;
 d=google.com; s=arc-20240605;
 b=d53d1RtCEN1y26rxdKxN/6HoTCR+2rKBz+c1TpJl1D3QJXTDQGuPm0PM2+DX4qIuHY
 R+GrqKyGtAWhk1gdxR3L1JvAjYnELwZ0+MeNvFWijymapvfra8wTGYwbOI2LJ+sae9kv
 d9K7/muSOXublpiwfc3HcFcPsXtr8KshsW/4fICRyj/s5tQrOfFt9A6zoDfO38lYoyov
 cume5kcoVQm5EGjU/tXcFMxWlUknZjpDCm+H9g+bmA+0hng71Ns6xTtHdKLqa3+ia8we
 6d+8BoquVB6tATLGWnohUCBhzUiLoOxW4R/6eCWRo+KDWWQltp4NpwSmXiYsJIv+62AR
 m1og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1YdUa7oRtzkH/4fqw9j2I/iq1gQQBWjlCfxzQFeof30=;
 fh=qgmjxlpvcDwG5l7t1/Ln8eCzPUP1F8QFf40LQ2BDmgg=;
 b=Pvf0/pojRFyvUTPOB3che5X1/EhIxrTHAGpHVUnedSk2HZNgGe2I/bv7UTytaCsxBa
 DZiTJM5DpeGXXfXRDhHEWouwdTyyJq/xfOCypc4YUiWl82i1KljPFZHM35kLRg2SvWof
 RY0pd7IxAeqNQ5etd75y5AkDoppZxprG17Ql9vP0Mzidbm46Hr2TWpJxmmh95RrpHSND
 +wjEKmRPTTwOnhlftVkYVXlgFWCrPl3lUIUFOJNwerYAnbaFwqCZYfXxl4T7e1R5FgbP
 L+ivqBmm63HisPjZAenazTRPEtbCpUUJzzVUpw5uyruAaRNKh93HfHUKMgqpG8ECHQpf
 USEQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780379713; x=1780984513;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1YdUa7oRtzkH/4fqw9j2I/iq1gQQBWjlCfxzQFeof30=;
 b=gvS66NyxgN9no+uX894co597xFmW7LZgkHP1qN7eYEgaQMnSNel3tZa0FoQA5E01wC
 aXrbyQztEGZt1K9x+lGvmp75AvlAEx+pZTopMiCYFqmZiXLnoeSPvWUED3tTwD4DWUdn
 vZGYcdoM8sImrAl0aYsT/S1i4TLnQr24q3HGmOjbm90AzJdCPC8od9YGgy+wuxKv9z3w
 53/G4cFhWWGlmjKVl9MvCzBQpigK8t5Zc3cp1KphTQR7nD+uOQlmzrVGlxM0kWQ0g6qf
 4Gy3MVwDOhiSciYgmyjKpprf3BG5qeRiGYGczFOEqtn60wKT7+R8JwFHkocn8nh0wHh+
 +xGQ==
X-Gm-Message-State: AOJu0YycDrDCiqaE8KQaShM4mzUfRnSlcXt/5wlyq+o9crn7nrnv5vp/
 CLErfI5gNovVAcv8o+hm7RO+Au/+WOxevh7SWDAJ0z3ALfJ4EZ4p5maKKJx5POSMYFVAKWtweKS
 UVL37sFmgaOz88vQO4E3VJHI1tlVgE8ri7QwmW9tz5g==
X-Gm-Gg: Acq92OEPiVMkCURzR4or8d1aQnX+2OLpRq8ZZyM4lNbPHXrZ0dO7ppA4lM+1/hJmDPE
 9tGUpnC728SQcJEtCV7SUcKJLxognZzu+1IGN4Q+1dR+DLkE2SKI4hKuJRPG3c+5FHtQn0xlIWg
 ddZqRswOEMaH2GAo5wtS2RexmBzPW9JpyJT0aqhQhQR6BnhCmdYLG7xvffZisMuL+HVhRdZ10fR
 2FZxgW8iNjun74J82AR4vTMQTSiBEli3O00U0p88iolLmhHwY2j9hckoq1gQcG8DP0RoExRZsSo
 rij/RAXCcBpQ9rHesw==
X-Received: by 2002:a05:7022:f9e:b0:12c:15ce:a71b with SMTP id
 a92af1059eb24-137ee342a69mr977483c88.25.1780379713461; Mon, 01 Jun 2026
 22:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260601204735.888967-1-j@j-ernberg.se>
 <20260601204735.888967-7-j@j-ernberg.se>
 <4dedc041-a046-47d6-a21d-eb8d93a7e808@rnout.be>
In-Reply-To: <4dedc041-a046-47d6-a21d-eb8d93a7e808@rnout.be>
From: John Ernberg <j@j-ernberg.se>
Date: Tue, 2 Jun 2026 07:55:02 +0200
X-Gm-Features: AVHnY4K4rqjQ0t7uHROskvWiyrRJzx9qbbQVoj_EdM-4-b1MfpbtwZaAC72EElk
Message-ID: <CAAHg4ZiDLtEcjV1Mhh3cDoN_FdOMrPRX4=D7ja1ADg78xQ8mZA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org, John Ernberg <john.ernberg@actia.se>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1780379713; x=1780984513;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1YdUa7oRtzkH/4fqw9j2I/iq1gQQBWjlCfxzQFeof30=;
 b=bEmxXv8/CTRHbMg6rxt8n1LRdG+eY8G2xMXg2Zw+xkgMFEG7b/Eg50Eu6Z1Qld5c8n
 xB5OktnAnbSXThTxICvTemWr/fCEE6x4p1XQNU1e/LJMj9RcMSpk76jGFJtH86ass2Rt
 FApS/HTfkhLSn8HBGIWtJgqpL32FEnMPnyOEz/ptzO19cc/Lqw6IkQ90ivvW5sqebw3l
 Ow2tm0VkYQXwVZC7rds+4E6qtOaDqQBxYpznOIDSx5HmGdEv7sHc8Xsc2I6HNvT47Cxv
 1YZXfO0WFELet7iCV89fwvG3MD/M+eSJO5mbtPm9e+BRxSrVWfMCR8m5JsyudojSFS/K
 Vr+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=bEmxXv8/
Subject: Re: [Buildroot] [RFC PATCH 6/9] package/util-linux-libs: Do not
 install to target
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gTW9uLCBKdW4gMSwgMjAyNiBhdCAxMToyNeKAr1BNIEFybm91dCBWYW5k
ZWNhcHBlbGxlIDxhcm5vdXRAcm5vdXQuYmU+IHdyb3RlOgo+Cj4KPgo+IE9uIDAxLzA2LzIwMjYg
MjI6NDcsIEpvaG4gRXJuYmVyZyB3cm90ZToKPiA+IHV0aWwtbGludXgtbGlicyB3YXMgaW50cm9k
dWNlZCBhcyBhbiBpbnRlcm1lZGlhdGUgcGFja2FnZSB0byBoZWxwIGJyZWFrCj4gPiBjaXJjdWxh
ciBkZXBlbmRlbmNpZXMgd2l0aCB1dGlsLWxpbnV4LCBhbmQgdGhlcmVmb3Igb25seSBleGlzdHMg
dG8gcHJvdmlkZQo+ID4gbW9yZSBiYXNpYyB2ZXJzaW9ucyBvZiB0aGUgbGlicmFyaWVzIHV0aWwt
bGludXggcHJvdmlkZSwgdG8gYnJlYWsgdGhlc2UKPiA+IGRlcGVuZGVuY3kgY2hhaW5zLgo+ID4K
PiA+IFRoZXJlIGlzIG5vIG5lZWQgdG8gaW5zdGFsbCB0aGVzZSB0byB0YXJnZXQgYXMgdGhleSB3
aWxsIG5ldmVyIGJlIHVzZWQKPiA+IHRoZXJlLgo+ID4KPiA+IFVuZGVyIGFsbCBjaXJjdW1zdGFu
Y2VzIHRoZSBsaWJyYXJpZXMgYXJlIGJ1aWx0IGFuZCBpbnN0YWxsZWQgYnkgdGhlIG1haW4KPiA+
IHV0aWwtbGludXggcGFja2FnZS4KPgo+ICAgRG9lcyB0aGlzIGFjdHVhbGx5IHNvbHZlIHRoZSBj
b25mbGljdD8gSXQgc3RpbGwgZXhpc3RzIGluIHRoZSBzdGFnaW5nICg9aG9zdCkKPiBkaXJlY3Rv
cnksIG5vPwoKSXQgc29sdmVzIHRoZSBjb25mbGljdCBmb3IgdGFyZ2V0LgoKU29sdmluZyBpdCBm
b3Igc3RhZ2luZyBpcyBhIHZlcnkgZGlmZmVyZW50IGJlYXN0IHRoYXQgSSBjdXJyZW50bHkgaGF2
ZQpubyBzb2x1dGlvbiBmb3IuCgpPbmUgaWRlYSBJIGhhZCB3YXMgdG8gbWFrZSB1dGlsLWxpbnV4
LWxpYnMgaXRzIG93biByZWFsIHBhY2thZ2UsIGJ1dApvbmx5IGxpYnV1aWQsCmxpYmJsa2lkIGFu
ZCBsaWJzbWFydGNvbHMsIGhhdmUgYSBzaW5nbGUgc3RhZ2UgYnVpbGQsIHRoZSBvdGhlcgpsaWJy
YXJpZXMgc3VjaCBhcwpsaWJmZGlzaywgbGlibW91bnQsIGV0YyBoYXZlIHRoZSBjaXJjdWxhciBk
ZXBlbmRlbmN5IHRoYXQKdXRpbC1saW51eC1saWJzIGV4aXN0IHRvCmJyZWFrIGJ1aWxkaW5nLXdp
c2UuIFNvIG1ha2luZyB1dGlsLWxpbnV4LWxpYnMgaXRzIG93biBwYWNrYWdlIGRvZXNuJ3QgYWN0
dWFsbHkKYXZvaWQgdGhlIHByb2JsZW0sIGFuZCBzcGxpdHRpbmcgdGhlIHBhY2thZ2UgZnVydGhl
ciBvbmx5IHBhcnRpYWxseQpzb2x2ZXMgaXQgd2hpbGUKbWFraW5nIHV0aWwtbGludXggZXZlbiBo
YXJkZXIgdG8gbWFpbnRhaW4uCgpBbm90aGVyIGlkZWEgd2FzIHRvIGRvIHRoZSBzYW1lIGZvciBz
dGFnaW5nIGFzIEkgYW0gdHJ5aW5nIHRvIGRvIGZvciB0YXJnZXQuCkFuZCB0aGVuIG9ubHkgc3lu
YyB0aGUgZGlyZWN0IGRlcGVuZGVuY2llcyBmb3IgZWFjaCBwYWNrYWdlLiBCdXQgdGhhdCBmYWxs
cwphcGFydCBhbG1vc3QgaW1tZWRpYXRlbHkgYmVjYXVzZSB0aGVyZSBhcmUgc28gbWFueSBsaWJy
YXJpZXMgdGhhdCBoYXZlIGhlYWRlcgpkZXBlbmRlbmNpZXMgb24gdGhlaXIgZGVwZW5kZW5jaWVz
LCBzdWNoIGFzIEMrKyBsaWJyYXJpZXMsIG9yIGFueSBnbGliLWJhc2VkCmhlbHBlciBsaWJyYXJ5
LiBBdCBsZWFzdCBmb3IgQysrIGxpYnJhcmllcyBJIGRvbid0IHRoaW5rIGNhbGxpbmcgdGhlCnJl
c3VsdGluZyBidWlsZApmYWlsdXJlIGEgbWlzc2luZyBkZXBlbmRlbmN5IGlzIHRoZSBjb3JyZWN0
IHdheSB0byBnbyBhYm91dCBpdC4KClRoZSBleGFjdCBzYW1lIGtpbmQgb2YgY29uZmxpY3QgZXhp
c3RzIGluIHRoZSB0b29sY2hhaW4sIGFzIGhlcmUgaW4gdXRpbC1saW51eCwKaWYgeW91IGJ1aWxk
IHRoZSB0b29sY2hhaW4gZnJvbSBzb3VyY2UuCgpCZXN0IHJlZ2FyZHMgLy8gSm9obiBFcm5iZXJn
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
