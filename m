Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205E7C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 14:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9837F416CE;
	Thu,  9 Nov 2023 14:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9837F416CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6OYHUYqcTj6r; Thu,  9 Nov 2023 14:20:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BDF9409F3;
	Thu,  9 Nov 2023 14:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BDF9409F3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CFFF41BF31F
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 14:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF6DF415A6
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 14:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF6DF415A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x9S9gbxHHK-u for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 14:20:17 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A89344154E
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 14:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A89344154E
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-507a5f2193bso1025188e87.1
 for <buildroot@buildroot.org>; Thu, 09 Nov 2023 06:20:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699539614; x=1700144414;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E1xuvO+jaNhq+fOu4rKfb3XZCA408WbO6foThf+XzZw=;
 b=Odz5O5a30jILEgP+9YPKWHpEScr24abbYQpb4O/AxGGV93DbjiBPWg+pDBXOhSHfaA
 Iaws9nsN2A55ku8pouc4QTaqM0LvYf8OV1Hulz3IEQ+uOCcf2eKlGblOqksrP0Ue/pGO
 CktrEyno9TBjyvxuFTYmst8a87eP8QLxQK9gQoMrXQ9JDqLO/ev0WVkGfm6RrHgy821h
 8XO6qeOXGZq1lQ0m0BBDMZNyqA5UkLpkFaWNtsriUg1tMxLDgznE4JCf87ZotDSoueKd
 KplJVfN+2gAPPovM4Mlvyqk0Q4j60puzNQVblHNDj73RNQ5ZuuMmx+djYwscnnYLn9LX
 ++KA==
X-Gm-Message-State: AOJu0YzY37j2ElwK0Pge43D4aU83HHiETmIEPQKLg/FapWrU79xrqyZE
 W5PwrM2vi8RSFIUebvhEKC0/5E4I1zj7lKVH7OM=
X-Google-Smtp-Source: AGHT+IHiZjzlIWTpUoLHGh2IeA4maMCTxRbjEU78FcncNOhncvuFM+Iw3kkjC/n1pPLdcuImuVosYg==
X-Received: by 2002:ac2:58f0:0:b0:509:4730:9103 with SMTP id
 v16-20020ac258f0000000b0050947309103mr782337lfo.6.1699539614234; 
 Thu, 09 Nov 2023 06:20:14 -0800 (PST)
Received: from nola.getinternet.no ([84.209.57.13])
 by smtp.gmail.com with ESMTPSA id
 be7-20020a056512250700b0050794b05c8asm1072864lfb.42.2023.11.09.06.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 06:20:13 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  9 Nov 2023 15:20:08 +0100
Message-Id: <20231109142009.3490104-1-jonhenrik@qbee.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qbee.io; s=google; t=1699539614; x=1700144414; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E1xuvO+jaNhq+fOu4rKfb3XZCA408WbO6foThf+XzZw=;
 b=iMkdrZ+U+Y4FHoiFCGallO4GTNOC6sSZXNgI3P3peJboM7pElT1NkyIjdqM/0RTy3J
 WyOZKSdxUNgyPYqs1FD35i2jLC01JJg2ll2Q/Zii6lZp22gKUmt2imIfCbl3tRZHGoIi
 O+I+mAlGE2kM0/8YldCqRk+JQyaqMbWYX7hX0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=qbee.io header.i=@qbee.io
 header.a=rsa-sha256 header.s=google header.b=iMkdrZ+U
