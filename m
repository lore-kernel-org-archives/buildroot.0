Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4007105F797
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 11:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 252E160B71;
	Fri, 13 Mar 2026 11:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SiTOh_iTMo2C; Fri, 13 Mar 2026 11:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E02A260B6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773400077;
	bh=UVzbWVZ4joeb64P4iogCbG7eKMo2l9ElU4D7WlMIQyU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ShKPSjRKfWafCaTMsnN+6htEsBf/9hjzXeQErorZYS0uHQlTCgO1BpijeFtL33Zn7
	 In6h0LKVEMfYoOZHp3R9fUuJWBYvjzyneRGVzOiYJXQskhe+oiITYP3MP0lPzJotpd
	 iZeiZsqHPNOA5ce7nrUCtCsrLUPa8lBN7z6k/P73WAUItG5w4GxH6snWY71aD1hHe2
	 thaBOA19g9saObQI06p/e+FKBPrWbP/jzDS6m2Eg9JT9GZ3XKcaeWvzGpJuJMzzKLD
	 CnrfPgCBBJUA0svllnXBHb08mIrRGO49VvPHTGl1bQLwOuenKjonp4pSmptyVIURgt
	 K9wHxJyv3feKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E02A260B6E;
	Fri, 13 Mar 2026 11:07:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C271E1AF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 11:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A786860B6C
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 11:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NreyxpLCE8j1 for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 11:07:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D6AB760AC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6AB760AC6
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6AB760AC6
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 11:07:53 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c73eb827becso167768a12.2
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 04:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773400072; x=1774004872;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M5TO1QfqGINaYM/YtRQa9X8CLG5oHWEyiGEba7/ksZw=;
 b=UKa+vq8/7a9WPQO38hSddV+MIo3YNVpEUUTDGWuUQNnX6l/Zlbxy4PFdnPyuIMWaKd
 0dqbl6rMZ2Ubh4TnGVgCwvwZiMQud/DfkdYYw8mItnwG0YT1twFGptfUmpmwc7ESwuns
 exBlaPRthOs+82rYGbtYSodkd+14MsIhjt5cuH8TLSAGWc/0KDZWC/0Q4s3lABbNWIlK
 NzkA/bfYegi3VmY/+zXLqOJ+c9jatKoZHYuYB97VaSVTRc1Ws4JSDBjGrgmWW2/iWd8e
 rQSMBNKmPZIBbwt9JH+k5wIkIsy1XUdAkHKYOyyBr8DtBGWGO++9JecHCAI+BWNlTmfq
 +1vg==
X-Gm-Message-State: AOJu0Yw2BXCv+jfowrP1S98nxwQWLIf2D6Y+i5VqW42zmPHYIHnSlQCC
 DkoJiN9PD/3OLCf3bRNcUbwdgsxelAnE1rUeawg0D2OS2IMACGdRINCJRqFrUg==
X-Gm-Gg: ATEYQzyz7AKplcJU3Uvs/WykM50JDC4RmtGBO56POlqm5jEwtFRSKVNOAO530hriPFX
 nO5BXiPEagjJk1pqJuDpRDDiWwX1ZSGXZAkk8ZFoHncAywDn1Il1WvXDdZZRivn6t5yuSyubd0e
 laS9893tEQ+/5CITBFNZq0gAtn6V3fwudLZm++Qql/0lO2LrAld6SD/85HQPpukHxc8eHaf6GhO
 qJuY5Si1+0HzxcAYiqW6rowyS/9yg21nbbQ4exfhxSRoBJNexsq49cRlw/EJK84RTc4XsrR7O5T
 GZfaSE243JmiWHh1CTENbHzqycNUqp4h8xw3O2ygMPAp3m1DRCrabAYf23uDfo9KdkwNy7/yAJb
 MxrhRKFDEJaA719+6vYLWLUuhsmaFJPagWusps0xXdytczHjEcMonca/WVyIO9WzsIdgTO+ayew
 diLn3v6UgFpWWw8gPR2yT7YsszHViv7qcf
X-Received: by 2002:a17:903:11d2:b0:2ae:5763:99cd with SMTP id
 d9443c01a7336-2aecac9b8a6mr28012685ad.49.1773400072280; 
 Fri, 13 Mar 2026 04:07:52 -0700 (PDT)
