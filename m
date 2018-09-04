From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 04 Sep 2018 17:15:30 +0000
Subject: [Buildroot] [Bug 11271] New: utils/check-package fails with
 exception depending on path prefix
Message-ID: <bug-11271-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11271

            Bug ID: 11271
           Summary: utils/check-package fails with exception depending on
                    path prefix
           Product: buildroot
           Version: 2018.05.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: lotorev at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Prepare simple external tree:

$ tree=$(mktemp --directory $(pwd)/br2-external-XXXX)
$ pushd $tree
$ touch external.mk

Run the check-package from Buildroot:

$ utils/check-package --br2-external external.mk

Traceback (most recent call last):
  File
"/home/vlotorev/projects/production-vip1-sd-fc/tmp/util-aoiU/utils/check-package",
line 177, in <module>
    __main__()
  File
"/home/vlotorev/projects/production-vip1-sd-fc/tmp/util-aoiU/utils/check-package",
line 162, in __main__
    nwarnings, nlines = check_file_using_lib(fname)
  File
"/home/vlotorev/projects/production-vip1-sd-fc/tmp/util-aoiU/utils/check-package",
line 129, in check_file_using_lib
    nwarnings += print_warnings(cf.before())
  File
"/home/vlotorev/projects/production-vip1-sd-fc/tmp/util-aoiU/utils/checkpackagelib/lib_mk.py",
line 106, in before
    package = self.PACKAGE_NAME.search(self.filename).group(1)
AttributeError: 'NoneType' object has no attribute 'group'

Note once './' is added to path check finishes without errors:

$ utils/check-package --br2-external ./external.mk
0 lines processed
0 warnings generated

The same exception raises when non-empty and meaningful package files are
processed.

Checked on commit
https://git.buildroot.net/buildroot/commit/?id=2989e3c87a1123350728904fd789ad513e76b073

-- 
You are receiving this mail because:
You are on the CC list for the bug.
