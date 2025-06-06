Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD91C5B555
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 13:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D996083F08;
	Fri,  6 Jun 2025 13:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QuujLkNfeKy4; Fri,  6 Jun 2025 13:36:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05F0A83E32
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05F0A83E32;
	Fri,  6 Jun 2025 13:36:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 302B2D3
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 13:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2214C83E1D
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 13:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VpFyxThXbzz6 for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 13:36:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=fred.lefranc.evs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0C13C83E32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C13C83E32
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C13C83E32
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 13:36:47 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso398063266b.0
 for <buildroot@buildroot.org>; Fri, 06 Jun 2025 06:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749217006; x=1749821806;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wSJVB/VK/IU+sjbWohbtLXdiYlYXjxAt7kMDpigPiXA=;
 b=JmjSuRS/eOr2P7uyjqV2QO7rohaeQIIfsGl0JI/YDJ/XslkwSsHikxOUW2p+EeCbJb
 /QibsA1Tx9b63VVVxv7g/APwRLnFE3Q86kkbj2Afd4H4gJUzkh0sLpvJ/Mep4Eh53aAj
 kqlzWMDM0NGZUx0EdpEHuiNBvSyK7IxPGVUEeMA4/wur/cQ57tISqxpYT8xXNhufyQF2
 GquvHINsaCCjV9B0Epwpf1gBD+JX4lAhWqR9Pt7h/iYsuOA30UfVS20P6qG/sl2TSig7
 FcJTT64Aca1/uEA/S/FH0sfe571TRy02LrsrBijtZO+XlymoB9hJlgVveMa4KvE4IMbP
 by2A==
X-Gm-Message-State: AOJu0YwT0PTbnFeXoO62l81bTsX+XxEJ4+CFiiYtbypuY9uc6w/swxm1
 KGAWQueO4vbtMh/LZjATVrCIxijQitDhONGQf1YoEOyETycvoo14AVY1s6T8A6CeC2TCve40NMH
 6ZdWKtnnRG10g0mWmKU60CDjcr5B+VGfOCuJR6W4t5Q==
X-Gm-Gg: ASbGncsw019y2JXdB8bJAa5Qrq3yxHA/y57KWpxd7GuF430qfET1WdnNWhbWCQNPUCV
 Kzldh/wOatsN2y6CgfpDJkHaflGE2B1ZEuxl5TuzfEVd+c7zAQ02uGfdic49iPkyKTAgVPv230N
 +I/lGr1tHBUVJkw9lUpdM9rbchRSH8WuKlLA==
X-Google-Smtp-Source: AGHT+IEC4JIP8/Ac9w9/8QpXYBpFmieL3zEy8X2El7k3ZjFoxBJZBt05OYngFQPfYc81HcKDUAZjuZkympZstL5s/OM=
X-Received: by 2002:a17:906:7950:b0:ade:198c:4b6f with SMTP id
 a640c23a62f3a-ade1aa0fd7bmr278637966b.1.1749217005610; Fri, 06 Jun 2025
 06:36:45 -0700 (PDT)
MIME-Version: 1.0
From: Fred Lefranc <fred.lefranc.evs@gmail.com>
Date: Fri, 6 Jun 2025 15:36:34 +0200
X-Gm-Features: AX0GCFsoWIZieuGZXbkNBNJhm2t8dQ5XZDDwm3iQ3wj9hHFNvzsVrIKg0Xf8uDM
Message-ID: <CAGkXw1Up7cdAP2J8cBOsm8oXzjD=3Yu-qQOVjvPYehwCY_1SZg@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Julien Olivain <ju.o@free.fr>, 
 Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749217006; x=1749821806; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wSJVB/VK/IU+sjbWohbtLXdiYlYXjxAt7kMDpigPiXA=;
 b=XIj3HY+OchlYYgyDK9UUbLjGEFJ0T6G1PnBkKFBUze7ZfHeJUj0cWelzYjNZLiw2gR
 BOiiol8Rf2pOBstAFsFDDuC5bYA0ZPHHJUtRzyaBZa2QDLNNnpIjTxDjqJrkRWTadlgq
 FdcRR38ZJJJHuXzJbVg1/ybqzfw+3z89sbB7uY2ywvgcGUz+wqiEUuMn3rZevJPLoaAg
 vMxJ3ZqQ65g/Wg2u2yLEHw8BPtNPfg/7/xw0ADUuqG70Gs/sC9FdBo4+7HR7AA9AvTf4
 Xuc4HDeAjEi6yc8UjLpRklUImqRJSAf44iz3gnUnCvgSNWKwo6ySCqmUdm3Kj0OgzsnF
 MCuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XIj3HY+O
Subject: [Buildroot] [PATCH 001/386] package/libmodsecurity: security bump
 to 3.0.14
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

Changelog: http://www.haproxy.org/download/2.6/src/CHANGELOG
Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 74390c2ff5..42f340fa80 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.15.tar.gz.sha256
-sha256  41f8e1695e92fafdffe39690a68993f1a0f5f7f06931a99e9a153f749ea39cfd
 haproxy-2.6.15.tar.gz
+# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.22.tar.gz.sha256
+sha256  4c0797f450f997dc287d2c7aafa7a0e5b7a2d71593a2cd58e664e8f3aea614fa
 haproxy-2.6.22.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28
 LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a
 doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 61a9ebebe4..77195d966b 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################

 HAPROXY_VERSION_MAJOR = 2.6
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).15
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).22
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
