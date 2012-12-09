From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Dec 2012 19:14:00 +0100
Subject: [Buildroot] [PATCH 5/8] bmon: needs MMU for fork()
In-Reply-To: <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d3711ead28655ab34fded4452b0410dd13c192b1.1355076808.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/673b0e9a1ba75123ba2c59df8ad81550170fffef/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bmon/Config.in     |    2 ++
 package/rt-tests/Config.in |    4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/bmon/Config.in b/package/bmon/Config.in
index 9692118..652fd9e 100644
--- a/package/bmon/Config.in
+++ b/package/bmon/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_BMON
 	bool "bmon"
 	depends on BR2_INET_IPV6
+	# needs fork()
+	depends on BR2_USE_MMU
 	help
 	  Linux bandwidth monitor
 
diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 54cb8d0..1a0592f 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_RT_TESTS
 	bool "rt-tests"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# Too old uClibc, does not provide priority-inheritance
-	# mutexes
+	# Too old uClibc on AVR32, does not provide
+	# priority-inheritance mutexes
 	depends on !BR2_avr32
 	help
 	  Set of utilities for testing the real-time behaviour of a
-- 
1.7.9.5
