Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4EDC02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 07:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81A6040708;
	Fri, 14 Feb 2025 07:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIwED4v9LdEc; Fri, 14 Feb 2025 07:43:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6029140780
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6029140780;
	Fri, 14 Feb 2025 07:43:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C11091C6
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 07:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B12FE84725
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 07:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id putSPbtnQs6q for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 07:43:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1273783ABC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1273783ABC
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1273783ABC
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 07:43:03 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2f83a8afcbbso2717940a91.1
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 23:43:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739518983; x=1740123783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p6u6azv0oGxPvEC0qY8qWkJC5p9xBbIPhiG75RVTD1E=;
 b=IgOTb1TrAXZ/eWZL9VAB6BfiGNV7I7kU9Oza8vBnWceyTdPyhIvhqfmYUu1DZjYATF
 iXhBo6hKVbIB8iHu0Z4bZTXEUPlJ12cdoZvWvqWrp7L4rjVS8Ov6J3wlVXjw/jE3aoyg
 wtb8CRSpKz2OP2HvJaNtJyteTXFt2DoRGMIX+6oDOXMhkW5j/mh59kEd31W7T+ENgcuK
 OUz+kfddHkne+QLqQdFUzucob1kqcr/9HX3ArTPtJYKCIkOgJ5Ux0NTe3PkLk1N9CDeo
 NMRAkqHV8TU2kOYgEKkxJqvoRMv8blW2gKW9/6sKL3LUBKur6jLnOhEkhvJAGuTVP9Od
 HHbg==
X-Gm-Message-State: AOJu0Yz3Eske4Q+7h2U0GAOjYyPTe+1/tBNEVjVv+3kJfPiiieBNyrrt
 vawjCKdG9Rzxi2jYpH3TQ0THihZiI6ptFRDrTY16a57sdu3JB8arvvSJgw==
X-Gm-Gg: ASbGncuyIYuoVRUKeigjqyltX9EPBzcBraKPqwsNSJcE/LqQ8Zv2SZRmvMyt+BDZY1N
 74WuvFa3TTYhPzDBPQ88JnhIcPboH7e2calabq99rmr9Gvka7Wnk5rqyx6/3ENvLQXJiFQtsiGi
 7B7ouL66+KT03pB79Y9zZotmPDNNhaYyW5xhRdatPMfvDfEquL8qkoSTyREYX5rti4xXOqYjire
 oAtwFNUZwWYqohr2LBpAVhAo01Ew+JM2OtIhm59ZjeklQf/1K2MvWH/Ucgfp4KQJRUMvpVCeBmj
 9hkdVVJBJFvg
X-Google-Smtp-Source: AGHT+IFznlpr4C5QMAAtaLk0Km1Fo10MkSv8yHAzv0GYAKh6JiOmGRL0z7C+0JtW5ibXo4bqNP/Y+Q==
X-Received: by 2002:a17:90b:3b8a:b0:2ee:cbd0:4910 with SMTP id
 98e67ed59e1d1-2fc0fbca1fcmr9846209a91.1.1739518982812; 
 Thu, 13 Feb 2025 23:43:02 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d53643ddsm23480525ad.70.2025.02.13.23.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 23:43:02 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 14 Feb 2025 15:42:33 +0800
Message-ID: <20250214074235.917242-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250214021416.392363-1-fancp2007@gmail.com>
References: <20250214021416.392363-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739518983; x=1740123783; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p6u6azv0oGxPvEC0qY8qWkJC5p9xBbIPhiG75RVTD1E=;
 b=UX3jeDviPpVk8j1j6fK4ZtSBAR6by54t4TizKW0cgxn0fnsthP7XYOKJT+2yl9KbUl
 num+M2eYcUTWcCMrE0aj2eNForm+4D5+ITYgSCVgGHeiWlZFEmXK20hwlhVeZmhqVCTN
 7k1Iu+Oq0WFSoXBCNoKD6fmAfQ8zV8WoGQYyPlDyhsbm9C293AnlTFKjjLpN+ohyAj49
 rKiA9cdZn8FNJtI1x4NhMBUoJo5SWqLfjpG9ddf2RpPoMis3hKJqYpmn+dc+Clotq9vI
 +YOpToWecZoOVei09EOu3Mq5s54tFDg/WhkMOL/tsrJHM66noMddju77FHtI2E66CeFw
 5lXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UX3jeDvi