Subject: [Buildroot] [PATCH 0/1] Regarding review of qbee-agent patch
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
From: =?utf-8?q?Jon_Henrik_Bj=C3=B8rnstad_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKVGhhbmtzIGZvciB0aGUgaW5pdGlhbCByZXZpZXcuIEkndmUgYXR0ZW1wdGVk
IHRvIGltcGxlbWVudCBtb3N0IG9mIHRoZSAKZmVlZGJhY2suCgpTb21lIG5vdGVzIG9uIGEgZmV3
IGl0ZW1zIHRoYXQgaGF2ZSBiZWVuIGxlZnQgdW5jaGFuZ2VkOgoKTGljZW5zZSBmaWxlOgoKVGhl
IHRhcmJhbGwgaW4gdXNlIGRvZXMgbm90IGNvbnRhaW4gYSBsaWNlbnNlIGZpbGUuIEknbSBmYWly
bHkgbmV3IHRvCnRoZSBidWlsZHJvb3QgcHJvamVjdCBhbmQgaGF2ZSB1c2VkIGEgbG90IG9mIGV4
aXN0aW5nIHBhY2thZ2UgaW1wbGVtZW50YXRpb25zCmFzIGluc3BpcmF0aW9uLiBJcyBhIGxpY2Vu
c2UgZmlsZSByZXF1aXJlZCB3aGVuIHVzaW5nIGEgZ2VuZXJhbCBsaWNlbnNlIApsaWtlIEFwYWNo
ZSAyLjA/CgpTdGF0aWMgYmluYXJpZXM6CgpUaGUgYmluYXJpZXMgYXJlIHN0YXRpY2FsbHkgYnVp
bHQgd2l0aCBhIHB1YmxpYyBwYXJ0IG9mIGEgc2lnbmluZyBrZXkKYXMgcGFydCBvZiB0aGUgY29t
cGlsZSB0aW1lIGFyZ3VtZW50cy4gVGhpcyBwdWJsaWMga2V5IGlzIHVzZWQgdG8gdmVyaWZ5CmRv
d25sb2FkZWQgc3RhdGljIHJ1bnRpbWUgYmluYXJpZXMgZnJvbSB0aGUgcWJlZS5pbyBTYWFTIHBs
YXRmb3JtIHdoaWNoCmlzIHNpZ25lZCB3aXRoIHRoZSBwcm9kdWN0aW9uIHNpZ25pbmcga2V5LiBD
dXJyZW50bHkgb25seSBhcm1zIGFuZCBpbnRlbHMKYXJlIHN1cHBvcnRlZCwgYnV0IHRoaXMgd2ls
bCBjaGFuZ2Ugd2l0aCBmdXR1cmUgcmVsZWFzZXMgd2hlcmUgdGhlCmRlcGVuZGVuY3kgb24gZG93
bmxvYWRlZCBzdGF0aWMgcnVudGltZSBiaW5hcmllcyB3aWxsIGJlIHJlbW92ZWQuCgpRQkVFX0FH
RU5UX0dPQVJDSCB2cy4gR09fR09BUkNIOgoKSSBjaGFuZ2VkIHRoaXMgZHVlIHRvIGVycm9ycyBw
cm9kdWNlZCBieSB0aGUgY2hlY2stcGFja2FnZSB1dGlsaXR5OgoKV2l0aCBHT19HT0FSQ0g6Cgok
IHV0aWxzL2RvY2tlci1ydW4gbWFrZSBjaGVjay1wYWNrYWdlCnBhY2thZ2UvcWJlZS1hZ2VudC9x
YmVlLWFnZW50Lm1rOjEyOiBwb3NzaWJsZSB0eXBvOiBHT19HT0FSQ0ggLT4gKlFCRUVfQUdFTlQq
CnBhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lm1rOjE0OiBwb3NzaWJsZSB0eXBvOiBHT19H
T0FSQ0ggLT4gKlFCRUVfQUdFTlQqCnBhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lm1rOjE2
OiBwb3NzaWJsZSB0eXBvOiBHT19HT0FSQ0ggLT4gKlFCRUVfQUdFTlQqCnBhY2thZ2UvcWJlZS1h
Z2VudC9xYmVlLWFnZW50Lm1rOjE4OiBwb3NzaWJsZSB0eXBvOiBHT19HT0FSQ0ggLT4gKlFCRUVf
QUdFTlQqCgoKVGhhbmsgeW91IGFnYWluIGZvciB5b3VyIGZlZWRiYWNrLiAKCldpdGgga2luZCBy
ZWdhcmRzLAoKSm9uIEhlbnJpayBCasO4cm5zdGFkCgoKSm9uIEhlbnJpayBCasO4cm5zdGFkICgx
KToKICBwYWNrYWdlL3FiZWUtYWdlbnQ6IG5ldyBwYWNrYWdlCgogREVWRUxPUEVSUyAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAzICsrKwogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAg
ICAgICB8ICAxICsKIHBhY2thZ2UvcWJlZS1hZ2VudC9Db25maWcuaW4gICAgICAgfCAxNyArKysr
KysrKysrKysKIHBhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lmhhc2ggfCAgMiArKwogcGFj
a2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQubWsgICB8IDQyICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9xYmVlLWFnZW50L0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5tawoKLS0gCjIuMjUuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
