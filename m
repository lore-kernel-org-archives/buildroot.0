Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621FCC021AA
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 11:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B6E48209F;
	Mon, 17 Feb 2025 11:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Afmu3gjzi6R; Mon, 17 Feb 2025 11:52:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DBC1820A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DBC1820A6;
	Mon, 17 Feb 2025 11:52:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C077CDE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A456660DF9
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:52:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9TJN3js6BiVQ for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 11:52:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC84D60868
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC84D60868
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC84D60868
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:52:09 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-8557e9aa4b0so124574139f.0
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 03:52:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739793128; x=1740397928;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=unFZgIDWIwOCw/y2fydoDI+T8cWv9eTxsVNFcc29WN4=;
 b=L1zRrEnaIufbfpueizaUL3pzAlzzjkfoCw+9MOtOvvA4o3SpPAWtj12RoSV2AgJNjX
 LVJZnBXzn24wj+0AR8hRAWtiNVxTcB6U0iQXNWEv8KsKEu8hWh/0BeVXRCyuArqFK+zO
 K1W4OUT+GoicQwLy5MOSz4dQpq30WLl3TTl/sokvm1SoUsitqAFywsjdoyuuaZY0ERRH
 cy09VcT0DkN6rF6QVdVi4BeyWa+aNwLkjPOXC7uy31jvT/N64gb73X2hvLuDfjDDM6+E
 Gh1ywAsny72ownLYD1nITb7yCOMbErOyKHyfThEx9elaQuQMUJNvruj4M1mkpUIUYuW0
 3D4g==
X-Gm-Message-State: AOJu0YzVFjz3bTfOQxhyNYBxZdNTTsmBFUFJLaqKxpTH3d5n4ygUcz9B
 OyvsuW9K8YhjfG/KhYaHxFY6ZCC1/39yLP5tTsLCyOwMLNokByijRdPeZw==
X-Gm-Gg: ASbGncusI/UZYgY4EpvIUBUf1QDha8MT02g8U9+Jf77C68kOSMleSOzwWSTt0BzZKko
 nsBGkAcYkS7VkVzDo/2PoxZK6js0QjWqKWcfr9ZVPuu6TfbS+F2KgXmQVLwmniV4/vch0kq4Ogm
 qPG5sViUcGUxoVzvMFUI2iaTiRqvg9nReyphYA6wA9HpRi3qsnxWbyC3lY+CsbfX7LtJfHsbNDu
 x9jmeJuz4bMwC9tPSQQrFIMhL9JQNarGex62EPoDZpviPYxKaJ70kQiYIIAf8QmHGk5iZjlWGZK
 tFjQLBfwL7Z8KUfmyMfRguV9g35AvXoVKu4k9KXjmqPW+yKp9UZXF2mz6oLa5eZOBg==
X-Google-Smtp-Source: AGHT+IHEkmZEktKnia7TknLZL5gJn+NWzZWFObBFTWm5WLXCzzPL2w9o3otEjhQ13TtMioSz50ZixA==
X-Received: by 2002:a05:6602:6c0f:b0:855:5eba:405f with SMTP id
 ca18e2360f4ac-8557a0b8f1amr810621639f.1.1739793128520; 
 Mon, 17 Feb 2025 03:52:08 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ee980374dasm552899173.3.2025.02.17.03.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 03:52:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 04:52:06 -0700
Message-Id: <20250217115206.1884755-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739793128; x=1740397928; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=unFZgIDWIwOCw/y2fydoDI+T8cWv9eTxsVNFcc29WN4=;
 b=YLamZ3xvhsQbWpvLgMWmPfCPvo+3c2Q15Txc+l+mNBxJ/CKWN+iYZDCh/OI+tq1d46
 37t9piOw3Z0wlOYrwk6Oh3N1FNuzBlz0VMk4+rYUcPar7R2MsgbFkv2ER+8hA5R/TW7M
 eGvwZgtSSvRgEq6bMw2yoNqpf7FnRX1G6+jfbjBHWXNBmHByLJA9tNSMtsgQGFABiCH6
 1+ilRZTdXYFa9pPtmpmxOdIPytxJTfhTaFmneb5zjd7u0kCzneFwiWwzxpi8WhRU9fzR
 SkD5HBPt2KrGTv519SbQBl7mqT9Apd535NBv9gRbdiQIH6nmxNcfUg0uoHRgGsKoUL67
 9d8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YLamZ3xv
Subject: [Buildroot] [PATCH 1/1] package/python-aiosqlite: bump to version
 0.21.0
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
 package/python-aiosqlite/python-aiosqlite.hash | 4 ++--
 package/python-aiosqlite/python-aiosqlite.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiosqlite/python-aiosqlite.hash b/package/python-aiosqlite/python-aiosqlite.hash
index 52c78a7630..eed222f80f 100644
--- a/package/python-aiosqlite/python-aiosqlite.hash
+++ b/package/python-aiosqlite/python-aiosqlite.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiosqlite/json
-md5  22620fe09bc9d9df3bffef19919eed7f  aiosqlite-0.20.0.tar.gz
-sha256  6d35c8c256637f4672f843c31021464090805bf925385ac39473fb16eaaca3d7  aiosqlite-0.20.0.tar.gz
+md5  693b491a6ad7caa281618a83bf83ddc6  aiosqlite-0.21.0.tar.gz
+sha256  131bb8056daa3bc875608c631c678cda73922a2d4ba8aec373b19f18c17e7aa3  aiosqlite-0.21.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ab0c171dc3ef8bf325a84bb77d855421f2611335ddf6e08816b2922c4edc0f76  LICENSE
diff --git a/package/python-aiosqlite/python-aiosqlite.mk b/package/python-aiosqlite/python-aiosqlite.mk
index a48d676c69..bdb222001e 100644
--- a/package/python-aiosqlite/python-aiosqlite.mk
+++ b/package/python-aiosqlite/python-aiosqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOSQLITE_VERSION = 0.20.0
+PYTHON_AIOSQLITE_VERSION = 0.21.0
 PYTHON_AIOSQLITE_SOURCE = aiosqlite-$(PYTHON_AIOSQLITE_VERSION).tar.gz
-PYTHON_AIOSQLITE_SITE = https://files.pythonhosted.org/packages/0d/3a/22ff5415bf4d296c1e92b07fd746ad42c96781f13295a074d58e77747848
+PYTHON_AIOSQLITE_SITE = https://files.pythonhosted.org/packages/13/7d/8bca2bf9a247c2c5dfeec1d7a5f40db6518f88d314b8bca9da29670d2671
 PYTHON_AIOSQLITE_SETUP_TYPE = flit
 PYTHON_AIOSQLITE_LICENSE = MIT
 PYTHON_AIOSQLITE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
