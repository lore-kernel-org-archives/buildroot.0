From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 18 Jul 2020 02:47:34 +0000
Subject: [Buildroot] [Bug 13081] New: host-e2fsprogs attempts to create udev
 rules.d on build host if not exists
Message-ID: <bug-13081-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13081

            Bug ID: 13081
           Summary: host-e2fsprogs attempts to create udev rules.d on
                    build host if not exists
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: christian at paral.in
                CC: buildroot at uclibc.org
  Target Milestone: ---

If the /usr/lib/udev path does not exist on the build host, the
"installdirs-udev" step of the "install-progs-recursive" step of host-e2fsprogs
host-install in Buildroot attempts to create it.

This is a leak out of the Buildroot host dir structure.

Log output:

making install in po
if test "e2fsprogs" = "gettext-tools"; then \
  /bin/mkdir -p
/home/paralin/repos/skiff-configs/skiff/workspaces/desktop/host/share/gettext/po;
\
  for file in Makefile.in.in remove-potcdate.sin quot.sed boldquot.sed
en at quot.header en at boldquot.header insert-header.sin Rules-quot   Makevars.t
emplate; do \
    /usr/bin/install -c -m 644 ./$file \
               a   
/home/paralin/repos/skiff-configs/skiff/workspaces/desktop/host/share/gettext/po/$file;
\
  done; \
  for file in Makevars; do \
    rm -f
/home/paralin/repos/skiff-configs/skiff/workspaces/desktop/host/share/gettext/po/$file;
\
  done; \
else \
  : ; \
fi
making install in scrub
       :MKDIR_P /usr/lib/udev/rules.d
/bin/mkdir: cannot create directory '/usr/lib/udev': Permission denied
make[5]: *** [Makefile:420: installdirs-udev] Error 1
make[4]: *** [Makefile:433: install-progs-recursive] Error 1
make[3]: *** [package/pkg-generic.mk:280:
/home/paralin/repos/skiff-configs/skiff/workspaces/desktop/build/host-e2fsprogs-1.45.6/.stamp_host_insta
lled] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
