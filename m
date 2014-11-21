From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 21 Nov 2014 23:36:57 +0000 (UTC)
Subject: [Buildroot] [Bug 7670] Fails to build mpc-1.0.2 on latest Cygwin
In-Reply-To: <bug-7670-163@https.bugs.busybox.net/>
References: <bug-7670-163@https.bugs.busybox.net/>
Message-ID: <20141121233657.4C56A7FE1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7670

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |yann.morin.1998 at free.fr
         Resolution|                            |WONTFIX

--- Comment #4 from Yann E. MORIN <yann.morin.1998@free.fr> 2014-11-21 23:36:55 UTC ---
Ok, I toyed with a Win7 VM here, struggled to install it and install Cygwin.

Running Buildroot git master indeed breaks for me.

As it turns out, Cygwin is horribly broken, and there is no way we can even
remotely support this...

So, here's how it goes:
  - in Cygwin, it is customary to install libs at the same place executables
are installed;
  - so, in Cygwin, libraries are searched in ${PATH}, as well as the usual
other places;
  - the native compiler is linked with cygmpfr-4.dll;
  - we build and install mpfr (dependency of mpc) which install cygmpfr-4.dll
in $(O)/host/usr/bin/cygmpfr-4.dll ;
  - we have $(O)/host/usr/bin is ${PATH} because, well, we need it,
obviously...

So, when we try to run the native compiler, it tries to run-time link with
*our* cygmpfr.dll, not the system one.

Bummer, it breaks...

OK, did I say we're not gonna support that use-case?

Better install a real Linux box; a VM might even be faster than Cygwin...

Closing as WONTFIX.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
