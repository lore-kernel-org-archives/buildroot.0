Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D9AC02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 13:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E50684CF7;
	Tue, 21 Jan 2025 13:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFuhIfR9xGxI; Tue, 21 Jan 2025 13:49:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE69E84D00
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE69E84D00;
	Tue, 21 Jan 2025 13:49:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86B7CD7
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 13:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FFE4409CF
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 13:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mt5qhZcMyHMT for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 13:49:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3020F407E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3020F407E6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3020F407E6
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 13:49:28 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3862f32a33eso2576013f8f.3
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 05:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737467366; x=1738072166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YU/t2a7t1KGw02vU4LoVZRY5l6KNLkdQlKHxBbdL20c=;
 b=PlPauDxLyIlhd5ZWuYhjDa6FsMdRU6JJEpneCkYmlA9hyb63S+c7c1uks+fcaJZJxC
 C7HxhYvhQkhe02v5GyrpqoADiIJcXs5hD9G7+qIhs+xbM9xStLOZzxJ/gpZg8Q7k5PDF
 0X1kpsHS+VM/ueVnrOQ+SYM3NZGrR02NQGkHIw+t9kEBjck0gqLSPL1Th8lQNId3pokr
 gtpwuUAWRflUu07eU2rpK0rFQC4uD0mOZqHbEdsG/ILn8L123oEt4tJpOnM2V+IkWtMf
 Ws6RW2AN2VfN58wJGvPIQtt2yPK9sJA/rqXSXaNHIeu2gmmKYivyzh7ArKlo9+M+CEuK
 /3Ng==
X-Gm-Message-State: AOJu0Yw9TSUCeLFSPiv0rEcEJdcxX8jhlsmyJKJme25d9GgSqE33QhmL
 rOBJhtYbxNq4S9vszjuRFCLv3t1d8gP65hJF/Sb6X4rcxsbU1mCXoI0tlg==
X-Gm-Gg: ASbGncvauHoFMgkAEuH9GHSSKBkkTF/LrMGk6wEjKpnbQtLTlhYgRNrbJwUSox3HBzX
 RzZ+Nc6ra7pVnR/ADZ7OvU5iZckXsz7qKXz6i+T71ZWrnoDXBxos5/m/ABn9689TIhhFB0ZqKin
 K/48CtKKoxgPxE6q5TAA5iHdaO/SpklYGoWxO7Ku653pL6jVXLg2CPza1X0z8ZDS2wFsKNDQGJR
 o/KnXq/PzeprI2e9vR9VhIfaf5cIjHQSrW7nz3fd/mwoeTe7kLwPXkiNZqs2NZh57/cgmXhteUl
 A6QPn4X+2NMdvnvIjh0SLoZ2DFjjZwpWKQY=
X-Google-Smtp-Source: AGHT+IFv+Iuj7P9lOmFmKpyAcR33f20hVLahB/ZaL+EfZddHL8BdFNeoaUdN6ZkE2HNQ2XRDjqKyPw==
X-Received: by 2002:a05:6000:1faa:b0:385:ed20:3be2 with SMTP id
 ffacd0b85a97d-38bf57b608amr19425097f8f.48.1737467365842; 
 Tue, 21 Jan 2025 05:49:25 -0800 (PST)
Received: from cuervo.intranet.jlsalvador.online ([207.188.147.217])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf322aab8sm13602224f8f.57.2025.01.21.05.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 05:49:25 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>
Date: Tue, 21 Jan 2025 14:47:42 +0100
Message-ID: <20250121134740.2894756-4-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250121134740.2894756-2-salvador.joseluis@gmail.com>
References: <20250121134740.2894756-2-salvador.joseluis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737467366; x=1738072166; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YU/t2a7t1KGw02vU4LoVZRY5l6KNLkdQlKHxBbdL20c=;
 b=iSX8SOv2vpVaAVs+9eRMX8+qs073Tutw8jILnVoo5jRzaPgsqIC+be7LtsdyeNiICf
 DLxhlA7rT3fiuR4CyHMToLApAZMEU0tNsaqy8CAXv3sdHgbImPTutwyyYYYoNlMBWxnB
 9rOhJPU+ynsL9Z7qhH5cC4HMYNooTmdE4/E7F2KcBQOfHdJJVSvLgJj6njLiyNhA5f1P
 x/K4wV5kMigJk3475+SA0dRTHlM4HngR4U6Ahs/nV0BFcsodHOIHi5lG3nqRJsW5CBXk
 0GG80q1rfMp+FsqeKmfAOjXc1t7JYoZlxna/T1uSRf9Iu0WQ97YW7zC2CosRrxzsOxBz
 gADg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iSX8SOv2
