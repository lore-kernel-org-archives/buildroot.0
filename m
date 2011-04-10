From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 10 Apr 2011 15:58:41 +0000 (UTC)
Subject: [Buildroot] [Bug 3583] New: xfonts_font-adobe-100dpi fails due to
 missing map file.
Message-ID: <bug-3583-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3583

           Summary: xfonts_font-adobe-100dpi fails due to missing map
                    file.
           Product: buildroot
           Version: 2011.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mjhammel at graphics-muse.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3187
  --> https://bugs.busybox.net/attachment.cgi?id=3187
Updated patch to address pkg-config variables that need sysroot path prepended.

The problem presents itself with the following error:
/home/mjhammel/src/ximba/bb/src/../bld/buildroot-2011.02.bld/staging//usr/bin/ucs2any:
Can't read mapping file '/usr/share/fonts/X11/util/map-ISO8859-1': No such file
or directory!

After looking through the recent commits I found this patch:
http://git.buildroot.net/buildroot/commit/?id=117a8ea0eaabec72d7637f80f7a55fbba9ce67bf

This didn't fix the problem, but it pointed me in the right direction.  The map
file was in two places under the staging tree after a build with this patch:
$ find . -name map-ISO8859-1
./staging/usr/share/fonts/X11/util/map-ISO8859-1
./staging/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/share/fonts/X11/util/map-ISO8859-1

Looking through xfonts_font-adobe-100dpi I discovered that the variable
"mapdir" is checked for the location of this file  So I changed the patch to
include mapdir and the build now completes and the fonts are in the correct
location.

The question is: is this the correct fix?  

Updated patch is attached.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
