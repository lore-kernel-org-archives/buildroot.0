Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF0AC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 19:54:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 890A860F42
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 19:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 890A860F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46FB960652;
	Sat,  7 Aug 2021 19:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BZhCUbJ1PR-t; Sat,  7 Aug 2021 19:54:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 649CE60656;
	Sat,  7 Aug 2021 19:54:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9084C1BF3AB
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 19:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F6714020D
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 19:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CXASm4MuTYvM for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 19:54:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC093401EE
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 19:54:48 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id m12so15715824wru.12
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 12:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QPe6OwXNIITv/iBxHi/WcJWdWTl3vaS1qURF4e+KhLc=;
 b=F+AzUka29qArmjjbZI6y+iVFmPeH+C8uQnF7iXePPklxgtsajicvZy1MHtw42WbwxD
 RjUvC1cBqpl7Dlw5b8Z0L1JLRF9Jgtoy56MtSGpWtQ0p1KkZZJ97CxrSeXakFjmtamH+
 V7MPWOOqhea4sIY9QmB5GzsMhOHaAHqWqUBTnViXbbK6S0zCS9m+kHxT5wCAQWPFOY0i
 dUYbgnnzyPOsnyjhKkWIkVgPqMKV0FRFDi3elDfoR9ZZs4np4P8e+Kt+lQ3bXJ5PJhVJ
 cyL2uE//QpGXjjc/UDEOBaoix76pugHtQOF8fa2YqJNxx6ZRJ0nHvOqyq4AKMkh1tEAL
 AZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QPe6OwXNIITv/iBxHi/WcJWdWTl3vaS1qURF4e+KhLc=;
 b=kIiijRPGpfs/tNbxAIQtCg8bWfrcDYrmAaGe/ivY9+6mve5vqCIAIfcUiQmzh1Izzb
 VES+WfLIV0ckq3yzLtKYEEDpvs9tZZ2k1UGhuKpApI9r0e/Ly1VqkqPx6FEXIz8MS3rz
 pCZgaU5+7ZNOSchPxUoFDZodpKkqR9az17QZRfGHXzt9XrhV9EAIvL+yUQcdE60mWzn7
 yuNNlK/o1QmUfGhTYoJZ8acPSblFTmGLamyo6klYD6PB7L+PlY6Jmxp3/QYvgNBMdoUa
 wyJl9MvHbTumwsHnY5GeT/p7sqRBuLt0oy+8krcw2B9h34OAXJJG3KiaW3wTAygToZFR
 fhgA==
X-Gm-Message-State: AOAM533B65G7hI4UsPELbmBrGmNRXg4Bdp8V9rEcXb6c5YkMPJsHUmH8
 /qKadqAjV83MpPlkqUIUld4h2MRxjerYUg==
X-Google-Smtp-Source: ABdhPJxbMXwKX09CTcFleeDMRsofOFrS1apkDlDXgtkZ6VI/tzXctolYRBLfQv/Mt8Z1oSuYEaKfPw==
X-Received: by 2002:a5d:5745:: with SMTP id q5mr15630562wrw.409.1628366086625; 
 Sat, 07 Aug 2021 12:54:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id r2sm14281244wrq.15.2021.08.07.12.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 12:54:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Aug 2021 21:54:41 +0200
Message-Id: <20210807195441.1527022-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pulseview: fix build with libglib
 >= 2.68
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with libglib >= 2.68 raised since commit
c72524fb1b1c6b7dd1b1f511eea0fdf5a39dd3a0:

In file included from /tmp/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/glib-2.0/glib/gatomic.h:31,
                 from /tmp/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/glib-2.0/glib/gthread.h:32,
                 from /tmp/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/glib-2.0/glib/gasyncqueue.h:32,
                 from /tmp/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/glib-2.0/glib.h:32,
                 from /tmp/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/libsigrokdecode/libsigrokdecode.h:25,
                 from /tmp/instance-0/output-1/build/pulseview-0.4.2/pv/data/decode/annotation.cpp:21:
