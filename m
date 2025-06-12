Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CE3C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 10:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7A12407CD;
	Thu, 12 Jun 2025 10:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLOrxh_wBOLi; Thu, 12 Jun 2025 10:27:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED7E7406A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED7E7406A5;
	Thu, 12 Jun 2025 10:27:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FE031BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 10:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3434C80E74
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 10:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrngCBqVppm9 for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 10:27:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E231F813B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E231F813B7
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E231F813B7
 for <buildroot@busybox.net>; Thu, 12 Jun 2025 10:27:01 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a53ee6fcd5so487859f8f.1
 for <buildroot@busybox.net>; Thu, 12 Jun 2025 03:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749724020; x=1750328820;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1F9P4Lp9fxgiK1uJaF8F7mXaoOih8ozNT1i9HbB7Uec=;
 b=orhchqYrp2ykCTPzZPbbNXh7x5Ob+TJjUIeBN3x5uy4zhvI6oj/gjqTzLDQkcM914B
 oAAURSzOlijizubnB25M6Z0RNEASVat7OB4VFDTOe+E4VkI08tOV2rcWym4B/3a9v34T
 fjuZHg8y3xoWwM/Cl4oDvbmUddbN/SyjFbVSkK5GS75+bkLBn7MihrPd5PgR1g/dU40R
 1BiLHgTdOPDlHZRVIYPgLXBf7mXN3WJelRvRrwpB9DcXCkBS1dzshHJP5eDzqatd7MRR
 rZiT1whAk4W9v8J0GfdYHX+dunxCQZ0Ye5hGf80bmDhFeuYPKP35W3AjRXYuDfGyXMGm
 sqzA==
X-Gm-Message-State: AOJu0YzdYrDNSnbYSFD3z78x2YGl7FGF4sl4SDeEmZy8Bd3HGdhp14Hs
 raKNF5a3Bo48prUXtuHcey/LGUTuXvc7+DnjjbWc0NVgW468u69mcJXxXNnYa6YvLA6VIJRh6e/
 a7w0xpg==
X-Gm-Gg: ASbGncsCvEb+qYljd7WMZd4i8Z6Bnw7sL14toJz/8pAgUG9M5gtEPdy2JhcmCQeyn2o
 1e1Dn7Z41HW+FGYvVmqXT6rdk2ACZWSWQFeLEJholW3gTRtmuI5avdK0irlNXyCe8NDC1jDHBSi
 tfHWaybprB939dA2eahcY/L5L3OT9w/kogv1ScdDiT4Ldokvhp+QGJcqa0i4Ik1PjYLhwW/g0Qv
 u+aF09DyLBG+NvSWOo3XXHhwaUM/Klj6sN8gZ3Rgud/wF/eL7lh64Drvb8fh1VZlzXjPczRyqcK
 z1RDjV9C0L4r06/dQp9d8PXxy/lpjeAyNnFg74xEFsRMEObeKAVmK9huW3nZ7C8b0gPumkVqAu0
 sI4R08eGJNT6nTs/PSYJd
X-Google-Smtp-Source: AGHT+IHlohqjzmPrjaJxY4hQI/BvMAqCF4Ec8osbR+S+uNetxI05VU4OVtcy2D+Nikf3OehX0xy3Yw==
X-Received: by 2002:a05:6000:420c:b0:3a5:14e1:d9ec with SMTP id
 ffacd0b85a97d-3a56075d5f8mr2076463f8f.51.1749724019475; 
 Thu, 12 Jun 2025 03:26:59 -0700 (PDT)
