From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 May 2018 21:34:25 +0200
Subject: [Buildroot] [git commit] libgsasl: add mandatory dependency on wchar
Message-ID: <20180502193526.473898B4AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00d40a4f29eafaded4cc530ab688a74162f21fa4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libgsasl needs wctomb, if not available it will define it to
rpl_wctomb. However, as there is no rpl_wctomb implementation, the .so
ends up with an undefined reference to wctomb.

This will cause linker errors for packages trying to use it such as
msmtp:
/home/peko/autobuild/instance-0/output/host/bin/../microblazeel-buildroot-linux-uclibc/sysroot/usr//lib/libgsasl.so:
undefined reference to `wctomb'

Fixes:
 - http://autobuild.buildroot.net/results/1bc7cb9a2dd1af746c78f3150528206b7256e40f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgsasl/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libgsasl/Config.in b/package/libgsasl/Config.in
index 5181386272..228f882377 100644
--- a/package/libgsasl/Config.in
+++ b/package/libgsasl/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBGSASL
 	bool "libgsasl"
+	depends on BR2_USE_WCHAR
 	help
 	  Simple Authentication and Security Layer framework Library.
 	  GNU SASL is an implementation of the Simple Authentication and
@@ -9,3 +10,6 @@ config BR2_PACKAGE_LIBGSASL
 	  against servers.
 
 	  http://www.gnu.org/software/gsasl
+
+comment "libgsasl needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
