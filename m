From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 20:42:45 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] expat: fix build on and
	for kernel older than 3.17
Message-ID: <20170719204801.7F1937FCEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f8e78682748b1880827814da1a84b1b535f4af7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

The expat build system now fails when the getrandom() system call is not
supported. This affect both host and target builds. Define XML_POOR_ENTROPY
for target kernels older than 3.17 to fix the build. For the host package
define XML_POOR_ENTROPY unconditionally since we have no easy way to know the
host kernel version. Note that expat will still use getrandom() on the host
when it is available, we don't make security any worse.

Fixes (host):
http://autobuild.buildroot.net/results/928/928dc2b56d931da84055fdfe78929d1f956de53b/
http://autobuild.buildroot.net/results/ee9/ee90d0a456cbce4c7f22e5f61006612bd9ba30d5/
http://autobuild.buildroot.net/results/dac/dac7231242123ae3dcaa6bbdd65b44fe8d8cb20c/

Fixes (target):
http://autobuild.buildroot.net/results/308/308e830219fdfebb5aa6aef51c1dc784254998f6/
http://autobuild.buildroot.net/results/73f/73fa946b0a2205e946ad414079f88e4bdb416f00/
http://autobuild.buildroot.net/results/9d7/9d7bad22ace7fa211b31d752a2255e07cede68be/

[Peter: also use HOST_CPPFLAGS]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 5242701f3aa8426cdf2cc9a176ef06194db93d5f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expat/expat.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index a10f2c9..a78d326 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -15,5 +15,14 @@ HOST_EXPAT_DEPENDENCIES = host-pkgconf
 EXPAT_LICENSE = MIT
 EXPAT_LICENSE_FILES = COPYING
 
+# Kernel versions older than 3.17 do not support getrandom()
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17),)
+EXPAT_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DXML_POOR_ENTROPY"
+endif
+
+# Make build succeed on host kernel older than 3.17. getrandom() will still
+# be used on newer kernels.
+HOST_EXPAT_CONF_ENV += CPPFLAGS="$(HOST_CPPFLAGS) -DXML_POOR_ENTROPY"
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
