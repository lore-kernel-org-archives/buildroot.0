Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70D1D18132
	for <buildroot@archiver.kernel.org>; Mon, 14 Oct 2024 17:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1816B403E0;
	Mon, 14 Oct 2024 17:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6p1Zuh8iljZ; Mon, 14 Oct 2024 17:15:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAFC4402C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAFC4402C2;
	Mon, 14 Oct 2024 17:15:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F0851BF359
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 17:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E10260774
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 17:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l0340BXHcy99 for <buildroot@lists.busybox.net>;
 Mon, 14 Oct 2024 17:15:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A4E5860634
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4E5860634
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A4E5860634
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 17:15:12 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-431286f50e1so25321565e9.0
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 10:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728926110; x=1729530910;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VKgpB4AA+5QlXECYuMfTgRR9vn2Q3bjqZmTPzmjsp+E=;
 b=YTTgVILL+GBVTy7ZtoB2TOvb8DtgfL8BLGSsnJ8oOu3JXaL3P+96KGXiOVo5m1p1wM
 Q47BA+ppLDD/45ioenqbVTa6cWkumOXJeLHLubVyTG1+BX5wG3WIiMNfdgJWBxs/o8AO
 xJNBFWCVIcquXF5Cgx4NzE79oFWtbZ6FXhFUCHWD8leyUB0gbwh7jjxp6i8hVC/0H09g
 UUis90tu/l7GrgUrTkcTDOaQMZiABC/1M5jnDjEttIzYyIsZRe7lN5azz39JxJWxu6pZ
 xOvZipxDbSz28zuKRlbi3isEHm+FwdS0cdZOfJ//xkkYmsPpLeOHeG29ZCDxpmGgsEaR
 u3fQ==
X-Gm-Message-State: AOJu0YyMlunSagncHZfF37fbXbcR90GuLG/+QeMCh5HeY6FAO4JDZTIO
 MGFhgisUZ5moM0iMiATUC0a2Y/jE9ghvUd/yQESgMDItytwUy6i2IslZo7zS+7qksOHVsJsEZT0
 gqqE=
X-Google-Smtp-Source: AGHT+IFgF/I3AERQOhtLeG8Kr67kDeFv9Bk58YUX44DSwNL7AFunVbiAvo+MUNY3i1zxRra4tLhIeA==
X-Received: by 2002:a05:600c:1c09:b0:42c:aeaa:6b0d with SMTP id
 5b1f17b1804b1-431255dac21mr106883285e9.9.1728926110180; 
 Mon, 14 Oct 2024 10:15:10 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.133])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b6a8928sm11944591f8f.7.2024.10.14.10.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 10:15:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 14 Oct 2024 19:15:06 +0200
Message-ID: <20241014171506.2197624-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728926110; x=1729530910;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VKgpB4AA+5QlXECYuMfTgRR9vn2Q3bjqZmTPzmjsp+E=;
 b=XkCbkukMyJ/HNHP16zNQ0YccgvDk42d+kQS1A5S7TzvbK/S03QiOeaV3RPiPY8i5XH
 sOQo6YsF83RjGYSXFIdAsKXhzDDjwPy2Zy5NmwjU8YwZp+aWNjMJRsT9/U5C5byBHvKI
 Gs9QEP2MM4SJolT82jLbhDpvHdhZszJVIPW/E=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XkCbkukM
Subject: [Buildroot] [PATCH 1/1] package/babeltrace2: bump to version 2.0.6
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Philippe Proulx <eeppeliteloop@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

2024-03-28 Babeltrace 2.0.6 (Respect Your Cat Day)
	* bt2: disable some warnings for `native_bt.c`
	* bt2: compile `native_bt.c` with `-Wno-undef`
	* Fix: src.ctf.lttng-live: expect NEW_STREAM/METADATA for inactive streams
	* Fix: `babeltrace2 convert`: don't consider the `--plugin-path` opt.
	* include/babeltrace2/plugin/plugin-dev.h: "define" -> "definition
	* Fix: doc: escape double quote in bt_p alias
	* Fix: bt2: pass _TraceClassConst to destruction listeners
	* fix: 'load_module()' deprecated in Python 3.12
	* tests: retry os.rename on PermissionError failure in lttng_live_server.py
	* doc: fix uptream -> upstream typos
	* fix: test_message_iterator.py hangs on Python 3.12
	* plugin-dev: mark symbols meant to be public with __attribute__((visibility("default")))
	* Silence -Wunused-but-set-variable error with clang
	* Fix: Windows DLL path lookup with Python >= 3.8
	* doc/man: make default values of boolean init. params. clearer
	* RFC: docs: fix: Match stated automake requirement
	* fix: make flake8 6.x happy
	* fix: running black on python 3.11
	* bt_query_executor_create_with_method_data(): fix docs note
	* Fix: ctf-writer: null dereference in bt_ctf_trace_common_add_stream_class
	* Update working version to Babeltrace v2.0.6

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...onfigure-simplify-warning-flags-detection.patch | 14 ++++++++------
 package/babeltrace2/babeltrace2.hash               |  2 +-
 package/babeltrace2/babeltrace2.mk                 |  2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch b/package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch
