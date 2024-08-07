Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F408C52D71
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A258E4060F;
	Wed,  7 Aug 2024 14:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uuTrS_ar6aZM; Wed,  7 Aug 2024 14:05:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C58040603
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C58040603;
	Wed,  7 Aug 2024 14:05:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5C6C1BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0DD56070A
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9M7lo6-0Dko for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:05:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EC289606F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC289606F7
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC289606F7
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:05:09 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52f025bc147so2486736e87.3
 for <buildroot@buildroot.org>; Wed, 07 Aug 2024 07:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723039507; x=1723644307;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lvGuGUj3/QSy8Yd0ccpA4+Ht3xP+BcI12onUqs4fOls=;
 b=k3ByPAjI/V1a70kQyR3EFSJUTzedbzZRKC8rbcwVl7HSA4MO1a5yEpfX3LI1t2EGQm
 /8oVzaBE5b9SUllT2GFmQiLrY0xPxG4VA5ivD79C6q+n7GEGqycqHE0MMlitL3NzLxhb
 jgwM4Q9ONqzSHaVC8FtR4nKS8wY/c1u/rsukPp5ZFq7tGEb4XGozO66wEsLyJ2nCnjSz
 L0Mt2XD6MCMm/1yM2yMGKpSHDJ3ONpMb5c5TmdKS13eyNM+z0p6ZEQQBrYXeT0xG+SQa
 y/ZGYXOO2rHXyvJ/8SWoxN0qNfYHdv5JkZ+D/+4rdj2NZRJMI4BQyiF1n8KnuEYSPACH
 fMug==
X-Gm-Message-State: AOJu0YwbtO3/Zf2eIgovYnEBu+vSiLm+xi4rkqw6GBAgnvR5wfRzWG+w
 oL27dRtxygJ1+S6YBZ97g/pscnYS/wyWZtk+Wy9cax5lpIpZ7aLizr3GrQ==
X-Google-Smtp-Source: AGHT+IH0Rmr0lRZmGtkLn5jpqC3RE915GeHzRCFZZNbesV1g6yJeRqWTncK+DkisAVOP1KbR39oU/A==
X-Received: by 2002:a05:6512:3b8b:b0:52e:9b92:4999 with SMTP id
 2adb3069b0e04-530bb3630a8mr13080388e87.2.1723039506936; 
 Wed, 07 Aug 2024 07:05:06 -0700 (PDT)
Received: from tollan.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530de466b6dsm262700e87.217.2024.08.07.07.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 07:05:06 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 16:04:41 +0200
Message-ID: <20240807140441.3795948-2-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807140441.3795948-1-lazzer@gmail.com>
References: <20240807140441.3795948-1-lazzer@gmail.com>
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723039507; x=1723644307; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lvGuGUj3/QSy8Yd0ccpA4+Ht3xP+BcI12onUqs4fOls=;
 b=GWdMM9WczpIjqzMF9kw7n/zdBaMPL2LhWIEOUTg2ncfTAbmTZo4j0KWhpjXnNmybMa
 kjjwE5BZhhC4Z2SuI07vCTnaqwO/bMNItqV6Ja+7P0sgkzCqqnUPBCs9lXxSdLMfZufW
 DG6npQWLEaMfUDAhCTh4rWhXBFSsKivGe7f75kBaRk5P0W6ba+uV+SuTMwi8+Foklz0y
 2L7Ej6D0XFI+gg3BQqFngIL6PCFULzJK4ouE9teKJpYvHPkJqYQYhmPNToJvXa3wxnlO
 emwq6CQeKuIQq7tOULoDvYEejro1nz6w1/3TdHMvfhFf6oSQY4kG0eTiD3xCShkxCYgF
 zcTQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GWdMM9Wc
