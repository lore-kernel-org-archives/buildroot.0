From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  1 Feb 2012 17:23:07 +0000 (UTC)
Subject: [Buildroot] [Bug 4718] python (built for powerpc) distutils has
 paths to host compiler toolchain
In-Reply-To: <bug-4718-163@https.bugs.busybox.net/>
References: <bug-4718-163@https.bugs.busybox.net/>
Message-ID: <20120201172307.20B839096F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4718

--- Comment #2 from William Welch <bvwelch@gmail.com> 2012-02-01 17:23:06 UTC ---
(In reply to comment #1)
> Python support for cross-compilation is quite horrible, so the problem may be
> quite hard to fix.
> 
> Could you give some steps to reproduce what you are seeing?

First, may I say that with some more research I found a workaround that is easy
and works good.

But, here is what happens without the workaround:


python setup.py build_ext --inplace

running build_ext
building '_ncapio' extension
creating build
creating build/temp.linux-ppc-2.7

/home/bwelch/jan23a/buildroot-2011.11/output/host/usr/bin/powerpc-unknown-linux-uclibc-gcc
-fno-strict-aliasing -pipe -Os -DNDEBUG -g -fwrapv -O3 -Wall
-Wstrict-prototypes -fPIC -I/usr/include/python2.7 -c _ncapio.c -o
build/temp.linux-ppc-2.7/_ncapio.o

unable to execute
/home/bwelch/jan23a/buildroot-2011.11/output/host/usr/bin/powerpc-unknown-linux-uclibc-gcc:
No such file or directory

error: command
'/home/bwelch/jan23a/buildroot-2011.11/output/host/usr/bin/powerpc-unknown-linux-uclibc-gcc'
failed with exit status 1

Note that instead of using my native powerpc 'gcc' and 'ld', somehow it tried
to use pathnames from my host computer's cross-toolcain??

------------------------

Now the simple workaround:

export CC='gcc -pthread -shared -Wl,-O1 -Wl,-Bsymbolic-functions'
export LDSHARED='ld -shared'

running build_ext
building '_ncapio' extension
gcc -pthread -shared -Wl,-O1 -Wl,-Bsymbolic-functions -fno-strict-aliasing
-pipe -Os -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -fPIC
-I/usr/include/python2.7 -c _ncapio.c -o build/temp.linux-ppc-2.7/_ncapio.o

ld -shared build/temp.linux-ppc-2.7/_ncapio.o -L/usr/lib -lpython2.7 -o
/root/ncapio/_ncapio.so


# works fine

thank you!  buildroot, python, native gcc all working great

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
