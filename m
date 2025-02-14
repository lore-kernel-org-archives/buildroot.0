Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD12C021A6
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 11:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67B5F40E0E;
	Fri, 14 Feb 2025 11:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OtV1yg1CbRHr; Fri, 14 Feb 2025 11:11:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6F05415AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6F05415AF;
	Fri, 14 Feb 2025 11:11:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B99CC2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D241C6F80C
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0PDT-l4bZUqB for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 11:10:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D3C866F7F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3C866F7F8
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3C866F7F8
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:10:50 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ab7f9d87b96so292832666b.3
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 03:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739531448; x=1740136248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SteEr4Fo27zw8tDPGmekxqLibwgHda0iiSGR5rnPcqY=;
 b=cTcL2/7gZa7PotsWwSzLY62jZE5u8LUjCeDYig/PHQZxO9z5MRN11uQ0RofHBOmVJD
 KWuXIqtpjznWTY2pnXr5QyPNK0zrTOYaiYr5kZqN8zeM/8HutIh1JZRKFfkEvKWlgpQz
 69m/t6ov9mglxPXNnwBS3i8ZYCL1d5K2Nb+V7S/ZyJ9vvjazzO7BHu8bPegA6y/sx9Uo
 0qY6EZy6hN7Bb4DspoKR3uMf3KuWJxScF+75N8CtwMZvSWigaVz/DPbxYPgSvx/8tJh1
 VG9/J5sygRa0dhR8u4968ukPD0IN46McIhaRgKNqv/pcoH9Ybbv5DVG4B1iv9YQU9j4Q
 xuOg==
X-Gm-Message-State: AOJu0YznivyqmK5EyH++iM7VYL7qIOPp/wDSmFLS+86PiAnrnpb4smOn
 l9AkyhgwCnCY3207qXmVD0dy2Jw5JmZYhSAfkSenSi/7NYZ8Hp4+C9XpfWGe2uMwzZJ9CLBkbVT
 +1+k=
X-Gm-Gg: ASbGncsESeEYThnfrH4R4sJAKJI8lO9qb52EMuvffaAxZHDD50rOAMcAuT7JxRO829P
 iOWswx6M11JZvc5lepl0RjO5vYKTkH9A5AhKVqekjqjHAQK9Hf4158bZmneVLHD8T4vDY5pD0sR
 Qbkeub3MT+3ORuaRAfuuH6DbVJvNRUyt8hnysQllI7YziT/DviUg139LcMLNDBHxbLrxP4TyolA
 flRAyKLTy1dYZYgW0LXbFiT0vS9KHFwl3IS9P2UYfw3VFm1+UyzvSpnd84DGWL/KvD8Yc2Dgio+
 yU6zM/0pITvMx6QsKw==
X-Google-Smtp-Source: AGHT+IF+NgbzU9bFoubl7Ca2oot+u58lLW7H6dslElD+b/WjNUYaeubP0PgXo9n0DfXOvQ33QYJOIA==
X-Received: by 2002:a17:907:3e13:b0:ab7:5cc9:66fc with SMTP id
 a640c23a62f3a-ab7f34e62f5mr1099071566b.50.1739531448398; 
 Fri, 14 Feb 2025 03:10:48 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53397f47sm320162066b.127.2025.02.14.03.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 03:10:46 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9F2F7619C8;
 Fri, 14 Feb 2025 11:10:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Fri, 14 Feb 2025 11:10:41 +0000
Message-Id: <20250214111044.4096837-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250214111044.4096837-1-alex.bennee@linaro.org>
References: <20250214111044.4096837-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739531448; x=1740136248; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SteEr4Fo27zw8tDPGmekxqLibwgHda0iiSGR5rnPcqY=;
 b=VGYVooqtTRsLBCtnEePiEtSBCAyRawZy90w0K2yOZyKYKrwTq3FHBLcqSaoAHWEzOs
 Qth2jQLaLNE9sOoksUCWG6lq0efCaMHP0ickEhbUf0HfUVRVd4wjjEqbww4DqLi51Xp+
 TtDrPTiC4DLzu1et7Fp+CvtZxwWx402WInUOeMakDKrx8a9G/g4TBf3jEFYhBDJGGJ5A
 i8Ihe7Cc6geQHkpkFarSddp0Uph+yABjTq5o/I8DgGESsRyiEDEzPazD849f4fgCy/vP
 4OodWjcI8v3/HT3Zlx6R3kEF8k5qxl8l868JcApbeYVoAld+7jEwkMCidlXSj7bOX9sW
 7FXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=VGYVooqt
Subject: [Buildroot] [PATCH v3 5/7] package/vulkan-tools: suppress isystem
 being passed
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

