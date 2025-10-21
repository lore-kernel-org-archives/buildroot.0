Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8814CCD1AA
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 12:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DD6360A40;
	Tue, 21 Oct 2025 12:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wFbCeIlU07fi; Tue, 21 Oct 2025 12:04:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A157B60A8B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A157B60A8B;
	Tue, 21 Oct 2025 12:04:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D87770A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 12:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E68FC60903
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 12:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvNZ-sSBEMyh for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 12:04:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3022B6085D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3022B6085D
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3022B6085D
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 12:04:01 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4710683a644so48977665e9.0
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761048239; x=1761653039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RHIGhUvXPF1T6NW7cEb5ljBb7tN/fjRxXogxjtZsahg=;
 b=metsC4bznUAUZwP6jrbEVqGr071yUHc//UuwHApfnF7nUV7n5m2tBtbvk8BqEr7KiK
 qbhcWzTyG9jfS7gBrkIHHgd4bH4GrTnjI2zGvKVN7f6bA7o78pMAVCFfqvCHc7zEYlSr
 JfnnPLcqVph5oUqDrD8LocPfJD5B/FquEDt4aTfi/MwEdRqDTsjXymTbnlN6OUMnIHwu
 3b8YWlraWvaBDLOKKHH7vhIwIzQneWD0uv1tAmow0AfDb8yyZMbYXgbOA+GiaTMcoL5F
 E1wb3X2pR96pQvC2JhxTwACXoH8r8lnlr9mGMLSoiFgRMscKIb6lcpDASA9SdYoyhe6w
 aKpg==
X-Gm-Message-State: AOJu0Yyp2pVHk5bVvQX9Kh5/3n4dQ1MPVOLZ2GZifVUAiDE0iphEsvY/
 HWtWtRAuUE0dKMJTa6qSBpjxz76QVxSThwwlmIlnmLTUdtdg2UxzDkZmKWOfBA==
X-Gm-Gg: ASbGncsRGMXFN9HOJ2e1ibSL6yePa1C4ZBZvyJfXZuVlMmKNAy3m5gtEk16S/M+sAvu
 9Mn+YMfWN1BYOjJZTr0bxRiCuSkp7w5K77RJqsbQyWCaIQAJPLRcxPiF57jRqsLPa3clDzSfRnN
 pdhmnjjOO0+g2i+AUzhHPJcAbQsvH6H4YBZKtEgBhBnCzggh+AOArWYJPkuvvZEJRFffEoRXXA/
 /sPKu/JSMlQemWzFUcvYOjhVxNvSxCURb6FYttDa/hnXT52HZb1qYCSf6z0dE61HBbnYnF1gKRQ
 v+IVGtiUF5xmnY4VJmx26PH3BCfPlmh0nUmuakfVwo3GMyHxkI8PE5+ITeW78XPVxaygTYdBEzj
 Mqe3p9giD8coyzBe7AKvcUT6B3p3wileV6Tw9idgj1DCoHQPc6bE9kg+pggmFSUZ+j7wpXCpgSA
 FEog==
X-Google-Smtp-Source: AGHT+IEp5F9KdFmBnymIDzAcJazhaV1UXJ5TlnbG1y/7kl8vlyoFQw2/CIsgU0lnqF9WFm6k0mNHvA==
X-Received: by 2002:a05:600c:6384:b0:471:846:80ac with SMTP id
 5b1f17b1804b1-471173460a3mr126386085e9.18.1761048238982; 
 Tue, 21 Oct 2025 05:03:58 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:7dc:f6df:77e5:8474])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471529598c9sm192462405e9.5.2025.10.21.05.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 05:03:58 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>,
	Maxime Leroy <maxime@leroys.fr>
Date: Tue, 21 Oct 2025 14:03:39 +0200
Message-ID: <20251021120342.483933-3-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021120342.483933-1-maxime@leroys.fr>
References: <20251021120342.483933-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761048239; x=1761653039; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RHIGhUvXPF1T6NW7cEb5ljBb7tN/fjRxXogxjtZsahg=;
 b=kPJhTE2uG5tcYF/0AyzEV8dqe8f7xP9OoK5tlfKTSeI8q9RdJJ5WOmYKGgyI8418sw
 9kNCzb69AKdhMRRdCFf2Vs87kqTVqV6Ulix0Cv7t25O5o0xUScPwbUZIS0aEelKyDY2E
 REuAhVTjarvJadbnZzT+YDjShqvswQEYjvmeofiVLja45Ozs6eke3n3usAQjXesf5mCs
 GyKvNhVNaHB7O5uvD7xqM6KEVY1+j/H223FB/vbjyfDhTqlJd7vKkgfR4x5Ej8O7vudu
 AruaFdgF1z2XBvWD++EG2eUiL3EsgiBWzPolHGDC7Rzcu6+3E1qW7NV703hQmKTqypGO
 /rOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kPJhTE2u
