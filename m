From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 19 Jan 2011 06:21:15 +0000 (UTC)
Subject: [Buildroot] [Bug 3115] New: How about board specific makefiles?
Message-ID: <bug-3115-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3115

           Summary: How about board specific makefiles?
           Product: buildroot
           Version: 2010.11
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: twinkle.j4k at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I want to rename my kernel image from `bzImage` to anything else.
But it is so tiresome to do that every time I do `make`.
I think it is possible if `post-world-hook` or `post-all-hook` is provided by
board specific makefiles.

My suggestion is like below:
- In this case, I use `board/sample/linux-2.6.37.config` as kernel config.
  (BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=board/sample/linux-2.6.37.config)

diff --git a/Makefile b/Makefile
index cf2a7dc..e409ca3 100644
--- a/Makefile
+++ b/Makefile
@@ -307,6 +307,9 @@ include package/Makefile.in

 all: world

+# board specific makefiles
+include board/*/*.mk
+
 # We also need the various per-package makefiles, which also add
 # each selected package to TARGETS if that package was selected
 # in the .config file.

diff --git a/board/sample/sample.mk b/board/sample/sample.mk
new file mode 100644
index 0000000..be1a9a1
--- /dev/null
+++ b/board/sample/sample.mk
@@ -0,0 +1,17 @@
+ifneq ($(findstring sample,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)),)
+
+SAMPLE_OS_VERSION:=1.0
+SAMPLE_OS_NAME:=sample-os-$(SAMPLE_OS_VERSION).bin
+SAMPLE_OS_PATH:="$(BINARIES_DIR)/$(SAMPLE_OS_NAME)"
+
+all: sample-post-all-hook
+
+sample-post-all-hook:
+       @cp $(BINARIES_DIR)/$(LINUX26_IMAGE_NAME) $(SAMPLE_OS_PATH)
+       @$(call MESSAGE,"Finished to build OS image")
+       @echo "Original Image | $(BINARIES_DIR)/$(LINUX26_IMAGE_NAME)"
+       @echo "Renamed Image  | $(SAMPLE_OS_PATH)"
+       @echo -n "Image size     | "
+       @echo -n `ls -l $(SAMPLE_OS_PATH) | awk '{print $$5}'`
+       @echo " (`ls -lh $(SAMPLE_OS_PATH) | awk '{print $$5}'`)"
+endif

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
