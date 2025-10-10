Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985ABCCD185
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 14:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51DB6413F2;
	Fri, 10 Oct 2025 14:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FrCvC7iMgmv4; Fri, 10 Oct 2025 14:13:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77D7D413E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77D7D413E9;
	Fri, 10 Oct 2025 14:13:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E055C226
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 14:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D43E4844F3
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 14:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A9g2GRy9cgdj for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 14:13:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 342CB844F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 342CB844F0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 342CB844F0
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 14:13:17 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e5980471eso11722465e9.2
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 07:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760105595; x=1760710395;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ljNz9TRpRQUbLbROKUIVrOL1rLdHWO06uNDpvh8RYmc=;
 b=ILVqklPMAwKCcw3KBc2sDXgcqo0DRTAdzbQWzqoG2Wo4O+GscG14HtKBlL8DOIczro
 RQbDIsmy4HX1f6aBq/yRnofY3HtOzaK5k/Y4wy3nBLYIIr29QgXwO1vDtXzN+KuYj8fX
 UYt3OIZl5ockM39A2F86Po8r4UAlW+eJDsNaZHgNlitLHB3gkTnRzHJkefwa01fhVbn6
 GOsgJscjCU7Rgzz63meDRjToBS72n7ogzPCHXEYYp4V9nEbgyXYYojq5wmeVB5YwCMcp
 S3qX8CmHBqHJpQZZbzYKGH6g6vpERvDv7XvZFwEybOgKPpDxJIDFyvNHsX8U19bXyMJY
 k6mQ==
X-Gm-Message-State: AOJu0YwZ4qdPwgUYJDgQiDVlVFJvlt7lQT8V5bUyUnqzd5zMcXzGdjNn
 IIJAI//a6uQzNQ+41kT13MpwD7r6ggmUXCqhgQPlOx4CMwm8lUhV7O0fWdkYsYH/Jy6MBwxMh4+
 4J78e
X-Gm-Gg: ASbGncuEFPeYR+L9XSRsOTgVxsN5gyEUfIL4amS/sd7C5WG3BzAEeuWRanr5LB5wJEI
 5yKHlBJlreZAS9AJhfnFaO3rmvytM9CXrGsYcl0s5zsHBwHWBy/Wa9SL4DtwJwrYTdgUwOC7vXi
 LYv7AXvbCYB8g72TSqqDfY/zOq05O+6RGW5Hpq8Hs4bAfHawjFpzElsMcMI1ho6SOEw68oqfwfw
 H48r8hZz9dmg+bfXKw2q1sYkU41Qh0zzpPs2l8KSyQTJaNYQ8+eEJq5ohvv40KKXMvASXQTSpZw
 GKFeqI15CmiR4V4lr3P6AQErkfvN+VxngU8xNnaNzXOBEZR+SNDjw5u4VmT3krcRlppP9pDQowl
 PaIL74avMfJJkgmHtlw5jhaJK9E1g4dX/w5iMNpm1hTJTJp37fMz3ZdUwvolAgS0iWw==
X-Google-Smtp-Source: AGHT+IEYHtc29PQGURHpxJmOBGqA0mFBCSO04lSE1Rf7QAG6HT+sQwMewvpQAgfoMVNWPGoTYknMzQ==
X-Received: by 2002:a05:600d:8221:b0:46f:aa02:98b2 with SMTP id
 5b1f17b1804b1-46faa02ed74mr62212185e9.19.1760105595311; 
 Fri, 10 Oct 2025 07:13:15 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb483bcf9sm49578895e9.6.2025.10.10.07.13.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 07:13:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 10 Oct 2025 16:12:59 +0200
