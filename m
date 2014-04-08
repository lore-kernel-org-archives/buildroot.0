From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Apr 2014 00:33:32 +0200
Subject: [Buildroot] [git commit] system: allow setting the local timezone
	for uClibc
Message-ID: <20140408224018.D75A79C69E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=337fbd549c5cc93ed322dfa223a2db102dfa5965
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/Config.in |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index c700729..d15c3aa 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -269,8 +269,10 @@ endif
 
 config BR2_TARGET_TZ_INFO
 	bool "Install timezone info"
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_TZDATA
+	# No timezone for musl; only for uClibc or (e)glibc.
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_TZDATA if BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_TZ if BR2_TOOLCHAIN_USES_UCLIBC
 	help
 	  Say 'y' here to install timezone info.
 
@@ -283,7 +285,7 @@ config BR2_TARGET_TZ_ZONELIST
 	  Space-separated list of time zones to compile.
 
 	  The value "default" includes all commonly used time zones. Note
-	  that this set consumes around 5.5M.
+	  that this set consumes around 5.5M for (e)glibc and 2.1M for uClibc.
 
 	  The full list is the list of files in the time zone database source,
 	  not including the build and .tab files.