Subject: [Buildroot] [PATCH 2/2] package/uboot-tools: Add new tool
 fdt_add_pubkey
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
Cc: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ZmR0X2FkZF9wdWJrZXkgaXMgdXNlZnVsIHRvIGluc3RhbGwgdHJ1c3RlZCBzaWduYXR1cmVzIGlu
c2lkZQphbiBleGlzdGluZyB1Ym9vdCBkZXZpY2UgdHJlZS4KClNpZ25lZC1vZmYtYnk6IE1hdHRp
YXMgV2Fsc3Ryw7ZtIDxsYXp6ZXJAZ21haWwuY29tPgotLS0KIHBhY2thZ2UvdWJvb3QtdG9vbHMv
Q29uZmlnLmluICAgICAgfCA3ICsrKysrKysKIHBhY2thZ2UvdWJvb3QtdG9vbHMvdWJvb3QtdG9v
bHMubWsgfCA4ICsrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL3Vib290LXRvb2xzL0NvbmZpZy5pbiBiL3BhY2thZ2UvdWJvb3Qt
dG9vbHMvQ29uZmlnLmluCmluZGV4IGMzYjAzNDFlY2QuLmZiY2Q2Mzc5YzUgMTAwNjQ0Ci0tLSBh
L3BhY2thZ2UvdWJvb3QtdG9vbHMvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvdWJvb3QtdG9vbHMv
Q29uZmlnLmluCkBAIC0xMDIsNCArMTAyLDExIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9VQk9PVF9U
T09MU19EVU1QSU1BR0UKIAkgIFRoZSBkdW1waW1hZ2UgdG9vbCBmcm9tIERhcyBVLUJvb3QgYm9v
dGxvYWRlciwgd2hpY2ggYWxsb3dzCiAJICBleHRyYWN0aW9uIG9mIGRhdGEgZnJvbSBVLUJvb3Qg
aW1hZ2VzLgogCitjb25maWcgQlIyX1BBQ0tBR0VfVUJPT1RfVE9PTFNfRkRUX0FERF9QVUJLRVkK
Kwlib29sICJmZHRfYWRkX2tleSIKKwloZWxwCisJICBJbnN0YWxsIHRoZSBmZHRfYWRkX2tleSB0
b29sIG9uIHRoZSB0YXJnZXQgc3lzdGVtCisKKwkgIFRoZSBmZHRfYWRkX3B1YmtleSBpcyB1c2Vk
IHRvIGFkZCBhIHB1YmxpYyBrZXkgdG8gdGhlIGZkdC4KKwogZW5kaWYKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvdWJvb3QtdG9vbHMvdWJvb3QtdG9vbHMubWsgYi9wYWNrYWdlL3Vib290LXRvb2xzL3Vi
b290LXRvb2xzLm1rCmluZGV4IDBmNmIwOTcyYzkuLjZkYWQ1ZWI2NjQgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2UvdWJvb3QtdG9vbHMvdWJvb3QtdG9vbHMubWsKKysrIGIvcGFja2FnZS91Ym9vdC10b29s
cy91Ym9vdC10b29scy5tawpAQCAtODIsNiArODIsMTIgQEAgZGVmaW5lIFVCT09UX1RPT0xTX0lO
U1RBTExfTUtFTlZJTUFHRQogZW5kZWYKIGVuZGlmCiAKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfVUJP
T1RfVE9PTFNfRkRUX0FERF9QVUJLRVkpLHkpCitkZWZpbmUgVUJPT1RfVE9PTFNfSU5TVEFMTF9G
RFRfQUREX1BVQktFWQorCSQoSU5TVEFMTCkgLW0gMDc1NSAtRCAkKEBEKS90b29scy9mZHRfYWRk
X3B1YmtleSAkKFRBUkdFVF9ESVIpL3Vzci9iaW4vZmR0X2FkZF9wdWJrZXkKK2VuZGVmCitlbmRp
ZgorCiBpZmVxICgkKEJSMl9QQUNLQUdFX1VCT09UX1RPT0xTX0ZXUFJJTlRFTlYpLHkpCiBkZWZp
bmUgVUJPT1RfVE9PTFNfSU5TVEFMTF9GV1BSSU5URU5WCiAJJChJTlNUQUxMKSAtbSAwNzU1IC1E
ICQoQEQpL3Rvb2xzL2Vudi9md19wcmludGVudiAkKFRBUkdFVF9ESVIpL3Vzci9zYmluL2Z3X3By
aW50ZW52CkBAIC0xMDcsNiArMTEzLDcgQEAgZGVmaW5lIFVCT09UX1RPT0xTX0lOU1RBTExfVEFS
R0VUX0NNRFMKIAkkKFVCT09UX1RPT0xTX0lOU1RBTExfRldQUklOVEVOVikKIAkkKFVCT09UX1RP
T0xTX0lOU1RBTExfRFVNUElNQUdFKQogCSQoVUJPT1RfVE9PTFNfSU5TVEFMTF9GSVRfQ0hFQ0tf
U0lHTikKKwkkKFVCT09UX1RPT0xTX0lOU1RBTExfRkRUX0FERF9QVUJLRVkpCiBlbmRlZgogCiAj
IGhvc3QtdWJvb3QtdG9vbHMKQEAgLTIyNyw2ICsyMzQsNyBAQCBkZWZpbmUgSE9TVF9VQk9PVF9U
T09MU19JTlNUQUxMX0NNRFMKIAkkKElOU1RBTEwpIC1tIDA3NTUgLUQgJChARCkvdG9vbHMvbWtl
ZmljYXBzdWxlICQoSE9TVF9ESVIpL2Jpbi9ta2VmaWNhcHN1bGUKIAkkKElOU1RBTEwpIC1tIDA3
NTUgLUQgJChARCkvdG9vbHMvbWtlbnZpbWFnZSAkKEhPU1RfRElSKS9iaW4vbWtlbnZpbWFnZQog
CSQoSU5TVEFMTCkgLW0gMDc1NSAtRCAkKEBEKS90b29scy9kdW1waW1hZ2UgJChIT1NUX0RJUikv
YmluL2R1bXBpbWFnZQorCSQoSU5TVEFMTCkgLW0gMDc1NSAtRCAkKEBEKS90b29scy9mZHRfYWRk
X3B1YmtleSAkKEhPU1RfRElSKS9iaW4vZmR0X2FkZF9wdWJrZXkKIAkkKEhPU1RfVUJPT1RfVE9P
TFNfSU5TVEFMTF9GSVRfQ0hFQ0tfU0lHTikKIAkkKElOU1RBTEwpIC1tIDA3NTUgLUQgJChARCkv
dG9vbHMvZW52L2Z3X3ByaW50ZW52ICQoSE9TVF9ESVIpL2Jpbi9md19wcmludGVudgogCWxuIC1z
ZiAkKEhPU1RfRElSKS9iaW4vZndfcHJpbnRlbnYgJChIT1NUX0RJUikvYmluL2Z3X3NldGVudgot
LSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
