Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05751CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 14:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8994D411CA;
	Sat, 30 May 2026 14:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lGDpm1azwIqt; Sat, 30 May 2026 14:35:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC5EC42B8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780151732;
	bh=SV6hcwYm5DG4Ljbe2OO1Nu1aL1209C1nxWXzqvYqd94=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=DlZp5mDEnDAerPdwmLQpOnfpgayzguz5VGcZYasuk8sV/Do1fr6QPTzLQESWcsNeh
	 hBC9cedfNWupGiimrPlcGeRgif0KM07sx6VHwloZWJzevtsApOWM+e84RMBl94DO0Z
	 QrWKC/za70Rc0mF5iqF82ByTQ/Xc7R5XEuNTSoOAt0rGeEkhUhFHjY0sT+dncOV2L4
	 L5YNkmKt59F87w6Ka0v2vNHvbWAAmZkIXpkowfvEHu5G7RZTkjJI00jd9sqJXh4BGI
	 GtDSMivkSNdbPwyr5/Rha9iYhjApG5oNjyp4wQuu1TD3fXibnMQkdz2IkYSo+qZDaj
	 9tbeEM2+f+6Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC5EC42B8A;
	Sat, 30 May 2026 14:35:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40FB212F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2736E61C13
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TpufsIZlZJ2Y for <buildroot@buildroot.org>;
 Sat, 30 May 2026 14:35:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D2CEB61BD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2CEB61BD9
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2CEB61BD9
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:35:30 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-45ef5146b56so810639f8f.0
 for <buildroot@buildroot.org>; Sat, 30 May 2026 07:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780151728; x=1780756528;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5d9o0XDJMfsoYREykIMVn9repzhM18inyaQoNha/Ykc=;
 b=Bezh/kFpVP54zJWXZkQSMuVfv6Q8u0t66Y4bY5BxghKLYNoLr4KuqFbUNk/L0HQPk7
 C95/jitza1458CnG5yHm3Uq7tg4lvg+tbhgODxSoartM+u6Jrz9mEBXyrEv/rUULbvMG
 L2RhRbTJzbfuGJOEo62mDL54ifBn/eXkyExKJmgeGQf7Hx4qverf0sGfpx9Ro+yoO/rM
 jwtXJeNYVxzABTCYviO8SQSIx2MQz4csdFrFDAvy7LmZw6LibAfY5NL8bVIEUC1LKS7R
 89AF3izY5NixzOg+esTn/yBxosIpUoEsDTqgn1bCDvpOo3pMZunq4GYvUBaW+LEbJmC4
 r+sw==
X-Gm-Message-State: AOJu0YxZqQ1vLOz7naWNmF154R9al5iSR9fBxiAAigC6TDEsZD1fAAFm
 PmptNkRUu0UxB1vz8eJKsiQxVX8TpkBm0epXSZg4n2qn1eucMW2VlCYB5V/YJw==
X-Gm-Gg: Acq92OHtPprQkiZ0zQ8GUr3mUZPJuBpb3OpijrwAmtVa6T9ngTCMAxnrrzvKd0k1rS5
 ntXl2SHhhyVfySdsUT3GoCK1J3L3c7PeQgO5Z4aY1Msj9YZL9I9oU9O7bDWV4hAdjRI/xSvnS5T
 aSfCYCgK3Bgc8JfwIhgNTNVBuhPNddVB2dYcwrIygr0nxNW9Jh+kvOaqrIu83gRYl5p2u9eAIma
 AphDWbkzSEgUXtNTrdiW7d7pi9ei+2eFyzPJbLH2oUoQJvCiLHbq1fvZRKbxfRjLB4kUmhsTZv8
 9Qyoy2auOHAqTYm9s4oN+IZM3YwW3Lc7oaTu84UboT+AKmIGm09ohK8QsDr9tU05TnzgF2QuPpk
 gjeWdKgFzt23vAkpQGE4mEnNiQAV4c2slvAaIxHWSDV1BhUzs2bBXIWykJ9HOrZRejTA70WZERG
 ZVdUgvonzoQCLIF6Dx802ZJVboasdLNLCiee44y9/M8JacVr2TMMtiu5roOFdOfVKseT4zAhP2z
 1NdltBeDUQXw8zl1Q==
