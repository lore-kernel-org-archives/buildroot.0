Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C6D2C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:19:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C84760E09
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C84760E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CF56605C0;
	Sat, 24 Jul 2021 20:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zpAq51OVrGBo; Sat, 24 Jul 2021 20:19:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6FC660611;
	Sat, 24 Jul 2021 20:19:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AD671BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07354835C8
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dexMI861eL0Y for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:19:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84FCC835C6
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:19:47 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 l11-20020a7bc34b0000b029021f84fcaf75so5610735wmj.1
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 13:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2dRNx8rRrS0Vn6qk03kTA8rqvjADa+dDnF0zAbdUFJQ=;
 b=ugqgh1J3tt8vVHikNZe/He9ce6nhloDhc3LNMTc8/qnljvPp5DtVyVUi0v+soZe0mi
 rPO+jMuo84OGXmmllTIYDqZqxCrd+PYlgrM8SL5iMoKhPvg/omgpFIit+PI8BnInrUDc
 Aif73yNGUtnrrX9bqgJ35XhQMaWzgRBJacjf5STpxQCiKcKlx1ZRquEyYc9vwUojp2DA
 0FunSkueqEMzBocA72GraKosEoMpNUDc9BMdebbSUUIDcjEMj/sX2MU5wIlZ0oVPhCOG
 7lrgTy+UNq9WXnNI5/G7xm9Dvih4JIwelUPHrXBCXaZJ4ibgF2uFLAxQ1yNM9iN++HDN
 GKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2dRNx8rRrS0Vn6qk03kTA8rqvjADa+dDnF0zAbdUFJQ=;
 b=qvkgwiKZyrVYXUd4EFQVemWEk/9VKAI5lXWMsKIm2mqV0fl8sADIMIx37lP3bBbUwl
 hEqqk9adJX0Dmhv4p9M9wUJGSjeCHIgua6ZcAAcc8zE0Zrn1E9lPUYEqePuUhCX7TFPu
 To9W/dGG9oK/pqpf907XYBNZeISUSfoqNUBKmgTcdJ/xh7V8dRCTKCNt8zQrQLvBDZVa
 B7MdKm4BLtnOxCDuOvE0mTe44X+T17UboOQ69PUXQDQprjbD5XNTcyRDg8A5Lv/PAPPf
 c2PWUngIGcq3ttfoRT/0Q0jEXU6DDxn5ZLDbfhm5E6xZFZ0U1qZ2yo+8njKHKs9t89dW
 Rz9w==
X-Gm-Message-State: AOAM533I6L/lot85QETflywTBUst6a8xdN0V29AiQRh9Hs9sAwXbLaX8
 9gYO6J2Xr81Tuu/zQN5PoS0chTOM1w9lDg==
X-Google-Smtp-Source: ABdhPJwKWFipeZcqBoizYlm5rDn/1RcwVioS8SaoCNLAT/Ei0B5gbO7pgd3lmh9DzNBJKfwAP/cR0g==
X-Received: by 2002:a05:600c:4846:: with SMTP id
 j6mr20029883wmo.4.1627157985221; 
 Sat, 24 Jul 2021 13:19:45 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id f2sm36525639wrq.69.2021.07.24.13.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 13:19:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 22:19:36 +0200
Message-Id: <20210724201936.743014-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.32
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

- Drop second patch (already in version)
- Update license:
  https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/31d79f4c9b606218a14e4d695aaa0afb1820c9f1
- avahi is an optional dependency since
  https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/6744934734f509087df769b447185b070c82b58e
- libsub is an optional dependency since
  https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/5e0b63b149559154a6164dbc064aefc7e773c03a
- pulseaudio is an optional dependency since
  https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/44f326013b5f5e1e858ee3788fe664f802ca2523
- webrtc-audio-processing is an optional dependency since
  https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/d95870d8d3ab7fb9b91f0dbd8ae9395b1929434b
- Fix a build failure without C++ thanks to
  https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/d95870d8d3ab7fb9b91f0dbd8ae9395b1929434b

https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/0.3.32/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/20cd863cb3c83b85900e80de02d485b780288330

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-fix-linking-with-latomic.patch       | 108 ------------------
 ...002-modules-fix-typo-in-module-rtkit.patch |  31 +++++
 ...gettid-instead-of-getpid-in-fallback.patch |  28 +++++
 ...0004-modules-improve-_gettid-wrapper.patch |  58 ++++++++++
 package/pipewire/pipewire.hash                |   4 +-
 package/pipewire/pipewire.mk                  |  32 +++++-
 6 files changed, 149 insertions(+), 112 deletions(-)
 delete mode 100644 package/pipewire/0002-fix-linking-with-latomic.patch
 create mode 100644 package/pipewire/0002-modules-fix-typo-in-module-rtkit.patch
 create mode 100644 package/pipewire/0003-rtkit-use-_gettid-instead-of-getpid-in-fallback.patch
 create mode 100644 package/pipewire/0004-modules-improve-_gettid-wrapper.patch

