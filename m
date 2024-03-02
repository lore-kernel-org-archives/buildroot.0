Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0603C54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 08:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B012607FF;
	Sat,  2 Mar 2024 08:56:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GazPWQo1_UlP; Sat,  2 Mar 2024 08:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8517C60816
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8517C60816;
	Sat,  2 Mar 2024 08:56:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4AFC51BF2AA
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 08:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36F3360816
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 08:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AwABhsDn0Z_L for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 08:56:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 13EC3607FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13EC3607FF
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13EC3607FF
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 08:56:32 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33d90dfe73cso1563151f8f.0
 for <buildroot@buildroot.org>; Sat, 02 Mar 2024 00:56:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709369790; x=1709974590;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9oTyK/GneX3VNYT6neWh0UmCHWbkSE7wMAWcduEmI5k=;
 b=sVvkMrcg+SaXevQp1r3OpiZGc/oAlLwh6jLXx9Z6khKFUSWJJ8JQqdHf7iiUQXhItZ
 prRiw5f07rNskVZ7cUtMvv4YFSZv+eAEz46TGeWZuhVo14dPDq8lGaMqlHU+nYtUmB5g
 DF9fD79N8hm9LqQE6k36gYSgJNn2twBfkhqTgWmHInK22sFzBz99QBDFyUo7pokKjEHm
 aE/slcJSLZB/RWMG0TFKiuq7zIotZXVIZEPe2LyB9wD0uRVq6X4i4yi9dEfq4MHHQK1k
 tRSMMI9ReTvy+DaKG5kXTO12D1f1ydhNmPUCZcjonAL9Jg8L+ZMkd2iwq7jjTjCdvV58
 jHuA==
X-Gm-Message-State: AOJu0YwIJzlE0B8O4IKRECgCnE4S+Snwh73dngifpOTxUnW+gB/qzzx0
 5LWuz3v0xDySKr97RT3c2ITHPiHO5Ab3xKa1kAvergNjKxG+HBni7kHvC1s3
X-Google-Smtp-Source: AGHT+IFOcOc8fTohJsbeNxMdNY13Q2EmPSF6pA5/J35RHCwnfHFXuNvCAWt9vW0sFbwSJ/+f0e+7OA==
X-Received: by 2002:adf:a4c7:0:b0:33d:9d49:cfe2 with SMTP id
 h7-20020adfa4c7000000b0033d9d49cfe2mr4424103wrb.21.1709369789674; 
 Sat, 02 Mar 2024 00:56:29 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m6-20020a5d4a06000000b0033dbeb2eb4dsm6741798wrq.110.2024.03.02.00.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Mar 2024 00:56:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Mar 2024 09:56:26 +0100
Message-ID: <20240302085626.5772-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709369790; x=1709974590; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9oTyK/GneX3VNYT6neWh0UmCHWbkSE7wMAWcduEmI5k=;
 b=Y8iK/RMu/8QyXH3w3AKfuhNsCK/mXOK6AjMFpj4auzjY6Vl9Wi+I3Ki1AWpBdUD9T/
 BcQ7aNbolUR68Fr7r7+833vi3inBtq5bdM+FO1Dba1ZbP8toLqPh02ph27S2Nk5KItX9
 9ol/yhgIVHWm/W72hgVgRcQ/FLVWHxIzot9Nn/wk9THHqBbhzqqNTDIcEGs0UwhG2Yp1
 mDZzDkHrQ17GU2PXhqmEnKjDUl3pK8hgPedWpm8ERaCf286bzMxgtaz4MFrtvmfyYn/Z
 Lktg5/3X5Z18R1JBPgaKz+N60xews7h0nJpOgShlRp8aFTbZmgKxWa3bm3QshIOlrhkP
 JNNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y8iK/RMu
Subject: [Buildroot] [PATCH 1/1] package/spirv-tools: needs gcc >= 8
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

spirv-tools unconditionnally includes filesystem since its addition in
commit 0a01085abeb7d8a097cb68b9f7f4faec7711543c resulting in the
following build failure:

/home/buildroot/autobuild/run/instance-1/output-1/build/spirv-tools-1.3.261.1/tools/objdump/objdump.cpp:15:10: fatal error: filesystem: No such file or directory
 #include <filesystem>
          ^~~~~~~~~~~~

Fixes: 0a01085abeb7d8a097cb68b9f7f4faec7711543c
 - http://autobuild.buildroot.org/results/aaeb0ca8773842768f9311fc804bb7529d9e3bfa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/spirv-tools/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/spirv-tools/Config.in b/package/spirv-tools/Config.in
index 39fdb80b86..fa9b615c56 100644
--- a/package/spirv-tools/Config.in
+++ b/package/spirv-tools/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SPIRV_TOOLS
 	bool "spirv-tools"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
 	select BR2_PACKAGE_SPIRV_HEADERS
 	help
 	  The SPIR-V Tools project provides an API and commands for
@@ -9,6 +9,6 @@ config BR2_PACKAGE_SPIRV_TOOLS
 
 	  https://github.com/KhronosGroup/SPIRV-Tools
 
-comment "spirv-tools needs a toolchain w/ C++, gcc >= 7"
+comment "spirv-tools needs a toolchain w/ C++, gcc >= 8"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
