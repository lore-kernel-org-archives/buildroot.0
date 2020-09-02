From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 02 Sep 2020 16:24:34 -0000
Subject: [Buildroot] [git commit] package/lua-cqueues: disable temporarily
 with Lua 5.4
Message-ID: <20200902161633.7DE677FEBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9131770c390d2a7eb195062f919a9373ef4dd3b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also take into account its lua-http reverse dependency.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-cqueues/Config.in | 5 +++--
 package/lua-http/Config.in    | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/lua-cqueues/Config.in b/package/lua-cqueues/Config.in
index 60f022848b..c319fbdf4d 100644
--- a/package/lua-cqueues/Config.in
+++ b/package/lua-cqueues/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LUA_CQUEUES
 	bool "lua-cqueues"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PACKAGE_LUA_5_4
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Continuation Queues: Embeddable asynchronous networking,
@@ -8,5 +9,5 @@ config BR2_PACKAGE_LUA_CQUEUES
 
 	  http://25thandclement.com/~william/projects/cqueues.html
 
-comment "lua-cqueues needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "lua-cqueues needs a toolchain w/ threads, Lua <= 5.3"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PACKAGE_LUA_5_4
diff --git a/package/lua-http/Config.in b/package/lua-http/Config.in
index 8eefd481b5..76eff7f299 100644
--- a/package/lua-http/Config.in
+++ b/package/lua-http/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LUA_HTTP
 	bool "lua-http"
 	depends on BR2_TOOLCHAIN_HAS_THREADS    # luaossl & lua-cqueues
+	depends on !BR2_PACKAGE_LUA_5_4 # lua-cqueues
 	select BR2_PACKAGE_LPEG # runtime
 	select BR2_PACKAGE_LUA_BASEXX # runtime
 	select BR2_PACKAGE_LUA_BINARYHEAP # runtime
@@ -15,5 +16,5 @@ config BR2_PACKAGE_LUA_HTTP
 
 	  https://daurnimator.github.io/lua-http/
 
-comment "lua-http needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "lua-http needs a toolchain w/ threads, Lua <= 5.3"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PACKAGE_LUA_5_4
