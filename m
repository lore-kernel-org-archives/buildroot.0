From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 22:57:44 +0100
Subject: [Buildroot] [git commit] package/squid: needs atomic
Message-ID: <20181202071601.50236815BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1008c507cdf20bfb16bcf9f6d9d898976db60989
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since https://github.com/squid-cache/squid/commit/4b0f89121135aae68fbaf2aa33b5fb2e0da66d3e
squid tries to find if latomic is needed through:
AC_SEARCH_LIBS([__atomic_load_8],[atomic],[ATOMICLIB="-latomic"],[])

However, this can fails on:
configure:21147: /home/fabrice/buildroot/output/host/bin/arc-buildroot-linux-gnu-g++ -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -matomic -Os   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -g conftest.cpp -latomic   >&5
conftest.cpp:55:6: error: new declaration 'char __atomic_load_8()' ambiguates built-in declaration 'long long unsigned int __atomic_load_8(const volatile void*, int)' [-fpermissive]
 char __atomic_load_8 ();
      ^~~~~~~~~~~~~~~
conftest.cpp: In function 'int main()':
conftest.cpp:59:25: error: too few arguments to function 'long long unsigned int __atomic_load_8(const volatile void*, int)'
 return __atomic_load_8 ();

So add -latomic to LIBS if BR2_TOOLCHAIN_HAS_LIBATOMIC is set

Fixes:
 - http://autobuild.buildroot.org/results/13082cea836a12ac8bf85cbdb53a56a5d30c70b1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/squid/Config.in | 2 ++
 package/squid/squid.mk  | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/package/squid/Config.in b/package/squid/Config.in
index 50f65de433..726160b01d 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -1,10 +1,12 @@
 comment "squid needs a toolchain w/ C++, gcc >= 4.8 not affected by bug 64735"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 config BR2_PACKAGE_SQUID
 	bool "squid"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 2b6c830a62..4a3318b40b 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -38,6 +38,10 @@ SQUID_CONF_OPTS = \
 	--with-swapdir=/var/cache/squid/ \
 	--with-default-user=squid
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+SQUID_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_PACKAGE_LIBKRB5),y)
 SQUID_CONF_OPTS += --with-mit-krb5
 SQUID_DEPENDENCIES += libkrb5
