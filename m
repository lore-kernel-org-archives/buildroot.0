From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 19 Mar 2013 21:22:35 -0700
Subject: [Buildroot] [PATCH] quota: util-linux libmount is needed to build
	mount
In-Reply-To: <y>
References: <y>
Message-ID: <1363753355-27054-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

quota configuration explicitly selects util-linux mount package,
but mount requires libmount to build.

Explicitly select libmount to fix this.

Fixes autobuild errors like:
http://autobuild.buildroot.org/results/2d2f37c292178f746a9a397146719e94f18c022b

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/quota/Config.in |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/quota/Config.in b/package/quota/Config.in
index f6341d3..25614f8 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -3,8 +3,11 @@ config BR2_PACKAGE_QUOTA
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
+	# libc lacks UTIME_NOW & UTIME_COMMIT for libmount
+	depends on !(BR2_microblazeel || BR2_microblazebe)
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
-- 
1.7.10.4
