Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F2BC0218B
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 09:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D8F481E6F;
	Fri, 24 Jan 2025 09:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBh3G2Igiwhf; Fri, 24 Jan 2025 09:26:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2239481E71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2239481E71;
	Fri, 24 Jan 2025 09:26:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 34FA41167
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 09:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97352612CC
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 09:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tjTtPu-jt0Ve for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 09:26:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E0276112C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E0276112C
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E0276112C
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 09:26:03 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3862e570832so315990f8f.0
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 01:26:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737710761; x=1738315561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q9iKuR0RTX75F5bQiT6jyKM4NMOpIiCp2pbgsFmDXVk=;
 b=ARVSBSoWSXKcNKim1S/yRZEAGMgZGEBARUVLIFN6QDYUNZ8rRjrBZSqGPFuS/qtjum
 VCQlqRZkh6OnbablKj8nokPAf2OEUnTUZZ48p5mESGevftmxY0F/uqp70z1o4pgXo9LO
 saSJGHDk3ZnPJTiPEYFORS08LjAJ1VqrHnkumBeb0xMvRNwwVTsdAW6Ay8DC1Nmaq8lN
 aIevx4ZiWoQpdVdFLFj/3k8n7THCy1iFjpvkDrKQP1AlvLXhAl8dZsB8N3esjmJ5KKZb
 VN4q+RKDT5BI7U1Zuq3x/xPLuBfYXCOGmjoUTB7dV7phAOrGds4IiE08nm3wh5YX23TU
 O8bQ==
X-Gm-Message-State: AOJu0Yw7pXwHISaxx2OhpgSfdWG7OGc2fOovVovm3sxCkn/H1ulsWiiY
 yZwsYQ5w/CgDUF00jx8oACmbZqZlzfQkPGRSr0ICCSIh1pLGtOhyy89t1h5E
X-Gm-Gg: ASbGncuVIOK5TaL9JX3NJJYAKhudAvu6HwwlA0HOFwsyfthkwEx6PYSueWyXqn0fkj8
 /ur8IWshsqATDv65mclvVRmfFdSTtHqS8Hy9KcRKlvYnqfmTaAotx8xPh2100PIg0Bjpz7FNzBQ
 u3DFff+IlepnhTH992fRlf0me22UQhXISX62g4BQX8sXHz0CSDUS0oaOO5XBEUklC42xS4N3D6F
 qEjoj4NnbsD3wceO9kLRaZ6032VLaXDLCQu7PvXs5ftUJI6++XXqkH1fqeV3O7Z1on/d6a6SG4s
 VHaqmS8MHO7EYtI=
X-Google-Smtp-Source: AGHT+IHZ+rJ/HWx+3/tJijURRw7DT7T5ug33TI9jVBOQq7LUE1XBHN0HN6/UhYdEL+ETMVQGARFtnA==
X-Received: by 2002:a05:6000:1889:b0:385:f479:ef46 with SMTP id
 ffacd0b85a97d-38bf57c0dc6mr9185398f8f.13.1737710760512; 
 Fri, 24 Jan 2025 01:26:00 -0800 (PST)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a17650esm2154044f8f.12.2025.01.24.01.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 01:26:00 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
Date: Fri, 24 Jan 2025 10:25:54 +0100
Message-ID: <20250124092554.1547973-2-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250124092554.1547973-1-gael.portay+rtone@gmail.com>
References: <20250124092554.1547973-1-gael.portay+rtone@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737710761; x=1738315561; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q9iKuR0RTX75F5bQiT6jyKM4NMOpIiCp2pbgsFmDXVk=;
 b=bx43/fdpVP9rQ61aLGT3c1t/vIQec/zTHi01PsCNqK+NpDYyYux7pprLoqxZutacpv
 rO0gICWpSzlhoTmIKDOanOC1yn8PtSwOkfdSnVjeU73Elo0cLynPws92utd02221iVfm
 vaifhHwb54Mqv7+MvjvJqfNHQBszhX8qmBHr0TJFTt1Z8jsubssEZLpHICZitxrxq5yA
 TZi9trq+GAedlN/Rs59nhwkMZwPN8KPwlZQ43XhqtQNEGcxjZ/XRzOFS8YexNj56A/t3
 fTWr+GjR7PCBAd0RrkRrM8MLEMOyw7IPkWnap1e5VC4tkTOcf7n83L4m8SSKbgD+046u
 L4Hg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bx43/fdp
Subject: [Buildroot] [PATCH 2/2] package/openssh: split sftp-server from
 server programs
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

