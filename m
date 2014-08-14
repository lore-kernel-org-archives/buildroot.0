From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 14 Aug 2014 21:36:41 +0000 (UTC)
Subject: [Buildroot] [Bug 7322] New: libgomp dependency issue with
	imagemagick
Message-ID: <bug-7322-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7322

           Summary: libgomp dependency issue with imagemagick
           Product: buildroot
           Version: 2014.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: benoit.thebaudeau.dev at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


With the current master head, if an external toolchain with libgomp support is
used to build imagemagick, libgomp is installed to staging/, but not to target/
by default, so imagemagick's configure detects libgomp as supported and enables
its usage for the build stage, but then it fails to run on the target because
libgomp is missing.

This can be worked around by manually adding libgomp.so* to the list of
toolchain libraries to be installed to the target, but this should be an
automatic dependency. However, AFAIK, there is currently no dependency
mechanism in BuildRoot to trigger the installation of a toolchain library to
the target.

A solution could be to create an automatic or manual
BR2_TOOLCHAIN_SUPPORTS_LIBGOMP config option, and a hidden
BR2_PACKAGE_IMAGEMAGICK_USES_LIBGOMP defaulting to
BR2_TOOLCHAIN_SUPPORTS_LIBGOMP and selecting a
BR2_TOOLCHAIN_INSTALL_TARGET_LIBGOMP, which would trigger the installation of
libgomp.so* from one of the toolchain make files.

What do you think?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
