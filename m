Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D54DC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 20:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEAB740B3F;
	Sun, 18 May 2025 20:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q6fgkh-bUYKo; Sun, 18 May 2025 20:04:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 133904092A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 133904092A;
	Sun, 18 May 2025 20:04:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21D2D193
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 080F081EAB
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GFCYQLaoQ1k8 for <buildroot@buildroot.org>;
 Sun, 18 May 2025 20:04:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3EC7081E85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EC7081E85
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EC7081E85
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:04:27 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-742c9563fafso378477b3a.0
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747598665; x=1748203465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+k0C7lYPNyUJamRxiYXPGAbfeVD0Bi+TXqUK4ccybv0=;
 b=pqg5EIXSSi56xSic2+84GtbEwA5uUYnqXHOngP8qGz4kyM5AfcdwOBjDmppEnuNlrr
 beO929Jmyzq/KqDiGLVD8H5aB6qBU5TYgNQRxOj7NNsYOXFK9McwxFu4WDTciCiv/FyZ
 sQoapO9ELde9jRm1dijgcID9Seb8NWgVTvQMjRrunMb/SnmKahWcS5oP1KCk1S3HtmMG
 WpMW9Lml9iN2uTBqOh/l9DFEG6ptXIZgmjW8eaK0QmP6qpP4gowu767VN0wDdjXzNrah
 xyMeuCwPJZkVT0ycfK0qy5KDKC6MyspomzVrLDwQymBazbO7hJY9pC8a148UJ6r4EDXA
 1Xng==
X-Gm-Message-State: AOJu0YyzeGshE3pawQ2sSuv6Zj47HkUPLXC/HaaDG4eY7bHgwheIsG/9
 STy2pFwpd4a37T21eRD48aQ2tMsDapwylEozU0/twVGXKK/jK/O9ztccIIo4A+bv
X-Gm-Gg: ASbGncv8Mn4ubBlGjQg3twflLedzvwrETsRiVH1fWIrggtNC+dr8x4+wayxfdBy/h3V
 QY/FobFpKOUOrxcFQ/3l05DO+zoVEqeLgavLtK4tHXE8cCLV78vsGdeB5VGq3ZzLMCq8aNylsxs
 nBRdviMrlqsf0ECZdVZ/0EvT5VyDcpE9WdSOgzJN4ZFq2tnwGgh0SP7obI7O3vQue+BU+LUPqr+
 +Nzg9hvLRaUrU4gryZv/1+6EiE4zUp2Y4wwBRKiUCpYefGG8oiGwFqleuJwEoYP2ES7QG0ZcpPX
 MFrK8Yjbslf9105aL+SsYcasLOg2Mm4tQZNtOOSuynJaQpMtzeIBd8tbB/mdPqR7O/Yxi/RiOPG
 aF4PLSE8ujg41oO/MgzpyTiSjAEqu7OnFtZiajA==
X-Google-Smtp-Source: AGHT+IEDOkBorlxxEAPpJ5Z/CaNs4ooQ2YIvgswhY9SoTj+Dapsk6qvB3OBHVeyon3gYqOfKEDQ4iA==
X-Received: by 2002:aa7:9f1e:0:b0:742:aecc:c46b with SMTP id
 d2e1a72fcca58-742aeccc5dbmr9649405b3a.15.1747598665455; 
 Sun, 18 May 2025 13:04:25 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a970b923sm4805394b3a.42.2025.05.18.13.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 13:04:24 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Sun, 18 May 2025 13:04:21 -0700
Message-Id: <20250518200421.146362-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747598665; x=1748203465; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+k0C7lYPNyUJamRxiYXPGAbfeVD0Bi+TXqUK4ccybv0=;
 b=XdVsDML9knROzkVxQCGvOJuWL7Ms3nVk+hwISWW8wiyWTNwvL4yGR0ah/t50+D9g65
 4xco+wy84vuwsKx3tDC6Aol7vCIomjwrCHkYNeqtmemq3v/SCfx8d+5iKk4nSCfW8toF
 Z6juU1KuZQcpFbnGY0NIS8jFEvRemMOE0bfbspAqfSKmcJV0GfYbKDlOeGLjJBshhrf0
 a3qeBBn9zqWvkG5RXgRpSd5Y2e0RduNwXfaH+5Xu0tYr0NFosnbdeSnehRsCiZmfsuyt
 QRsy4xgHd0xdeICDyrAqfDdCbFjrvg6Bq+ZpBttIuqZhu185CCh5sABfPi9zorbUkvZH
 8y+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XdVsDML9
Subject: [Buildroot] [PATCH 1/1] package/htop: bump to version 3.4.1
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
https://github.com/htop-dev/htop/blob/3.4.1/ChangeLog
https://github.com/htop-dev/htop/blob/3.4.0/ChangeLog

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/htop/htop.hash | 4 ++--
 package/htop/htop.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index 3e45e1a21a..0750ab0098 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,5 +1,5 @@
-# From https://github.com/htop-dev/htop/releases/download/3.3.0/htop-3.3.0.tar.xz.sha256
-sha256  a69acf9b42ff592c4861010fce7d8006805f0d6ef0e8ee647a6ee6e59b743d5c  htop-3.3.0.tar.xz
+# From https://github.com/htop-dev/htop/releases/download/3.4.1/htop-3.4.1.tar.xz.sha256
+sha256  904f7d4580fc11cffc7e0f06895a4789e0c1c054435752c151e812fead9f6220  htop-3.4.1.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 4fa8e4fb5f..55e3b9d57c 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.3.0
+HTOP_VERSION = 3.4.1
 HTOP_SOURCE = htop-$(HTOP_VERSION).tar.xz
 HTOP_SITE = https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
