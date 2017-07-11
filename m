From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Jul 2017 11:28:50 +0000
Subject: [Buildroot] [Bug 10026] New: [PATCH] lua-5.3.4: fix lua linker
	error in swupdate
Message-ID: <bug-10026-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10026

            Bug ID: 10026
           Summary: [PATCH] lua-5.3.4: fix lua linker error in swupdate
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: chemobejk at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7101
  --> https://bugs.busybox.net/attachment.cgi?id=7101&action=edit
add missing -ldl to lua.pc

When I updated my existing buildroot configuration to 2017.05 or newer I get
build errors in the package "swupdate":

  Trying libraries: pthread lua m z ubootenv
  Failed: -Wl,--start-group -lpthread -llua -lm -lz -lubootenv -Wl,--end-group
  ...
  ==========
  .../output/host/arm-buildroot-linux-gnueabihf/sysroot/lib/liblua.so:
undefined reference to `dlopen'
  .../output/host/arm-buildroot-linux-gnueabihf/sysroot/lib/liblua.so:
undefined reference to `dlclose'
  .../output/host/arm-buildroot-linux-gnueabihf/sysroot/lib/liblua.so:
undefined reference to `dlerror'
  .../output/host/arm-buildroot-linux-gnueabihf/sysroot/lib/liblua.so:
undefined reference to `dlsym'
  collect2: error: ld returned 1 exit status
  make[1]: *** [swupdate_unstripped] Error 1

The root cause is a missing "-ldl" in etc/lua.pc.

This is probably wrong for all lua patches that add etc/lua.pc, although I
personally only tested lua-5.3.4. The patch should apply to them too.

I'm attaching the patch that I added to my buildroot external directory to fix
the build problem.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
