Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6449ED3399B
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 16:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 114144064A;
	Mon, 28 Oct 2024 16:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L1zKOiE73er6; Mon, 28 Oct 2024 16:15:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF11C40649
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF11C40649;
	Mon, 28 Oct 2024 16:15:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CFD955C1E
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 16:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EE0340A1A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 16:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Juv6pJSj5Rqg for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 16:15:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D82B409D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D82B409D9
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D82B409D9
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 16:15:13 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3a3b463e9b0so16260125ab.3
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 09:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730132112; x=1730736912;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eWzLRD+Db0JQknsdLIn89knlAH//d4cOJBlu9iSRHFk=;
 b=H75+b0jHZ/qgsKoUdxNQ/rHGThgZLm0vAHJJHjNv+eeiairWRSW7WZ9k7ZqEtNCgsw
 WF7fp8g6oocRFHqTmXRMvqvWhlpizPc2Gl9dhSwjqm/unlwDqB5xlfqoRIRaJQYBXCmm
 wUnz2ns/4V3HGDQVr5agJQuW9TCANQCdFrGnfC7/Bp3pawQSHFxk+nTFnQqr9OFklTDH
 wbPD9botxzcH9U8T0ia3JHaAjDsI0RKnkVzyLPe1CLMujfUCBKbqhEaGTwLkx/7+mAcc
 rBfehfObrNUW+eBBcZUvoVDkAyw4zm8tb6B8ASgSACdNCA1ozTiJ/n8IoVDGJaw8QMK/
 VWxA==
X-Gm-Message-State: AOJu0Yw3uWuOHwuDfz6eyACgaGv5X8cFwbbOu4EpLvnoGOSfr9lDIOjm
 qYVjy55+uwxrl0GSvC7tl1dXCVYlNegKO7ofeNaG41XNWP8wj/spbWrfGQ==
X-Google-Smtp-Source: AGHT+IGi2Kc7vufjPj7poTxeIZgQRylzoJlij9hosMVSqUSze+Fho0WZBVlWJlC9+I/nysEwA518qQ==
X-Received: by 2002:a92:c54e:0:b0:3a3:64ab:1e95 with SMTP id
 e9e14a558f8ab-3a4ed2b1ac5mr91522265ab.13.1730132111792; 
 Mon, 28 Oct 2024 09:15:11 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc72750c9dsm1769076173.101.2024.10.28.09.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 09:15:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>
Date: Mon, 28 Oct 2024 10:15:06 -0600
Message-Id: <20241028161507.186161-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730132112; x=1730736912; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eWzLRD+Db0JQknsdLIn89knlAH//d4cOJBlu9iSRHFk=;
 b=ixDefqpGCQSX4RE14XoMZ1ExbbsXqmACU0hHTbOd27yW1qvedBt+w6w7W47yPWYqxL
 DjvjpIyWpNjgKkKyB4LAHRhPgmrURTviE/zU3utuny030zAzxR0kBK63wT3mQPnUTMAM
 fLNmggGIlM74mQle81736CH1YVDv6UcmkOUU2GHDwQAtFaQ70JDb9Z8holfO+//JLp/c
 cj6/3kv3XlOGFEc4DeTJDRO/Jug+Ka/hHLLl9ufEqiQwBm7y82lVTSc3a+HHrOzYsp4w
 UwFUageqg2J5ZolFm6Gpd/vF5dLlBdeYBqWYaDEzOgedacGRvDoUrE86WU2sVWm77tJa
 ttuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ixDefqpG
Subject: [Buildroot] [PATCH v2 1/2] package/pkg-golang.mk: make GOPROXY
 configurable
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

