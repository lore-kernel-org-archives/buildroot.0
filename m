From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Aug 2019 14:44:52 +0000
Subject: [Buildroot] [Bug 12076] Patchelf can link against an incompatible
 libc++ version
In-Reply-To: <bug-12076-163@https.bugs.busybox.net/>
References: <bug-12076-163@https.bugs.busybox.net/>
Message-ID: <bug-12076-163-l52QRxKal9@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12076

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #3 from Arnout Vandecappelle <arnout@mind.be> ---
Thank you for the files.

I still believe the issue is in your Docker container itself.

The symbol that triggers this is __throw_out_of_range_fmt:

$ readelf -a patchelf-buildroot | grep 3\\.4\\.20
0000006203c0  000500000007 R_X86_64_JUMP_SLO 0000000000000000
_ZSt24__throw_out_of_r at GLIBCXX_3.4.20 + 0

It is linked only if you use a class which may throw an out of range error.
However, it should get pulled in by <string> which (eventually) includes
<bits/basic_string.h>. So the simple helloworld.cpp wouldn't trigger it, but if
you do something like std::string("foo")[4] you should actually trigger this
exception and hit that code path.

In addition, for Buildroot builds you use /opt/gcc/4.9/bin/g++ while for the
helloworld compilation you use just g++, which is probably /usr/bin/g++.

I suspect that the problem is that /opt/gcc/4.9/bin/g++ does not set a proper
RPATH for its libstdc++. You could add it to /etc/ld.so.conf, but I don't know
if ld.so is smart enough to use a different version of a dynamic library
depending of the symbols that are requested.

You could also try to export HOST_LDFLAGS="-Wl,-rpath=/opt/gcc/4.9/lib" (or
whatever the path is that contains GCC 9's libstdc++.so).

In any case, I'm pretty sure this is due to a broken toolchain in your
container and not due to a Buildroot issue, and definitely nothing that we can
do about it. So I'm closing this as invalid. That said, don't hesitate to
continue asking help either here or on the mailing list or on IRC.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