diff --git a/package/pipewire/0002-fix-linking-with-latomic.patch b/package/pipewire/0002-fix-linking-with-latomic.patch
deleted file mode 100644
index 77132173e4..0000000000
--- a/package/pipewire/0002-fix-linking-with-latomic.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 5068aa54bde4e40d6faa8de43d93216bc3001a3e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 21 May 2021 07:47:46 +0200
-Subject: [PATCH] fix linking with -latomic
-
-Linking with -latomic has been added to pipewire-jack since
-https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/b8c58c74d835ee2918f9e391abd65f9e0132bdb4
-
-However, this is not the right place to add this dependency, atomic_dep
-should be added to pipewire_dep to avoid the following build failure:
-
-/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: src/pipewire/libpipewire-0.3.so.0.326.0.p/filter.c.o: in function `impl_node_process':
-filter.c:(.text+0xf28): undefined reference to `__atomic_fetch_add_4'
-
-Indeed, atomic operation such as __atomic_fetch_add is used in libcamera
-as well as in ./spa/plugins/libcamera/libcamera_wrapper.cpp,
-./spa/include/spa/utils/ringbuffer.h and ./spa/include/spa/graph/graph.h
-
-Fixes:
- - http://autobuild.buildroot.org/results/b5305e8e7dd1a5e8bfaba72b06251056ba7d1af1
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/689]
----
- meson.build                   | 11 +++++------
- pipewire-jack/src/meson.build |  4 ++--
- src/pipewire/meson.build      |  4 ++--
- 3 files changed, 9 insertions(+), 10 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index b6b4553b..1308373a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -157,7 +157,7 @@ test_8_byte_atomic = '''
- int main(void)
- {
-   int64_t eight;
--  __atomic_store_n(&eight, 123, __ATOMIC_SEQ_CST);
-+  __atomic_fetch_add(&eight, 123, __ATOMIC_SEQ_CST);
-   return 0;
- }
- '''
-@@ -166,16 +166,15 @@ int main(void)
- # operations on any reasonable architecture.
- if cc.links(
-   test_8_byte_atomic,
--  name : '8-byte __atomic_store_n without libatomic')
-+  name : '8-byte __atomic_fetch_add without libatomic')
-   atomic_dep = dependency('', required: false)
- elif cc.links(
-   test_8_byte_atomic,
-   dependencies : libatomic,
--  name : '8-byte __atomic_store_n with libatomic')
-+  name : '8-byte __atomic_fetch_add with libatomic')
-   atomic_dep = libatomic
--elif get_option('pipewire-jack').enabled()
--  # Currently only required for the JACK backend
--  error('8-byte atomic operations are required for pipewire-jack')
-+else
-+  error('8-byte atomic operations are required')
- endif
- 
- cdata = configuration_data()
-diff --git a/pipewire-jack/src/meson.build b/pipewire-jack/src/meson.build
-index 83e340ba..386abc7f 100644
---- a/pipewire-jack/src/meson.build
-+++ b/pipewire-jack/src/meson.build
-@@ -42,7 +42,7 @@ pipewire_jack = shared_library('jack',
-     version : libversion,
-     c_args : pipewire_jack_c_args,
-     include_directories : [configinc, jack_inc],
--    dependencies : [pipewire_dep, atomic_dep, mathlib],
-+    dependencies : [pipewire_dep, mathlib],
-     install : true,
-     install_dir : libjack_path,
- )
-@@ -53,7 +53,7 @@ pipewire_jackserver = shared_library('jackserver',
-     version : libversion,
-     c_args : pipewire_jack_c_args,
-     include_directories : [configinc, jack_inc],
--    dependencies : [pipewire_dep, atomic_dep, mathlib],
-+    dependencies : [pipewire_dep, mathlib],
-     install : true,
-     install_dir : libjack_path,
- )
-diff --git a/src/pipewire/meson.build b/src/pipewire/meson.build
-index e80f3633..0fa6643a 100644
---- a/src/pipewire/meson.build
-+++ b/src/pipewire/meson.build
-@@ -102,12 +102,12 @@ libpipewire = shared_library(pipewire_name, pipewire_sources,
-   c_args : libpipewire_c_args,
-   include_directories : [pipewire_inc, configinc, spa_inc],
-   install : true,
--  dependencies : [dl_lib, mathlib, pthread_lib, libintl_dep, ],
-+  dependencies : [dl_lib, mathlib, pthread_lib, libintl_dep, atomic_dep, ],
- )
- 
- pipewire_dep = declare_dependency(link_with : libpipewire,
-   include_directories : [pipewire_inc, configinc, spa_inc],
--  dependencies : [pthread_lib, ],
-+  dependencies : [pthread_lib, atomic_dep, ],
- )
- 
- pkgconfig.generate(filebase : 'lib@0@'.format(pipewire_name),
--- 
-2.30.2
-
diff --git a/package/pipewire/0002-modules-fix-typo-in-module-rtkit.patch b/package/pipewire/0002-modules-fix-typo-in-module-rtkit.patch
new file mode 100644
index 0000000000..99d5167ebf
--- /dev/null
+++ b/package/pipewire/0002-modules-fix-typo-in-module-rtkit.patch
@@ -0,0 +1,31 @@
+From 9160a127b5069ee1ca3bdf11857a04f75099041d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=C3=89rico=20Nogueira?= <erico.erc@gmail.com>
+Date: Tue, 20 Jul 2021 12:01:21 -0300
+Subject: [PATCH] modules: fix typo in module-rtkit
+
+Was using the gettid() function directly instead of the _gettid()
+wrapper.
+
+[Retrieved from:
+https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/9160a127b5069ee1ca3bdf11857a04f75099041d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/modules/module-rtkit.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/modules/module-rtkit.c b/src/modules/module-rtkit.c
+index de30f4123..419e4be81 100644
+--- a/src/modules/module-rtkit.c
++++ b/src/modules/module-rtkit.c
+@@ -518,7 +518,7 @@ static void *custom_start(void *data)
+ 	struct impl *impl = this->impl;
+ 
+ 	pthread_mutex_lock(&impl->lock);
+-	this->pid = gettid();
++	this->pid = _gettid();
+ 	pthread_cond_broadcast(&impl->cond);
+ 	pthread_mutex_unlock(&impl->lock);
+ 
+-- 
+GitLab
+
diff --git a/package/pipewire/0003-rtkit-use-_gettid-instead-of-getpid-in-fallback.patch b/package/pipewire/0003-rtkit-use-_gettid-instead-of-getpid-in-fallback.patch
new file mode 100644
index 0000000000..854f268ba7
--- /dev/null
+++ b/package/pipewire/0003-rtkit-use-_gettid-instead-of-getpid-in-fallback.patch
@@ -0,0 +1,28 @@
+From a4b8bd6d5292c13c0e14db54d4b5819a2bbf066d Mon Sep 17 00:00:00 2001
+From: Wim Taymans <wtaymans@redhat.com>
+Date: Tue, 20 Jul 2021 17:13:26 +0200
+Subject: [PATCH] rtkit: use _gettid() instead of getpid() in fallback
+
+[Retrieved from:
+https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/a4b8bd6d5292c13c0e14db54d4b5819a2bbf066d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/modules/module-rtkit.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/modules/module-rtkit.c b/src/modules/module-rtkit.c
+index 419e4be81..1f13aa371 100644
+--- a/src/modules/module-rtkit.c
++++ b/src/modules/module-rtkit.c
+@@ -592,7 +592,7 @@ static pid_t impl_gettid(struct impl *impl, pthread_t pt)
+ 	if ((thr = find_thread_by_pt(impl, pt)) != NULL)
+ 		pid = thr->pid;
+ 	else
+-		pid = getpid();
++		pid = _gettid();
+ 	pthread_mutex_unlock(&impl->lock);
+ 
+ 	return pid;
+-- 
+GitLab
+
diff --git a/package/pipewire/0004-modules-improve-_gettid-wrapper.patch b/package/pipewire/0004-modules-improve-_gettid-wrapper.patch
new file mode 100644
index 0000000000..56bdcf26f9
--- /dev/null
+++ b/package/pipewire/0004-modules-improve-_gettid-wrapper.patch
@@ -0,0 +1,58 @@
+From 4c166709d06571b889a89812c962a91ba4d0a071 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=C3=89rico=20Nogueira?= <erico.erc@gmail.com>
+Date: Tue, 20 Jul 2021 12:10:40 -0300
+Subject: [PATCH] modules: improve _gettid wrapper
+
+- use meson to check for gettid() function, always use if available
+- use syscall fallback on linux, if not
+- restrict thr_self() fallback to *only* FreeBSD
+- error out if there isn't any gettid impl
+
+[Retrieved from:
+https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/4c166709d06571b889a89812c962a91ba4d0a071]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build                | 3 +++
+ src/modules/module-rtkit.c | 8 ++++++--
+ 2 files changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 838fb66be..977ce9ba1 100644
+--- a/meson.build
++++ b/meson.build
+@@ -254,6 +254,9 @@ endif
+ if cc.has_function('getpagesize', prefix : '#include<unistd.h>')
+   cdata.set('HAVE_GETPAGESIZE', 1)
+ endif
++if cc.has_function('gettid', prefix : '#include<unistd.h>', args: [ '-D_GNU_SOURCE' ])
++  cdata.set('HAVE_GETTID', 1)
++endif
+ if cc.has_function('clock_gettime', prefix : '#include <time.h>')
+   cdata.set('HAVE_CLOCK_GETTIME', 1)
+ endif
+diff --git a/src/modules/module-rtkit.c b/src/modules/module-rtkit.c
+index 1f13aa371..7d55fb758 100644
+--- a/src/modules/module-rtkit.c
++++ b/src/modules/module-rtkit.c
+@@ -182,12 +182,16 @@ void pw_rtkit_bus_free(struct pw_rtkit_bus *system_bus)
+ 
+ static pid_t _gettid(void)
+ {
+-#ifndef __FreeBSD__
++#if defined(HAVE_GETTID)
+ 	return (pid_t) gettid();
+-#else
++#elif defined(__linux__)
++	return syscall(SYS_gettid);
++#elif defined(__FreeBSD__)
+ 	long pid;
+ 	thr_self(&pid);
+ 	return (pid_t)pid;
++#else
++#error "No gettid impl"
+ #endif
+ }
+ 
+-- 
+GitLab
+
diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 7c26e2ab29..bcba64c6ca 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  657db1b9a29ae17a9f1d9782a45bda2ba5a893fef55e1ca26453e8f7f2d4e64e  pipewire-0.3.27.tar.gz
+sha256  8b2af6138529fd9214dd148f2a6304f13c16e0b0d3a4a98c1afa87b7e65c574f  pipewire-0.3.32.tar.gz
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
-sha256  7db6138b0385e260ae8f09f050ea66c4e4fe775a11060d7f6ca2beb47f192d6f  LICENSE
+sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 71800589c3..b316d482d9 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.27
+PIPEWIRE_VERSION = 0.3.32
 PIPEWIRE_SITE = $(call github,PipeWire,pipewire,$(PIPEWIRE_VERSION))
-PIPEWIRE_LICENSE = MIT
+PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
 PIPEWIRE_LICENSE_FILES = COPYING LICENSE
 PIPEWIRE_INSTALL_STAGING = YES
 PIPEWIRE_DEPENDENCIES = host-pkgconf dbus $(TARGET_NLS_DEPENDENCIES)
@@ -61,6 +61,13 @@ else
 PIPEWIRE_CONF_OPTS += -Dalsa=disabled -Dpipewire-alsa=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_AVAHI),y)
+PIPEWIRE_CONF_OPTS += -Davahi=enabled
+PIPEWIRE_DEPENDENCIES += avahi
+else
+PIPEWIRE_CONF_OPTS += -Davahi=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_JACK2),y)
 PIPEWIRE_CONF_OPTS += -Dpipewire-jack=enabled -Djack=enabled
 PIPEWIRE_DEPENDENCIES += jack2
