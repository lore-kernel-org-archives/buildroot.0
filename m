From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 22:18:04 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain-buildroot: create a
 relocatable one
In-Reply-To: <1402844418-28987-1-git-send-email-noamc@ezchip.com>
References: <1402844418-28987-1-git-send-email-noamc@ezchip.com>
Message-ID: <20141101221804.65152468@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Noam Camus,

On Sun, 15 Jun 2014 18:00:18 +0300, Noam Camus wrote:
> From: Tal Zilcer <talz@ezchip.com>
> 
> This adds ability so that pre built buildroot toolchain and GDB can be used
> by others in different computers without the need to build them again.
> 
> Note: the toolchain/GDB is still depended on native libraries.
> 
> Signed-off-by: Tal Zilcer <talz@ezchip.com>
> Signed-off-by: Noam Camus <noamc@ezchip.com>
> ---
>  package/expat/expat.mk                  |    4 ++++
>  package/gmp/gmp.mk                      |    4 ++++
>  package/mpc/mpc.mk                      |    4 ++++
>  package/mpfr/mpfr.mk                    |    4 ++++
>  toolchain/toolchain-buildroot/Config.in |    8 ++++++++
>  5 files changed, 24 insertions(+), 0 deletions(-)

Thanks for this proposal. We discussed it during the last Buildroot
meeting in D?sseldorf, and the general feeling is that while we
acknowledge the current problem, we don't believe your proposal is the
right solution.

The problem is that your solution only fixes gcc/gdb, but we generally
want the "SDK" (so not only the toolchain itself, but also all other
host tools like pkg-config, automake, autoconf, etc.) to be
relocatable. We believe that the real solution is to use something like
patchelf (https://nixos.org/patchelf.html) to adjust the RPATH of the
binaries so that they use something like $ORIGIN/../lib, and therefore
find the shared libraries where they are.

We have for now marked your patch as Rejected, but we definitely
welcome other patches implementing the RPATH fixup solution.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
