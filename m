From: Rick Foos <rick@synchromeshcomputing.com>
Date: Fri, 22 Jun 2007 17:04:35 -0500
Subject: [Buildroot] Can "make <>_defconfig" rules be restored?
Message-ID: <01c301c7b519$52679b40$6e02a8c0@k2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I would like to use "_defconfig" files to save and restore specific defaults 
for several platforms.

The Makefile at one point supported loading of user defined "_defconfig" 
files. In the current Makefile the noconfig_targets part of "_defconfig" is 
commented out.

Is there a problem with restoring "_defconfig" file loading?

I searched the list archives on defconfig, but could not find any decision 
on this.

The following patch, restores "_defconfig" file loading limited to files at 
a maxdepth of 4.

This allows "_defconfig" files in packages and tools while avoiding the 
_defconfig files in the linux source directories.

The patch also fixes the find syntax, and allows "_defconfig" files to be in 
the same directory as make.

I'd like to propose that this patch be added, or let me know a better way to 
manage multiple default configurations.

Thanks,
Rick Foos

Index: Makefile
===================================================================
--- Makefile    (revision 9)
+++ Makefile    (working copy)
@@ -28,10 +28,9 @@

 noconfig_targets := menuconfig config oldconfig randconfig \
        defconfig allyesconfig allnoconfig release tags    \
-       source-check
+       source-check \
+       $(shell find $(TOPDIR) -mindepth 2 -maxdepth 4 -name \*_defconfig | 
sed
's|.*\/||')

-#      $(shell find . -name *_defconfig |sed 's/.*\///')
-
 # Pull in the user's configuration file
 ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 -include $(TOPDIR).config
