Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19F2C0218A
	for <buildroot@archiver.kernel.org>; Sat,  1 Feb 2025 14:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F37684B9E;
	Sat,  1 Feb 2025 14:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7cNzRtMYTSEl; Sat,  1 Feb 2025 14:51:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93A9C84BA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93A9C84BA2;
	Sat,  1 Feb 2025 14:51:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AE9712A
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 14:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D79C6FB3C
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 14:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DVrdGKmS5hXW for <buildroot@buildroot.org>;
 Sat,  1 Feb 2025 14:51:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 53BDF60848
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53BDF60848
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53BDF60848
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 14:51:36 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5dc191ca8baso628182a12.1
 for <buildroot@buildroot.org>; Sat, 01 Feb 2025 06:51:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738421494; x=1739026294;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5VW++MQn0aUBs0vReC/A8EPWOJ56hFClCSEKd/1oXl8=;
 b=ZcFgHWhAIN6zkJsAJ6meQD0TSzDhYiKfvrT1Lggo2Inl1wSdu0iH23jdrZpNI3WE8G
 oMafcr3FoRQrTo/AMn1zg+furpS4GigpBgM6UVOMlnYCcTzfIBnP5PoSSmsqW6Zp/v1e
 a73or/VrNx3DhPp/oLbdyBdKY+O/vl3dvjvwKTqC9GAPrpm1dGSxmBJkbWwRC8mf0LrQ
 8/0Gjvlsasru7ur+ZfXWc6OFzvkjaZkQ+J9hSmrW4Om4sHYD+yaBRlgHXRnc05j+V9sg
 qcnH1pDg/b2vJE0edPnR/QQpVpOpd1KDXI934T2vjRvj4VaHhaiI1A8qTaw6jvt/IObo
 fjxg==
X-Gm-Message-State: AOJu0YyGicwUPEeiQTYyuwXmbSqdHkSg/jCyg+/fjva+iS3fH9LtuHBC
 poeHELpz1dDqRYCpuZYOmfhYF6o59TQ5HmQyffTgx9HYP+D4P+DCiyEMgKW9RrM=
X-Gm-Gg: ASbGncsnqRoU5Hqs+hzeoIlImWFD/B8M4u7+rVEMTemSF/mbiKSXuRBoiMwtuGCpkCk
 KERBmQhhyIeQNTH9VubAyGHyYrCzDayxr6bDEoyFcOjSPUz/6iHXVtgxAMhO6z/AWrVoLVYD+hn
 LrpnJ01wySyAarO/qSbiGL1TtOkTMkAXUJZHpbBrpRDVBvhjVoPOywRiGxtj1vXSM0PrQfaT/CM
 TXM/Mrb7XRA4ZcegA5Q2Gpg4buC0xeE31m2iz5MQw736oXHMzaw0TTwbDiZtZB/0jdbDInPRwTZ
 /h+Vm11yt6n6WT/Nur6tzB1o1Fg=
X-Google-Smtp-Source: AGHT+IFYNogWds1skTaysf7Y9dVussxKNf563fIzMCphfhVqnRhEIvqfcRNygBbyQyflly69tF7MYA==
X-Received: by 2002:a17:907:7da6:b0:aa6:6f12:aa45 with SMTP id
 a640c23a62f3a-ab6e0426b34mr494964266b.7.1738421493587; 
 Sat, 01 Feb 2025 06:51:33 -0800 (PST)
