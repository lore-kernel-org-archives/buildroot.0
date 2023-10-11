Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9792DCD98F6
	for <buildroot@archiver.kernel.org>; Wed, 11 Oct 2023 07:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42C8F417DB;
	Wed, 11 Oct 2023 07:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42C8F417DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KULhYue7tMXO; Wed, 11 Oct 2023 07:35:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7965241181;
	Wed, 11 Oct 2023 07:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7965241181
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 302091BF391
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 07:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0968560BF0
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 07:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0968560BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h9_noWpoJVtJ for <buildroot@lists.busybox.net>;
 Wed, 11 Oct 2023 07:35:17 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9CE9D60B6C
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 07:35:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CE9D60B6C
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9ae7383b7ecso136229666b.0
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 00:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697009715; x=1697614515;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zEcrcjP140V4s8IPTX+On/jJcFW6eWY1Ljm65fl8BPM=;
 b=RF8tLYefajXAo6MEqxIfOF229XzPqYsmMNNMtfcU8vd8xeJHuqwEXi9+JohLZTdtgD
 cvN8ToLnXeGSsgmnrkrEA8nrWxRDyCFN5GasFBSW6fJI4uJ3W5Pu+xSE+YgltVTJDoiv
 TA/CshZWk+0uy7rhR8wlH987DAtWTBl62uMqehZAHAeBE1Ou1NMskD0XdW22xIgClUaY
 WmXMbIXxkhtXhyxjtslrDJZheptTS0xun1BTOSpkkHCox4Tk4+R2Pd3Hv2N4KkTJ5V4s
 tAq+TJXRodIYxj0Lt4iixIqADkj+N7p3zP3pOhK/z9GDcbyBL8uRhj/40M+D1IXFpswu
 JIDg==
X-Gm-Message-State: AOJu0YwyH2LT3rhLWMO/dNckYFA0xs26tqIu5wwD32p/rloo+A6dSEL0
 rjzkIuWZChBBjLP1jpJWiW0DqxLmmQPaCgqwBG0=
X-Google-Smtp-Source: AGHT+IEHhAHEyWPINSvcI8OxE+HE6WV8yfm0hV8tWKRuiu128d07xT5KFWw/GjkkyvNKzYsh7kY0Vw==
X-Received: by 2002:a17:906:cc14:b0:9bb:a243:e6fb with SMTP id
 ml20-20020a170906cc1400b009bba243e6fbmr2410380ejb.3.1697009715437; 
 Wed, 11 Oct 2023 00:35:15 -0700 (PDT)
Received: from localhost.localdomain (ip-89-177-240-140.bb.vodafone.cz.
 [89.177.240.140]) by smtp.gmail.com with ESMTPSA id
 c12-20020a170906694c00b009b8a4f9f20esm9436859ejs.102.2023.10.11.00.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 00:35:15 -0700 (PDT)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Wed, 11 Oct 2023 09:35:05 +0200
Message-Id: <20231011073506.687039-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1697009715; x=1697614515; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zEcrcjP140V4s8IPTX+On/jJcFW6eWY1Ljm65fl8BPM=;
 b=Jlck4RRr0z4QMJYbwXcPVU4BJg2Y1gGetJjLssRmHwTb24cowLSMsiMpSBjnE/WL6S
 u8hN1TYncwZavrGKUGQvfzbwec/6VhIMIPfopMbGwX7Qi9ln4sXrTpRUvx2+/28aguhk
 bP/zYzpDqFOBZ1QDvbsUxT/Y6bKQfcdXi7okT7HBdjkh5PzU+WdwvY3OlgmeXpba5Q7q
 iUxIGb1fn6B9myQNNn8ck4BKFwDLa7Yp5ZVWv4YeRhoFRW42o5hNlkVoLRrPEU9ubS/o
 h+VYw1aKVF6daE4YA5WLuhiWIaylOycwt21Qfm35pyhE6QyFw/ThnrYalx7k9UcfCJi7
 dtMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz
 header.a=rsa-sha256 header.s=google header.b=Jlck4RRr
