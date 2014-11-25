From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Tue, 25 Nov 2014 17:53:29 +0100
Subject: [Buildroot] Compilation flags in Buildroot
Message-ID: <7e066711226b415908dd0805029e0c22@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have some questions about Buildroot options related to compilation 
flags.

In the first place, there is BR2_TARGET_OPTIMIZATION.
The content of this option (usually a list of gcc flags) is used:

* in the toolchain wrapper for external toolchains
   (buildroot/toolchain/toolchain-external/toolchain-external.mk)
   so that the flags *always* apply (they are carried by gcc wrapper)

* in TARGET_CFLAGS, so that it is also forwarded to packages in a more 
standard way,
   and will apply *only if* the package build system takes care of 
TARGET_CFLAGS.

BR2_OPTIMIZE_x option is turned into -Ox option in TARGET_CFLAGS.

BR2_ENABLE_SSP option is turned into -fstack-protector-all option in 
TARGET_CFLAGS.

I have also noticed that there have been some proposals to turn 
BR2_TARGET_OPTIMIZATION - which
is a toolchain option - into a build option (BR2_EXTRA_TARGET_CFLAGS):
See:
* http://lists.busybox.net/pipermail/buildroot/2008-December/024161.html
* http://lists.busybox.net/pipermail/buildroot/2010-January/031518.html

My questions are:

* What is the proper use of BR2_TARGET_OPTIMIZATION?
   Is it safe to use it to apply gcc flags in all packages?

* If not, wouldn't it be useful to have an option in which you can 
define whatever flag you need,
   that would be set in TARGET_CFLAGS?
   That seemed to be the purpose of BR2_EXTRA_TARGET_CFLAGS proposal, 
that was obviously not
   accepted.

* What happens if my flag should not apply to the Linux kernel?
   If I set -fPIC in BR2_TARGET_OPTIMIZATION, for user space programs, it 
will apply to the
   kernel as well.
   And it seems that the kernel should not be compiled with this option. 
With some versions
   I believe that compilation will fail.
   If -fPIC was set in a BR2_EXTRA_TARGET_CFLAGS option, it would not be 
forwarded to the
   kernel. But the drawback is that it might not be forwarded to some 
other packages, since
   it depends on each package build system taking TARGET_CFLAGS into 
account or not... :)

Thank you.
Regards.

-- 
C?dric
