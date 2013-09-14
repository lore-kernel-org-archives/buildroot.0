From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Sep 2013 17:03:16 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-09-13
In-Reply-To: <16A28366-18D6-4148-B7E5-1FB4C61CB473@layer-7.net>
References: <20130914063005.CC66352C101@lolut.humanoidz.org>
 <16A28366-18D6-4148-B7E5-1FB4C61CB473@layer-7.net>
Message-ID: <20130914170316.52a4eec6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Michael Rommel,

On Sat, 14 Sep 2013 14:36:26 +0200, Michael Rommel wrote:

> I thought I take care of one of the build failures from yesterday and picked the line:
> 
>       arm |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/e93e24d210dc7a2a51758536b7b3964b8a3251b4/
> 
> I tried to reproduce the error, but was unable to do so in three attempts.
>  1. used a clean i568 toolchain without configuration and gave only a make toolchain libssh2
>  2. used a clean arm toolchain with a default .config file and made a make toolchain libssh2
>  3. used the config file from the autobuilder and did a make toolchain libssh2

If you do 'make toolchain libssh2', you're not reproducing what the
autobuilder did, because you're telling Buildroot to just build the
toolchain, and then libssh2 (and its dependencies).

What the autobuilder is just a simple 'make'. So many more things might
have been built before libssh2 and its dependencies, and it is
sometimes what is affecting the build and causing the failure.

Another possibility is that your host system isn't necessarily
comparable to the one of the autobuilders. All the build tests executed
on the Free Electrons server take place inside a minimal Debian chroot,
that has only the minimal set of packages needed to get Buildroot
running. This is most likely different from your machine, which
probably has a lot more packages installed, including a number of
development packages for some libraries.

I'd recommend to first try to reproduce with just a plain 'make'. If
you still can't reproduce the failure, then I'll have a look myself
using the autobuilder environment.

Maybe I should be providing a script that downloads the complete
chroot, and reproduce the build failure within the chroot, so that
people can get the exact same behavior as the one in the autobuilder
machine.

Anyway, thanks for having taken the time to look at this build failure!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
