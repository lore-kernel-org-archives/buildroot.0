From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Nov 2010 09:29:36 +0000 (UTC)
Subject: [Buildroot] [Bug 2767] New: Build for lsof broken in
	buildroot-2010.08
Message-ID: <bug-2767-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2767

           Summary: Build for lsof broken in buildroot-2010.08
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: andyg1001 at hotmail.co.uk
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2635
  --> https://bugs.busybox.net/attachment.cgi?id=2635
Error log

The build process for the lsof package has been broken in buildroot-2010.08. 
In buildroot-2010.05 it was not broken.

The attached build log file shows the error as it occurs.  Note how the
compiler options passed to make via CFGF, don't actually get passed to gcc, as
should be the case.

The problem has been tracked down to a change made in buildroot: specifically
that it now includes CFLAGS="..." in TARGET_CONFIGURE_OPTS, whereas before this
was not the case.

However, the Configure script for lsof also generates its own CFLAGS
declaration inside the Makefile, which is now overridden by that given by
buildroot.  Fortunately, lsof has a partial solution to this problem which is
the LSOF_CFLAGS_OVERRIDE=1 configuration option.  CFLAGS from buildroot is
still then passed through Configure and incorporated into the CFLAGS
declaration inside the Makefile, but then the Makefile declaration of CFLAGS
can then be marked 'override' so that when calling make, it continues to build
correctly.

Unfortunately, the solution provided by lsof is only partial.  The
configuration option only applies to liblsof, not the application itself.

Attached also is a patch file that fixes both this, plus adds the configuration
option into the package's lsof.mk file.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
