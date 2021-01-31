From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 31 Jan 2021 22:27:40 +0100
Subject: [Buildroot] [PATCH] package/xenomai: set 'custom' as version in
 case of tarball
Message-ID: <20210131212741.16880-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

When BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL is selected, the xenomai package
declared an empty version, which among others means that the build directory
becomes output/build/xenomai without any version specification, and empty
version information in 'xenomai-show-info'.

Other packages that allow a custom tarball, like 'linux' and
'arm-trusted-firmware', specify 'custom' as version in this case.

Adapt the xenomai package accordingly.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/xenomai/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 452b452039..b655733528 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -69,9 +69,11 @@ config BR2_PACKAGE_XENOMAI_REPOSITORY
 	depends on BR2_PACKAGE_XENOMAI_CUSTOM_GIT
 
 config BR2_PACKAGE_XENOMAI_VERSION
-	string "Custom Xenomai version" if !BR2_PACKAGE_XENOMAI_LATEST_VERSION
+	string "Custom Xenomai version" if \
+		!BR2_PACKAGE_XENOMAI_LATEST_VERSION && \
+		!BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
 	default "3.0.10" if BR2_PACKAGE_XENOMAI_LATEST_VERSION
-	depends on !BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
+	default "custom" if BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
 
 config BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL_URL
 	string "URL of custom tarball"
-- 
2.26.2
