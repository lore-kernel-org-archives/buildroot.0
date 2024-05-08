Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0ECC04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 08:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 989BA8230D;
	Wed,  8 May 2024 08:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMwsv_bSoih5; Wed,  8 May 2024 08:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 277188230E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 277188230E;
	Wed,  8 May 2024 08:20:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8821F1BF408
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 08:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73501407D3
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 08:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id npSJ-J0hSiCm for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 08:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD345401E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD345401E1
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD345401E1
 for <buildroot@buildroot.org>; Wed,  8 May 2024 08:20:01 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41c1b75ca31so29519545e9.2
 for <buildroot@buildroot.org>; Wed, 08 May 2024 01:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715156399; x=1715761199;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JiRiGOjbXw7+zD8LifqwzbZS0+kKWdy6X3xp9ew1/9g=;
 b=SByGDK00uqwMgE70T9q4bYKNCPwjV5Qw72RiskpnjVcF7gnVF3zqD31mfz8vHUnfmA
 3QFOkiAA0Zajf8Zlz6uZ2vG6V62nXWNPP2OiBpYcndAtae6ZauNnE/wPyKl236MzN2ez
 lDGb4yqV6lIY4OOOogoTpsoo2/ax2rHj8OvHX50tJmLfDWxe0lrVokDZVIgNZ+Lp09yJ
 tfuN9NKL/r3jDL9am2BePPwkOlSx6XqNLkauTpMECgJKzZNILWKaV+oL+0hqbopgSBQx
 AXPN0hvnRildRLitXVRKIFcC0BxhqGCMd7z4AAMh/YhPCWgPMor7Ys8pjipDzr6j0HlR
 fKBA==
X-Gm-Message-State: AOJu0YxCKJYDpXXBKVbjWoLNP+sQ/ID3HzwIub+Ic7Uu8zbiaMQvFfzh
 zk77JCVcSuu0PEv0XkoZ+mSpJbIAXwfjd3gJUjGlDWF38Y0CnI2r9bEK/Q==
X-Google-Smtp-Source: AGHT+IH9MMaFuZ1J19KxlVZRE8GJpVCM5RUHEYmOgqlg/ctVEGgg5FBaajB1FmaUs3rr/HigPGxRXA==
X-Received: by 2002:a05:600c:198d:b0:41a:6229:396b with SMTP id
 5b1f17b1804b1-41f71cd12b6mr17673565e9.10.1715156399030; 
 Wed, 08 May 2024 01:19:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c314c00b0041be9cb540esm1398859wmo.18.2024.05.08.01.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 01:19:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 May 2024 10:19:52 +0200
Message-ID: <20240508081952.98506-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715156399; x=1715761199; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JiRiGOjbXw7+zD8LifqwzbZS0+kKWdy6X3xp9ew1/9g=;
 b=kzj0F1SkqWrJ/zVhDx3nBvkA5wJEXc38j/Xkpq0NV5nzfT1jqJcaJ0d8cdSbx/jQwF
 5PlRmO8epQOV0Y9lyVqP26FWa0FCGxZXKg4up5gLIoJdFomTjtLlDdkhikanHrA7SPF6
 TXp+S+lTsCsc31vfNGsfK7pKtAPRPvxLRtzLGcSYX2g6GvLd5RAcwbl1KpcFkzkZnTpb
 Q10AqszuBppfVagpHj/1MaC69GHIVh+X3UvIj7IUJNCV4UfZrsEJKOQ6YYtYm23t2rfJ
 f9/sK2F7w7Ch0nQ+4sxADFwBsAS66ax1HRAcsOADU3KmaXO5ewPskun6D8mUS51HSvE/
 LK4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kzj0F1Sk
Subject: [Buildroot] [PATCH 1/1] package/sdbus-cpp: fix host build
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
Cc: Sergey Bobrenok <bobrofon@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cmake options were renamed by
https://github.com/Kistler-Group/sdbus-cpp/commit/0074c79e7fd7983dda3c2a4e4ac7febe67751a28
resulting in the following host build failure since bump to version
2.0.0 in commit 0f5bb364c629dd7fc91f4295f872e46d89c0feef:

/home/buildroot/autobuild/run/instance-1/output-1/build/host-sdbus-cpp-2.0.0/src/Proxy.cpp: In member function 'virtual sdbus::PendingAsyncCall sdbus::internal::Proxy::callMethodAsync(const sdbus::MethodCall&, sdbus::async_reply_handler, uint64_t)':
/home/buildroot/autobuild/run/instance-1/output-1/build/host-sdbus-cpp-2.0.0/src/Proxy.cpp:125:91: sorry, unimplemented: non-trivial designated initializers not supported
                                                                       , .floating = false });
                                                                                           ^
/home/buildroot/autobuild/run/instance-1/output-1/build/host-sdbus-cpp-2.0.0/src/Proxy.cpp:133:60: error: class template argument deduction failed:
     auto asyncCallInfoWeakPtr = std::weak_ptr{asyncCallInfo};
                                                            ^

Fixes: 0f5bb364c629dd7fc91f4295f872e46d89c0feef
 - http://autobuild.buildroot.org/results/66668261d05203575658a243e02e78cf77018d8c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sdbus-cpp/sdbus-cpp.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index 675ed1fa1f..2994f079c9 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -14,10 +14,10 @@ SDBUS_CPP_LICENSE_FILES = COPYING COPYING-LGPL-Exception
 # Host build for sdbus-c++-xml2cpp
 HOST_SDBUS_CPP_DEPENDENCIES = host-pkgconf host-systemd
 HOST_SDBUS_CPP_CONF_OPTS = \
-	-DBUILD_CODE_GEN=ON \
-	-DBUILD_DOC=OFF \
-	-DBUILD_TESTS=OFF \
-	-DBUILD_LIBSYSTEMD=OFF
+	-DSDBUSCPP_BUILD_CODEGEN=ON \
+	-DSDBUSCPP_BUILD_DOCS=OFF \
+	-DSDBUSCPP_BUILD_TESTS=OFF \
+	-DSDBUSCPP_BUILD_LIBSYSTEMD=OFF
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
