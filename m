From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Mar 2013 15:21:22 +0100
Subject: [Buildroot] [PATCH v2] gdb: convert to the package
 infrastructure
In-Reply-To: <201303192134.32575.yann.morin.1998@free.fr>
References: <1363720308-12881-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <201303192134.32575.yann.morin.1998@free.fr>
Message-ID: <20130320152122.0e661e86@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 19 Mar 2013 21:34:32 +0100, Yann E. MORIN wrote:

> There is a little inconsistency in the available choices:
>     Toolchain  --->
>         [ ] Copy gdb server to the Target
> 
> is still available, even if:
>     Package Selection for the target  --->
>         Debugging, profiling and benchmark  --->
>             [*] gdb
>             [*]   gdbserver
> 
> I think it does not make sense to both copy the gdbserver from the
> toolchain, *and* build our own version.

Yes. I don't think it's really "inconsistent", but can certainly be
improved. I was thinking of doing that sort of improvement as a second
step.

> Given that the cross-gdb and the gdbserver are tightly coupled one to
> the other, I think we should have these possibility expressed in the
> menuconfig:
> 
>   - copy gdbserver from the external toolchain
>     --> this assumes that there is a cross-gdb in the toolchain
>     --> we should not build our own host cross-gdb
>     --> we should not build our gdbserver
>     --> we can build the full gdb (on the target)
> 
>   - do not copy gdbserver from the toolchain
>     --> we can build both our host cross-gdb and our gdbserver
>     --> we can build the full gdb (on the target)
>     --> if the user uses the cross-gdb from the external toolchain, and
>         it breaks, then too bad for him/her.
> 
> At the very least, the external gdbserver and our own should be mutually
> exclusive.

I generally agree with your proposal. Do you mind if I implement that
as a followup patch? The current patch is already a bit large to
review.

> Also, the host cross-gdb and the gdbserver should be compiled from the
> same version, otherwise you may experience breakage. Although the
> gdbserver protocol should be stable, experience has proven this is not
> always the case.
> 
> So I would suggest that, if we build the gdb (on the target) and/or the
> gdbserver, then the host cross-gdb version should not be selectable, and
> should be deduced from the version used to build the gdb (on the target).

It is already the case. Look at gdb.mk:

------------------------------------------------------------------

GDB_VERSION = $(call qstrip,$(BR2_GDB_VERSION))
GDB_SITE    = $(BR2_GNU_MIRROR)/gdb

# When no version is defined, it means that cross-gdb for the host has
# not been enabled, and we will only build gdbserver or gdb for the
# target. In this case, use the latest available version
# automatically.
ifeq ($(GDB_VERSION),)
ifeq ($(BR2_bfin),y)
GDB_VERSION = 6.6a
else ifeq ($(BR2_avr32),y)
GDB_VERSION = 6.7.1-avr32-2.1.5
GDB_SITE    = ftp://www.at91.com/pub/buildroot/
else
GDB_VERSION = 7.5.1
endif
endif

------------------------------------------------------------------

As the comment explains, if you have selected cross-gdb, then
BR2_GDB_VERSION will be non-empty (defined in
package/gdb/Config.in.host) and we will use this version to build
gdbserver and the gdb on the target. If no cross-gdb has been selected,
then we will use some default version (6.6a, 6.7.1 or 7.5 depending on
the architecture).

Doesn't that solve the issue you're raising?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
