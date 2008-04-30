From: Alex Parkinson <okalex@gmail.com>
Date: Wed, 30 Apr 2008 12:50:48 -0400
Subject: [Buildroot] AT91SAM9260DFC - Skeleton not copied properly
In-Reply-To: <A0B31F1E-0816-4AF8-A2A2-DEB2544E2825@gmail.com>
References: <A0B31F1E-0816-4AF8-A2A2-DEB2544E2825@gmail.com>
Message-ID: <368933BA-07DC-4A1F-83A4-C7FCDB705A76@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Apr 30, 2008, at 1:57 AM, Alex Parkinson wrote:
> I'm trying to get a root filesystem built properly using Buildroot  
> rev. 21876, but the target_skeleton directory doesn't seem to be  
> copied properly into the working root directory.  The project makes  
> without any critical errors, but when I examine the root  
> filesystem, there's quite a bit missing.  For instance, the only  
> directories in root are bin, dev, etc, home, lib, sbin, tmp, and  
> usr, plus the linuxrc link.  Similarly, the few directories that do  
> exist aren't full populated.  The etc directory only has the files  
> br-version, hostname, issue, ld.so.cache, and the network  
> directory.  I examined the target_skeleton directories (target/ 
> generic and target/device/Atmel/root), and they seem to be fully in  
> tact, so it seems that the skeleton isn't being copied into the  
> build directory properly.  Does anyone have an idea what could be  
> causing this?  I've tried to figure out where the skeleton is  
> copied over (is it the $(BUILD_DIR)/.root target in the base  
> Makefile?), but that didn't really get me anywhere.  I'm not sure  
> what else I can do to debug this.  Any and all help is greatly  
> appreciated.

Okay, I've determined the cause of my problem.  The target skeleton  
is not copied into the new root filesystem if the .root file exists  
in the project build directory.  This is to prevent the skeleton from  
being copied to the root filesystem on every build.  I must have  
removed the root directory at some point without also removing  
the .root file.  I think my confusion was exacerbated by the fact  
that the .root file isn't deleted when 'make clean' is run.  I've  
created a patch to remove the .root file when 'make clean' is run.   
Let me know if this is not the proper way to do it, or if there's  
another way to solve it.

Cheers,
Alex

--- old/Makefile	2008-04-30 12:27:35.000000000 -0400
+++ new/Makefile	2008-04-30 12:39:38.000000000 -0400
@@ -353,6 +353,7 @@
  #############################################################
  clean: $(TARGETS_CLEAN)
  	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE)
+	rm -f $(PROJECT_BUILD_DIR)/.root

  dirclean: $(TARGETS_DIRCLEAN)
  	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE)
