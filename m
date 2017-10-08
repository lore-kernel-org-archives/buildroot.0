From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 08 Oct 2017 17:08:27 +0000
Subject: [Buildroot] [Bug 10386] New: Add an option to put all compiled
 executables that show up on target/ in staging/ as well
Message-ID: <bug-10386-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10386

            Bug ID: 10386
           Summary: Add an option to put all compiled executables that
                    show up on target/ in staging/ as well
           Product: buildroot
           Version: 2017.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ciro.santilli at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Why this would be cool: you can then easily find the non-stripped executables
to debug them with gdbserver, as they are in the same relative path as in the
target.

Without that, you need to do a `find` inside build/

This is already done for shared libraries, where it is required for
compilation, and that is already great as it allows me to `set sysroot
${buildroot_out_dir}/staging`

This is an example of the type of setup I'm using:
https://github.com/cirosantilli/linux-kernel-module-cheat/tree/b89ba9b799480e4eb1975f0a704409efb7d667d1#gdbserver

Maybe we could hardlink them or something to reduce disk usage if that is a
concern.

I know that this is already doable on a per package basis, possiby by modifying
the .mk of packages, e.g. as `pciutils` has for `lspci`:

        define PCIUTILS_INSTALL_STAGING_CMDS
            $(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(PCIUTILS_MAKE_OPTS) \
                PREFIX=$(STAGING_DIR)/usr SBINDIR=$(STAGING_DIR)/usr/bin \
                install install-lib install-pcilib
        endef

-- 
You are receiving this mail because:
You are on the CC list for the bug.
