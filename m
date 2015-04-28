From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Apr 2015 08:50:04 +0200
Subject: [Buildroot] [git commit] python3: needs dynamic library support
Message-ID: <20150428065522.6D9387FFFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=54915af7c75851318385affd037c7718e10f2665
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/c65/c65c2b2c4c2ca328c4f26ba38798c40ab02c8772/
http://autobuild.buildroot.net/results/e0d/e0db38ca12dbe664d472c4f6f3f1ade4150119c3/
http://autobuild.buildroot.net/results/8e1/8e196d05dd65cdd782c8d41d937a7d9d2ef7dc1a/
http://autobuild.buildroot.net/results/e3a/e3a71f5d05a3e176a9e641e758b1ba64c9560991/

And many more.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsigrokdecode/Config.in |    5 +++--
 package/python3/Config.in         |    5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libsigrokdecode/Config.in b/package/libsigrokdecode/Config.in
index 2529923..a8f4e85 100644
--- a/package/libsigrokdecode/Config.in
+++ b/package/libsigrokdecode/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBSIGROKDECODE
 	depends on BR2_USE_WCHAR # libglib2/python3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2/python3
 	depends on BR2_USE_MMU # libglib2/python3
+	depends on !BR2_STATIC_LIBS # python3
 	help
 	  Libsigrokdecode is a shared library written in C, which
 	  provides (streaming) protocol decoding functionality. Say
@@ -16,10 +17,10 @@ config BR2_PACKAGE_LIBSIGROKDECODE
 
 	  http://sigrok.org/wiki/Libsigrokdecode
 
-comment "libsigrokecode needs a toolchain w/ wchar, threads"
+comment "libsigrokecode needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_PYTHON
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 comment "libsigrokdecode is not compatible with python"
 	depends on BR2_USE_MMU
diff --git a/package/python3/Config.in b/package/python3/Config.in
index f61401e..0f4fc88 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -1,6 +1,6 @@
-comment "python3 needs a toolchain w/ wchar, threads"
+comment "python3 needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_PYTHON3
 	bool "python3"
@@ -9,6 +9,7 @@ config BR2_PACKAGE_PYTHON3
 	# uses fork()
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBFFI
 	help
 	  The python language interpreter.
