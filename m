Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2733CCD183
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 16:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8761082B97;
	Mon, 13 Oct 2025 16:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 14gbQsX6hT-I; Mon, 13 Oct 2025 16:22:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 017C482B51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 017C482B51;
	Mon, 13 Oct 2025 16:22:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D03E81C9
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 16:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1DE640988
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 16:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MEZYFLzBzF6k for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 16:22:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5EEE240921
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EEE240921
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EEE240921
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 16:22:09 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-637e9f9f9fbso122313a12.0
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 09:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760372528; x=1760977328;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ekhHBAp1GA5Xux1pJbZOf+Ov7vZjJ8t144ZOvirMF2U=;
 b=trk29eW/Fk8TLDp3zBfBA27xt1GaLvdqZz/mCuVU5ESDeJzyoTvg4PtFI9J2Y2Xm6s
 163BnrMaX+dOsG8DL40EhkboN4MsGcvxCIhhMxV6yG/+/0KqT6qUFpGyDWo0TegVNhxB
 XHg07DLzCDJinpyfhpIHymIftKYf9N5hQecxEIv6Yp4hoygbNNgWl3jprzymo1ah0uLz
 VRISQylJn0DT5PhQlRLvQNKBl8EAc0YmIXEkCElTuHV53/SwTYXIZrNCMVm2k4Xe1QeV
 uFYL+YFzfV/zarjWVWGw35hcEjqGb/h7FCugA+5WvdQh9rM2/SyfNgyXfC0QlfEYDMHg
 +beg==
X-Gm-Message-State: AOJu0YwAS3uafUq258OtRUVyi+imkskMZssWofPPtCc/cBrLXuk1sOB2
 hCN7QaNO7RZmQTY36HSxKnhRYdF1ZD66LQoy4SMVzipbqU3Nfs5IydFPI4mRO6wLrG4GoeFTkBn
 FEIAX
X-Gm-Gg: ASbGncsBxcTva0Wr5hdGjcgwmjIVjMWhQqM+6D2kuuY5Au8NPPiAYFkJCRPSMHPQpf4
 tyitjIEDHPflz09cTniM0jzlYPFtfd5jHObgFWfG2v+k3rmVyZoMnhZwDIAM74Q3ewk2/xHsixU
 0XJrqRLQKLKcizp62Wo+GGU9ElujHfV6t65zZDaio25u+sHhfx6pzq/1tqvEGRdaPR3peGg4r0e
 FpRBdKChZmD9GES/ArGlD70kqsORTkWnKW/zSQ7S0+05hzbiqoHUECvwz7jGZZKv3D8J8PUNzCY
 CIm4xgMU/m0LhqQaJnwGZjxb6YHcIFUYm/rT6+XVM30o0J9vek5O2r7pwGhQrtD7CaHZXVrgDZ2
 YcgNrz9RxP/7tml/f747TNjwTzUBBOWyvhdNq+POa3tysu9NRrGiN4LKZcc6lCA==
X-Google-Smtp-Source: AGHT+IG7ARbuKHllqUHdxGGYLYgkUXV45KZjPQMXcYrKte9JpLxeO/NBhm9iLpSQ3EqBgv4BKsz20Q==
X-Received: by 2002:a17:907:2da3:b0:b2b:59b5:ae38 with SMTP id
 a640c23a62f3a-b50abaa4690mr2474885966b.40.1760372528009; 
 Mon, 13 Oct 2025 09:22:08 -0700 (PDT)
