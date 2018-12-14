From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Dec 2018 22:04:49 +0100
Subject: [Buildroot] [git commit] package/luvi: add upstream patch to fix
 runtime issue with CMake 3.12+
Message-ID: <20181214210115.6A0FB8CA6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56d2ac54dd6ff111cc1c6b2221903ccaf84de188
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

luvi fails to run when it was build with CMake 3.12+:

```
[string "return require('init')(...)"]:1: module 'init' not found:
	no field package.preload['init']
	no file './init.lua'
	no file '/usr/share/luajit-2.0.5/init.lua'
	no file '/usr/local/share/lua/5.1/init.lua'
	no file '/usr/local/share/lua/5.1/init/init.lua'
	no file '/usr/share/lua/5.1/init.lua'
	no file '/usr/share/lua/5.1/init/init.lua'
	no file './init.so'
	no file '/usr/local/lib/lua/5.1/init.so'
	no file '/usr/lib/lua/5.1/init.so'
	no file '/usr/local/lib/lua/5.1/loadall.so'
```

Looking at link.txt for the luvi executable shows that `-rdynamic` is
not set anymore in CMake 3.12. This has the effect, that symbols are
missing in the `.dynsym` section in the binary.

The patch, sets `ENABLE_EXPORTS` to true in CMakeLists.txt to force setting
`-rdynamic` explicitly.

Upstream status: b8781653dcb8815a3019a77baf4f3b7f7a255ebe

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...2-luvi-executable-needs-to-export-symbols.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/luvi/0002-luvi-executable-needs-to-export-symbols.patch b/package/luvi/0002-luvi-executable-needs-to-export-symbols.patch
new file mode 100644
index 0000000000..74b6537f9b
--- /dev/null
+++ b/package/luvi/0002-luvi-executable-needs-to-export-symbols.patch
@@ -0,0 +1,53 @@
+From 1ea2c1e372ab59b9a633a51f0dcefc24328528f1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Mon, 10 Sep 2018 08:18:38 +0200
+Subject: [PATCH] luvi executable needs to export symbols
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Using CMake 3.12 running luvi fails with:
+
+```
+[string "return require('init')(...)"]:1: module 'init' not found:
+	no field package.preload['init']
+	no file './init.lua'
+	no file '/usr/share/luajit-2.0.5/init.lua'
+	no file '/usr/local/share/lua/5.1/init.lua'
+	no file '/usr/local/share/lua/5.1/init/init.lua'
+	no file '/usr/share/lua/5.1/init.lua'
+	no file '/usr/share/lua/5.1/init/init.lua'
+	no file './init.so'
+	no file '/usr/local/lib/lua/5.1/init.so'
+	no file '/usr/lib/lua/5.1/init.so'
+	no file '/usr/local/lib/lua/5.1/loadall.so'
+```
+
+Looking at link.txt for the luvi executable shows that `-rdynamic` is
+not set anymore in CMake 3.12. This has the effect, that symbols are
+missing in the `.dynsym` section.
+
+Therefore, set `ENABLE_EXPORTS` to true which set `-rdynamic` explicitly.
+
+Upstream status: b8781653dcb8815a3019a77baf4f3b7f7a255ebe
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e141f8e..8219d0b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -158,6 +158,7 @@ if("${CMAKE_SYSTEM_NAME}" MATCHES "Linux")
+ endif()
+ 
+ target_link_libraries(luvi ${LUVI_LIBRARIES} ${EXTRA_LIBS} ${CMAKE_THREAD_LIBS_INIT})
++set_target_properties(luvi PROPERTIES ENABLE_EXPORTS ON)
+ 
+ ###############################################################################
+ ## Installation Targets
+-- 
+2.19.1
+
