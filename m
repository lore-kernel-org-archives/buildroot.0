From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 31 May 2018 07:58:24 +0000
Subject: [Buildroot] [Bug 11056] New: Compiling a file that uses libdrm
 headers fails with: fatal error: drm.h: No such file or directory
Message-ID: <bug-11056-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11056

            Bug ID: 11056
           Summary: Compiling a file that uses libdrm headers fails with:
                    fatal error: drm.h: No such file or directory
           Product: buildroot
           Version: 2018.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ciro.santilli at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Test setup:
https://github.com/cirosantilli/buildroot/tree/b388a47239bceb5abfe45b5ab4cdc44bdc837f7a
which has very shallow patches on top of master commit
545567a8fc3eaac197c089c4ea905675d8d3dab9 which is ahead of 2018.05-rc1 then run
with:

```
./run
./run-aarch64
```

Build fails for both x86 and aarch64 with:

```
>>> hello 1.0 Building
/usr/bin/make -j8
CC="/home/ciro/bak/git/buildroot/output/host/bin/aarch64-buildroot-linux-uclibc-gcc"
LD="/home/ciro/bak/git/buildroot/output/host/bin/aarch64-buildroot-linux-uclibc-ld"
-C /home/ciro/bak/git/bu
ildroot/output/build/hello-1.0
/home/ciro/bak/git/buildroot/output/host/bin/aarch64-buildroot-linux-uclibc-gcc
-o 'hello' 'hello.c'
In file included from hello.c:2:0:
/home/ciro/bak/git/buildroot/output/host/aarch64-buildroot-linux-uclibc/sysroot/usr/include/xf86drm.h:40:17:
fatal error: drm.h: No such file or directory
 #include <drm.h>
                 ^
```

for the file:

```
#include <stdio.h>
#include <xf86drm.h>
#include <xf86drmMode.h>

int main(void) {
    puts("hello");
}

```

If I remove:

```
#include <xf86drm.h>
#include <xf86drmMode.h>
```

which are provided by libdrm, then it works.

Likely something obvious to those familiar with it.

Can we add an appropriate DEPENDS or SELECTS to the Config.in?

My goal is to later run:
https://github.com/dvdhrm/docs/blob/master/drm-howto/modeset.c to learn DRM. I
know that there must be further settings missing since I don't have /dev/dri on
aarch64, but I do on x86.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
