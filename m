From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Sep 2013 23:02:13 +0200
Subject: [Buildroot] [git commit] gcc: force symlink creation
Message-ID: <20130915213314.BA45982A40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=094fd1d01de46a61bbc59343841f762817b9cc81
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The HOST_GCC_CONFIGURE_SYMLINK creates a symbolic link
$(@D)/build/configure -> $(@D)/configure for each build step of
gcc. However, it was only using 'ln -s' and not 'ln -sf', which was
causing problems when doing 'make host-gcc-final-reconfigure' for
example, because the configure commands (including this macro) are
being re-executed, but the symbolic link already exists.

Changing this symbolic link creation to 'ln -sf' fixes this problem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gcc/gcc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 157357c..5636c6f 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -76,7 +76,7 @@ endef
 
 define HOST_GCC_CONFIGURE_SYMLINK
 	mkdir -p $(@D)/build
-	ln -s ../configure $(@D)/build/configure
+	ln -sf ../configure $(@D)/build/configure
 endef
 
 #
