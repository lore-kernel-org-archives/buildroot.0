From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Jan 2015 23:10:43 +0100
Subject: [Buildroot] [git commit] squid: fix old distro gcc build failure
Message-ID: <20150127221916.929FD80E27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2f7d0d72cd7e00ffbe869011d200f0a4a53e7a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Squid 3.5.x deprecated the use of HOSTCXX & friends in favour of
BUILDCXX and BUILDCXXFLAGS.
When they are not specified BUILDCXXFLAGS takes flags from target
CXXFLAGS which specifies C11 standard and which older vesions of gcc
don't understand, thus causing breakage.
cf_gen hasn't got any C11 features so it's not required. Fixes:
http://autobuild.buildroot.net/results/816/8162e4ec941e7642248373be47cca99113a648e8/

Also drop ACLOCAL and AUTOMAKE trickery from e27ccbab since it's no
longer required.

And fix a typo in the hash file pointing to an improper hash file
upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash |    2 +-
 package/squid/squid.mk   |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index a067383..574d462 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.4/squid-3.5.1.tar.xz.asc
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.1.tar.xz.asc
 md5	b3c9d9726314c1136b7a4c06447db24b	squid-3.5.1.tar.xz
 sha1	a2b01afd33d1df3a234e1a5c3405d626f6cf0fb0	squid-3.5.1.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index deb9360..e385c37 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -21,8 +21,8 @@ SQUID_CONF_ENV = \
 	ac_cv_func___va_copy=yes \
 	ac_cv_func_strnstr=no \
 	ac_cv_have_squid=yes \
-	ACLOCAL="$(ACLOCAL)" \
-	AUTOMAKE="$(AUTOMAKE)"
+	BUILXCXX="$(HOSTCXX)" \
+	BUILDCXXFLAGS="$(HOST_CXXFLAGS)"
 SQUID_CONF_OPTS = \
 	--enable-async-io=8 \
 	--enable-linux-netfilter \
