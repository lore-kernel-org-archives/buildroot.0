Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBFBC3ABDA
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 19:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA20F404D2;
	Wed, 14 May 2025 19:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmGgKR0jZYPp; Wed, 14 May 2025 19:51:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7D7E4050B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7D7E4050B;
	Wed, 14 May 2025 19:51:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D5A3150
 for <buildroot@buildroot.org>; Wed, 14 May 2025 19:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E2704012D
 for <buildroot@buildroot.org>; Wed, 14 May 2025 19:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A1HYZcC2apnS for <buildroot@buildroot.org>;
 Wed, 14 May 2025 19:51:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 07F54400EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07F54400EC
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07F54400EC
 for <buildroot@buildroot.org>; Wed, 14 May 2025 19:51:54 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3d91db4f0c3so914745ab.3
 for <buildroot@buildroot.org>; Wed, 14 May 2025 12:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747252314; x=1747857114;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JMdxPhJ1NExjHrI6Qrykb+WpiUUIJrwITyuPVJJfNcc=;
 b=Jov96Rvbeguga/ix2i8/nS5ZFSqtoIL9N1zjoXjJGBH1X7IlOaIOWiPAxsen5t+g0b
 c5w+6fdr/zfV48IvH5DJPBQ7GNgHXnZb4Pq6A+MFf099ed0u+lTMMFb2LBLW10zBgGi2
 Qsk6ppw+IhQeFn2v4lnfzgX72W2wCdimQshY014cgsSVTaL6pIDOZ+TeHXnfus9IcFNf
 LGCFRafDquWVqa6ytbVcIupbhuhQzqrUy4/7h42mnQAjl5MH8uSWVTaVfmnxKY9iNHOv
 yoSgsrxeXRPhUWf3heCXa0JMztJDJKUoWkzh1qUhvwt12d6NNYG8vpb/ojDJEtMkcS+R
 kPVw==
X-Gm-Message-State: AOJu0YzvKPcXg5QVXLKFtQkkMx1pjcYGekYOhaJK157T6bmGj4la6lTP
 2b+FqErg0RD1C4JsJPr9c/vbPQ3xwoactw0vltHOw09+154c/ijVYURJaQPf
X-Gm-Gg: ASbGncu8DYtaobtppqX99fIQbSmYLqXx2h2tEWA4yDtCl8Gm6Nlvu3vaEc+t0UTPKYv
 tAfWgdOr5+AVQ99lEAidfYYvmnm/wzbzz8BGQhN4viI/8aKXnWspv6xcev4BvPouq8SqU8ifICq
 ZjsD6k6x4DW7krA0NFmyM944G3+JmAQrbm11PkgZSmlEOvVAUWzbKTgnfMFr/x06MXmUVhYnrU6
 +0ZG+a8q5K0fY1IL0qGzxhxLXoKr0vop5Tbs9M1+sppc1acRKSKdSzC0SIYbX9cb3tckZYA1lGz
 /eKMpspbueYnNnMdV3TebL4Eh/Fh2wnSDjvbAGuxtMDrFh2UsLEQ6ConV+98RNddvfXSZIf3lql
 dCgMWsL7ODwzpXewD1jC1RPiIt1xLxw==
X-Google-Smtp-Source: AGHT+IGbDdYPgPVsL5g71rU7jirFOBUnvjZgaJfQjsFzJWdctMUJGEWLo6YNYAkmR8vCkLpQljf8FA==
X-Received: by 2002:a05:6e02:99:b0:3d4:6ff4:261e with SMTP id
 e9e14a558f8ab-3db6f693358mr50676345ab.0.1747252313668; 
 Wed, 14 May 2025 12:51:53 -0700 (PDT)
