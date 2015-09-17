From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 17 Sep 2015 16:11:31 +0000 (UTC)
Subject: [Buildroot] [Bug 8346] New: wf111 package removes all kernel module
	dependencies
Message-ID: <bug-8346-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8346

           Summary: wf111 package removes all kernel module dependencies
           Product: buildroot
           Version: 2015.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mstarr at hedonline.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 6161
  --> https://bugs.busybox.net/attachment.cgi?id=6161
Patch to fix wf111 overwriting module files during install

If the wf111 package is selected and the source is given, the package builds
and runs depmod in its output directory.  Then in the install target the
contents of the output directory are copied to the target/lib/modules/<VERSION>
directory.  When the install step occurs the module.* files are overwritten
with the wf111 files resulting in only the wf111 driver kernel module showing
up on the target.

This is detected by running "modprobe -l" on the target hardware and it will
only show the extra/unifi_sdio.ko kernel module.  This prevents loading of any
other kernel modules enabled in the kernel configuration.

As a solution the WF111_INSTALL_CMDS is removed and under the WF111_BUILD_CMDS,
 the following can be added to the make command:
OUTPUT=$(TARGET_DIR).

This points the build to install to the target directory and not the local
output directory.  This in turn catches all the other kernel modules when
depmod is run.  The only issue with this is that under the build target of
wf111, it will also be installing the software too which is usually handled
under the install target.

Attached is a patch that makes the changes suggested above.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
