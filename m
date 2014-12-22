From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Dec 2014 16:14:07 +0000 (UTC)
Subject: [Buildroot] [Bug 7742] New: dhcp lacks important features when
	BR2_ENABLE_DEBUG
Message-ID: <bug-7742-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7742

           Summary: dhcp lacks important features when BR2_ENABLE_DEBUG
           Product: buildroot
           Version: 2014.11
          Platform: All
        OS/Version: All
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: thomas.claveirole at green-communications.fr
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5804
  --> https://bugs.busybox.net/attachment.cgi?id=5804
Fix the reported bug at least partially.

Hi,

When configured with --enable-debug, the DHCP server built from the dhcp
package has some important features disabled.  Most notably, it cannot go
background, change its UID and GID, nor create PID files (see server/dhcpd.c
from the package's sources)...

... and setting BR2_ENABLE_DEBUG does add a --enable-debug option to all target
packages that use the Autotools, including the dhcp package (code is in
package/Makefile.in:387 and package/pkg-autotools.mk:205).  

However, the help for BR2_ENABLE_DEBUG states that this option should only
impact debugging symbols.  Therefore, disabling dhcp features when
BR2_ENABLE_DEBUG is on is a bit harsh.

I am not sure what a proper fix for this would be.  *Maybe* a solution is not
to give --enable-debug to dhcp when BR2_ENABLE_DEBUG, but the Autotools
infrastructure does not allow this.  Attached is a patch I use for the dhcp
package that keeps the aforementioned features even when one configures the
package with --enable-debug.  But I only looked quickly at dhcpd's source code,
and --enable-debug might disable other features I am not aware of (and possibly
in other programs, e.g., the DHCP client).

Cheers,
Thomas

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