Subject: [Buildroot] [PATCH 2/5] package/dpdk: add toggle for deprecated
 kernel modules
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

RXhwb3NlIEJSMl9QQUNLQUdFX0RQREtfRU5BQkxFX0tNT0RTIHRvIHBhc3MgTWVzb24gLURlbmFi
bGVfa21vZHM9LgpUaGlzIGNvbnRyb2xzIGJ1aWxkaW5nIERQREvigJlzIG91dC1vZi10cmVlIGtl
cm5lbCBtb2R1bGVzLCB3aGljaCBhcmUKZGVwcmVjYXRlZCB1cHN0cmVhbSBhbmQgc2NoZWR1bGVk
IGZvciByZW1vdmFsLgoKU2lnbmVkLW9mZi1ieTogTWF4aW1lIExlcm95IDxtYXhpbWVAbGVyb3lz
LmZyPgotLS0KIHBhY2thZ2UvZHBkay9Db25maWcuaW4gfCA3ICsrKysrKysKIHBhY2thZ2UvZHBk
ay9kcGRrLm1rICAgfCA3ICsrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZHBkay9Db25maWcuaW4gYi9wYWNrYWdlL2RwZGsvQ29u
ZmlnLmluCmluZGV4IDdkNGEwMDIwMDIuLjVlOGYyZTAwMWIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
ZHBkay9Db25maWcuaW4KKysrIGIvcGFja2FnZS9kcGRrL0NvbmZpZy5pbgpAQCAtNDMsNiArNDMs
MTMgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0RQREtfRVhBTVBMRVMKIGNvbmZpZyBCUjJfUEFDS0FH
RV9EUERLX1RFU1RTCiAJYm9vbCAiSW5zdGFsbCB0ZXN0cyIKIAorY29uZmlnIEJSMl9QQUNLQUdF
X0RQREtfRU5BQkxFX0tNT0RTCisJYm9vbCAiQnVpbGQgRFBESyBrZXJuZWwgbW9kdWxlcyAoZGVw
cmVjYXRlZCkiCisJaGVscAorCSAgRW5hYmxlIHRvIGJ1aWxkIGNvbnRyb2wgb3V0LW9mLXRyZWUg
a2VybmVsIG1vZHVsZXMgKGUuZy4KKwkgIGxlZ2FjeSB1aW8va25pKS4gVXBzdHJlYW0gbWFya3Mg
dGhpcyBvcHRpb24gYXMgZGVwcmVjYXRlZAorCSAgYW5kIGl0IHdpbGwgYmUgcmVtb3ZlZCBpbiBh
IGZ1dHVyZSByZWxlYXNlLgorCiBlbmRpZgogCiBjb21tZW50ICJkcGRrIG5lZWRzIGEgZ2xpYmMg
dG9vbGNoYWluIHcvIHRocmVhZHMsIGdjYyA+PSA0LjksIGhlYWRlcnMgPj0gNC4xOSIKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvZHBkay9kcGRrLm1rIGIvcGFja2FnZS9kcGRrL2RwZGsubWsKaW5kZXgg
MWM3ZWFkYTkzNy4uMzBkNWJjYzljYSAxMDA2NDQKLS0tIGEvcGFja2FnZS9kcGRrL2RwZGsubWsK
KysrIGIvcGFja2FnZS9kcGRrL2RwZGsubWsKQEAgLTUzLDYgKzUzLDEzIEBAIGVsc2UKIERQREtf
Q09ORl9PUFRTICs9IC1EdGVzdHM9ZmFsc2UKIGVuZGlmCiAKKyMgS2VybmVsIG1vZHVsZXMgKGRl
cHJlY2F0ZWQgdXBzdHJlYW0pCitpZmVxICgkKEJSMl9QQUNLQUdFX0RQREtfRU5BQkxFX0tNT0RT
KSx5KQorRFBES19DT05GX09QVFMgKz0gLURlbmFibGVfa21vZHM9dHJ1ZQorZWxzZQorRFBES19D
T05GX09QVFMgKz0gLURlbmFibGVfa21vZHM9ZmFsc2UKK2VuZGlmCisKIGlmZXEgKCQoQlIyX1BB
Q0tBR0VfTElCQlNEKSx5KQogRFBES19ERVBFTkRFTkNJRVMgKz0gbGliYnNkCiBlbmRpZgotLSAK
Mi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
