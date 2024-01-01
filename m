Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB972C47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EBFC40A8B;
	Mon,  1 Jan 2024 21:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EBFC40A8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 77K-mqZWnDRi; Mon,  1 Jan 2024 21:51:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 577CA40A8E;
	Mon,  1 Jan 2024 21:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 577CA40A8E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 497BB1BF37C
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18BD940A8B
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18BD940A8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AuSM9pPfFklc for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:51:53 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A247940A87
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A247940A87
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d41555f9dso91890965e9.2
 for <buildroot@buildroot.org>; Mon, 01 Jan 2024 13:51:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704145911; x=1704750711;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J7nOCkZDdNJMXotjhnWUhpV49LiiUROCljHoGi1dYWU=;
 b=jraDt8P66U5kuZQ0l0Gq2he1KoC+XKviNbTQYoeSw6TRA/+1BcNB6sp4hJntY0o1E9
 FcUT8cYlJoSFNGQJIAtR0YkVb2ACu/JCd6uA1PcJwg5TQabnqEqc38VQz0mnrCyPUqGS
 uIuJ75UNPErx7U8UgF1S5ecFAzZ2bpDebi7sSbok0Nuee/kCOyZi0buUq9IJo9asYeCn
 oicAprdpsogv+sQuF/nGlKWJEmjcxCmRHv1c7ofUoVMHnmZ/RDoW619oEqfCx9Wd3vy6
 Fy3gC+77qQt5ovabSh82ilyIuGANylaqT6c6v+6h1QUa3e6gp5uBRcHfnH5d4ydMFdBe
 SnJQ==
X-Gm-Message-State: AOJu0YxHw+ger4MikAG6Wnl7TMWOmTil7VTsvaWawpJumk+eE9WtDxX+
 gtqlyh5ZsYa6e3aI/U+qGjf1ccbiQys=
X-Google-Smtp-Source: AGHT+IE+e/uTOA9QIhxof+P1Woc66p2KiKGggWTF/BJvVin9q6Dv0xs6eM2wLgHgIFvcjng9tYXQzA==
X-Received: by 2002:a05:600c:3553:b0:40d:5a3f:8e90 with SMTP id
 i19-20020a05600c355300b0040d5a3f8e90mr5482998wmq.20.1704145910474; 
 Mon, 01 Jan 2024 13:51:50 -0800 (PST)
Received: from localhost.localdomain
 ([2a01:cb19:8290:3800:4f89:5708:1633:580e])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a056000055000b003372dcd739csm7485586wrf.86.2024.01.01.13.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jan 2024 13:51:48 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon,  1 Jan 2024 22:51:42 +0100
Message-ID: <20240101215142.2480384-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704145911; x=1704750711; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=J7nOCkZDdNJMXotjhnWUhpV49LiiUROCljHoGi1dYWU=;
 b=ZuVRTBfWuhCrZxwQnEmlbJkKXkOlWEXKsudaPdDjDiU6Ev0Wy47pWGgBBtyXrdnF0i
 YzM9jz6Y48oM/Jxci+BHQ4zXvr686VvBKfqZKykOBxpz/7eauuHr74EIQxvFsHoY/TBg
 QP4bVDd0c9UxCfJ6cCWgNmM2tJjvdxrtmPALdXUvV6aCs0OWU0g8NS3zwVJ2/oVJo2fh
 mVRLADBEE0wyCQZ9nDAUS6VWJTIK2gibsFrKAJ+oqIHrr9d0GqdVOo9mdyvF2ADT3Mfl
 N3lCBytk2cex9OVaNca4TmLFsfC8Vuqe1RJ7HHnclFIhwJAfDzFpUoI3FuZdtcfSPiKd
 66RQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZuVRTBfW
