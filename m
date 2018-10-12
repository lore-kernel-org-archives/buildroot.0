From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 12 Oct 2018 10:11:49 -0400
Subject: [Buildroot] [PATCH 1/1] erlang: always use Buildroot's zlib
Message-ID: <20181012141149.72489-1-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While Erlang includes a version of zlib, it's intended for Windows and
there's an expectation that non-Windows platforms provide it. It's also
not as regularly updated as the one in Buildroot. This change makes
Erlang always use a Buildroot-provided zlib.

Fixes this compile error:

 CC	/home/buildroot/autobuild/run/instance-0/output/build/erlang-21.0/erts/emulator/zlib/obj/x86_64-buildroot-linux-musl/opt/adler32.o
In file included from zlib/adler32.c:11:0:
zlib/zutil.h:172:39: error: "_LFS64_LARGEFILE" is not defined [-Werror=undef]
     (!defined(_LARGEFILE64_SOURCE) || _LFS64_LARGEFILE-0 == 0)
                                       ^~~~~~~~~~~~~~~~

See http://autobuild.buildroot.net/results/fc633f80c7c36a90e641487f5a888fbb767c2a54/.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/erlang/Config.in | 1 +
 package/erlang/erlang.mk | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 75ba17086a..ab87eab6ff 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -23,6 +23,7 @@ config BR2_PACKAGE_ERLANG
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
+	select BR2_PACKAGE_ZLIB
 	help
 	  Erlang is a programming language used to build massively
 	  scalable soft real-time systems with requirements on high
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 2ac903ffea..ca0aa0b770 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -64,10 +64,9 @@ else
 ERLANG_CONF_OPTS += --without-odbc
 endif
 
-ifeq ($(BR2_PACKAGE_ZLIB),y)
+# Always use Buildroot's zlib
 ERLANG_CONF_OPTS += --enable-shared-zlib
 ERLANG_DEPENDENCIES += zlib
-endif
 
 # Remove source, example, gs and wx files from staging and target.
 ERLANG_REMOVE_PACKAGES = gs wx
-- 
2.17.1
