Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14886C5AD4E
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 17:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1746E80D3C;
	Sun,  9 Aug 2026 17:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZyMd6UO4YLwc; Sun,  9 Aug 2026 17:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 096B680CC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786297489;
	bh=HYUBxALlS8bd8xfUO+iCaTsIRNw+XFby0HEwuV53z0k=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YgC75gPznt1yd6nyThoHDQvSFzKmRUVAKc0CWuz+5lPtT33exv0CijOfQ53SWfHsz
	 d42bhM8BLIat4WoYGeJNO7BlsUE770dS3zm/3JyoLuQYriOvOTT6MsX14A1EcUYCSG
	 u9Du9wMw0/d5oJ4JMroPyqdlW9rrRGqW8bUKQrkLl/2eMGfmvOizN7yxxEfbnP80JP
	 c6EGLrUZr7igasWyGVyiL7+RPTVikInwlcxkXWeNjTU2Kr24etPZiYI4cTatDnkMq9
	 O91f3A+rSbVFk5lZYH83xZI9rFX3vbFrLM/RwvFXJkODqkHBDTJLKeK3XGc3G+gqH+
	 1wuio13de9BLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 096B680CC3;
	Sun,  9 Aug 2026 17:44:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A80C40A
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 17:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70CEB4004B
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 17:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKkHd9zticz6 for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 17:44:45 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 92C6340026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92C6340026
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92C6340026
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 17:44:43 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-38dfe910e9dso1117403a91.3
 for <buildroot@buildroot.org>; Sun, 09 Aug 2026 10:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786297483; cv=none;
 d=google.com; s=arc-20260327;
 b=d3IB9arqYfJl1xqu9Bq04QLFQTtULYoNFSVGU7FdFHEaM8JzTotXhhjjjoFl4qgYso
 eOV1Qc3hTQb0+xQQEpEZ4Y5vEN1ynnpEQrpA1jJEUpGgtgZbVP8vsZUV1tJVeDuLrLuO
 PggvFVksavYTJL6Ir+v1rK4ocet3vEJYZm3kIHuwx7fnZOXWxlhD8nUHUBsG8iAVKvoE
 vWygxiU4FthsGlk8N9QH7eVs+EgB9Pq8RyiprM7bwChAG83LBFdCq3rF1Hn+TdTIhzke
 HBRA+tCL5IO3aphfJlrcweFLJ+wDEpeod/1RvrQ/11XEaVU7JGN7VgPCsBoGWPb24ONz
 kA1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=8hGCDf2PsBdnrktZI+yyT7bwtWQWfqNLW0L7YrDrfxg=;
 fh=GJIYKAxGu+j1ubKhbaDgs0nkVYK43SKlCYTnngGfoDs=;
 b=IGEQVuGPFy++oty7JdpedVa9B48l66UDOYaOEj+B35fYdTNBUyu8WJkzSvy5beV8OE
 RLh8AkqHnsqWyFnN24NRPoYsWlpJW/cNNxHkLI8hHrSEWNJYiiMx7wnH01Ww3i7KlxXG
 OrX1k7T0YL3kO5bUxeHVZW7RT6Ula4g+fF/RwQpBkxkWdp7Mo1N6GCMYb3BQxZtpo7PS
 xbPc4pW+cOeehgwAO9rmB/C/dLcV5U08618ECzqRJ/GwviiH0mHTPkJuEjATBkY3jyfB
 WSVpGsUhyiAhpuvrM+P7VPW1lYNOTi3AbOIeiR15c8OzJRV9fgxwfXaAhxfDp16R0d4A
 ffRA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786297483; x=1786902283;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8hGCDf2PsBdnrktZI+yyT7bwtWQWfqNLW0L7YrDrfxg=;
 b=NbKuyOrR8kqdLGYvoIQxvf6+ZRBqVbHr724021Hbwk4D6HL/4mUJOXJJzZqjkOsyzE
 oU5vDK2J3NQxyH7AQY356TTDYqVyEeBestzxsarU0yE3iRWZUBxtXOUp8tdlFJtVM+Wq
 R/FiRQRFCztrRNmCSfLjP1PhBWjYifr+gSaguwd1Ug9NIZYg/Zn7OkUOm151MauwzznV
 /pP6jX4kqnhZxxW5vvdAxko/SU9jMo9J5E0tS9d4Y2moDLISUUN20rx7hYhAnwUJVOSw
 2Wd/xPcCv929vsVyHTyWUhBngh2Rglkbd7pCFYrKtE40U4GGxUdPeyhcGCoje/koGqrQ
 dKdw==
