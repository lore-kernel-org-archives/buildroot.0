Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F7EC25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 11:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E8F681A3E;
	Wed, 22 May 2024 11:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yREuKM5snZfd; Wed, 22 May 2024 11:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C04A3820B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C04A3820B6;
	Wed, 22 May 2024 11:47:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 646A81C5AB6
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 11:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 517F960688
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 11:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_G3wIYiMVGS for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 11:47:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BD0E4606AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD0E4606AF
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD0E4606AF
 for <buildroot@buildroot.org>; Wed, 22 May 2024 11:47:06 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2e3fa13f018so62475731fa.3
 for <buildroot@buildroot.org>; Wed, 22 May 2024 04:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716378424; x=1716983224;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kcoftJ+rWTpn5fp9bGUNoe/hkU5O63aTuCu+dTmlrLE=;
 b=QxE54bl8UuFkddRQ5xZlprCNWWQ8lyYgakuCULBcM66cWwBva4WPFVrwJ/kaKhG0Fr
 Z1Pts0TioVcZKcYrHN/lP0aiJOFc+56B73GZq8SKpGkwYTllhx/67x+tblwByDK42g8E
 13yty9gQXb32J8QdYrjJ1urBXt2L3dYDL3q3bP/Fs0w0aO/OO3e8FgZu4zJbVrFOQ7Yj
 TKyLfB/+cSmiSYuGWt7y1sP15NZ2AlJ+zsiCQxlfBUI7YKrH5gZfh3vTETrOTLWH8AOI
 AiPXUdI+eY+wHWqrxbVwj07QBv7GwWqXVw9CNinLwA+/tGDqDEv85XqRGK64kgOflJBR
 UUCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe2aLyXtiUoMPRgv9e58dojMuNUHbEiTkPHTlkO8x564mXQDCqyg8Ra9bfkAfVlO09acNCKBfsztvC2ozoyLgkh7Ho26QmdQ==
X-Gm-Message-State: AOJu0YzEcYhl8yS464LY9SjstFKIDMeBLTFzt8GNwPmf4ork1CMCEg7D
 0abKYVaWojbPJ0nV+DCrcuUFNUEaohKvN9oy0301kTxu8LHNxJv0LGfWtSZnX5ZOLSWpVvtVApc
 B
X-Google-Smtp-Source: AGHT+IEZj2tAn4Ng+GqLXoqfbsHeo1MNuHS/s6/u4RZ0qJ6PcqMlE5kTujzLgKFxE1OqwXEuJwWnig==
X-Received: by 2002:a2e:99c6:0:b0:2e5:64db:b2d8 with SMTP id
 38308e7fff4ca-2e94959cd9bmr12088921fa.40.1716378423868; 
 Wed, 22 May 2024 04:47:03 -0700 (PDT)
