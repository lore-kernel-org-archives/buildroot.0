Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F14C47422
	for <buildroot@archiver.kernel.org>; Thu, 18 Jan 2024 12:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5270D61B0F;
	Thu, 18 Jan 2024 12:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5270D61B0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cL4hMJu8Osy5; Thu, 18 Jan 2024 12:41:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A10F861B04;
	Thu, 18 Jan 2024 12:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A10F861B04
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6233E1BF36C
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 12:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38C134035D
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 12:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38C134035D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D6jOMiZrH9j1 for <buildroot@lists.busybox.net>;
 Thu, 18 Jan 2024 12:41:37 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 063E84012B
 for <buildroot@buildroot.org>; Thu, 18 Jan 2024 12:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 063E84012B
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1d5db9eb0e7so24085375ad.2
 for <buildroot@buildroot.org>; Thu, 18 Jan 2024 04:41:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705581694; x=1706186494;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q3dpQgzwbogGITNzySTlHhwZ5XwgcL1ANZj1Yb9x4Gw=;
 b=IKeVwAkF39ZXM2/1UA0tbJ7+X9w7K10QsbTtufSvEDANrPL3kpp6hUs7fjw197cNz9
 ftTTCsBSVAjYgGf9RxhOPDwKIzkq6zHxX9u0yHXqwjS1Lgxf/lYPqQTs8wecygEkMhMR
 usat95RJtdPPdnHqCxKb3Cx6vK97Nx0/g6ipVX+um7fka+eKGaKc8beV2129kkx3dM17
 iev63dRMxpKqMUDVctW4lcBG63eWrBADt/x4BV+L4hoVwI8/IP/F7UBS+5S0pnpW40Fu
 ql8cuTgmY+vi1g7q15jxShmuo5HWxgRTTpu/ePsf+/h2uGiWX6K9qgmqAtuky9XZhHT4
 tCZw==
X-Gm-Message-State: AOJu0Yyk2/YMcwVmmpa826tmU/xx4Uvzz7gO5VoYcsri9QbGmXiekMGt
 Z7oTEQh7Hfo6N/d+Na6xL9nFacLYInBPITLpbFJd/kJDVK8O9qZi4iLC6ClfBOP7jTJmXcy0FVQ
 3LgU=
X-Google-Smtp-Source: AGHT+IEJBEVZhG/KdizzFIzH0e1bfYhgmSvXXUrsfu5Lsglsez7i72FOWA4BLc2SNvcbXeu72JKJnQ==
X-Received: by 2002:a17:902:cf4b:b0:1d5:8ef5:31f3 with SMTP id
 e11-20020a170902cf4b00b001d58ef531f3mr730681plg.88.1705581693791; 
 Thu, 18 Jan 2024 04:41:33 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a170903304b00b001d5c61b3a09sm1319354pla.198.2024.01.18.04.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 04:41:33 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Thu, 18 Jan 2024 09:41:25 -0300
Message-ID: <20240118124125.996172-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1705581694; x=1706186494;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q3dpQgzwbogGITNzySTlHhwZ5XwgcL1ANZj1Yb9x4Gw=;
 b=p6K35FdjWBDw7uG3liz5GrzXeOzaDkpUQw7VHac5vhpsK8/N54axIVbW1Rg7gC58q1
 YBoCCu3l+EimcvhSEBHI4RQhn5jOtQQ5wg1U8Eu8TnngIJFi2rzcu7SiLtuJIfN4UW+T
 Y+67uFxyuczzST+6WyGVR++VVoFzWiYxLCrzB4EiYALxFJTna2drA9U/xlWjDPWDAZxI
 h2zrUiU4eATAOxDVPhD9Irw8NCtyxNMOLuIyrntRUY3ZZoHAopqUdOvq2xOtdc7xrIul
 UuoHr6AK58IdQVG8NvF6l28mW3+dOLj/+AZRuKwti+wwTofBx73H5LVa3vxp441nxvON
 EUoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=p6K35Fdj