Subject: [Buildroot] [PATCH] Revert "support/download: generate even more
 reproducible tarballs"
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q29tbWl0IDc2OGY5ZjgwZjYyYyAoc3VwcG9ydC9kb3dubG9hZDogZ2VuZXJhdGUgZXZlbiBtb3Jl
IHJlcHJvZHVjaWJsZQp0YXJiYWxscykgY2F1c2VzIG5vbi1yZXByb2R1Y2liaWxpdHkgaW4gdGFy
YmFsbHMgd2UgcHJldmlvdXN5CmdlbmVyYXRlZCwgZXNwZWNpYWxseSB0aGUgYXJjaGl2ZXMgZm9y
IHR3byBjYXJnby12ZW5kb3JlZCBwYWNrYWdlcywKcmlwZ3JlcCBhbmQgc2VudHJ5LWNsaS4KClRo
ZSBjYXVzZSBpcyB0aGF0IHRob3NlIHR3byBwYWtjYWdlcyBldmVudHVhbGx5IHZlbmRvciBhIGZp
bGUgdGhhdCBoYXMKdGhlIHUreCBiaXQgc2V0LCBidXQgaXMgb3RlaHJ3aXNlIGdvLXguIFdpdGgg
NzY4ZjlmODBmNjJjLCB0aGUgZmlsZXMgYXJlCm5vdyBnbyt4LCBzbyB0aGUgaGFzaCBmb3IgdGhv
c2UgZ2VuZXJhdGVkIGFyY2hpdmVzIGhhcyBjaGFuZ2VkLgoKQmVzaWRlcywgdGhhdCBjb21taXQg
d2FzIHdyb25nOiBpdCBkaWQgbm90IGFjY291bnQgZm9yIHRoZSAncicgYml0IGZvcgpnbyBwYXJ0
LCBsZWF2aW5nIHNvbWUgbm9uLXJlcHJvZHVjaWJpbGl0eSBzdGlsbCB1bmFjY291bnRlZCBmb3Iu
CgpTbywgdG8gZ2VuZXJhdGUgcmVhbGx5IHJlcHJvZHVjaWJsZSBhcmNoaXZlcywgd2Ugd291bGQg
bmVlZCB0byBmaXggdGhhdApyZWFkIGJpdCBhcyB3ZWxsLCBhbmQgdGhhdCBoYXMgdGhlIHBvdGVu
dGlhbCB0byBhZmZlY3QgYWxsIHRoZSBhcmNoaXZlcwp3ZSBnZW5lcmF0ZWQgc28gZmFyLiBJZiB3
ZSB3YW50ZWQgdG8gZG8gc28sIHdlJ2QgbmVlZCBhIHdheSB0byB2ZXJzaW9uCmFsbCBnZW5lcmF0
ZWQgYXJjaGl2ZXMsIGxpa2Ugd2UgZG8gZm9yIGdpdCBhbmQgc3ZuLCBidXQgbm93IGZvciBhbGwg
dGhlCmRpZmZlcmVudCBDVlNlcywgYXMgd2VsbCBhcyBmb3IgYWxsIHRoZSB2ZW5kb3JpbmcgcG9z
dC1wcm9jZXNzZXMuCgpGb3IgNzY4ZjlmODBmNjJjLCBhbGwgdGhhdCB3YXMgb2YgY29uZXJuIHdh
cyB0aGUgd29ya2luZyBjb3BpZXMgb2YgQ1ZTZXMKKGkuZS4gZ2l0LCBzdm4sIGN2cy4uLikgdGhh
dCB3ZSBjYWNoZSBpbiB0aGUgQnVpbGRyb290IGRvd25sb2FkIGRpciwgbm90CnRoZSB0ZW1wb3Jh
cnkgZmlsZXMgZHVyaW5nIHBvc3QtcHJvY2Vzc2luZy4gSW5kZWVkLCBpbiB0aGF0IGxhdHRlciBj
YXNlLAp0aGUgdXNlciBoYXMgdmlydHVhbGx5IG5vIHdheSB0byBtYW5nbGUgd2l0aCB0aGUgbW9k
ZSBvZiB0aGUKaW50ZXJtZWRpYXRlIGV4dHJhY3QgYmVmb3JlIHJlcGFjay4KCkFuZCB3ZSBkbyBo
YXZlIGEgYmlnIGZhdCB3YXJuaW5nIHRoYXQgdXNlcnMgc2hvdWxkIG5vdCBhdHRlbXB0IHRvIG1l
ZGRsZQp3aXRoIHRoZSBnaXQgdHJlZSB0aGF0IEJ1aWxkcm9vdCBjYWNoZXMuCgpBcyA3NjhmOWY4
MGY2MmMgaG93ZXZlciBkZW1vbnN0cmF0ZXMsIGlzIHRoYXQgaXQgdG9vayBxdWl0ZSBhIGxvbmcg
dGltZQpiZXR3ZWVuIHRoZSBpbnRyb2R1Y3Rpb24gb2YgdGhlIGdpdCBjYWNoaW5nLCBhbmQgdGhl
IHRpbWUgc29tZW9uZQpldmVudHVhbGx5IGRpc2NvdmVyZWQgdGhleSBjb3VsZCBtZWRkbGUgaW4g
dGhlcmUuIFRoaXMgc2hvd3MgdGhhdCB0aGUKaXNzdWUgaXQgbm90IGFjdHVhbGx5IGNyaXRpY2Fs
IGluIG1vc3Qgc2V0dXBzLgoKQWxzbywgdGhlIHRhciBtYW51YWwgWzBdIGhpbnRzIGF0IGEgYmV0
dGVyIHNvbHV0aW9uIHRvIGhhbmRsZQpyZXByb2R1Y2liaWxpdHksIHdoaWNoIGV2ZW4gYXZvaWRz
IHRvdWNoaW5nIHRoZSBmaWxlcyBvbiBkaXNrIHdoaWNoIGlzCmV2ZW4gbmljZXI6CgogICAg4oCY
LS1tb2RlPSdnbyt1LGdvLXcn4oCZCiAgICAgICAgT21pdCBpcnJlbGV2YW50IGluZm9ybWF0aW9u
IGFib3V0IGZpbGUgcGVybWlzc2lvbnMuCgpJZiB3ZSB3ZXJlIHRvIGFjdHVhbGx5IGhhbmRsZSB0
aGUgbW9kZSBiaXQgZm9yIHJlcHJvZHVjaWJpbGl0eSwgd2UnZApuZWVkIHRvOgogIC0gaW50cm9k
dWNlIGFyY2hpdmUgdmVyc2lvbmluZyBmb3IgYWxsIGRvd25sb2FkIGJhY2tlbmRzIGFuZAogICAg
cHJvc3QtcHJvY2Vzc2luZwogIC0gdXNlIHRoZSB0YXIgb2ZmaWNpYWxseSBzdWdnZXN0ZWQgbWV0
aG9kCgpTbywgcmV2ZXJ0IHRoYXQgY2hhbmdlLCBhcyBpdCB3YXMgaW5jb21wbGV0ZSwgd2FzIG5v
dCByZWFsbHkgZml4aW5nIG11Y2gKaXNzdWVzLCBhbmQgY2F1c2VzIGFjdHVhbCBpc3N1ZXMuCgpU
aGlzIHJldmVydHMgY29tbWl0IDc2OGY5ZjgwZjYyYzFkYTZlMjk4YzY4MGYwZjRiZmE4ODdmMzhj
NzguCgpbMF0gaHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS90YXIvbWFudWFsL3Rhci5odG1s
I1JlcHJvZHVjaWJpbGl0eQoKVGhhbmtzIHRvIFZpbmNlbnQgYW5kIEFybm91dCBmb3IgcG9pbnRp
bmcgYXQgdGhlIHRhciBtYW51YWwuCgpSZXBvcnRlZC1ieTogQW50b2luZSBDb3V0YW50IDxhbnRv
aW5lLmNvdXRhbnRAc21pbGUuZnI+ClJlcG9ydGVkLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgpTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5
YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KQ2M6IFZpbmNlbnQgRmF6aW8gPHZmYXppb0B4ZXMtaW5j
LmNvbT4KQ2M6IEFybm91dCBWYW5kZWNhcHBlbGxlIChFc3NlbnNpdW0vTWluZCkgPGFybm91dEBt
aW5kLmJlPgotLS0KIHN1cHBvcnQvZG93bmxvYWQvaGVscGVycyB8IDMgLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zdXBwb3J0L2Rvd25sb2FkL2hlbHBl
cnMgYi9zdXBwb3J0L2Rvd25sb2FkL2hlbHBlcnMKaW5kZXggMjY1Njg1ZWZmNS4uOTBhN2Q2YzFl
YyAxMDA3NTUKLS0tIGEvc3VwcG9ydC9kb3dubG9hZC9oZWxwZXJzCisrKyBiL3N1cHBvcnQvZG93
bmxvYWQvaGVscGVycwpAQCAtNTMsOSArNTMsNiBAQCBta190YXJfZ3ooKSB7CiAgICAgdG1wPSIk
KG1rdGVtcCAtLXRtcGRpcj0iJChwd2QpIikiCiAgICAgcHVzaGQgIiR7aW5fZGlyfSIgPi9kZXYv
bnVsbAogCi0gICAgIyBFbmZvcmNlIGdyb3VwL290aGVycyBtb2RlIGJpdHMKLSAgICBjaG1vZCAt
UiBnby13eCtYIC4KLQogICAgICMgRXN0YWJsaXNoIGxpc3QKICAgICBmaW5kIC4gLW5vdCAtdHlw
ZSBkIC1hbmQgLW5vdCBcKCAtZmFsc2UgIiR7ZmluZF9vcHRzW0BdfSIgXCkgPiIke3RtcH0ubGlz
dCIKICAgICAjIFNvcnQgbGlzdCBmb3IgcmVwcm9kdWNpYmlsaXR5Ci0tIAoyLjQzLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
