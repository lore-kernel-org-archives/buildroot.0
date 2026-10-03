Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A726CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4E3B40E33;
	Sat,  3 Oct 2026 01:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-lBxl0OAbPg; Sat,  3 Oct 2026 01:33:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0006740E4C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991235;
	b=CWbafNZL//1XEPFHMrpTlJfM3ZjPs3Fd7gfaPHMjG6yncI91MvOD2YMTwH3NKdE62vKz
	 N2+IivhxSdaVoHo5T+kgkVFoTCpHCoN+rwvWYYSYbrvzFqo3Ob6O8SyMXx21rbSEX+qum
	 aL2KpSSNcHih/PDI7u24uJpGV5eUXsXi9bQCv1Se/3/d0XCCbu23g0AWELxSpObb0KZZy
	 qikHIEQVJntHrQhLrT9H4wczaUIPImXspTxdC8Kbesh5jNqJvFmciYiwzVaoYhiDoGwbJ
	 dcb9mHBzDiq/3Nlw3zkpZRDXpC8GMOfaMkmUzMRLwVY9vSZ/mMn1y7l64ykjq2l143w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991235;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=bEhb/+mZzVHaN0HfvV90D28WYmKYThb524L4NB9Fvq8=;
	b=ai1RJn0qFoBuElnb0zK2GaDRuy+u9Ay5T1FsQcWivr1MiDRybvnQPmHifTWZp+dkTo5e
	 48ttROx69h6bc3f+UVIIz8Bcd6uf2ofs2F0uuRlrUXJccR6VNCl25bNQsHGxL8/+si4vf
	 MNM5aCdgWtnw6lX0248UXPdKv0kI+xx4v3vX3yTrbk8GQ3Nxt2FAePczUDLYmbWSEkQ5t
	 RT3PAbZY6T+t+/2LTe47nke1f0ijzhNK9bOOjNj4HSPV5JKUfNgVPt4waXYPvy4waAFHR
	 CPu76Uqz0ne6BZ8/gS8z0Jw+0DWRYkI49K4z5nJD9/aMbK+0O/yuq4mXGBCUBzbF9Lg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XuYiyfzn;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991235;
	bh=bEhb/+mZzVHaN0HfvV90D28WYmKYThb524L4NB9Fvq8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=a7ByVoDzEBBHWNjnzw60S/JeL1n61FNKOTCefs/7NJiXOti97+NyaVMn9Bd2X1/Ap
	 yjYKZ1iWVLz/9VZg4Lp/gimb6X+FaiANZ5PsL5MdXTjUIsuPzlHldJdUFM/fEZQkwN
	 PyjSs/Oee9iSWXCrfaEfU/zDsxwFJW4jsQhXFv85e85FWAp6q/d5bUSmWPHWfZi6iz
	 6cfkzugEdpaF5FnDiQ2IUHfJGjmE5idzNSN1dRQbxK/a643MxtX6QF9rDlMfqKOhj/
	 bkbg0sudHFiaHryQ+v2bSc4IhUxIfWTp5xY0KkTHhn3P5GZ1lPS8iw7r5z7bDu33Sr
	 ZIQ8P+yI+bKNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0006740E4C;
	Sat,  3 Oct 2026 01:33:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EBCE1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DB7F40E54
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3n0Jkv0VEUML for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1AF5540E4C
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991231;
 b=irbnn4stR7Q7aaeQdoRy0yFBWATlgn3QnYZPirytsMRcAk4iEwtmnUVc8NQf0QDcIvkr
 y5ocOP2BWQ8QnfWydGhtgCBt/BByTbPI049WJ2JCI83IIbmhuR08o9RN1HYKzROut09bm
 TXXBUyiTQ89y9MAu+d1S7QHo43+TKQxydaS+E0EC46s+1Ie4sNXISmX/p3DiDDHzlweXk
 nhw7M5dJiRfRXRnV38l2nll7jk21KBNIuUkqJ/bv6ntR+LKbJOewA8VOP+gYcZIf5Hf+B
 D1eS/rkK6w4ZgzV14q7/kHL09ghWn8QbtXtf4kauTIf+3oLqun6E7/4He8UkzNDEorQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991231;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=nqUCPngntokExcUUS/Ggo0FXfBCU703W02xa7L52LYg=;
 b=MPhTiLBF92cP9WbH4aJwZrowvaT2g1LlnZKAF14nf8PpX9/oOVlKl/zciJAW/FX620Im
 H1HkEPDiQiTOBFawf7cKw5BysJl+AFqJc3IR0RftVI6m/ytfmnWgwqvGz5suYf+6iWYio
 hwE9rIPXZ52GaYMKVZTb5XO86zvU8iJPHU5FEdiHwe6fBCeiiO6v5fzBVoXfG/h5KiuOB
 aQb7YgUyUB3mXFeWExvLdfC/PrXf6DTTpDJe5Z6UAK+4CrBn0ZghyPs4gkTdPFKYMQvzK
 nHYh+4fTgcx68umBpIlDT0NZMSbUB83i4sVbl44DdKnsup2NnRAaZk1n2u6elSxo7+A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=XuYiyfzn; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=XuYiyfzn
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AF5540E4C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:50 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-8243e4db9dbso57006a34.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991230; x=1791596030; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=nqUCPngntokExcUUS/Ggo0FXfBCU703W02xa7L52LYg=;
 b=XuYiyfznMWIeuI8q3PWBo/ebK7zy+CNgCsXreh+R5S/Uzz0DR/JBNQkt4mLmjHNv0f
 Po02uZ8GLhriA/tzXu5pknLdM/dWMrZRj5KGoiVZ27qepf+LB30JhnFPjyz+ANLrmyEZ
 sUYSXL08wZkzK+hMCsebE72wW3PwzvPtcrPeZb9kZobvYQLO6jzpqEXJQbfyQuPO9yRj
 j5lABZt0hPKV2c+K7xCTKpjsVs52MkK5WA6bNYVpittpDxcLXSq4+46e3Z22RfwSyYps
 UIxxWWjoj5t+oZqeBIL3cqgEIHtuLVuGQZSCXPxAIwSXoItXrUCNolGTKCMpja5EIuhu
 KkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991230; x=1791596030;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nqUCPngntokExcUUS/Ggo0FXfBCU703W02xa7L52LYg=;
 b=eRIl6Crvhz2JjfaLQNjo6o5II1eFkYUNf+mj5wI9t89eGw8uISB96f/QnAyZR3DF+M
 AO02z18l9Wp/zU4fJPbtuRlP/NfRxrQtkWGnAil5LML6RVyJLI/erUXxdgEQwk0DK1mV
 wZHBw0EcCNYmlkok1ARNWr7ozC/5LzRt7UAFx/x2RNa/naEi3XuHF9yH3rZDNv3LDFVF
 n12C0GR9YeN1r4DTwkgSKT0Kc0hSiUytEDvqMOpXg90uyTjjFeilr5uOPVhYnD3+iBVc
 vGpCM0c1/jIn/1yCI7iJcwjsLfMFnzX6sy7pi2tydIb491kRyhHf08yLUiL+q2r0lVb1
 wnqA==
