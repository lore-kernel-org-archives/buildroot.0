Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F426C87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 20:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F2BB40B6D;
	Sat,  9 Aug 2025 20:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Sb7MTW-KRlr; Sat,  9 Aug 2025 20:22:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2AB740B7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2AB740B7E;
	Sat,  9 Aug 2025 20:22:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6623F21B
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 20:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 580FB8188A
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 20:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbKRqCKCLc6G for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 20:22:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E47881854
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E47881854
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E47881854
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 20:22:23 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-61592ff5ebbso4933286a12.3
 for <buildroot@buildroot.org>; Sat, 09 Aug 2025 13:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754770941; x=1755375741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HnQD+fvBldtpWF9oyG9oEWBa8RMh+vk0BlXI1tDoCLk=;
 b=f2LhOod/KSE0v8eprL16SFaPqO1sCiE7jROZ/WqtZmuYSFSYXk/tN+vAfSKaxh2zil
 kAIGUFt6z21EDvZBBlsKxmyYvhHgJURbiGDRlB2yHyLRdWc+fTdQN45vvgJakGR3ztF1
 T6E8wk9mCBsVK2UV5e6csCcnMaviLXF2vJuoooO9IAxYPsSNGf3qDh5llr9yks8VhWmi
 MYSsabWPt7TbpUhnJpFmlCmicqbH0h07UFjRHCol1p9xLs76xwuJwBruZSOgZEh5boS4
 9qddlsURCG9WRyavY9tBCYZL3C48Ji3mGT7637ARQc1wiGCFfFV2JgUIRsDt09LF6ue6
 fCjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUHQtI3ddwu25GOLGVmPqj1BfOATSVmhZ1byGa2Jb0DDwLdBpaP7JhFxw2FsgTVoiAD27Hmm/uXNI=@buildroot.org
X-Gm-Message-State: AOJu0YxJLs2d7jg/f6sJM8xLP39tm/68okJaqFI6Je5X2pjIOoXh2dIK
 8job8nON6kYuWhkBhpRzfgq9676QbwLw55Aw9Hza90+alhN8/p2A0OA0YcL8120KJWs=
X-Gm-Gg: ASbGncswY3Wa3kvuAzwJN/9idXBexPZz8xP8mVCSmHmAsEOQ6XceP0Ha1J9lZhTBag2
 1OY7168Y3Y6DN1jPmFrGitlE417GJZgHnwgxaFDnhOT1BBJ8XEeGKj4ga8g5wEFZzsJIg4qohpe
 PdH/3F+PVuXPK43nbz6/ixUMPpsgMNQEFV+IDo3xCb+g2XvVW6Kn19413dVzVu6yMDTd/TOVX3j
 spVo7R6UsNZNo+GlMncZxpt7ZkvyrtczhkeGsL4VfXHZ0N5vYMV4UNxckx/vicIKveyxFrT/B6X
 PfMZeL8P2Qn09udz6LWsAaM4mzcTNXLuJ92neBg8ufc3MeEJqadHJwW9BGjc/eaK5DCppSRMfoB
 aJBvDr6FjyAkc5GpyksQsspJ/
X-Google-Smtp-Source: AGHT+IHllvLf9GkpZVYeP2CYkcZIeEoSuaj+YcBX4ERbM3Tep/fB7vQXSzpZqtOtSULLx75LmLD1xA==
X-Received: by 2002:a05:6402:50cc:b0:618:1cd9:4af2 with SMTP id
 4fb4d7f45d1cf-6181cd94b01mr115053a12.22.1754770941282; 
 Sat, 09 Aug 2025 13:22:21 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af92b650c8asm1567161566b.65.2025.08.09.13.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 13:22:20 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Christian Stewart <christian@aperture.us>
