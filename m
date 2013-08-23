From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Aug 2013 06:48:45 +0200
Subject: [Buildroot] [PATCH] toolchain: add support for glibc
In-Reply-To: <52169E42.2040904@mind.be>
References: <1376847393-12397-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <521534E2.7020606@mind.be> <20130822232633.7ba9b14d@skate>
 <52169E42.2040904@mind.be>
Message-ID: <20130823064845.2ec4800d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Fri, 23 Aug 2013 01:26:58 +0200, Arnout Vandecappelle wrote:

> > I don't know for sure, but the package aren't that complex, so I don't
> > think merging would be very difficult.
> >
> > If I had to merge them, where should I put the common code?
> 
>   I was thinking to have just one glibc package, with a choice to select 
> eglibc or glibc.

Well, I still would like the libc selection to be uClibc/glibc/eglibc
in the choice in toolchain/toolchain-buildroot/Config.in. But I guess I
can probably make BR2_TOOLCHAIN_BUILDROOT_LIBC be equal to "glibc" in
both the glibc and eglibc case, which would be sufficient to make the
toolchain building logic use the "glibc" and "glibc-configure" targets
for both the eglibc and glibc selections.

Want me to rework the patch in this direction?

Note that later on, if we support several versions of glibc and eglibc,
then package/glibc/Config.in would look like:

if BR2_TOOLCHAIN_BUILDROOT_EGLIBC

	... versions of eglibc ...

endif

if BR2_TOOLCHAIN_BUILDROOT_GLIBC

	... versions of glibc ...

endif

> >>    Shouldn't this lib be installed as well for a gdb without gdbserver?
> >> I.e., shouldn't the condition be ifeq ($(BR2_PACKAGE_GDB),y)?
> >
> > That's a good question, I don't know. At the moment, the ct-ng backend,
> > the external backend and the eglibc .mk file all copy libthread_db.so
> > when gdbserver is enabled.
> 
>   To be tested but it'd surprise me if gdb didn't need it.

I agree, it would have to be tested.

Thanks for your feedback,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