VGhpcyBhcHBsaWVzIE5PX1NZU1RFTV9GUk9NX0lNUE9SVEVEIDEgdG8gdGhlIHZ1bGthbmluZm8g
YnVpbGQgdG8KcHJldmVudCAtaXN5c3RlbSBiZWluZyBwYXNzZWQsIGJyZWFraW5nIHRoZSBidWls
ZCB3aXRoOgoKICAuLi4gYWFyY2g2NC1idWlsZHJvb3QtbGludXgtZ251L2luY2x1ZGUvYysrLzE0
LjIuMC9jc3RkbGliOjc5OjE1OiBmYXRhbCBlcnJvcjogc3RkbGliLmg6IE5vIHN1Y2ggZmlsZSBv
ciBkaXJlY3RvcnkKICAgICA3OSB8ICNpbmNsdWRlX25leHQgPHN0ZGxpYi5oPgogICAgICAgIHwg
ICAgICAgICAgICAgICBefn5+fn5+fn5+CiAgY29tcGlsYXRpb24gdGVybWluYXRlZC4KClNpZ25l
ZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KLS0tCiAuLi5h
bmluZm8tc3VwcHJlc3MtaXN5c3RlbS1iZWluZy1wYXNzZWQucGF0Y2ggfCA1NyArKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvdnVsa2FuLXRvb2xzLzAwMDEtdnVsa2FuaW5mby1zdXBwcmVzcy1pc3lz
dGVtLWJlaW5nLXBhc3NlZC5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdnVsa2FuLXRvb2xz
LzAwMDEtdnVsa2FuaW5mby1zdXBwcmVzcy1pc3lzdGVtLWJlaW5nLXBhc3NlZC5wYXRjaCBiL3Bh
Y2thZ2UvdnVsa2FuLXRvb2xzLzAwMDEtdnVsa2FuaW5mby1zdXBwcmVzcy1pc3lzdGVtLWJlaW5n
LXBhc3NlZC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4yNmY4
YzRhNTVmCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS92dWxrYW4tdG9vbHMvMDAwMS12dWxr
YW5pbmZvLXN1cHByZXNzLWlzeXN0ZW0tYmVpbmctcGFzc2VkLnBhdGNoCkBAIC0wLDAgKzEsNTcg
QEAKK0Zyb20gOTMyYTk5MDJmOTIzYWEwYjY0MjNjZWVlOGZiMDI4OTY2NWExZDE1NyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206ID0/VVRGLTg/cT9BbGV4PTIwQmVubj1DMz1BOWU/PSA8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KK0RhdGU6IEZyaSwgMTQgRmViIDIwMjUgMTA6NDQ6NTgg
KzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0gdnVsa2FuaW5mbzogc3VwcHJlc3MgLWlzeXN0ZW0gYmVp
bmcgcGFzc2VkCitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBj
aGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK0R1cmluZyB0
aGUgcHJvY2VzcyBvZiB1cGRhdGluZyB2dWxrYW4tdG9vbHMgaW4gYnVpbGRyb290IEkgcmFuIGlu
dG8KK3RoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZToKKworICBbIDUwJV0gQnVpbGRpbmcgQ1hY
IG9iamVjdCB2dWxrYW5pbmZvL0NNYWtlRmlsZXMvdnVsa2FuaW5mby5kaXIvdnVsa2FuaW5mby5j
cHAubworICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gL2hvbWUvYWxleC9sc3JjL3Rlc3RzL2J1aWxk
cm9vdC5naXQvYnVpbGRzL2FybTY0L2hvc3QvYWFyY2g2NC1idWlsZHJvb3QtbGludXgtZ251L2lu
Y2x1ZGUvYysrLzE0LjIuMC9iaXRzL3N0bF9hbGdvLmg6NzEsCisgICAgICAgICAgICAgICAgICAg
ZnJvbSAvaG9tZS9hbGV4L2xzcmMvdGVzdHMvYnVpbGRyb290LmdpdC9idWlsZHMvYXJtNjQvaG9z
dC9hYXJjaDY0LWJ1aWxkcm9vdC1saW51eC1nbnUvaW5jbHVkZS9jKysvMTQuMi4wL2FsZ29yaXRo
bTo2MSwKKyAgICAgICAgICAgICAgICAgICBmcm9tIC9ob21lL2FsZXgvbHNyYy90ZXN0cy9idWls
ZHJvb3QuZ2l0L2J1aWxkcy9hcm02NC9idWlsZC92dWxrYW4tdG9vbHMtMS40LjMwNy92dWxrYW5p
bmZvLy4vdnVsa2FuaW5mby5oOjMxLAorICAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvYWxl
eC9sc3JjL3Rlc3RzL2J1aWxkcm9vdC5naXQvYnVpbGRzL2FybTY0L2J1aWxkL3Z1bGthbi10b29s
cy0xLjQuMzA3L3Z1bGthbmluZm8vZ2VuZXJhdGVkL3Z1bGthbmluZm8uaHBwOjI4LAorICAgICAg
ICAgICAgICAgICAgIGZyb20gL2hvbWUvYWxleC9sc3JjL3Rlc3RzL2J1aWxkcm9vdC5naXQvYnVp
bGRzL2FybTY0L2J1aWxkL3Z1bGthbi10b29scy0xLjQuMzA3L3Z1bGthbmluZm8vdnVsa2FuaW5m
by5jcHA6MzQ6CisgIC9ob21lL2FsZXgvbHNyYy90ZXN0cy9idWlsZHJvb3QuZ2l0L2J1aWxkcy9h
cm02NC9ob3N0L2FhcmNoNjQtYnVpbGRyb290LWxpbnV4LWdudS9pbmNsdWRlL2MrKy8xNC4yLjAv
Y3N0ZGxpYjo3OToxNTogZmF0YWwgZXJyb3I6IHN0ZGxpYi5oOiBObyBzdWNoIGZpbGUgb3IgZGly
ZWN0b3J5CisgICAgIDc5IHwgI2luY2x1ZGVfbmV4dCA8c3RkbGliLmg+CisgICAgICAgIHwgICAg
ICAgICAgICAgICBefn5+fn5+fn5+CisgIGNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuCisgIG1ha2Vb
Ml06ICoqKiBbdnVsa2FuaW5mby9DTWFrZUZpbGVzL3Z1bGthbmluZm8uZGlyL2J1aWxkLm1ha2U6
NzY6IHZ1bGthbmluZm8vQ01ha2VGaWxlcy92dWxrYW5pbmZvLmRpci92dWxrYW5pbmZvLmNwcC5v
XSBFcnJvciAxCisgIG1ha2VbMV06ICoqKiBbQ01ha2VGaWxlcy9NYWtlZmlsZTI6MTE2OiB2dWxr
YW5pbmZvL0NNYWtlRmlsZXMvdnVsa2FuaW5mby5kaXIvYWxsXSBFcnJvciAyCisgIG1ha2U6ICoq
KiBbTWFrZWZpbGU6MTM2OiBhbGxdIEVycm9yIDIKKworVGhlIHVuZGVybHlpbmcgcmVhc29uIHdh
cyAtaXN5c3RlbSBiZWluZyBwYXNzZWQgdG8gdGhlIGJ1aWxkIHdoaWNoIEkKK3RoaW5rIHJlc2V0
cyB0aGUgaW5jbHVkZSBwYXRoIGZvciBzeXN0ZW0gaW5jbHVkZXMuIFRoaXMgbWlnaHQgYmUgYSBi
dWcKK2luIGNtYWtlIGJ1dCBmcm9tIGxvb2tpbmcgYXQgdGhlIENNYWtlIHNvdXJjZSBJIGZvdW5k
IHNvbWUgZXhhbXBsZXMKK3RoYXQgc2V0OiBOT19TWVNURU1fRlJPTV9JTVBPUlRFRCAxIGFzIGEg
dGFyZ2V0IHByb3BlcnR5IHdoaWNoIHNlZW1zCit0byBkbyB0aGUgam9iLgorCitUaGlzIGRvZXNu
J3Qgc2VlbSB0byBhZmZlY3QgdGhlIG5vcm1hbCBub24tY3Jvc3MgYnVpbGQgYWx0aG91Z2ggSQor
d291bGRuJ3QgZXhwZWN0IHlvdSBuZWVkIHRvIHBhc3MgLWlzeXN0ZW0gYW55d2F5LgorCitVcHN0
cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9WdWxrYW4tVG9vbHMvcHVsbC8x
MDc3CitTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+
CistLS0KKyB2dWxrYW5pbmZvL0NNYWtlTGlzdHMudHh0IHwgMyArKy0KKyAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS92dWxrYW5p
bmZvL0NNYWtlTGlzdHMudHh0IGIvdnVsa2FuaW5mby9DTWFrZUxpc3RzLnR4dAoraW5kZXggN2U1
MWJiMmQuLmQ0ZjdlMWZhIDEwMDY0NAorLS0tIGEvdnVsa2FuaW5mby9DTWFrZUxpc3RzLnR4dAor
KysrIGIvdnVsa2FuaW5mby9DTWFrZUxpc3RzLnR4dAorQEAgLTIyLDcgKzIyLDggQEAgc2V0KFZV
TEtBTklORk9fTkFNRSB2dWxrYW5pbmZvKQorIHNldChHRU5FUkFURUQgZ2VuZXJhdGVkKQorIAor
IGFkZF9leGVjdXRhYmxlKHZ1bGthbmluZm8pCistc2V0X3RhcmdldF9wcm9wZXJ0aWVzKHZ1bGth
bmluZm8gUFJPUEVSVElFUyBPVVRQVVRfTkFNRSAke1ZVTEtBTklORk9fTkFNRX0pCisrc2V0X3Rh
cmdldF9wcm9wZXJ0aWVzKHZ1bGthbmluZm8gUFJPUEVSVElFUyBPVVRQVVRfTkFNRSAke1ZVTEtB
TklORk9fTkFNRX0KKysgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IE5PX1NZU1RFTV9GUk9NX0lNUE9SVEVEIDEpCisgCisgdGFyZ2V0X3NvdXJjZXModnVsa2FuaW5m
byBQUklWQVRFIHZ1bGthbmluZm8uY3BwKQorIAorLS0gCisyLjM5LjUKKwotLSAKMi4zOS41Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
