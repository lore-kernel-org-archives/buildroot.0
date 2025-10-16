Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAFECCD183
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 18:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08848606AF;
	Thu, 16 Oct 2025 18:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lg6jiA8gAAWA; Thu, 16 Oct 2025 18:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A407F606BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A407F606BF;
	Thu, 16 Oct 2025 18:32:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ED1B0EC
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 18:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D37AC80CB7
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 18:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzgHqEhtAKK5 for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 18:32:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D305880CB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D305880CB5
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D305880CB5
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 18:32:53 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-471076f819bso8704545e9.3
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 11:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760639572; x=1761244372;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NlHR7U311Ib1oWYTHBOEg8nQUI3vHHawClv8HhJ4H40=;
 b=TxDXj4/bEOsOaEjCOmN8JAgjK4HS4tcBp6Qe/rGh6IPnKKWKv2frlGJk00wcrdTkD/
 9yHV2mmPHFzCuMOnq24KJoWc5S588tEMLZIbH3SZJhCwSwsRu4XHm96HDDuDYqfRGGTY
 u9wUQiLCi6F4hHjbuQItWNyRaD73i4miw6cJBcrnc24quppcnztQndzTqeIbPJ3uj2xb
 Lnd/dOejtgn7FikHELCm8YcxPc4zKzzMtnBkM0O4MCel9sZ6Jdk/71+/PE5kOBLAmWha
 Sr0zfNzsAi+HiY1O5DoMjGqeO6Vu+4tE9qXpkVUtOVa00UQI/3VHsonL8CAcK5L4UApv
 aJ8w==
X-Gm-Message-State: AOJu0YzNY31gT8BJWG45joqdg+str8REbF19qPZ1x2tAr2H50M5FNh1U
 lIgBN6wk3VrB5g7NBnVXTarusijaPjJkdtkivI/PrMqnsZACbhaAZv2ScVcv7ZMWtSF9HTbhXeT
 kCcHu0Mo=
X-Gm-Gg: ASbGncvsfSds/Zmd/q6dn8JrQdl6XTtlxE6nKGAONIlAq4XRPOyuA8/1a37DuD4LMYQ
 OzP8Agt0guny7M2qAdjmmz7QEJRtY6ZkOIgP9qc5a7fk+vUEIsUu3XV5fbCAeH5iWpmLpne0WsC
 bwyD2a6pr4+biLTy61VAhAI781Ha38jK7OrGyuaQJ/SfnzIUqfoAfkloWeymcymu2Tw5ISaogMO
 CgvO67QCO/4hkpZpDqEZIoXyFEZthxJ7EDvOimwIw5fbUmO4PJMhohtSFYX6YzhlYYAMcrR5nDv
 8myWei5Qb7jtTkQN//2r9HNphGsr8TiBFqv8T2INs7kCgJg/a2SDyxTbdt0wn4qKx9XohHdvNC/
 WHfK7O9ytK06YXGyJzM8eY1uf+ohgDw8ZQHLREgp8vJxOCs9jgp6NMIYO81wXbOY02JeBJO50gb
 /xgKBQ9tJqDgdRm1yXTJLCOuxbB2yw2LOlCQNvzJydF0QhTglYbQ==
X-Google-Smtp-Source: AGHT+IEXsEhvxo83iMLPIYdBMMxc3w1VyvdGtisJdKfIBglmhT14bwzGBgimwfRQPQEviDFmwRJU3A==
X-Received: by 2002:a05:600c:1d9b:b0:471:a3b:56d with SMTP id
 5b1f17b1804b1-4711792006bmr8468145e9.34.1760639570808; 
 Thu, 16 Oct 2025 11:32:50 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.252])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471143663afsm41178425e9.0.2025.10.16.11.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 11:32:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 16 Oct 2025 20:32:47 +0200
Message-ID: <20251016183247.169061-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760639572; x=1761244372;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NlHR7U311Ib1oWYTHBOEg8nQUI3vHHawClv8HhJ4H40=;
 b=C+zNvMwPVMma3bwW/lMW7E/sQdAgyFAM4v/qs+7anThXnBe3tIbAsHhzDRi4z8wPvq
 BWMRzWnVA/X/6KFqUZEoTiA3pnoMvoXrU/zx0Qi9zyHUmdMrB4go353ETaNy7y0/SMb0
 BsHR5KuAIAkPfzzg8nDRo/D8pX9c+8+CzKVok=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=C+zNvMwP
Subject: [Buildroot] [PATCH 1/1] package/json-glib: bump to version 1.10.8
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

Release notes:
https://download.gnome.org/sources/json-glib/1.10/json-glib-1.10.8.news

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/json-glib/json-glib.hash | 4 ++--
 package/json-glib/json-glib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/json-glib/json-glib.hash b/package/json-glib/json-glib.hash
index c4381fc0d713..6ac9814c1071 100644
--- a/package/json-glib/json-glib.hash
+++ b/package/json-glib/json-glib.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/json-glib/1.10/json-glib-1.10.6.sha256sum
-sha256  77f4bcbf9339528f166b8073458693f0a20b77b7059dbc2db61746a1928b0293  json-glib-1.10.6.tar.xz
+# From https://download.gnome.org/sources/json-glib/1.10/json-glib-1.10.8.sha256sum
+sha256  55c5c141a564245b8f8fbe7698663c87a45a7333c2a2c56f06f811ab73b212dd  json-glib-1.10.8.tar.xz
 
 # Hashes for license files
 sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENSES/CC0-1.0.txt
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index 9595c1727468..c99a3e666d21 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 JSON_GLIB_VERSION_MAJOR = 1.10
-JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).6
+JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).8
 JSON_GLIB_SITE = https://download.gnome.org/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
 JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
 JSON_GLIB_LICENSE = LGPL-2.1+, MIT (conformance test data), CC0-1.0 (parts of build system, metadata, translations)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
