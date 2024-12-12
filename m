Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CC9E7717F
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 07:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A933840A1;
	Thu, 12 Dec 2024 07:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bQ3SEPgCp3ih; Thu, 12 Dec 2024 07:56:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 516DA8408F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 516DA8408F;
	Thu, 12 Dec 2024 07:56:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 363AD1147
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 07:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16D6440D03
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 07:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1pHqCZvDfahX for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 07:56:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7FA1840C0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FA1840C0F
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FA1840C0F
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 07:56:36 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-38633b5dbcfso218732f8f.2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 23:56:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733990194; x=1734594994;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wfRzFBr5D25+WSG5jI0H0IHvFTuQq/ZUrVKcZHpOZgs=;
 b=HHYAEbpVx94Ziqs/VfvyVPfvaGddEOHfS6WOUrp7w8tEMHSSwIwe98safnsV4O9Jo8
 uR6Ie9RN9tzP2LEbmkRlFJrXHbbCfX96vWPo3L/FfsPIYW2C9ziFvSsbMV8y2wJJyqmb
 fHNkblCQLr6HhgkpBu9bnEjHBt4SKJf3Yud+cEq9pv2sZ6ZLsvwrWyUTf0PDWwn1p7x5
 zPFFMEuOGIiCiZhKBnR3lxPLIWHXspC+Y1Vs9Ib6z3YsmoPu9N9ubcakg7fpWl0wgDBv
 9Ee/LvmUFOv+ObqFEtnPr7HGTLOATuOgu/5izTHr8l9Y7EgjvfRgVJwqFkZhIgLVAHqM
 GTFw==
X-Gm-Message-State: AOJu0YyQAh0MxkEUIxVxVNadue6mmDYLcjnwoGYlHt5hQItJXD+F2kUq
 JVgxGWSHIDA9lHuRPcJRFuO3Cgo91x6SGO3FTWrqznwvUHbzy7FmldHGcA==
X-Gm-Gg: ASbGncuoe9nWUg9IZevQ9AxSW8HozGyQK0e3gWK+GEKYgAowsYBWfAMHvBvTUkRcRfa
 eqcPBa9scMLYHZ822FzcdKzaCP5+W3kqBWCKtBz0TUFRY5zUeB8iASDdifjf7BvdihNDjaHlcEF
 b3IcoyWIGBTmS2eIj4WSuitQS4/wqBC4eWKStt5U5g6MaDug+EN7RwqV/lFki7W/uGQVmJIWWTB
 BnPqsiBl5oO7AH0TU1INmEbJc+lpa1+eICaQrkOXfZ2ZsDrZMUs437wlGL2wGLdIZU7p5VRd2W0
 pXy5q5d4CzaSX8iwnA==
X-Google-Smtp-Source: AGHT+IHoTtwoGYEFyQEHw8hewMwFs/puYK78pg27Zawyzk36K3jBSu+cja7Oh/f6G7hlLoMrx6xhsw==
X-Received: by 2002:a05:6000:1fa5:b0:382:4ab4:b3e5 with SMTP id
 ffacd0b85a97d-3864cde8070mr5450409f8f.0.1733990194158; 
 Wed, 11 Dec 2024 23:56:34 -0800 (PST)
Received: from cuervo.intranet.jlsalvador.online ([78.30.22.138])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824bf249sm3238903f8f.52.2024.12.11.23.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 23:56:33 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>
Date: Thu, 12 Dec 2024 08:55:58 +0100
Message-ID: <20241212075557.1736787-2-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733990194; x=1734594994; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wfRzFBr5D25+WSG5jI0H0IHvFTuQq/ZUrVKcZHpOZgs=;
 b=QoLIm5x4ay3siGgJGxxNH07Xv+zATTZhXHoQxt4TlWcdamux6gjd3HC8XIRJ59Z1zj
 j+WcO2Twuor7pf0HKXXB23P18Mv9q5/DnKKcdTwUn8KUphWMou3PtTnXUQWEw1Si6jDt
 bc0c36qRKczExBNaPbX+XIz0zPmAKTWSbNxke+w4gLhVAGzB8GGVok6HrajS6HH1ASMt
 ZysGBSv4d0X2PSMpNB3ZRAp5cGN+ALWsHLesIiFAu8HeRuVP7jkyxXilgWRaicc4hHxX
 cdeF3yWAicabvhvTYi6dW/aE48aGS0N43Pp0ouo9xVXHJSLdRI2w/RWMfMAy5Ltu/MRB
 YQAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QoLIm5x4