Received: from vm-2404.. (52.186.66.37.rev.sfr.net. [37.66.186.52])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5619767d7sm1585700f8f.10.2025.06.12.03.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 03:26:59 -0700 (PDT)
To: buildroot@busybox.net
Date: Thu, 12 Jun 2025 12:26:54 +0200
Message-ID: <20250612102655.1268053-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1749724020; x=1750328820; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1F9P4Lp9fxgiK1uJaF8F7mXaoOih8ozNT1i9HbB7Uec=;
 b=h0INI/Y+sIsFF0NzDKBp5s0lTveE25axWjxixTb59V3P27OOdAshR490fy7gMgNgjw
 Tebu8ylzpa/pYUR58DIii2PAA1M9XpJ7MUzZV1CzApbX3ourgL9GBh0Igmzy2WzsWeMF
 tYRpKkald+5RRwBB2GoxyacBxtG7UcK76g+43NM9DZgqcPb0+LChvUzWYIIEDW33Si5v
 ivZ0NoNcoHHF79miQKCLODVHS6GFQGwqW/tfawQobtM5Y/raDJCJ0k0KbkCaAzEDGfqc
 pBfQNeNniEgqrLMuC1YksB840XDfcp7qIN0jbm/qLi115cWkeYRHI1+zAp85G7FpsWur
 gznQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=h0INI/Y+
Subject: [Buildroot] [PATCH] package/lua: bump to version 5.4.8
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/5.4.7/lua.hash                                  | 5 -----
 package/lua/{5.4.7 => 5.4.8}/0001-root-path.patch           | 0
 package/lua/{5.4.7 => 5.4.8}/0002-shared-libs-for-lua.patch | 0
 package/lua/{5.4.7 => 5.4.8}/0003-linenoise.patch           | 0
 package/lua/5.4.8/lua.hash                                  | 5 +++++
 package/lua/lua.mk                                          | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 package/lua/5.4.7/lua.hash
 rename package/lua/{5.4.7 => 5.4.8}/0001-root-path.patch (100%)
 rename package/lua/{5.4.7 => 5.4.8}/0002-shared-libs-for-lua.patch (100%)
 rename package/lua/{5.4.7 => 5.4.8}/0003-linenoise.patch (100%)
 create mode 100644 package/lua/5.4.8/lua.hash

diff --git a/package/lua/5.4.7/lua.hash b/package/lua/5.4.7/lua.hash
deleted file mode 100644
index d67fdcf6c..000000000
--- a/package/lua/5.4.7/lua.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Hashes from: https://www.lua.org/ftp/
-sha256  9fbf5e28ef86c69858f6d3d34eccc32e911c1a28b4120ff3e84aaa70cfbf1e30  lua-5.4.7.tar.gz
-
-# Locally computed
-sha256  33a975a766520bc54de2d71e45442e504effa0519e331e31ee3fc46eca4f98bd  doc/readme.html
diff --git a/package/lua/5.4.7/0001-root-path.patch b/package/lua/5.4.8/0001-root-path.patch
similarity index 100%
rename from package/lua/5.4.7/0001-root-path.patch
rename to package/lua/5.4.8/0001-root-path.patch
diff --git a/package/lua/5.4.7/0002-shared-libs-for-lua.patch b/package/lua/5.4.8/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.4.7/0002-shared-libs-for-lua.patch
rename to package/lua/5.4.8/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.4.7/0003-linenoise.patch b/package/lua/5.4.8/0003-linenoise.patch
similarity index 100%
rename from package/lua/5.4.7/0003-linenoise.patch
rename to package/lua/5.4.8/0003-linenoise.patch
diff --git a/package/lua/5.4.8/lua.hash b/package/lua/5.4.8/lua.hash
new file mode 100644
index 000000000..849451152
--- /dev/null
+++ b/package/lua/5.4.8/lua.hash
@@ -0,0 +1,5 @@
+# Hashes from: https://www.lua.org/ftp/
+sha256  4f18ddae154e793e46eeab727c59ef1c0c0c2b744e7b94219710d76f530629ae  lua-5.4.8.tar.gz
+
+# Locally computed
+sha256  3773a4900f3539c56aea9d6cd48d71c8751d495c4abc28472706bb9553d1493c  doc/readme.html
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 15772dbdf..455b7e58b 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_LUA_5_4),y)
-LUA_VERSION = 5.4.7
+LUA_VERSION = 5.4.8
 else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_VERSION = 5.3.6
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
