From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:49 -0000
Subject: [Buildroot] [git commit branch/next] rpm: needs threads support
Message-ID: <20120802195248.9A4D396EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=485b05a475a996652a6533b3f50c5440a025e5bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Because beecrypt needs threads rpm does too since it's a mandatory
dependency.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rpm/Config.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index a80a5a7..14072c9 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -1,8 +1,12 @@
+comment "rpm requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 comment "rpm requires libneon with SSL, XML and ZLIB support"
-	depends on !BR2_PACKAGE_NEON || BR2_PACKAGE_NEON_NOXML
+	depends on !BR2_PACKAGE_NEON || BR2_PACKAGE_NEON_NOXML && BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_RPM
 	bool "rpm"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
 	select BR2_PACKAGE_BEECRYPT
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_OPENSSL