X-Gm-Message-State: AOJu0YyeAn1sn27cpeMG8OCMg/B/RbfzOEL9rW8/6E/MiOzep3g+fvYF
 lVwNoVQ13W3FFP0qtvh3D1pT0PvgjuuyaYNqBWQlvDueVpqKIOXAhQpRfiVB+KiUNz/ZAJ7LPHG
 3u9RBmFJSUxYSw9Fj62towMsPJ0wJT2Q6pE2i1VoPBg==
X-Gm-Gg: AR+sD115RTrcEYQ6dy1jWwiB48ZvMXQ2YNSQiP2U0uTfD8IpslmAw7vFusKTmzDXaVI
 6YavWYYGHQFZh8VQ2hHPJ/dQjLS5mHFq+1dceLpYqCR2fPi/42MvQGsrgVafmF0V0HoBQSGnSGk
 x0u6CssU+RrDcspXIAwBd40viWNjvoGKcrg88wc1xtTvT/0cTWhL4SqHn6hs1i1+4u40qFuu7UT
 q9cFLK6p/JBYzTWZZaaBRwNHMQJlIvmzWdCJgxG8Zyw3ZyBCVdieomQk9Vxhovb0KOy+WDmKZxg
 Vq7/MQp7wECpjXvBBPccNFe9bezTpjREVAjIM7h0OJvtKspSa8Ata56FJ+WYcHE1/fbr/dfh3L7
 bwjaQJp2Tj32VCopQNAhEK+9kGgikAaGtr6sELvQtGg==
X-Received: by 2002:a17:90a:da83:b0:38e:500:3975 with SMTP id
 98e67ed59e1d1-3903c5d82a3mr36038648a91.18.1786297483272; Sun, 09 Aug 2026
 10:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260803140815.617446-1-aford173@gmail.com>
In-Reply-To: <20260803140815.617446-1-aford173@gmail.com>
From: John Ernberg <j@j-ernberg.se>
Date: Sun, 9 Aug 2026 19:44:32 +0200
X-Gm-Features: AUfX_mx2JLGDAJ-7xBIhFRSqRuwfn_ghQ_Uj88l1NZmxoaSJ2sxUqslFVF3nMwA
Message-ID: <CAAHg4ZjzukzO4RMSkgjkzORsV5zS05mjq-En03ny8mpxUbsgeQ@mail.gmail.com>
To: Adam Ford <aford173@gmail.com>
Cc: buildroot@buildroot.org, Raphael Pavlidis <raphael.pavlidis@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1786297483; x=1786902283;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=8hGCDf2PsBdnrktZI+yyT7bwtWQWfqNLW0L7YrDrfxg=;
 b=EqTPf3kZ8JJrVu9qINotAdK8ATq9B6NguoHm6mHD5j5Fo38BilsmbR1WmqFAWZf+Gl
 I0n9zFY0Ds00x99OGFfRAMq9AaQJBSui/R+grUcXjiZJN+NlOJRCzwuwxvZDDuIixUo6
 2L/BG1QYhsCGJ4W4aI3WlcuBpAQV84OBHKzuUmygoyIvFZgfX+rdFEthgsUYHrcEMmgx
 RF283/kQkKdDe3TOnQx7+9P50FAVJ0vruIq1kw65iTPd81hzzU3MFw+q8iC5lCfyl6Jd
 FRmFKelrjxpdMU/j6TUT3Iufx7GCAC84rRV7EAAULVLcLW2VL3QbWm/Q62vPvRmvz9mj
 h2cg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=EqTPf3kZ
Subject: Re: [Buildroot] [PATCH V2] package/x11r7/xwayland: fix glamor DRI
 ordering dependency on mesa3d
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

