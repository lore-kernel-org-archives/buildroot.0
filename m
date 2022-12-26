Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5117AC4332F
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 07:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A42A24035A;
	Mon, 26 Dec 2022 07:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A42A24035A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vd9fvDfTyeuT; Mon, 26 Dec 2022 07:48:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6AE640348;
	Mon, 26 Dec 2022 07:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6AE640348
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F9361BF228
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 07:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A429812B5
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 07:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A429812B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Edow9AOK5XMJ for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 07:47:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8E2E812B4
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8E2E812B4
 for <buildroot@busybox.net>; Mon, 26 Dec 2022 07:47:58 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so4558159wms.0
 for <buildroot@busybox.net>; Sun, 25 Dec 2022 23:47:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dXuiCNVaCxFocpVMxnKQzPxKgksVkgkG8/sWOdmb7QM=;
 b=k+j4lPxySsvw2/r0E/oHFJQ4F8UtEv5ZPodcWcnYfmaazARUTYkMQTYy2XK5Kc5r6o
 tpMsY6DG54oybJgJU7+IuR7JWeVtkEPT6hBJdDeliwxsYptjtl1nS4SAg3O+jDANPyp9
 ZYlGNBA4URpp/DIzhoCA/cEIgR8TO/HMyea0rP1ByENOKSu7rLEmLlewQXN1I8rlW/Hc
 fNWRCEG1XpX4hWQqdb0HewFVLQjoBkdmOcnQil2eMQZhR69F9Gqc+Ks3L82v4zDqugtU
 D0VSxUfcI3hlqz+4xEcxWqFl/Ymqp9OJT4/RdgJ+dMkk2HBIoPgPuMQEKP86XcyZnMJ7
 FH2w==
X-Gm-Message-State: AFqh2kppUdnOHxoxUAoyQ9AsMPdBKXnKxCBxEQbs7TZX3vEutCj8O9T5
 tHXEUgydAJffTLMgba0oWc+sdvxK0Jc=
X-Google-Smtp-Source: AMrXdXvnCUsBKNawf2tNtyrT6lcER/hiaE4TdwurB7vfDi28YT4VZ6TP9yzVEL9lDQ+prQ1MPy382A==
X-Received: by 2002:a05:600c:3b91:b0:3d1:e710:98ec with SMTP id
 n17-20020a05600c3b9100b003d1e71098ecmr14761245wms.21.1672040876915; 
 Sun, 25 Dec 2022 23:47:56 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 j30-20020a05600c1c1e00b003c71358a42dsm23251813wms.18.2022.12.25.23.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Dec 2022 23:47:56 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 26 Dec 2022 08:47:48 +0100
Message-Id: <20221226074749.143619-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dXuiCNVaCxFocpVMxnKQzPxKgksVkgkG8/sWOdmb7QM=;
 b=NHLAwKIuG1XRj94zkq2dPJYZyWH4x/Rs+u+nL2Mbvh72xydoSwIzGrXukRAj4kcftO
 lZMPLoESJmzXxEph2jJTB3DMrya4c21m5Ct0B9TjlHqqA3aGRsLJCKwk6pKgxTsMZ+LI
 TP0k6wrDygWNpHtn4ELPxpxMnyXQ3PEE84zgkSWvPVzvZHVSW+x+Aiufefkwpp22nAgE
 EqI+pCup873HpN1tCMM7vbqXVf6W9WC+BgEAnFzkQZJRbyBNL1yhr55HP+XlaEqu1HFm
 IwI8aNVcKQt3B3iQd/40nyk0nRTCtCofGFSJM5ZXDc3Qi+gk148K7Jgqi4fOBaJ2AlME
 C5Sw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NHLAwKIu
Subject: [Buildroot] [PATCH] package/lua-cjson: bump to version 2.1.0.10
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-cjson/Config.in      | 2 +-
 package/lua-cjson/lua-cjson.hash | 2 +-
 package/lua-cjson/lua-cjson.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-cjson/Config.in b/package/lua-cjson/Config.in
index 9474b3176..1c153fa46 100644
--- a/package/lua-cjson/Config.in
+++ b/package/lua-cjson/Config.in
@@ -12,4 +12,4 @@ config BR2_PACKAGE_LUA_CJSON
 
 	  (C-module)
 
-	  http://www.kyne.com.au/~mark/software/lua-cjson.php
+	  https://www.kyne.com.au/~mark/software/lua-cjson.php
diff --git a/package/lua-cjson/lua-cjson.hash b/package/lua-cjson/lua-cjson.hash
index b052c5199..5ddc07bcc 100644
--- a/package/lua-cjson/lua-cjson.hash
+++ b/package/lua-cjson/lua-cjson.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  455fa7d07d8ac9d61f68f538958f8e28972256f38b0a1c2740873daf809d1837  lua-cjson-2.1.0.6-1.src.rock
+sha256  02dea368d07753647c75bd9e6660dd4d06ff7d09956d90d5afc4c3f5b78ed187  lua-cjson-2.1.0.10-1.src.rock
 sha256  9576e82ef5013fbe80b3bd446a7d9ddd47328baa2186c31d3d885e2a9a8cd31e  lua-cjson/LICENSE
diff --git a/package/lua-cjson/lua-cjson.mk b/package/lua-cjson/lua-cjson.mk
index e029dab5c..e08d23006 100644
--- a/package/lua-cjson/lua-cjson.mk
+++ b/package/lua-cjson/lua-cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CJSON_VERSION = 2.1.0.6-1
+LUA_CJSON_VERSION = 2.1.0.10-1
 LUA_CJSON_SUBDIR = lua-cjson
 LUA_CJSON_LICENSE = MIT
 LUA_CJSON_LICENSE_FILES = $(LUA_CJSON_SUBDIR)/LICENSE
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
