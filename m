From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 23:43:51 +0200
Subject: [Buildroot] [git commit] dmalloc: disable on Microblaze with
	debugging symbols
Message-ID: <20140417214501.431EB9C845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=656cdc367e6f2bfba4316d605a5de27c82880473
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is a Microblaze compiler issue when debugging symbols are
enabled, causing assembler errors "Error: operation combines symbols
in different segments". This commit prevents this situation from
happening.

Fixes:

  http://autobuild.buildroot.org/results/d97/d9727e453d7c7c982ce32db5efd455496966e211/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dmalloc/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/dmalloc/Config.in b/package/dmalloc/Config.in
index 315f6ca..03d9f97 100644
--- a/package/dmalloc/Config.in
+++ b/package/dmalloc/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_DMALLOC
 	bool "dmalloc"
+	# On some packages, Microblaze gcc has issues when debugging
+	# symbols are enabled: "Error: operation combines symbols in
+	# different segments".
+	depends on !(BR2_microblaze && BR2_ENABLE_DEBUG)
 	help
 	  A debug memory allocation library which is a drop in replacement for
 	  the system's malloc, realloc, calloc, free and other memory management
