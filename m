Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF331C54E60
	for <buildroot@archiver.kernel.org>; Thu, 14 Mar 2024 17:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7924B409D3;
	Thu, 14 Mar 2024 17:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ybbr_scq65J5; Thu, 14 Mar 2024 17:31:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ABDB41061
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ABDB41061;
	Thu, 14 Mar 2024 17:31:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AAD011BF3E8
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 17:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4F8E82131
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 17:31:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IrUhVUTvXJYx for <buildroot@lists.busybox.net>;
 Thu, 14 Mar 2024 17:31:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59E7981F54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59E7981F54
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59E7981F54
 for <buildroot@busybox.net>; Thu, 14 Mar 2024 17:31:38 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33e8f906f3dso1092226f8f.3
 for <buildroot@busybox.net>; Thu, 14 Mar 2024 10:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710437496; x=1711042296;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=60FfdCP9bmWsilxNJBPOIAU5m4q/RWojCld73wK8cDU=;
 b=fqVbUEMi80U9IB6hY283ngUQvFwxUmCI3tFIeGrOou6PoOq7MLrtXOjBPBhGE3LsIu
 iZc4cRrfphCusELXW847i7yhZKfLoF84h4j1G6+61BqLDiJLVzzPC9aH9+yMCR+fZbMl
 B9199XpFci73ZTDA+jhSw+qJ/nFRrBsBS4ISFnlqR0zbM2U/8UadqyxF3s8EJ6XxT7wm
 fZ8hYbMBA5AF2XNGlZgw/0wlcti+vF2TrZJokZdY91QHmrJ7ZqGE/41dxPLuhHiIdHps
 PTqpa9uPXbKpWRQV/9R97g6Kdwltvf3SnA8zcB+4Wz4XFbn0Rjd4yWS1qYjSLXcBQJtQ
 L8hw==
X-Gm-Message-State: AOJu0Ywai9z3bUlKGUZZ95gGGgB7atsPTdk1eUd0Vo+gOy5yLlhWudV3
 efy82bKk/tNpY/Ydd8tQdkU32IsyDkeFoEQ+lYGSDVk6/L7Gd7Ljm/viKws+
X-Google-Smtp-Source: AGHT+IH6hH+K9TFPEI/p3QfnjNvD9gynlT4Vn6wio8ZT3O5Cg4OuSyvfMk1W1KYkprs6kRnEhcqi4Q==
X-Received: by 2002:a5d:694c:0:b0:33e:c9ae:3a47 with SMTP id
 r12-20020a5d694c000000b0033ec9ae3a47mr575642wrw.38.1710437495984; 
 Thu, 14 Mar 2024 10:31:35 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 w16-20020adff9d0000000b0033ec7e71178sm1202793wrr.77.2024.03.14.10.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 10:31:35 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu, 14 Mar 2024 18:31:30 +0100
Message-Id: <20240314173130.16321-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710437496; x=1711042296; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=60FfdCP9bmWsilxNJBPOIAU5m4q/RWojCld73wK8cDU=;
 b=I3SLoZ85KnPmR+ANSTarhGkNl4qzJocWWPDU8cH5FiVXlblTioqeFw2zNeMjGaiUax
 /nBCjKIJO08E3wg+yIDVztiFi4IIlI8qoEf0Ee5rHgpV8jo/gdZmdOh1tihzn6eLM1TZ
 BhCAhIl2C8i5OSdUvP92zawEMjG7QrpQ0vNzgtEOy7p6xelBTs/w2dZ7Fzl1RjLyombu
 yYkSBGI9ULhGO7jZGtGteLYpYI5a7iiSPyUdx8UVVlo0eQOqGMxkfc1ULooLoZcYlRdy
 SVoRm0TCvk42gsRFDaoIF4IR2ObabFN4CsohTiBRHmqww47Scjv7O9h7nmnPjYf+Gv+P
 CAlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=I3SLoZ85
Subject: [Buildroot] [PATCH] package/luarocks: bump to version 3.11.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

COPYING: update copyright notice
see https://github.com/luarocks/luarocks/commit/a0bc05dcc7f44b94fb4585c560928ba9be6d8bdc

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/buildroot.lua | 3 +++
 package/luarocks/luarocks.hash | 4 ++--
 package/luarocks/luarocks.mk   | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/luarocks/buildroot.lua b/package/luarocks/buildroot.lua
index 3c044d89b..2b5235866 100644
--- a/package/luarocks/buildroot.lua
+++ b/package/luarocks/buildroot.lua
@@ -350,8 +350,11 @@ function buildroot.command(args)
       return nil, "Error loading rockspec: " .. err
    end
    if rockspec.source.file then
+      rockspec.source.dir = rockspec.source.dir or dir.deduce_base_dir(rockspec.source.file)
       ok, err = fs.unpack_archive(rockspec.source.file)
       if not ok then return nil, err end
+   else
+      rockspec.source.dir = rockspec.source.dir or '.'
    end
 
    if rockspec.source.dir ~= '.' then
diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index 713645692..fbf527021 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ffafd83b1c42aa38042166a59ac3b618c838ce4e63f4ace9d961a5679ef58253  luarocks-3.9.1.tar.gz
-sha256  542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
+sha256  25f56b3c7272fb35b869049371d649a1bbe668a56d24df0a66e3712e35dd44a6  luarocks-3.11.0.tar.gz
+sha256  660773f53ed17cd0d8be7d67168c25e8cc664a506788c7b5971192bdd2994a9d  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 2bec2fca2..4c9922914 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.9.1
+LUAROCKS_VERSION = 3.11.0
 LUAROCKS_SITE = https://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
