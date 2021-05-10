From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 May 2021 09:12:56 +0200
Subject: [Buildroot] [git commit] package/bullet: needs dynamic library
Message-ID: <20210510083900.82E3B86D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffe28bf101c581c43b3ec41d5297f3edb7b15c9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build without dlfcn.h fails because bullet3 is not disabled since
commit 5f154799b6ed772a0c028072996e110fac131508

Fixes:
 - http://autobuild.buildroot.org/results/ab2efdd1eac64474adf00d8e60b42110c6e89143

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bullet/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/bullet/Config.in b/package/bullet/Config.in
index fc285ab33a..5d8a57aa47 100644
--- a/package/bullet/Config.in
+++ b/package/bullet/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_BULLET
 	bool "bullet"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	help
 	  Bullet is a Collision Detection and Rigid Body Dynamics
 	  Library.
 
 	  http://bulletphysics.org
 
-comment "bullet needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "bullet needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
