From: Lou <br@sylou.fr>
Date: Tue, 25 Aug 2015 16:35:42 +0200
Subject: [Buildroot] Build issue with Boost 1.57
Message-ID: <fd17804bbc8b7e0ed06084244e477cea.squirrel@sylou.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Please pardon my ignorance, and accept my apologies if this is not the
right place for such 
discussion. I would like to report an issue I'm
seeing on my buildroot setup. 

I'm running Debian 7 64bits,
buildroot 2015.05. My target is the default config for raspberry pi. All
is fine until I include a package that requires the boost library. I find
it impossible to build this lib, for an unknown reason. The build just
hangs forever, during the bootstrapping phase of the package's
configuration. 

At the time the build freezes, the process tree
looks like this : 
UID??????????????
PID?? PPID?? C STIME
TTY?????????????????? TIME CMD
lou 24364 24884?? 0 Aug24 pts/2?????? 00:00:08
/bin/bash
lou?? 1931 24364?? 0 15:42 pts/2??????
00:00:02?? \_ make
lou?? 2180?? 1931?? 0 15:42
pts/2?????? 00:00:00?? |???? \_ /bin/sh -c (cd
/home/pkvk9345/buildroot-2015.05/output/build/boost-1.57.0 &&
./bootstrap.sh --without-icu??
--without-libraries=coroutine,atomic,chrono,con
lou?? 2181??
2180?? 0 15:42 pts/2?????? 00:00:00??
|???????????? \_ /bin/sh -c (cd
/home/pkvk9345/buildroot-2015.05/output/build/boost-1.57.0 &&
./bootstrap.sh --without-icu??
--without-libraries=coroutine,atomic,chrono
lou?? 2182??
2181?? 0 15:42 pts/2?????? 00:00:00??
|???????????????????? \_ /bin/sh
./bootstrap.sh --without-icu
--without-libraries=coroutine,atomic,chrono,container,context,date_time,exception,filesystem,graph,graph_para
lou?? 2198?? 2182?? 0 15:42 pts/2??????
00:00:00??
|????????????????????????????
\_ /bin/sh ./bootstrap.sh --without-icu
--without-libraries=coroutine,atomic,chrono,container,context,date_time,exception,filesystem,graph,graph_
lou?? 2199?? 2198?? 0 15:42 pts/2??????
00:00:00??
|????????????????????????????????????
\_ /bin/sh ./build.sh gcc
lou?? 2304?? 2199?? 0 15:43
pts/2?????? 00:00:00??
|????????????????????????????????????????????
\_ ./bootstrap/jam0 -f build.jam --toolset=gcc --toolset-root= clean

I did not manage to fully debug jam0 at this point, for the lack
of debug symbols, but I have identified the following backtrace using gdb
: 

(gdb) where
#0?? 0x00002b2fdc4f92c5 in
*__GI___xstat (vers=<optimized out>, name=<optimized out>,
buf=0x7ffca8b8b100) at
../sysdeps/unix/sysv/linux/wordsize-64/xstat.c:38
#1??
0x000000000041e11f in file_query_posix_ ()
#2??
0x00000000004270bc in file_query_ ()
#3?? 0x000000000041e074 in
file_query ()
#4?? 0x0000000000426f73 in
file_collect_dir_content_ ()
#5?? 0x000000000041e277 in
file_dirscan_impl ()
#6?? 0x000000000041ded9 in file_dirscan
()
#7?? 0x000000000041f9d0 in builtin_glob ()
#8??
0x000000000040ba90 in function_run ()
#9?? 0x0000000000402861 in
evaluate_rule ()
#10 0x00000000004043e3 in function_call_rule ()
#11 0x000000000040d52e in function_run ()
#12 0x000000000041765a in
parse_file ()
#13 0x000000000041065d in main ()

Looks like
the clean opertation is stuck in a system call. I will try to enable debug
symbols in the jam0 tool which is built just before this, but the
buildroot option to such intent does not seem to work here.

Any
help is greatly appreciated.

Lou
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150825/f843b267/attachment.html>
