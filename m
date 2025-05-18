Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BA2C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 03:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 741B681099;
	Sun, 18 May 2025 03:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZKPciqmuRhg; Sun, 18 May 2025 03:27:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86135810AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86135810AE;
	Sun, 18 May 2025 03:27:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86568201
 for <buildroot@buildroot.org>; Sun, 18 May 2025 03:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76D584076F
 for <buildroot@buildroot.org>; Sun, 18 May 2025 03:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xp477IqTxvAg for <buildroot@buildroot.org>;
 Sun, 18 May 2025 03:27:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A1F1140767
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1F1140767
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1F1140767
 for <buildroot@buildroot.org>; Sun, 18 May 2025 03:27:28 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-b26f5eb16a5so1273363a12.0
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747538847; x=1748143647;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UwqCflq6UQadq6bqKf0SvicfRt1kd6Up9BQtaezTFGY=;
 b=A217FsfiWoo140IupyuMn/lDokokdtOKYG89vxyhMZFjlWTooLYiKOIjeXtPRKy0c7
 0GzqoEQ2KHB6o5CzDHvBl6g52H6DVjG+bzdOFJ6+wgDTWOCBXj1UJXSeYbgcqD8apl56
 vGapYRQbfVr6q8ESSO4/AqFYpELtQ6jyzoltkKE8axC2y/B4i1AR2aKzaL03hy1cU8SG
 c7Kqilk6PHcV6byIhRaan9+ajXpnx5hemzJCTy+R+nJXxzHXlp/LCfMebhb8QAFbUIum
 hswN3horTuW8EUyKJ67l3i1udXlR66Xckv7zpCN0SvbiR5RTbao6xaoZYHKno9zkoijX
 E5OQ==
X-Gm-Message-State: AOJu0YwG7xDVk80hftWOEYpoPATr3vxavzE5jzA7zuQKgXT/0Q95bOua
 EvbSJfM3b0O4yd2eNiBBVklSOOOS04pYoaScKnpaMDtwpuGVn6iy4SiTE+tYIsh+
X-Gm-Gg: ASbGncvPejtI5kgoaPrpCE4hJeshePeBlyIh+6DrwcCDcgChuxJXpQxDjfQ2YMXv0Sh
 8O4oBl9Niqdtb+9X7hkn89Y15GJnq0UHiMXSG0arRJ3wwm4SkO5tgYgN8IWFWxPHudz3fzuR4xR
 h0PJAGT3BEqrhaDjFCorBOTqpmIWNVrBLTRpKDQbZntJKLGpUwcfMgKKZOecrmDyWlCKE+IbG5j
 PQ5a60dw0NNfp8/xdbHkNz5Yfve18MuBedlQKM6HYcR9ia18RfLZ2LXFvV/eckhnq4yT4JkHhSx
 VoX8Gb9sF5Ko9sN6CxBd/a7g7Yv0808B6LPZ+4gOPXzC0HSVp6m1kPHbbn6SeyJTxNRCDkzeDgl
 fnQKB0WNsd39ubc6YCWPTVHaPoy36FDSH7R8oyw==
X-Google-Smtp-Source: AGHT+IFNC2A2VqYA+TT2KXWYgOKenL4Ccv1Ow3DUIDFMyO0oJ5THokziaTzNBMAgzUgtNMzvNgshvA==
X-Received: by 2002:a05:6a20:d04f:b0:215:d41d:9183 with SMTP id
 adf61e73a8af0-2165f5e3a85mr12671177637.1.1747538846691; 
 Sat, 17 May 2025 20:27:26 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b26eaf8e06bsm3339958a12.37.2025.05.17.20.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 May 2025 20:27:26 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Sat, 17 May 2025 20:27:22 -0700
Message-Id: <20250518032722.75525-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747538847; x=1748143647; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UwqCflq6UQadq6bqKf0SvicfRt1kd6Up9BQtaezTFGY=;
 b=nnziLljzR6ueIXaoBpYRVcfmSkKlxLbJweZkvglmzV8xYC/KRfIimBS+nS2dN4Kl0O
 3Z9lhL61Kp1KEbO/KgSngGhTnWvi1PVQAaNv6aL9VRxjWoxfIOYR158DNYip0gMI/gpa
 QVQ2ZmpTe8wkciWIJ0Wp5jntufYqw7lEHyY2FgzaSOT+xKrM1dnA4ghpjtbeVUB5kGxw
 kJvivvmkNb9KvkiHZlM+856k/XgJV0LobC+IRq5XkOHEjjvadW3aMT7gXJB96Br0G0DF
 hnsW5mxs8SR0qhtiC4McDu8xUh8opHEsakc7eVYrXVC8m4a4sDPM3En64iUxfeT19Kz8
 /mgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nnziLljz
Subject: [Buildroot] [PATCH 1/1] package/iperf3: bump to version 3.19
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

