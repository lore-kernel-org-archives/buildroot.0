From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 24 Jul 2008 07:27:44 -0700
Subject: [Buildroot] [buildroot 0003974]: [PATCH] new package: LiTE (toolkit
	engine)
Message-ID: <b1375ad827abcc489333e10ea63d7124@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3974 
====================================================================== 
Reported By:                zonque
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3974
Category:                   New Features
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-07-2008 04:29 PDT
Last Modified:              07-24-2008 07:27 PDT
====================================================================== 
Summary:                    [PATCH] new package: LiTE (toolkit engine)
Description: 
this patch adds LiTE (DirectFB-based toolkit engine) to the list of
supported packages. Applies to latest svn here.
====================================================================== 

---------------------------------------------------------------------- 
 daniellaird - 07-08-08 06:11  
---------------------------------------------------------------------- 
I have updated the patch (It all works fine) but without the examples not
much to show.  For now the patch just disables the tests and copies all
supporting pngs/fonts etc into $ROOTFS. 

---------------------------------------------------------------------- 
 zonque - 07-24-08 04:09  
---------------------------------------------------------------------- 
can this go upstream, please?

Daniel 

---------------------------------------------------------------------- 
 bernhardf - 07-24-08 05:17  
---------------------------------------------------------------------- 
this package should use package/Makefile.autotools.in

See various other packages for examples on how this should look like.
Please redo it and attach an updated patch. TIA 

---------------------------------------------------------------------- 
 daniellaird - 07-24-08 05:52  
---------------------------------------------------------------------- 
Please find updated patch (adding_lite.patch) 

---------------------------------------------------------------------- 
 bernhardf - 07-24-08 07:27  
---------------------------------------------------------------------- 
+$(LITE_HOOK_POST_INSTALL):
+	mkdir -p $(ROOTFS)/usr/share/fonts/truetype/
+	mkdir -p $(ROOTFS)/usr/share/LiTE/examples/
+	cp -R $(LITE_DIR)/examples/*.png $(ROOTFS)/usr/share/LiTE/examples/
+	cp -R $(LITE_DIR)/data/*.png $(ROOTFS)/usr/share/LiTE/
+	cp -R $(LITE_DIR)/fonts/*.ttf $(ROOTFS)/usr/share/fonts/truetype/
+	touch $@

ROOTFS? You probably mean $(TARGET_DIR)
It would be better if you would use $(INSTALL), e.g.:
$(INSTALL) -d $(TARGET_DIR)/usr/share/LiTE/examples/
$(INSTALL) -d $(TARGET_DIR)/usr/share/fonts/truetype
$(INSTALL) -m0644 $(LITE_DIR)/data/*.png $(TARGET_DIR)/usr/share/LiTE/
$(INSTALL) -m0644 $(LITE_DIR)/examples/*.png
$(TARGET_DIR)/usr/share/LiTE/examples/
$(INSTALL) -m0644 $(LITE_DIR)/fonts/*.ttf
$(TARGET_DIR)/usr/share/fonts/truetype/

other than that it looks somewhat reasonable 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-07-08 04:29  zonque         New Issue                                    
07-07-08 04:29  zonque         Status                   new => assigned     
07-07-08 04:29  zonque         Assigned To               => buildroot       
07-07-08 04:29  zonque         File Added: lite.diff                        
07-08-08 06:11  daniellaird    Note Added: 0009084                          
07-24-08 04:09  zonque         Note Added: 0009934                          
07-24-08 05:17  bernhardf      Note Added: 0009944                          
07-24-08 05:51  daniellaird    File Added: adding_lite.patch                    
07-24-08 05:52  daniellaird    Note Added: 0009954                          
07-24-08 07:27  bernhardf      Note Added: 0009964                          
======================================================================