SGkgQWRhbSwKCkFwb2xvZ2llcyBmb3IgdGhlIGRlbGF5LgoKT24gTW9uLCBBdWcgMywgMjAyNiBh
dCA0OjA44oCvUE0gQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gWHdh
eWxhbmQncyBnbGFtb3Igc3VwcG9ydCBlbmFibGVzIGEgRFJJIGNvbmZpZ3VyZSBjaGVjayB0aGF0
IGxvb2tzIGZvcgo+IE1lc2EncyBkcmkucGMgaW4gc3RhZ2luZy4gV2l0aG91dCBhbiBleHBsaWNp
dCBvcmRlcmluZyBkZXBlbmRlbmN5LCBhCj4gaGlnaGx5IHBhcmFsbGVsIGJ1aWxkIGNhbiBydW4g
WHdheWxhbmQncyBjb25maWd1cmUgYmVmb3JlIG1lc2EzZCBpcwo+IGluc3RhbGxlZCwgZmFpbGlu
ZyB3aXRoOgo+Cj4gICAgIEVSUk9SOiBEZXBlbmRlbmN5ICJkcmkiIG5vdCBmb3VuZAo+Cj4gU2lu
Y2UgbWVzYTNkIGlzIHdoYXQgcHJvdmlkZXMgdGhlIERSSS9FR0wvR0JNIGJpdHMgZ2xhbW9yIHJl
bGllcyBvbiwgZm9sZAo+IGl0IGludG8gdGhlIGdsYW1vciBjb25kaXRpb246IG9ubHkgZW5hYmxl
IC1EZ2xhbW9yPXRydWUgYW5kIGFkZCBpdCB0byB0aGUKPiBkZXBlbmRlbmNpZXMgYWxvbmdzaWRl
IGxpYmVwb3h5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5j
b20+Cj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS94MTFyNy94d2F5bGFuZC94d2F5bGFuZC5tayBi
L3BhY2thZ2UveDExcjcveHdheWxhbmQveHdheWxhbmQubWsKPiBpbmRleCAwMmEyMWI5NmMxLi4z
YmQ4N2E0NTUyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UveDExcjcveHdheWxhbmQveHdheWxhbmQu
bWsKPiArKysgYi9wYWNrYWdlL3gxMXI3L3h3YXlsYW5kL3h3YXlsYW5kLm1rCj4gQEAgLTMyLDcg
KzMyLDcgQEAgWFdBWUxBTkRfQ09ORl9PUFRTID0gXAo+Cj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0Vf
SEFTX0xJQkVHTCkkKEJSMl9QQUNLQUdFX0xJQkVQT1hZKSx5eSkKPiAgWFdBWUxBTkRfQ09ORl9P
UFRTICs9IC1EZ2xhbW9yPXRydWUKPiAtWFdBWUxBTkRfREVQRU5ERU5DSUVTICs9IGxpYmVwb3h5
Cj4gK1hXQVlMQU5EX0RFUEVOREVOQ0lFUyArPSBsaWJlcG94eSBtZXNhM2QKPiAgZWxzZQo+ICBY
V0FZTEFORF9DT05GX09QVFMgKz0gLURnbGFtb3I9ZmFsc2UKPiAgZW5kaWYKPiAtLQo+IDIuNTMu
MAo+CgpkcmkgaXMgbmVlZGVkIGJ5IGdseCwgbm90IGdsYW1vciwgd2hlbiBjaGVja2luZyB0aGUg
Y29kZS4gRGlkIHlvdSB0ZXN0CmJ1aWxkIHRoaXM/CgooaXQncyBlYXNpZXIgdG8gcmVwcm9kdWNl
IHdpdGggYSBwZXItcGFja2FnZSBidWlsZCB3aGVyZSB0aGlzIGJlY29tZXMKYSBwZXJzaXN0ZW50
IGZhaWx1cmUgcmF0aGVyIHRoYW4gcmFuZG9tKQoKSXQgc2hvdWxkIGdvIHRvIHRoZSBMSUJHTCBj
aGVjayByYXRoZXIgdGhhbiB0aGUgTElCKkUqR0wgY2hlY2suIEJ1dCBhcwpJIG1lbnRpb25lZCBv
biB2MSwgeW91IHByb2JhYmx5IG5lZWQgdG8gY2hlY2sgaG93IHRoaXMgd29ya3Mgd2hlbgpudmlk
aWEtZHJpdmVyIGlzIHRoZSBMSUJHTCBwcm92aWRlci4KCkJlc3QgcmVnYXJkcyAvLyBKb2huIEVy
bmJlcmcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