Received: from [10.5.0.27] (202-122-190-109.dsl.ovh.fr. [109.190.122.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42013bf1a5dsm395093565e9.30.2024.05.22.04.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 04:47:02 -0700 (PDT)
Message-ID: <8649f929-f798-4ad0-87b8-e1a54751d661@smile.fr>
Date: Wed, 22 May 2024 13:47:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>
References: <20240514154250.1453970-1-james.hilliard1@gmail.com>
 <4e9d5bc99a30a885dddb8aba6145f56d@free.fr>
 <888f8476-9bc2-409d-a35d-bb93282627d0@smile.fr>
 <CADvTj4qoj-quT8q14taAspqmhA1bRL-uWkEOEmg2B50Zn25qsA@mail.gmail.com>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CADvTj4qoj-quT8q14taAspqmhA1bRL-uWkEOEmg2B50Zn25qsA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1716378424; x=1716983224;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kcoftJ+rWTpn5fp9bGUNoe/hkU5O63aTuCu+dTmlrLE=;
 b=QDpeIabDaeZCO7nGG9Ym3rh/BxEShxcRMxb9SifssUJP9GqZRlobLOByN0FrN/xeM2
 ri6iKMXhD19F1bzhGl40VQ022gqvj9brvh12OnMW4zj7aR4u+fjcjvknOIjJXToJ1nVs
 l7e+IKfMk1LtXLif8NIn1IZ7soLcxfGoxvM0jy9mJhj+VEoFhWkoFs+pzs8edbGwoRBs
 925Npowb4hLWXfDbEQt5zQTwYwniNpI9McZHGVCr9abJcNxKTF9mZinYJE1QkE6RLkJb
 Rv/hPplzzIR32W5ERr0qtAAmc/XYiH5XvRJn+zqAqlzP1o2YfOhlZ3n4ZJcoFl0rnceh
 sUAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=QDpeIabD
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ml-dtypes: skip
 dependency check
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
Cc: Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsCgpMZSAxNS8wNS8yMDI0IMOgIDE3OjEwLCBKYW1lcyBIaWxsaWFyZCBhIMOp
Y3JpdMKgOgo+IE9uIFdlZCwgTWF5IDE1LCAyMDI0IGF0IDg6MDHigK9BTSBSb21haW4gTmFvdXIg
PHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6Cj4+Cj4+IEhlbGxvIEphbWVzLCBKdWxpZW4s
IEFsbCwKPj4KPj4gTGUgMTQvMDUvMjAyNCDDoCAxOToyNiwgSnVsaWVuIE9saXZhaW4gYSDDqWNy
aXQgOgo+Pj4gSGkgSmFtZXMsCj4+Pgo+Pj4gVGhhbmtzIGZvciB0aGUgcGF0Y2ghCj4+Pgo+Pj4g
SSBzdWNjZXNzZnVsbHkgdGVzdGVkIGl0IG9uIGJyYW5jaCBtYXN0ZXIgYXQgY29tbWl0IDk3NjQy
NTggd2l0aCBjb21tYW5kOgo+Pj4KPj4+ICAgICBzdXBwb3J0L3Rlc3RpbmcvcnVuLXRlc3RzIFwK
Pj4+ICAgICAgICAgLWQgZGwgLW8gb3V0cHV0X2ZvbGRlciBcCj4+PiAgICAgICAgIHRlc3RzLnBh
Y2thZ2UudGVzdF9weXRob25fbWxfZHR5cGVzCj4+Pgo+Pj4gT24gMTQvMDUvMjAyNCAxNzo0Miwg
SmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4+Pj4gVGhpcyBwYWNrYWdlIHBpbnMgb3Zlcmx5IHN0cmlj
dCBudW1weSBkZXBlbmRlbmN5IHZlcnNpb25zIGFwcGFyZW50bHkKPj4+PiBmb3IgY29tcGF0aWJp
bGl0eSByZWFzb25zIHRoYXQgZG9uJ3QgYXBwZWFyIHJlbGV2YW50IHRvIGJ1aWxkcm9vdC4KPj4+
Pgo+Pj4+IFRoaXMgcGFja2FnZSBhbHNvIGFwcGVhcnMgdG8gcGluIGFuIG92ZXJseSBzdHJpY3Qg
c2V0dXB0b29scyB2ZXJzaW9uCj4+Pj4gZm9yIHVuY2xlYXIgcmVhc29ucy4KPj4KPj4gSSBsb29r
ZWQgYXQgdGhpcyBpc3N1ZSBsYXN0IHdlZWsgd2l0aCB0aGUgc2FtZSBjb25jbHVzaW9ucy4uLgo+
PiBJIHdhcyBhYmxlIHRvIGZpeCB0aGUgc2V0dXB0b29scyB2ZXJzaW9uIGNoZWNrIGJ1dCBpdCB3
YXMgc2lsbCBmYWlsaW5nIHdpdGgKPj4gbnVtcHkgY2hlY2sgKGl0IHNlZW1zIG51bXB5IGRlcGVu
ZGVuY3kgaXMgbmV2ZXIgZm91bmQgd2hpbGUgY3Jvc3MtY29tcGlsaW5nKS4KPj4KPj4+Pgo+Pj4+
IFNlZToKPj4+PiBodHRwczovL2dpdGh1Yi5jb20vamF4LW1sL21sX2R0eXBlcy9ibG9iL3YwLjMu
Mi9weXByb2plY3QudG9tbCNMNTEtTDU1Cj4+Pj4KPj4+PiBUbyBmaXggdGhpcyBsZXRzIGp1c3Qg
c2V0IHRoZSAtLXNraXAtZGVwZW5kZW5jeS1jaGVjayBidWlsZCBvcHRpb24gYW5kCj4+Pj4gaWdu
b3JlIHRoZSBidWlsZCBkZXBlbmRlbmN5IHZlcnNpb24gbWlzbWF0Y2hlcyBzaW5jZSB0aGV5IGRv
bid0IGFwcGVhcgo+Pj4+IHRvIGNhdXNlIGFueSBidWlsZCBpc3N1ZXMuCj4+Cj4+IE1heWJlIHdl
IHNob3VsZCBhdm9pZCB1c2luZyAtLXNraXAtZGVwZW5kZW5jeS1jaGVjayBvcHRpb24gdG9vIGVh
c2lseS4gV2UgY291bGQKPj4gbWlzcyBhbnkgbmV3IGRlcGVuZGVuY3kgdXNlZCBieSBmdXJ0aGVy
IHJlbGVhc2U/Cj4gCj4gWWVhaCwgd2Ugc2hvdWxkbid0IHVzZSBpdCB1bmxlc3Mgd2UgaGF2ZSBh
IGdvb2QgcmVhc29uIGZvciBpdCwgSSB0aGluayB0aGlzCj4gcXVhbGlmaWVzLgoKRmFpciBlbm91
Z2guCgo+IAo+Pgo+Pj4+Cj4+Pj4gVGhpcyBlcnJvciB3YXMgaW50cm9kdWNlZCB3aGVuIHdlIG1p
Z3JhdGVkIHNldHVwdG9vbHMgdG8gcGVwNTE3IGluCj4+Pj4gODkzN2RiOGRkNTk1ZTA5ODg3NTFl
NWRiYjU2OGU4NzBiMDdiMzljYy4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxp
YXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+Pj4KPj4+IFRlc3RlZC1ieTogSnVsaWVu
IE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPj4+Cj4+Pj4gLS0tCj4+Pj4gIHBhY2thZ2UvcHl0aG9u
LW1sLWR0eXBlcy9weXRob24tbWwtZHR5cGVzLm1rIHwgMSArCj4+Pj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLW1s
LWR0eXBlcy9weXRob24tbWwtZHR5cGVzLm1rCj4+Pj4gYi9wYWNrYWdlL3B5dGhvbi1tbC1kdHlw
ZXMvcHl0aG9uLW1sLWR0eXBlcy5tawo+Pj4+IGluZGV4IDY3NjEzN2VjZjEuLjgwOTcyNjUwNzgg
MTAwNjQ0Cj4+Pj4gLS0tIGEvcGFja2FnZS9weXRob24tbWwtZHR5cGVzL3B5dGhvbi1tbC1kdHlw
ZXMubWsKPj4+PiArKysgYi9wYWNrYWdlL3B5dGhvbi1tbC1kdHlwZXMvcHl0aG9uLW1sLWR0eXBl
cy5tawo+Pj4+IEBAIC0xMCw2ICsxMCw3IEBAIFBZVEhPTl9NTF9EVFlQRVNfU0lURSA9Cj4+Pj4g
aHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzM5LzdkLzhkODVmY2JhODYK
Pj4+PiAgUFlUSE9OX01MX0RUWVBFU19MSUNFTlNFID0gQXBhY2hlLTIuMAo+Pj4+ICBQWVRIT05f
TUxfRFRZUEVTX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4+Pj4gIFBZVEhPTl9NTF9EVFlQRVNf
U0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPj4KPj4gV2UgY291bGQgYWRkIGEgY29tbWVudCBoZXJl
IHRvIGV4cGxhaW4gd2h5IHdlIHNraXAtZGVwZW5kZW5jeS1jaGVjayBoZXJlLgo+IAo+IFdlbGwg
d2UgaGF2ZW4ndCByZWFsbHkgYmVlbiBkb2luZyB0aGF0IG9uIG90aGVyIHBhY2thZ2VzIHVzaW5n
IHRoaXMgZmxhZywgYW5kCj4gcGFja2FnZXMgc3BlY2lmeWluZyBvdmVybHkgc3RyaWN0L3VubmVj
ZXNzYXJ5IGJ1aWxkIGRlcGVuZGVuY2llcyBpbiBzb21lCj4gd2F5IGlzIGdlbmVyYWxseSBhbHdh
eXMgdGhlIHJlYXNvbiBmb3IgdGhpcyBmbGFnIGZvciBhbnkgcGFja2FnZXMgdXNpbmcgaXQuCgpP
aywgc2luY2UgdGhlcmUgaXMgbm8gb3RoZXIgcHJvcG9zYWwgSSdsbCBhcHBseSBhcyBpcy4KCkkg
YWRkZWQgYSBsaW5rIHRvIGEgZmFpbGVkIGdpdGxhYi1jaSBqb2IgaW4gdGhlIGNvbW1pdCBsb2cg
YW5kIGFkZGVkIGEgZm9sbG93dXAKcGF0Y2ggdG8gcmVtb3ZlIHB5dGhvbi1weWJpbmQgZnJvbSBD
KysgZGVwZW5kZW5jeSBjb21tZW50LgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3Qg
cmVnYXJkcywKUm9tYWluCgoKPiAKPj4KPj4gQmVzdCByZWdhcmRzLAo+PiBSb21haW4KPj4KPj4+
PiArUFlUSE9OX01MX0RUWVBFU19CVUlMRF9PUFRTID0gLS1za2lwLWRlcGVuZGVuY3ktY2hlY2sK
Pj4+Pgo+Pj4+ICBQWVRIT05fTUxfRFRZUEVTX0RFUEVOREVOQ0lFUyA9IFwKPj4+PiAgICAgIGhv
c3QtcHl0aG9uLW51bXB5IFwKPj4+PiAtLQo+Pj4+IDIuMzQuMQo+Pj4KPj4+IEJlc3QgcmVnYXJk
cywKPj4+Cj4+PiBKdWxpZW4uCj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+Pj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+Pj4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
