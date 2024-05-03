Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221DDC4345F
	for <buildroot@archiver.kernel.org>; Fri,  3 May 2024 18:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95ECA41D79;
	Fri,  3 May 2024 18:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O82USwlHSdpD; Fri,  3 May 2024 18:31:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69D6A41D7A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69D6A41D7A;
	Fri,  3 May 2024 18:31:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62C2C1BF311
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 18:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5020660663
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 18:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLtHshRRJ-bL for <buildroot@lists.busybox.net>;
 Fri,  3 May 2024 18:31:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E3BE160659
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3BE160659
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3BE160659
 for <buildroot@buildroot.org>; Fri,  3 May 2024 18:31:38 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2e0933d3b5fso68650301fa.2
 for <buildroot@buildroot.org>; Fri, 03 May 2024 11:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714761096; x=1715365896;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GRwI4pp42JC8WxU/q1qC/58G+zuG8cX8iluRGYSodRg=;
 b=IXPc99AGcnxguYmZAjHtVszsaJ72izAZMGxV4z6YmEqRG1q9OUm8k9fRVNdSubKB9N
 dgSyf8QZQkjnpGT8AB5NkUS75mX/EEkwp5czm6N30nnf2IPLpR4BLzI5xBAMxSKGK/le
 Q+bu8S4Jx9ImePTMeWi+TUpOWv7f+/BkIn/vp/zZj0NeCjN7hZpCDKNaeSADvUsv1vi3
 GwTIeePKLm/3xPYV86Y7n9lLqcq3428ZhdnOMJtQ+YUxvZ9vjVyuhZTNTrs0c/I5ELr/
 wuAyQ7SqrU7ztGMt3fmSAGD9QmSL0+GOisZtqMPZO6JtvRorB/1iKNsC6fHCBdNER7Zs
 /5BQ==
X-Gm-Message-State: AOJu0YzTD7J5iAqnznjgez3tKpNGbf0shgdVe1OpXgk9rZtxsAEyAY4g
 bQRH+m7NqtVzaWbMS/ie6kalWCg3k0La837bwgz/7Wb327lyn8ittj/smw==
X-Google-Smtp-Source: AGHT+IG86rIRVU1L2MfTT5+01RwjvcLcoE1jk14vYb2krRLIKIlYOKePgnIgk4bRNbXLXPm7OT8nUQ==
X-Received: by 2002:a2e:9b17:0:b0:2e0:42db:df7f with SMTP id
 u23-20020a2e9b17000000b002e042dbdf7fmr2258205lji.0.1714761095862; 
 Fri, 03 May 2024 11:31:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 s7-20020a05600c384700b0041c12324eb6sm10333128wmr.22.2024.05.03.11.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 11:31:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 May 2024 20:31:32 +0200
Message-ID: <20240503183132.915691-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714761096; x=1715365896; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GRwI4pp42JC8WxU/q1qC/58G+zuG8cX8iluRGYSodRg=;
 b=GLwY023ACcm7H/98MzFG1TKwsk5IUwuwb3PQ83hW8sxbFscdW3BpK1ff0AOlUVIxdZ
 uGwKxse+Y8bfeHrsU6nltp1V98vX2mIhrrpT2GMGxG7sX/SjtHEB+f6dvYsQK66sOvbU
 i+z0TfppCNE9fxdfe+5Wh64trWl3qc5UBXGjNpBPIOjfbHXvxlnhr6Hk3mR4s0EcI+yX
 mYrbF1SAdh3tQjEueC668qa6CGHNkEEiRTpv4v8KWtPsj1pxZwK5vWHDmZFibfePd6D6
 RHT4FEC38gIrz9yHLwWov5cjhHDReLsgHzuNgEs7hanyUrU7Em/CE8ktjJVIv05Slaal
 PMDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GLwY023A
Subject: [Buildroot] [PATCH 1/1] package/libglib2: update atomic patch
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

Commit 929bffbf4bf8fcb91bda446777f907f32c782656 forgot to update patch
number
Moreover, replace it with a new iteration to follow upstream request [1]
and avoid the following build host build failure with br-autobuild-1:

/usr/bin/ld: cannot find /usr/lib64/libatomic.so.1.2.0: No such file or directory

Fixes: 929bffbf4bf8fcb91bda446777f907f32c782656
 - http://autobuild.buildroot.org/results/a12b9c4436594818f4ce128595b429adf7d90e31

