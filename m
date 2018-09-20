From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 20 Sep 2018 18:59:12 +0200
Subject: [Buildroot] [PATCH v3 1/2] at: change upstream site, bump version
In-Reply-To: <20180920165913.13488-1-giulio.benetti@micronovasrl.com>
References: <20180918213949.36376-1-giulio.benetti@micronovasrl.com>
 <20180920165913.13488-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180920165913.13488-2-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At is now available on a git repository at:
https://salsa.debian.org/debian/at
Main changes 3.1.16 -> 3.1.23:
- add support for SELinux, multiple files
- improve atd.service, see bug report 892819
- fix various bugs and warnings
- finalized script to release software

So:
- change AT_SITE_METHOD to git pointing to release/3.1.23
- update tarball sha256 in hash file
- improved S99at script:
  if /var/spool is linked to /tmp, .SEQ file will be lost and atd won't
  work neither for a live session. Create .SEQ file if not found, warning
  during start that after reboot atjobs could be lost.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
Changes V2->V3:
* correct comment in S99at script
* remove redundant newline in at.mk
* add website to Config.in

 package/at/Config.in | 2 ++
 package/at/S99at     | 9 +++++++++
 package/at/at.hash   | 4 ++--
 package/at/at.mk     | 9 +++++----
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/package/at/Config.in b/package/at/Config.in
index 17fabf7f6b..cbc5be47b8 100644
--- a/package/at/Config.in
+++ b/package/at/Config.in
@@ -8,3 +8,5 @@ config BR2_PACKAGE_AT
 
 	  at    - run the job at a specified time
 	  batch - run the job when system load levels permit
+
+	  https://salsa.debian.org/debian/at
diff --git a/package/at/S99at b/package/at/S99at
index 666d39b546..a5015b0735 100755
--- a/package/at/S99at
+++ b/package/at/S99at
@@ -6,6 +6,15 @@
 umask 077
 
 start() {
+	# Since /var/spool can be linked to /tmp (tmpfs)
+	# /var/spool/cron/atjobs/.SEQ created could be not available
+	# Check if not exists otherwise create it
+	if [ ! -f /var/spool/cron/atjobs/.SEQ ]; then
+	    mkdir -p /var/spool/cron/atjobs/
+	    touch /var/spool/cron/atjobs/.SEQ
+	    printf "atd: Created missing .SEQ file. Probably it's in tmpfs and on reboot atjobs will be lost!\n"
+	fi
+
 	printf "Starting atd: "
 	start-stop-daemon --start --quiet --make-pidfile --pidfile /var/run/atd.pid --background --exec /usr/sbin/atd -- -f
 	echo "OK"
diff --git a/package/at/at.hash b/package/at/at.hash
index 22c732cc7e..e6eb26d818 100644
--- a/package/at/at.hash
+++ b/package/at/at.hash
@@ -1,2 +1,2 @@
-# From: http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/at/at_3.1.16-1.dsc
-sha256 cb9af59c6a54edce9536ba629841055409d1f89d8ae26494727a97141fb4d5c1  at_3.1.16.orig.tar.gz
+# Locally calculated
+sha256 f5c7c8226fab0bc4e2d16a55e04d4026f3452db51fc5cbcc4bb5a3c79a79f7ef  at-release_3.1.23.tar.gz
diff --git a/package/at/at.mk b/package/at/at.mk
index 058ebac5c8..36aa8c7a42 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-AT_VERSION = 3.1.16
-AT_SOURCE = at_$(AT_VERSION).orig.tar.gz
-AT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/at
-# missing deps for parsetime.l
+AT_VERSION = release/3.1.23
+AT_SITE = https://salsa.debian.org/debian/at.git
+AT_SITE_METHOD = git
+# Tried to add missing deps for parsetime.l but still parallel build fails
+# in some case, so at the moment let's keep MAKE1
 AT_MAKE = $(MAKE1)
 AT_AUTORECONF = YES
 AT_DEPENDENCIES = $(if $(BR2_PACKAGE_FLEX),flex) host-bison host-flex
-- 
2.17.1
