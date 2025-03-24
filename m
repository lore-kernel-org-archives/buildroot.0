Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD9BC36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 11:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 527C460BC4;
	Mon, 24 Mar 2025 11:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CWYU9Gj-JJiR; Mon, 24 Mar 2025 11:52:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7964960BB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7964960BB8;
	Mon, 24 Mar 2025 11:52:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 476B61B8
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 11:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3137E40E1B
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 11:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53zg439Dv6of for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 11:52:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C1EB40870
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C1EB40870
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C1EB40870
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 11:52:24 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so3434411f8f.3
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 04:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742817141; x=1743421941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7qjBrAZf/C+Igu/gVPY2BV8CvHrk7uDIh4oYR1FkcxI=;
 b=aOrCa4NFeQk8C/XevIvgsEFFhQhVWHYpRHPsZyBLAc0aOyBwpKFB8FQKmiEAAOHn0R
 CaBawpPLkHRJF3tu5tdKTlJFOxoXc/iuLm2Io0nBwGGTAetaVin9tyBnj5N77XGv098/
 W+0YUyxr962M9/h4cdvyOiePk0SuIqaFjt4AjGZ7uq+mUE4Fi+TStWrqjDhMMtC4jiRe
 hnLCrTGOPzTe7TYxYw5SM11wshwFmhi42See8qD3w83PCZbkoLm9ujYRYuy5QO0kzDMA
 pK7IyvIxML8WtgnNxVYi0v4mIx8TTZju+hgkLiOEUj2vnDJrpEIeEzcIh6R8F9ij+Hm3
 PN8Q==
X-Gm-Message-State: AOJu0YzI0GXLgqXYs1Luwt6B6BfcqdS257vjH8FToq93bzBWgtA5g/zl
 osaSTtaMl5jNVX4hz8W8ak8j0btSC/wWVRRMVbzGl67jdn9jgmiYRDgqu2oW789lMyohYriGNp4
 9
X-Gm-Gg: ASbGncvtg6BZ50yNZbVtJ+AqJqhp3nKWd3Y66k6oGocAK54dSoqKHl9K2+DonspcFB/
 UKBiUpzxB7UZ9RAX8h0DgvBSMmzW2l7/nNWltE1q6oKMYfyiKBRhaXfHOIyzFz11hKjgMKKr5uh
 NKALjDoAHQbQfe60MISMvsDxujL0SSLovwSqSc638PY81Ks9PepBD0lePznXKY38MeXcRjUOa2u
 cGfME4iAUKOLJBpg5PtwpoJNsWlEewfgO50c04tso3bplMsbvureWzj8XK9tHkNUb5Nb6jpl4LM
 N0asdK+PPcsMA1b/9Aet8J/ikSW82eZvQxC63prlyIE92UI=
X-Google-Smtp-Source: AGHT+IFD8zQTjkBxZn3G+Ccp5UzzfGvMRUtlNfn74KnK7aL9u6BRFXnvLQpKWViMoRJ44TPSzujBww==
X-Received: by 2002:a05:6000:2cd:b0:390:ea4b:ea9 with SMTP id
 ffacd0b85a97d-3997f93906cmr14863384f8f.39.1742817141511; 
 Mon, 24 Mar 2025 04:52:21 -0700 (PDT)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b260fsm10577636f8f.43.2025.03.24.04.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 04:52:21 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1A6905F906;
 Mon, 24 Mar 2025 11:52:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Mon, 24 Mar 2025 11:52:15 +0000
Message-Id: <20250324115215.972943-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742817141; x=1743421941; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7qjBrAZf/C+Igu/gVPY2BV8CvHrk7uDIh4oYR1FkcxI=;
 b=D8HSRTL2XcpU47gb0+Abh2X55QGal1fKa/RGsD7RaDs+3Zij0pPwTWYbAJb2hAy6+p
 ruVpaMnq4OdfSnAuPrGLqSxbtLVz6+qosjWcG803Z/rTs6eNx4DHyvba3oQky+kjKSM8
 lUke/A6etOJG+JoN+IilijVnBVMTEe+z/TjAijr5QSm6Z+xHtsrmDYzHtUwnF2tSVFPc
 EGttSMtZBAPuC70CX25aUf3SGczg+4o7xBXXe8mht+G18nN++ep3rEIyGg2U0UCyyvha
 bcAulCmYOAkyA76iJI0c2KYCpUs71DjAZnbXPsFnKlR6lUZTCzKtxnOrkje/41p8PwEw
 rTkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=D8HSRTL2
Subject: [Buildroot] [RFC PATCH] support/testing: make time setting portable
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGJ1c3lib3ggZGF0ZSBhcHBsZXQgYWNjZXB0cyB0aGUgZm9sbG93aW5nOgoKICBkYXRlIEAx
MjM0NTY3CgpidXQgdGhpcyBjb25mdXNlcyB0aGUgY29yZXV0aWxzIHZlcnNpb24gd2hpY2ggZG9l
c24ndCBpbXBsaWNpdGx5IHNldAp0aW1lLiBBcyBzb21lIHRlc3RzIG1pZ2h0IG5lZWQgY29yZXV0
aWxzIGJpbmFyaWVzIHdlIHNob3VsZCBlbnN1cmUgdGhlCmVtdWxhdG9yIGxvZ2luIHdpbGwgd29y
ayB3aXRoIGJvdGguIEZpeCB0aGlzIGJ5IHBhc3NpbmcgdGhlIC1zIChzZXQpCm9wdGlvbiB0byB0
aGUgY29tbWFuZC4KClNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGlu
YXJvLm9yZz4KLS0tCiBzdXBwb3J0L3Rlc3RpbmcvaW5mcmEvZW11bGF0b3IucHkgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9zdXBwb3J0L3Rlc3RpbmcvaW5mcmEvZW11bGF0b3IucHkgYi9zdXBwb3J0L3Rlc3RpbmcvaW5m
cmEvZW11bGF0b3IucHkKaW5kZXggN2Y0MWU1MmE0NC4uYTZmZTk2MTNiNyAxMDA2NDQKLS0tIGEv
c3VwcG9ydC90ZXN0aW5nL2luZnJhL2VtdWxhdG9yLnB5CisrKyBiL3N1cHBvcnQvdGVzdGluZy9p
bmZyYS9lbXVsYXRvci5weQpAQCAtMTU1LDcgKzE1NSw3IEBAIGNsYXNzIEVtdWxhdG9yKG9iamVj
dCk6CiAKICAgICAgICAgc2VsZi5jb25uZWN0X3NoZWxsKCkKIAotICAgICAgICBvdXRwdXQsIGV4
aXRfY29kZSA9IHNlbGYucnVuKGYiZGF0ZSBAe2ludCh0aW1lLnRpbWUoKSl9IikKKyAgICAgICAg
b3V0cHV0LCBleGl0X2NvZGUgPSBzZWxmLnJ1bihmImRhdGUgLXMgQHtpbnQodGltZS50aW1lKCkp
fSIpCiAgICAgICAgIGlmIGV4aXRfY29kZToKICAgICAgICAgICAgIHJhaXNlIFN5c3RlbUVycm9y
KCJDYW5ub3Qgc2V0IGRhdGUgaW4gdmlydHVhbCBtYWNoaW5lIikKIAotLSAKMi4zOS41CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