Date: Sat,  9 Aug 2025 22:22:19 +0200
Message-ID: <20250809202220.334375-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <c9397c5d-43ba-44ea-bf09-1bea98184552@smile.fr>
References: <c9397c5d-43ba-44ea-bf09-1bea98184552@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754770941; x=1755375741; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HnQD+fvBldtpWF9oyG9oEWBa8RMh+vk0BlXI1tDoCLk=;
 b=C6Pmu3e2sNzFDtHI16zikgg9u9Ra0Lc8aYGCZA9Y2fskGsru6LzozfFgdJXqTnPrm7
 albzQK2cx8P5NsBNVmq5iXNISVnI+BGoU/BGe6VjA6sItVaJ3iZO/zXInytWdjQB3EYj
 HONIQGb9n5WIxwo8lbCqmiAQruGRBVbjQ8INeoLQ0iMin3rosrojz+QlyA8ybnykdNc6
 sI/ncS9hHpbc8eFDuPHtmWvDF7D5+xWG/BM0RWT7iKSBopglz4UcchTKsHInVyCHGvbq
 dOJNgpsjTmeLi3Uyr9zHRWwzeIWDBzwzZFNy3xl5ORmIza8rj3Z3cfzmXbM25YUu7/jg
 verQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=C6Pmu3e2
