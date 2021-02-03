From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Feb 2021 18:49:25 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/xenomai: set
 'custom' as version in case of tarball
Message-ID: <20210203173358.A9562860B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee4a1452a0a43c9dc154d3ec2389eb7a056f82ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

When BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL is selected, the xenomai package
declared an empty version, which among others means that the build directory
becomes output/build/xenomai without any version specification, and empty
version information in 'xenomai-show-info'.

Other packages that allow a custom tarball, like 'linux' and
'arm-trusted-firmware', specify 'custom' as version in this case.

Adapt the xenomai package accordingly.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 603bfafa97ed148fb7774cac7f644eb575535a05)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
