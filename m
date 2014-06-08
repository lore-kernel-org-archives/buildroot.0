From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  8 Jun 2014 07:03:29 +0000 (UTC)
Subject: [Buildroot] [Bug 7172] Name collision of rpath token expansion and
 internal variables
In-Reply-To: <bug-7172-163@https.bugs.busybox.net/>
References: <bug-7172-163@https.bugs.busybox.net/>
Message-ID: <20140608070329.A41679CEEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7172

--- Comment #1 from Samuel Martin <s.martin49@gmail.com> 2014-06-08 07:03:28 UTC ---
Mike,

(In reply to comment #0)
> Ref:  man ld.so
> 
> Example:
> In menu -> tool chain -> Target Linker Options (BR2_TARGET_LDFLAGS) to:
> -Wl,-rpath='$ORIGIN/../lib'
> (A relative path from executable to pathname of its required libraries.
> The example in ld.so manual.).
> 
> Build BusyBox (which honors BR_TARGET_LDFLAGS, not everything does).
> 
> Use: readelf -dl on the resulting binary and find an entry similar to:
>  0x0000000f (RPATH)                      Library rpath: [outputRIGIN/../lib]
> 
> Where the $O of $ORIGIN has been expanded to an internal value by the time the
> content of BR2_TARGET_LDFLAGS is seen by the compiler.

Unfortunately, there is no trivial solution. This bug comes from the
interaction between Buildroot and the packages' build-systems (especially those
based on autotools).

I mean there no easy way to correctly escape "$ORIGIN" in makefiles (form
Buildroot and the package itself) or/and in sh scripts.

> 
> This was when using the Buildroot generation of a toolchain.
> Other toolchain selections not tested.

The toolchain has nothing to do with this issue.


From the couple of experiments I run, the only reliable solution to correctly
set RPATH is using chrpath or patchelf at the end of the build.


Regards,

Samuel

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