Subject: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.2.7
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

UmVtb3ZlZCBiYWNrcG9ydGVkIHBhdGNoOgotIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pm
cy9jb21taXQvYmQ5NDliMTBiZWQzZDk5ZTNiNDAyNDlkOWM4ZDc0YTBiNDMwNDc3NC5wYXRjaAoK
U2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVp
c0BnbWFpbC5jb20+Ci0tLQogLi4ubGwtZml4LWZvci1TRUVLX0RBVEEtU0VFS19IT0xFLXRlc3Rz
LnBhdGNoIHwgNzAgLS0tLS0tLS0tLS0tLS0tLS0tLQogcGFja2FnZS96ZnMvemZzLmhhc2ggICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0KIHBhY2thZ2UvemZzL3pmcy5tayAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgNzMgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS96ZnMvMDAw
MS1aVFMtc21hbGwtZml4LWZvci1TRUVLX0RBVEEtU0VFS19IT0xFLXRlc3RzLnBhdGNoCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS96ZnMvMDAwMS1aVFMtc21hbGwtZml4LWZvci1TRUVLX0RBVEEtU0VF
S19IT0xFLXRlc3RzLnBhdGNoIGIvcGFja2FnZS96ZnMvMDAwMS1aVFMtc21hbGwtZml4LWZvci1T
RUVLX0RBVEEtU0VFS19IT0xFLXRlc3RzLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCA2NDk3MmM0ZjU3Li4wMDAwMDAwMDAwCi0tLSBhL3BhY2thZ2UvemZzLzAwMDEtWlRTLXNt
YWxsLWZpeC1mb3ItU0VFS19EQVRBLVNFRUtfSE9MRS10ZXN0cy5wYXRjaAorKysgL2Rldi9udWxs
CkBAIC0xLDcwICswLDAgQEAKLUZyb20gMmNjZWZkNGFmZjk4Y2YzNTVjN2QxM2IzZjkyYmI0ZDM5
MGRmYTUyMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFRpbm8gUmVpY2hhcmR0IDxt
aWxreS16ZnNAbWNtaWxrLmRlPgotRGF0ZTogU3VuLCA0IEF1ZyAyMDI0IDExOjU4OjEzICswMjAw
Ci1TdWJqZWN0OiBbUEFUQ0hdIFpUUzogc21hbGwgZml4IGZvciBTRUVLX0RBVEEvU0VFS19IT0xF
IHRlc3RzCi0KLVNvbWUgbGliYydzIGxpa2UgdUNsaWJjIGxhZyB0aGUgcHJvcGVyIGRlZmluaXRp
b24gb2YgU0VFS19EQVRBCi1hbmQgU0VFS19IT0xFLiBTaW5jZSB3ZSBoYXZlIG9ubHkgdHdvIGZp
bGVzIGluIFpUUyB3aGljaCB1c2UKLXRoZXNlIGRlZmluaXRvbnMsIGxldCdzIGRlZmluZSB0aGVt
IGJ5IGhhbmQ6Ci0KLWBgYAotI2lmbmRlZiBTRUVLX0RBVEEKLSNkZWZpbmUgU0VFS19EQVRBIDMK
LSNlbmRpZgotI2lmbmRlZiBTRUVLX0hPTEUKLSNkZWZpbmUgU0VFS19IT0xFIDQKLSNlbmRpZgot
YGBgCi0KLVRoZXJlIHNob3VsZCBiZSBubyBmYWlsdXJlcywgYmVjYXVzZToKLS0gRnJlZUJTRCBo
YXMgc3VwcG9ydCBmb3IgU0VFS19EQVRBL1NFRUtfSE9MRSBzaW5jZSBGcmVlQlNEIDgKLS0gTGlu
dXggaGFzIGl0IHNpbmNlIExpbnV4IDMuMQotLSB0aGUgbGliYyB3aWxsIHN1Ym1pdCB0aGUgcGFy
YW1ldGVycyB1bmNoYW5nZWQgdG8gdGhlIGtlcm5lbAotCi1TaWduZWQtb2ZmLWJ5OiBUaW5vIFJl
aWNoYXJkdCA8bWlsa3ktemZzQG1jbWlsay5kZT4KLVNpZ25lZC1vZmYtYnk6IEpvc8OpIEx1aXMg
U2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPgotVXBzdHJlYW06IGh0
dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9jb21taXQvYmQ5NDliMTBiZWQzZDk5ZTNiNDAy
NDlkOWM4ZDc0YTBiNDMwNDc3NAotLS0tCi0gdGVzdHMvemZzLXRlc3RzL2NtZC9tbWFwX3NlZWsu
YyAgICAgICAgICAgICAgICAgICAgICAgfCAxMCArKysrKysrKysrCi0gdGVzdHMvemZzLXRlc3Rz
L3Rlc3RzL2Z1bmN0aW9uYWwvY3BfZmlsZXMvc2Vla2Zsb29kLmMgfCAgNyArKysrKysrCi0gMiBm
aWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCi0KLWRpZmYgLS1naXQgYS90ZXN0cy96ZnMt
dGVzdHMvY21kL21tYXBfc2Vlay5jIGIvdGVzdHMvemZzLXRlc3RzL2NtZC9tbWFwX3NlZWsuYwot
aW5kZXggN2JlOTJkMTA5NTY1Li4yZDI1MDU1NGExM2YgMTAwNjQ0Ci0tLS0gYS90ZXN0cy96ZnMt
dGVzdHMvY21kL21tYXBfc2Vlay5jCi0rKysgYi90ZXN0cy96ZnMtdGVzdHMvY21kL21tYXBfc2Vl
ay5jCi1AQCAtMzUsNiArMzUsMTYgQEAKLSAjaW5jbHVkZSA8bGludXgvZnMuaD4KLSAjZW5kaWYK
LSAKLSsvKiBzb21lIG9sZGVyIHVDbGliYydzIGxhY2sgdGhlIGRlZmluZXMsIHNvIHdlJ2xsIG1h
bnVhbGx5IGRlZmluZSB0aGVtICovCi0rI2lmZGVmCV9fVUNMSUJDX18KLSsjaWZuZGVmCVNFRUtf
REFUQQotKyNkZWZpbmUJU0VFS19EQVRBIDMKLSsjZW5kaWYKLSsjaWZuZGVmCVNFRUtfSE9MRQot
KyNkZWZpbmUJU0VFS19IT0xFIDQKLSsjZW5kaWYKLSsjZW5kaWYKLSsKLSBzdGF0aWMgdm9pZAot
IHNlZWtfZGF0YShpbnQgZmQsIG9mZl90IG9mZnNldCwgb2ZmX3QgZXhwZWN0ZWQpCi0gewotZGlm
ZiAtLWdpdCBhL3Rlc3RzL3pmcy10ZXN0cy90ZXN0cy9mdW5jdGlvbmFsL2NwX2ZpbGVzL3NlZWtm
bG9vZC5jIGIvdGVzdHMvemZzLXRlc3RzL3Rlc3RzL2Z1bmN0aW9uYWwvY3BfZmlsZXMvc2Vla2Zs
b29kLmMKLWluZGV4IDAyYzJjOGU2ZWNhNS4uZjgzMmRiODU5NzBkIDEwMDY0NAotLS0tIGEvdGVz
dHMvemZzLXRlc3RzL3Rlc3RzL2Z1bmN0aW9uYWwvY3BfZmlsZXMvc2Vla2Zsb29kLmMKLSsrKyBi
L3Rlc3RzL3pmcy10ZXN0cy90ZXN0cy9mdW5jdGlvbmFsL2NwX2ZpbGVzL3NlZWtmbG9vZC5jCi1A
QCAtMzYsNiArMzYsMTMgQEAKLSAjaW5jbHVkZSA8c3lzL3N0YXQuaD4KLSAjaW5jbHVkZSA8c3lz
L3dhaXQuaD4KLSAKLSsvKiBzb21lIG9sZGVyIHVDbGliYydzIGxhY2sgdGhlIGRlZmluZXMsIHNv
IHdlJ2xsIG1hbnVhbGx5IGRlZmluZSB0aGVtICovCi0rI2lmZGVmCV9fVUNMSUJDX18KLSsjaWZu
ZGVmCVNFRUtfREFUQQotKyNkZWZpbmUJU0VFS19EQVRBIDMKLSsjZW5kaWYKLSsjZW5kaWYKLSsK
LSAjZGVmaW5lCURBVEFTSVpFCSg0MDk2KQotIGNoYXIgZGF0YVtEQVRBU0laRV07Ci0gCmRpZmYg
LS1naXQgYS9wYWNrYWdlL3pmcy96ZnMuaGFzaCBiL3BhY2thZ2UvemZzL3pmcy5oYXNoCmluZGV4
IDUwZTUzOTEwZmEuLmNlMWUwMTBkNmQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvemZzL3pmcy5oYXNo
CisrKyBiL3BhY2thZ2UvemZzL3pmcy5oYXNoCkBAIC0xLDUgKzEsNSBAQAotIyBGcm9tIGh0dHBz
Oi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9yZWxlYXNlcy9kb3dubG9hZC96ZnMtMi4yLjQvemZz
LTIuMi40LnNoYTI1Ni5hc2MKLXNoYTI1NiAgYzkyZTAyMTAzYWM1ZGQ3N2JmMDFkNzIwOWVhYmRj
YTU1YzdiMzM1NmFhNzQ3YmIyMzU3ZWM0MjIyNjUyYTJhNyAgemZzLTIuMi42LnRhci5negorIyBG
cm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9yZWxlYXNlcy9kb3dubG9hZC96ZnMt
Mi4yLjcvemZzLTIuMi43LnNoYTI1Ni5hc2MKK3NoYTI1NiAgYjJiOGUzYmZhYmYyYTY0MDdhMDEz
MjI0MzcyNmNiNjc2MjU0N2E1YmQwOTViMWIxZjM3ZWFmMmE5ZDhmNzY3MiAgemZzLTIuMi43LnRh
ci5negogCiAjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZXM6CiBzaGEyNTYgIDFmZmI3MGMzM2M0Zjc5
ZjA0ZTk0N2ZhY2M1Yzc4NTFmMjg5NjA5MjU2YWFjYjQ3ZmMxMTVmNzAwNDI3ZDk1MjAgIExJQ0VO
U0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvemZzL3pmcy5tayBiL3BhY2thZ2UvemZzL3pmcy5tawpp
bmRleCA5Y2VjZDQ5OWVkLi5iODYyMTRlNzUxIDEwMDY0NAotLS0gYS9wYWNrYWdlL3pmcy96ZnMu
bWsKKysrIGIvcGFja2FnZS96ZnMvemZzLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKIAotWkZTX1ZFUlNJT04gPSAyLjIuNgorWkZTX1ZFUlNJT04gPSAyLjIu
NwogWkZTX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFzZXMvZG93
bmxvYWQvemZzLSQoWkZTX1ZFUlNJT04pCiBaRlNfU0VMSU5VWF9NT0RVTEVTID0gemZzCiBaRlNf
TElDRU5TRSA9IENEREwKLS0gCjIuNDcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