VGhlIHNmdHAtc2VydmVyIHByb2dyYW0gaXMgYSBzdGFuZGFsb25lIHByb2dyYW0gdGhhdCBpcyBv
ZnRlbiB1c2VkIGJ5CmNsaWVudHMgdG8gc2NwIHRoaW5ncyB0byBzZXJ2ZXIsIGV2ZW4gdXNpbmcg
dGhlIGRyb3BiZWFyIFNTSCBzZXJ2ZXIuCgpFbmFibGluZyBib3RoIGRyb3BiZWFyIGFuZCB0aGUg
b3BlbnNzaCBzZXJ2ZXIgcHJvZ3JhbXMgaW5zdGFsbHMgdGhlIGluaXQKb3Igc2VydmljZSBmaWxl
cyBmb3IgYm90aCBTU0ggc2VydmVycy4KClRoZSBpbml0LW1hbmFnZXIgcHVsbHMgYm90aCBzZXJ2
aWNlcyBhdCBzdGFydHVwIGJ1dCBvbmx5IGEgc2luZ2xlIGRhZW1vbgpjYW4gYmluZCBhdCBhIHRp
bWUgdG8gcG9ydCAyMiwgdGhlIGxhdGVyIGZhaWxzLgoKVGhpcyBzcGxpdHMgdGhlIHNmdHAtc2Vy
dmVyIGZyb20gdGhlIHNlcnZlciBwcm9ncmFtcyBzbyBvbmUgY2FuIGVuYWJsZQp0aGUgZHJvcGJl
YXIgU1NIIHNlcnZlciB3aXRoIHRoZSBvcGVuc3NoIHNmdHAtc2VydmVyIHdpdGhvdXQgcHVsbGlu
ZyB0aGUKb3BlbnNzaCBzZXJ2ZXIuCgpGaXhlczoKCgkgICAgICAgICBTdGFydGluZyBPcGVuU1NI
IHNlcnZlciBkYWVtb24uLi4KCVsgIE9LICBdIFN0YXJ0ZWQgRHJvcGJlYXIgU1NIIGRhZW1vbi4K
CVtGQUlMRURdIEZhaWxlZCB0byBzdGFydCBPcGVuU1NIIHNlcnZlciBkYWVtb24uCglTZWUgJ3N5
c3RlbWN0bCBzdGF0dXMgc3NoZC5zZXJ2aWNlJyBmb3IgZGV0YWlscy4KCgkoLi4uKQoKCWJ1aWxk
cm9vdCBzeXN0ZW1kWzFdOiBTdGFydGluZyBPcGVuU1NIIHNlcnZlciBkYWVtb24uLi4KCWJ1aWxk
cm9vdCBzeXN0ZW1kWzFdOiBTdGFydGVkIE9wZW5TU0ggc2VydmVyIGRhZW1vbi4KCWJ1aWxkcm9v
dCBzc2hkWzI5N106IEJpbmQgdG8gcG9ydCAyMiBvbiAwLjAuMC4wIGZhaWxlZDogQWRkcmVzcyBh
bHJlYWR5IGluIHVzZS4KCWJ1aWxkcm9vdCBzc2hkWzI5N106IEJpbmQgdG8gcG9ydCAyMiBvbiA6
OiBmYWlsZWQ6IEFkZHJlc3MgYWxyZWFkeSBpbiB1c2UuCglidWlsZHJvb3Qgc3NoZFsyOTddOiBD
YW5ub3QgYmluZCBhbnkgYWRkcmVzcy4KCWJ1aWxkcm9vdCBzeXN0ZW1kWzFdOiBzc2hkLnNlcnZp
Y2U6IE1haW4gcHJvY2VzcyBleGl0ZWQsIGNvZGU9ZXhpdGVkLCBzdGF0dXM9MjU1L0VYQ0VQVElP
TgoJYnVpbGRyb290IHN5c3RlbWRbMV06IHNzaGQuc2VydmljZTogRmFpbGVkIHdpdGggcmVzdWx0
ICdleGl0LWNvZGUnLgoKU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheSty
dG9uZUBnbWFpbC5jb20+Ci0tLQogcGFja2FnZS9vcGVuc3NoL0NvbmZpZy5pbiAgfCA5ICsrKysr
KysrLQogcGFja2FnZS9vcGVuc3NoL29wZW5zc2gubWsgfCA4ICsrKysrKystCiAyIGZpbGVzIGNo
YW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9vcGVuc3NoL0NvbmZpZy5pbiBiL3BhY2thZ2Uvb3BlbnNzaC9Db25maWcuaW4KaW5kZXgg
MzhiN2Y2OGE1Yi4uYmUxZGI5OTM4MiAxMDA2NDQKLS0tIGEvcGFja2FnZS9vcGVuc3NoL0NvbmZp
Zy5pbgorKysgYi9wYWNrYWdlL29wZW5zc2gvQ29uZmlnLmluCkBAIC0xOSwxMiArMTksMTkgQEAg
Y29uZmlnIEJSMl9QQUNLQUdFX09QRU5TU0hfQ0xJRU5UCiAJICBDbGllbnQgcHJvZ3JhbXM6IHNz
aCwgc2NwLCBzZnRwLCBzc2gtYWdlbnQsIHNzaC1hZGQsCiAJICBzc2gtY29weS1pZC4KIAorY29u
ZmlnIEJSMl9QQUNLQUdFX09QRU5TU0hfU0ZUUF9TRVJWRVIKKwlib29sICJzZnRwIHNlcnZlciIK
KwlkZWZhdWx0IHkKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCWENSWVBUIGlmIEJSMl9UT09MQ0hB
SU5fVVNFU19HTElCQworCWhlbHAKKwkgIFNGVFAgU2VydmVyIHByb2dyYW0uCisKIGNvbmZpZyBC
UjJfUEFDS0FHRV9PUEVOU1NIX1NFUlZFUgogCWJvb2wgInNlcnZlciIKIAlkZWZhdWx0IHkKIAlz
ZWxlY3QgQlIyX1BBQ0tBR0VfTElCWENSWVBUIGlmIEJSMl9UT09MQ0hBSU5fVVNFU19HTElCQwog
CWhlbHAKLQkgIFNlcnZlciBwcm9ncmFtczogc3NoZCwgc3NoZC1zZXNzaW9uLCBzZnRwLXNlcnZl
cgorCSAgU2VydmVyIHByb2dyYW1zOiBzc2hkLCBzc2hkLXNlc3Npb24uCiAKIGNvbmZpZyBCUjJf
UEFDS0FHRV9PUEVOU1NIX0tFWV9VVElMUwogCWJvb2wgImtleSB1dGlsaXRpZXMiCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5tayBiL3BhY2thZ2Uvb3BlbnNzaC9vcGVuc3No
Lm1rCmluZGV4IDk1YzA1OWUwM2QuLmMyOTQ1N2I3ZjkgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvb3Bl
bnNzaC9vcGVuc3NoLm1rCisrKyBiL3BhY2thZ2Uvb3BlbnNzaC9vcGVuc3NoLm1rCkBAIC0xMTQs
MTEgKzExNCwxNyBAQCBlbmRlZgogT1BFTlNTSF9QT1NUX0lOU1RBTExfVEFSR0VUX0hPT0tTICs9
IE9QRU5TU0hfSU5TVEFMTF9DTElFTlRfUFJPR1JBTVMKIGVuZGlmCiAKK2lmZXEgKCQoQlIyX1BB
Q0tBR0VfT1BFTlNTSF9TRlRQX1NFUlZFUikseSkKK2RlZmluZSBPUEVOU1NIX0lOU1RBTExfU0ZU
UF9TRVJWRVJfUFJPR1JBTQorCSQoSU5TVEFMTCkgLUQgLW0gMDc1NSAkKEBEKS9zZnRwLXNlcnZl
ciAkKFRBUkdFVF9ESVIpL3Vzci9saWJleGVjL3NmdHAtc2VydmVyCitlbmRlZgorT1BFTlNTSF9Q
T1NUX0lOU1RBTExfVEFSR0VUX0hPT0tTICs9IE9QRU5TU0hfSU5TVEFMTF9TRlRQX1NFUlZFUl9Q
Uk9HUkFNCitlbmRpZgorCiBpZmVxICgkKEJSMl9QQUNLQUdFX09QRU5TU0hfU0VSVkVSKSx5KQog
ZGVmaW5lIE9QRU5TU0hfSU5TVEFMTF9TRVJWRVJfUFJPR1JBTVMKIAkkKElOU1RBTEwpIC1EIC1t
IDA3NTUgJChARCkvc3NoZCAkKFRBUkdFVF9ESVIpL3Vzci9zYmluL3NzaGQKIAkkKElOU1RBTEwp
IC1EIC1tIDA3NTUgJChARCkvc3NoZC1zZXNzaW9uICQoVEFSR0VUX0RJUikvdXNyL2xpYmV4ZWMv
c3NoZC1zZXNzaW9uCi0JJChJTlNUQUxMKSAtRCAtbSAwNzU1ICQoQEQpL3NmdHAtc2VydmVyICQo
VEFSR0VUX0RJUikvdXNyL2xpYmV4ZWMvc2Z0cC1zZXJ2ZXIKIGVuZGVmCiBPUEVOU1NIX1BPU1Rf
SU5TVEFMTF9UQVJHRVRfSE9PS1MgKz0gT1BFTlNTSF9JTlNUQUxMX1NFUlZFUl9QUk9HUkFNUwog
Ci0tIAoyLjQ4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
