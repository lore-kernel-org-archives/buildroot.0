From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Mar 2014 15:26:38 +0100
Subject: [Buildroot] [git commit] systemd: needs kernel headers >= 3.0
Message-ID: <20140324142757.272429C044@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=249464674485ed1fa18a2d0dd5500c84198490b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Systemd requires at least Linux headers 3.0 because it uses:

- setns(2) syscall, introduced in 3.0.
- IFLA_GROUP from if_link.h, introduced in 2.6.39.

Fixes http://autobuild.buildroot.net/results/098/09866da023d527b3c228a98f1fde104e780e1883/

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 89578c5..e8f1ed6 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -96,10 +96,12 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_USE_MMU
 	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	select BR2_PACKAGE_SYSTEMD
 
-comment 'systemd needs an (e)glibc toolchain'
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
+comment 'systemd needs an (e)glibc toolchain, headers >= 3.0'
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
+		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0)
 
 config BR2_INIT_NONE
 	bool "None"
