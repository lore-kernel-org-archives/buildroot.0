Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E46C5DF87
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 10:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40622605D8;
	Thu, 20 Aug 2026 10:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ntv8e54m44l7; Thu, 20 Aug 2026 10:57:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787223440;
	bh=sy73W0loAEC6QvqRIdy36717twtTHNjbYb5d5n5wk0w=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=LpzfXaXL+eMx7qiAv+MAIK1rpp0OepKMg6ilbt8TXMci9SQBPv9FOgPDGkBWFptAa
	 9lkxLSjuStaRLoHe8sV3X+p8ruozgszATQ6pM0gRus+Jp5DwEGGUcPIAXw6ev3BeuT
	 3xUqBvoljzHN6jikjoWiX0hlTYuvvopKj2p8x5ZrTULEkTsdivfLkZITmFEP7GU5sA
	 OIo7Yp6dX+1mX+BvXcx0I+nzLdCB8HHgHVjOuH7E8oOaFq/mhWPXfweAg8t0IBt1iD
	 tTjEFyDuK6uH9H78+cBxdLDxnfdSUmVcrz5CVp+a5Fv1XSvHylzt71fCGcqubE0oGL
	 uc/0wZGJTFdGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FF5260689;
	Thu, 20 Aug 2026 10:57:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ED2D1460
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 10:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5CC460619
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 10:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjfPgpFtBH6L for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 10:57:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7034D605D8
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 10:57:16 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c214321dc32so392119266b.0
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 03:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787223434; x=1787828234;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wxr3K3TpMCievdB+2dKpaLlYKkdskdUi7Mf/PAcvIjc=;
 b=YVDSLnmxHjGH6wegvRWgC7LanjRk2rYpOHBa9eZz4afNLaObSuQpSfNuktd2BE8baQ
 Q497dDuzxJIUqhAxUTYpuiWBMc9J83IToanQsxY/tL4DNYxi2zO+i+QmcROZ5JmhFGRR
 joEKxOp8F4aVjOPbTui1aHUBhwqNrzYVqMhfhGLs8oVdfRXDUNE51tUfRso8AdSCTgk1
 nrn8dHmh3FtB0rCiTX/fkodAHTEv1pf5itRtu2kNSEHDeVJNfPizcfe76OH3yGgFAAcJ
 Kr3GyhWvXJUeNupopAoz03M4GsyVeLk08rN+EH+YZm/0xdRKA1nrTP8euZwlMfa1ZQDb
 DeCw==
X-Gm-Message-State: AOJu0YwlnRRLiQ7vP9UX5LSxLHM8dE2AwSBpuFwS7eBw1LZVMn6HxqZL
 o4SV+EayVlIcR0xJoVhPUD8kzWu1QT3SZWYn/X5CHDn5k7RaojWdY0p9bJWbfniwopmQfKHvgWh
 XLwfrgwU=
X-Gm-Gg: AR+sD12WDxq8hWEqScuJzPsgBc8CAn0fruaZKONXFGHx9WOuyo5uxuRgYV6Dlto6eWa
 Piba9V+TXE/ufof1K6YDLItV9dD9FgG8jsO0aNgfYtA9urmcbzTQWSvksbc4N3sV1Vf8JPluLFT
 RB1GdwqTsLZcG6qyxyS5qUOwvnXJeUuIPqUuM/QqC8EORwf19cl7j26YvBDYRcqGoswW1kYxUcL
 dRjOyg/lPSRPciL/d/91SML89/p2Lxkkqb6fMxlGGB0aumou1vO9yDBEvR3tg2vFDjFwNUaAQCz
 61U4h7lrsS0I/IxQ5vUQWJE1rQxH6etz8ZmjLzCsGx7IyWaUQSQNYMu1Q2dn6aslaRwQl9RO6In
 SS7aWgTwnW9H7SWyVLUSDekC0FEGTf1J6umdUetyxFn9LN1KzK9MIWb5B6vbL5saN674/ahsDIo
 sVMJHB3Cnz0XU4Zjrxl6D3LeLLqKRSwXkxUbHQZFnlx5wZ8zuf99sY2WaEulkGx1oQkZVyWcNId
 fQVnhn9v5GlO0KRblQr01HBHnB8NpI=
