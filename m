From: Wojciech Nizinski <niziak@spox.org>
Date: Mon, 6 Mar 2017 09:47:17 +0100
Subject: [Buildroot] [PATCH 1/1] lzlib: add LuaJIT support
In-Reply-To: <20170222110813.76e8d38c@free-electrons.com>
References: <1487753715-21961-1-git-send-email-niziak@spox.org>
 <20170222110813.76e8d38c@free-electrons.com>
Message-ID: <4dc526ef-e8a2-9f9c-bf3a-3b4aa3c47d62@spox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 22.02.2017 11:08, Thomas Petazzoni wrote:
> Thanks for your contribution. See some comments below.
>
>> diff --git a/package/lzlib/0001-FindLua.cmake-support-for-LuaJIT.patch b/package/lzlib/0001-FindLua.cmake-support-for-LuaJIT.patch
>> new file mode 100644
>> index 000000000..30e29aae8
>> --- /dev/null
>> +++ b/package/lzlib/0001-FindLua.cmake-support-for-LuaJIT.patch
>> @@ -0,0 +1,67 @@
>> +From 4cedebed4746f1bcc3dc1a3e0c0bc7251153aeca Mon Sep 17 00:00:00 2001
>> +From: Wojciech Nizinski <niziak@spox.org>
>> +Date: Tue, 21 Feb 2017 12:51:31 +0100
>> +Subject: [PATCH] FindLua.cmake: support for LuaJIT
>> +
> This patch needs your SoB line.
>
> Also, since this is kind of a feature patch, we will most likely not
> accept it in Buildroot unless it is accepted upstream. Have you
> submitted this patch to the upstream lzlib project?
I've created pull request on GitHub project on the same day.
https://github.com/LuaDist/lzlib/pull/7)


Here is patch with SoB line:


Signed-off-by: Wojciech Nizinski <niziak@spox.org>
---
  .../0001-FindLua.cmake-support-for-LuaJIT.patch    | 68 
++++++++++++++++++++++
  package/lzlib/Config.in                            |  2 +-
  package/lzlib/lzlib.mk                             |  9 ++-
  3 files changed, 77 insertions(+), 2 deletions(-)
  create mode 100644 
package/lzlib/0001-FindLua.cmake-support-for-LuaJIT.patch