index ec7ea83ffd1e..bd61843acf5c 100644
--- a/package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch
+++ b/package/babeltrace2/0001-configure-simplify-warning-flags-detection.patch
@@ -40,6 +40,8 @@ Reviewed-by: Michael Jeanson <mjeanson@efficios.com>
 [Retrieved from:
 https://github.com/efficios/babeltrace/commit/28ba44ad9ca14153e96c94a9100423ea224c1af3]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: adapt to 2.0.6]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  configure.ac                    |  74 +++++++++------
  m4/ax_compiler_flags.m4         | 158 -------------------------------
@@ -56,7 +58,7 @@ diff --git a/configure.ac b/configure.ac
 index 055fba101..7ebcf2ad4 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -660,25 +660,35 @@ target.
+@@ -694,25 +694,35 @@
  CFLAGS=${save_CFLAGS}
  
  # Detect C and LD warning flags supported by the compiler.
@@ -110,14 +112,11 @@ index 055fba101..7ebcf2ad4 100644
  		dnl
  		dnl Some versions of SWIG (like 3.0.12) generate code that produces
  		dnl -Wcast-function-type warnings.  This warning is present in gcc >= 8.  This
-@@ -692,24 +702,32 @@ AX_COMPILER_FLAGS(
- 		dnl
+@@ -727,24 +737,32 @@
  		dnl Ref: https://github.com/swig/swig/issues/1259
  		-Wno-cast-function-type dnl
+ 		-Wno-suggest-attribute=format dnl
 -	])
--
--# CFLAGS from AX_COMPILER_FLAGS.
--AM_CFLAGS="${AM_CFLAGS} ${WARN_CFLAGS}"
 +		-Wno-missing-field-initializers dnl
 +	],
 +	[WARN_CFLAGS],
@@ -131,6 +130,9 @@ index 055fba101..7ebcf2ad4 100644
 +	[WARN_CFLAGS="${WARN_CFLAGS} -Werror"]
 +)
  
+-# CFLAGS from AX_COMPILER_FLAGS.
+-AM_CFLAGS="${AM_CFLAGS} ${WARN_CFLAGS}"
+-
 -# The test used in AX_COMPILER_FLAGS, generated using AC_LANG_PROGRAM, is
 +# The test used in AX_APPEND_COMPILE_FLAGS, generated using AC_LANG_PROGRAM, is
  # written in such a way that it triggers a -Wold-style-definition warning.  So
diff --git a/package/babeltrace2/babeltrace2.hash b/package/babeltrace2/babeltrace2.hash
index 164e65cded99..3caf52a79260 100644
--- a/package/babeltrace2/babeltrace2.hash
+++ b/package/babeltrace2/babeltrace2.hash
@@ -1,5 +1,5 @@
 # From https://www.efficios.com/files/babeltrace/babeltrace2-2.0.4.tar.bz2.sha256
-sha256  774f116685dab5db9c51577dde43c8c1df482aae6bb78a089b1e9e7c8b489bca  babeltrace2-2.0.4.tar.bz2
+sha256  a01c7e75e642de0b5b91f32cc706234c99eb556fcd52c9959045dc23a9ec52c9  babeltrace2-2.0.6.tar.bz2
 
 # Hash for license files
 sha256  d919c6347409efde6dea63c6f349fb06bc060a2b721fc3df07b5f720b5f1d60e  LICENSE
diff --git a/package/babeltrace2/babeltrace2.mk b/package/babeltrace2/babeltrace2.mk
index 2b2ab7db4078..f3f1543c0e37 100644
--- a/package/babeltrace2/babeltrace2.mk
+++ b/package/babeltrace2/babeltrace2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BABELTRACE2_SITE = https://www.efficios.com/files/babeltrace
-BABELTRACE2_VERSION = 2.0.4
+BABELTRACE2_VERSION = 2.0.6
 BABELTRACE2_SOURCE = babeltrace2-$(BABELTRACE2_VERSION).tar.bz2
 BABELTRACE2_LICENSE = MIT, LGPL-2.1 (src/common/list.h), GPL-2.0 (test code)
 BABELTRACE2_LICENSE_FILES = mit-license.txt lgpl-2.1.txt gpl-2.0.txt LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