Subject: [Buildroot] [PATCH v2] package/sqlite: fix configure options for
 readline/editline support
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGF1dG9zZXR1cCBzY3JpcHQgd2lsbCBza2lwIGNoZWNraW5nIGZvciByZWFkbGluZS5oIHdo
ZW4gY3Jvc3MtY29tcGlsaW5nLAp3aGljaCB3aWxsIGNhdXNlIGxpbmUtZWRpdGluZyBzdXBwb3J0
IGZvciB0aGUgc3FsaXRlMyBzaGVsbCB0byBhbHdheXMgYmUgIm5vbmUiLgoKSW4gdGhpcyBjYXNl
LCBpZiB0aGUgLS1lZGl0bGluZSBvcHRpb24gaXMgcHJvdmlkZWQsIGFuIGVycm9yIHdpbGwgYmUg
cmVwb3J0ZWQ6CkVSUk9SOiBFeHBsaWNpdCAtLWVkaXRsaW5lIGZhaWxlZCB0byBmaW5kIGEgbWF0
Y2hpbmcgbGlicmFyeS4KCkhvd2V2ZXIsIHdlIGNhbiBlbmFibGUgcmVhZGxpbmUgb3IgZWRpdGxp
bmUgc3VwcG9ydCBieSBzcGVjaWZ5aW5nIHRoZSBDRkxBR1MKYW5kIExERkxBR1MgdmFsdWVzIOKA
i+KAi2luc3RlYWQgb2YgaGF2aW5nIGl0IGhhbmRsZWQgYXV0b21hdGljYWxseSBieSB0aGUKYXV0
b3NldHVwIGNvbmZpZ3VyZSBzY3JpcHQuCgpJbiBhZGRpdGlvbiwgdGhlIGxpYmVkaXQgcGFja2Fn
ZSBhY3R1YWxseSBkZXBlbmRzIG9uIHRoZSBuY3Vyc2VzIHBhY2thZ2UsCmp1c3QgbGlrZSB0aGUg
cmVhZGxpbmUgcGFja2FnZS4gU28gd2hlbiB1c2luZyB0aGUgbGliZWRpdCBwYWNrYWdlLAphbHNv
IGFkZCB0aGUgbmN1cnNlcyBkZXBlbmRlbmN5LgoKU2lnbmVkLW9mZi1ieTogU2NvdHQgRmFuIDxm
YW5jcDIwMDdAZ21haWwuY29tPgoKLS0tCkNoYW5nZXMgdjEgLT4gdjI6CiAgLSB1c2UgdGhlIENG
TEFHUyBhbmQgTERGTEFHUyB2YWx1ZXMgaW5zdGVhZCBvZiBhdXRvc2V0dXAgY29uZmlndXJlIG9w
dGlvbnMKICAtIHVwZGF0ZSBjb21taXQgbWVzc2FnZQotLS0KIHBhY2thZ2Uvc3FsaXRlL3NxbGl0
ZS5tayB8IDExICsrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3FsaXRlL3NxbGl0ZS5tayBiL3Bh
Y2thZ2Uvc3FsaXRlL3NxbGl0ZS5tawppbmRleCA1YThiMDMzY2UwLi4yNTVkZGM5MzdiIDEwMDY0
NAotLS0gYS9wYWNrYWdlL3NxbGl0ZS9zcWxpdGUubWsKKysrIGIvcGFja2FnZS9zcWxpdGUvc3Fs
aXRlLm1rCkBAIC00NCw5ICs0NCwxMiBAQCBlbmRpZgogCiBpZmVxICgkKEJSMl9QQUNLQUdFX05D
VVJTRVMpJChCUjJfUEFDS0FHRV9SRUFETElORSkseXkpCiBTUUxJVEVfREVQRU5ERU5DSUVTICs9
IG5jdXJzZXMgcmVhZGxpbmUKLWVsc2UgaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJFRElUKSx5KQot
U1FMSVRFX0RFUEVOREVOQ0lFUyArPSBsaWJlZGl0Ci1TUUxJVEVfQ09ORl9PUFRTICs9IC0tZGlz
YWJsZS1yZWFkbGluZSAtLWVkaXRsaW5lCitTUUxJVEVfQ0ZMQUdTICArPSAtREhBVkVfUkVBRExJ
TkU9MQorU1FMSVRFX0xERkxBR1MgKz0gLWxyZWFkbGluZSAtbG5jdXJzZXMKK2Vsc2UgaWZlcSAo
JChCUjJfUEFDS0FHRV9OQ1VSU0VTKSQoQlIyX1BBQ0tBR0VfTElCRURJVCkseXkpCitTUUxJVEVf
REVQRU5ERU5DSUVTICs9IG5jdXJzZXMgbGliZWRpdAorU1FMSVRFX0NGTEFHUyAgKz0gLURIQVZF
X0VESVRMSU5FPTEKK1NRTElURV9MREZMQUdTICs9IC1sZWRpdCAtbG5jdXJzZXMKIGVsc2UKIFNR
TElURV9DT05GX09QVFMgKz0gLS1kaXNhYmxlLXJlYWRsaW5lCiBlbmRpZgpAQCAtNTksNyArNjIs
NyBAQCBpZmVxICgkKEJSMl9QQUNLQUdFX1NRTElURV9FTkFCTEVfSlNPTjEpLCkKIFNRTElURV9D
T05GX09QVFMgKz0gLS1kaXNhYmxlLWpzb24KIGVuZGlmCiAKLVNRTElURV9DT05GX0VOViA9IENG
TEFHUz0iJChTUUxJVEVfQ0ZMQUdTKSIKK1NRTElURV9DT05GX0VOViA9IENGTEFHUz0iJChTUUxJ
VEVfQ0ZMQUdTKSIgTERGTEFHUz0iJChTUUxJVEVfTERGTEFHUykiCiAKIGRlZmluZSBTUUxJVEVf
Q09ORklHVVJFX0NNRFMKIAkoY2QgJChARCk7ICQoVEFSR0VUX0NPTkZJR1VSRV9PUFRTKSAkKFNR
TElURV9DT05GX0VOVikgLi9jb25maWd1cmUgXAotLSAKMi40My4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
