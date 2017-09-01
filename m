From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Sep 2017 00:41:32 +0200
Subject: [Buildroot] [git commit] transmission: correct gtk dependencies
	after NLS rework
Message-ID: <20170901231151.EE9A3804F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f3f664b04f8e0ec216bd39a54af9af7b44d7dc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the recent NLS rework, BR2_ENABLE_NLS doesn't imply the absense of --disable-nls, so
configure may fail with:

configure: error: "The gtk client cannot be built without nls support.  Try adding either --enable-nls or --without-gtk"

So adjust the dependencies to use BR2_SYSTEM_ENABLE_NLS instead.

As mentioned by Arnout, an alternative solution could be to explicitly pass
--enable-nls as the stub functions are now available everywhere - But I went
with the dependency for consistency reasons.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/transmission/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index 38a459c..2110e52 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -39,12 +39,12 @@ config BR2_PACKAGE_TRANSMISSION_REMOTE
 
 config BR2_PACKAGE_TRANSMISSION_GTK
 	bool "transmission-gtk"
-	depends on BR2_PACKAGE_LIBGTK3 && BR2_ENABLE_LOCALE
+	depends on BR2_PACKAGE_LIBGTK3 && BR2_SYSTEM_ENABLE_NLS
 	help
 	  Install transmission GTK-based GUI interface.
 
-comment "transmission-gtk needs a toolchain w/ locale"
-	depends on BR2_PACKAGE_LIBGTK3 && !BR2_ENABLE_LOCALE
+comment "transmission-gtk needs NLS enabled"
+	depends on BR2_PACKAGE_LIBGTK3 && !BR2_SYSTEM_ENABLE_NLS
 endif
 
 comment "transmission needs a toolchain w/ threads"
