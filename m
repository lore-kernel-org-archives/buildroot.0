From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 10 Mar 2016 22:20:24 +0000
Subject: [Buildroot] [Bug 7562] musl buildroot-toolchain and
	BR2_MIPS_SOFT_FLOAT break
In-Reply-To: <bug-7562-163@https.bugs.busybox.net/>
References: <bug-7562-163@https.bugs.busybox.net/>
Message-ID: <bug-7562-163-Q3nj1pNTaO@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7562

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed in git by:

commit 348d5edd91abec1fc4cc27965220d54e58217dc3
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Tue Mar 8 22:20:55 2016 +0100

    gcc: fix dynamic linker path for mips soft-float

    This commit updates the gcc musl patches for gcc 4.7, 4.8 and 4.9 so
    that the path to the dynamic linker encoded as "program interpreter"
    in the generated binaries actually matches the symbolic link installed
    by musl when building for mips soft-float.

    Indeed, musl installs a symlink called ld-musl-mipsel-sf.so.1, but gcc
    currently generates binaries that use /lib/ld-musl-mips.so as program
    interpreter.

    The fix is simply the one from
    https://bitbucket.org/GregorR/musl-cross/commits/825219202365, i.e
    adjust MUSL_DYNAMIC_LINKER in our musl gcc patches.

    Thanks to these patches:

    $ ./host/usr/bin/mipsel-linux-readelf -a ./target/bin/busybox
    [...]
          [Requesting program interpreter: /lib/ld-musl-mipsel-sf.so.1]
    [...]

    gcc 5.x doesn't need any fix because the musl patches already use the
    right value.

    Fixes bug #7562.

    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

-- 
You are receiving this mail because:
You are on the CC list for the bug.
