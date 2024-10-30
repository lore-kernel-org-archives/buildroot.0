Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56989D3A667
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 08:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04440405F2;
	Wed, 30 Oct 2024 08:58:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tAaQptHjFag1; Wed, 30 Oct 2024 08:58:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C05AC402CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C05AC402CE;
	Wed, 30 Oct 2024 08:58:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C6ED5E51
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 08:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 547EE80DB0
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 08:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Scml18tIly3s for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 08:58:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF1A3810D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF1A3810D3
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF1A3810D3
 for <buildroot@busybox.net>; Wed, 30 Oct 2024 08:58:37 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37d4ac91d97so5209358f8f.2
 for <buildroot@busybox.net>; Wed, 30 Oct 2024 01:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730278715; x=1730883515;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oU3My8usyT+lsniH9z/x6UfQtB2Nibup2h6BpXg0UdM=;
 b=ksFVub6uaF1rdaNNbzTTj3u9Gl/YyWe7qC6syWO5rH3KYvOkHSit1Alwjmv5j6bEzE
 Z4tLA1yAq6j8qzhjmVMH608nXfJaFkfpbPwRpo/XPALBWFXKOEVzt3qx2BTRDTX9WX7p
 mE/glzutcooz2KT8eliK+TbeCJdDelqcQGCAHosK8Og7lxUM4oXY0mqQhkKsiUEQ5bBl
 exMbRAGlyOs50IR7gqv9hz9/0+8hcWzOaCeQX3OtktY1AsTdbm3JW5BYUaKQcYJnj/2C
 Vj+Mk/yu5aMPCbyQp0NZUmq3LpeLSFJGR/zs4GEpY5rvz4HCVY9g1aEAFHvPF5tiho5b
 5cZg==
X-Gm-Message-State: AOJu0YzO3mQ5xrcUnIbiyQwWVAniRZiU+1f95eXyoLmY/atzIfN/dpth
 PqEm28mgRUmg2KobiX0+9GsNsiBzVe3XDXUaV1dyAXxj9irvbSYDaxlbyrbkuIEZ7cfVgfMN4Xs
 vvA==
X-Google-Smtp-Source: AGHT+IFKTsbdENlOpOoulsVmOkN8Ok4SPo/sR3kE0FLDsbGizAkb7x8R6qe2iXUSLDOIfHW7s/1cLQ==
X-Received: by 2002:a5d:4845:0:b0:37d:511b:aec1 with SMTP id
 ffacd0b85a97d-38061228300mr14104585f8f.45.1730278715148; 
 Wed, 30 Oct 2024 01:58:35 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bb4csm14750383f8f.33.2024.10.30.01.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 01:58:34 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 30 Oct 2024 09:58:29 +0100
Message-ID: <20241030085829.912588-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1730278715; x=1730883515; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oU3My8usyT+lsniH9z/x6UfQtB2Nibup2h6BpXg0UdM=;
 b=HRNTi2ehimdMFYfjCoDFDl07XM+5nmK1PL/KDgalyIyj1i5AfCTJ9Bykq05401AwmQ
 ETPVYQ0d90gvs1IkoAr/MmEqzkfy7kNEBABbwH3RUtoUL74nQnce/qWWjjY4S99QBlu9
 JA2RhhNHjEZvKuEg10AYDdz5sk4tXW7NTQ4CsgM2L5GDCYXza9D4+aCPsIVeR3Xt+XHS
 gzgzIriLRmH4O8GuJjiEpRaQu3j2WZHhopUpvGlJCyfFCeQMhfGkgJseKCtd/tK94j9L
 lGSQP3jF5ZsBAgB4qLAVIsPWs0Q2S42jplGu+NUwz66RcqEwFfCr+qjTzcDmjnWei4N4
 N2jA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=HRNTi2eh
Subject: [Buildroot] [PATCH] package/lua-livr: bump to version 0.5.0
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-livr/Config.in     | 1 +
 package/lua-livr/lua-livr.hash | 4 ++--
 package/lua-livr/lua-livr.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/lua-livr/Config.in b/package/lua-livr/Config.in
index 76fd1c754..ac749025a 100644
--- a/package/lua-livr/Config.in
+++ b/package/lua-livr/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LUA_LIVR
 	bool "lua-livr"
+	select BR2_PACKAGE_LUA_COMPAT53 if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # runtime
 	help
 	  Lightweight validator supporting Language Independent
 	  Validation Rules Specification (LIVR).
diff --git a/package/lua-livr/lua-livr.hash b/package/lua-livr/lua-livr.hash
index 50e4d3c6a..1df127306 100644
--- a/package/lua-livr/lua-livr.hash
+++ b/package/lua-livr/lua-livr.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  7f00fc561c5913bb53a21ec21f060118d9795c65a0d7a37903e311bdedcfff2a  lua-livr-0.4.0-1.src.rock
-sha256  6840bae0e48c559cc6aa765d7744d920f8a05f608c4d1223fde8e6b8e7c48c5d  lua-LIVR-0.4.0/COPYRIGHT
+sha256  4e0f5fd78c05893d8d6312bd067e9e6d6492ff363719f2da574ab0726fd76e86  lua-livr-0.5.0-1.src.rock
+sha256  6840bae0e48c559cc6aa765d7744d920f8a05f608c4d1223fde8e6b8e7c48c5d  lua-LIVR-0.5.0/COPYRIGHT
diff --git a/package/lua-livr/lua-livr.mk b/package/lua-livr/lua-livr.mk
index 56600c80b..28a9d418c 100644
--- a/package/lua-livr/lua-livr.mk
+++ b/package/lua-livr/lua-livr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LIVR_VERSION = 0.4.0-1
+LUA_LIVR_VERSION = 0.5.0-1
 LUA_LIVR_NAME_UPSTREAM = lua-LIVR
 LUA_LIVR_LICENSE = MIT
 LUA_LIVR_LICENSE_FILES = $(LUA_LIVR_SUBDIR)/COPYRIGHT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