Received: from fedora ([2409:40e5:1055:572c:8b0:ced8:a8df:a66])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2aece81378fsm25959655ad.66.2026.03.13.04.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 04:07:51 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri, 13 Mar 2026 16:37:38 +0530
Message-ID: <20260313110739.90948-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773400072; x=1774004872; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M5TO1QfqGINaYM/YtRQa9X8CLG5oHWEyiGEba7/ksZw=;
 b=V2OrBz7evjWrgp9plCm3VaiTE3W3zmVWcjyn7qfmzh7Tt3bf1KK/G4xPQsnS0zHV/v
 yDwQTyXdhgeKAsfb/SZW7iktFeyZl29krNikRMYPdjtksYiOW7xn9d8qFsQwkJyeFHV2
 QcqMr8QrpIuxybTdr+yPePalW0JGzha+SUPPeLRV9DW83VRpi7YqG6UzW+PUAlKi0Bg9
 bfpMmFB27af0VY0SSgl44xiXWgoEumO+qIkPDlA8ZSBbEqLEO+mkwkurVEktBtKxZLlV
 LieI7eKV4J+T3BeIwRM4M694tWhdfB71pcm9r9UZOI25aa7AWcdz94Lcxv21EApq3s3d
 C6EA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V2OrBz7e
Subject: [Buildroot] [PATCH] package/host-ccache: force use of BR_CACHE_DIR
 instead of user directories
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

Override ccache's default cache directory paths to use Buildroot's
BR_CACHE_DIR environment variable instead of CCACHE_DIR and XDG
standard directories.

By default, ccache stores its cache in user home directories
(~/.ccache, ~/.cache/ccache, ~/.config/ccache) based on XDG_CACHE_HOME
and XDG_CONFIG_HOME environment variables. This causes issues in
Buildroot because:

 - Pollutes user home directories during builds
 - Breaks reproducibility across different build environments
 - Complicates cache management in CI/CD systems
 - May cause permission issues in shared build systems

This patch modifies ccache source to:
 - Replace util::getenv_path("CCACHE_DIR") with "BR_CACHE_DIR"
 - Replace hardcoded paths (.ccache, .cache/ccache, .config/ccache)
   with Buildroot's HOST_CCACHE_DEFAULT_CCACHE_DIR
 - Disable XDG_CACHE_HOME, XDG_CONFIG_HOME, and XDG_RUNTIME_DIR lookups
 - Update command-line option handling to use BR_CACHE_DIR

This ensures ccache respects Buildroot's cache directory configuration
and avoids user home directory pollution.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 ...ost-ccache-force-use-of-BR_CACHE_DIR.patch | 108 ++++++++++++++++++
 package/ccache/ccache.mk                      |  11 +-
 2 files changed, 110 insertions(+), 9 deletions(-)
 create mode 100644 package/ccache/0001-package-host-ccache-force-use-of-BR_CACHE_DIR.patch