X-Gm-Message-State: AFuF++k3e/fN5TBoVgT2KUYmJoC0zSN05PxLNQCC5JwUEK60zn3NBFRP
 XH8z9YIanrGOI/wNWWoPvBTRqMqlCBAhsar2jzMK7DkTGfYdV2fmF8uQq9ZvjA==
X-Gm-Gg: AYBFou1ooT19UG/1R//4vIDzPB8WXmlwKolokonFy9CkCyhx8mr6BC2q90zIu88Asb+
 9pYJt3f+cxJoehhj1OeA07CLnJ5oj/0Q9igAIQPxdlwrAYBek9fo+pHe/M/EV8bgA9pGxjDnIQm
 2F3tVJUcJSrVwuqZzM5e0iNdabJfSslWkFQdDz9YvbB9lI9sIjzcGl8JIZJdSyROuT7m5m+ZYPX
 LreMQtASxIk3zJWGS6gI3rDKQ7vNN18wWGnq/NvYZ0nk8FLUqX5aqqWipfqsI1XlY4gzXmPrK6l
 ZepMl9/gTac7gshWR2I7x8vwHt0PVoxjI+U982v/kAapxUsjwLZnARuGN3LVNIHuhqiZWi1LXnY
 eXoTw1o4odj0GcIV6OG76rDcuMpuOvqNa/Wso/+LbjXqH5/9WDTgSNIYGutTOfKLR7hxHhQ/bHe
 2zHoO6Fnd7OyF/yJ/AolJMc9/6Cs9Xobkf8xLNqdCRZSFqEoK/3WNMW1oJgeZKTWBh2hz7+IR0e
 vWpm6nhGKSE9iz3QEkdVkimerF/ExWf7w0v2D5PUgIDmUZEciDcyVr51yB3FGN/UWCXOGa6upGw
 S178+o4Xgx370IRrJhsr73Q4nw3lsN2YDHlAmVcIx1tVIDUEeNtIfB31Zi763IxuLV6y7GBtWOP
 AEOtNcIXw+BN43Tq3MrCJD/5LHUPPVPtzO+3MbInFcw==
X-Received: by 2002:a05:6830:3498:b0:7f4:eb9e:54b with SMTP id
 46e09a7af769-82284865fd4mr4376928a34.7.1790991229773; 
 Fri, 02 Oct 2026 18:33:49 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:26 -0600
Message-ID: <20261003013304.400979-26-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-rust: bump to
 version 1.13.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
 package/python-setuptools-rust/python-setuptools-rust.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
index 4cd068103d..37b1407d62 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.hash
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
-md5  90ce501aabce2a859e19a213985288ea  setuptools_rust-1.12.1.tar.gz
-sha256  85ae70989d96c9cfeb5ef79cf3bac2d5200bc5564f720a06edceedbdf6664640  setuptools_rust-1.12.1.tar.gz
+md5  bf3129915879286bfe6dbf3dba9c8b8f  setuptools_rust-1.13.0.tar.gz
+sha256  f2afcf4baeee689910ce49cfa8aad4e08cce72f417449bcc32891b8664fdc726  setuptools_rust-1.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index 05951260b2..7ac9fbbf67 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_RUST_VERSION = 1.12.1
+PYTHON_SETUPTOOLS_RUST_VERSION = 1.13.0
 PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools_rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/0c/11/736cfe4ec795dbce001ebdcef5cab03de1727041c805c3a45c1bda9f54a1
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/68/ba/b31781d61bf9ee3c232a1d1160db11c11cdeae1d44e06c90723b25a8279f
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
