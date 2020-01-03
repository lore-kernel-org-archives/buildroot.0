From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 03 Jan 2020 19:58:35 +0000
Subject: [Buildroot] [Bug 12441] qt5webengine build error: asm/errno.h: No
 such file or directory
In-Reply-To: <bug-12441-163@https.bugs.busybox.net/>
References: <bug-12441-163@https.bugs.busybox.net/>
Message-ID: <bug-12441-163-BQcaAxYhOv@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12441

--- Comment #7 from Aleksandr Makarov <seems.deviant@gmail.com> ---
(In reply to Bartosz Bilas from comment #6)

Upgraded to Ubuntu 18.04 (was 16.04.4) and successfully built the config.

I decided to figure out the root cause of the issue and found it be g++ failing
 to compile certain Qt5Webengine files with -m32 flag specified. The easiest
way to reproduce was to create a sample file including errno.h:

$ cat bugged-compiler.c 
#include <errno.h>
int main() { return -ENOENT; }

And trying to compile it on Ubuntu 16.04:

$ /usr/bin/g++ -m32 -c -o bugged-compiler bugged-compiler.c
In file included from /usr/include/bits/errno.h:24:0,
                 from /usr/include/errno.h:35,
                 from bugged-compiler.c:1:
/usr/include/linux/errno.h:1:23: fatal error: asm/errno.h: No such file or
directory
compilation terminated.

On Ubuntu 18.04 it compiled successfully.

The issue was that I didn't have packages 'libc6-dev:i386 gcc-6-base:i386
libc6:i386 libc6-dev:i386 libgcc1:i386 linux-libc-dev:i386' installed in the 
 Ubuntu 16.04 system. After installing those the issue disappears.

I did't expect the gcc/g++ compiler installed in the system to be used anywhere
in the compilation process except for bootstrapping initial gcc compiler. As I
understand, the buildroot should only use the system gcc to build a cross
compiler and that's it. After the cross-compiler is installed under
<output>/host/ every package should be configured to use that cross-compiler
and it's sysroot.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
