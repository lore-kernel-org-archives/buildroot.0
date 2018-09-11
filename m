From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Sep 2018 07:23:49 +0000
Subject: [Buildroot] [Bug 11321] New: Latest master fails to build readline
 with RELRO FULL
Message-ID: <bug-11321-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11321

            Bug ID: 11321
           Summary: Latest master fails to build readline with RELRO FULL
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: tpearson at raptorengineering.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When RELRO is set to Full, readline fails to build.  RELRO Partial has no
issues.

/home/buildroot/project/buildroot# make
>>> readline 7.0 Building
PATH="/home/buildroot/project/buildroot/output/host/bin:/home/buildroot/project/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
 /usr/bin/make -j16  -C
/home/buildroot/project/buildroot/output/build/readline-7.0/
make[1]: Entering directory
'/home/buildroot/project/buildroot/output/build/readline-7.0'
test -d shlib || mkdir shlib
( cd shlib ; /usr/bin/make -w -j --jobserver-fds=3,4 all )
make[2]: Entering directory
'/home/buildroot/project/buildroot/output/build/readline-7.0/shlib'
rm -f libreadline.so.7.0
rm -f libhistory.so.7.0
/home/buildroot/project/buildroot/output/host/bin/powerpc64le-buildroot-linux-gnu-gcc
-shared -Wl,-soname,libreadline.so.7.0 -pie -Wl,-z,now -Wl,-z,relro
-Wl,-rpath,/usr/lib -Wl,-soname,`basename libreadline.so.7.0 .0` -o
libreadline.so.7.0 readline.so vi_mode.so funmap.so keymaps.so parens.so
search.so rltty.so complete.so bind.so isearch.so display.so signals.so util.so
kill.so undo.so macro.so input.so callback.so terminal.so text.so nls.so
misc.so history.so histexpand.so histfile.so histsearch.so shell.so mbutil.so
tilde.so colors.so parse-colors.so xmalloc.so xfree.so compat.so -lncurses
/home/buildroot/project/buildroot/output/host/bin/powerpc64le-buildroot-linux-gnu-gcc
-shared -Wl,-soname,libhistory.so.7.0 -pie -Wl,-z,now -Wl,-z,relro
-Wl,-rpath,/usr/lib -Wl,-soname,`basename libhistory.so.7.0 .0` -o
libhistory.so.7.0 history.so histexpand.so histfile.so histsearch.so shell.so
mbutil.so xmalloc.so xfree.so -lncurses
/home/buildroot/project/buildroot/output/host/lib/gcc/powerpc64le-buildroot-linux-gnu/8.2.0/../../../../powerpc64le-buildroot-linux-gnu/bin/ld:
/home/buildroot/project/buildroot/output/host/powerpc64le-buildroot-linux-gnu/sysroot/usr/lib/../lib64/Scrt1.o:(.data.rel.ro.local+0x8):
undefined reference to `main'
collect2: error: ld returned 1 exit status
Makefile:180: recipe for target 'libhistory.so.7.0' failed
make[2]: *** [libhistory.so.7.0] Error 1
make[2]: *** Waiting for unfinished jobs....
/home/buildroot/project/buildroot/output/host/lib/gcc/powerpc64le-buildroot-linux-gnu/8.2.0/../../../../powerpc64le-buildroot-linux-gnu/bin/ld:
/home/buildroot/project/buildroot/output/host/powerpc64le-buildroot-linux-gnu/sysroot/usr/lib/../lib64/Scrt1.o:(.data.rel.ro.local+0x8):
undefined reference to `main'
collect2: error: ld returned 1 exit status
Makefile:176: recipe for target 'libreadline.so.7.0' failed
make[2]: *** [libreadline.so.7.0] Error 1
make[2]: Leaving directory
'/home/buildroot/project/buildroot/output/build/readline-7.0/shlib'
Makefile:209: recipe for target 'shared' failed
make[1]: *** [shared] Error 2
make[1]: Leaving directory
'/home/buildroot/project/buildroot/output/build/readline-7.0'
package/pkg-generic.mk:229: recipe for target
'/home/buildroot/project/buildroot/output/build/readline-7.0/.stamp_built'
failed
make: ***
[/home/buildroot/project/buildroot/output/build/readline-7.0/.stamp_built]
Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
