Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528C5C25B74
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 07:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0090F605A8;
	Wed,  8 May 2024 07:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KfinFKnEfDLY; Wed,  8 May 2024 07:13:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8AAA605D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8AAA605D7;
	Wed,  8 May 2024 07:13:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6FA3D1BF853
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 07:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B6C8401BC
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 07:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Ah9TkZpLdik for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 07:13:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4B61340191
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B61340191
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B61340191
 for <buildroot@buildroot.org>; Wed,  8 May 2024 07:13:49 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-34ddc9fe497so2346382f8f.3
 for <buildroot@buildroot.org>; Wed, 08 May 2024 00:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715152426; x=1715757226;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ju+ZGr2ERijbmsT6BbByXmLDmUrtw0iEmTNnun7f1w4=;
 b=BZ1Pw6is45Z+GxEykxnWR50XMe4twSYmRKcZGCapgHyrU6I39BMfEO5tNQrhgDSLPu
 ML2nE796ZBAroJbMeRRj2WeMaFB18Wb+Be1EvVoz1ZKLwUcCRD/olFYzZ7HWXhnDrET8
 tEg9yxTrGSz5dFjaE3BLFTiMLxQ7WVk4cEkX99pK7ub5OGRGYF8YthZhJmpc0Hh2FrhW
 ZtwI+b0rkX/Zq7aMFiuE7I0X8DqbQubNcY05IRtiwr1Ku9MvqyzQrNyMbyR6YDCeExcZ
 SGwJzK762R4QX2MJiC0qkzmCJpGm7X4jLnxZV6A5pKTpOmfIcA27CsKR3T7ev39xqPsI
 tICg==
X-Gm-Message-State: AOJu0Yz5UqqqN0MFdfEcrMHEXeTV/guyODQdUaC11hw/af/x3v2k147q
 EOElZVtx5TV6ssEsNekwd8Vdlt/dEy3zOwoIhMhN2qocNh49iIwzGErvAg==
X-Google-Smtp-Source: AGHT+IHd0MxORjA50AzwbiC0Xw6Ww1t8yoeeLTHZ6qZmw7dCItJ/SutwNzVUY88XvvZkLDf8t1j6nw==
X-Received: by 2002:adf:9790:0:b0:34c:f3cb:64cb with SMTP id
 ffacd0b85a97d-34fcaa047f5mr2003403f8f.52.1715152425863; 
 Wed, 08 May 2024 00:13:45 -0700 (PDT)
Received: from hthiery.kontron.local ([95.91.160.230])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a5d4d8c000000b0034e65b8b43fsm12614909wru.8.2024.05.08.00.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 00:13:44 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 May 2024 09:13:29 +0200
Message-Id: <20240508071328.45346-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715152426; x=1715757226; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ju+ZGr2ERijbmsT6BbByXmLDmUrtw0iEmTNnun7f1w4=;
 b=ErEsSuWrtPOJ2GVZxZm+sQ9BrwaaxjN9PqrRAPxJ3hSA+sial9mYercXDJmZgDWmez
 5M5bOdPpArIgQimk6lK1VglHnb0uWUyvQKPr2iF3G3TrLekkejb+IsAkzvSQycRdib4i
 K6WIfh1Fkf+26rgYWP3AkjcZOsStRMe0t6/vK8iY7K/rFOlRy2H0dc6s2PbvUa/33TVX
 mp2tUdOxHZYWQ2DSvV00G20gPu+Ku/vu/nPxG+/Ay0JZ6A+6ocqHm8gdSZKoRC1BvqZD
 f1/Q5Ukw+CLFRzpTNQrv6OHfVugNqv84MemRaLFCtaPYlelD23werXTTLBkJqPT27T2g
 9jUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ErEsSuWr
Subject: [Buildroot] [PATCH] DEVELOPERS: add myself to python-yamllint
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSGVpa28gVGhpZXJ5IDxoZWlrby50aGllcnlAZ21haWwuY29tPgotLS0K
IERFVkVMT1BFUlMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDc3OTcxZTAzZGIuLjM1ZmVj
NmVlYjcgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMTM2Myw4
ICsxMzYzLDExIEBAIEY6CXBhY2thZ2UvbGlibmV0Y29uZjIvCiBGOglwYWNrYWdlL2xpYnlhbmcv
CiBGOglwYWNrYWdlL2xpbnV4cHRwLwogRjoJcGFja2FnZS9uZXRvcGVlcjIvCitGOglwYWNrYWdl
L3B5dGhvbi15YW1sbGludC8KIEY6CXBhY2thZ2UvcmF1Yy8KIEY6CXBhY2thZ2Uvc3lzcmVwby8K
K0Y6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25feWFtbGxpbnQu
cHkKK0Y6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3lhbWxsaW50
LnB5CgogTjoJSGVydsOpIENvZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPgogRjoJcGFj
a2FnZS9hbGNoZW15LwotLQoyLjM5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
