From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 27 Oct 2016 18:20:21 +0000
Subject: [Buildroot] [Bug 9386] New: ubinize fails with or without custom
	config
Message-ID: <bug-9386-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9386

            Bug ID: 9386
           Summary: ubinize fails with or without custom config
           Product: buildroot
           Version: 2016.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: yurovsky at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6781
  --> https://bugs.busybox.net/attachment.cgi?id=6781&action=edit
my experimental fix or workaround

I'm unable to build a UBI image regardless of whether I use the provided
ubinize.cfg or the new custom config option.  In case it's useful, the build
host is Fedora 24.

Sanitized output:

output/foo/build/_device_table.txt'
iniparser: cannot open output/foo/build/ubinize.cfg
ubinize: error!: cannot load the input ini file "output/build/ubinize.cfg"

I think that the issue is that ubinize.cfg is being copied and edited under
fakeroot and the permissions mask is wrong.  As an experiment I added another
routine that's called directly (rather than printed into _fakeroot.sh) and
moved the ubi.mk _CMD to my new _SETUP_CMD and that resolves the problem.

I'm not sure if something like this is a reasonable solution and I don't
understand why copying/sed/etc is done under fakeroot to begin with:

--- a/buildroot/fs/common.mk
+++ b/buildroot/fs/common.mk
@@ -95,6 +95,7 @@
        $$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
                echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script
$$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
                echo $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >>
$$(FAKEROOT_SCRIPT)$$(sep))
+       $$(call $$(ROOTFS_$(2)_SETUP_CMD))
        $$(call PRINTF,$$(ROOTFS_$(2)_CMD)) >> $$(FAKEROOT_SCRIPT)
        chmod a+x $$(FAKEROOT_SCRIPT)
        PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
--- a/buildroot/fs/ubifs/ubi.mk
+++ b/buildroot/fs/ubifs/ubi.mk
@@ -20,7 +20,7 @@
 UBINIZE_CONFIG_FILE_PATH = fs/ubifs/ubinize.cfg
 endif

-define ROOTFS_UBI_CMD
+define ROOTFS_UBI_SETUP_CMD
        $(INSTALL) -m 0644 $(UBINIZE_CONFIG_FILE_PATH) $(BUILD_DIR)/ubinize.cfg
        $(SED) 's;BR2_ROOTFS_UBIFS_PATH;$@fs;' $(BUILD_DIR)/ubinize.cfg
        $(HOST_DIR)/usr/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS)
$(BUILD_DIR)/ubinize.cfg

-- 
You are receiving this mail because:
You are on the CC list for the bug.
