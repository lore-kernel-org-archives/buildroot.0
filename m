From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Aug 2015 21:23:18 +0200
Subject: [Buildroot] [PATCH 2/2 v2] package/protobuf: needs dynamic libraries
In-Reply-To: <cover.1439925738.git.yann.morin.1998@free.fr>
References: <cover.1439925738.git.yann.morin.1998@free.fr>
Message-ID: <f3cf57fe430940d32733da671c2a9bbac56b1cb9.1439925738.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eventhough it should be theoretically possible to build protobuf in
static-only, configure.ac includes an m4 macro, ACX_PTHREAD defined in
m4/acx_pthread.m4, which forcibly checks for threads *with* shared libs,
and is completely broken for static-only (as it forces -shared whatever
the user selection), ending up with these configure results:

    checking for the pthreads library -lpthreads... no
    checking whether pthreads work without any flags... no
    checking whether pthreads work with -Kthread... no
    checking whether pthreads work with -kthread... no
    checking for the pthreads library -llthread... no
    checking whether pthreads work with -pthread... yes
    checking for joinable pthread attribute... PTHREAD_CREATE_JOINABLE
    checking if more special flags are required for pthreads... no
    checking whether to check for GCC pthread/shared inconsistencies... yes
    checking whether -pthread is sufficient with -shared... no
    checking whether -lpthread fixes that... no
    checking whether -lc_r fixes that... no
    configure: WARNING: Impossible to determine how to use pthreads with shared libraries
    checking whether what we have so far is sufficient with -nostdlib... no
    checking whether -lpthread saves the day... no
    configure: WARNING: Impossible to determine how to use pthreads with shared libraries and -nostdlib

Fixing this macro is far from trivial; protobuf in a static-only
scenario is probably not too common. So, just disable protobuf for
static-only builds.

Fixes:
    http://autobuild.buildroot.org/results/3ef/3efb86c7e8ec2db5d953d634470cafae79bd34cf/
    http://autobuild.buildroot.org/results/96a/96ae1108fc3193df2a93a779057130b774379655/
    http://autobuild.buildroot.org/results/00c/00c29795980319d38823eec1301e9ebd860ebd2a/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Nimai Mahajan <nimaim@gmail.com>

---
Changes v1 -> v2:
  - rebase ontop of master, after thread fixes
---
 package/mosh/Config.in     | 6 ++++--
 package/ola/Config.in      | 6 ++++--
 package/protobuf/Config.in | 6 ++++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index f4c1466..868b9ff 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -1,5 +1,6 @@
-comment "mosh needs a toolchain w/ C++, threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+comment "mosh needs a toolchain w/ C++, threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
+		|| BR2_STATIC_LIBS
 	depends on !(BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64)
 
 config BR2_PACKAGE_MOSH
@@ -7,6 +8,7 @@ config BR2_PACKAGE_MOSH
 	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64 # protobuf
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
+	depends on !BR2_STATIC_LIBS # protobuf
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_NCURSES
diff --git a/package/ola/Config.in b/package/ola/Config.in
index f587db5..fd693de 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -1,5 +1,6 @@
-comment "ola needs a toolchain w/ C++, threads, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+comment "ola needs a toolchain w/ C++, threads, wchar, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
 
 config BR2_PACKAGE_OLA
@@ -8,6 +9,7 @@ config BR2_PACKAGE_OLA
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_UTIL_LINUX
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
+	depends on !BR2_STATIC_LIBS # protobuf
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64 # protobuf
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index bbb927f..9ee7e7d 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -7,13 +7,15 @@ config BR2_PACKAGE_PROTOBUF
 	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
 	# host-protobuf only builds on certain architectures
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_STATIC_LIBS
 	help
 	  Protocol buffers are Google's language-neutral, platform-neutral,
 	  extensible mechanism for serializing structured data.
 
 	  https://developers.google.com/protocol-buffers
 
-comment "protobuf needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "protobuf needs a toolchain w/ C++, threads, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS
 	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-- 
1.9.1
