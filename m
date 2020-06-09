From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 09 Jun 2020 13:31:49 +0000
Subject: [Buildroot] [Bug 12991] New: PER_PACKAGE_DIRECTORIES problem with
 host/share/gettext
Message-ID: <bug-12991-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12991

            Bug ID: 12991
           Summary: PER_PACKAGE_DIRECTORIES problem with
                    host/share/gettext
           Product: buildroot
           Version: 2020.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: info at hifiberry.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Some packages create a symlink for gettext-tiny in
 .../per-package/PKGNAME/host/share

e.g.:

lrwxrwxrwx 72 matuschd matuschd   84 Jun  9 11:49
/home/matuschd/buildroot-4/per-package/xkeyboard-config/host/share/gettext ->
/home/matuschd/buildroot-4/per-package/host-gettext-tiny/host/usr/share/gettext-tiny

However, cairo and fontconfig, create a directory with a subdirectory "its":

ls -l /home/matuschd/buildroot-4/per-package/python-pycairo/host/share/gettext
total 4
drwxr-xr-x 2 matuschd matuschd 4096 Jun  9 11:54 its


As the result, the final rsync fails as the directory is non-empty:

rsync -a --link-dest=/home/matuschd/buildroot-4/per-package/alsa-utils/host/
/home/matuschd/buildroot-4/per-package/alsa-utils/host/
/home/matuschd/buildroot-4/host
cannot delete non-empty directory: share/gettext
could not make way for new symlink: share/gettext
rsync error: some files/attrs were not transferred (see previous errors) (code
23) at main.c(1196) [sender=3.1.2]
Makefile:737: recipe for target 'host-finalize' failed
make[1]: *** [host-finalize] Error 23
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

This way, the PER_PACKAGE_DIRECTORY setting can't be used 

I'm not sure at what point this should be fixed

-- 
You are receiving this mail because:
You are on the CC list for the bug.
