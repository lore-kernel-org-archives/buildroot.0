From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Apr 2021 20:07:52 +0000
Subject: [Buildroot] [Bug 13751] libopenssl (static): huge drop in
 performance in newer versions of buildroot
In-Reply-To: <bug-13751-163@https.bugs.busybox.net/>
References: <bug-13751-163@https.bugs.busybox.net/>
Message-ID: <bug-13751-163-Y2XLIhYcNf@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13751

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
(In reply to maksis33 from comment #0)
> I'd assume that the issue has something to do with
> http://lists.busybox.net/pipermail/buildroot/2019-October/263030.html
> as the OpenSSL target arch is "gcc no-asm" in Buildroot 2021.02.1 while 2019.02
> targets "linux-x86_64" and also has various *_ASM flags present in the Makefile.

The culprit is actually the following commit:

commit 8c2c959b028d44f5518d4445f864aedae3d90406
Author: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date:   Fri May 31 15:39:28 2019

    package/libopenssl: fix static build

    no-dso option has been removed with
   
https://github.com/openssl/openssl/commit/31b6ed76dfd53529b74e79830c81372d0b756929

    To fix this error, use "gcc" target in static builds. This target is
    very minimalistic, we need to manually pass -lpthread and
    -DOPENSSL_THREADS however we can also remove libdl workarounds

    Fixes:
     -
http://autobuild.buildroot.org/results/96d6b89d20980e8f7fa450b832474a81d492b315

    Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>


The problem is that in a static build, you don't have shared libraries so also
no DSO (the shared library provided by the kernel).


The upstream commit also adds a preprocessor symbol DSO_NONE (which is not set
by anything). So you could try reverting buildroot commit
8c2c959b028d44f5518d4445f864aedae3d90406 and add -DDSO_NONE to
LIBOPENSSL_CFLAGS.

Of course the revert is not entirely trivial, because the code was refactored
and has moved to Config.in...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
