Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306EBC48BF6
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 21:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDE2C4044B;
	Sat, 24 Feb 2024 21:46:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w88vbcjr4aDB; Sat, 24 Feb 2024 21:46:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81CF5404B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81CF5404B1;
	Sat, 24 Feb 2024 21:46:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 713B51BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 21:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B1454044B
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 21:46:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZcZ6K94grvFw for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 21:46:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF31B40242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF31B40242
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF31B40242
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 21:46:09 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-412a17ab652so1001455e9.2
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 13:46:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708811167; x=1709415967;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6YcTHY4+d8SD41RldqTaLPXX0OKGzIWIzbzH655ajIs=;
 b=RrCVFl06qwoZm3EyqwqumU814XdyPx6+v9/y9cKYrBxGbfo5i9LS5BHgFKH/B1BpTQ
 C1czWCtrAYbgjAtjjjwAeq/Gj7m12bM8K6Oj2coAfEsd8hvQ63pseKazebPjmREOf6xs
 Qkfx1B6cNha5WYFHYSYP2JARESwHokiczulTsxrGHKAkHw9hHpU9btdaJT+lUKcM3Ves
 QZEiP6w6iXg3Cu6h19bQoipj1ILafxargtFzmZ/V4WkUNa0+PyvftVq2FPgkBYJJdD7J
 7JoPEW13PtzMnq7c10vaRfcp/ebladYTCqPyET7+9FHE5P8aSeYYuveVFJ75kPqDbzwD
 /JUw==
X-Gm-Message-State: AOJu0YzYJECXocPjfuOFMA4mzn/4gA6ADe/09B8JeTZ+d8uVEovL4Vbh
 /Erdg4zQ8kiHb0JOY7QFdZgGmb3vGL9M+6jgfQr2cY5x5L9rNAaSjFJJvx2u
X-Google-Smtp-Source: AGHT+IGg+qjw6FYc8QHQzrsiQfT3KtLd48oTZ1hw+n+6rHlbLAfh8r9Xz3R57PiTOWycY+/e8dnqBA==
X-Received: by 2002:a05:600c:1989:b0:412:9c29:e6b3 with SMTP id
 t9-20020a05600c198900b004129c29e6b3mr1850533wmq.12.1708811166909; 
 Sat, 24 Feb 2024 13:46:06 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 w21-20020a05600c015500b004128da16dddsm6915191wmm.15.2024.02.24.13.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Feb 2024 13:46:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 22:46:01 +0100
Message-ID: <20240224214601.680607-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708811167; x=1709415967; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6YcTHY4+d8SD41RldqTaLPXX0OKGzIWIzbzH655ajIs=;
 b=EAQt2Z/ca17hizFSoUufvOtU+dq1+0HcYmTi7kBVubxGLsNYS7hR/a/Qmbkp/1gdbi
 oSErvsm1IhpardUInw1hP7jbBRZ/urHWmw7J7X74dlXDtbcOZ7nxWZ2OiPvH+wxqiSsx
 ZddSPF2Y0C1M8hKFRXKjZdyeQQPRgVpx9vGY5JPHxiSmvmLEf58c/si90ckCyrtBYrTm
 vHMv4TjYnbZNZlbn7gXiYxhnn+rWNMH2FOWfAU3th5P/7wUu0iwRSn5zq+sQ0dN179oC
 1HhneEAILWlSSrYiBHXw+L7G/wrYtcNNTFL1Jcn/+Ucud5h4bm83QEvD+GqJehAhqDtT
 LnRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EAQt2Z/c
Subject: [Buildroot] [PATCH 1/1] package/redis-plus-plus: needs threads
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
Cc: Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

redis-plus-plus unconditonally uses mutex and so needs threads since its
addition in commit c46df9de21e718a9ed6a2df2bb945c386695d3bf and
https://github.com/sewenew/redis-plus-plus/commit/1fa8f6bbfb24c8f328aa23ee1dd3c3f99c1b4caf:

In file included from /home/autobuild/autobuild/instance-5/output-1/build/redis-plus-plus-1.3.10/src/sw/redis++/connection_pool.h:27,
                 from /home/autobuild/autobuild/instance-5/output-1/build/redis-plus-plus-1.3.10/src/sw/redis++/connection_pool.cpp:17:
/home/autobuild/autobuild/instance-5/output-1/build/redis-plus-plus-1.3.10/src/sw/redis++/sentinel.h:95:10: error: 'mutex' in namespace 'std' does not name a type
   95 |     std::mutex _mutex;
      |          ^~~~~

Fixes: c46df9de21e718a9ed6a2df2bb945c386695d3bf
 - http://autobuild.buildroot.org/results/cc4c54134e8a522b4c028aab4266f47cf862e2a9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/redis-plus-plus/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/redis-plus-plus/Config.in b/package/redis-plus-plus/Config.in
index 6a21aee2b3..64a84102d4 100644
--- a/package/redis-plus-plus/Config.in
+++ b/package/redis-plus-plus/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_REDIS_PLUS_PLUS
 	bool "redis-plus-plus"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_HIREDIS
 	help
 	  Redis client written in C++
@@ -11,5 +12,5 @@ config BR2_PACKAGE_REDIS_PLUS_PLUS
 
 	  https://github.com/sewenew/redis-plus-plus
 
-comment "redis-plus-plus needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "redis-plus-plus needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