Subject: Re: [Buildroot] [PATCH] package/tini: fix build w/ musl
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gSGVsbG8gVGhvbWFzLCBBbGwsCj4gCj4gTGUgMDcvMDgvMjAyNSDDoCAy
Mjo0NiwgVGhvbWFzIFBlcmFsZSB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gPiBXaGVuIGJ1
aWxkaW5nIHRpbmkgd2l0aCBtdXNsIGxpYmMsIHRoZSBmb2xsb3dpbmcgZXJyb3Igb2NjdXJzIGR1
ciB0bwo+ID4gbWlzc2luZyBkZWNsYXJhdGlvbiBvZiAnYmFzZW5hbWUnOgo+ID4gCj4gPiBgYGAK
PiA+IC9ob21lL2J1aWxkcm9vdC9pbnN0YW5jZS0wL291dHB1dC0xL2J1aWxkL3RpbmktMC4xOS4w
L3NyYy90aW5pLmM6IEluIGZ1bmN0aW9uICdwcmludF91c2FnZSc6Cj4gPiAvaG9tZS9idWlsZHJv
b3QvaW5zdGFuY2UtMC9vdXRwdXQtMS9idWlsZC90aW5pLTAuMTkuMC9zcmMvdGluaS5jOjIyNzoz
NjogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdiYXNlbmFtZScgWy1X
aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gPiAgIDIyNyB8ICAgICAgICAgZnByaW50
ZihmaWxlLCAiJXMgKCVzKVxuIiwgYmFzZW5hbWUobmFtZSksIFRJTklfVkVSU0lPTl9TVFJJTkcp
Owo+ID4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+
Cj4gPiBtYWtlOiAqKiogW3BhY2thZ2UvcGtnLWdlbmVyaWMubWs6MjczOiAvaG9tZS9idWlsZHJv
b3QvaW5zdGFuY2UtMC9vdXRwdXQtMS9idWlsZC90aW5pLTAuMTkuMC8uc3RhbXBfYnVpbHRdIEVy
cm9yIDEKPiA+IG1ha2U6IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9tZS9idWlsZHJvb3QvaW5zdGFu
Y2UtMC9idWlsZHJvb3QnCj4gPiBgYGAKPiA+IAo+ID4gVGhpcyBlcnJvciBjYW4gYmUgcmVwcm9k
dWNlZCB3aXRoOgo+ID4gCj4gPiBgYGAKPiA+IGNhdCA+LmNvbmZpZyA8PEVPRgo+ID4gQlIyX2Fh
cmNoNjQ9eQo+ID4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15Cj4gPiBCUjJfVE9PTENIQUlOX0VY
VEVSTkFMX0JPT1RMSU49eQo+ID4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FBUkNI
NjRfTVVTTF9CTEVFRElOR19FREdFPXkKPiA+IEJSMl9QQUNLQUdFX0tWTVRPT0w9eQo+IAo+IGt2
bXRvb2w/IHNob3VsZCBiZSB0aW5pIGhlcmU/CgpSb21haW4sCgpUaGFua3MgZm9yIHRoZSByZXZp
ZXcsIEkgaW5kZWVkIGNvcHkvcGFzdGVkIHRoZSBjb25maWcgZnJvbSB0aGUgc2VyaWVzIEkgc2Vu
dApmb3IgS1ZNVE9PTCB0aGF0IGhhcyB0aGUgc2FtZSBidWcgYW5kIGZvcmdvdCB0byBmaXggdGhl
IGNvbmZpZy4gVGhhbmtzIGZvciB0aGUKbm90aWNlLCBJIHNlbnQgYSB2MjoKCmh0dHBzOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNTA4MDkyMDE5NTQu
MzMzNzU4LTEtdGhvbWFzLnBlcmFsZUBtaW5kLmJlLwoKQmVzdCByZWdhcmRzLApQRVJBTEUgVGhv
bWFzCgo+IAo+IE90aGVyd2lzZToKPiBSZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4u
bmFvdXJAc21pbGUuZnI+Cj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+IAo+ID4gRU9G
Cj4gPiBtYWtlIG9sZGRlZmNvbmZpZwo+ID4gbWFrZSB0aW5pCj4gPiBgYGAKPiA+IAo+ID4gVGhp
cyBwYXRjaCBhZGRzIHRoZSB1cHN0cmVhbSBjb21taXQgWzFdLCB0aGF0IGZpeGVzIHRoaXMgaXNz
dWUgYnkKPiA+IGluY2x1ZGluZyBgbGliZ2VuLmhgLgo+ID4gCj4gPiBbMV0gaHR0cHM6Ly9naXRo
dWIuY29tL2tyYWxsaW4vdGluaS9jb21taXQvOTI0YzRiZDYwMjg0NTcxODg5NDJlY2JmZGM3NWU2
YTM0M2ZhOTM5NQo+ID4gCj4gPiBGaXhlczogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9y
Zy9yZXN1bHRzL2YwZC9mMGQxMGNkMjVmM2IwZTJhNGFmNzI2NmY3NDE3YjMzOWVhNWQyNDJhCj4g
PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGVyYWxlIDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+Cj4g
PiAtLS0KPiA+ICAuLi51cHBvcnQtcG9zaXgtYmFzZW5hbWUtZnJvbS1tdXNsLWxpYmMucGF0Y2gg
fCA3NiArKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDc2IGluc2VydGlv
bnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS90aW5pLzAwMDEtc3VwcG9ydC1w
b3NpeC1iYXNlbmFtZS1mcm9tLW11c2wtbGliYy5wYXRjaAo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS90aW5pLzAwMDEtc3VwcG9ydC1wb3NpeC1iYXNlbmFtZS1mcm9tLW11c2wtbGliYy5w
YXRjaCBiL3BhY2thZ2UvdGluaS8wMDAxLXN1cHBvcnQtcG9zaXgtYmFzZW5hbWUtZnJvbS1tdXNs
LWxpYmMucGF0Y2gKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAw
Li4xNzQ0NWQ1YjNiCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9wYWNrYWdlL3RpbmkvMDAw
MS1zdXBwb3J0LXBvc2l4LWJhc2VuYW1lLWZyb20tbXVzbC1saWJjLnBhdGNoCj4gPiBAQCAtMCww
ICsxLDc2IEBACj4gPiArRnJvbSA5MjRjNGJkNjAyODQ1NzE4ODk0MmVjYmZkYzc1ZTZhMzQzZmE5
Mzk1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ID4gK0Zyb206IEhhdWtlIE1laHJ0ZW5zIDxo
YXVrZUBoYXVrZS1tLmRlPgo+ID4gK0RhdGU6IFN1biwgMTQgQXByIDIwMjQgMTU6MzM6NTEgKzAy
MDAKPiA+ICtTdWJqZWN0OiBbUEFUQ0hdIFN1cHBvcnQgUE9TSVggYmFzZW5hbWUoKSBmcm9tIG11
c2wgbGliYwo+ID4gKwo+ID4gK011c2wgbGliYyAxLjIuNSByZW1vdmVkIHRoZSBkZWZpbml0aW9u
IG9mIHRoZSBiYXNlbmFtZSgpIGZ1bmN0aW9uIGZyb20KPiA+ICtzdHJpbmcuaCBhbmQgb25seSBw
cm92aWRlcyBpdCBpbiBsaWJnZW4uaCBhcyB0aGUgUE9TSVggc3RhbmRhcmQKPiA+ICtkZWZpbmVz
IGl0Lgo+ID4gKwo+ID4gK1RoaXMgY2hhbmdlIGZpeGVzIGNvbXBpbGF0aW9uIHdpdGggbXVzbCBs
aWJjIDEuMi41Lgo+ID4gK2BgYGAKPiA+ICtidWlsZF9kaXIvdGFyZ2V0LW1pcHNfMjRrY19tdXNs
L3RpbmktMC4xOS4wL3NyYy90aW5pLmM6MjI3OjM2OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRp
b24gb2YgZnVuY3Rpb24gJ2Jhc2VuYW1lJyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlv
bl0KPiA+ICsgIDIyNyB8ICAgICAgICAgZnByaW50ZihmaWxlLCAiJXMgKCVzKVxuIiwgYmFzZW5h
bWUobmFtZSksIFRJTklfVkVSU0lPTl9TVFJJTkcpOwo+ID4gK2J1aWxkX2Rpci90YXJnZXQtbWlw
c18yNGtjX211c2wvdGluaS0wLjE5LjAvc3JjL3RpbmkuYzoyMjc6MjU6IGVycm9yOiBmb3JtYXQg
JyVzJyBleHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUgJ2NoYXIgKicsIGJ1dCBhcmd1bWVudCAzIGhh
cyB0eXBlICdpbnQnIFstV2Vycm9yPWZvcm1hdD1dCj4gPiArICAyMjcgfCAgICAgICAgIGZwcmlu
dGYoZmlsZSwgIiVzICglcylcbiIsIGJhc2VuYW1lKG5hbWUpLCBUSU5JX1ZFUlNJT05fU1RSSU5H
KTsKPiA+ICsgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgfl4gICAgICAgICAgfn5+fn5+
fn5+fn5+fn4KPiA+ICsgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAg
fAo+ID4gKyAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgY2hhciAqICAgICBpbnQKPiA+
ICsgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgJWQKPiA+ICsKPiA+ICtgYGBgCj4gPiAr
Cj4gPiArYmFzZW5hbWUoKSBtb2RpZmllcyB0aGUgaW5wdXQgc3RyaW5nLCBjb3B5IGl0IGZpcnN0
IHdpdGggc3RyZHVwKCksIElmCj4gPiArc3RyZHVwKCkgcmV0dXJucyBOVUxMIHRoZSBjb2RlIHdp
bGwgaGFuZGxlIGl0Lgo+ID4gKwo+ID4gK1NpZ25lZC1vZmYtYnk6IEhhdWtlIE1laHJ0ZW5zIDxo
YXVrZUBoYXVrZS1tLmRlPgo+ID4gK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20va3JhbGxp
bi90aW5pL2NvbW1pdC85MjRjNGJkNjAyODQ1NzE4ODk0MmVjYmZkYzc1ZTZhMzQzZmE5Mzk1Cj4g
PiArU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBlcmFsZSA8dGhvbWFzLnBlcmFsZUBtaW5kLmJlPgo+
ID4gKy0tLQo+ID4gKyBzcmMvdGluaS5jIHwgMTUgKysrKysrKysrKystLS0tCj4gPiArIDEgZmls
ZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gKwo+ID4gK2Rp
ZmYgLS1naXQgYS9zcmMvdGluaS5jIGIvc3JjL3RpbmkuYwo+ID4gK2luZGV4IDc5MTRkM2EuLjQx
ZDE1MDYgMTAwNjQ0Cj4gPiArLS0tIGEvc3JjL3RpbmkuYwo+ID4gKysrKyBiL3NyYy90aW5pLmMK
PiA+ICtAQCAtMTQsNiArMTQsNyBAQAo+ID4gKyAjaW5jbHVkZSA8c3RkbGliLmg+Cj4gPiArICNp
bmNsdWRlIDx1bmlzdGQuaD4KPiA+ICsgI2luY2x1ZGUgPHN0ZGJvb2wuaD4KPiA+ICsrI2luY2x1
ZGUgPGxpYmdlbi5oPgo+ID4gKyAKPiA+ICsgI2luY2x1ZGUgInRpbmlDb25maWcuaCIKPiA+ICsg
I2luY2x1ZGUgInRpbmlMaWNlbnNlLmgiCj4gPiArQEAgLTIyNCwxNCArMjI1LDE5IEBAIGludCBz
cGF3bihjb25zdCBzaWduYWxfY29uZmlndXJhdGlvbl90KiBjb25zdCBzaWdjb25mX3B0ciwgY2hh
ciogY29uc3QgYXJndltdLCBpCj4gPiArIH0KPiA+ICsgCj4gPiArIHZvaWQgcHJpbnRfdXNhZ2Uo
Y2hhciogY29uc3QgbmFtZSwgRklMRSogY29uc3QgZmlsZSkgewo+ID4gKy0JZnByaW50ZihmaWxl
LCAiJXMgKCVzKVxuIiwgYmFzZW5hbWUobmFtZSksIFRJTklfVkVSU0lPTl9TVFJJTkcpOwo+ID4g
KysJY2hhciAqZGlyYywgKmJuYW1lOwo+ID4gKysKPiA+ICsrCWRpcmMgPSBzdHJkdXAobmFtZSk7
Cj4gPiArKwlibmFtZSA9IGJhc2VuYW1lKGRpcmMpOwo+ID4gKysKPiA+ICsrCWZwcmludGYoZmls
ZSwgIiVzICglcylcbiIsIGJuYW1lLCBUSU5JX1ZFUlNJT05fU1RSSU5HKTsKPiA+ICsgCj4gPiAr
ICNpZiBUSU5JX01JTklNQUwKPiA+ICstCWZwcmludGYoZmlsZSwgIlVzYWdlOiAlcyBQUk9HUkFN
IFtBUkdTXSB8IC0tdmVyc2lvblxuXG4iLCBiYXNlbmFtZShuYW1lKSk7Cj4gPiArKwlmcHJpbnRm
KGZpbGUsICJVc2FnZTogJXMgUFJPR1JBTSBbQVJHU10gfCAtLXZlcnNpb25cblxuIiwgYm5hbWUp
Owo+ID4gKyAjZWxzZQo+ID4gKy0JZnByaW50ZihmaWxlLCAiVXNhZ2U6ICVzIFtPUFRJT05TXSBQ
Uk9HUkFNIC0tIFtBUkdTXSB8IC0tdmVyc2lvblxuXG4iLCBiYXNlbmFtZShuYW1lKSk7Cj4gPiAr
KwlmcHJpbnRmKGZpbGUsICJVc2FnZTogJXMgW09QVElPTlNdIFBST0dSQU0gLS0gW0FSR1NdIHwg
LS12ZXJzaW9uXG5cbiIsIGJuYW1lKTsKPiA+ICsgI2VuZGlmCj4gPiArLQlmcHJpbnRmKGZpbGUs
ICJFeGVjdXRlIGEgcHJvZ3JhbSB1bmRlciB0aGUgc3VwZXJ2aXNpb24gb2YgYSB2YWxpZCBpbml0
IHByb2Nlc3MgKCVzKVxuXG4iLCBiYXNlbmFtZShuYW1lKSk7Cj4gPiArKwlmcHJpbnRmKGZpbGUs
ICJFeGVjdXRlIGEgcHJvZ3JhbSB1bmRlciB0aGUgc3VwZXJ2aXNpb24gb2YgYSB2YWxpZCBpbml0
IHByb2Nlc3MgKCVzKVxuXG4iLCBibmFtZSk7Cj4gPiArIAo+ID4gKyAJZnByaW50ZihmaWxlLCAi
Q29tbWFuZCBsaW5lIG9wdGlvbnM6XG5cbiIpOwo+ID4gKyAKPiA+ICtAQCAtMjYxLDYgKzI2Nyw3
IEBAIHZvaWQgcHJpbnRfdXNhZ2UoY2hhciogY29uc3QgbmFtZSwgRklMRSogY29uc3QgZmlsZSkg
ewo+ID4gKyAJZnByaW50ZihmaWxlLCAiICAlczogU2VuZCBzaWduYWxzIHRvIHRoZSBjaGlsZCdz
IHByb2Nlc3MgZ3JvdXAuXG4iLCBLSUxMX1BST0NFU1NfR1JPVVBfR1JPVVBfRU5WX1ZBUik7Cj4g
PiArIAo+ID4gKyAJZnByaW50ZihmaWxlLCAiXG4iKTsKPiA+ICsrCWZyZWUoZGlyYyk7Cj4gPiAr
IH0KPiA+ICsgCj4gPiArIHZvaWQgcHJpbnRfbGljZW5zZShGSUxFKiBjb25zdCBmaWxlKSB7Cj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
