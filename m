From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:18:24 +0200
Subject: [Buildroot] [git commit] package/kvazaar: needs C++ compiler
Message-ID: <20170704231524.D52F17F94D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e0b4a5cd0b398e21f50be4eb111a926dbac471b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even if there is only one CPP file src/extras/crypto.cpp which should
be disabled by --without-cryptopp, kvazaar fail to build the shared
library libkvazaar.so when no C++ compiler is available.

checking whether we are using the GNU C++ compiler... no

Fixes:
[microblazel] http://autobuild.buildroot.net/results/5d1/5d140ed95e292f73b6770a5e5be717df844e4830
[arm] http://autobuild.buildroot.net/results/c55/c55b973502b9b88643ae9fca11447b547148275d

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kvazaar/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/kvazaar/Config.in b/package/kvazaar/Config.in
index 06ab9ac..de2c6c9 100644
--- a/package/kvazaar/Config.in
+++ b/package/kvazaar/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_KVAZAAR
 	bool "kvazaar"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  An open-source HEVC encoder licensed under LGPLv2.1
 
 	  https://github.com/ultravideo/kvazaar
 
-comment "kvazaar needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "kvazaar needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
