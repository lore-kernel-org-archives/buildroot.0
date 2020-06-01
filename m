From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 01 Jun 2020 13:47:13 +0000
Subject: [Buildroot] [Bug 12971] New: qt5webengine: graph-depends seems
 producing incorrect output
Message-ID: <bug-12971-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12971

            Bug ID: 12971
           Summary: qt5webengine: graph-depends seems producing incorrect
                    output
           Product: buildroot
           Version: 2020.02.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: seems.deviant at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8486
  --> https://bugs.busybox.net/attachment.cgi?id=8486&action=edit
The graph-depends of the provided config

This is happening on current master: 3a9261ddd9 (HEAD -> master, origin/master,
origin/HEAD) package/libusb-compat: set LIBUSB_1_0_SONAME

Create a following .config:
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5WEBENGINE=y

Then call:
$ make graph-depends

And you'll see that qt5quickcontrols and qt5quickcontrols2 packages are not
marked as dependant on the qt5webengine package, although the qt5webengine has
selected both of them.

I would expect the dependency graph to be "ALL -> qt5webengine ->
{qt5quickcontrols,qt5quickcontrols2}" rather than "ALL ->
{qt5webengine,qt5quickcontrols,qt5quickcontrols2}"

-- 
You are receiving this mail because:
You are on the CC list for the bug.
