Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636ECC369AB
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 22:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4B7D83A9F;
	Thu, 24 Apr 2025 22:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LoC9p4YsWu6o; Thu, 24 Apr 2025 22:49:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 701F783A86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 701F783A86;
	Thu, 24 Apr 2025 22:49:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC927159
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 22:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE95160AD9
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 22:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2lhM6meLl8WD for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 22:49:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D35AC60AD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D35AC60AD2
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D35AC60AD2
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 22:49:32 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7396f13b750so1742291b3a.1
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 15:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745534972; x=1746139772;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m0IwNnU3d5Lnyt51k1ehYovF6niJ+y7vKO4p14ksPCI=;
 b=WkdXovF8qGcqOhV6eClN4ILqXst3LLhzhBn+BI9DNlBi1FkSs2c1cBVx70dJLFJzki
 /4/3j3mS3Er9m+dPYtrbn86JCk+4fIptUrJAWnbp2iwAbT/e0k0m12zV1vP3tvxowgn9
 btlmKG1DQaiQbkws/rp9VhEFBBA+ErkpDAHw9jjGKgK+0NYvOdTaAXvs3NiqJuxtt/Ff
 R1P/9g99P/1mZSpG5ju1vleu08UdirZfzN5BFnmT5UYHfwdeVna5Rz4NpdzTjcQxux1z
 9gwUhi1JX/NYcBpPr+PtstG2wQDQke7rWAxn7X3PFVqXoHLBaXqVFa/7V7aVrIHR22Lg
 f1zw==
X-Gm-Message-State: AOJu0Yz/WmwI098S8Ee9ytou9ihWiMz3pSsPfmwWseiyKrOXJLOyNm3+
 Uby7P/gGZRE+6CXh2wcx2+avQK0A14fi7T9H9G/ut4ddp8oG7S55OOqXpY3JwkDI0bl64hoQo9c
 j
X-Gm-Gg: ASbGncsQTIAc12eFvGpQzBCwcA0wSX6epqPDeVC3fiN4L+x9EBFVXj1RSrE71a1oQ+d
 WNLcC0qBHxYxdsCqvgkkhyF6w8VINWU/mdRq/BOFjMazrzY0MkM3IgIBxutipXpsVp2RGSgXPpW
 laOd3+QMg01qTqFXCVTpr8EbSxXk+qT3lDlLysYc1ztQYIf+TYy11vaS4+87Abnw7k7BvTgY9ro
 RMmT48u+Wm6ZMJNr3MSZKITe/B9kpM5jj4CLOXQ/uItZZ+Y1vTbqBCYvxVWQX0MqydCA/hb5huI
 v3ldhMK5RbzFKJ8UatGCZjeTtUW/k825cjvMbxxh3ihrSCLE0+yqqcc2
X-Google-Smtp-Source: AGHT+IHrDYhRQosRly7n0Cn+bO6F0wdhluKeBKNHuMyf7Jhb9diBvdQOP0Yr5K6WMOf+bvfGtf33Bw==
X-Received: by 2002:a05:6a00:1901:b0:736:4644:86ee with SMTP id
 d2e1a72fcca58-73fd74c8252mr3952b3a.14.1745534972097; 
 Thu, 24 Apr 2025 15:49:32 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25ac30f6sm1946525b3a.156.2025.04.24.15.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 15:49:31 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 24 Apr 2025 15:49:14 -0700
MIME-Version: 1.0
Message-Id: <20250424-fix_gmp_c23-v3-1-e3e984bd4254@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAOq/CmgC/32Myw6CMBBFf4XM2prShxRW/ocxpIwFZgElrWk0h
 H+3sDTG5bk356wQXSAXoSlWCC5RJD9nkKcCcLTz4Bg9MoPgQnMlFOvp1Q7T0qKQDGWlXK14x5W
 GbCzB5fuo3e6ZR4pPH95HPJX7+ruTSlayTqhK2Vob3V2ugZKPNOMZ/QR7Kok/usi65bJHw401F
 X7p27Z9AO0byFXoAAAA
