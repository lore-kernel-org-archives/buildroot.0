Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE42C43334
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 19:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44E3E83FFD;
	Tue, 21 Jun 2022 19:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44E3E83FFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id La6lY-ZTv-2W; Tue, 21 Jun 2022 19:35:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D7DE81A8E;
	Tue, 21 Jun 2022 19:35:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D7DE81A8E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C58D21BF364
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 19:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0813818E6
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 19:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0813818E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KoRTyBdeWZWd for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 19:35:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41AE081815
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41AE081815
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 19:35:13 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 j5-20020a05600c1c0500b0039c5dbbfa48so9831534wms.5
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 12:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ldmK4Z3an9XSxD2Y6NTbneud3B+M749YcyDxoD1rlCA=;
 b=wDE/DmQ3IfC3nC2lf05Mvi+ysElRIcv5jUo4s2DO9y6qGX1Lw2DBsy1k+9UQO5bwX+
 6d3ITUk+W1t01T4qPl2JVJOHIIbhj245p8enM6tqqXojF7GRSz4rplx65gR+UMGWzTGm
 TwGzLYDlWTZmBk1fU8nTKuA+Yikt0Q1jUOb9Ea8jrFTDhVHHFXythdq7fA2kUXKO1HBp
 8TIvvPm980oAibkV2zdw9ndI4UZwf+/lW8bScOsLoSMjizFdyNE9POl2eMvnoWdl/Il6
 JlYfuZvY9qyHDXblgp0z7rR4J8VZBytybOY6HExTjJQpUEb4lx+rMtbzZIJ9x+MEBrnC
 wJ3g==
X-Gm-Message-State: AJIora8G2YA3ZGPXSVRfHklNhqXwlsNle5JQyZZnbyJ6Ziqxua6mllWu
 qgCspE7xw47li62qYQOvS9DJryTFBIk=
X-Google-Smtp-Source: AGRyM1sXS1/cOJtYlY1ntilfxQiU0hQ7MMPWO2gGI4fVAb9+v8P+q5LRzStbq9j9k44Ld0ZguUL/IQ==
X-Received: by 2002:a05:600c:1c18:b0:39c:4f19:c37a with SMTP id
 j24-20020a05600c1c1800b0039c4f19c37amr32019568wms.69.1655840111146; 
 Tue, 21 Jun 2022 12:35:11 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m62-20020a1ca341000000b0039c99f61e5bsm23104489wme.5.2022.06.21.12.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 12:35:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Jun 2022 21:32:10 +0200
Message-Id: <20220621193210.1399399-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ldmK4Z3an9XSxD2Y6NTbneud3B+M749YcyDxoD1rlCA=;
 b=cFv/+7376stlgb4vHVI71COfAVI6HBAH947HeHh4aruUidefXDWsMNDbwUj/0ZC47W
 Qdm3S1bpnYv2ljpRqe5gYJcIMXGX0gk47gWUYEY7LIytJdr6ei3/yMyJ5vtLeuRryIN/
 BpCh0npd4FKH5Gk8M60ON7dl6Yt/JCasntovB5xTSagGUsarPLsgxFGstbdu/pvKMxvQ
 2XYwG/KgAY0VK7e9xuX73ZwfDmmNePGdi74aj96ny7WhMew3Yhi5y944KrInwkwQKS3z
 VFA+xxVlpO4liJEp7/dBqb18dihM2P5OpbWbIfKAnz8tUUKa673ng1aXWAE0suw0kFld
 2lbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cFv/+737
Subject: [Buildroot] [PATCH 1/1] package/libabseil-cpp: fix build with
 libexecinfo
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

Fix the following build failure with collectd:

