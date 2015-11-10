From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Nov 2015 17:50:05 +0000 (UTC)
Subject: [Buildroot] [Bug 8456] Building host-pkgconf on Fedora 23 fails due
 to incorrect build dependencies
In-Reply-To: <bug-8456-163@https.bugs.busybox.net/>
References: <bug-8456-163@https.bugs.busybox.net/>
Message-ID: <20151110175005.776B781E83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8456

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |yann.morin.1998 at free.fr
         AssignedTo|unassigned at buildroot.uclibc |yann.morin.1998 at free.fr
                   |.org                        |

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> 2015-11-10 17:50:04 UTC ---
Ian, All,

Thanks for the report.

We've already had this bug reported on the list, and a patch was
submitted with the same proposal as yours, i.e. make host-libcap
a dpeendency of host-coreutils, itself a dependency of host-pkgconf.

However, we believe this is the wrong solution.

We are aiming at getting rid of LD_LIBRARY_PATH instead, since we
are supposed to have proper RPATH in all our generated host
binaries, which should make LD_LIBRARY_PATH unnecessary.

Still, there are a few of our host binaries that still do not have
a proper RPATH set, and fixing those is not a trivial task.

So, the short-term action is to collect all our host binaries
that still lack a proper RPATH, see which ones need it: a host
binary that only has dependencies on the C library and similar
host libraries, like stdc++, does not require RPATH.

We need to investgate those, fix them when needed, and finally
get rid of LD_LIBRARY_PATH altogether. Any help in this endeavour
will be greatly appreciated! ;-)

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
