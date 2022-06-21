Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33EFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 22:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FAB983F90;
	Tue, 21 Jun 2022 22:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FAB983F90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AnW8Ns1AFVIP; Tue, 21 Jun 2022 22:52:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 082B383F74;
	Tue, 21 Jun 2022 22:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 082B383F74
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D54E1BF396
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 22:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0741C610E7
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 22:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0741C610E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1RP9rj92XYgK for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 22:52:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DA66610D1
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DA66610D1
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 22:52:41 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id h20so4330453ilj.13
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 15:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kO+E16P2pm3FVxqGvRb16tObKYhBUXD7yUPJwkMTyJY=;
 b=6a8Sqr1GfebhC2s/V9rpN/6q8kaShGGqdRqIibrwNlWjLwI8tsJEthN8g5X2wAL8om
 If6isXM2dGDJ3lt8Ab0rN+Mb2XHFd0nsxjJibhjQijLmeVZwwZjsfrZwjxAY3fBofknS
 3K2fbcUOhaJqDsPVNLGAmJXkkmRMnJMefqLi5iZjBaf0k81hJGNc9my9NxeN3h/dX67Z
 gvyFVU7Teh5kZYOXblZnQ8hj+iRWVLycf0SjKmbZ+3dfhxKh19lb/aMY4BeOma+X5YQk
 MZEX37iNMJll1WdCNYLFlk4QX4gf8VoYXV+P2sMuNoh0sRRpZhHvL+YtwsHCtDvDjnk7
 g+Kg==
X-Gm-Message-State: AJIora/OUj7n6iof43QFNoPVE8EacFEETD7TFR19zFfBiWmN2Lvvnev/
 A6d7SHPhUdOIa+1mLfyRk1Xn5RqFQUY=
X-Google-Smtp-Source: AGRyM1vKCZ7hJfCtuD0B1TbqqHFX74Kns+gy7aUeJ7GePQYNHrN3xnlf/fWdAtzCz2qMeqJeMDvvvg==
X-Received: by 2002:a05:6e02:144f:b0:2d1:90c9:9047 with SMTP id
 p15-20020a056e02144f00b002d190c99047mr339271ilo.211.1655851960231; 
 Tue, 21 Jun 2022 15:52:40 -0700 (PDT)
Received: from james-x399.localdomain (71-218-113-86.hlrn.qwest.net.
 [71.218.113.86]) by smtp.gmail.com with ESMTPSA id
 a18-20020a921a12000000b002d90ae7b6a3sm3770275ila.12.2022.06.21.15.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 15:52:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Jun 2022 16:52:09 -0600
Message-Id: <20220621225209.2899559-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kO+E16P2pm3FVxqGvRb16tObKYhBUXD7yUPJwkMTyJY=;
 b=achWNtqoC2H6eBPe33+i52KzYoMOwu0+wAUWbQBgOTYXQC6Chx+AQnvmBIpjNN7GQu
 Zzu5QuA2vhjsCQ2+dohU0WY9D1XAVD+4hJoRih9GlSL+OCGFsmQJih59vJ4uN+k5+nif
 HJRzcxDe83kzw2wC2z0VTWMzTrs0ll3tQTNiB14n430l0PVrbkWRe4krwqQODbXwIyjV
 ivdduoRWDDdXan+Qu/DnmYPJcYFeWQpfpzWfDdnlbK5N4OVDduyh8gOfAj4Vyf0wFPsn
 6VZ3XkRXU33Y0nniwL8o8zBaVA00cxIU0ccr3XzU380t/CwLQ6FwNb5b+R0i+VjfRSh8
 73DA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=achWNtqo
Subject: [Buildroot] [PATCH 1/1] package/spirv-llvm-translator: set CMP0077
 policy
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set this to the new behavior for consistency.

Fixes:
CMake Warning (dev) at /home/buildroot/buildroot/output/per-package/host-spirv-llvm-translator/host/lib/cmake/llvm/HandleLLVMOptions.cmake:852 (option):
  Policy CMP0077 is not set: option() honors normal variables.  Run "cmake
  --help-policy CMP0077" for policy details.  Use the cmake_policy command to
  set the policy and suppress this warning.

  For compatibility with older versions of CMake, option is clearing the
  normal variable 'LLVM_ENABLE_EH'.
Call Stack (most recent call first):
  CMakeLists.txt:53 (include)

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/spirv-llvm-translator/spirv-llvm-translator.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 22f8765582..46704b3f8d 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -10,6 +10,7 @@ SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
 HOST_SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm
 HOST_SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
+	-DCMAKE_POLICY_DEFAULT_CMP0077=NEW \
 	-DLLVM_BUILD_TOOLS=ON \
 	-DLLVM_DIR=$(HOST_DIR)/lib/cmake/llvm \
 	-DLLVM_SPIRV_BUILD_EXTERNAL=YES \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