/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libabsl_stacktrace.so: undefined reference to `backtrace'

[...]

    libgrpc++ . . . . . . no (libgrpc++ not found)

[...]

configure: error: "Some plugins are missing dependencies - see the summary above for details"

Fixes:
 - http://autobuild.buildroot.org/results/6a0484412f020e763ce3ad5bda48f09c78645bff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-txt-link-with-libexecinfo-if-needed.patch | 65 +++++++++++++++++++
 package/libabseil-cpp/libabseil-cpp.mk        |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 package/libabseil-cpp/0004-PR-1200-absl-debugging-CMakeLists-txt-link-with-libexecinfo-if-needed.patch

diff --git a/package/libabseil-cpp/0004-PR-1200-absl-debugging-CMakeLists-txt-link-with-libexecinfo-if-needed.patch b/package/libabseil-cpp/0004-PR-1200-absl-debugging-CMakeLists-txt-link-with-libexecinfo-if-needed.patch
new file mode 100644
index 0000000000..4fbe8542ac
--- /dev/null
+++ b/package/libabseil-cpp/0004-PR-1200-absl-debugging-CMakeLists-txt-link-with-libexecinfo-if-needed.patch
@@ -0,0 +1,65 @@
+From 01cc6567cff77738e416a7ddc17de2d435a780ce Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 21 Jun 2022 12:27:47 -0700
+Subject: [PATCH] PR #1200: absl/debugging/CMakeLists.txt: link with
+ libexecinfo if needed
+
+Imported from GitHub PR https://github.com/abseil/abseil-cpp/pull/1200
+
+`backtrace` and `execinfo.h` can be provided by libexecinfo on uclibc and musl resulting in the following build failure with any user of abseil-cpp (such as collectd):
+
+```
+/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libabsl_stacktrace.so: undefined reference to `backtrace'
+```
+
+[...]
+
+```
+    libgrpc++ . . . . . . no (libgrpc++ not found)
+```
+
+[...]
+
+```
+configure: error: "Some plugins are missing dependencies - see the summary above for details"
+```
+
+Fixes:
+ - http://autobuild.buildroot.org/results/6a0484412f020e763ce3ad5bda48f09c78645bff
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Merge dac52cd20efb672278dc64bcd74920172a599ac0 into 93ad4284ac12077b7bac07a4743df1c564e7c957
+
+Merging this change closes #1200
+
+COPYBARA_INTEGRATE_REVIEW=https://github.com/abseil/abseil-cpp/pull/1200 from ffontaine:master dac52cd20efb672278dc64bcd74920172a599ac0
+PiperOrigin-RevId: 456323163
+Change-Id: I3d2206761524d36e2b227c571e2e513f6840ff75
+[Retrieved from:
+https://github.com/abseil/abseil-cpp/commit/01cc6567cff77738e416a7ddc17de2d435a780ce]
+---
+ absl/debugging/CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/absl/debugging/CMakeLists.txt b/absl/debugging/CMakeLists.txt
+index 329527344..d8207d6a2 100644
+--- a/absl/debugging/CMakeLists.txt
++++ b/absl/debugging/CMakeLists.txt
+@@ -14,6 +14,8 @@
+ # limitations under the License.
+ #
+ 
++find_library(EXECINFO_LIBRARY execinfo)
++
+ absl_cc_library(
+   NAME
+     stacktrace
+@@ -33,6 +35,8 @@ absl_cc_library(
+     "stacktrace.cc"
+   COPTS
+     ${ABSL_DEFAULT_COPTS}
++  LINKOPTS
++    $<$<BOOL:${EXECINFO_LIBRARY}>:${EXECINFO_LIBRARY}>
+   DEPS
+     absl::debugging_internal
+     absl::config
diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
index 7c6bda7659..cc1be3ad95 100644
--- a/package/libabseil-cpp/libabseil-cpp.mk
+++ b/package/libabseil-cpp/libabseil-cpp.mk
@@ -9,6 +9,7 @@ LIBABSEIL_CPP_SITE = $(call github,abseil,abseil-cpp,$(LIBABSEIL_CPP_VERSION))
 LIBABSEIL_CPP_LICENSE = Apache-2.0
 LIBABSEIL_CPP_LICENSE_FILES = LICENSE
 LIBABSEIL_CPP_INSTALL_STAGING = YES
+LIBABSEIL_CPP_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBEXECINFO),libexecinfo)
 
 LIBABSEIL_CPP_CONF_OPTS = \
 	-DCMAKE_CXX_STANDARD=11 \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
