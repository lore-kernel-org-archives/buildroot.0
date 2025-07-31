Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E57EC87FCA
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 17:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFC3383579;
	Thu, 31 Jul 2025 17:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ReIZmbHBwEB0; Thu, 31 Jul 2025 17:29:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0689583E21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0689583E21;
	Thu, 31 Jul 2025 17:29:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D3DF13D
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 17:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1ED0A42965;
 Thu, 31 Jul 2025 17:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_b6tKT0OWpm; Thu, 31 Jul 2025 17:29:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7960142961
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7960142961
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7960142961
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 17:29:38 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4589968e001so7415235e9.0
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 10:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753982976; x=1754587776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HuOgIt/M4pZADe3lPcBecOpd8hfyRT9YvQ4H6FA0cok=;
 b=GHa0jsnU3I0i9E75uO5NTR7UTnpmUr5wJfxXYS0LllKSkPuivPpPX/uv5ao4DLmut9
 G2hHQEsuwIFgxwqWFmn94tslOpfN+UzrzypgpNJCQBCtFAmwQJeUbxbN9OCscWABb1G6
 Y2MPZtA7B6WtTmoypwhSayqNdOBH88vBZC5i8LAjqL2D5hRK1kcg+2zbHsnm32xdjzcZ
 Inq5BpddgxRNzsNJllXJy82I7Y7dVOTPmy12s/rFElelD3mBWctYrhiGZAJA/eLOW+gE
 xIe3ZrWXuEP2bdtnXOfmEPj8LLovTOoP5OTU65v1moqwBU2/YXKuhk4NBxDyvueRcUwZ
 1xIg==
X-Gm-Message-State: AOJu0Yw4gva/bY2Dgvj3tIwNVV9H5j96Wh2W2QeI/HgzLSZzqqJZomfW
 DeEEZ1zrxkr5NKIIZMzi3/9nanYqOhpiF/SwXUGsXgIh4oDPjgejP5z0olbR2Q==
X-Gm-Gg: ASbGncs0gcCJ8qRbPEISl2yo+f1btONJQOuHOtxBk/El5ga+oAGSJkQoqvX8QxiBfWB
 9RtUh4INQ0W46yNnH9c56CkdnfJIsM2PFrK8T31buoMtUJ/t5anh7rKAMCJU2DFQpI7tohbwNtg
 G7YbnyOXW9z+bS4Lz8spkIkAw0eEps3jYtO1BtZLkfO8zN+614J4dF5j32Swsn+dOk+fMBmHocH
 NJMYCKWwWNVtFOi0sqYBxpdJoYosbBdSk4ON3+TwnwP4b9x69vAzOeor6Bo4gZEafs5ytTS7puC
 M7DXmEICpXEgQtGmnkVQKUP/rvC2Z8kboYXnJDYAGAijWQ+BuOgfZq25+WO3uCHDqLTycZj/9U0
 6pzEo1HBjbVjimOk7AOI/91e4i/RJHabN
X-Google-Smtp-Source: AGHT+IEDLkNih7n+hDC9OJ5Pc8Y/Ie3cmwwxPyfoTHePPmNwxPHDMZYPCrdtDNyrkaWAMWLH+ZfK/Q==
X-Received: by 2002:a05:600c:138e:b0:456:1d61:b0f2 with SMTP id
 5b1f17b1804b1-45892bdf7ebmr80597595e9.30.1753982976147; 
 Thu, 31 Jul 2025 10:29:36 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953cfeaesm79515285e9.16.2025.07.31.10.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 10:29:35 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2025 19:29:35 +0200
Message-ID: <074fd671f8e750d51a13fc48c0355c3fa6fc73fa.1753982959.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1753982959.git.yann.morin.1998@free.fr>
References: <cover.1753982959.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753982976; x=1754587776; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HuOgIt/M4pZADe3lPcBecOpd8hfyRT9YvQ4H6FA0cok=;
 b=bsNvJFnAhmWcsz4l+LoRHYWfQYha5/805TxFwU+QhxB8Rc0xOVzQ0z4Se4kH2GEhAW
 FpS/ZD/y5myBqlXjuzhDJmkKX0xHT9myEeKtq+dhjMVBmY73nMnSw2n0H+CORvXMOvyH
 DIQ6oKbxmtVQnhM0rZM8y0TOb77rku4vEI5fQiDcBMpVZek9yMdD1Q7qml16iVfankCC
 XexIc1PCqQ0TrSp3jKebaHcKdmPMFPyMK78lDCaE0do203Di5STJlXAE3t+gXDFbsDtI
 UeedL5eAMYl6QtomE60kWwDVq/2zq7eTYAaP1J8XjCMKmOkMAR9zsvMAhiztLPyQAXBm
 8Naw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bsNvJFnA
Subject: [Buildroot] [PATCH 2/2] Makefile: silence list-defconfigs for
 br2-external with no defconfig
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiBhIGJyMi1leHRlcm5hbCB0cmVlIGhhcyBubyBkZWZjb25maWcsIGxpc3QtZGVmY29uZmln
IGN1cnJlbnRseQp3aGluZXMgd2l0aCBhbiBlcnJvciBmcm9tIGZpbmQ6CgogICAgZmluZDog4oCY
Wy4uLl0vbXktZXh0ZXJuYWwvY29uZmlnc+KAmTogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQoK
Rml4IHRoYXQgYnkgb25seSBydW5uaW5nIGZpbmQgaWYgdGhlIGRpcmVjdG9yeSBleGlzdHMuCgpT
aWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KLS0t
CiBNYWtlZmlsZSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggZmE4MmFmYTQ5
Yy4uNTQwMTgzZjE2ZSAxMDA2NDQKLS0tIGEvTWFrZWZpbGUKKysrIGIvTWFrZWZpbGUKQEAgLTEy
MTksNyArMTIxOSw3IEBAIGhlbHA6CiAjICQoMik6IGJyMi1leHRlcm5hbCBuYW1lLCBlbXB0eSBm
b3IgYnVuZGxlZAogZGVmaW5lIGxpc3QtZGVmY29uZmlncwogCUBmaXJzdD10cnVlOyBcCi0JZm9y
IGRlZmNvbmZpZyBpbiAkJChmaW5kICQoMSkvY29uZmlncyAtbmFtZSAnKl9kZWZjb25maWcnIHxz
b3J0KTsgZG8gXAorCWZvciBkZWZjb25maWcgaW4gJCQoWyAtZCAkKDEpL2NvbmZpZ3MgXSAmJiBm
aW5kICQoMSkvY29uZmlncyAtbmFtZSAnKl9kZWZjb25maWcnIHxzb3J0KTsgZG8gXAogCQlbIC1m
ICIkJHtkZWZjb25maWd9IiBdIHx8IGNvbnRpbnVlOyBcCiAJCWlmICQke2ZpcnN0fTsgdGhlbiBc
CiAJCQlpZiBbICIkKDIpIiBdOyB0aGVuIFwKLS0gCjIuNDcuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