UmVsZWFzZSBub3RlczoKaHR0cHM6Ly9naXRodWIuY29tL2VzbmV0L2lwZXJmL3JlbGVhc2VzL3Rh
Zy8zLjE5CgpVcGRhdGVkIGxpY2Vuc2UgaGFzaCBkdWUgdG8gY29weXJpZ2h0IHllYXIgYnVtcDoK
aHR0cHM6Ly9naXRodWIuY29tL2VzbmV0L2lwZXJmL2NvbW1pdC85ZjZkYzIxNjRkZWE2MjIyMTI5
ODgxOGM1NDk5MmMzZjI0YTdlMjE0CgpBZGRlZCBhIHBhdGNoIHRvIGZpeCB0aGUgYnVpbGQgZXJy
b3Igd2l0aCB1Q2xpYmMuCgpTaWduZWQtb2ZmLWJ5OiBLYWRhbWJpbmkgTmVtYSA8a2FkYW1iaW5p
Lm5lbWFAZ21haWwuY29tPgotLS0KIC4uLm4taXNzdWUtd2l0aC11Q2xpYmMtZHVlLXRvLWEtbWlz
c2luZy5wYXRjaCB8IDUxICsrKysrKysrKysrKysrKysrKysKIHBhY2thZ2UvaXBlcmYzL2lwZXJm
My5oYXNoICAgICAgICAgICAgICAgICAgICB8ICA2ICstLQogcGFja2FnZS9pcGVyZjMvaXBlcmYz
Lm1rICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNTUgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2lw
ZXJmMy8wMDAxLUZpeC1hLWNvbXBpbGF0aW9uLWlzc3VlLXdpdGgtdUNsaWJjLWR1ZS10by1hLW1p
c3NpbmcucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2lwZXJmMy8wMDAxLUZpeC1hLWNvbXBp
bGF0aW9uLWlzc3VlLXdpdGgtdUNsaWJjLWR1ZS10by1hLW1pc3NpbmcucGF0Y2ggYi9wYWNrYWdl
L2lwZXJmMy8wMDAxLUZpeC1hLWNvbXBpbGF0aW9uLWlzc3VlLXdpdGgtdUNsaWJjLWR1ZS10by1h
LW1pc3NpbmcucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uY2My
ZjRiZDU5NQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvaXBlcmYzLzAwMDEtRml4LWEtY29t
cGlsYXRpb24taXNzdWUtd2l0aC11Q2xpYmMtZHVlLXRvLWEtbWlzc2luZy5wYXRjaApAQCAtMCww
ICsxLDUxIEBACitGcm9tIGU1YzQyNjNjNmIyYzViODRhNmVkZWIxY2YzYzk1YmRkZDczZDRkN2Mg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBLYWRhbWJpbmkgTmVtYSA8a2FkYW1iaW5p
Lm5lbWFAZ21haWwuY29tPgorRGF0ZTogU2F0LCAxNyBNYXkgMjAyNSAxNjoyMDowNyAtMDcwMAor
U3ViamVjdDogW1BBVENIXSBGaXggYSBjb21waWxhdGlvbiBpc3N1ZSB3aXRoIHVDbGliYyBkdWUg
dG8gYSBtaXNzaW5nIGluY2x1ZGUKKyBmaWxlLgorTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQt
VHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGlu
ZzogOGJpdAorCistLS0tLS0KK0luIGZpbGUgaW5jbHVkZWQgZnJvbSB0X2F1dGguYzozNToKK2lw
ZXJmX2FwaS5oOjM5NTo3NzogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmHZhX2xpc3TigJkK
KyAgMzk1IHwgdm9pZCBpcGVyZl9leGl0KHN0cnVjdCBpcGVyZl90ZXN0ICp0ZXN0LCBpbnQgZXhp
dF9jb2RlLCBjb25zdCBjaGFyICpmb3JtYXQsIHZhX2xpc3QgYXJncCkgX19hdHRyaWJ1dGVfXyAo
KG5vcmV0dXJuKSk7CisJICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+CitpcGVyZl9hcGku
aDozMzoxOiBub3RlOiDigJh2YV9saXN04oCZIGlzIGRlZmluZWQgaW4gaGVhZGVyIOKAmDxzdGRh
cmcuaD7igJk7IGRpZCB5b3UgZm9yZ2V0IHRvIOKAmCNpbmNsdWRlIDxzdGRhcmcuaD7igJk/Cisg
ICAzMiB8ICNpbmNsdWRlIDxzZXRqbXAuaD4KKyAgKysrIHwrI2luY2x1ZGUgPHN0ZGFyZy5oPgor
ICAgMzMgfCAjaW5jbHVkZSA8c3RkaW8uaD4KKy0tLS0tCisKK1NpZ25lZC1vZmYtYnk6IEthZGFt
YmluaSBOZW1hIDxrYWRhbWJpbmkubmVtYUBnbWFpbC5jb20+CitVcHN0cmVhbTogaHR0cHM6Ly9n
aXRodWIuY29tL2VzbmV0L2lwZXJmL3B1bGwvMTg4OAorLS0tCisgc3JjL2lwZXJmX2FwaS5jIHwg
MSAtCisgc3JjL2lwZXJmX2FwaS5oIHwgMSArCisgMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQorCitkaWZmIC0tZ2l0IGEvc3JjL2lwZXJmX2FwaS5jIGIvc3Jj
L2lwZXJmX2FwaS5jCitpbmRleCBhZWVjOTFkZDMuLmQ0YTA2YmVjOSAxMDA2NDQKKy0tLSBhL3Ny
Yy9pcGVyZl9hcGkuYworKysrIGIvc3JjL2lwZXJmX2FwaS5jCitAQCAtNTMsNyArNTMsNiBAQAor
ICNpbmNsdWRlIDxzeXMvc3RhdC5oPgorICNpbmNsdWRlIDxzY2hlZC5oPgorICNpbmNsdWRlIDxz
ZXRqbXAuaD4KKy0jaW5jbHVkZSA8c3RkYXJnLmg+CisgI2luY2x1ZGUgPG1hdGguaD4KKyAKKyAj
aWYgZGVmaW5lZChIQVZFX0NQVVNFVF9TRVRBRkZJTklUWSkKK2RpZmYgLS1naXQgYS9zcmMvaXBl
cmZfYXBpLmggYi9zcmMvaXBlcmZfYXBpLmgKK2luZGV4IDAzZDI3M2U4Yy4uY2Q4MmU2ZjliIDEw
MDY0NAorLS0tIGEvc3JjL2lwZXJmX2FwaS5oCisrKysgYi9zcmMvaXBlcmZfYXBpLmgKK0BAIC0z
MCw2ICszMCw3IEBACisgI2luY2x1ZGUgPHN5cy9zb2NrZXQuaD4KKyAjaW5jbHVkZSA8c3lzL3Rp
bWUuaD4KKyAjaW5jbHVkZSA8c2V0am1wLmg+CisrI2luY2x1ZGUgPHN0ZGFyZy5oPgorICNpbmNs
dWRlIDxzdGRpby5oPgorICNpbmNsdWRlIDxzdGRpbnQuaD4KKyAjaWZkZWYgX19jcGx1c3BsdXMK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvaXBlcmYzL2lwZXJmMy5oYXNoIGIvcGFja2FnZS9pcGVyZjMv
aXBlcmYzLmhhc2gKaW5kZXggMmFlZjc2NTc4YS4uMWZmYjJjNmMwMiAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9pcGVyZjMvaXBlcmYzLmhhc2gKKysrIGIvcGFja2FnZS9pcGVyZjMvaXBlcmYzLmhhc2gK
QEAgLTEsNCArMSw0IEBACi0jIEZyb20gaHR0cHM6Ly9kb3dubG9hZHMuZXMubmV0L3B1Yi9pcGVy
Zi9pcGVyZi0zLjE4LnRhci5nei5zaGEyNTYKLXNoYTI1NiAgYzA2MTgxNzU1MTQzMzFlNzY2NTIy
NTAwZTIwYzk0YmZiMjkzYjQ0MjRlYjI3ZDcyMDdmYjQyN2I4OGQyMGJhYiAgaXBlcmYtMy4xOC50
YXIuZ3oKKyMgRnJvbSBodHRwczovL2Rvd25sb2Fkcy5lcy5uZXQvcHViL2lwZXJmL2lwZXJmLTMu
MTkudGFyLmd6LnNoYTI1Ngorc2hhMjU2ICAwNDAxNjFkYTE1NTVlYzc0MTFhOWQ4MTE5MTA0OTgz
MGVmMzc3MTdkNDI5YTk0ZWU2Y2YwODQyNjE4ZTBlMjljICBpcGVyZi0zLjE5LnRhci5negogIyBM
b2NhbGx5IGNvbXB1dGVkCi1zaGEyNTYgIDNkYzNlMjA3NmRkOWNkZWEyYjY2ZDhmZTIxMzk5N2Zm
MjVmYjYxNzE1OTRmMDU1YjU5ZmUyNTMyMWI0MzhmNmYgIExJQ0VOU0UKK3NoYTI1NiAgN2M5YmEw
Mzg1ZmNmMzVjNGM5ZTA4YWQwYzBjYmE3MmQ0MzE1ZjM2ZjBmNzQyZmVmNGRlODI2YTI4Y2MzM2E5
NyAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9pcGVyZjMvaXBlcmYzLm1rIGIvcGFja2Fn
ZS9pcGVyZjMvaXBlcmYzLm1rCmluZGV4IDc0NGVlMDcwYTQuLjY5YzQ3OTJmOTggMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvaXBlcmYzL2lwZXJmMy5taworKysgYi9wYWNrYWdlL2lwZXJmMy9pcGVyZjMu
bWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1JUEVSRjNf
VkVSU0lPTiA9IDMuMTgKK0lQRVJGM19WRVJTSU9OID0gMy4xOQogSVBFUkYzX1NJVEUgPSBodHRw
czovL2Rvd25sb2Fkcy5lcy5uZXQvcHViL2lwZXJmCiBJUEVSRjNfU09VUkNFID0gaXBlcmYtJChJ
UEVSRjNfVkVSU0lPTikudGFyLmd6CiBJUEVSRjNfTElDRU5TRSA9IEJTRC0zLUNsYXVzZSwgQlNE
LTItQ2xhdXNlLCBNSVQKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
