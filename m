Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F254CAC5AC
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 15:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14B3A80C22;
	Tue, 23 Sep 2025 15:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1oYmIWwj2zH; Tue, 23 Sep 2025 15:55:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5031B80F26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5031B80F26;
	Tue, 23 Sep 2025 15:55:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C137E129
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 15:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3791409D9
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 15:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7MbeHtsICIsw for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 15:55:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3444140844
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3444140844
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3444140844
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 15:55:12 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-afcb7322da8so1050730866b.0
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 08:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758642911; x=1759247711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ey5bJP7f8b754ZmMAJtPW8JEfA02ZZsWcjCxH4Yro5E=;
 b=QvwXPLfBBz7ui1QVd7gn0/2/oNnW5cFgihfVgeQmiNIWhohdq8F1j3Xt8ABy1ywRpw
 vUMB6TmCMMaemeLN8eRm3vsQ0rk2XaOe5MGtf+hgkkoGw+ZrM50GpYLmLfNloj08aGq7
 3gzzLuiasBm4CVBZ7qQtNDmvhBZ5ivBDsPEgjZPgoCR3KVTtmurgICHbDjaxeCp3FKBo
 RKHcUNuvE495uxDp4tKw8kC/ZOwK7bqb/yZyvpqAMYVfA39spoNHAECsnVmjKI6/DAg5
 yRAs14dkeQUvOc30qpKYOKxzvLzirFDjbJFocsl1uDuVvqiDjOFQNNvptHekvZSvwU1H
 TzNw==
X-Gm-Message-State: AOJu0Yxb59dFwDW67iti7rc70lBgOpsrpXI52LqRuYcZwQ3PFZcuORKM
 cHFew8uR8RfZ2GI/WAskUeW/aQfJZDFjSgPbtplX6MKxQyVeya7y+62czsOaSYCelZgclL40KPS
 oGNJz2/U=
X-Gm-Gg: ASbGncvXht1Lr8q84bXAmDn5fmaUQ0T4nP+wv15fE9cVrLcWvJP27oLk485a0IzFkyV
 zZfkz2R1AcwVnzjHvAkm9MA9ABvN0SgV+G6AmbssetDBaym1GY+XlNZ/Fa/shAhaScYsXeLmg65
 dZQcw1Hudj0aDZlDC7u3lqNtfl3yNHOm7lSVrDAg70B3IHUTUl20Ytga2kv1Nspq7vbAzKleoHo
 SZKzJm56bs4O/hfm7aQcp2bHS2CrOogXYaehTVWgjsaV0oS0CDLecQHMHzT6L1KWElMMPtWC0QO
 A1dRMW9YG1lVknUZb+C78jgr1B+n8lK+K0+Y/uw7mB4ZeQ5t6YCXRANs1RDqrZyD2HdlkxCTgrO
 s/K2wIcfxmIfnB2NuoWbLeOrVeraXnRmAFnOfaE+9ChrIu07/auBdXZN2iKEqpvq3WBkqcwWiBQ
 kKI+NL6KJCeVwtURQsCstdrNfbtRQuB5EK8Cii9kNMlgVavP3vYjXYZepAh5NuhgzS
X-Google-Smtp-Source: AGHT+IFVKQWuv5u5h1r318UpmNW9QVUqAgvuJzAVOgslbxd/WnGrZ50vHxov5f8uDE5Vj/OKg6NNpg==
X-Received: by 2002:a17:907:7247:b0:b2c:b12f:429b with SMTP id
 a640c23a62f3a-b302d591789mr301774566b.62.1758642910765; 
 Tue, 23 Sep 2025 08:55:10 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b2adc17af65sm628174766b.19.2025.09.23.08.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 08:55:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 linux-amarula@amarulasolutions.com
Date: Tue, 23 Sep 2025 17:55:04 +0200
Message-ID: <20250923155504.2870790-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923155504.2870790-1-dario.binacchi@amarulasolutions.com>
References: <20250923155504.2870790-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758642911; x=1759247711;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ey5bJP7f8b754ZmMAJtPW8JEfA02ZZsWcjCxH4Yro5E=;
 b=gWBOXyzBKbRbxWDO+zyZENXLU4cPDIFZrvmkmMUZ6/dzaSTVxCadaxbxzwfqMfVjZn
 3KVH5IKMuTLxXFgt6Enn2tS1wWTv9OAkzctugPeYFMxbkaxnO8/bxCper79wlAlTYhOA
 KXACncbRvrYWydtzmcuQPF2/JrYmHbGR0/RQs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=gWBOXyzB
