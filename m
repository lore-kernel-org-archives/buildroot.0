From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Feb 2017 14:43:37 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] php: security bump
	version to 7.1.1
Message-ID: <20170209134445.9E09A82196@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cae567ffc55ed3b85be5cf194de1e78d636f5b26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

0006-Fix-php-fpm.service.in.patch already included:
  https://github.com/php/php-src/commit/bb19125781c0794da9a63fee62e263ff4efff661

Fixes:

CVE-2016-10158

    Loading a TIFF or JPEG malicious file can lead to a Denial-of-Service
    attack when the EXIF header is being parsed.

CVE-2016-10159

    Loading a malicious phar archive can cause an extensive memory
    allocation, leading to a Denial-of-Service attack on 32 bit
    computers.

CVE-2016-10160

    An attacker might remotely execute arbitrary code using a malicious
    phar archive. This is the consequence of an off-by-one memory
    corruption.

CVE-2016-10161

    An attacker with control of the unserialize() function argument can
    cause an out-of-bounce read. This could lead to a Denial-of-Service
    attack or a remote code execution.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 34be5012149dfc74432319a7df1eb627bb50bd27)
---
 package/php/0006-Fix-php-fpm.service.in.patch | 35 ---------------------------
 package/php/php.hash                          |  2 +-
 package/php/php.mk                            |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)

diff --git a/package/php/0006-Fix-php-fpm.service.in.patch b/package/php/0006-Fix-php-fpm.service.in.patch
deleted file mode 100644
index 68cb50a..0000000
--- a/package/php/0006-Fix-php-fpm.service.in.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1a8714d0b56e06301b3c261eaef93d897ec5d834 Mon Sep 17 00:00:00 2001
-From: Floris Bos <bos@je-eigen-domein.nl>
-Date: Fri, 1 May 2015 15:28:55 +0200
-Subject: [PATCH] Fix php-fpm.service.in
-
-- Expand file paths.
-- Remove obsolete After=syslog.target. Syslog is socket activated nowadays.
-
-Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
----
- sapi/fpm/php-fpm.service.in | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/sapi/fpm/php-fpm.service.in b/sapi/fpm/php-fpm.service.in
-index a2df30e..c135f04 100644
---- a/sapi/fpm/php-fpm.service.in
-+++ b/sapi/fpm/php-fpm.service.in
-@@ -1,11 +1,11 @@
- [Unit]
- Description=The PHP FastCGI Process Manager
--After=syslog.target network.target
-+After=network.target
- 
- [Service]
- Type=@php_fpm_systemd@
--PIDFile=@localstatedir@/run/php-fpm.pid
--ExecStart=@sbindir@/php-fpm --nodaemonize --fpm-config @sysconfdir@/php-fpm.conf
-+PIDFile=@EXPANDED_LOCALSTATEDIR@/run/php-fpm.pid
-+ExecStart=@EXPANDED_SBINDIR@/php-fpm --nodaemonize --fpm-config @EXPANDED_SYSCONFDIR@/php-fpm.conf
- ExecReload=/bin/kill -USR2 $MAINPID
- 
- [Install]
--- 
-2.7.4
-
diff --git a/package/php/php.hash b/package/php/php.hash
index 5e4bdcb..9c94b9e 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256 a810b3f29c21407c24caa88f50649320d20ba6892ae1923132598b8a0ca145b6  php-7.1.0.tar.xz
+sha256 b3565b0c1441064eba204821608df1ec7367abff881286898d900c2c2a5ffe70  php-7.1.1.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index 42d8513..39be0c1 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.1.0
+PHP_VERSION = 7.1.1
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
