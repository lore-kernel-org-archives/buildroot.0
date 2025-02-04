Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922A7C02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 17:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EAAA8037C;
	Tue,  4 Feb 2025 17:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1t222MaJ8jn3; Tue,  4 Feb 2025 17:35:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45806805B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45806805B8;
	Tue,  4 Feb 2025 17:35:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF98112A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D75A7804D5
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:35:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uUcaoZpr8tJt for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 17:35:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DAA018037C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAA018037C
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DAA018037C
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:35:02 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43620a5f81bso7299915e9.0
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 09:35:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738690500; x=1739295300;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qH6i4P797lEjB/UcgN3aInZDYZ30QYNlSUOkaLnjl5g=;
 b=iGedaSK8I/U9Xw0RWC2pR8hs41N8RQq+6Sya1zs6JktWVEvllyQTOeciMPiEmk+bCt
 iGtHtaj+OmvNsUzXSI4rlDypqqTBgFBQjgL8HkRSMpyu9t30Q5C7HrWmxehRKmNV/xSb
 oQrkv44CKDAnc75UC6QqsRe+7Y8NwELm7i3FMB9sWfclCVQwawAGnNYNCj3W44e26AiM
 jzWGXNkj+sIci1pU1SmQx1EEqGk66COaFB97eU/WxEbZPQFRWicL01pXnjZFOLlNwxyX
 zQ3/YVGDJ3z1/uh2/pWX8uqMvxh8yIgmKsxi/2WCId0UUQ10Hi9xgwGqfLs1SidChdeQ
 n5mA==
X-Gm-Message-State: AOJu0YwxkM21fAq/g9CXGE0A4F+j1zIqmmPaf08LWQMDVRFUGdLoVP8B
 6n12Hi6SdefWYsrl2jWmbV8hmZQRptohPTuZtU4YWpRmGDkbWoVQXQzI3/XMA54=
X-Gm-Gg: ASbGncvqKwrFNjtTKYK7aGOSCKAdmg90BAC5hEx2ISnv1ifsT3a2ZFhmAFW4GcVqSbr
 SFAuhfrfa8OKXn1sOR/Avn+ya64GJ/p4OCLVf+eiy/se00CpIxBhiN/MUFkJzIxEnpz9EPT/E9R
 4fBo6Oszd/oak/CqifFNwV1FHsR92yXa8i9O7yGmYQpfB3vnwdSscG3t3fNjRphuv+lSMdCZkvm
 QU/yAxrutyiljD9odG4qpAqHJDuaJkrNDHs5svSxq8pN7S4i+unJ2sAJUgcOmv7WpxtM/k8Iocb
 7Sxvba5/onMg//bJmRfsKcKjjA==
X-Google-Smtp-Source: AGHT+IFcLyXXvFIH/OrJ7RhLa+bOZVODqTI62DN8gPjvu8ICmFRfS2nCldc0TdG98vevwjGyNeYJRQ==
X-Received: by 2002:a05:600c:4fcb:b0:434:f335:aa0d with SMTP id
 5b1f17b1804b1-43905a91e0fmr16243645e9.2.1738690500297; 
 Tue, 04 Feb 2025 09:35:00 -0800 (PST)
