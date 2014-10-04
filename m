From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  4 Oct 2014 10:37:48 +0000 (UTC)
Subject: [Buildroot] [Bug 7508] New: Use of BR2_EXTERNAL and dependencies to
 existing packages
Message-ID: <bug-7508-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7508

           Summary: Use of BR2_EXTERNAL and dependencies to existing
                    packages
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: espenfk at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hello.

I use BR2_EXTERNAL to add my own components to Buildroot. One of the components
are needed for post-processing the u-boot, Linux, and rootfs images (a host
tool in other words). I therefore, in the my-component.mk file pointed to
indirectly by BR2_EXTERNAL, added my component to LINUX_DEPENDENCIES,
UBOOT_DEPENDENCIES, and ROOTFS_POST_BUILD_SCRIPT. But my tool is not built
before either. Why?

Well the answer is in the Makefile, line 378 and forward. Since the external.mk
in line 392 is processed after boot, linux, and fs, values added to for
instance LINUX_DEPENDENCIES in the external file have no effect on the Linux
dependencies.

I come around it by adding the necessary dependencies in a package override
file since this is processed in line 382, which is ok, but not optimal.

The behaviour is probably by design, but then the documentation lack some
details that cost me some hours hard-core buildroot debugging.

One solution, that will not break current builds, is to add a configuration
variable where one can set that the external.mk file is read before all the
package, boot, linux, system , and fs files, but default it does as now.

Sp1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
