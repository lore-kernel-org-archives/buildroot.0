From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 19:04:45 +0100
Subject: [Buildroot] [git commit] systemd: downgrade kernel headers minimum
	version to 3.7
Message-ID: <20141030180540.E663CB2238@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aef5063f8329e33685837f5c66c2b37c23f82677
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kernel headers minimum version for systemd was bumped to 3.8
(IFLA_GRE_FLOWINFO and IFLA_IPTUN_FLAGS definitions) and then to 3.10
(IFLA_VLAN_PROTOCOL definition). However, systemd since version v215
contains the following patch that defines IFLA_* constants if
needed:

  81577dc missing.h: add various network enums
  http://cgit.freedesktop.org/systemd/systemd/commit/?id=81577dc

As a consequence, this patch downgrades the kernel headers minimum
version to linux 3.7 which is required for BPF_XOR.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 2465f79..39f27c7 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -96,12 +96,12 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_USE_MMU
 	depends on !BR2_PREFER_STATIC_LIB
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	select BR2_PACKAGE_SYSTEMD
 
-comment 'systemd needs an (e)glibc toolchain, headers >= 3.10'
+comment 'systemd needs an (e)glibc toolchain, headers >= 3.7'
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
-		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10)
+		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7)
 
 config BR2_INIT_NONE
 	bool "None"
