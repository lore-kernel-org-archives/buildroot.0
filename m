From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 10 Aug 2018 02:08:57 +0000
Subject: [Buildroot] [Bug 11216] New: Extended attributes not applied to
 filesystem
Message-ID: <bug-11216-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11216

            Bug ID: 11216
           Summary: Extended attributes not applied to filesystem
           Product: buildroot
           Version: 2018.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ricardo.martincoski at datacom.com.br
                CC: buildroot at uclibc.org
  Target Milestone: ---

Steps to reproduce:
1) create a config for squashfs with xattrs added by either a device_table or
_PERMISSIONS in a package.
An example can be seen on the test case of this series:
http://patchwork.ozlabs.org/project/buildroot/list/?series=59394
2) Build
3) Run test, checking with getcap

Actual results:
The build succeeds without any warning.
But in runtime the xattrs are not in the filesystem.

Expected results:
In runtime, calling getcap shows the xattrs.

Additional info:
This bug occurs on master and 2018.05.x. It does not occur on 2018.02.x, before
the use of a per-fs target dir.
makedevs does apply the file capabilities to the $(FS_DIR)/target copy, but the
extended attributes are not propagated to the target filesystem.

Hacks (cumulative) to understand the problem:
1) removing "rm -f $(ROOTFS_COMMON_TAR)" from the main Makefile and inspecting
the tarball
> tvvf rootfs.common.tar --xattrs --xattrs-include='*'
the xattr are not shown.
2) adding "--xattrs --xattrs-include='*'" to ROOTFS_COMMON_TAR_CMD the build
succeeds without any warning. Inspecting the tarball the xattrs show up
> x: 20 security.capability
But when run testing the xattrs are not there.
3) adding "--xattrs --xattrs-include='*'" to ROOTFS_COMMON_UNTAR_CMD the build
succeeds with a warning
> File my_file_with_xattr has unrecognised filetype 0, ignoring
Inspecting the tarball the xattr shows up.
But when run testing the file that should have the xattrs is not in the image.

Additional notes (speculation):
- In its source code, tar has some suspicious workarounds for
security.capability, but it works fine outside of fakeroot.
- fakeroot 1.23 is out but I didn't tried it.
- It looks like the problem occurs when extracting a tarfile with xattrs inside
fakeroot. See below the commands I used to test.
Outside of buildroot I tried using those versions from Ubuntu 18.04:
tar (GNU tar) 1.29
fakeroot version 1.22
> $ mkdir dir
> $ touch dir/file
> $ fakeroot
> # setcap cap_kill+eip dir/file
> # getcap dir/file
> dir/file = cap_kill+eip
> # tar cf archive.tar dir --xattrs
> # exit
> $ tar tvvf archive.tar --xattrs --xattrs-include='*'
> drwxr-xr-x  root/root         0 2018-08-05 23:21 dir/
> -rw-r--r--* ricardo/ricardo   0 2018-08-05 23:21 dir/file
>   x: 20 security.capability
> $ fakeroot
> # tar xf archive.tar --xattrs --xattrs-include='*'
> # ls -l dir/file
> ?rw-r--r-- 1 root root 0 ago  5 23:21 dir/file
> # file dir/file
> dir/file: ERROR: invalid mode 0644
> # getcap dir/file
> # exit
> $ file dir/file
> dir/file: empty
> $ getcap dir/file
> $ sudo tar xf archive.tar --xattrs --xattrs-include='*'
> $ getcap dir/file
> dir/file = cap_kill+eip

-- 
You are receiving this mail because:
You are on the CC list for the bug.