Received: from james-x399.localdomain (71-218-120-130.hlrn.qwest.net.
 [71.218.120.130]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4fa22658732sm2759604173.116.2025.05.14.12.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:51:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 May 2025 13:51:51 -0600
Message-Id: <20250514195151.684820-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747252314; x=1747857114; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JMdxPhJ1NExjHrI6Qrykb+WpiUUIJrwITyuPVJJfNcc=;
 b=dwndbxoZQNNLPw743gbypjKUuVCqqg5Pmgw0ZyCKy70quEuCPuJOqs6mllJ6otAsTG
 agNMGCWZeQOypopi0Jub2/6eBQntn6eOeaDXPJyikQNnBkFV3qT4NSneyaA5gjkreK77
 2URtaDLm6+c0OwSnlhcSLtEvQt1Y534LQt7gp+8dkjdPl08ZUEbjvjwF6ZQQBVqyxWXm
 jndgMJOII6VdbDyT6a7HSN9z2IzygubCDplE/V1iZizQxLGYaon4cs1fZhwXYM1rj5Ur
 8nBRZ2+E5wMZ2WPdifNKFozPJbBszBNlykzK4rRQ6FdZUVvVX1IoyM6nZ30Rz/31GX0L
 XAnQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dwndbxoZ
Subject: [Buildroot] [PATCH 1/1] package/intel-mediadriver: fix cmake 4
 compatibility
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

Add a patch fixing cmake 4 compatibility.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...ate-cmake_minimum_required-to-3.5-co.patch | 187 ++++++++++++++++++
 1 file changed, 187 insertions(+)
 create mode 100644 package/intel-mediadriver/0001-Media-Common-Update-cmake_minimum_required-to-3.5-co.patch

diff --git a/package/intel-mediadriver/0001-Media-Common-Update-cmake_minimum_required-to-3.5-co.patch b/package/intel-mediadriver/0001-Media-Common-Update-cmake_minimum_required-to-3.5-co.patch
new file mode 100644
index 0000000000..6d0d972be0
--- /dev/null
+++ b/package/intel-mediadriver/0001-Media-Common-Update-cmake_minimum_required-to-3.5-co.patch
@@ -0,0 +1,187 @@
+From c8a2c037e25498e366467860b461b8681cea5356 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Fri, 28 Mar 2025 05:06:53 +0000
+Subject: [PATCH] [Media Common] Update cmake_minimum_required to 3.5
+ consisently across CMakeLists
+
+Some of the CMakeLists.txt are already requiring CMake 3.5.
+Update remaining files to 3.5.
+This supports the compilation with cmake-4.0.0
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/intel/media-driver/pull/1919
+---
+ Tools/MediaDriverTools/GenDmyHex/CMakeLists.txt          | 2 +-
+ Tools/MediaDriverTools/GenKrnBin/CMakeLists.txt          | 2 +-
+ Tools/MediaDriverTools/KernelBinToSource/CMakeLists.txt  | 2 +-
+ Tools/MediaDriverTools/KrnToHex/CMakeLists.txt           | 2 +-
+ Tools/MediaDriverTools/KrnToHex_IGA/CMakeLists.txt       | 2 +-
+ cmrtlib/CMakeLists.txt                                   | 2 +-
+ cmrtlib/linux/CMakeLists.txt                             | 2 +-
+ media_driver/linux/ult/CMakeLists.txt                    | 2 +-
+ media_driver/linux/ult/libdrm_mock/CMakeLists.txt        | 2 +-
+ media_driver/linux/ult/ult_app/CMakeLists.txt            | 2 +-
+ media_driver/linux/ult/ult_app/googletest/CMakeLists.txt | 2 +-
+ os_release_info.cmake                                    | 2 +-
+ 12 files changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/Tools/MediaDriverTools/GenDmyHex/CMakeLists.txt b/Tools/MediaDriverTools/GenDmyHex/CMakeLists.txt
+index 2c72d282d..025b93542 100644
+--- a/Tools/MediaDriverTools/GenDmyHex/CMakeLists.txt
++++ b/Tools/MediaDriverTools/GenDmyHex/CMakeLists.txt
+@@ -18,7 +18,7 @@
+ # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
+ # OTHER DEALINGS IN THE SOFTWARE.
+ 
+-cmake_minimum_required (VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ project(IntelGenDmyHexTool) 
+ add_compile_options(-std=c++11)
+ 
+diff --git a/Tools/MediaDriverTools/GenKrnBin/CMakeLists.txt b/Tools/MediaDriverTools/GenKrnBin/CMakeLists.txt
+index cc586ba76..519ca954d 100644
+--- a/Tools/MediaDriverTools/GenKrnBin/CMakeLists.txt
++++ b/Tools/MediaDriverTools/GenKrnBin/CMakeLists.txt
+@@ -18,7 +18,7 @@
+ # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
+ # OTHER DEALINGS IN THE SOFTWARE.
+ 
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(GenKrnBin)
+ 
+diff --git a/Tools/MediaDriverTools/KernelBinToSource/CMakeLists.txt b/Tools/MediaDriverTools/KernelBinToSource/CMakeLists.txt
+index 713d08600..91eacf15d 100644
+--- a/Tools/MediaDriverTools/KernelBinToSource/CMakeLists.txt
++++ b/Tools/MediaDriverTools/KernelBinToSource/CMakeLists.txt
+@@ -18,7 +18,7 @@
+ # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
+ # OTHER DEALINGS IN THE SOFTWARE.
+ 
+-cmake_minimum_required (VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ project(IntelKernelBinToSourceTool) 
+ add_compile_options(-std=c++11)
+ 
+diff --git a/Tools/MediaDriverTools/KrnToHex/CMakeLists.txt b/Tools/MediaDriverTools/KrnToHex/CMakeLists.txt
+index a3cb7341c..e2bfde5e8 100644
+--- a/Tools/MediaDriverTools/KrnToHex/CMakeLists.txt
++++ b/Tools/MediaDriverTools/KrnToHex/CMakeLists.txt
+@@ -18,7 +18,7 @@
+ # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
+ # OTHER DEALINGS IN THE SOFTWARE.
+ 
+-cmake_minimum_required (VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ project(KrnToHexTool) 
+ add_compile_options(-std=c++11)
+ 
+diff --git a/Tools/MediaDriverTools/KrnToHex_IGA/CMakeLists.txt b/Tools/MediaDriverTools/KrnToHex_IGA/CMakeLists.txt
+index af622be19..40e4eba17 100644
+--- a/Tools/MediaDriverTools/KrnToHex_IGA/CMakeLists.txt
++++ b/Tools/MediaDriverTools/KrnToHex_IGA/CMakeLists.txt
+@@ -18,7 +18,7 @@
+ # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ # OTHER DEALINGS IN THE SOFTWARE.
+ 
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(KrnToHex_IGA)
+ 
+diff --git a/cmrtlib/CMakeLists.txt b/cmrtlib/CMakeLists.txt
+index 9ecb1e4e1..54f907b37 100644
+--- a/cmrtlib/CMakeLists.txt
++++ b/cmrtlib/CMakeLists.txt
+@@ -19,7 +19,7 @@
+ # OTHER DEALINGS IN THE SOFTWARE.
+ 
+ set(BUILD_ALL $ENV{BUILD_ALL})
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ project(CM_RT)
+ add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/linux)
+ 
+diff --git a/cmrtlib/linux/CMakeLists.txt b/cmrtlib/linux/CMakeLists.txt
+index b066138d9..df02bab2a 100644
+--- a/cmrtlib/linux/CMakeLists.txt
++++ b/cmrtlib/linux/CMakeLists.txt
+@@ -18,7 +18,7 @@
+ # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ # OTHER DEALINGS IN THE SOFTWARE.
+ 
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ include (${CMAKE_CURRENT_LIST_DIR}/cmrt_utils.cmake)
+ 
+ 
+diff --git a/media_driver/linux/ult/CMakeLists.txt b/media_driver/linux/ult/CMakeLists.txt
+index 9fb5b39ee..f06b49011 100644
+--- a/media_driver/linux/ult/CMakeLists.txt
++++ b/media_driver/linux/ult/CMakeLists.txt
+@@ -17,7 +17,7 @@
+ # OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ # OTHER DEALINGS IN THE SOFTWARE.
+-cmake_minimum_required(VERSION 3.1)
++cmake_minimum_required(VERSION 3.5)
+ 
+ if ("${BUILD_TYPE}" STREQUAL "debug")
+     set(CMAKE_BUILD_TYPE "Debug")
+diff --git a/media_driver/linux/ult/libdrm_mock/CMakeLists.txt b/media_driver/linux/ult/libdrm_mock/CMakeLists.txt
+index 438715a91..e5d2c88ed 100644
+--- a/media_driver/linux/ult/libdrm_mock/CMakeLists.txt
++++ b/media_driver/linux/ult/libdrm_mock/CMakeLists.txt
+@@ -17,7 +17,7 @@
+ # OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ # OTHER DEALINGS IN THE SOFTWARE.
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(libdrm_mock)
+ 
+diff --git a/media_driver/linux/ult/ult_app/CMakeLists.txt b/media_driver/linux/ult/ult_app/CMakeLists.txt
+index 1b24fed7f..64217b9fe 100644
+--- a/media_driver/linux/ult/ult_app/CMakeLists.txt
++++ b/media_driver/linux/ult/ult_app/CMakeLists.txt
+@@ -17,7 +17,7 @@
+ # OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ # OTHER DEALINGS IN THE SOFTWARE.
+-cmake_minimum_required(VERSION 3.1)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(devult)
+ 
+diff --git a/media_driver/linux/ult/ult_app/googletest/CMakeLists.txt b/media_driver/linux/ult/ult_app/googletest/CMakeLists.txt
+index 6b1f74335..bba044a97 100644
+--- a/media_driver/linux/ult/ult_app/googletest/CMakeLists.txt
++++ b/media_driver/linux/ult/ult_app/googletest/CMakeLists.txt
+@@ -17,7 +17,7 @@
+ # OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ # OTHER DEALINGS IN THE SOFTWARE.
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ 
+ project(devult)
+ 
+diff --git a/os_release_info.cmake b/os_release_info.cmake
+index b4a84e2c5..a3b879d85 100644
+--- a/os_release_info.cmake
++++ b/os_release_info.cmake
+@@ -29,7 +29,7 @@ set(_os_release_info TRUE)
+ # of the local cmake environment.
+ 
+ # Set cmake policies for at least this level:
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 3.5)
+ 
+ 
+ # Function get_os_release_info - Determine and return OS name and version
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