Subject: [Buildroot] [PATCH] package/libcurl: security bump to 8.4.0
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
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXMgZm9sbG93aW5nIHR3byB2dWxuZXJhYmlsaXRpZXM6CgoqIENWRS0yMDIzLTM4NTQ1OiBT
T0NLUzUgaGVhcCBidWZmZXIgb3ZlcmZsb3cKICBodHRwczovL2N1cmwuc2UvZG9jcy9DVkUtMjAy
My0zODU0NS5odG1sCiogQ1ZFLTIwMjMtMzg1NDY6IGNvb2tpZSBpbmplY3Rpb24gd2l0aCBub25l
IGZpbGUKICBodHRwczovL2N1cmwuc2UvZG9jcy9DVkUtMjAyMy0zODU0Ni5odG1sCgpTaWduZWQt
b2ZmLWJ5OiBKYW4gxIxlcm3DoWsgPHNhaXJvbkBzYWlyb24uY3o+Ci0tLQogcGFja2FnZS9saWJj
dXJsL2xpYmN1cmwuaGFzaCB8IDQgKystLQogcGFja2FnZS9saWJjdXJsL2xpYmN1cmwubWsgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliY3VybC9saWJjdXJsLmhhc2ggYi9wYWNrYWdlL2xpYmN1
cmwvbGliY3VybC5oYXNoCmluZGV4IDM3MWQyMGE2MzIuLmVjZDVkNjM5MDkgMTAwNjQ0Ci0tLSBh
L3BhY2thZ2UvbGliY3VybC9saWJjdXJsLmhhc2gKKysrIGIvcGFja2FnZS9saWJjdXJsL2xpYmN1
cmwuaGFzaApAQCAtMSw1ICsxLDUgQEAKICMgTG9jYWxseSBjYWxjdWxhdGVkIGFmdGVyIGNoZWNr
aW5nIHBncCBzaWduYXR1cmUKLSMgaHR0cHM6Ly9jdXJsLnNlL2Rvd25sb2FkL2N1cmwtOC4zLjAu
dGFyLnh6LmFzYworIyBodHRwczovL2N1cmwuc2UvZG93bmxvYWQvY3VybC04LjQuMC50YXIueHou
YXNjCiAjIHNpZ25lZCB3aXRoIGtleSAyN0VERUFGMjJGM0FCQ0VCNTBEQjlBMTI1Q0M5MDhGREI3
MUUxMkMyCi1zaGEyNTYgIDM3NmQ2Mjc3NjdkNmM0ZjA1MTA1YWI2ZDQ5N2IwZDlhYmE3MTExNzcw
ZGQ5ZDk5NTIyNTQ3ODIwOWMzN2VhNjMgIGN1cmwtOC4zLjAudGFyLnh6CitzaGEyNTYgIDE2YzYy
YTljNGFmMGY3MDNkMjhiZGE2ZDdiYmYzN2JhNDcwNTVhZDM0MTRkNzBkZWM2M2UyZTYzMzZmMmE4
MmQgIGN1cmwtOC40LjAudGFyLnh6CiBzaGEyNTYgIGIxZDdmZWI5NDllYTUwMjM1NTIwMjlmYmUw
YmY1ZGI0ZjIzYzJmODVlOWI4ZTUxZTE4NTM2ZjBlY2JmOWM1MjQgIENPUFlJTkcKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbGliY3VybC9saWJjdXJsLm1rIGIvcGFja2FnZS9saWJjdXJsL2xpYmN1cmwu
bWsKaW5kZXggZGQ0Y2Y0M2M2YS4uYmQzMzFhNTVhYSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJj
dXJsL2xpYmN1cmwubWsKKysrIGIvcGFja2FnZS9saWJjdXJsL2xpYmN1cmwubWsKQEAgLTQsNyAr
NCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1MSUJDVVJMX1ZFUlNJT04gPSA4
LjMuMAorTElCQ1VSTF9WRVJTSU9OID0gOC40LjAKIExJQkNVUkxfU09VUkNFID0gY3VybC0kKExJ
QkNVUkxfVkVSU0lPTikudGFyLnh6CiBMSUJDVVJMX1NJVEUgPSBodHRwczovL2N1cmwuc2UvZG93
bmxvYWQKIExJQkNVUkxfREVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25mIFwKLS0gCjIuMzQuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