@@ -95,6 +102,13 @@ else
 PIPEWIRE_CONF_OPTS += -Dlibcamera=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+PIPEWIRE_CONF_OPTS += -Dlibusb=enabled
+PIPEWIRE_DEPENDENCIES += libusb
+else
+PIPEWIRE_CONF_OPTS += -Dlibusb=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)
 PIPEWIRE_CONF_OPTS += -Dvulkan=enabled
 PIPEWIRE_DEPENDENCIES += mesa3d
@@ -109,6 +123,13 @@ else
 PIPEWIRE_CONF_OPTS += -Dpw-cat=disabled -Dsndfile=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+PIPEWIRE_CONF_OPTS += -Dlibpulse=enabled
+PIPEWIRE_DEPENDENCIES += pulseaudio
+else
+PIPEWIRE_CONF_OPTS += -Dlibpulse=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_SDL2),y)
 PIPEWIRE_DEPENDENCIES += sdl2
 PIPEWIRE_CONF_OPTS += -Dsdl2=enabled
@@ -116,4 +137,11 @@ else
 PIPEWIRE_CONF_OPTS += -Dsdl2=disabled
 endif
 
+ifeq ($(WEBRTC_AUDIO_PROCESSING),y)
+PIPEWIRE_CONF_OPTS += -Decho-cancel-webrtc=enabled
+PIPEWIRE_DEPENDENCIES += webrtc-audio-processing
+else
+PIPEWIRE_CONF_OPTS += -Decho-cancel-webrtc=disabled
+endif
+
 $(eval $(meson-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
