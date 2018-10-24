From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 13:58:03 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] erlang: always use
 Buildroot's zlib
Message-ID: <20181024115621.28690888E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f148f4a5cf0e53e0ae36b7ce0e7b438a650efa4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ec5378038f80f444ce7f5106283c7cccb8faae16)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/erlang/Config.in | 1 +
 package/erlang/erlang.mk | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index bf745555e8..00e8ab14d7 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -22,6 +22,7 @@ config BR2_PACKAGE_ERLANG
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
+	select BR2_PACKAGE_ZLIB
 	help
 	  Erlang is a programming language used to build massively
 	  scalable soft real-time systems with requirements on high
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index b7fdb6b9ce..a7d7168082 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -69,10 +69,9 @@ else
 ERLANG_CONF_OPTS += --without-odbc
 endif
 
-ifeq ($(BR2_PACKAGE_ZLIB),y)
+# Always use Buildroot's zlib
 ERLANG_CONF_OPTS += --enable-shared-zlib
 ERLANG_DEPENDENCIES += zlib
-endif
 
 # Remove source, example, gs and wx files from staging and target.
 ERLANG_REMOVE_PACKAGES = gs wx