Subject: [Buildroot] [PATCH 2/2] package/drogon: new package
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

Drogon is a C++17/20 based HTTP application framework. It can be used to
easily build various types of web application server programs using C++.

Project page: https://github.com/drogonframework/drogon

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/Config.in.host                        |  1 +
 ...e-fix-cross-compiling-for-drogon_ctl.patch | 81 +++++++++++++++++++
 ...l-executables-to-bin-to-avoid-build-.patch | 47 +++++++++++
 ...ples-install-the-example-executables.patch | 31 +++++++
 package/drogon/Config.in                      | 42 ++++++++++
 package/drogon/Config.in.host                 | 20 +++++
 package/drogon/drogon.mk                      | 61 ++++++++++++++
 9 files changed, 285 insertions(+)
 create mode 100644 package/drogon/0001-cmake-fix-cross-compiling-for-drogon_ctl.patch
 create mode 100644 package/drogon/0002-examples-move-all-executables-to-bin-to-avoid-build-.patch
 create mode 100644 package/drogon/0003-examples-install-the-example-executables.patch
 create mode 100644 package/drogon/Config.in
 create mode 100644 package/drogon/Config.in.host
 create mode 100644 package/drogon/drogon.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4c6ff40886fb..b472f5aed869 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -808,6 +808,7 @@ F:	package/armadillo/
 F:	package/atf/
 F:	package/babeld/
 F:	package/cmocka/
+F:	package/drogon/
 F:	package/iana-assignments/
 F:	package/inih/
 F:	package/pocketpy/
diff --git a/package/Config.in b/package/Config.in
index 85928509f8f1..7748d4cb449f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2025,6 +2025,7 @@ menu "Networking"
 	source "package/davici/Config.in"
 	source "package/dht/Config.in"
 	source "package/dpdk/Config.in"
+	source "package/drogon/Config.in"
 	source "package/enet/Config.in"
 	source "package/filemq/Config.in"
 	source "package/fmlib/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index b0f7529a13f9..7850bf9c0cd6 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -30,6 +30,7 @@ menu "Host utilities"
 	source "package/dosfstools/Config.in.host"
 	source "package/doxygen/Config.in.host"
 	source "package/dracut/Config.in.host"
+	source "package/drogon/Config.in.host"
 	source "package/dtc/Config.in.host"
 	source "package/e2fsprogs/Config.in.host"
 	source "package/e2tools/Config.in.host"