diff --git a/package/ccache/0001-package-host-ccache-force-use-of-BR_CACHE_DIR.patch b/package/ccache/0001-package-host-ccache-force-use-of-BR_CACHE_DIR.patch
new file mode 100644
index 0000000000..a990c43dd2
--- /dev/null
+++ b/package/ccache/0001-package-host-ccache-force-use-of-BR_CACHE_DIR.patch
@@ -0,0 +1,108 @@
+From 5140c64cdd2d469ff5be7f94cc11de928cbe585a Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Fri, 13 Mar 2026 15:38:53 +0530
+Subject: [PATCH] package/host-ccache: force use of BR_CACHE_DIR.
+
+Override ccache's default cache directory paths to use Buildroot's
+BR_CACHE_DIR environment variable instead of CCACHE_DIR and XDG
+standard directories.
+
+By default, ccache stores its cache in user home directories
+(~/.ccache, ~/.cache/ccache, ~/.config/ccache) based on XDG_CACHE_HOME
+and XDG_CONFIG_HOME environment variables. This causes issues in
+Buildroot because:
+
+ - Pollutes user home directories during builds
+ - Breaks reproducibility across different build environments
+ - Complicates cache management in CI/CD systems
+ - May cause permission issues in shared build systems
+
+This patch modifies ccache source to:
+ - Replace util::getenv_path("CCACHE_DIR") with "BR_CACHE_DIR"
+ - Replace hardcoded paths (.ccache, .cache/ccache, .config/ccache)
+   with Buildroot's HOST_CCACHE_DEFAULT_CCACHE_DIR
+ - Disable XDG_CACHE_HOME, XDG_CONFIG_HOME, and XDG_RUNTIME_DIR lookups
+ - Update command-line option handling to use BR_CACHE_DIR
+
+This ensures ccache respects Buildroot's cache directory configuration
+and avoids user home directory pollution.
+
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ src/ccache/config.cpp           | 14 +++++++-------
+ src/ccache/core/mainoptions.cpp |  2 +-
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/ccache/config.cpp b/src/ccache/config.cpp
+index a4f67d8..1a6e130 100644
+--- a/src/ccache/config.cpp
++++ b/src/ccache/config.cpp
+@@ -500,7 +500,7 @@ default_cache_dir(const fs::path& home_dir)
+ #  ifdef __APPLE__
+   return home_dir / "Library/Caches/ccache";
+ #  else
+-  return home_dir / ".cache/ccache";
++  return home_dir / HOST_CCACHE_DEFAULT_CCACHE_DIR;
+ #  endif
+ }
+ 
+@@ -510,7 +510,7 @@ default_config_dir(const fs::path& home_dir)
+ #  ifdef __APPLE__
+   return home_dir / "Library/Preferences/ccache";
+ #  else
+-  return home_dir / ".config/ccache";
++  return home_dir / HOST_CCACHE_DEFAULT_CCACHE_DIR;
+ #  endif
+ }
+ 
+@@ -598,13 +598,13 @@ Config::read(const std::vector<std::string>& cmdline_config_settings)
+     create_cmdline_settings_map(cmdline_config_settings);
+ 
+   const fs::path home_dir = home_directory();
+-  const util::DirEntry legacy_ccache_dir = home_dir / ".ccache";
++  const util::DirEntry legacy_ccache_dir = home_dir / HOST_CCACHE_DEFAULT_CCACHE_DIR;
+ #ifdef _WIN32
+   auto env_appdata = util::getenv_path("APPDATA");
+   auto env_local_appdata = util::getenv_path("LOCALAPPDATA");
+ #else
+-  auto env_xdg_cache_home = util::getenv_path("XDG_CACHE_HOME");
+-  auto env_xdg_config_home = util::getenv_path("XDG_CONFIG_HOME");
++  auto env_xdg_cache_home = std::optional<fs::path>(std::nullopt);
++  auto env_xdg_config_home = std::optional<fs::path>(std::nullopt);
+ #endif
+ 
+   auto env_ccache_configpath = util::getenv_path("CCACHE_CONFIGPATH");
+@@ -627,7 +627,7 @@ Config::read(const std::vector<std::string>& cmdline_config_settings)
+     // A missing config file in SYSCONFDIR is OK so don't check return value.
+     update_from_file(system_config_path());
+ 
+-    auto env_ccache_dir = util::getenv_path("CCACHE_DIR");
++    auto env_ccache_dir = util::getenv_path("BR_CACHE_DIR");
+     auto cmdline_cache_dir = cmdline_settings_map.find("cache_dir");
+ 
+     fs::path config_dir;
+@@ -1232,7 +1232,7 @@ Config::default_temporary_dir() const
+ {
+   static const fs::path run_user_tmp_dir = [] {
+ #ifndef _WIN32
+-    const char* const xdg_runtime_dir = getenv("XDG_RUNTIME_DIR");
++    const char* const xdg_runtime_dir = nullptr;
+     if (xdg_runtime_dir && DirEntry(xdg_runtime_dir).is_directory()) {
+       fs::path dir = FMT("{}/ccache-tmp", xdg_runtime_dir);
+       if (fs::create_directories(dir) && access(dir.c_str(), W_OK) == 0) {
+diff --git a/src/ccache/core/mainoptions.cpp b/src/ccache/core/mainoptions.cpp
+index d253ebc..9ad2824 100644
+--- a/src/ccache/core/mainoptions.cpp
++++ b/src/ccache/core/mainoptions.cpp
+@@ -527,7 +527,7 @@ process_main_options(int argc, const char* const* argv)
+ 
+     switch (c) {
+     case 'd': // --dir
+-      util::setenv("CCACHE_DIR", arg);
++      util::setenv("BR_CACHE_DIR", arg);
+       break;
+     case FORMAT:
+       if (arg == "tab") {
+-- 
+2.53.0
+
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 30f87f7d90..f2f73a115d 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -42,16 +42,9 @@ HOST_CCACHE_CONF_OPTS += \
 #    so rewrite BR_CACHE_DIR to take that into consideration for SDK purpose
 HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,%,$(BR_CACHE_DIR))
 
-define HOST_CCACHE_PATCH_CONFIGURATION
-	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/ccache/config.cpp
-	sed -i 's,".ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/config.cpp
-	sed -i 's,"/.cache/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/config.cpp
-	sed -i 's,"/.config/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/config.cpp
-	sed -i 's,getenv("XDG_CACHE_HOME"),nullptr,' $(@D)/src/ccache/config.cpp
-	sed -i 's,getenv("XDG_CONFIG_HOME"),nullptr,' $(@D)/src/ccache/config.cpp
-endef
+HOST_CCACHE_CONF_OPTS += \
+	-DCMAKE_CXX_FLAGS='$(HOST_CXXFLAGS) -DHOST_CCACHE_DEFAULT_CCACHE_DIR=\"$(HOST_CCACHE_DEFAULT_CCACHE_DIR)\"'
 
-HOST_CCACHE_POST_PATCH_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
 
 define HOST_CCACHE_MAKE_CACHE_DIR
 	mkdir -p $(BR_CACHE_DIR)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
