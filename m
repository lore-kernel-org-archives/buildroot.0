Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9385BCA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 13:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ADA141287;
	Mon, 18 Aug 2025 13:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dk7jScvlLQfc; Mon, 18 Aug 2025 13:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A9834159A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A9834159A;
	Mon, 18 Aug 2025 13:36:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E20E196
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 13:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F328848D3
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 13:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWnZdNEuV0i5 for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 13:36:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 381E1848D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 381E1848D2
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 381E1848D2
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 13:36:39 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45a1b0b2d21so19376685e9.2
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 06:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755524197; x=1756128997;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f9AflSYmhUAlSvrbscV0foqFuNF7mhk0EplTm9e6GbU=;
 b=uxG9UBB6elf2CcsbrtkEM3+dlxMU90S+EAOFPvTfOfs6umm2yosOnToqyNopRFrQel
 g0PV9R/Tv6tNdRPfkBmVqUoTLz/tpvBxZzGACc714stbBHGezs21D6Py/wepBFzRELh1
 xVKTix87g3R9wlKznjLMMcZdIVOXnak9LVz5Rq97bmV/5+WqRRffqBBk2Q/12aA2/FBO
 X2B6yfUrSnLTVkY7jMfvGY/zefmGSQmAhvIovKY8aroYiwNcvw7lfjrBoxJptNgBYF/W
 ikJbN9i/eaKbchKf8lNFWsE3VOS4SUu0WbQxfbbfEEEFho5lxc61Fpqr8GLrZUPqrvqU
 Iutg==
X-Gm-Message-State: AOJu0YzsjjVelZryhLgFeFCrdfxZcaIAsUqrZDWxw6KGN/P0/dpfndqL
 JSDRgX2ZAEzCC6nDJR39hd5kCS22ITpD4ISWgtswzKZA0z9vt3xaXe/YuykBHH7u
X-Gm-Gg: ASbGncvleY16XUF8RB/zYK58KnDp03VBegyycTd2L3Krp8VjK288OVH8bRYDoRC+12E
 Wc7Q6lytmXt3anwGthewyrruk7w80WR+4yTw9QRv/kKRaYmC9aiEsjpFSnhW437z+KAQnxQh2Af
 7vur70m2JDSmTHL6x9QIXe34fXeQB7pjzKl+rLJOqHnauljCOskKsLSeMCj8eApZXozo04xu6zM
 +PhYELj+3M72HRK76XMgA0cdRVqi48Lo/AV9MNe+1gIBPz1nKtQHIiHEWb4v7ffjVd+Q3+hJPYk
 nZebzeTO4R614jrx7wqgt/Uz6PiHx8gCXXzSM2cwfmI35r3HdJ7E68+MY/PfIYXPffnPOqH9JKa
 aKTV4aQh5XqZcKfRmrs4Hz5AhtcaYGoNg/jEuMIYthMQZjFUBGQGs0ECk
X-Google-Smtp-Source: AGHT+IE2SdHW7nfBoKNyl6C933xRJodROO25Zeku6GnKU8lmalT45YcKJEpNWcKXakIhW/0e4jrBbg==
X-Received: by 2002:a05:600c:3b1f:b0:455:f187:6203 with SMTP id
 5b1f17b1804b1-45a218576d9mr84061245e9.27.1755524196483; 
 Mon, 18 Aug 2025 06:36:36 -0700 (PDT)
Received: from localhost.localdomain ([212.22.141.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b42a8f972sm423455e9.20.2025.08.18.06.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 06:36:36 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 18 Aug 2025 15:36:32 +0200
Message-Id: <20250818133632.862010-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755524197; x=1756128997; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f9AflSYmhUAlSvrbscV0foqFuNF7mhk0EplTm9e6GbU=;
 b=YVneFtVpgsTkTwqXgOdcZV1oHuzo4tkFTZExTylIhItDEX4hjK+/g6koKFUU6GLbyK
 kLD5T0B8kBdx38dofYXOYuVKx+aSkiSfOE+ThYKCMcrKuH+CS8vKHhTYaiJjN8eMF0xu
 pF7SgLEX1VR8ubaadVI3rKfUyNVcBKIlil9iRuzlhn2INWxgfmAoAZ869BDxS/vUZ5WR
 C0+9SYRmbLMtjzbfyHQL7AKM4kHXg764yF0kzjR++/lrEsuGfE8m3MbaQWPzri+IXeSu
 dpTeKo/+t7wnl6PK02AxnyRFxRrVtHyGFTQpDeKT75j1+jE818QVcCkznsGSxH5gJWbm
 CYqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YVneFtVp
Subject: [Buildroot] [PATCH] package/jq: security bump to version 1.8.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/jqlang/jq/releases/tag/jq-1.8.1

Fixes the following security issues:

- CVE-2025-49014
  Fix heap use after free in f_strftime, f_strflocaltime.

- GHSA-f946-j5j2-4w5m
  Fix stack overflow in node_min_byte_len of oniguruma.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/jq/jq.hash | 2 +-
 package/jq/jq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jq/jq.hash b/package/jq/jq.hash
index 344f73d463..b9d73cbf9e 100644
--- a/package/jq/jq.hash
+++ b/package/jq/jq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  91811577f91d9a6195ff50c2bffec9b72c8429dc05ec3ea022fd95c06d2b319c  jq-1.8.0.tar.gz
+sha256  2be64e7129cecb11d5906290eba10af694fb9e3e7f9fc208a311dc33ca837eb0  jq-1.8.1.tar.gz
 sha256  ea9e53f5974239869c51ace8bb6849c9751dee7c9d592180957987a1a133caff  COPYING
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index f3f4704f37..3077a76b17 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQ_VERSION = 1.8.0
+JQ_VERSION = 1.8.1
 JQ_SITE = https://github.com/jqlang/jq/releases/download/jq-$(JQ_VERSION)
 JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
