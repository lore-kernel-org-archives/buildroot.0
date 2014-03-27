From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 27 Mar 2014 09:01:39 +0000 (UTC)
Subject: [Buildroot] [Bug 6992] New: Incorrect installation rights on
 external kernel module makes it unloadable
Message-ID: <bug-6992-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6992

           Summary: Incorrect installation rights on external kernel
                    module makes it unloadable
           Product: buildroot
           Version: 2014.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: jpcartal at free.fr
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hello,

I'm currently working on a project that needs using external kernel modules.
I added a dedicated package for those to be built and installed.
However I made a mistake in the INSTALL_TARGET_CMDS rule since I asked for
those modules to be installed with 0755 access rights in the
$(TARGET_DIR)/lib/modules/$(KERNEL_RELEASE)/kernel/drivers/net/wireless/
directory.

Using the access rights above have the unexpected consequence that those
modules are stripped using the following command: 
$(STRIP_FIND_CMD) | xargs $(STRIPCMD) 2>/dev/null || true i.e. 
find buildroot/output/target -type f \( -perm /111 -o -name '*.so*' \) -not \(
-name 'libpthread*.so*' \) -print | xargs
buildroot/output/host/usr/bin/mipsel-buildroot-linux-uclibc-strip
--remove-section=.comment --remove-section=.note 2>/dev/null || true
Thus leading to stripped kernel modules that can not be loaded.

Changing the install access rights to 0664 make the correct strip command to be
used :
find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
        xargs -r $(KSTRIPCMD);fi

And the modules can then be loaded normally.

While I understand this is a mistake on my side and I found it quite hard to
track the root of the issue, it might be usefull to either :
* Change the $(STRIP_FIND_CMD) to not take into account kernel modules
* Yield an error or a warning during the make process
* Document this behaviour

Regards.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
