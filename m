From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Sep 2017 19:07:38 +0200
Subject: [Buildroot] [git commit] package/softether: bump version
Message-ID: <20170920170649.14EDC810C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52529df15cdff0efa77f2cf5cea0950356cd07b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-Create-autotools-plumbing-for-SoftEther.patch | 274 +++++++++++++--------
 package/softether/softether.hash                   |   2 +-
 package/softether/softether.mk                     |   2 +-
 3 files changed, 168 insertions(+), 110 deletions(-)

diff --git a/package/softether/0001-Create-autotools-plumbing-for-SoftEther.patch b/package/softether/0001-Create-autotools-plumbing-for-SoftEther.patch
index 09cf29a..3f17a74 100644
--- a/package/softether/0001-Create-autotools-plumbing-for-SoftEther.patch
+++ b/package/softether/0001-Create-autotools-plumbing-for-SoftEther.patch
@@ -1494,9 +1494,9 @@ index 00000000..4a3fc2ba
 +
 +
 +AC_OUTPUT
---- a/configure	2016-04-24 16:49:31.000000000 +0200
+--- a/configure	2017-07-16 04:53:31.000000000 +0200
 +++ b/configure	1970-01-01 01:00:00.000000000 +0100
-@@ -1,83 +0,0 @@
+@@ -1,112 +0,0 @@
 -#!/bin/sh
 -
 -echo '---------------------------------------------------------------------'
@@ -1515,74 +1515,103 @@ index 00000000..4a3fc2ba
 -
 -echo 'Welcome to the corner-cutting configure script !'
 -echo
--echo 'Select your operating system below:'
--echo ' 1: Linux'
--echo ' 2: FreeBSD'
--echo ' 3: Solaris'
--echo ' 4: Mac OS X'
--echo ' 5: OpenBSD'
--echo
--echo -n 'Which is your operating system (1 - 5) ? : '
--read TMP
--echo
+-
 -OS=""
--if test "$TMP" = "1"
--then
+-case "`uname -s`" in
+-Linux)
 -	OS="linux"
--fi
--if test "$TMP" = "2"
--then
+-	;;
+-FreeBSD)
 -	OS="freebsd"
--fi
--if test "$TMP" = "3"
--then
+-	;;
+-SunOS)
 -	OS="solaris"
--fi
--if test "$TMP" = "4"
--then
+-	;;
+-Darwin)
 -	OS="macos"
--fi
--if test "$TMP" = "5"
--then
+-	;;
+-OpenBSD)
 -	OS="openbsd"
--fi
+-	;;
+-*)
+-	echo 'Select your operating system below:'
+-	echo ' 1: Linux'
+-	echo ' 2: FreeBSD'
+-	echo ' 3: Solaris'
+-	echo ' 4: Mac OS X'
+-	echo ' 5: OpenBSD'
+-	echo
+-	echo -n 'Which is your operating system (1 - 5) ? : '
+-	read TMP
+-	echo
+-	if test "$TMP" = "1"
+-	then
+-		OS="linux"
+-	fi
+-	if test "$TMP" = "2"
+-	then
+-		OS="freebsd"
+-	fi
+-	if test "$TMP" = "3"
+-	then
+-		OS="solaris"
+-	fi
+-	if test "$TMP" = "4"
+-	then
+-		OS="macos"
+-	fi
+-	if test "$TMP" = "5"
+-	then
+-		OS="openbsd"
+-	fi
 -
--if test "$OS" = ""
--then
--	echo "Wrong number."
--	exit 1
--fi
+-	if test "$OS" = ""
+-	then
+-		echo "Wrong number."
+-		exit 1
+-	fi
+-	;;
+-esac
 -
--echo 'Select your CPU bits below:'
--echo ' 1: 32-bit'
--echo ' 2: 64-bit'
--echo
--echo -n 'Which is the type of your CPU (1 - 2) ? : '
--read TMP
--echo
 -CPU=""
--if test "$TMP" = "1"
--then
--	CPU="32bit"
--fi
--if test "$TMP" = "2"
--then
--	CPU="64bit"
--fi
+-case "`uname -m`" in
+-x86_64|amd64|aarch64|arm64|armv8*|mips64|ppc64|sparc64|alpha|ia64)
+-	CPU=64bit
+-	;;
+-i?86|x86pc|i86pc|armv4*|armv5*|armv6*|armv7*)
+-	CPU=32bit
+-	;;
+-*)
+-	echo 'Select your CPU bits below:'
+-	echo ' 1: 32-bit'
+-	echo ' 2: 64-bit'
+-	echo
+-	echo -n 'Which is the type of your CPU (1 - 2) ? : '
+-	read TMP
+-	echo
+-	if test "$TMP" = "1"
+-	then
+-		CPU="32bit"
+-	fi
+-	if test "$TMP" = "2"
+-	then
+-		CPU="64bit"
+-	fi
 -
--if test "$CPU" = ""
--then
--	echo "Wrong number."
--	exit 1
--fi
+-	if test "$CPU" = ""
+-	then
+-		echo "Wrong number."
+-		exit 1
+-	fi
+-	;;
+-esac
 -
 -cp src/makefiles/${OS}_${CPU}.mak Makefile
 -
 -echo "The Makefile is generated. Run 'make' to build SoftEther VPN."
