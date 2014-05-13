From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 13 May 2014 15:53:11 +0000 (UTC)
Subject: [Buildroot] [Bug 7082] New: GnuTLS build failure when building from
 a subdirectory of /usr/local
Message-ID: <bug-7082-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7082

           Summary: GnuTLS build failure when building from a subdirectory
                    of /usr/local
           Product: buildroot
           Version: 2014.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: antoine.pierlot-garcin at scle.fr
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5378
  --> https://bugs.busybox.net/attachment.cgi?id=5378
Minimal defconfig

When placing the Buildroot sources under /usr/local (e.g.
/usr/local/buildroot-2014.02), GnuTLS fails at the linking stage with the
following error:

make[5]: Entering directory
`/usr/local/buildroot.git/output/build/gnutls-3.2.14/lib'
  CCLD     libgnutls.la
libtool: link: cannot find the library
`/usr/local/buildroot.git/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/local/buildroot.git/output/build/pcre-8.35/libpcre.la'
or unhandled argument
`/usr/local/buildroot.git/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/local/buildroot.git/output/build/pcre-8.35/libpcre.la'
make[5]: *** [libgnutls.la] Error 1

As you can see, the problem concerns the path of the PCRE library, which
contains 2 occurences of "/usr/local/buildroot.git/...".

The bug goes away when building from the /home/<user> directory.

I was able to reproduce the bug using a minimal defconfig two different
environments (Arch Linux and Debian 7.5 in LXC). It is present in both 2014.02
and 2014.05-rc1 (I did not test earlier releases). The defconfig targets the
Silica Pengwyn ARM board (similar to the BeagleBone), and is attached to this
bug report.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
