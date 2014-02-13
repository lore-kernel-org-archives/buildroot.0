From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 13 Feb 2014 22:04:59 +0100
Subject: [Buildroot] [PATCH] systemd: fix build with uClibc toolchains
In-Reply-To: <1392243180-23730-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 12 Feb 2014 23:13:00 +0100")
References: <1392243180-23730-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87wqgypvus.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Currently, the build of systemd is broken with the internal toolchain
 > backend, because we have uClibc patches that add support for
 > execvpe(), but we also have a patch for systemd that adds execvpe(),
 > which was added when the internal uClibc didn't support execvpe().

 > However, simply dropping the patch is not a solution, as it would
 > break the build of systemd with any other uClibc than the ones built
 > with Buildroot. For example, a Crosstool-NG uClibc toolchain would
 > fail.

 > Beyond this execvpe() problem, there are also other problems that
 > prevented systemd from being built with unpatched uClibc.

 > This patch does the following:

 >  * Add sequence numbers of systemd patches.
 >  * Regenerate them to avoid fuzz.
 >  * Improve the uClibc compatibility patch so that it:
 >    - Detects whether execvpe() is available or not, and if not
 >      available provide an implementation.
 >    - Detects if dup3() is available or not, and if not available
 >      provide an implementation.
 >    - Detects if MSG_CMSG_CLOEXEC is defined or not, and if not, define
 >      it to the appropriate value.

 > This has been tested with uClibc internal toolchain, uClibc external
 > toolchain built with Buildroot, uClibc external toolchain built with
 > Crosstool-NG, and glibc external toolchain.

 > Fixes bug #6776.

 > Fixes:

 >   http://autobuild.buildroot.org/results/591/591c6055430da334bd1e46e7d01497add45da837/build-end.log
 >   http://autobuild.buildroot.org/results/e58/e5851939d2837d4e35a4c1d9ca6df3c93ed5a34b/build-end.log
 >   http://autobuild.buildroot.org/results/92e/92e4c40c69a3feb4046b2fe5a0d8c69d5a44a157/build-end.log

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 > Obviously, this patch is for the master branch. On the next branch,
 > systemd has been bumped to a much newer version of systemd, which is
 > now restricted to glibc. I however believe that it is worth having
 > systemd-44 working in 2014.02.

Committed, thanks.

-- 
Bye, Peter Korsgaard