X-Received: by 2002:a05:600c:5254:b0:48f:e044:927d with SMTP id
 5b1f17b1804b1-490a2a43b6cmr50405555e9.10.1780151728154; 
 Sat, 30 May 2026 07:35:28 -0700 (PDT)
Received: from x230.my.domain (94-40-87-20.alarmadi.pl. [94.40.87.20])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909ca72cfbsm115903935e9.8.2026.05.30.07.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 07:35:27 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 16:35:22 +0200
Message-ID: <20260530143523.438058-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780151728; x=1780756528; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5d9o0XDJMfsoYREykIMVn9repzhM18inyaQoNha/Ykc=;
 b=rsSPHxql3RhDsG/Gj7y0B+c7qng7nK8bPKPifmo07UDIG5C9CV9U/51RNAdVE17lUP
 /O+LWTzFk0XjzH83jo7TOC37RlmeyoWcb0Bx2IYuE7ctYz5EbJW5iORz3ApWkRwAEss8
 nWOnEWbLmRgpQvaziCakb+zHH55jjmb46fQS7TP+sqAYhuD4X+tHblyrik+Br0s1uaTy
 sneRpd15hn0Nq0h2HadcIjcAHYfsJAD4Kz4lS+1KMIR5keztiJyGN0moI/iFD+KlScuR
 KGWw2TPUlPDY410VpeNZ3sUxk3oyGXcTg9z8qsQ0CqS9q8QFadPO2OWcHr6FiIznSDHk
 EQjg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=rsSPHxql
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: bump version to
 20260529
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Petr Vorel <petr.vorel@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hhbmdlbG9nOgpodHRwczovL2dpdGh1Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC9yZWxl
YXNlcy90YWcvMjAyNjA1MjkKClJlbW92ZWQgcGF0Y2ggYmFja3BvcnRlZCBmcm9tIHRoaXMgcmVs
ZWFzZS4KClNpZ25lZC1vZmYtYnk6IFBldHIgVm9yZWwgPHBldHIudm9yZWxAZ21haWwuY29tPgot
LS0KIC4uLmZpbmUtX0dOVV9TT1VSQ0UtYW5kLWluY2x1ZGUtZmNudGwuaC5wYXRjaCB8IDg0IC0t
LS0tLS0tLS0tLS0tLS0tLS0KIHBhY2thZ2UvbHRwLXRlc3RzdWl0ZS9sdHAtdGVzdHN1aXRlLmhh
c2ggICAgICB8ICA0ICstCiBwYWNrYWdlL2x0cC10ZXN0c3VpdGUvbHRwLXRlc3RzdWl0ZS5tayAg
ICAgICAgfCAgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDg3IGRlbGV0
aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbHRwLXRlc3RzdWl0ZS8wMDAxLW9w
ZW5hdDItZGVmaW5lLV9HTlVfU09VUkNFLWFuZC1pbmNsdWRlLWZjbnRsLmgucGF0Y2gKCmRpZmYg
LS1naXQgYS9wYWNrYWdlL2x0cC10ZXN0c3VpdGUvMDAwMS1vcGVuYXQyLWRlZmluZS1fR05VX1NP
VVJDRS1hbmQtaW5jbHVkZS1mY250bC5oLnBhdGNoIGIvcGFja2FnZS9sdHAtdGVzdHN1aXRlLzAw
MDEtb3BlbmF0Mi1kZWZpbmUtX0dOVV9TT1VSQ0UtYW5kLWluY2x1ZGUtZmNudGwuaC5wYXRjaApk
ZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZTRiNjU0YjMxOS4uMDAwMDAwMDAwMAotLS0g
YS9wYWNrYWdlL2x0cC10ZXN0c3VpdGUvMDAwMS1vcGVuYXQyLWRlZmluZS1fR05VX1NPVVJDRS1h
bmQtaW5jbHVkZS1mY250bC5oLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsODQgKzAsMCBAQAot
RnJvbSA3NjdiM2U1MTllODUwOTVkZmVlM2E0N2QxNWEzNzNhNDAzZmUzZGFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQotRnJvbTogTGkgV2FuZyA8bGl3YW5nQHJlZGhhdC5jb20+Ci1EYXRlOiBU
dWUsIDMgRmViIDIwMjYgMTA6NDM6MTkgKzA4MDAKLVN1YmplY3Q6IFtQQVRDSF0gb3BlbmF0Mjog
ZGVmaW5lIF9HTlVfU09VUkNFIGFuZCBpbmNsdWRlIDxmY250bC5oPgotTUlNRS1WZXJzaW9uOiAx
LjAKLUNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAotQ29udGVudC1UcmFu
c2Zlci1FbmNvZGluZzogOGJpdAotCi1PbiBGZWRvcmEgUmF3aGlkZSAoZ2xpYmMgMi40MyspLCBs
aWJjIGV4cG9zZXMgb3BlbmF0MigpIGFuZCBzdHJ1Y3Qgb3Blbl9ob3csCi1zbyBvdXIgY29uZmln
dXJlIHNjcmlwdCBkZWZpbmVzIEhBVkVfT1BFTkFUMiBhbmQgdGhlIGZhbGxiYWNrIGRlZmluaXRp
b24gaW4KLWxhcGkvb3BlbmF0Mi5oIGdldHMgc2tpcHBlZC4gQnV0IG9wZW5hdDIwKi5jIG5ldmVy
IGluY2x1ZGVkIDxmY250bC5oPiAoYW5kCi1sYWNrZWQgX0dOVV9TT1VSQ0UpLCBzbyB0aGUgbGli
Yy1wcm92aWRlZCBwcm90b3R5cGUgYW5kIHN0cnVjdCBzdGF5ZWQgaGlkZGVuLAotc28gY29tcGls
YXRpb24gZmFpbGVkOgotCi0gICMgdW5hbWUgLXIKLSAgNi4xOC4wLTY1LmZjNDQueDg2XzY0Ci0K
LSAgIyBycG0gLXFmIC91c3IvaW5jbHVkZS9mY250bC5oCi0gIGdsaWJjLWRldmVsLTIuNDMtMS5m
YzQ0Lng4Nl82NAotCi0gICMgbm0gLUQgL3Vzci9saWI2NC9saWJjLnNvLjYgfCBncmVwIC13IG9w
ZW5hdDIKLSAgMDAwMDAwMDAwMDBlYjg5MCBXIG9wZW5hdDJAQEdMSUJDXzIuNDMKLQotICAjIG1h
a2UgLUMgdGVzdGNhc2Uva2VybmVsL3N5c2NhbGxzL29wZW5hdDIKLSAgb3BlbmF0MjAxLmM6Mjc6
NjI6IGVycm9yOiBpbnZhbGlkIGFwcGxpY2F0aW9uIG9mIOKAmHNpemVvZuKAmSB0byBpbmNvbXBs
ZXRlIHR5cGUg4oCYc3RydWN0IG9wZW5faG934oCZCi0gICAgMjcgfCAgICAgICAgIHsmZGlyX2Zk
LCBURVNUX0ZJTEUsIE9fUkRXUiwgU19JUldYVSwgMCwgJmhvdywgc2l6ZW9mKCpob3cpfSwKLQot
RGVmaW5lIF9HTlVfU09VUkNFIGFuZCBpbmNsdWRlIDxmY250bC5oPiBpbiBvcGVuYXQyIHRlc3Rz
IHRvIG1ha2UgdGhlCi1wcm90b3R5cGUgYXZhaWxhYmxlIGFuZCBmaXggdGhlIGJ1aWxkLgotCi1T
aWduZWQtb2ZmLWJ5OiBMaSBXYW5nIDxsaXdhbmdAcmVkaGF0LmNvbT4KLVJldmlld2VkLWJ5OiBQ
ZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4KLQotVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNv
bS9saW51eC10ZXN0LXByb2plY3QvbHRwL2NvbW1pdC83NjdiM2U1MTllODUwOTVkZmVlM2E0N2Qx
NWEzNzNhNDAzZmUzZGFiCi0KLVNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhs
cy5uZXQ+Ci0tLS0KLSB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL29wZW5hdDIvb3BlbmF0MjAx
LmMgfCAzICsrKwotIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvb3BlbmF0Mi9vcGVuYXQyMDIu
YyB8IDMgKysrCi0gdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9vcGVuYXQyL29wZW5hdDIwMy5j
IHwgMyArKysKLSAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQotCi1kaWZmIC0tZ2l0
IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9vcGVuYXQyL29wZW5hdDIwMS5jIGIvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9vcGVuYXQyL29wZW5hdDIwMS5jCi1pbmRleCBlY2Q2M2IxNTBl
NC4uNDBhYzJmNmQ5YWQgMTAwNjQ0Ci0tLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL29w
ZW5hdDIvb3BlbmF0MjAxLmMKLSsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvb3BlbmF0
Mi9vcGVuYXQyMDEuYwotQEAgLTQsNiArNCw5IEBACi0gICoKLSAgKiBCYXNpYyBvcGVuYXQyKCkg
dGVzdC4KLSAgKi8KLSsjZGVmaW5lIF9HTlVfU09VUkNFCi0rI2luY2x1ZGUgPGZjbnRsLmg+Ci0r
Ci0gI2luY2x1ZGUgInRzdF90ZXN0LmgiCi0gI2luY2x1ZGUgImxhcGkvb3BlbmF0Mi5oIgotIAot
ZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvb3BlbmF0Mi9vcGVuYXQyMDIu
YyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvb3BlbmF0Mi9vcGVuYXQyMDIuYwotaW5kZXgg
NmQxYjVhNjdjN2QuLjMyOWM2YTRhNWNiIDEwMDY0NAotLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9vcGVuYXQyL29wZW5hdDIwMi5jCi0rKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL29wZW5hdDIvb3BlbmF0MjAyLmMKLUBAIC00LDYgKzQsOSBAQAotICAqCi0gICogb3BlbmF0
MigpIHRlc3RzIHdpdGggdmFyaW91cyByZXNvbHZlIGZsYWdzLgotICAqLwotKyNkZWZpbmUgX0dO
VV9TT1VSQ0UKLSsjaW5jbHVkZSA8ZmNudGwuaD4KLSsKLSAjaW5jbHVkZSAidHN0X3Rlc3QuaCIK
LSAjaW5jbHVkZSAibGFwaS9vcGVuYXQyLmgiCi0gCi1kaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9vcGVuYXQyL29wZW5hdDIwMy5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9vcGVuYXQyL29wZW5hdDIwMy5jCi1pbmRleCA2YWM0OWVmNGM5ZS4uY2QwYzAwZDc1MjMg
MTAwNjQ0Ci0tLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL29wZW5hdDIvb3BlbmF0MjAz
LmMKLSsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvb3BlbmF0Mi9vcGVuYXQyMDMuYwot
QEAgLTQsNiArNCw5IEBACi0gICoKLSAgKiBCYXNpYyBvcGVuYXQyKCkgdGVzdCB0byBjaGVjayB2
YXJpb3VzIGZhaWx1cmVzLgotICAqLwotKyNkZWZpbmUgX0dOVV9TT1VSQ0UKLSsjaW5jbHVkZSA8
ZmNudGwuaD4KLSsKLSAjaW5jbHVkZSAidHN0X3Rlc3QuaCIKLSAjaW5jbHVkZSAibGFwaS9vcGVu
YXQyLmgiCi0gCmRpZmYgLS1naXQgYS9wYWNrYWdlL2x0cC10ZXN0c3VpdGUvbHRwLXRlc3RzdWl0
ZS5oYXNoIGIvcGFja2FnZS9sdHAtdGVzdHN1aXRlL2x0cC10ZXN0c3VpdGUuaGFzaAppbmRleCBl
MTg2MWFlNGU0Li4xMjg0MzYyMTM4IDEwMDY0NAotLS0gYS9wYWNrYWdlL2x0cC10ZXN0c3VpdGUv
bHRwLXRlc3RzdWl0ZS5oYXNoCisrKyBiL3BhY2thZ2UvbHRwLXRlc3RzdWl0ZS9sdHAtdGVzdHN1
aXRlLmhhc2gKQEAgLTEsNCArMSw0IEBACi0jIEZyb206IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51
eC10ZXN0LXByb2plY3QvbHRwL3JlbGVhc2VzL2Rvd25sb2FkLzIwMjYwMTMwL2x0cC1mdWxsLTIw
MjYwMTMwLnRhci54ei5zaGEyNTYKLXNoYTI1NiAgNWVmZmM5ZDNlYjNmNWNkNDVkNDdlOGFjM2Q3
OGY1OWNiOGYzZjczYzg1OThhMmYxODJlZjViNDBkZGZmZjMxMSAgbHRwLWZ1bGwtMjAyNjAxMzAu
dGFyLnh6CisjIEZyb206IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC10ZXN0LXByb2plY3QvbHRw
L3JlbGVhc2VzL2Rvd25sb2FkLzIwMjYwNTI5L2x0cC1mdWxsLTIwMjYwNTI5LnRhci54ei5zaGEy
NTYKK3NoYTI1NiAgNjg1ZDgzYzZlMzcwYWMwOTIwMWZiNzk1OTM0MTJmODY4ZmUwMzFlZTI4OTBl
MjA0YjU3MjdmZWRjZjUxZmI0NyAgbHRwLWZ1bGwtMjAyNjA1MjkudGFyLnh6CiAjIExvY2FsbHkg
Y29tcHV0ZWQKIHNoYTI1NiAgODE3N2Y5NzUxMzIxMzUyNmRmMmNmNjE4NGQ4ZmY5ODZjNjc1YWZi
NTE0ZDRlNjhhNDA0MDEwNTIxYjg4MDY0MyAgQ09QWUlORwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9s
dHAtdGVzdHN1aXRlL2x0cC10ZXN0c3VpdGUubWsgYi9wYWNrYWdlL2x0cC10ZXN0c3VpdGUvbHRw
LXRlc3RzdWl0ZS5tawppbmRleCAyZTQ3NjdiMWE1Li5kMWZiNDBlZDU1IDEwMDY0NAotLS0gYS9w
YWNrYWdlL2x0cC10ZXN0c3VpdGUvbHRwLXRlc3RzdWl0ZS5taworKysgYi9wYWNrYWdlL2x0cC10
ZXN0c3VpdGUvbHRwLXRlc3RzdWl0ZS5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCiAKLUxUUF9URVNUU1VJVEVfVkVSU0lPTiA9IDIwMjYwMTMwCitMVFBfVEVT
VFNVSVRFX1ZFUlNJT04gPSAyMDI2MDUyOQogTFRQX1RFU1RTVUlURV9TT1VSQ0UgPSBsdHAtZnVs
bC0kKExUUF9URVNUU1VJVEVfVkVSU0lPTikudGFyLnh6CiBMVFBfVEVTVFNVSVRFX1NJVEUgPSBo
dHRwczovL2dpdGh1Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC9yZWxlYXNlcy9kb3dubG9h
ZC8kKExUUF9URVNUU1VJVEVfVkVSU0lPTikKIAotLSAKMi41My4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
