Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F91C4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 18:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF157403B3;
	Sun, 20 Nov 2022 18:20:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF157403B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4xiWaUuXcmHN; Sun, 20 Nov 2022 18:20:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28CE24038E;
	Sun, 20 Nov 2022 18:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28CE24038E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8E421BF38A
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 18:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADC884038E
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 18:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADC884038E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGAxUB0_Uw_F for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 18:20:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52A23400F2
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52A23400F2
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 18:20:02 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id v7so7090353wmn.0
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 10:20:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BkO+Y00vyr012swYhdGm88MM3Lws2radxMM4IjTGmdc=;
 b=k/+//yNqff+6ypqs3irC9+lvP3g7NC7+lLbZ/9dPqOGYDrJjflRp/6/ySllJnza9IB
 c7F33axE9s62/2TRAVpXoMa+TNXGxmKhAEBXH0w88dnN/DIz96p0kUHAavkqqRfW8cgz
 nWyw/y6uFtT9LXY0reZAznvXtMvSAHdOVrGHHdm2cEienSusJjviXa55fEI9avNSbFnO
 AX5f1At9C7bmhZ6or72QHmWCCY2GCEQTr5QmlCrEChO0ETQmvpjnceTlAkq8cjS+Q6bf
 sm31yKwLQJ82CU6kvA6lvv8bvrLSkzPxWceK5pMv0AkxRd1FqaCZXsz2V+ewoM3G/zj0
 UN3A==
X-Gm-Message-State: ANoB5pn48RJ0eL6ntX5lBocRFfjJnt0Zx7AjzUvP+Q0BPZdlZhFfBjWv
 As/WtFhAfMlUPrjjr9SyA5lp8YJ3oJVTyQ==
X-Google-Smtp-Source: AA0mqf4u2KxmfXI1NzqrvVpQWmJYMsyYhsnlUDcTel9SJUDp4x1Q5zmctG9dxzpbW5W+oLF3X7MJ8Q==
X-Received: by 2002:a05:600c:2241:b0:3cf:9ced:dce4 with SMTP id
 a1-20020a05600c224100b003cf9ceddce4mr10146455wmm.120.1668968399926; 
 Sun, 20 Nov 2022 10:19:59 -0800 (PST)
Received: from gpdmax.. ([2a01:e0a:28f:75b0:cf6:c90f:f3b1:89c1])
 by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c182600b003c6deb5c1edsm10765150wmp.45.2022.11.20.10.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 10:19:59 -0800 (PST)
From: Anisse Astier <anisse@astier.eu>
To: buildroot@buildroot.org
Date: Sun, 20 Nov 2022 19:19:55 +0100
Message-Id: <20221120181955.851456-1-anisse@astier.eu>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BkO+Y00vyr012swYhdGm88MM3Lws2radxMM4IjTGmdc=;
 b=4PgoDOk02bFyq8rQG6xxAkV7Id7sz+bPN2X0PgwbJcu/RjsQMHHzUtUAKCePzXJIwS
 sJXq1K+6/hmn6Bmg+wfbG3njAKQoKVV9n9Nk+juFjlCgriFILnvN8i8laqazN4U5SETr
 Zo2g0JvV9+mB9hvi1KH9RnzUyr8UegO6UR9aHxVAl/7gyyKTbNIU4o2dYHzSCLWQ09Tp
 5mVmb4VIHMhhAi5cVHRsIy8QNEHkqmBYACwAA5XEOEBsJvwSTAaK8C7oLl8lzosf74o+
 nGqtUWbzA4XEnLJ2fJ0P9VQI+o4HdILS+odiTEOr67pWsZeoJwlcZAaYikPSkVEeJcmO
 16wQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=astier-eu.20210112.gappssmtp.com
 header.i=@astier-eu.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=4PgoDOk0
Subject: [Buildroot] [PATCH RFC] package/go: disable cgo support with static
 libs
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
Cc: Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGdvIHN0ZGxpYiAicGx1Z2luIuKAr3BhY2thZ2UgcmVsaWVzIG9uIGRsZmNuLmggd2hpY2gg
aXNuJ3QgYXZhaWxhYmxlCndoZW4gd2UgaGF2ZSBCUjJfU1RBVElDX0xJQlM9eS4KClRoaXMgc2hv
dWxkIGZpeCB0aGlzIGJ1aWxkIGVycm9yIGZyb20gYXV0b2J1aWxkZXJzOgoKL2J1aWxkcm9vdC9p
Njg2LWhvc3Rnby1mYWlsL2J1aWxkL2hvc3QtZ28tMS4xOS4zL3NyYy9wbHVnaW4vcGx1Z2luX2Rs
b3Blbi5nbzoxMToxMDogZmF0YWwgZXJyb3I6IGRsZmNuLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJl
Y3RvcnkKICAgMTEgfCAjaW5jbHVkZSA8ZGxmY24uaD4KClRoZSBtb3JlIGxvbmd0ZXJtIGFwcHJv
YWNoIHdvdWxkIGJlIHRvIGFzayB1cHN0cmVhbSBmb3IgYSBidWlsZCB0YWcgdG8KZGlzYWJsZSB0
aGUgcGx1Z2luIHBhY2thZ2UsIGFraW4gdG8gdGhlIG9zdXNlcmdvIG9yIG5ldGdvIHRhZ3M6Cgpo
dHRwczovL2dpdGh1Yi5jb20vZ29sYW5nL2dvL2lzc3Vlcy8yMzI2NQoKV2hpbGUgaXQgd291bGQg
YmUgcXVpdGUgc2ltcGxlLCBJIGRvbid0IHRoaW5rIGEgYnVpbGRyb290IHBhdGNoIGZvciB0aGlz
CndpdGhvdXQgdXBzdHJlYW0gc3VwcG9ydCB3b3VsZCBiZSBpZGVhbC4KLS0tCiBwYWNrYWdlL2dv
L2dvLm1rIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9nby9nby5tayBiL3BhY2thZ2UvZ28vZ28ubWsKaW5k
ZXggZmQ0Y2FhMmU1YS4uMWMzY2ZhOTRkNCAxMDA2NDQKLS0tIGEvcGFja2FnZS9nby9nby5tawor
KysgYi9wYWNrYWdlL2dvL2dvLm1rCkBAIC04Nyw3ICs4Nyw3IEBAIEhPU1RfR09fVEFSR0VUX0VO
ViA9IFwKICMgc2V0LCBidWlsZCBpbiBjZ28gc3VwcG9ydCBmb3IgYW55IGdvIHByb2dyYW1zIHRo
YXQgbWF5IG5lZWQgaXQuICBOb3RlIHRoYXQKICMgYW55IHRhcmdldCBwYWNrYWdlIG5lZWRpbmcg
Y2dvIHN1cHBvcnQgbXVzdCBpbmNsdWRlCiAjICdkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFT
X1RIUkVBRFMnIGluIGl0cyBjb25maWcgZmlsZS4KLWlmZXEgKCQoQlIyX1RPT0xDSEFJTl9IQVNf
VEhSRUFEUykseSkKK2lmZXEgKCQoQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUykkKEJSMl9TVEFU
SUNfTElCUykseW4pCiBIT1NUX0dPX0NHT19FTkFCTEVEID0gMQogZWxzZQogSE9TVF9HT19DR09f
RU5BQkxFRCA9IDAKLS0gCjIuMzguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
