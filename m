Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF06C021B5
	for <buildroot@archiver.kernel.org>; Fri, 21 Feb 2025 13:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E05B782038;
	Fri, 21 Feb 2025 13:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 93cPZX5nDdd5; Fri, 21 Feb 2025 13:55:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF16D82056
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF16D82056;
	Fri, 21 Feb 2025 13:55:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7EF36B
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 13:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C51D605D7
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 13:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PpzgFWXWnZ4g for <buildroot@buildroot.org>;
 Fri, 21 Feb 2025 13:55:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=nunog@fr24.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C1E8B606E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1E8B606E7
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1E8B606E7
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 13:55:05 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43984e9cc90so19088465e9.1
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 05:55:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740146104; x=1740750904;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5mY6Lv2nr7634xl78LyqbfGgvxcaOf5C4ejHNqn0B8M=;
 b=MTOnFR2MvrhZGuz5aDd+rGqyOvAl0C7y+oU6foJWoIRPfGphb5+2sMlD5yLhNOGKIF
 qSE51lo/badwSLh4cqcdq1YGmYJtUjTwDtu7OoGjA4h7qOWgbl69p/XwqYXqs2ZusDC0
 rv+6LB0+tCtUyA+/j/DP9H6oFRPLyBeGTNh/fT8SmcCmvCzG28Nyy2wZIuGS2P/UG0b1
 yKeZL30JWNsqljYLDBRtegk8hb86N/vXoGmtzmY6o9mIq0hLEwKe3zZBCJzvc5LLfeli
 QJ63w6Fc25MCm3um/vr7dzX/3/VphMJMF++Ud2Bk09RiZvHqCzkeTaqzGvgvD1q1Yqtc
 Y8eg==
X-Gm-Message-State: AOJu0YzVmHok8AYlGYm8UQphjphk9LxBa26xzBVQf20U0CNy55h4w8PF
 z2RLa5d7vtgFW2sT2p88DrBVhaBdyCzBxUvtKL8pROw1XMfrN7MW/Qm48+wFb4Ca12kc8iK/tcK
 T
X-Gm-Gg: ASbGnctZU/Py1p4RxOGtK553ZC7RN8i5kvq9PM4Ew4rO2qtCGsMrVTqm0aUQUc/hgab
 Wpx1efXSSGePyedJUxs2sHxb7YUSWJWW53kCVxxG0BjNKZXhDNnxgQra6Ny3OTRMggmWcLNOu5V
 xPWN7dvMnszAi3NTgbBursue0mGf8cLalo1KHB6B6utSWZ/azat5kT1w3TWDguLX/1efW6VQTr8
 b7IRMHZtn1ofAUE3wfMVErizGLxzc4zCBNao6crFdBKOHb01I9bHfPJQxdXjqc+wJFR3VblB8UA
 /itvtL5DSy+2xYW7/lfan9bYiFFWZ2a5SEVmrHiCvRB9APzELX12I0M=
X-Google-Smtp-Source: AGHT+IH8Cux2Rjlnjsmyt4anbD3+x9IePfVRX9wmpgEmiJVRTGK3RgbJQ2daCLQ18WIYVX7XkIaEzg==
X-Received: by 2002:a05:6000:1888:b0:388:c61d:4415 with SMTP id
 ffacd0b85a97d-38f6f515211mr2580234f8f.18.1740146103718; 
 Fri, 21 Feb 2025 05:55:03 -0800 (PST)
