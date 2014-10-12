From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 12 Oct 2014 20:38:22 +0000 (UTC)
Subject: [Buildroot] [Bug 7478] Multiple chosen python modules are not built
 due to missing header files in include path
In-Reply-To: <bug-7478-163@https.bugs.busybox.net/>
References: <bug-7478-163@https.bugs.busybox.net/>
Message-ID: <20141012203822.F2606B0080@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7478

--- Comment #5 from Christian Abegg <cma@vtxnet.ch> 2014-10-12 20:38:21 UTC ---
Thanks a lot for your reply.

a. This seems logical. However, chosen modules in the configuration where
showing up in that list.

b. I retried multiple builds with the latest version of buildroot (git
526e3d0). What I observed is that when using the buildroot internal toolchain,
the python sqlite3 modules were never built. On the other hand, when using an
external toolchain (I used Sourcery CodeBench x86/x86_64 2012.09) the python
sqlite3 modules were correctly built.

So using an external toolchain solves the problem, which is a bit strange.

Here are some excerpts of the python build log, 

using the buildroot toolchain:
building '_curses' extension
/tmp/buildroot/output/host/usr/bin/i686-buildroot-linux-gnu-gcc -fPIC
-fno-strict-aliasing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os -DNDEBUG -g -fwrapv -O3 -Wall
-Wstrict-prototypes -I. -IInclude -I./Include
-I/tmp/buildroot/output/build/python-2.7.8/Include
-I/tmp/buildroot/output/build/python-2.7.8 -c
/tmp/buildroot/output/build/python-2.7.8/Modules/_cursesmodule.c -o
build/temp.linux2-i686-2.7/tmp/buildroot/output/build/python-2.7.8/Modules/_cursesmodule.o

using an external toolchain:
building '_curses' extension
/tmp/buildroot/output/host/usr/bin/i686-pc-linux-gnu-gcc -fPIC
-fno-strict-aliasing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -I.
-IInclude -I./Include
-I/tmp/buildroot/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/include
-I/tmp/buildroot/output/build/python-2.7.8/Include
-I/tmp/buildroot/output/build/python-2.7.8 -c
/tmp/buildroot/output/build/python-2.7.8/Modules/_cursesmodule.c -o
build/temp.linux2-i686-2.7/tmp/buildroot/output/build/python-2.7.8/Modules/_cursesmodule.o

The difference I see between the internal and external toolchain, is that with
the external one python is built with an additional include path:
-I/tmp/buildroot/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/include.
In this directory are the sqlite3.h headers among others.

You said you used an external toolchain and the python sqlite module built
fine. If you use the internal toolchain, does the module also build correctly?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