Message-ID: <20251010141259.229097-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760105595; x=1760710395; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=ljNz9TRpRQUbLbROKUIVrOL1rLdHWO06uNDpvh8RYmc=;
 b=JL9WzlQ1vXpyrGyV48eWyFJBOLcMLONbUQvpCgYM50FgFWqBLkXMvPKh1e66MHUTiG
 lNqnlR6b+KzHuwfNrczOzJZsJ1Hiwlx4L6UPkY7EfNVhRcR5AyLPVN+1/2RKDXW5hv7g
 YhJ2c0lcSSTsoo0EI4YqgiX9jfNLkPU02NWNkPzh0eLP/clRktABt7XMQ4M3YzLgkEZp
 KCiGzknQ+AEv8vYsg7IiSCToba0w8Dh9yXjoHs/TB9ACw1SunnbaAqkfBGUL/vgKuYFp
 o9haLSegspf9R/IppUvfcxlDGZt+bghpHgLc9+JsuGYoLaNiYksmYmxgI+JLY+TD4TvB
 11Bg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JL9WzlQ1
Subject: [Buildroot] [PATCH] package/yajl: fix build with cmake 4
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .../yajl/0005-Allow-build-with-cmake4.patch   | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/yajl/0005-Allow-build-with-cmake4.patch

diff --git a/package/yajl/0005-Allow-build-with-cmake4.patch b/package/yajl/0005-Allow-build-with-cmake4.patch
new file mode 100644
index 0000000000..8383e4806b
--- /dev/null
+++ b/package/yajl/0005-Allow-build-with-cmake4.patch
@@ -0,0 +1,70 @@
+From 6fe59ca50dfd65bdb3d1c87a27245b2dd1a072f9 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Fri, 28 Mar 2025 09:31:40 +0000
+Subject: [PATCH] Allow build with CMake 4.0.0
+
+fixes deprecated cmake option and uses cmake 2.8.0 TARGET_FILE
+update cmake supported minimum versions to 2.8.0...3.10
+
+ref:
+- https://cmake.org/cmake/help/latest/policy/CMP0026.html
+
+CMake Error at .../CMakeLists.txt: (GET_TARGET_PROPERTY):
+  The LOCATION property may not be read from target "json_...".  Use the
+  target name directly with add_custom_command, or use the generator
+  expression $<TARGET_FILE>, as appropriate.
+
+Upstream: https://github.com/lloyd/yajl/pull/256
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+[Titouan: fix merge conflict with 0003-Link-with-shared-libyajl-in-a-shared-build]
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ CMakeLists.txt             | 2 +-
+ reformatter/CMakeLists.txt | 4 +---
+ verify/CMakeLists.txt      | 4 +---
+ 3 files changed, 3 insertions(+), 7 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4c0a9be..e7031c8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -12,7 +12,7 @@
+ # ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+ # OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ 
+-CMAKE_MINIMUM_REQUIRED(VERSION 2.6)
++CMAKE_MINIMUM_REQUIRED(VERSION 2.8.0...3.10)
+ 
+ PROJECT(YetAnotherJSONParser C)
+ 
+diff --git a/reformatter/CMakeLists.txt b/reformatter/CMakeLists.txt
+index 7629094..5e7d3f1 100644
+--- a/reformatter/CMakeLists.txt
++++ b/reformatter/CMakeLists.txt
+@@ -39,9 +39,7 @@ IF (NOT WIN32)
+ ENDIF (NOT WIN32)
+ 
+ # copy the binary into the output directory
+-GET_TARGET_PROPERTY(binPath json_reformat LOCATION)
+-
+ ADD_CUSTOM_COMMAND(TARGET json_reformat POST_BUILD
+-    COMMAND ${CMAKE_COMMAND} -E copy_if_different ${binPath} ${binDir})
++    COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:json_reformat> ${binDir})
+ 
+ INSTALL(TARGETS json_reformat RUNTIME DESTINATION bin)
+diff --git a/verify/CMakeLists.txt b/verify/CMakeLists.txt
+index 06cb2dc..63c7e09 100644
+--- a/verify/CMakeLists.txt
++++ b/verify/CMakeLists.txt
+@@ -33,9 +33,7 @@ ELSE()
+ ENDIF()
+ 
+ # copy in the binary
+-GET_TARGET_PROPERTY(binPath json_verify LOCATION)
+-
+ ADD_CUSTOM_COMMAND(TARGET json_verify POST_BUILD
+-    COMMAND ${CMAKE_COMMAND} -E copy_if_different ${binPath} ${binDir})
++    COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:json_verify> ${binDir})
+ 
+ INSTALL(TARGETS json_verify RUNTIME DESTINATION bin)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