U29tZSBwYWNrYWdlcyBsaWtlIHRoZSB1cGNvbWluZyBuZXRiaXJkIHBhY2thZ2UgZG9uJ3Qgd29y
awpjb3JyZWN0bHkgd2l0aCBHT1BST1hZPWRpcmVjdCB3aGljaCBpcyBub3QgdGhlIGRlZmF1bHQg
c2V0dGluZwpmb3IgdGhlIGdvIHRvb2xjaGFpbi4KCkxldHMgbWFrZSB0aGUgR09QUk9YWSBzZXR0
aW5nIGNvbmZpZ3VyYWJsZSBhbmQgdXNlIHRoZSBkZWZhdWx0CnRvb2xjaGFpbiBzZXR0aW5nIHdo
aWNoIGlzIG1vc3QgbGlrZWx5IHRvIGJlIHdoYXQgcGFja2FnZXMgZW5kCnVwIHR5cGljYWxseSBi
ZWluZyB0ZXN0ZWQgYWdhaW5zdC4KClNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1l
cy5oaWxsaWFyZDFAZ21haWwuY29tPgotLS0KIENvbmZpZy5pbiAgICAgICAgICAgICB8IDExICsr
KysrKysrKysrCiBwYWNrYWdlL3BrZy1nb2xhbmcubWsgfCAgMiArLQogMiBmaWxlcyBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvQ29uZmlnLmlu
IGIvQ29uZmlnLmluCmluZGV4IGRmNDNkYjdlZmYuLmFkNmFjMzg2NTYgMTAwNjQ0Ci0tLSBhL0Nv
bmZpZy5pbgorKysgYi9Db25maWcuaW4KQEAgLTI1OCw2ICsyNTgsMTcgQEAgY29uZmlnIEJSMl9Q
UklNQVJZX1NJVEVfT05MWQogCSAgdGhlIHByb2plY3QgY2FuIGJlIGJ1aWx0IGV2ZW4gaWYgdGhl
IHVwc3RyZWFtIHRhcmJhbGwKIAkgIGxvY2F0aW9ucyBkaXNhcHBlYXIuCiAKK2NvbmZpZyBCUjJf
R09QUk9YWV9MSVNUCisJc3RyaW5nICJHT1BST1hZIGxpc3QiCisJZGVmYXVsdCAiaHR0cHM6Ly9w
cm94eS5nb2xhbmcub3JnLGRpcmVjdCIKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfR09f
VEFSR0VUX0FSQ0hfU1VQUE9SVFMKKwloZWxwCisJICBMaXN0IG9mIG1vZHVsZSBwcm94eSBVUkxz
LiBUaGUgZ28gY29tbWFuZCB3aWxsIGF0dGVtcHQgdG8KKwkgIGRvd25sb2FkIG1vZHVsZXMgZnJv
bSBlYWNoIHNlcnZlciBpbiBzZXF1ZW5jZS4gVGhlIGtleXdvcmQKKwkgIGRpcmVjdCBpbnN0cnVj
dHMgdGhlIGdvIGNvbW1hbmQgdG8gZG93bmxvYWQgbW9kdWxlcyBmcm9tCisJICB2ZXJzaW9uIGNv
bnRyb2wgcmVwb3NpdG9yaWVzIHdoZXJlIHRoZXnigJlyZSBkZXZlbG9wZWQgaW5zdGVhZAorCSAg
b2YgdXNpbmcgYSBwcm94eS4KKwogaWYgIUJSMl9QUklNQVJZX1NJVEVfT05MWQogCiBjb25maWcg
QlIyX0JBQ0tVUF9TSVRFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZy1nb2xhbmcubWsgYi9wYWNr
YWdlL3BrZy1nb2xhbmcubWsKaW5kZXggOGUyNzYwMmQ0MS4uZjU4NmY3NWRmYSAxMDA2NDQKLS0t
IGEvcGFja2FnZS9wa2ctZ29sYW5nLm1rCisrKyBiL3BhY2thZ2UvcGtnLWdvbGFuZy5tawpAQCAt
ODgsNyArODgsNyBAQCAkKDIpX1BPU1RfUEFUQ0hfSE9PS1MgKz0gJCgyKV9HRU5fR09NT0QKICQo
MilfRE9XTkxPQURfUE9TVF9QUk9DRVNTID0gZ28KICQoMilfRExfRU5WICs9IFwKIAkkJChIT1NU
X0dPX0NPTU1PTl9FTlYpIFwKLQlHT1BST1hZPWRpcmVjdCBcCisJR09QUk9YWT0kJChjYWxsIHFz
dHJpcCwkJChCUjJfR09QUk9YWV9MSVNUKSkgXAogCSQkKCQoMilfR09fRU5WKQogCiAjIEJlY2F1
c2Ugd2UgYXBwZW5kIHZlbmRvcmVkIGluZm8sIHdlIGNhbid0IHJlbHkgb24gdGhlIHZhbHVlcyBi
ZWluZyBlbXB0eQotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
