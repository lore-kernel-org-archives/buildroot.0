From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 19 Feb 2010 15:58:59 +0000 (UTC)
Subject: [Buildroot] [Bug 1153] New: Buildroot fails to build packages if
 BR2_GCC_SHARED_LIBGCC=y
Message-ID: <bug-1153-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1153

              Host: i686
            Target: ARM
           Summary: Buildroot fails to build packages if
                    BR2_GCC_SHARED_LIBGCC=y
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Keywords: link-failure
          Severity: major
          Priority: P2
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: akennedy at drs-tem.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1153)
 --> (https://bugs.busybox.net/attachment.cgi?id=1153)
Config file for building an NFS buildroot for development purposes.

The config file attached has left off these two, but these were giving me
errors as well:

docker
xstroke

These would NOT compile unless BR2_GCC_SHARED_LIBGCC is not set:
uemacs
nano
vim

The error was undefined hidden symbol in libgcc.a(xxxxxxx.o)  '__xxxxx()'
referenced by DSO.

The xxx was different for each of these (I attempted to compile each with a
shared libgcc) but seemed to center on references to g_printerr, g_print,
g_slist_length, g_malloc0, g_free, g_slist_append, g_slist_Remove_link, and
g_strdup_printf.  These seem to be calling functions from the EABI as some were
like ul_div32_helper() -- though some were not referred to as EABI but AABI,
which greatly confuse me.

It appeared that the source of the problem was in glib2, but I cannot verify
this and could not locate any way around this issue.

My gut tells me that linking libgcc.a in statically is "bad" and I prefer not
to do that, but I'm in a bit over my head with where the problem is.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