X-Change-ID: 20250424-fix_gmp_c23-c374e940b045
To: buildroot@buildroot.org, Baruch Siach <baruch@tkos.co.il>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3634; i=charlie@rivosinc.com; 
 h=from:subject:message-id;
 bh=VPYYJ5wFqg2QRSUhPLmJMWMr7c1rTn6+H9qYfDTnAf8=; 
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQwbX/s+qMpFnuEs2yDnMMY2ozIyf3rtio+SKyaabYzcdm
 zh1dZ9jRykLgxgXg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABORnsPwP3ZTSp93zhWJ2rJt
 n3dcy7n7ePKv6bGfBOPdZL5puv+cOYWR4aZXMeN+vdqrTnn8JfLTtvnsz0mZuqq4M0L4o/lSk9h
 YTgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745534972; x=1746139772;
 darn=buildroot.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m0IwNnU3d5Lnyt51k1ehYovF6niJ+y7vKO4p14ksPCI=;
 b=06949N/f5Crsuz74HV5BxJlzw7L9OiHJMTdkOxc6tvR529GUacBmLe7U/gO9CSrW5O
 qkrUSiKCoHX/H9J5iv3A4lm7bsjX1Vx3wUQHw2xWxniFz285d5WHmMkZdBvBHAJJBQqh
 6GvS19rJSiyAWTxN3AI1o6e5N7WsWKTf7r8bUqOxzgUBAo8qaTJdZeUxgX12loT3z/9D
 ESogXzClQrLW77nJJqfjs8IboqjBktjS1kIz0eOL+jOpsMAdSgM1FC+kuactjuEeULrM
 WzhaMnX4120xPpY1urh0+hJmAtWfP/+wcqpOILwgBpkKR4NQj5t6pDH49c4/ZYpkzv2M
 MAtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=06949N/f
Subject: [Buildroot] [PATCH v3] package/gmp: Fix for c23
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

