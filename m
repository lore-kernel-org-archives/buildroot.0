From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 17 Jul 2008 00:20:33 -0700
Subject: [Buildroot] [buildroot 0004164]: SDL_ttf needs SDL to be compiled
	first
Message-ID: <4193670882faf7fa7a92c3cf637960e8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4164 
====================================================================== 
Reported By:                artemys
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4164
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-16-2008 08:31 PDT
Last Modified:              07-17-2008 00:20 PDT
====================================================================== 
Summary:                    SDL_ttf needs SDL to be compiled first
Description: 
It is possible to select the build of SDL_ttf even if SDL is not selected.
-> compilation error

Correction patch attached.
Same should apply to SDL_mixer...
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 07-16-08 08:47  
---------------------------------------------------------------------- 
--- package/sdl_ttf/Config.in.org	2008-07-16 17:10:29.000000000 +0200
+++ package/sdl_ttf/Config.in	2008-07-16 17:10:57.000000000 +0200
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SDL_TTF
 	bool "SDL_TTF"
 	default n
+	depends on BR2_PACKAGE_SDL

yes, exactly.

 	select BR2_PACKAGE_FREETYPE
 	help
 	  SDL_ttf is a sample TrueType font library. It allows you to
--- package/sdl_ttf/sdl_ttf.mk.org	2008-07-16 17:29:42.000000000 +0200
+++ package/sdl_ttf/sdl_ttf.mk	2008-07-16 17:30:06.000000000 +0200
@@ -60,7 +60,7 @@
 	cp -dpf $(STAGING_DIR)/usr/lib/libSDL_ttf*.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
$(TARGET_DIR)/usr/lib/libSDL_ttf.so
 
-SDL sdl_ttf: uclibc $(TARGET_DIR)/usr/lib/libSDL_ttf.so
+SDL_TTF sdl_ttf: uclibc $(TARGET_DIR)/usr/lib/libSDL_ttf.so

That caps "SDL_TTF" sounds wrong (or at least redundant).
Also, i suspect that you will need to have libsdl.so as prereq, something
like:

sdl_ttf: uclibc $(TARGET_DIR)/usr/lib/libSDL.so \
$(TARGET_DIR)/usr/lib/libSDL_ttf.so 

---------------------------------------------------------------------- 
 artemys - 07-16-08 10:24  
---------------------------------------------------------------------- 
sdl_ttf: uclibc sdl $(TARGET_DIR)/usr/lib/libSDL_ttf.so
will also work, I think... 

---------------------------------------------------------------------- 
 artemys - 07-17-08 00:20  
---------------------------------------------------------------------- 
If I try to compile SDL_ttf with SDL not already selected, then I have the
same problem as issue http://busybox.net/bugs/view.php?id=2174 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-16-08 08:31  artemys        New Issue                                    
07-16-08 08:31  artemys        Status                   new => assigned     
07-16-08 08:31  artemys        Assigned To               => buildroot       
07-16-08 08:31  artemys        File Added: sdl_ttf-depends-on-sdl.patch         
          
07-16-08 08:47  bernhardf      Note Added: 0009404                          
07-16-08 10:24  artemys        Note Added: 0009414                          
07-17-08 00:20  artemys        Note Added: 0009524                          
======================================================================
