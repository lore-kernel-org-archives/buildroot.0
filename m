From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Jun 2014 13:56:04 +0000 (UTC)
Subject: [Buildroot] [Bug 7154] Local uClibc config file gets overwritten
 using make uclibc-update-config
In-Reply-To: <bug-7154-163@https.bugs.busybox.net/>
References: <bug-7154-163@https.bugs.busybox.net/>
Message-ID: <20140610135604.6A7C89CFB1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7154

--- Comment #2 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-06-10 13:56:04 UTC ---
(In reply to comment #0)
[..]
> 
> For me deleting the .stamp_configured file in the uclibc-menuconfig entry of
> the makefile seems not to be a good idea.

This is done so that the uclibc build is correctly restarted, taking into
account some of the configuration changes we make on the fly.

The following patch solves the problem, but I'm not sure this is acceptable.
It moves the initial copy of the config file outside of the
UCLIBC_SETUP_DOT_CONFIG variable, so that this variable can be re-used from the
uclibc-update-config target. Because this variable relies on $(@D) we need it
to be run for a target inside the UCLIBC_DIR, so the patch introduces a new
.stamp_config_file_fixed step.

tdescham at argentina ~/repo/contrib/buildroot-patchwork $ hg diff
diff -r a3b89cb15e8f package/uclibc/uclibc.mk
--- a/package/uclibc/uclibc.mk  Mon Jun 09 10:43:55 2014 +0200
+++ b/package/uclibc/uclibc.mk  Tue Jun 10 15:52:36 2014 +0200
@@ -414,7 +414,6 @@
        HOSTCC="$(HOSTCC)"

 define UCLIBC_SETUP_DOT_CONFIG
-       $(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(@D)/.config
        $(call UCLIBC_OPT_SET,CROSS_COMPILER_PREFIX,"$(TARGET_CROSS)",$(@D))
        $(call UCLIBC_OPT_SET,TARGET_$(UCLIBC_TARGET_ARCH),y,$(@D))
        $(call UCLIBC_OPT_SET,TARGET_ARCH,"$(UCLIBC_TARGET_ARCH)",$(@D))
@@ -454,6 +453,7 @@
 endef

 define UCLIBC_CONFIGURE_CMDS
+       $(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(@D)/.config
        $(UCLIBC_SETUP_DOT_CONFIG)
        $(MAKE1) -C $(UCLIBC_DIR) \
                $(UCLIBC_MAKE_FLAGS) \
@@ -553,7 +553,10 @@

 $(eval $(generic-package))

-uclibc-update-config: $(UCLIBC_DIR)/.stamp_configured
+$(UCLIBC_DIR)/.stamp_config_file_fixed:
+       $(UCLIBC_SETUP_DOT_CONFIG)
+
+uclibc-update-config: $(UCLIBC_DIR)/.stamp_config_file_fixed
        cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)

 # Before uClibc is built, we must have the second stage cross-compiler

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