R01QIHdpbGwgbm90IGJ1aWxkIGZvciBhIEMgY29tcGlsZXIgY29uZmlndXJlZCBmb3IgYzIzIGJl
Y2F1c2UgaXRzCmF1dG9jb25mIHNjcmlwdHMgdXNlIGRlcHJlY2F0ZWQgZnVuY3Rpb24gcHJvdG90
eXBlcy4gSW5jbHVkZSBhbiB1cHN0cmVhbQpwYXRjaCB0aGF0IGZpeGVzIHRoaXMgaXNzdWUuCgpT
aWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgotLS0K
Q2hhbmdlcyBpbiB2MzoKLSBBZGQgc2lnbmVkLW9mZi1ieSB0byBnbXAgcGF0Y2gKLSBBZGQgY29t
bWVudCBwb2ludGluZyBvdXQgcGF0Y2ggcmVxdWlyaW5nIEdNUF9BVVRPUkVDT05GCi0gTGluayB0
byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDQyNC1maXhfZ21wX2MyMy12Mi0x
LWEwM2ZjODA4YTg3Y0ByaXZvc2luYy5jb20KCkNoYW5nZXMgaW4gdjI6Ci0gVXNlIGF1dG9yZWNv
bmYgaW5zdGVhZCBvZiBwYXRjaGluZyBjb25maWd1cmUKLSBMaW5rIHRvIHYxOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjUwNDI0LWZpeF9nbXBfYzIzLXYxLTEtYjI0NzRhOTU4NWI2QHJp
dm9zaW5jLmNvbQotLS0KIC4uLm00LUFkZC1wYXJhbWV0ZXItbmFtZXMtaW4tcHJvdG90eXBlLWZv
ci1nLnBhdGNoIHwgNTcgKysrKysrKysrKysrKysrKysrKysrKwogcGFja2FnZS9nbXAvZ21wLm1r
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArCiAyIGZpbGVzIGNoYW5nZWQs
IDU5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2dtcC8wMDAxLWFjaW5jbHVk
ZS5tNC1BZGQtcGFyYW1ldGVyLW5hbWVzLWluLXByb3RvdHlwZS1mb3ItZy5wYXRjaCBiL3BhY2th
Z2UvZ21wLzAwMDEtYWNpbmNsdWRlLm00LUFkZC1wYXJhbWV0ZXItbmFtZXMtaW4tcHJvdG90eXBl
LWZvci1nLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLmFhZjM0MTJjMTg3ZjhjYjhjMzA3YjhjM2MwZWM0YjQz
MjQ2ODQ4MzYKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2dtcC8wMDAxLWFjaW5jbHVkZS5t
NC1BZGQtcGFyYW1ldGVyLW5hbWVzLWluLXByb3RvdHlwZS1mb3ItZy5wYXRjaApAQCAtMCwwICsx
LDU3IEBACitGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgorRGF0ZTogU2F0LCAx
NSBNYXIgMjAyNSAxNzo1ODo0MCArMDEwMAorU3ViamVjdDogW1BBVENIXSBhY2luY2x1ZGUubTQ6
IEFkZCBwYXJhbWV0ZXIgbmFtZXMgaW4gcHJvdG90eXBlIGZvciBnKCkuCisKK1RoaXMgYWxsb3dz
IGl0IHRvIGNvbXBpbGUgd2l0aCBvbGRlciBnY2MgZS5nLiBnY2MtMTAKK3doaWNoIGRvZXMgbm90
IGhhdmUgYWxsb3cgcGFyYW1ldGVyIG5hbWUgb21pc3Npb24sIGl0IHJlc3VsdHMKK2luCisKK2Eu
YzogSW4gZnVuY3Rpb24g4oCYZ+KAmToKK2EuYzozOjg6IGVycm9yOiBwYXJhbWV0ZXIgbmFtZSBv
bWl0dGVkCisgICAgMyB8IHZvaWQgZyhpbnQsdDEgY29uc3QqLHQxLHQyLHQxIGNvbnN0KixpbnQp
e30KKyAgICAgIHwgICAgICAgIF5+fgorCit0aGlzIHdhcyBhZGRlZCB0byBnY2MgdmlhIFsxXSB0
aGF0cyB3aHkgaXQgaXMgc3VwcG9ydGVkIGluCituZXdlciBnY2MuCisKK0FkZGluZyB0aGUgcGFy
YW1ldGVyIG5hbWVzIG1ha2UgaXQgY29tcGF0aWJsZSB3aXRoCitvbGQgYW5kIG5ldyBnY2MKKwor
WzFdIGh0dHBzOi8vZ2NjLmdudS5vcmcvcGlwZXJtYWlsL2djYy1jdnMvMjAyMC1PY3RvYmVyLzMz
NjA2OC5odG1sCisKK1NpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbSBhdCBnbWFpbC5j
b20+CitTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29t
PgorVXBzdHJlYW06IGh0dHBzOi8vZ21wbGliLm9yZy9saXN0LWFyY2hpdmVzL2dtcC1kZXZlbC8y
MDI1LU1hcmNoLzAwNjI5NC5odG1sCistLS0KKyBDaGFuZ2VMb2cgICAgfCA0ICsrKysKKyBhY2lu
Y2x1ZGUubTQgfCAyICstCisgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKKworZGlmZiAtLWdpdCBhL0NoYW5nZUxvZyBiL0NoYW5nZUxvZworaW5kZXggMjkw
MmNkMi4uZGY0MjA3NiAxMDA2NDQKKy0tLSBhL0NoYW5nZUxvZworKysrIGIvQ2hhbmdlTG9nCitA
QCAtMSwzICsxLDcgQEAKKysyMDI1LTAzLTE1ICBLaGVtIFJhaiA8cmFqLmtoZW0gYXQgZ21haWwu
Y29tPgorKworKwkqIGFjaW5jbHVkZS5tNDogQWRkIHBhcmFtZXRlciBuYW1lcyB0byBmdW5jdGlv
biBwcm90b3R5cGUuCisrCisgMjAyMy0wNy0yOSAgVG9yYmrDtnJuIEdyYW5sdW5kICA8dGdAZ21w
bGliLm9yZz4KKyAKKyAJKiBWZXJzaW9uIDYuMy4wIHJlbGVhc2VkLgorZGlmZiAtLWdpdCBhL2Fj
aW5jbHVkZS5tNCBiL2FjaW5jbHVkZS5tNAoraW5kZXggOWNmOTQ4My4uMWZkMGQ0ZiAxMDA2NDQK
Ky0tLSBhL2FjaW5jbHVkZS5tNAorKysrIGIvYWNpbmNsdWRlLm00CitAQCAtNjA5LDcgKzYwOSw3
IEBAIEdNUF9QUk9HX0NDX1dPUktTX1BBUlQoWyQxXSwgW2xvbmcgbG9uZyByZWxpYWJpbGl0eSB0
ZXN0IDFdLAorIAorICNpZiBkZWZpbmVkIChfX0dOVUNfXykgJiYgISBkZWZpbmVkIChfX2NwbHVz
cGx1cykKKyB0eXBlZGVmIHVuc2lnbmVkIGxvbmcgbG9uZyB0MTt0eXBlZGVmIHQxKnQyOworLXZv
aWQgZygpe30KKyt2b2lkIGcoaW50IGEsdDEgY29uc3QqIGIsdDEgYyx0MiBkLHQxIGNvbnN0KiBl
LGludCBmKXt9Cisgdm9pZCBoKCl7fQorIHN0YXRpYyBfX2lubGluZV9fIHQxIGUodDIgcnAsdDIg
dXAsaW50IG4sdDEgdjApCisge3QxIGMseCxyO2ludCBpO2lmKHYwKXtjPTE7Zm9yKGk9MTtpPG47
aSsrKXt4PXVwW2ldO3I9eCsxO3JwW2ldPXI7fX1yZXR1cm4gYzt9CistLSAKKzIuNDMuMAorCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL2dtcC9nbXAubWsgYi9wYWNrYWdlL2dtcC9nbXAubWsKaW5kZXgg
N2U4ZGE5MDI1YzkzYjk4YjU4MjBmMjk3YjZlYTM1NDk1OTczOTVhNS4uNzkwYzcwMjY4ZTgzMmQ1
ZjAyMTdiNGRlNzM0ZmE4YWQ5N2M0NWI4NCAxMDA2NDQKLS0tIGEvcGFja2FnZS9nbXAvZ21wLm1r
CisrKyBiL3BhY2thZ2UvZ21wL2dtcC5tawpAQCAtNyw2ICs3LDggQEAKIEdNUF9WRVJTSU9OID0g
Ni4zLjAKIEdNUF9TSVRFID0gJChCUjJfR05VX01JUlJPUikvZ21wCiBHTVBfU09VUkNFID0gZ21w
LSQoR01QX1ZFUlNJT04pLnRhci54egorIyAwMDAxLWFjaW5jbHVkZS5tNC1BZGQtcGFyYW1ldGVy
LW5hbWVzLWluLXByb3RvdHlwZS1mb3ItZy5wYXRjaAorR01QX0FVVE9SRUNPTkYgPSBZRVMKIEdN
UF9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKIEdNUF9MSUNFTlNFID0gTEdQTC0zLjArIG9yIEdQTC0y
LjArCiBHTVBfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcuTEVTU0VSdjMgQ09QWUlOR3YyCgotLS0K
YmFzZS1jb21taXQ6IDFmYzUxYWJjMjdkMzdjMjg3NDgyM2FiODY0ZGIwZjMyYWU3NzRlYjYKY2hh
bmdlLWlkOiAyMDI1MDQyNC1maXhfZ21wX2MyMy1jMzc0ZTk0MGIwNDUKLS0gCi0gQ2hhcmxpZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