/tmp/instance-0/output-1/host/opt/ext-toolchain/mips64el-buildroot-linux-uclibc/include/c++/8.4.0/type_traits:56:3: error: template with C linkage
   template<typename _Tp, _Tp __v>
   ^~~~~~~~
/tmp/instance-0/output-1/build/pulseview-0.4.2/pv/data/decode/annotation.cpp:20:1: note: 'extern "C"' linkage started here
 extern "C" {
 ^~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/33cbaaeefd8637bac4ad0fbbfae7c369de4875d2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...d-due-to-C-template-behind-C-linkage.patch | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 package/pulseview/0002-Fix-broken-build-due-to-C-template-behind-C-linkage.patch

diff --git a/package/pulseview/0002-Fix-broken-build-due-to-C-template-behind-C-linkage.patch b/package/pulseview/0002-Fix-broken-build-due-to-C-template-behind-C-linkage.patch
new file mode 100644
index 0000000000..16d4cfdb00
--- /dev/null
+++ b/package/pulseview/0002-Fix-broken-build-due-to-C-template-behind-C-linkage.patch
@@ -0,0 +1,58 @@
+From ed643f0b4ac587204a5243451cda181ee1405d62 Mon Sep 17 00:00:00 2001
+From: =?utf8?q?Stefan=20Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>
+Date: Wed, 28 Apr 2021 02:14:47 +0200
+Subject: [PATCH] Fix broken build due to C++ template behind C linkage
+
+glib/gatomic.h since 2.68 includes type_traits, which causes a compilation
+error:
+In file included from /usr/include/glib-2.0/glib/gatomic.h:31,
+                 from /usr/include/glib-2.0/glib/gthread.h:32,
+                 from /usr/include/glib-2.0/glib/gasyncqueue.h:32,
+                 from /usr/include/glib-2.0/glib.h:32,
+                 from /usr/include/libsigrokdecode/libsigrokdecode.h:25,
+                 from /home/abuild/rpmbuild/BUILD/pulseview-0.4.2/pv/data/decode/annotation.cpp:21:
+/usr/include/c++/10/type_traits:2308:3: error: template with C linkage
+2308 |   template<typename _CTp, typename _Rp>
+
+As libsigrokdecode.h declares extern C linkage itself where necessary,
+remove it from pulseviews include statements from the last two occasions.
+
+[Retrieved from:
+https://sigrok.org/gitweb/?p=pulseview.git;a=commit;h=ed643f0b4ac587204a5243451cda181ee1405d62]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ pv/data/decode/annotation.cpp  | 2 --
+ pv/views/trace/decodetrace.cpp | 2 --
+ 2 files changed, 4 deletions(-)
+
+diff --git a/pv/data/decode/annotation.cpp b/pv/data/decode/annotation.cpp
+index 7f233478..f8a5c47b 100644
+--- a/pv/data/decode/annotation.cpp
++++ b/pv/data/decode/annotation.cpp
+@@ -17,9 +17,7 @@
+  * along with this program; if not, see <http://www.gnu.org/licenses/>.
+  */
+ 
+-extern "C" {
+ #include <libsigrokdecode/libsigrokdecode.h>
+-}
+ 
+ #include <cassert>
+ #include <vector>
+diff --git a/pv/views/trace/decodetrace.cpp b/pv/views/trace/decodetrace.cpp
+index 409f1d28..888064d0 100644
+--- a/pv/views/trace/decodetrace.cpp
++++ b/pv/views/trace/decodetrace.cpp
+@@ -17,9 +17,7 @@
+  * along with this program; if not, see <http://www.gnu.org/licenses/>.
+  */
+ 
+-extern "C" {
+ #include <libsigrokdecode/libsigrokdecode.h>
+-}
+ 
+ #include <limits>
+ #include <mutex>
+-- 
+2.24.0.rc2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
