From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Nov 2014 19:20:43 +0100
Subject: [Buildroot] Samba4 build issue
In-Reply-To: <5458DC52.6020706@zacarias.com.ar>
References: <20141101233957.7ca9aabd@free-electrons.com>
 <545577D9.1040405@zacarias.com.ar>
 <20141102103811.16e499df@free-electrons.com>
 <545628BF.2030101@zacarias.com.ar>
 <20141104082623.33a2136e@free-electrons.com>
 <5458DC52.6020706@zacarias.com.ar>
Message-ID: <20141104192043.03f7159b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 04 Nov 2014 11:01:54 -0300, Gustavo Zacarias wrote:

> D'oh!
> http://autobuild.buildroot.net/results/992/9928a251e5cfcf6e574a447221e938135eeb69f9/build-end.log
> Seems the new libcap version requires 3.1+ kernel headers.
> I'm not a big fan of those ppc toolchains since they're old, but what's
> the linux headers baseline we're looking for?

There was a patch from Bernd, a759931c9b0cb4337dc30fd35d03ce123271c5a4,
which made libcap depend on headers >= 3.7. But I reverted it in
d5146f4b53d926c13a47215ac514e43b2c66b9ac, because Bernd's analysis was
not correct, and libcap did not depend on kernel headers >= 3.7.

Are you sure 3.1 is really the correct starting point? Here is what I
wrote at the time:

""""
 * First, the XATTR_NAME_CAPS was *not* introduced in kernel 3.7 has
   claimed by the commit log. The kernel commit
   https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/include/linux/xattr.h?id=607ca46e97a1b6594b29647d98a32d545c24bdff
   pointed by the commit log as the one introducing XATTR_NAME_CAPS
   was badly interpreted. This commit is the one where the userspace
   side of the kernel headers was separated from the kernel side of
   the kernel headers (before we had only <linux/foo.h>, now we have
   <linux/foo.h> and <uapi/linux/foo.h>). In reality, XATTR_CAP_NAMES
   has been defined in <linux/xattr.h> since commit
   af4f136056c984b0aa67feed7d3170b958370b2f which was merged in
   2.6.36. And before that, the definition was anyway present in
   <linux/capability.h>. XATTR_NAME_CAPS was originally introduced in
   b53767719b6cd8789392ea3e7e2eb7b8906898f0, which was merged in
   kernel 2.6.24.
""""

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
