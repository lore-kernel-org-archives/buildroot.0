From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Feb 2021 22:37:27 +0100
Subject: [Buildroot] [PATCH-NEXT 2/4] package/linux-firmware.mk: get rid
 of temporary tarball for file installation
In-Reply-To: <20210212203939.GK1679218@scaer> (Yann E. MORIN's message of
 "Fri, 12 Feb 2021 21:39:39 +0100")
References: <20210212184049.13202-1-peter@korsgaard.com>
 <20210212184049.13202-3-peter@korsgaard.com>
 <20210212203939.GK1679218@scaer>
Message-ID: <87blcpezmw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2021-02-12 19:40 +0100, Peter Korsgaard spake thusly:
 >> With the upcoming addition of the images-install step,
 >> LINUX_FIRMWARE_INSTALl_FILES is called twice, for installing to the target
 >> and to the images directory - Which may race with each other and cause
 >> problems with the temporary install.tar tarball.
 >> 
 >> There is no specific reason to use a temporary file, we can just as well
 >> pipe the two tar invocations together, so do that instead.

 > Actually, there *is* a reason why an intermediate tarball is used, see
 > commit 21a283ffb0d (linux-firmware: fail build for missing file).

 > The idea is that, when we bump the version a firmware file may get
 > removed, and we may not notice right when updating (because of the 
 > many sub-options), and that file is still isted.

 > If that is the case, then the first tar will bail out on that missing
 > file, and stop right away, thus not including the followign files. But
 > because it is on the LHS of a pipe, its return code is ignored.

 > Then the second tar is still happy with what it gets, because it is a
 > proper tar archive (if the last file in a tarball was extracted
 > successfully, there is no way to know if the tarball was truncated or
 > not).

 > As a consequence, the copy is only partial, and the build does not fail.

Ok, so we need to stick a set -o pipefail before?

-- 
Bye, Peter Korsgaard
