From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Nov 2014 18:30:34 +0100
Subject: [Buildroot] [git commit] package/erlang: disable for static builds
Message-ID: <20141122173052.53A207FE30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1fee946037f94a61cdad5fc8f8cb043fc7a8ecde
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

erlang wants to build shared libs, always.

So, disable erlang when we're building static-only.

Fixes:
    http://autobuild.buildroot.net/results/1ce/1ceaa6925d1ded236d01ae9feb31f5f915f6b51a/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/erlang/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 06833b9..0566582 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -1,10 +1,11 @@
-comment "erlang needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "erlang needs a toolchain w/ threads, shared library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS && BR2_PREFER_STATIC_LIB
 
 config BR2_PACKAGE_ERLANG
 	bool "erlang"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  Erlang is a programming language used to build massively scalable
 	  soft real-time systems with requirements on high availability.
