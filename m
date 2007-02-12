From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:37 -0800
Subject: [Buildroot] [buildroot 0000366]: fakeroot: Command not found --
	cannot build root filesystems
Message-ID: <88d017587ba5716dc9a4f86393de9d89@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=366 
====================================================================== 
Reported By:                pnoffke
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   366
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-05-2005 02:50 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    fakeroot: Command not found -- cannot build root
filesystems
Description: 
I am unable to build an ext2 or jffs filesystem.  Attempting to build
either of these fails when trying to run fakeroot, which doesn't exist in
the toolchain.  I am using a snapshot I obtained on August 5, 2005.
====================================================================== 

---------------------------------------------------------------------- 
 emalkowski - 08-05-05 09:25  
---------------------------------------------------------------------- 
I ran into this too and found that it also wants makedevs to be built.
I fixed it pretty easily with the following that simply makes the
fakeroot/makedevs related stuff depend on host-fakeroot and makedevs.  If
you configured fakeroot into your target in the toplevel config file as an
attempted fix, you can take it back out as host-fakeroot only builds
fakeroot for rootfs manufacturing on the host.

malk at malk-lt-lnx:~/athena/buildroot/target/ext2$ svn diff ext2root.mk 
Index: ext2root.mk
===================================================================
--- ext2root.mk (revision 11)
+++ ext2root.mk (working copy)
@@ -65,7 +65,7 @@
 EXT2_TARGET := $(EXT2_BASE)
 endif
 
-$(EXT2_BASE): genext2fs
+$(EXT2_BASE): genext2fs host-fakeroot makedevs
        - at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP)
2>/dev/null || true;
        @rm -rf $(TARGET_DIR)/usr/man
        @rm -rf $(TARGET_DIR)/usr/share/man 

---------------------------------------------------------------------- 
 emalkowski - 08-05-05 12:37  
---------------------------------------------------------------------- 
Another note on this -- if fakeroot.env in staging_dir is reused and you
change your target_skeleton, it blows up w/ missing files etc. due to
fakeroot.env entries being stale.  This had me thinking I had filesystem
issues when I first saw it!  When I just want to re-build root root
filesystem, I do this:

rm -rf build_i386/root
make

If re-buildup of build_i386/root includes changes to the filesystem, the
stale stuff in fakeroot.env makes it appear like filesystem strangeness in
build_i386/root.  Here's my fix to this problem -- simply remove
fakeroot.env instead of touching it in target dir setup in the top level
Makefile -- hope these notes on this fakeroot related stuff help some
folks.  My previous note probably needs to be applied to the other rootfs
targets (jffs, tar, etc.) or fixed at some higher layer.

malk at malk-lt-lnx:~/athena/buildroot$ svn diff Makefile 
Index: Makefile
===================================================================
--- Makefile    (revision 11)
+++ Makefile    (working copy)
@@ -115,7 +115,7 @@
        if [ -d "$(TARGET_SKEL_DIR)" ] ; then \
                cp -a $(TARGET_SKEL_DIR)/* $(TARGET_DIR)/; \
        fi;
-       touch $(STAGING_DIR)/fakeroot.env
+       rm -f $(STAGING_DIR)/fakeroot.env
        -find $(TARGET_DIR) -type d -name CVS | xargs rm -rf
        -find $(TARGET_DIR) -type d -name .svn | xargs rm -rf 

---------------------------------------------------------------------- 
 pnoffke - 08-07-05 17:27  
---------------------------------------------------------------------- 
Thanks, that fixed it. 

---------------------------------------------------------------------- 
 vapier - 08-07-05 17:41  
---------------------------------------------------------------------- 
ext2 is fixed already, sync up your tree

fixed jffs2 also 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-05-05 02:50  pnoffke        New Issue                                    
08-05-05 02:50  pnoffke        Status                   new => assigned     
08-05-05 02:50  pnoffke        Assigned To               => uClibc          
08-05-05 02:50  pnoffke        File Added: .config                          
08-05-05 09:25  emalkowski     Note Added: 0000385                          
08-05-05 12:37  emalkowski     Note Added: 0000386                          
08-07-05 17:27  pnoffke        Note Added: 0000389                          
08-07-05 17:41  vapier         Note Added: 0000390                          
08-07-05 17:41  vapier         Status                   assigned => closed  
08-07-05 17:41  vapier         Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
