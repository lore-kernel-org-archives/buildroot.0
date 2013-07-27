From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 17:18:01 +0200
Subject: [Buildroot] [git commit] dropwatch: add missing dependencies
Message-ID: <20130727213154.0F25B9AD35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dad93df6e83d5f463567ced4fb4d3738a5a6ce73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dropwatch requires thread support because it selects libnl that
depends on thread support. Also dropwatch cannot build on AArch64,
because it selects the target binutils package which isn't (yet)
available on AArch64.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dropwatch/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/dropwatch/Config.in b/package/dropwatch/Config.in
index 4c0857e..ef9a20d 100644
--- a/package/dropwatch/Config.in
+++ b/package/dropwatch/Config.in
@@ -1,10 +1,15 @@
 config BR2_PACKAGE_DROPWATCH
 	bool "dropwatch"
 	select BR2_PACKAGE_BINUTILS
+	depends on !BR2_aarch64 # binutils
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_LIBNL
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	help
 	  Dropwatch is an interactive utility for monitoring and
 	  recording packets that are dropped by the kernel
 
 	  https://fedorahosted.org/dropwatch/
+
+comment "dropwatch requires threading support in toolchain"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
