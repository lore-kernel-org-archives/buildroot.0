From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] Move Config.in.mirrors out of
	target/device
Message-ID: <20101217160156.93D0B8E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8008007ca67548fb93a185572eb3deb34a8255d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Having Config.in.mirrors (which also to select various download sites)
inside target/device sounds strange. This commit moves the contents of
Config.in.mirrors directly into the main Config.in file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in                       |   69 ++++++++++++++++++++++++++++++++++++++-
 target/device/Config.in.mirrors |   68 --------------------------------------
 2 files changed, 68 insertions(+), 69 deletions(-)
 delete mode 100644 target/device/Config.in.mirrors

diff --git a/Config.in b/Config.in
index f6e894e..de4ff4a 100644
--- a/Config.in
+++ b/Config.in
@@ -86,7 +86,74 @@ config BR2_STAGING_DIR
 	  Most people will leave this set to the default value of
 	  "$(BASE_DIR)/staging".
 
-source	"target/device/Config.in.mirrors"
+menu "Mirrors and Download locations"
+
+config BR2_PRIMARY_SITE
+	string "Primary download site"
+	default ""
+	help
+	  Primary site to download from. If this option is set then buildroot
+	  will try to download package source first from this site and try the
+	  default if the file is not found.
+	  NOTE: This only works for packages using the Makefile.autotools.in
+
+config BR2_BACKUP_SITE
+	string "Backup download site"
+	default "http://sources.buildroot.net/"
+	help
+	  Backup site to download from. If this option is set then buildroot
+	  will fall back to download package sources from here if the
+	  normal location fails.
+
+config BR2_SOURCEFORGE_MIRROR
+	string "Sourceforge mirror site"
+	default "easynews"
+	help
+	  Sourceforge has a system of mirror sites.  Some sites may be
+	  closer to your location, and sometimes mirror sites go down
+	  and are no longer available.  This option allows you to select
+	  your preferred Sourceforge mirror site.
+
+	  The list of mirrors is available here:
+	  http://prdownloads.sourceforge.net/index-sf.html?download
+
+config BR2_KERNEL_MIRROR
+	string "Kernel.org mirror"
+	default "http://www.kernel.org/pub/"
+	help
+	  kernel.org is mirrored on a number of servers around the world.
+	  The following allows you to select your preferred mirror.
+
+	  Have a look on the kernel.org site for a list of mirrors, then enter
+	  the URL to the base directory.  Examples:
+
+	     http://www.XX.kernel.org/pub (XX = country code)
+	     http://mirror.aarnet.edu.au/pub/ftp.kernel.org
+
+config BR2_GNU_MIRROR
+	string "GNU Software mirror"
+	default "http://ftp.gnu.org/pub/gnu"
+	help
+	  GNU has multiple software mirrors scattered around the world.
+	  The following allows you to select your preferred mirror.
+
+	  Have a look on the gnu.org site for a list of mirrors, then enter
+	  the URL to the base directory.  Examples:
+
+	     http://ftp.gnu.org/pub/gnu
+	     http://mirror.aarnet.edu.au/pub/gnu
+
+config BR2_DEBIAN_MIRROR
+	string "Debian Software mirror"
+	default "http://ftp.debian.org"
+	help
+	  Debian has multiple software mirrors scattered around the world.
+	  The following allows you to select your preferred mirror.
+
+	  Usually, just add your country code like XX here:
+	  http://ftp.XX.debian.org
+
+endmenu
 
 config BR2_JLEVEL
 	int "Number of jobs to run simultaneously"
diff --git a/target/device/Config.in.mirrors b/target/device/Config.in.mirrors
deleted file mode 100644
index 9e44e2a..0000000
--- a/target/device/Config.in.mirrors
+++ /dev/null
@@ -1,68 +0,0 @@
-menu "Mirrors and Download locations"
-
-config BR2_PRIMARY_SITE
-	string "Primary download site"
-	default ""
-	help
-	  Primary site to download from. If this option is set then buildroot
-	  will try to download package source first from this site and try the
-	  default if the file is not found.
-	  NOTE: This only works for packages using the Makefile.autotools.in
-
-config BR2_BACKUP_SITE
-	string "Backup download site"
-	default "http://sources.buildroot.net/"
-	help
-	  Backup site to download from. If this option is set then buildroot
-	  will fall back to download package sources from here if the
-	  normal location fails.
-
-config BR2_SOURCEFORGE_MIRROR
-	string "Sourceforge mirror site"
-	default "easynews"
-	help
-	  Sourceforge has a system of mirror sites.  Some sites may be
-	  closer to your location, and sometimes mirror sites go down
-	  and are no longer available.  This option allows you to select
-	  your preferred Sourceforge mirror site.
-
-	  The list of mirrors is available here:
-	  http://prdownloads.sourceforge.net/index-sf.html?download
-
-config BR2_KERNEL_MIRROR
-	string "Kernel.org mirror"
-	default "http://www.kernel.org/pub/"
-	help
-	  kernel.org is mirrored on a number of servers around the world.
-	  The following allows you to select your preferred mirror.
-
-	  Have a look on the kernel.org site for a list of mirrors, then enter
-	  the URL to the base directory.  Examples:
-
-	     http://www.XX.kernel.org/pub (XX = country code)
-	     http://mirror.aarnet.edu.au/pub/ftp.kernel.org
-
-config BR2_GNU_MIRROR
-	string "GNU Software mirror"
-	default "http://ftp.gnu.org/pub/gnu"
-	help
-	  GNU has multiple software mirrors scattered around the world.
-	  The following allows you to select your preferred mirror.
-
-	  Have a look on the gnu.org site for a list of mirrors, then enter
-	  the URL to the base directory.  Examples:
-
-	     http://ftp.gnu.org/pub/gnu
-	     http://mirror.aarnet.edu.au/pub/gnu
-
-config BR2_DEBIAN_MIRROR
-	string "Debian Software mirror"
-	default "http://ftp.debian.org"
-	help
-	  Debian has multiple software mirrors scattered around the world.
-	  The following allows you to select your preferred mirror.
-
-	  Usually, just add your country code like XX here:
-	  http://ftp.XX.debian.org
-
-endmenu
-- 
1.7.2.2