Received: from sky21.internal.fr24.com (bl19-45-33.dsl.telepac.pt.
 [2.80.45.33]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38f259d65dfsm23885469f8f.64.2025.02.21.05.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 05:55:03 -0800 (PST)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunog@fr24.com>
Date: Fri, 21 Feb 2025 13:54:03 +0000
Message-ID: <20250221135432.9124-1-nunog@fr24.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fr24.com; s=google; t=1740146104; x=1740750904; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5mY6Lv2nr7634xl78LyqbfGgvxcaOf5C4ejHNqn0B8M=;
 b=emAIDJ13rihOfF1SJ6Wf6U+5gcZI3d7zXey1nczMT5Jwk96ePdQ+h0uxHLTdBJyiUC
 W/7t/fjfNJa3QrH8RTKcSWPGacpkQ4T2IiIISS3e5vizreUktjFgypVD4lTb+R96hGqd
 iSgbklk68rkZMMHEqEDiutrO3Hh8NYyWlmPEvR0liB/gr+Uh2+0MnpOM/UeLtUyDmzPI
 GWDUt64qLmzp7m+/nr0ztuGdXTrUNOcU18OMcyC6u/0wKIv93NojNlSfc7NfqycepQ1P
 VJIWgz8IY7xIfPEc4VOYpfScdD5t6JpySJW+pydcZdQXKboFEmLTVlRAfh8/N9CHbGFr
 H+rw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=fr24.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=fr24.com header.i=@fr24.com header.a=rsa-sha256
 header.s=google header.b=emAIDJ13
Subject: [Buildroot] [PATCH] package/zstd: bump to version 1.5.7
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
From: =?utf-8?q?Nuno_Gon=C3=A7alves_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunog@fr24.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogTnVubyBHb27Dp2FsdmVzIDxudW5vZ0BmcjI0LmNvbT4KLS0tCiAuLi5p
eC10eXBvLWluLXRoZS1kZWZpbml0aW9uLW9mLUxJQl9CSU4ucGF0Y2ggfCA0NyAtLS0tLS0tLS0t
LS0tLS0tLS0tCiBwYWNrYWdlL3pzdGQvenN0ZC5oYXNoICAgICAgICAgICAgICAgICAgICAgICAg
fCAgNCArLQogcGFja2FnZS96c3RkL3pzdGQubWsgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1MCBkZWxldGlvbnMoLSkK
IGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3pzdGQvMDAwMS1saWItbGlienN0ZC5tay1maXgt
dHlwby1pbi10aGUtZGVmaW5pdGlvbi1vZi1MSUJfQklOLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS96c3RkLzAwMDEtbGliLWxpYnpzdGQubWstZml4LXR5cG8taW4tdGhlLWRlZmluaXRpb24t
b2YtTElCX0JJTi5wYXRjaCBiL3BhY2thZ2UvenN0ZC8wMDAxLWxpYi1saWJ6c3RkLm1rLWZpeC10
eXBvLWluLXRoZS1kZWZpbml0aW9uLW9mLUxJQl9CSU4ucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDVmYzkzMDEyOGEuLjAwMDAwMDAwMDAKLS0tIGEvcGFja2FnZS96c3RkLzAw
MDEtbGliLWxpYnpzdGQubWstZml4LXR5cG8taW4tdGhlLWRlZmluaXRpb24tb2YtTElCX0JJTi5w
YXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQ3ICswLDAgQEAKLUZyb20gNGRlMjUzNDRmN2MwMWYw
MGQ5OWJjNDY3ZTc2YmM2ZjliNjk3MWRkNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206
IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Ci1EYXRlOiBT
YXQsIDEzIEp1bCAyMDI0IDEzOjUzOjUzICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIGxpYi9saWJ6
c3RkLm1rOiBmaXggdHlwbyBpbiB0aGUgZGVmaW5pdGlvbiBvZiBMSUJfQklORElSCi0KLUNvbW1p
dCBmNGRiZmNlNzljYjJiODJmYjQ5NmZjZDI1MThlY2QzMzE1MDUxYjdkICgiZGVmaW5lIExJQl9T
UkNESVIKLWFuZCBMSUJfQklORElSIikgc2lnbmlmaWNhbnRseSByZXdvcmtlZCB0aGUgYnVpbGQg
bG9naWMsIGJ1dCBpbiBpdHMKLWludHJvZHVjdGlvbiBvZiBMSUJfQklORElSIGEgdHlwbyB3YXMg
bWFkZS4KLQotSXQgd2FzIGludHJvZHVjZWQgYXMgc3VjaDoKLQotK0xJQl9TUkNESVIgPz0gJChk
aXIgJChyZWFscGF0aCAkKGxhc3R3b3JkICQoTUFLRUZJTEVfTElTVCkpKSkKLStMSUJfQklORElS
ID89ICQoTElCU1JDX0RJUikKLQotQnV0IHRoZSBkZWZpbml0aW9uIG9mIExJQl9CSU5ESVIgaGFz
IGEgdHlwbzogaXQgc2hvdWxkIHVzZQotJChMSUJfU1JDRElSKSBub3QgJChMSUJTUkNfRElSKS4K
LQotRHVlIHRvIHRoaXMsICQoTElCX0JJTkRJUikgaXMgZW1wdHksIHRoZXJlZm9yZSBpbiBwcm9n
cmFtcy9NYWtlZmlsZSwKLS1MJChMSUJfQklORElSKSBpcyBleHBhbmRlZCB0byBqdXN0IC1MLCBh
bmQgY29uc2VxdWVudGx5IHdoZW4gdHJ5aW5nCi10byBsaW5rIHRoZSAienN0ZCIgYmluYXJ5IHdp
dGggdGhlIGxpYnpzdGQgbGlicmFyeSwgaXQgY2Fubm90IGZpbmQgaXQ6Ci0KLWhvc3QvbGliL2dj
Yy9wb3dlcnBjNjQtYnVpbGRyb290LWxpbnV4LWdudS8xMy4zLjAvLi4vLi4vLi4vLi4vcG93ZXJw
YzY0LWJ1aWxkcm9vdC1saW51eC1nbnUvYmluL2xkOiBjYW5ub3QgZmluZCAtbHpzdGQ6IE5vIHN1
Y2ggZmlsZSBvciBkaXJlY3RvcnkKLQotVGhpcyBjb21taXQgZml4ZXMgdGhlIGJ1aWxkIGJ5IGZp
eGluZyB0aGlzIHR5cG8uCi0KLVVwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vZmFjZWJvb2sv
enN0ZC9wdWxsLzQwOTYKLVNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+Ci0tLS0KLSBsaWIvbGlienN0ZC5tayB8IDIgKy0KLSAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBh
L2xpYi9saWJ6c3RkLm1rIGIvbGliL2xpYnpzdGQubWsKLWluZGV4IGEzMDhhNmVmLi5jN2FlMmZm
NCAxMDA2NDQKLS0tLSBhL2xpYi9saWJ6c3RkLm1rCi0rKysgYi9saWIvbGlienN0ZC5tawotQEAg
LTIyLDcgKzIyLDcgQEAgTElCWlNURF9NS19JTkNMVURFRCA6PSAxCi0gCi0gIyBCeSBkZWZhdWx0
LCBsaWJyYXJ5J3MgZGlyZWN0b3J5IGlzIHNhbWUgYXMgdGhpcyBpbmNsdWRlZCBtYWtlZmlsZQot
IExJQl9TUkNESVIgPz0gJChkaXIgJChyZWFscGF0aCAkKGxhc3R3b3JkICQoTUFLRUZJTEVfTElT
VCkpKSkKLS1MSUJfQklORElSID89ICQoTElCU1JDX0RJUikKLStMSUJfQklORElSID89ICQoTElC
X1NSQ0RJUikKLSAKLSAjIFpTVERfTElCX01JTklGWSBpcyBhIGhlbHBlciB2YXJpYWJsZSB0aGF0
Ci0gIyBjb25maWd1cmVzIGEgYnVuY2ggb2Ygb3RoZXIgdmFyaWFibGVzIHRvIHNwYWNlLW9wdGlt
aXplZCBkZWZhdWx0cy4KLS0tIAotMi40NS4yCi0KZGlmZiAtLWdpdCBhL3BhY2thZ2UvenN0ZC96
c3RkLmhhc2ggYi9wYWNrYWdlL3pzdGQvenN0ZC5oYXNoCmluZGV4IDhiZTg1YzM1NmEuLjJjZDI2
ZmZjNzcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvenN0ZC96c3RkLmhhc2gKKysrIGIvcGFja2FnZS96
c3RkL3pzdGQuaGFzaApAQCAtMSw1ICsxLDUgQEAKLSMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20v
ZmFjZWJvb2svenN0ZC9yZWxlYXNlcy9kb3dubG9hZC92MS41LjYvenN0ZC0xLjUuNi50YXIuZ3ou
c2hhMjU2Ci1zaGEyNTYgIDhjMjllMDZjZjQyYWFjYzFlYWZjNDA3N2FlMmVjNmM2ZmNiOTZhNjI2
MTU3ZTA1OTNkNWU4MmEzNGZkNDAzYzEgIHpzdGQtMS41LjYudGFyLmd6CisjIEZyb20gaHR0cHM6
Ly9naXRodWIuY29tL2ZhY2Vib29rL3pzdGQvcmVsZWFzZXMvZG93bmxvYWQvdjEuNS43L3pzdGQt
MS41LjcudGFyLmd6LnNoYTI1Ngorc2hhMjU2ICBlYjMzZTUxZjQ5YTE1ZTAyMzk1MGNkNzgyNWNh
NzRhNGEyYjQzZGI4MzU0ODI1YWMyNGZjMWI3ZWUwOWU2ZmEzICB6c3RkLTEuNS43LnRhci5negog
CiAjIExpY2Vuc2UgZmlsZXMgKGxvY2FsbHkgY29tcHV0ZWQpCiBzaGEyNTYgIDcwNTUyNjY0OTc2
MzNjOTAyNWI3NzdjNzhlYjcyMzVhZjEzOTIyMTE3NDgwZWQ1YzY3NDY3N2FkYzM4MWM5ZDggIExJ
Q0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvenN0ZC96c3RkLm1rIGIvcGFja2FnZS96c3RkL3pz
dGQubWsKaW5kZXggYmYwNGI0NzkzYy4uNzBkYTFlNzM1NCAxMDA2NDQKLS0tIGEvcGFja2FnZS96
c3RkL3pzdGQubWsKKysrIGIvcGFja2FnZS96c3RkL3pzdGQubWsKQEAgLTQsNyArNCw3IEBACiAj
CiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1aU1REX1ZFUlNJT04gPSAxLjUuNgorWlNURF9W
RVJTSU9OID0gMS41LjcKIFpTVERfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9mYWNlYm9vay96
c3RkL3JlbGVhc2VzL2Rvd25sb2FkL3YkKFpTVERfVkVSU0lPTikKIFpTVERfSU5TVEFMTF9TVEFH
SU5HID0gWUVTCiBaU1REX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2Ugb3IgR1BMLTIuMAotLSAKMi40
My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