X-Received: by 2002:a17:907:3e88:b0:c16:3074:657f with SMTP id
 a640c23a62f3a-c23f9657ae5mr779064366b.9.1787223433828; 
 Thu, 20 Aug 2026 03:57:13 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24591e0397sm52884866b.53.2026.08.20.03.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 03:57:13 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Thu, 20 Aug 2026 12:56:59 +0200
Message-ID: <20260820105705.1502630-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/fcft: use release tarball instead
 of archive
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q29kZWJlcmcgaGFzIGNoYW5nZWQgdGhlIHdheSBpdCBnZW5lcmF0ZSBoYXNoZXMgZm9yIGF0IGxl
YXN0IHNvbWUgb2YKdGhlIGdlbmVyYXRlZCB0YXJiYWxscyAoc2VlIFsxXSkuCgpUaGlzIGNoYW5n
ZSBhZmZlY3RzIHRhcmJhbGxzIGdlbmVyYXRlZCBieSBDb2RlYmVyZywgYnV0IG5vdCByZWxlYXNl
CmFydGlmYWN0cy4KZmNmdCB0dXJucyBvdXQgdG8gaGF2ZSBhIHByb3BlciByZWxlYXNlIGF2YWls
YWJsZSwgc28gdXNlIGl0LgoKWzFdOiBodHRwczovL2NvZGViZXJnLm9yZy9Db2RlYmVyZy9Db21t
dW5pdHkvaXNzdWVzLzI4NjEKClNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBo
YWVsLm1lbG90dGVAbWluZC5iZT4KLS0tCiBwYWNrYWdlL2ZjZnQvZmNmdC5oYXNoIHwgMiArLQog
cGFja2FnZS9mY2Z0L2ZjZnQubWsgICB8IDMgKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2ZjZnQvZmNmdC5o
YXNoIGIvcGFja2FnZS9mY2Z0L2ZjZnQuaGFzaAppbmRleCBmNWE0OTllZGNjLi4wYTRjNjMzZjI0
IDEwMDY0NAotLS0gYS9wYWNrYWdlL2ZjZnQvZmNmdC5oYXNoCisrKyBiL3BhY2thZ2UvZmNmdC9m
Y2Z0Lmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY29tcHV0ZWQKLXNoYTI1NiAgNzll
NTJhYWFmYzBiNTdmYTJiNjhlZDYxMjdkZTEzZTk4MzE4MDUwMzk5YTkzOTY5MWI4Y2EzMGQ0NGQ0
ODU5MSAgMy4zLjIudGFyLmd6CitzaGEyNTYgIDhkZmZlNzUwMDI3NjE4ZTAxZGQ0ZTZiYzlhYTlj
ODg5MDMzYzdhYmU0YTY2MWU5Mjk0MTkyYjU4YjQ1NTYyNjQgIGZjZnQtMy4zLjIudGFyLmd6CiBz
aGEyNTYgIGQ1MzRhMjNhMzE1MDBhMGFjOTU4ZDk2MzRiODRmNTMyYmQ3M2ZmMWFjYTFiYjhmN2Rl
YmJjYmViYzE2ZmYzOWEgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZmNmdC9mY2Z0Lm1r
IGIvcGFja2FnZS9mY2Z0L2ZjZnQubWsKaW5kZXggYjljZTQzYjQ1NC4uNDBiMmQ0NWE4ZiAxMDA2
NDQKLS0tIGEvcGFja2FnZS9mY2Z0L2ZjZnQubWsKKysrIGIvcGFja2FnZS9mY2Z0L2ZjZnQubWsK
QEAgLTUsOCArNSw3IEBACiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCiBGQ0ZUX1ZFUlNJT04g
PSAzLjMuMgotRkNGVF9TT1VSQ0UgPSAkKEZDRlRfVkVSU0lPTikudGFyLmd6Ci1GQ0ZUX1NJVEUg
PSBodHRwczovL2NvZGViZXJnLm9yZy9kbmtsL2ZjZnQvYXJjaGl2ZQorRkNGVF9TSVRFID0gaHR0
cHM6Ly9jb2RlYmVyZy5vcmcvZG5rbC9mY2Z0L3JlbGVhc2VzL2Rvd25sb2FkLyQoRkNGVF9WRVJT
SU9OKQogRkNGVF9MSUNFTlNFID0gTUlUCiBGQ0ZUX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCiBG
Q0ZUX0lOU1RBTExfU1RBR0lORyA9IFlFUwotLSAKMi41NC4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