Subject: [Buildroot] [PATCH 2/2] support/testing: replace x86-64 with
 aarch64 for ZFS tests
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

UHJldmlvdXNseSwgWkZTIHRlc3RzIHdlcmUgbGltaXRlZCB0byB4ODYtNjQgZHVlIHRvIGxhY2sg
b2YgY3Jvc3MtcGxhdGZvcm0gc3VwcG9ydC4KSG93ZXZlciwgdXBzdHJlYW0gZWZmb3J0cyBoYXZl
IGltcHJvdmVkIGNyb3NzLXBsYXRmb3JtIGNvbXBhdGliaWxpdHkuClVwZGF0ZSB0aGUgWkZTIHRl
c3QgcGxhdGZvcm0gZnJvbSB4ODYtNjQgdG8gYWFyY2g2NCwgYWxpZ25pbmcgaXQgd2l0aCBvdGhl
ciB0ZXN0cy4KClNpZ25lZC1vZmYtYnk6IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFk
b3Iuam9zZWx1aXNAZ21haWwuY29tPgotLS0KIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdl
L3Rlc3RfemZzLnB5IHwgMjIgKysrKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDEyIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3N1cHBvcnQv
dGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2UvdGVzdF96ZnMucHkKaW5kZXggOTY3ZGEwOThlMS4uMWI5MDdhYzRkZSAxMDA2NDQK
LS0tIGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKKysrIGIvc3Vw
cG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKQEAgLTcsMTUgKzcsMTYgQEAg
Y2xhc3MgVGVzdFpmc0Jhc2UoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKICAgICB0aW1lb3V0ID0g
NjAgKiAzCiAgICAgY29uZmlnID0gXAogICAgICAgICAiIiIKLSAgICAgICAgQlIyX3g4Nl82ND15
Ci0gICAgICAgIEJSMl94ODZfY29yZWk3PXkKKyAgICAgICAgQlIyX2FhcmNoNjQ9eQogICAgICAg
ICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKKyAgICAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5B
TF9CT09UTElOPXkKKyAgICAgICAgQlIyX1RBUkdFVF9HRU5FUklDX0dFVFRZX1BPUlQ9InR0eUFN
QTAiCiAgICAgICAgIEJSMl9ST09URlNfREVWSUNFX0NSRUFUSU9OX0RZTkFNSUNfRVVERVY9eQog
ICAgICAgICBCUjJfTElOVVhfS0VSTkVMPXkKICAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNU
T01fVkVSU0lPTj15CiAgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFM
VUU9IjYuMTIuOSIKICAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9VU0VfQ1VTVE9NX0NPTkZJRz15
Ci0gICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0NPTkZJR19GSUxFPSJib2FyZC9xZW11
L3g4Nl82NC9saW51eC5jb25maWciCisgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0NP
TkZJR19GSUxFPSJib2FyZC9xZW11L2FhcmNoNjQtdmlydC9saW51eC5jb25maWciCiAgICAgICAg
IEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9MSUJFTEY9eQogICAgICAgICBCUjJfUEFDS0FH
RV9aRlM9eQogICAgICAgICBCUjJfUEFDS0FHRV9QWVRIT04zPXkKQEAgLTI4LDEzICsyOSwxNCBA
QCBjbGFzcyBUZXN0WmZzQmFzZShpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgogICAgICAgICAiIiIK
IAogICAgIGRlZiBiYXNlX3Rlc3RfcnVuKHNlbGYpOgotICAgICAgICBrZXJuZWwgPSBvcy5wYXRo
LmpvaW4oc2VsZi5idWlsZGRpciwgImltYWdlcyIsICJiekltYWdlIikKKyAgICAgICAga2VybmVs
ID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAiSW1hZ2UiKQogICAgICAg
ICBjcGlvX2ZpbGUgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgImltYWdlcyIsICJyb290
ZnMuY3BpbyIpCiAgICAgICAgIHNlbGYuZW11bGF0b3IuYm9vdCgKLSAgICAgICAgICAgIGFyY2g9
Ing4Nl82NCIsCisgICAgICAgICAgICBhcmNoPSJhYXJjaDY0IiwKICAgICAgICAgICAgIGtlcm5l
bD1rZXJuZWwsCi0gICAgICAgICAgICBrZXJuZWxfY21kbGluZT1bImNvbnNvbGU9dHR5UzAiXSwK
LSAgICAgICAgICAgIG9wdGlvbnM9WyItY3B1IiwgIk5laGFsZW0iLCAiLW0iLCAiMzIwIiwgIi1p
bml0cmQiLCBjcGlvX2ZpbGVdLAorICAgICAgICAgICAga2VybmVsX2NtZGxpbmU9WyJjb25zb2xl
PXR0eUFNQTAiXSwKKyAgICAgICAgICAgIG9wdGlvbnM9WyItTSIsICJ2aXJ0IiwgIi1jcHUiLCAi
Y29ydGV4LWE1NyIsICItbSIsICIzMjBNIiwKKyAgICAgICAgICAgICAgICAgICAgICItaW5pdHJk
IiwgY3Bpb19maWxlXSwKICAgICAgICAgKQogICAgICAgICBzZWxmLmVtdWxhdG9yLmxvZ2luKCkK
IApAQCAtNjQsNyArNjYsNyBAQCBjbGFzcyBUZXN0WmZzQmFzZShpbmZyYS5iYXNldGVzdC5CUlRl
c3QpOgogY2xhc3MgVGVzdFpmc0dsaWJjKFRlc3RaZnNCYXNlKToKICAgICBjb25maWcgPSBUZXN0
WmZzQmFzZS5jb25maWcgKyBcCiAgICAgICAgICIiIgotICAgICAgICBCUjJfVE9PTENIQUlOX0VY
VEVSTkFMX0JPT1RMSU5fWDg2XzY0X0NPUkVfSTdfR0xJQkNfU1RBQkxFPXkKKyAgICAgICAgQlIy
X1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FBUkNINjRfR0xJQkNfU1RBQkxFPXkKICAgICAg
ICAgIiIiCiAKICAgICBkZWYgdGVzdF9ydW4oc2VsZik6CkBAIC03NCw3ICs3Niw3IEBAIGNsYXNz
IFRlc3RaZnNHbGliYyhUZXN0WmZzQmFzZSk6CiBjbGFzcyBUZXN0WmZzVWNsaWJjKFRlc3RaZnNC
YXNlKToKICAgICBjb25maWcgPSBUZXN0WmZzQmFzZS5jb25maWcgKyBcCiAgICAgICAgICIiIgot
ICAgICAgICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU5fWDg2XzY0X0NPUkVfSTdfVUNM
SUJDX1NUQUJMRT15CisgICAgICAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9BQVJD
SDY0X1VDTElCQ19TVEFCTEU9eQogICAgICAgICAiIiIKIAogICAgIGRlZiB0ZXN0X3J1bihzZWxm
KToKQEAgLTg0LDcgKzg2LDcgQEAgY2xhc3MgVGVzdFpmc1VjbGliYyhUZXN0WmZzQmFzZSk6CiBj
bGFzcyBUZXN0WmZzTXVzbChUZXN0WmZzQmFzZSk6CiAgICAgY29uZmlnID0gVGVzdFpmc0Jhc2Uu
Y29uZmlnICsgXAogICAgICAgICAiIiIKLSAgICAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9C
T09UTElOX1g4Nl82NF9NVVNMX1NUQUJMRT15CisgICAgICAgIEJSMl9UT09MQ0hBSU5fRVhURVJO
QUxfQk9PVExJTl9BQVJDSDY0X01VU0xfU1RBQkxFPXkKICAgICAgICAgIiIiCiAKICAgICBkZWYg
dGVzdF9ydW4oc2VsZik6Ci0tIAoyLjQ4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
