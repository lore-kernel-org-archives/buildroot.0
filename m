Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7D6CCD185
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 20:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 215FE81A5F;
	Mon, 13 Oct 2025 20:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATaqoG4g1oNY; Mon, 13 Oct 2025 20:18:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2780781E3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2780781E3F;
	Mon, 13 Oct 2025 20:18:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AB88294
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CA4740B9B
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3BjzmLKI3-V for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 20:18:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2F4E940B5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F4E940B5A
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F4E940B5A
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:18:52 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46f53f88e0bso25730015e9.1
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 13:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760386730; x=1760991530;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m5IcaPwNKeFvPzqjKAglNVBRNwxUwetZU/WZnF7SKOE=;
 b=dYeD6roPsOkKmS+wNuayBub4waNAyLGFN8KZTRfyQPC0EsQ1nm0ajuzt0g5h2buAi6
 5nflN0EBW1jRsnNqUFBgrXa97m9jt1up4AjqstA6xzAL0IT/lunKBsnTjbPnONE/DXWm
 FWsH9DW3wRWntjGlS89EwfHHktYL3jvXCuD7hb3UNhK9Swq3RgNG1gVLKEVfaLmT1S8g
 OBHArUf8yt14TEBPhsuti6zFyyd65qgdnmAWQyccEl6pio7O3KrPmWNoH3KnRlC0yQ9/
 Q+ZicmwAyzhJ7YHmjY83WQTXGvu2V4W1Cihn+7luzjHtQZYs3SUgicCc0swJUcLzm6uj
 X8yg==
X-Gm-Message-State: AOJu0YySBqqzSAl6cNqIF5jevX2+42neCOP/9ZzqPX9G9ED1k5WsIgzt
 DA6/5T18imPBi/qp6qh1IB4UE1aXDbmxtY57i3sWXg6IaUR7R12Gm+3SrTqNZf4ugiigdRl5T+U
 0IKN2K60=
X-Gm-Gg: ASbGncsSNBqmBJx5PNzfSB8quvzfsb+jnBF24yvJoBSThzooGSQGfOnxQjxpUKx4LCE
 bvuqyARJm0rNuORvtaI4NJt5W+RA+V+WNx8xUwwWGxKTFIjrAVvMOIuCgWXndJl3PkPtZ0OICWN
 GKjHJH4Wq92xMwp1mdKmtaDSvvAqLiIYNWE6P0SbQKs2VDbAUSfWqD9syKxIv4X7giCs1h1qf9m
 yImRjdrQP5lPzYkJyszycRUaj5uqMws/3nlKe6W5vR7nbJuqQ0Is6n9tJJkCuO03JxZnqvyWVbN
 bblwV4JMSqcsQ06lT1eduzQTlLkBoeSvD3IpGyr96u8b1PpIQ0+yYFlKPX4UkKlkqLjBhHd3d3Q
 qUL3ya79N3YDCJgx7boEoz5Cpv+saS560VUoFZe/TwUmja/AaoOaCZGv/DAREj0S9LCf94jsZme
 u0n+d6VICwiVos
X-Google-Smtp-Source: AGHT+IHfawP7UvprI1K/RLbzEJ7MG5uM15rphbO6e6AUD4cLMhMNNFSa5AX1n/rVr92BXIcmhrHZnw==
X-Received: by 2002:a05:600c:4f08:b0:46e:3dcb:35b0 with SMTP id
 5b1f17b1804b1-46fa9a94553mr159093235e9.2.1760386729935; 
 Mon, 13 Oct 2025 13:18:49 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb49bd977sm201930385e9.11.2025.10.13.13.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 13:18:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 13 Oct 2025 22:18:46 +0200
Message-ID: <20251013201846.3834135-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760386730; x=1760991530;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m5IcaPwNKeFvPzqjKAglNVBRNwxUwetZU/WZnF7SKOE=;
 b=Uqt6n2G9zPzk8ug6GCF+zwoBuDqO/mGw8YIu/Jc6Q3tlCb/0kqoEmR0GItvHtIGYgP
 xliAWotgdehytRo2CZd8E+5ZW5O8T6F3Lk9EWTPpr+kuWY0Xc9JkgK5PX9Q54WINCq79
 WFPJ3O8JN0r6QgMtSApdZ7tIEr/lukM1q1zEw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Uqt6n2G9
Subject: [Buildroot] [PATCH 1/1] package/highway: bump to version 1.3.0
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
https://github.com/google/highway/releases/tag/1.3.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/highway/highway.hash | 2 +-
 package/highway/highway.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/highway/highway.hash b/package/highway/highway.hash
index 5addf50eee74..78c0dea5808d 100644
--- a/package/highway/highway.hash
+++ b/package/highway/highway.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  7e0be78b8318e8bdbf6fa545d2ecb4c90f947df03f7aadc42c1967f019e63343  highway-1.2.0.tar.gz
+sha256  07b3c1ba2c1096878a85a31a5b9b3757427af963b1141ca904db2f9f4afe0bc2  highway-1.3.0.tar.gz
 sha256  43070e2d4e532684de521b885f385d0841030efa2b1a20bafb76133a5e1379c1  LICENSE
 sha256  d25e82e26acd42ca3ccc9993622631163425b869b9e16284226d534cff6470f2  LICENSE-BSD3
diff --git a/package/highway/highway.mk b/package/highway/highway.mk
index a74bc90dd365..264420172250 100644
--- a/package/highway/highway.mk
+++ b/package/highway/highway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIGHWAY_VERSION = 1.2.0
+HIGHWAY_VERSION = 1.3.0
 HIGHWAY_SITE = $(call github,google,highway,$(HIGHWAY_VERSION))
 HIGHWAY_LICENSE = Apache-2.0 or BSD-3-Clause
 HIGHWAY_LICENSE_FILES = LICENSE LICENSE-BSD3
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
