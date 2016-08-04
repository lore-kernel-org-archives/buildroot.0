From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 04 Aug 2016 08:14:24 +0000
Subject: [Buildroot] [Bug 9136] New: make graph-size fails with "ValueError:
 too many values to unpack"
Message-ID: <bug-9136-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9136

            Bug ID: 9136
           Summary: make graph-size fails with "ValueError: too many
                    values to unpack"
           Product: buildroot
           Version: 2016.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: porto.rio at gmx.net
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6576
  --> https://bugs.busybox.net/attachment.cgi?id=6576&action=edit
Proposed patch to resolve the described bug

We encountered a problem when executing make graph-size in conjunction with
package usb-modeswitch.

make graph-size command fails with following error output:
Traceback (most recent call last):
  File
"/home/elinux/Porto/Rio.Porto.OperatingSystem/work/buildroot-2016.05/support/scripts/size-stats",
line 207, in <module>
    pkgdict = build_package_dict(args.builddir)
  File
"/home/elinux/Porto/Rio.Porto.OperatingSystem/work/buildroot-2016.05/support/scripts/size-stats",
line 69, in build_package_dict
    pkg, fpath = l.split(",")
ValueError: too many values to unpack
Makefile:735: recipe for target 'graph-size' failed
make[1]: *** [graph-size] Error 1
Makefile:16: recipe for target '_all' failed
make: *** [_all] Error 2

Parsing of packages-file-list.txt fails because of the following line:

usb_modeswitch_data,./usr/share/usb_modeswitch/05c6:1000:uMa=Co.,Ltd

where the path component itself contains a "," character, that is used for
spliting.

See support/scripts/size-stats, line 69:
pkg, fpath = l.split(",")

With that line above, split command returns a list of three elements rather
than a tuple leading to the error: "ValueError: too many values to unpack"

Proposed fix: set split maxsplit argument to 1:
pkg, fpath = l.split(",", 1)

See also attached patch.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