diff --git a/package/lzlib/0001-FindLua.cmake-support-for-LuaJIT.patch 
b/package/lzlib/0001-FindLua.cmake-support-for-LuaJIT.patch
new file mode 100644
index 000000000..883c0f81f
--- /dev/null
+++ b/package/lzlib/0001-FindLua.cmake-support-for-LuaJIT.patch
@@ -0,0 +1,68 @@
+From 4cedebed4746f1bcc3dc1a3e0c0bc7251153aeca Mon Sep 17 00:00:00 2001
+From: Wojciech Nizinski <w.nizinski@grinn-global.com>
+Date: Tue, 21 Feb 2017 12:51:31 +0100
+Subject: [PATCH 1/1] FindLua.cmake: support for LuaJIT
+
+Signed-off-by: Wojciech Nizinski <niziak@spox.org>
+---
+ cmake/FindLua.cmake | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/cmake/FindLua.cmake b/cmake/FindLua.cmake
+index 7fb7ca3..0fdf235 100644
+--- a/cmake/FindLua.cmake
++++ b/cmake/FindLua.cmake
+@@ -34,7 +34,7 @@
+ # Always search for non-versioned lua first (recommended)
+ SET(_POSSIBLE_LUA_INCLUDE include include/lua)
+ SET(_POSSIBLE_LUA_EXECUTABLE lua)
+-SET(_POSSIBLE_LUA_LIBRARY lua)
++SET(_POSSIBLE_LUA_LIBRARY lua luajit)
+
+ # Determine possible naming suffixes (there is no standard for this)
+ IF(Lua_FIND_VERSION_MAJOR AND Lua_FIND_VERSION_MINOR)
+@@ -43,17 +43,25 @@ ELSE(Lua_FIND_VERSION_MAJOR AND 
Lua_FIND_VERSION_MINOR)
+   SET(_POSSIBLE_SUFFIXES "52" "5.2" "-5.2" "51" "5.1" "-5.1")
+ ENDIF(Lua_FIND_VERSION_MAJOR AND Lua_FIND_VERSION_MINOR)
+
++MESSAGE(STATUS "Possible suffixes: ${_POSSIBLE_SUFFIXES}")
++
+ # Set up possible search names and locations
+ FOREACH(_SUFFIX ${_POSSIBLE_SUFFIXES})
+   LIST(APPEND _POSSIBLE_LUA_INCLUDE "include/lua${_SUFFIX}")
+   LIST(APPEND _POSSIBLE_LUA_EXECUTABLE "lua${_SUFFIX}")
+   LIST(APPEND _POSSIBLE_LUA_LIBRARY "lua${_SUFFIX}")
++  LIST(APPEND _POSSIBLE_LUA_LIBRARY "luajit${_SUFFIX}")
+ ENDFOREACH(_SUFFIX)
+
++MESSAGE (STATUS "Possible LUA library names: ${_POSSIBLE_LUA_LIBRARY}")
++MESSAGE (STATUS "Possible LUA include dirs: ${_POSSIBLE_LUA_INCLUDE}")
++MESSAGE (STATUS "Possible LUA executable: ${_POSSIBLE_LUA_EXECUTABLE}")
++
+ # Find the lua executable
+ FIND_PROGRAM(LUA_EXECUTABLE
+   NAMES ${_POSSIBLE_LUA_EXECUTABLE}
+ )
++MESSAGE (STATUS "Found LUA executable: ${LUA_EXECUTABLE}")
+
+ # Find the lua header
+ FIND_PATH(LUA_INCLUDE_DIR lua.h
+@@ -70,6 +78,7 @@ FIND_PATH(LUA_INCLUDE_DIR lua.h
+   /opt/csw # Blastwave
+   /opt
+ )
++MESSAGE (STATUS "Found LUA header: ${LUA_INCLUDE_DIR}")
+
+ # Find the lua library
+ FIND_LIBRARY(LUA_LIBRARY
+@@ -87,6 +96,7 @@ FIND_LIBRARY(LUA_LIBRARY
+   /opt/csw
+   /opt
+ )
++MESSAGE (STATUS "Found LUA lib: ${LUA_LIBRARY}")
+
+ IF(LUA_LIBRARY)
+   # include the math library for Unix
+--
+2.11.0
+
diff --git a/package/lzlib/Config.in b/package/lzlib/Config.in
index 32328c5ec..f7fae1579 100644
--- a/package/lzlib/Config.in
+++ b/package/lzlib/Config.in
@@ -1,7 +1,7 @@
  config BR2_PACKAGE_LZLIB
      bool "lzlib"
      select BR2_PACKAGE_ZLIB
-    depends on BR2_PACKAGE_LUA
+    depends on BR2_PACKAGE_HAS_LUAINTERPRETER
      help
        This package provides a library to access zlib library
        functions and also to read/write gzip files using an
diff --git a/package/lzlib/lzlib.mk b/package/lzlib/lzlib.mk
index f468a1c83..c3de5ccd7 100644
--- a/package/lzlib/lzlib.mk
+++ b/package/lzlib/lzlib.mk
@@ -6,7 +6,14 @@

  LZLIB_VERSION = 0.4.3
  LZLIB_SITE = $(call github,LuaDist,lzlib,$(LZLIB_VERSION))
-LZLIB_DEPENDENCIES = lua zlib
+LZLIB_DEPENDENCIES = zlib
+
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+LZLIB_DEPENDENCIES += luajit
+else
+LZLIB_DEPENDENCIES += lua
+endif
+
  LZLIB_LICENSE = MIT
  LZLIB_CONF_OPTS = 
-DINSTALL_CMOD="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)" \
      -DINSTALL_LMOD="/usr/share/lua/$(LUAINTERPRETER_ABIVER)"
-- 
2.11.0
