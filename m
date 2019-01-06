From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 06 Jan 2019 20:38:01 +0000
Subject: [Buildroot] [Bug 11591] New: [pkgconf 1.5.3]
Message-ID: <bug-11591-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11591

            Bug ID: 11591
           Summary: [pkgconf 1.5.3]
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: romain.naour at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

On current Buildroot master.

There is a regression with OpenGL support with a xserver, the path to the dri
modules is prefixed with the sysroot at runtime:

From Xorg.0.log:
(EE) AIGLX error: dlopen of
/home/naourr/buildroot-test/test/arete/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/lib/dri/r600_dri.so
failed
(/home/naourr/buildroot-test/test/arete/host/bin/../x86_64-buildroot-linux-gnu/sysroot/usr/lib/dri/r600_dri.so:
cannot open shared object file: No such file or directory)
(II) GLX: no usable GL providers found for screen 0

xserver hardcode this path in DRI_DRIVER_PATH which come from
dridriverdir=`$PKG_CONFIG --variable=dridriverdir dri`

dri.pc:
prefix=/usr
exec_prefix=/usr
libdir=${exec_prefix}/lib
includedir=${prefix}/include
dridriverdir=${libdir}/dri

Name: dri
Description: Direct Rendering Infrastructure
Version: 18.2.8
Requires.private: libdrm >= 2.4.75
Cflags: -I${includedir}

(y_morin):
"That's because dridriverdir=${libdir}/dri  and libdir *is* a sysroot-prefixed
variable.
And sysroot prefix is added at the moment the variable is evaluated. I.e.
libdir first gets evaluated from ${exec_prefix}/lib, then libdir is eligible to
sysroot-prefixing, so sysroot is prefixed.
Then dridriverdir is evaluated from ${libdir}/dri and libdir already has the
sysroot in it."

I tested to revert back to the old version of pkgconf and dridriverdir is just
"/usr/lib/dri"

The issue is present even with commit 7125fc5c1a8a96ff8eee057789358702e1b55835
"package/pkgconf: add patch to restore pre-1.5.3 behavior for sysroot
prefixing".

Romain

-- 
You are receiving this mail because:
You are on the CC list for the bug.
