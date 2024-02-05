Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A51C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 20:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87FDC4012F;
	Mon,  5 Feb 2024 20:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87FDC4012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FheLWdoSgh0p; Mon,  5 Feb 2024 20:41:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B0CE40AB8;
	Mon,  5 Feb 2024 20:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B0CE40AB8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D72F1BF35A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 20:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14EFC40AB8
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 20:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14EFC40AB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wVDR5C7JYrjx for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 20:41:51 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32FE04012F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 20:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32FE04012F
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40fdb18ffc7so12789395e9.1
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 12:41:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707165708; x=1707770508;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HHB8uBXbc86UGQ2LURo7sKZh9mAjJ4V/X6qI70LYzoY=;
 b=e9ZoCErfIQQQYEil2ESDDCYLPHZ4Xw5y67CWmF1OYKKZcmXHPxNBRHs2BH+p2YPCBF
 Wm6xTaaLqLrfvE2HuC49EA/WWgow/h9HEUdts5Fj+bLizk99oFqyOVlA9wRmNIW8NGkN
 devYF77znEnwLHim/3ahTxYU27lDqxTGNRcXpL/Ie5aUqMDGWnozKYHoCGNuRxRbQDHw
 n3FzU18fRRPPJYq4u6rTHdQPfyp2UAkTrllQ0iFNnogTLXM7NJLmTYgN8TjhDD+GmaTU
 hUzLfrEEdFbZKLYZ7YPvt8DSP+8N8K0rhvjZbPmbPfCubhwv/wSXcJ6U9tGgw8V1Zwky
 6f+A==
X-Gm-Message-State: AOJu0YzgYNEfRJrtrViOtknZ099aqvD8qVbDjoZ1cNtZf/hHTMizgMuC
 Gi4MvvIIvA4YmXse7tth6ZSwz4XjTYEmdqkMwaeG9ORhsU4/mhbPmP87Nt+CoYw=
X-Google-Smtp-Source: AGHT+IHxVJGUjL/5OQu093/SKi8JK0gl0yi9d4/9HF6qi3eIh+FfqLetnwkIuB6onBR3ju71fuE6Pw==
X-Received: by 2002:a05:600c:4751:b0:40f:b772:c37c with SMTP id
 w17-20020a05600c475100b0040fb772c37cmr118766wmo.31.1707165708247; 
 Mon, 05 Feb 2024 12:41:48 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW/+lZkhjQ+6z2XlN2Mc09NTkU2G1L+MgTK4Rx1Rc8JOxfMFjZondqNsmJMWgAg4lDXzueSvK4c3ph0i+9eyk7LqKCwQ80OQ1M79g==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c315000b0040fde4451e2sm2202219wmo.0.2024.02.05.12.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 12:41:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Feb 2024 21:41:46 +0100
Message-ID: <20240205204146.284303-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707165708; x=1707770508; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HHB8uBXbc86UGQ2LURo7sKZh9mAjJ4V/X6qI70LYzoY=;
 b=YCRY02z7feXDSzbwIEk6lWEL+fj5Iy7KA7guTNERj7nkD3FmMgp/cfmRb6TIuvJw3v
 QiJ5gi1ZbkfLPmbafyTEKVz0CSbJhV0z/kHQkIDHnLGGSOcA9kOCEkhLl8gUObXEoOLn
 9DuNpk9s2M16sSwDjr0HYlbahFtbz3I9qRdT6jRAt4rpUTOvb+kp5nL8dkC7X1mNLvT1
 mPV37f8YpOzc0aKQQJhEvrYwpdKn2tA9PZIjB1qOFD7j1QvMPAoqexrZMemMwLmvYhbz
 OB8pw/kxfzgYakMILprGfI/xu1yWdrQVfE5LuYUJ/bnFDJ8QNljx4omCBK3Rwq6s4H2J
 LP0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YCRY02z7
Subject: [Buildroot] [PATCH 1/1] package/lua-http: set CPE variables
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:daurnimator:lua-http is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/F210C8BC-78BB-4D10-BAB7-AC624543764E

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lua-http/lua-http.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lua-http/lua-http.mk b/package/lua-http/lua-http.mk
index 7fbb09038e..df3e2c0059 100644
--- a/package/lua-http/lua-http.mk
+++ b/package/lua-http/lua-http.mk
@@ -10,5 +10,7 @@ LUA_HTTP_NAME_UPSTREAM = http
 LUA_HTTP_SUBDIR = lua-http-$(LUA_HTTP_VERSION_UPSTREAM)
 LUA_HTTP_LICENSE = MIT
 LUA_HTTP_LICENSE_FILES = $(LUA_HTTP_SUBDIR)/LICENSE.md
+LUA_HTTP_CPE_ID_VERSION = $(LUA_HTTP_VERSION_UPSTREAM)
+LUA_HTTP_CPE_ID_VENDOR = daurnimator
 
 $(eval $(luarocks-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