Received: from archlinux.. ([2001:67c:1810:f055:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47ceb47sm449514266b.42.2025.02.01.06.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 06:51:33 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  1 Feb 2025 15:51:27 +0100
Message-ID: <20250201145129.921266-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738421494; x=1739026294; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=5VW++MQn0aUBs0vReC/A8EPWOJ56hFClCSEKd/1oXl8=;
 b=ksIU+mPoIaYfwH3oweRXRR0C+3CNVMeOycFM7EOZhZttIzpEhxmMYxVtLOtnkL018m
 gdCOTQEzEPO0ITAemioEhO+1S1etTZCAaScACS08d8QQh65/KSsc4Db+h8RwHtZOM1J+
 qSC9ZPqwp0Lppdi28ZlhxwfD62KuzX0o5eLjGuvL/GLdAUKM4/N0g3amoboME638esyH
 gp9du6z45Qhxbr/AJHBaLjxPdYuZKWj18AHDnzTPhLanoARuE4zAd6Mv2NbbNamdPOsu
 nIAbNHS6F2w3N4r2gA2EQ6sOq/z4fXx/K7UurQlF/cPolhEyi837XJiKopU5hIJ2rp0B
 PIlA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ksIU+mPo
Subject: [Buildroot] [PATCH v3 0/2] configs/raspberrypizero2w_64: new
 defconfig
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

SGVsbG8sCgpUaGlzIHBhdGNoIHNlcmllIGFkZHMgdGhlIGRlZmNvbmZpZyB0byBidWlsZCBhbiBp
bWFnZSBmb3IgdGhlIFJhc3BiZXJyeQpQaSBaZXJvIDIgVyAoNjQtYml0KS4KClRoZSBmaXJzdCBw
YXRjaCBhZGRzIG15c2VsZiBhcyBkZXZlbG9wZXIgZm9yIGV2ZXJ5IHJhc3BiZXJyeXBpCmRlZmNv
bmZpZ3MuCgpUaGUgc2Vjb25kIGFuZCBsYXN0IHBhdGNoIGFkZHMgdGhlIGRlZmNvbmZpZy4KCiAg
ICAjIHVuYW1lIC1hCiAgICBMaW51eCBidWlsZHJvb3QgNi42LjI4LXY4ICMxIFNNUCBQUkVFTVBU
IFNhdCBGZWIgIDEgMTA6NTY6MDggQ0VUIDIwMjUgYWFyY2g2NCBHTlUvTGludXgKICAgICMgY2F0
IC9zeXMvZmlybXdhcmUvZGV2aWNldHJlZS9iYXNlL2NvbXBhdGlibGUgCiAgICByYXNwYmVycnlw
aSxtb2RlbC16ZXJvLTItd2JyY20sYmNtMjgzNwoKQ2hhbmdlcyBzaW5jZSB2MToKIC0gQWRkIHBh
dGNoIHRvIHJlbW92ZSB1bm5lY2Vzc2FyeSBzeW1saW5rcwogLSBBZGQgcGF0Y2ggdG8gYWRkIG15
c2VsZiBhcyBkZXZlbG9wZXIgZm9yIGV2ZXJ5IHJhc3BiZXJyeXBpCiAtIFJlbW92ZSBtZXJnZWQg
cGF0Y2ggcmV3b3JkaW5nIGNvbnNvbGUgY29tbWVudAogLSBSZXRpdGxlIGNvbW1pdCBtZXNzYWdl
IGNvcnJlY3RseQoKQ2hhbmdlcyBzaW5jZSB2MjoKIC0gUmVtb3ZlIHBhdGNoIHRvIHJlbW92ZSBh
Y3R1YWxseSB1c2VkIHN5bWxpbmtzCiAtIFVzZSByYXNwZXJyeXBpemVybzJ3LTY0IHN5bWxpbmsg
aW4gZGVmY29uZmlnCiAtIFJlZ2VuZXJhdGUgZGVmY29uZmlnIHRvIHJlbW92ZSBhbm5vdGF0aW9u
cwoKUmVnYXJkcywKR2HDq2wgUE9SVEFZICgyKToKICBERVZFTE9QRVJTOiBhZGQgbXlzZWxmIGFz
IGRldmVsb3BlciBmb3IgcmFzcGJlcnJ5cGkKICBjb25maWdzL3Jhc3BiZXJyeXBpemVybzJ3XzY0
OiBuZXcgZGVmY29uZmlnCgogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgNCArKysKIGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ196ZXJvMndfNjRiaXQudHh0IHwg
MzIgKysrKysrKysrKysrKysrKysrKysrKysKIGJvYXJkL3Jhc3BiZXJyeXBpemVybzJ3LTY0ICAg
ICAgICAgICAgICAgIHwgIDEgKwogY29uZmlncy9yYXNwYmVycnlwaXplcm8yd182NF9kZWZjb25m
aWcgICAgfCAzMSArKysrKysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDY4IGlu
c2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9yYXNwYmVycnlwaS9jb25maWdf
emVybzJ3XzY0Yml0LnR4dAogY3JlYXRlIG1vZGUgMTIwMDAwIGJvYXJkL3Jhc3BiZXJyeXBpemVy
bzJ3LTY0CiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmlncy9yYXNwYmVycnlwaXplcm8yd182NF9k
ZWZjb25maWcKCi0tIAoyLjQ4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