Subject: [Buildroot] [PATCH 1/1] package/python-libconf: add package to
 target
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYWNrYWdlIGlzIHNpbWlsYXIgdG8gcHl0aG9uLWxpYmNvbmZpZywgYnV0IHNpbmNlIGl0
IGlzIGF2YWlsYWJsZQppbiBweXBpLCBweXRob24gZGV2ZWxvcGVycyB1c3VhbGx5IGZpbmQgaXQg
bW9yZSBmYW1pbGlhcgoKU2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRh
cGFqb3NAbmV3dGVzYy5jb20uYnI+Ci0tLQogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAg
ICAgICAgICAgICB8IDEgKwogcGFja2FnZS9weXRob24tbGliY29uZi9Db25maWcuaW4gICAgICAg
ICB8IDcgKysrKysrKwogcGFja2FnZS9weXRob24tbGliY29uZi9weXRob24tbGliY29uZi5tayB8
IDEgKwogMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL3B5dGhvbi1saWJjb25mL0NvbmZpZy5pbgoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
Q29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KaW5kZXggNWI4YjE1ZmE1NC4uODM3N2VkNTNl
NiAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9Db25maWcuaW4K
QEAgLTExNjMsNiArMTE2Myw3IEBAIG1lbnUgIkV4dGVybmFsIHB5dGhvbiBtb2R1bGVzIgogCXNv
dXJjZSAicGFja2FnZS9weXRob24ta2l3aXNvbHZlci9Db25maWcuaW4iCiAJc291cmNlICJwYWNr
YWdlL3B5dGhvbi1rbW9kL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWxhcmsv
Q29uZmlnLmluIgorCXNvdXJjZSAicGFja2FnZS9weXRob24tbGliY29uZi9Db25maWcuaW4iCiAJ
c291cmNlICJwYWNrYWdlL3B5dGhvbi1saWJjb25maWcvQ29uZmlnLmluIgogCXNvdXJjZSAicGFj
a2FnZS9weXRob24tbGliZXZkZXYvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9weXRob24t
bGlidXNiMS9Db25maWcuaW4iCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1saWJjb25mL0Nv
bmZpZy5pbiBiL3BhY2thZ2UvcHl0aG9uLWxpYmNvbmYvQ29uZmlnLmluCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmY1Y2VjZWM4YzYKLS0tIC9kZXYvbnVsbAorKysgYi9w
YWNrYWdlL3B5dGhvbi1saWJjb25mL0NvbmZpZy5pbgpAQCAtMCwwICsxLDcgQEAKK2NvbmZpZyBC
UjJfUEFDS0FHRV9QWVRIT05fTElCQ09ORgorCWJvb2wgInB5dGhvbi1saWJjb25mIgorCWhlbHAK
KwkgIGxpYmNvbmYgaXMgYSBwdXJlLVB5dGhvbiByZWFkZXIvd3JpdGVyIGZvciBjb25maWd1cmF0
aW9uIGZpbGVzCisJICBpbiBsaWJjb25maWcgZm9ybWF0LCB3aGljaCBpcyBvZnRlbiB1c2VkIGlu
IEMvQysrIHByb2plY3RzLgorCisJICBodHRwczovL2dpdGh1Yi5jb20vQ2hyaXNBaWNoaW5nZXIv
cHl0aG9uLWxpYmNvbmYvCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1saWJjb25mL3B5dGhv
bi1saWJjb25mLm1rIGIvcGFja2FnZS9weXRob24tbGliY29uZi9weXRob24tbGliY29uZi5tawpp
bmRleCBiMzQ5ZTNlNjBlLi42NWJkZWU4NjE5IDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1s
aWJjb25mL3B5dGhvbi1saWJjb25mLm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLWxpYmNvbmYvcHl0
aG9uLWxpYmNvbmYubWsKQEAgLTEwLDQgKzEwLDUgQEAgUFlUSE9OX0xJQkNPTkZfU0VUVVBfVFlQ
RSA9IHNldHVwdG9vbHMKIFBZVEhPTl9MSUJDT05GX0xJQ0VOU0UgPSBNSVQKIFBZVEhPTl9MSUJD
T05GX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCiAKKyQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkK
ICQoZXZhbCAkKGhvc3QtcHl0aG9uLXBhY2thZ2UpKQotLSAKMi40My4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