diff --git a/package/drogon/0001-cmake-fix-cross-compiling-for-drogon_ctl.patch b/package/drogon/0001-cmake-fix-cross-compiling-for-drogon_ctl.patch
new file mode 100644
index 000000000000..70ec298cf5b8
--- /dev/null
+++ b/package/drogon/0001-cmake-fix-cross-compiling-for-drogon_ctl.patch
@@ -0,0 +1,81 @@
+From 3eda90ee8f46a9f309bf27e7faaf7f2dea1a7fde Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Tue, 23 Sep 2025 11:37:59 +0200
+Subject: [PATCH] cmake: fix cross-compiling for drogon_ctl
+
+Fix the the following errors raised by building drogon in Buildroot:
+
+[ 70%] Generating filter_cc.h, filter_cc.cc
+cd ~/buildroot/output/build/drogon-v1.9.11/drogon_ctl && ./_drogon_ctl create view ~/buildroot/output/build/drogon-v1.9.11/drogon_ctl/templates/config_yaml.csp
+cd ~/buildroot/output/build/drogon-v1.9.11/drogon_ctl && ./_drogon_ctl create view ~/buildroot/output/build/drogon-v1.9.11/drogon_ctl/templates/demoMain.csp
+cd ~/buildroot/output/build/drogon-v1.9.11/drogon_ctl && ./_drogon_ctl create view ~/buildroot/output/build/drogon-v1.9.11/drogon_ctl/templates/filter_cc.csp
+[ 71%] Generating test_main.h, test_main.cc
+cd ~/buildroot/output/build/drogon-v1.9.11/drogon_ctl && ./_drogon_ctl create view ~/buildroot/output/build/drogon-v1.9.11/drogon_ctl/templates/cmake.csp
+/bin/sh: 1: ./_drogon_ctl: Exec format error
+/bin/sh: 1: ./_drogon_ctl: Exec format error
+make[4]: *** [drogon_ctl/CMakeFiles/drogon_ctl.dir/build.make:88: drogon_ctl/config_yaml.h] Error 126
+make[4]: *** Waiting for unfinished jobs....
+make[4]: *** [drogon_ctl/CMakeFiles/drogon_ctl.dir/build.make:95: drogon_ctl/demoMain.h] Error 126
+/bin/sh: 1: ./_drogon_ctl: Exec format error
+make[4]: *** [drogon_ctl/CMakeFiles/drogon_ctl.dir/build.make:102: drogon_ctl/filter_cc.h] Error 126
+/bin/sh: 1: ./_drogon_ctl: Exec format error
+make[4]: *** [drogon_ctl/CMakeFiles/drogon_ctl.dir/build.make:74: drogon_ctl/cmake.h] Error 126
+
+When building drogon_ctl during cross-compilation, the host version of
+_drogon_ctl must be used to generate output files, since the target
+binary cannot run on the host.
+
+The change ensures that drogon_ctl builds correctly both for native and
+cross-compiling environments.
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/drogonframework/drogon/pull/2389/commits/3eda90ee8f46a9f309bf27e7faaf7f2dea1a7fde
+---
+ CMakeLists.txt            | 9 +++++++++
+ drogon_ctl/CMakeLists.txt | 3 ++-
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9cbc6d732a33..7cf091e90ef7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -524,6 +524,15 @@ if (BUILD_EXAMPLES)
+ endif (BUILD_EXAMPLES)
+ 
+ if (BUILD_CTL)
++    if (CMAKE_CROSSCOMPILING)
++        find_program(HOST_DROGON_CTL _drogon_ctl)
++        if (NOT HOST_DROGON_CTL)
++            message(FATAL_ERROR "_drogon_ctl not found on host system")
++        endif()
++        set(DROGON_CTL "${HOST_DROGON_CTL}")
++    else (CMAKE_CROSSCOMPILING)
++        set(DROGON_CTL "$<TARGET_FILE:_drogon_ctl>")
++    endif (CMAKE_CROSSCOMPILING)
+     add_subdirectory(drogon_ctl)
+ endif (BUILD_CTL)
+ 
+diff --git a/drogon_ctl/CMakeLists.txt b/drogon_ctl/CMakeLists.txt
+index 04b790d3741b..f6b12bddab60 100755
+--- a/drogon_ctl/CMakeLists.txt
++++ b/drogon_ctl/CMakeLists.txt
+@@ -43,7 +43,7 @@ foreach(cspFile ${SCP_LIST})
+   get_filename_component(classname ${cspFile} NAME_WE)
+   message(STATUS "view classname:" ${classname})
+   add_custom_command(OUTPUT ${classname}.h ${classname}.cc
+-                     COMMAND $<TARGET_FILE:_drogon_ctl>
++                     COMMAND ${DROGON_CTL}
+                              ARGS
+                              create
+                              view
+@@ -63,6 +63,7 @@ if(APPLE)
+   target_link_libraries(drogon_ctl PRIVATE resolv)
+ endif()
+ message(STATUS "bin:" ${INSTALL_BIN_DIR})
++install(TARGETS _drogon_ctl RUNTIME DESTINATION ${INSTALL_BIN_DIR})
+ install(TARGETS drogon_ctl RUNTIME DESTINATION ${INSTALL_BIN_DIR})
+ if(WIN32)
+   set(CTL_FILE $<TARGET_FILE:drogon_ctl>)
+-- 
+2.43.0
+
diff --git a/package/drogon/0002-examples-move-all-executables-to-bin-to-avoid-build-.patch b/package/drogon/0002-examples-move-all-executables-to-bin-to-avoid-build-.patch
new file mode 100644
index 000000000000..a6621195f902
--- /dev/null
+++ b/package/drogon/0002-examples-move-all-executables-to-bin-to-avoid-build-.patch
@@ -0,0 +1,47 @@
+From 77a8e3c91494ae094b5b1b18594ffaec11d37310 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Tue, 23 Sep 2025 17:15:56 +0200
+Subject: [PATCH] examples: move all executables to bin/ to avoid build
+ conflicts
+
+Example executables were previously created in the same folder as their
+source directories. This caused the following errors when building
+drogon in Buildroot:
+
+[ 82%] Linking CXX executable helloworld
+cd ~/buildroot/output/build/drogon-custom/examples && /usr/bin/cmake -E cmake_link_script CMakeFiles/helloworld.dir/link.txt --verbose=1
+~/buildroot/output/host/bin/aarch64-buildroot-linux-gnu-g++ --sysroot=~/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g0 -D_FORTIFY_SOURCE=1  -DNDEBUG CMakeFiles/helloworld.dir/helloworld/main.cc.o CMakeFiles/helloworld.dir/helloworld/HelloController.cc.o CMakeFiles/helloworld.dir/helloworld/HelloViewController.cc.o CMakeFiles/helloworld.dir/HelloView.cc.o -o helloworld  -Wl,-rpath,~/buildroot/output/build/drogon-custom:~/buildroot/output/build/drogon-custom/trantor ../libdrogon.so.1.9.11 ../trantor/libtrantor.so.1.5.24 ~/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libjsoncpp.so
+~/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-gnu/13.4.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: cannot open output file helloworld: Is a directory
+collect2: error: ld returned 1 exit status
+make[4]: *** [examples/CMakeFiles/helloworld.dir/build.make:155: examples/helloworld] Error 1
+make[3]: *** [CMakeFiles/Makefile2:385: examples/CMakeFiles/helloworld.dir/all] Error 2
+
+Move all example applications to a dedicated RUNTIME_OUTPUT_DIRECTORY
+(build/examples/bin) to avoid conflicts between source directories
+and generated binaries.
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/drogonframework/drogon/pull/2389/commits/77a8e3c91494ae094b5b1b18594ffaec11d37310
+---
+ examples/CMakeLists.txt | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
+index dca122f424ba..9d4b91d37034 100755
+--- a/examples/CMakeLists.txt
++++ b/examples/CMakeLists.txt
+@@ -50,6 +50,11 @@ set(example_targets
+     async_stream
+     cors)
+ 
++foreach(target ${example_targets})
++    set_target_properties(${target} PROPERTIES
++        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
++endforeach()
++
+ # Add warnings for our example targets--some warnings (such as -Wunused-parameter) only appear
+ # when the templated functions are instantiated at their point of use.
+ if(NOT ${CMAKE_PLATFORM_NAME} STREQUAL "Windows" AND CMAKE_CXX_COMPILER_ID MATCHES GNU)
+-- 
+2.43.0
+
diff --git a/package/drogon/0003-examples-install-the-example-executables.patch b/package/drogon/0003-examples-install-the-example-executables.patch
new file mode 100644
index 000000000000..e8e7383d2ab1
--- /dev/null
+++ b/package/drogon/0003-examples-install-the-example-executables.patch
@@ -0,0 +1,31 @@
+From 535892bf6958c8d5619251ead204ada0002a8674 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Tue, 23 Sep 2025 17:21:28 +0200
+Subject: [PATCH] examples: install the example executables
+
+This allows the examples to be used on the target system without
+manually copying them, improving usability.
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/drogonframework/drogon/pull/2389/commits/535892bf6958c8d5619251ead204ada0002a8674
+---
+ examples/CMakeLists.txt | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
+index 9d4b91d37034..61e65d8323aa 100755
+--- a/examples/CMakeLists.txt
++++ b/examples/CMakeLists.txt
+@@ -55,6 +55,9 @@ foreach(target ${example_targets})
+         RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
+ endforeach()
+ 
++install(TARGETS ${example_targets}
++    RUNTIME DESTINATION ${INSTALL_BIN_DIR})
++
+ # Add warnings for our example targets--some warnings (such as -Wunused-parameter) only appear
+ # when the templated functions are instantiated at their point of use.
+ if(NOT ${CMAKE_PLATFORM_NAME} STREQUAL "Windows" AND CMAKE_CXX_COMPILER_ID MATCHES GNU)
+-- 
+2.43.0
+
diff --git a/package/drogon/Config.in b/package/drogon/Config.in
new file mode 100644
index 000000000000..18c20950bb69
--- /dev/null
+++ b/package/drogon/Config.in
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_DROGON
+	bool "drogon"
+	depends on BR2_ARCH_IS_64
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11 # C++17/20
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_ZLIB
+	help
+	  Drogon is a C++17/20 based HTTP application framework.
+	  Drogon can be used to easily build various types of web
+	  application server programs using C++.
+
+	  https://github.com/drogonframework/drogon
+
+if BR2_PACKAGE_DROGON
+
+config BR2_PACKAGE_DROGON_BROTLI
+	bool "build Brotli"
+
+config BR2_PACKAGE_DROGON_CTL
+	bool "build drogon_ctl"
+	select BR2_PACKAGE_HOST_DROGON
+
+config BR2_PACKAGE_DROGON_EXAMPLES
+	bool "build examples"
+
+config BR2_PACKAGE_DROGON_ORM
+	bool "build orm"
+
+config BR2_PACKAGE_DROGON_YAML_CONFIG
+	bool "build yaml config"
+
+endif
+
+comment "drogon needs a toolchain w/ C++, threads, gcc >= 11"
+	depends on BR2_ARCH_IS_64
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/drogon/Config.in.host b/package/drogon/Config.in.host
new file mode 100644
index 000000000000..b3b691e2cfe2
--- /dev/null
+++ b/package/drogon/Config.in.host
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_HOST_DROGON
+	bool "drogon"
+	depends on BR2_HOST_INSTALL_LIBSTDCPP
+	depends on BR2_HOST_TOOLCHAIN_GCC_AT_LEAST_11 # C++17/20
+	depends on BR2_HOST_TOOLCHAIN_HAS_THREADS
+	select BR2_HOST_PACKAGE_JSONCPP
+	select BR2_HOST_PACKAGE_UTIL_LINUX
+	select BR2_HOST_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_HOST_PACKAGE_ZLIB
+	help
+	  Drogon is a C++17/20 based HTTP application framework.
+	  Drogon can be used to easily build various types of web
+	  application server programs using C++.
+
+	  https://github.com/drogonframework/drogon
+
+comment "drogon needs a toolchain w/ C++, threads, gcc >= 11"
+	depends on !BR2_HOST_INSTALL_LIBSTDCPP || \
+		!BR2_HOST_TOOLCHAIN_GCC_AT_LEAST_11 || \
+		!BR2_HOST_TOOLCHAIN_HAS_THREADS
diff --git a/package/drogon/drogon.mk b/package/drogon/drogon.mk
new file mode 100644
index 000000000000..544dc3fd5c3a
--- /dev/null
+++ b/package/drogon/drogon.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# drogon
+#
+################################################################################
+
+DROGON_VERSION = v1.9.11
+# DROGON_SITE = $(call github,drogonframework,drogon,v$(DROGON_VERSION))
+DROGON_SITE = https://github.com/drogonframework/drogon
+DROGON_SITE_METHOD = git
+DROGON_GIT_SUBMODULES = YES
+DROGON_LICENSE = MIT
+DROGON_LICENSE_FILES = LICENSE
+
+DROGON_DEPENDENCIES = jsoncpp util-linux zlib
+HOST_DROGON_DEPENDENCIES = host-jsoncpp host-util-linux host-zlib
+
+DROGON_CONF_OPTS = \
+	-DBUILD_TESTS=OFF
+
+HOST_DROGON_CONF_OPTS = \
+	-DBUILD_TESTS=OFF \
+	-DBUILD_EXAMPLES=OFF
+
+ifeq ($(BR2_PACKAGE_DROGON_BROTLI),y)
+DROGON_CONF_OPTS += -DBUILD_BROTLI=ON
+else
+DROGON_CONF_OPTS += -DBUILD_BROTLI=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_DROGON_CTL),y)
+# When we have drogon_ctl for the target, we need to build the
+# _drogon_ctl tool with host-drogon support so that it can be
+# run during the building process
+DROGON_DEPENDENCIES += host-drogon
+DROGON_CONF_OPTS += -DBUILD_CTL=ON
+HOST_DROGON_CONF_OPTS += -DBUILD_CTL=ON
+else
+DROGON_CONF_OPTS += -DBUILD_CTL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_DROGON_EXAMPLES),y)
+DROGON_CONF_OPTS += -DBUILD_EXAMPLES=ON
+else
+DROGON_CONF_OPTS += -DBUILD_EXMPLES=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_DROGON_ORM),y)
+DROGON_CONF_OPTS += -DBUILD_ORM=ON
+else
+DROGON_CONF_OPTS += -DBUILD_ORM=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_DROGON_YAML_CONFIG),y)
+DROGON_CONF_OPTS += -DBUILD_YAML_CONFIG=ON
+else
+DROGON_CONF_OPTS += -DBUILD_YAML_CONFIG=OFF
+endif
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