Received: from archlinux.. ([78.244.185.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dadca52e6sm2092245f8f.0.2025.02.04.09.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 09:34:59 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Tue,  4 Feb 2025 18:34:54 +0100
Message-ID: <20250204173456.201056-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738690500; x=1739295300; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=qH6i4P797lEjB/UcgN3aInZDYZ30QYNlSUOkaLnjl5g=;
 b=kCLkmv+3EZ1ZOf3JieB09+PYACfFWQCY9bQn1S7YLs2Iq3WYA55HdRhhuhO8Z8q7X6
 0GTxX6qFE6HmNNEgSJhxUFV4yYnDEnLAlHiPyHGiUvI9QW0EPD8dUM5OsfsmAypHA8Sw
 vVJTrtq6SXNOfqQDIbRtUJhc8UYI5XjaS/BzOjRuofBVWq4bovtbCsR5YoCFX9A10Vom
 vS46MFA/YIhKiXjPQWRaASLtOcRryR4bWZ4j33T8Y0zOdeOf8secQYR30GMecwFeASGb
 Q9ohAoTQH9F6Vj9HmXXpDGE1pNObXNoK6+aWGVGmpDIb4yyl79Vd2/D34G4YJ7LllsN7
 FdcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kCLkmv+3
Subject: [Buildroot] [PATCH v4 0/2] rpi-utils replaces rpi-userland
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

SGVsbG8sCgpUaGUgcGFja2FnZSBycGktdXNlcmxhbmQgaGFzIGJlZW4gbWFya2VkIGFzIGFuY2ll
bnQgYW5kIGRlcHJlY2F0ZWRbMV0KbmluZS1tb250aCBhZ28uCgpUaGlzIHBhdGNoIHNlcmllcyBh
ZGRzIGl0cyByZXBsYWNpbmcgcGFja2FnZSBycGktdXRpbHMgKGZpcnN0IHBhdGNoKSwKYW5kIGl0
IGFkZHMgdGhlIG1lc3NhZ2UgaW4gdGhlIHJwaS11c2VybGFuZCBoZWxwIChzZWNvbmQgcGF0Y2gp
LgoKVGVsbCBtZSBpZiB0aGUgcGFja2FnZSBzaG91bGQgZ28gaW4gdGhlIGxlZ2FjeSB0aGluZy4K
ClsxXTogaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL3VzZXJsYW5kL2NvbW1pdC85NmE3
MzM0YWU5ZDVmYzlkYjdhYzkyZTU5ODUyMzc3ZGY2M2YxODQ4CgpDaGFuZ2VzIHNpbmNlIHYxOgog
LSBBZGQgbXlzZWxmIHRvIERFVkVMT1BFUlMgKHJwaS11dGlscykKIC0gQWRkIG1pc3NpbmcgZW50
cnkgaW4gcGFja2FnZXMvQ29uZmlnLmluIChycGktdXRpbHMpCiAtIEFkZCBuZWVkZWQgY29tbWVu
dCBmb3IgZ2xpYmMvbXVzbCB0b29sY2hhaW5zIHdpdGggZHluYW1pYyBsaWJyYXJ5CiAgIChycGkt
dXRpbHMpCiAtIEFkZCBkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX1VTRVNfVUNMSUJDIChycGkt
dXRpbHMpCgpDaGFuZ2VzIHNpbmNlIHYyOgogLSBSZW1vdmUgZGVwZW5kcyBvbiAhQlIyX1RPT0xD
SEFJTl9VU0VTX1VDTElCQwoKQ2hhbmdlcyBzaW5jZSB2MzoKIC0gVXBkYXRlIG15IGUtbWFpbAog
LSBSZWJhc2Ugb24gbWFzdGVyCiAtIEFkZCBUZXN0ZWQtYnk6IE9saXZpZXIgQmVuamFtaW4gPG9s
aXZpZXIuYmVuamFtaW5AYm9vdGxpbi5jb20+CgpSZWdhcmRzLApHYcOrbCBQT1JUQVkgKDIpOgog
IHBhY2thZ2UvcnBpLXV0aWxzOiBuZXcgcGFja2FnZQogIHBhY2thZ2UvcnBpLXVzZXJsYW5kOiBw
YWNrYWdlIGlzIGRlcHJlY2F0ZWQKCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICB8
ICAxICsKIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9y
cGktdXNlcmxhbmQvQ29uZmlnLmluICAgfCAxMSArKysrKysrKysrKwogcGFja2FnZS9ycGktdXRp
bHMvQ29uZmlnLmluICAgICAgfCAxMiArKysrKysrKysrKysKIHBhY2thZ2UvcnBpLXV0aWxzL3Jw
aS11dGlscy5oYXNoIHwgIDMgKysrCiBwYWNrYWdlL3JwaS11dGlscy9ycGktdXRpbHMubWsgICB8
IDE4ICsrKysrKysrKysrKysrKysrKwogNiBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ycGktdXRpbHMvQ29uZmlnLmluCiBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9ycGktdXRpbHMvcnBpLXV0aWxzLmhhc2gKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL3JwaS11dGlscy9ycGktdXRpbHMubWsKCi0tIAoyLjQ4LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
