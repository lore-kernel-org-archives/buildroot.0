Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F18C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 21:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F99181CE7;
	Sun,  7 Aug 2022 21:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F99181CE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b127z6unxgsk; Sun,  7 Aug 2022 21:15:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CA9281BFA;
	Sun,  7 Aug 2022 21:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CA9281BFA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5CAC91BF368
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 21:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 378C481BFA
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 21:15:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 378C481BFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TVoDO9SxZ05D for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 21:15:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28F1881BD9
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28F1881BD9
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 21:15:50 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id v3so8968728wrp.0
 for <buildroot@buildroot.org>; Sun, 07 Aug 2022 14:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=7aNCLgwBetzjx31epk/Be2o4DFrPT5g9zUg8zDN0eFk=;
 b=QQOKfpsko1uxQmeqXm7ka6BQl9+Q1wo4WoKhhFtDazlmQ1zKmU3iposO9JlYPE1fZw
 p0gT0hBsqcs+FWkWST/pCmpn5PSkabJ0uqGcqbKWJ5Yl46ZEN0kPxA/7oR09CH4uwqJ+
 aRukC61ghuyIeQP56lX9DNnLNFOIg8thUs2cRKcdlthoV3p+xTVOyzdqpKlsfYwNkKz6
 ERpaIEbrdeVxlmhWSsz4Bj7vNRl4nqqDnbSftCIu3FhJGu8RPEanf+sk7lCLmfrklmva
 0r8hsD9hR7dxNmqSHhaweNxY/jniLGuEeTbYwKmyTAx/A3mrGOGU4JWguqkVStuRJL5+
 XIqQ==
X-Gm-Message-State: ACgBeo1aMpfzoo4KE76FM1EhzXYzEJcS+kGp064PS2w31EB7jxh/orE5
 gf5IKFzq11EvOJL9rRI3pBod2fI3Hlg=
X-Google-Smtp-Source: AA6agR4r4RCGDz/gS5jMg27iOk3p9/YhUMYngpG6WID0hzLGkQxQI2TErETdg+pu2cZKQYBRrsL3kA==
X-Received: by 2002:adf:fc47:0:b0:220:5f01:6a10 with SMTP id
 e7-20020adffc47000000b002205f016a10mr10101421wrs.7.1659906948062; 
 Sun, 07 Aug 2022 14:15:48 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j5-20020adfa545000000b002211fc70174sm11084160wrb.99.2022.08.07.14.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Aug 2022 14:15:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Aug 2022 23:15:41 +0200
Message-Id: <20220807211541.178167-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=7aNCLgwBetzjx31epk/Be2o4DFrPT5g9zUg8zDN0eFk=;
 b=dsibBTFRe3r7Agh7JXF0uipXgr1UQHUhSUxxHsnQn/YXTSos2CTe62JP8RD0jKDuyS
 9IRoE+8G2T9+phDPaNF/o6QnIRDKfuXlbNQo5g0DqhZyyD4Qp5HQfmeoaPmXDVpczGTx
 e1RUvqO1yYv+BmUG9VvbjzhpfzpHVDWeYjQ6he0/PlBCZNI4P6IipzI4x6GmVq8bQrDu
 IS53bsA0RR/0tBDhOdldprp2ulbqzd7R9iGYa9X90/hZWg7ST/ghuCxvPJlXABSMtfqg
 /5UD0pwUZZi+x1p6arrYSUh2WGguMCQQOrLINxDshWcWcjn4LF/+TVlcht8rK5jfqUB9
 bJDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dsibBTFR
Subject: [Buildroot] [PATCH 1/1] package/waffle: fix build without C++
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop C++ dependency as nacl is disabled (and will be dropped by upstream
in next release) to avoid the following build failure raised since bump
to version 1.6.1 in commit 814f36fdcc39bbafa1e2aaf637c7c6b59e7f37dd:

CMake Error at /usr/share/cmake-3.22/Modules/CMakeTestCXXCompiler.cmake:62 (message):
  The C++ compiler

    "/usr/bin/clang++"

  is not able to compile a simple test program.

Fixes:
 - http://autobuild.buildroot.org/results/a702495074b0393682c619781c349ce62e123133

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/waffle/0003-drop-C-dependency.patch | 46 +++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/waffle/0003-drop-C-dependency.patch

diff --git a/package/waffle/0003-drop-C-dependency.patch b/package/waffle/0003-drop-C-dependency.patch
new file mode 100644
index 0000000000..89c0cd09f2
--- /dev/null
+++ b/package/waffle/0003-drop-C-dependency.patch
@@ -0,0 +1,46 @@
+From a54a5d086c5f7e0751f68ac1a2942d8077922ebc Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 7 Aug 2022 16:18:22 +0200
+Subject: [PATCH] drop C++ dependency
+
+C++ dependency has been added for nacl backend which has been added by
+https://gitlab.freedesktop.org/mesa/waffle/-/commit/6ca943584e593aec2bd4f9c66d91859e63e02d61
+and dropped by
+https://gitlab.freedesktop.org/mesa/waffle/-/commit/a7c7152b054e6d2b9af36ed9db9a0df44731b279
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ CMakeLists.txt            | 2 +-
+ src/waffle/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index acece86..04ea68c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -23,7 +23,7 @@
+ # OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ # OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ 
+-project(waffle1 C CXX)
++project(waffle1 C)
+ 
+ cmake_minimum_required(VERSION 2.8.12)
+ 
+diff --git a/src/waffle/CMakeLists.txt b/src/waffle/CMakeLists.txt
+index 8014b51..276f276 100644
+--- a/src/waffle/CMakeLists.txt
++++ b/src/waffle/CMakeLists.txt
+@@ -238,7 +238,7 @@ include_directories(
+     ${XCB_INCLUDE_DIRS}
+     )
+ 
+-add_library(${waffle_libname} SHARED ${waffle_sources} ${waffle_cxx_sources})
++add_library(${waffle_libname} SHARED ${waffle_sources})
+ 
+ # Debian's packaging system emits warnings if wflinfo directly links to any
+ # library that it doesn't directly use. Silence the warnings by annotating
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
