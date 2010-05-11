From: William Wagner <will_wagner@carallon.com>
Date: Tue, 11 May 2010 10:37:17 +0100
Subject: [Buildroot] Allowing target to modify fs
Message-ID: <4BE9254D.4050301@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I am trying to update one of our projects to the latest snapshot in git. 
I am having a problem following the new file system building changes.

The problem I have is that previously I had a target that was making 
changes to the target fs (Which perhaps may not be correct but that's a 
side issue). The problem is that in the top level makefile the target is 
included after the fs include so it is added to TARGETS after the step 
to build the fs. This means it runs after the fs has already been built.

I see there is the option to run a script to modify the target in 
BR2_ROOTFS_POST_BUILD_SCRIPT but what I really want is to be able to 
ensure a make target runs before the fs is built.

What would be the best way to solve this? I was thinking about doing 
something similar to $(KERNEL_COND_PATCHES) which allows a target to 
specify additional patches for linux. Something similar could be done with:

diff --git a/Makefile b/Makefile
index 2a70a5b..cf929b9 100644
--- a/Makefile
+++ b/Makefile
@@ -400,7 +400,7 @@ $(TARGET_DIR): $(BUILD_DIR)/.root
  erase-fakeroots:
         rm -f $(BUILD_DIR)/.fakeroot*

-target-finalize:
+target-finalize: $(TARGET_COND_TARGETS)
  ifeq ($(BR2_HAVE_DEVFILES),y)
         ( scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )
  else

What does anyone think?

Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
