From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 30 Oct 2018 08:36:58 +0000
Subject: [Buildroot] [Bug 11451] Can't find libmpfr.so.4 when using external
 toolchain on ubuntu 18.04/18.10
In-Reply-To: <bug-11451-163@https.bugs.busybox.net/>
References: <bug-11451-163@https.bugs.busybox.net/>
Message-ID: <bug-11451-163-f3Ol2xaOV9@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11451

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
If the programs in your external toolchain use libmpfr.so, but it is not
provided by the external toolchain, then the external toolchain is broken.

Your patch causes two problems:

 (1) libmpfr.so is not guaranteed to be installed $(HOST_DIR)/lib. Buildroot
only builds/installs host-mpfr if needed, and a typical configuration that uses
an external toolchain will not build/install host-mpfr.

 (2) Passing LD_LIBRARY_PATH pointing to some host libraries will very likely
confuse the cross-compilation of some packages. We tried a while ago to use
LD_LIBRARY_PATH, and it was a total failure.

So, here, you really need to fix the external toolchain itself.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