Received: from dragon.home ([109.136.97.112]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d900e432sm929238866b.65.2025.10.13.09.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 09:22:07 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 13 Oct 2025 18:21:58 +0200
Message-ID: <20251013162158.204270-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760372528; x=1760977328; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ekhHBAp1GA5Xux1pJbZOf+Ov7vZjJ8t144ZOvirMF2U=;
 b=C1fMO1qV7LwGs7KGVPUPTJHklS362a9ZkflqcN/tXiVVcLCmXRIRjdKKk5B76AGeN7
 fPjLl0sdawHTlfriccaOEZvNao0oBRMf2+kwGCO7h6146JM9zg7Toy8pIRHHM5etmVia
 Z+9d+CtGTHIZI1j6gwTwRkpKrjud2UYl0ePlHi1v8AujWrzBWqaVPPY3MEUrWDE6DIdi
 wUlMxIwOcHi0a5y7bFTECImTQYL5S1WYz2YG547396VMwBYXYn8JiKrxho1B9bjzvUS1
 OAmCyndxSxprqj88z7nfdQSLql0FeR52aGeHbmX6EvKNwyzAJ6N3Hvnmrn9Ngr4pERKp
 p+uw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=C1fMO1qV
Subject: [Buildroot] [PATCH] package/modsecurity2: security bump to v2.9.12
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2VlIHRoZSByZWxlYXNlIG5vdGVzOgotIGh0dHBzOi8vZ2l0aHViLmNvbS9vd2FzcC1tb2RzZWN1
cml0eS9Nb2RTZWN1cml0eS9yZWxlYXNlcy90YWcvdjIuOS4xMQotIGh0dHBzOi8vZ2l0aHViLmNv
bS9vd2FzcC1tb2RzZWN1cml0eS9Nb2RTZWN1cml0eS9yZWxlYXNlcy90YWcvdjIuOS4xMgoKVGhp
cyBmaXhlcyB0aGUgZm9sbG93aW5nIHZ1bG5lcmFiaWxpdGllczoKLSBDVkUtMjAyNS01Mjg5MToK
ICAgIE1vZFNlY3VyaXR5IGlzIGFuIG9wZW4gc291cmNlLCBjcm9zcyBwbGF0Zm9ybSB3ZWIgYXBw
bGljYXRpb24gZmlyZXdhbGwKICAgIChXQUYpIGVuZ2luZSBmb3IgQXBhY2hlLCBJSVMgYW5kIE5n
aW54LiBJbiB2ZXJzaW9ucyAyLjkuOCB0byBiZWZvcmUKICAgIDIuOS4xMSwgYW4gZW1wdHkgWE1M
IHRhZyBjYW4gY2F1c2UgYSBzZWdtZW50YXRpb24gZmF1bHQuIElmCiAgICBTZWNQYXJzZVhtbElu
dG9BcmdzIGlzIHNldCB0byBPbiBvciBPbmx5QXJncywgYW5kIHRoZSByZXF1ZXN0IHR5cGUgaXMK
ICAgIGFwcGxpY2F0aW9uL3htbCwgYW5kIGF0IGxlYXN0IG9uZSBYTUwgdGFnIGlzIGVtcHR5IChl
ZyA8Zm9vPjwvZm9vPiksCiAgICB0aGVuIGEgc2VnbWVudGF0aW9uIGZhdWx0IG9jY3Vycy4gVGhp
cyBpc3N1ZSBoYXMgYmVlbiBwYXRjaGVkIGluCiAgICB2ZXJzaW9uIDIuOS4xMS4gQSB3b3JrYXJv
dW5kIGludm9sdmVzIHNldHRpbmcgU2VjUGFyc2VYbWxJbnRvQXJncyB0bwogICAgT2ZmLgogICAg
aHR0cHM6Ly93d3cuY3ZlLm9yZy9DVkVSZWNvcmQ/aWQ9Q1ZFLTIwMjUtNTI4OTEKCi0gQ1ZFLTIw
MjUtNTQ1NzE6CiAgICBNb2RTZWN1cml0eSBpcyBhbiBvcGVuIHNvdXJjZSwgY3Jvc3MgcGxhdGZv
cm0gd2ViIGFwcGxpY2F0aW9uIGZpcmV3YWxsCiAgICAoV0FGKSBlbmdpbmUgZm9yIEFwYWNoZSwg
SUlTIGFuZCBOZ2lueC4gSW4gdmVyc2lvbnMgMi45LjExIGFuZCBiZWxvdywKICAgIGFuIGF0dGFj
a2VyIGNhbiBvdmVycmlkZSB0aGUgSFRUUCByZXNwb25zZeKAmXMgQ29udGVudC1UeXBlLCB3aGlj
aCBjb3VsZAogICAgbGVhZCB0byBzZXZlcmFsIGlzc3VlcyBkZXBlbmRpbmcgb24gdGhlIEhUVFAg
c2NlbmFyaW8uIEZvciBleGFtcGxlLCB3ZQogICAgaGF2ZSBkZW1vbnN0cmF0ZWQgdGhlIHBvdGVu
dGlhbCBmb3IgWFNTIGFuZCBhcmJpdHJhcnkgc2NyaXB0IHNvdXJjZQogICAgY29kZSBkaXNjbG9z
dXJlIGluIHRoZSBsYXRlc3QgdmVyc2lvbiBvZiBtb2Rfc2VjdXJpdHkyLiBUaGlzIGlzc3VlIGlz
CiAgICBmaXhlZCBpbiB2ZXJzaW9uIDIuOS4xMi4KICAgIGh0dHBzOi8vd3d3LmN2ZS5vcmcvQ1ZF
UmVjb3JkP2lkPUNWRS0yMDI1LTU0NTcxCgpTaWduZWQtb2ZmLWJ5OiBUaXRvdWFuIENocmlzdG9w
aGUgPHRpdG91YW4uY2hyaXN0b3BoZUBtaW5kLmJlPgotLS0KIHBhY2thZ2UvbW9kc2VjdXJpdHky
L21vZHNlY3VyaXR5Mi5oYXNoIHwgNCArKy0tCiBwYWNrYWdlL21vZHNlY3VyaXR5Mi9tb2RzZWN1
cml0eTIubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbW9kc2VjdXJpdHkyL21vZHNlY3VyaXR5
Mi5oYXNoIGIvcGFja2FnZS9tb2RzZWN1cml0eTIvbW9kc2VjdXJpdHkyLmhhc2gKaW5kZXggMTg2
ZTEzZDc2Ni4uM2U2MDE5ZDA0MyAxMDA2NDQKLS0tIGEvcGFja2FnZS9tb2RzZWN1cml0eTIvbW9k
c2VjdXJpdHkyLmhhc2gKKysrIGIvcGFja2FnZS9tb2RzZWN1cml0eTIvbW9kc2VjdXJpdHkyLmhh
c2gKQEAgLTEsNSArMSw1IEBACi0jIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL293YXNwLW1vZHNl
Y3VyaXR5L01vZFNlY3VyaXR5L3JlbGVhc2VzL2Rvd25sb2FkL3YyLjkuMTAvbW9kc2VjdXJpdHkt
djIuOS4xMC50YXIuZ3ouc2hhMjU2Ci1zaGEyNTYgIDA4MWNkYTUyOTc1NDk0MTM5OTIyZmE0YjU0
ZjQ3NGZlZDhhNmRiNGI3ZjU4NmNiMGQzYWVlYzYzNWY3YTRkNTMgIG1vZHNlY3VyaXR5LXYyLjku
MTAudGFyLmd6CisjIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL293YXNwLW1vZHNlY3VyaXR5L01v
ZFNlY3VyaXR5L3JlbGVhc2VzL2Rvd25sb2FkL3YyLjkuMTIvbW9kc2VjdXJpdHktdjIuOS4xMi50
YXIuZ3ouc2hhMjU2CitzaGEyNTYgIDc5YWRhODY5MzMwM2JlMzQ5MDIwMTM5NzM0NGJmNjY5MDBh
NDVmMDdhZTMyOGJmNmNmMDFjYTk5ZTVkMTM1ZmEgIG1vZHNlY3VyaXR5LXYyLjkuMTIudGFyLmd6
CiAKICMgTG9jYWxseSBjb21wdXRlZAogc2hhMjU2ICAyYzU2NGY1YTY3ZTQ5ZTc0YzgwZTVhN2Rj
YWNkMTkwNGU3NDA4ZjFmZDZhOTUyMThiMzhjMDRmMDEyZDk0Y2I5ICBMSUNFTlNFCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL21vZHNlY3VyaXR5Mi9tb2RzZWN1cml0eTIubWsgYi9wYWNrYWdlL21vZHNl
Y3VyaXR5Mi9tb2RzZWN1cml0eTIubWsKaW5kZXggNDAyYmE2MzE3Yi4uMDc1NGQ1YzkwNyAxMDA2
NDQKLS0tIGEvcGFja2FnZS9tb2RzZWN1cml0eTIvbW9kc2VjdXJpdHkyLm1rCisrKyBiL3BhY2th
Z2UvbW9kc2VjdXJpdHkyL21vZHNlY3VyaXR5Mi5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCiAKLU1PRFNFQ1VSSVRZMl9WRVJTSU9OID0gMi45LjEwCitNT0RT
RUNVUklUWTJfVkVSU0lPTiA9IDIuOS4xMgogTU9EU0VDVVJJVFkyX1NPVVJDRSA9IG1vZHNlY3Vy
aXR5LXYkKE1PRFNFQ1VSSVRZMl9WRVJTSU9OKS50YXIuZ3oKIE1PRFNFQ1VSSVRZMl9TSVRFID0g
aHR0cHM6Ly9naXRodWIuY29tL293YXNwLW1vZHNlY3VyaXR5L01vZFNlY3VyaXR5L3JlbGVhc2Vz
L2Rvd25sb2FkL3YkKE1PRFNFQ1VSSVRZMl9WRVJTSU9OKQogTU9EU0VDVVJJVFkyX0xJQ0VOU0Ug
PSBBcGFjaGUtMi4wCi0tIAoyLjUxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
