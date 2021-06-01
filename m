From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 1 Jun 2021 22:17:53 +0200
Subject: [Buildroot] [git commit] package/uftrace: needs dynamic library
Message-ID: <20210601200253.B4598814AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=689033a8c22829cd68b318d51fe04e997466c837
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since its addition in commit 09c97972d9f90b69cfc36f9ffe9e22c13daf9307,
uftrace always builds a dynamic library which will raise the following
build failure:

  LINK     libmcount/libmcount.so
.../ld: .../crtbeginT.o: relocation R_X86_64_32 against hidden symbol `__TMC_END__' can not be used when making a shared object

Fixes:
 - http://autobuild.buildroot.org/results/980bb38c6417bd48828379677762382030c5b28a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/uftrace/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/uftrace/Config.in b/package/uftrace/Config.in
index 6de9b840ba..98ddb7cbfb 100644
--- a/package/uftrace/Config.in
+++ b/package/uftrace/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_UFTRACE
 	bool "uftrace"
 	depends on BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_ARGP_STANDALONE if \
 	       BR2_TOOLCHAIN_USES_UCLIBC || \
 	       BR2_TOOLCHAIN_USES_MUSL
@@ -22,6 +23,6 @@ config BR2_PACKAGE_UFTRACE
 
 	  https://github.com/namhyung/uftrace
 
-comment "uftrace needs a toolchain w/ threads"
+comment "uftrace needs a toolchain w/ threads, dynamic library"
 	depends on BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