[1]: https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3606

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0005-link-with-latomic-when-needed.patch  | 45 ----------------
 .../0006-link-with-latomic-when-needed.patch  | 52 +++++++++++++++++++
 2 files changed, 52 insertions(+), 45 deletions(-)
 delete mode 100644 package/libglib2/0005-link-with-latomic-when-needed.patch
 create mode 100644 package/libglib2/0006-link-with-latomic-when-needed.patch

diff --git a/package/libglib2/0005-link-with-latomic-when-needed.patch b/package/libglib2/0005-link-with-latomic-when-needed.patch
deleted file mode 100644
index 275d86032b..0000000000
--- a/package/libglib2/0005-link-with-latomic-when-needed.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From d1814dbd3a88c95a43d4c9805bb4a523cf62d97b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 17 Sep 2023 20:42:00 +0200
-Subject: [PATCH] link with -latomic when needed
-
-Some architecture such as sparc and some flavors of arm needs -latomic
-to avoid the following build failure:
-
-gthread-posix.c:(.text+0xda8): undefined reference to `__atomic_compare_exchange_4'
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3586
----
- glib/meson.build | 1 +
- meson.build      | 2 ++
- 2 files changed, 3 insertions(+)
-
-diff --git a/glib/meson.build b/glib/meson.build
-index c26a35e42..7a761306b 100644
---- a/glib/meson.build
-+++ b/glib/meson.build
-@@ -426,6 +426,7 @@ libglib = library('glib-2.0',
-     pcre2,
-     platform_deps,
-     thread_dep,
-+    atomic_dep
-   ],
-   c_args : glib_c_args,
-   objc_args : glib_c_args,
-diff --git a/meson.build b/meson.build
-index 25ae10fc2..5ae84b3b3 100644
---- a/meson.build
-+++ b/meson.build
-@@ -2130,6 +2130,8 @@ libffi_dep = dependency('libffi', version : '>= 3.0.0')
- 
- libz_dep = dependency('zlib')
- 
-+atomic_dep = cc.find_library('atomic', required: false)
-+
- # First check in libc, fallback to libintl, and as last chance build
- # proxy-libintl subproject.
- # FIXME: glib-gettext.m4 has much more checks to detect broken/uncompatible
--- 
-2.40.1
-
diff --git a/package/libglib2/0006-link-with-latomic-when-needed.patch b/package/libglib2/0006-link-with-latomic-when-needed.patch
new file mode 100644
index 0000000000..5ac0744cbf
--- /dev/null
+++ b/package/libglib2/0006-link-with-latomic-when-needed.patch
@@ -0,0 +1,52 @@
+From 4e6dc4dee0e1c6407113597180d9616b4f275f94 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 2 May 2024 14:02:17 +0200
+Subject: [PATCH] link with -latomic when needed
+
+Some architecture such as sparc and some flavors of arm needs -latomic
+to avoid the following build failure:
+
+gthread-posix.c:(.text+0xda8): undefined reference to `__atomic_compare_exchange_4'
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4034
+---
+ glib/meson.build | 1 +
+ meson.build      | 9 +++++++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/glib/meson.build b/glib/meson.build
+index 24cbb664d..b2dd569e1 100644
+--- a/glib/meson.build
++++ b/glib/meson.build
+@@ -419,6 +419,7 @@ libglib = library('glib-2.0',
+   include_directories : configinc,
+   link_with: [charset_lib, gnulib_lib],
+   dependencies : [
++    atomic_dep,
+     gnulib_libm_dependency,
+     libiconv,
+     libintl_deps,
+diff --git a/meson.build b/meson.build
+index 46c5aa200..8b4294055 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2233,6 +2233,15 @@ libffi_dep = dependency('libffi', version : '>= 3.0.0')
+ 
+ libz_dep = dependency('zlib')
+ 
++libatomic_test_code = '''
++  int main (int argc, char ** argv) {
++    return 0;
++  }'''
++atomic_dep = []
++if cc.links(libatomic_test_code, args : '-latomic', name : 'check for -latomic')
++  atomic_dep = cc.find_library('atomic')
++endif
++
+ # First check in libc, fallback to libintl, and as last chance build
+ # proxy-libintl subproject.
+ # FIXME: glib-gettext.m4 has much more checks to detect broken/uncompatible
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