--
 --- a/manual_configure	1970-01-01 01:00:00.000000000 +0100
-+++ b/manual_configure	2016-04-24 16:49:31.000000000 +0200
-@@ -0,0 +1,83 @@
++++ b/manual_configure	2017-07-16 04:53:31.000000000 +0200
+@@ -0,0 +1,112 @@
 +#!/bin/sh
 +
 +echo '---------------------------------------------------------------------'
@@ -1601,71 +1630,100 @@ index 00000000..4a3fc2ba
 +
 +echo 'Welcome to the corner-cutting configure script !'
 +echo
-+echo 'Select your operating system below:'
-+echo ' 1: Linux'
-+echo ' 2: FreeBSD'
-+echo ' 3: Solaris'
-+echo ' 4: Mac OS X'
-+echo ' 5: OpenBSD'
-+echo
-+echo -n 'Which is your operating system (1 - 5) ? : '
-+read TMP
-+echo
++
 +OS=""
-+if test "$TMP" = "1"
-+then
++case "`uname -s`" in
++Linux)
 +	OS="linux"
-+fi
-+if test "$TMP" = "2"
-+then
++	;;
++FreeBSD)
 +	OS="freebsd"
-+fi
-+if test "$TMP" = "3"
-+then
++	;;
++SunOS)
 +	OS="solaris"
-+fi
-+if test "$TMP" = "4"
-+then
++	;;
++Darwin)
 +	OS="macos"
-+fi
-+if test "$TMP" = "5"
-+then
++	;;
++OpenBSD)
 +	OS="openbsd"
-+fi
-+
-+if test "$OS" = ""
-+then
-+	echo "Wrong number."
-+	exit 1
-+fi
++	;;
++*)
++	echo 'Select your operating system below:'
++	echo ' 1: Linux'
++	echo ' 2: FreeBSD'
++	echo ' 3: Solaris'
++	echo ' 4: Mac OS X'
++	echo ' 5: OpenBSD'
++	echo
++	echo -n 'Which is your operating system (1 - 5) ? : '
++	read TMP
++	echo
++	if test "$TMP" = "1"
++	then
++		OS="linux"
++	fi
++	if test "$TMP" = "2"
++	then
++		OS="freebsd"
++	fi
++	if test "$TMP" = "3"
++	then
++		OS="solaris"
++	fi
++	if test "$TMP" = "4"
++	then
++		OS="macos"
++	fi
++	if test "$TMP" = "5"
++	then
++		OS="openbsd"
++	fi
++
++	if test "$OS" = ""
++	then
++		echo "Wrong number."
++		exit 1
++	fi
++	;;
++esac
 +
-+echo 'Select your CPU bits below:'
-+echo ' 1: 32-bit'
-+echo ' 2: 64-bit'
-+echo
-+echo -n 'Which is the type of your CPU (1 - 2) ? : '
-+read TMP
-+echo
 +CPU=""
-+if test "$TMP" = "1"
-+then
-+	CPU="32bit"
-+fi
-+if test "$TMP" = "2"
-+then
-+	CPU="64bit"
-+fi
-+
-+if test "$CPU" = ""
-+then
-+	echo "Wrong number."
-+	exit 1
-+fi
++case "`uname -m`" in
++x86_64|amd64|aarch64|arm64|armv8*|mips64|ppc64|sparc64|alpha|ia64)
++	CPU=64bit
++	;;
++i?86|x86pc|i86pc|armv4*|armv5*|armv6*|armv7*)
++	CPU=32bit
++	;;
++*)
++	echo 'Select your CPU bits below:'
++	echo ' 1: 32-bit'
++	echo ' 2: 64-bit'
++	echo
++	echo -n 'Which is the type of your CPU (1 - 2) ? : '
++	read TMP
++	echo
++	if test "$TMP" = "1"
++	then
++		CPU="32bit"
++	fi
++	if test "$TMP" = "2"
++	then
++		CPU="64bit"
++	fi
++
++	if test "$CPU" = ""
++	then
++		echo "Wrong number."
++		exit 1
++	fi
++	;;
++esac
 +
 +cp src/makefiles/${OS}_${CPU}.mak Makefile
 +
 +echo "The Makefile is generated. Run 'make' to build SoftEther VPN."
-+
 diff --git a/src/Cedar/Makefile.am b/src/Cedar/Makefile.am
 new file mode 100644
 index 00000000..5346537d
diff --git a/package/softether/softether.hash b/package/softether/softether.hash
index 1bae7e6..01de107 100644
--- a/package/softether/softether.hash
+++ b/package/softether/softether.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 159032e69776dea3b5e9df9be147568c76fb640b754778adb173e3018f56ba20 softether-1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a.tar.gz
+sha256 a34dca9bdb940f9384ae50096f6485448ca539c557e36b3a7f6f810831ee5946 softether-e9006faf0c8739147ab97e27fe11c5cdd20ed9e6.tar.gz
diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index fd416fd..5868438 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOFTETHER_VERSION = 1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a
+SOFTETHER_VERSION = e9006faf0c8739147ab97e27fe11c5cdd20ed9e6
 SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN,$(SOFTETHER_VERSION))
 SOFTETHER_LICENSE = GPL-2.0
 SOFTETHER_LICENSE_FILES = LICENSE
