From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Aug 2013 23:26:33 +0200
Subject: [Buildroot] [PATCH] toolchain: add support for glibc
In-Reply-To: <521534E2.7020606@mind.be>
References: <1376847393-12397-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <521534E2.7020606@mind.be>
Message-ID: <20130822232633.7ba9b14d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 21 Aug 2013 23:45:06 +0200, Arnout Vandecappelle wrote:
> On 18/08/13 19:36, Thomas Petazzoni wrote:
> > The support for eglibc 2.17 was added to the internal toolchain
> > backend for 2013.08. This commit now adds glibc 2.18 support to the
> > internal toolchain backend. The building procedure is very similar to
> > the one of eglibc, with a few differences, but the two are kept
> > separate for now.
> 
>   I'm not sure if that's a good idea... Will merging them later be easier?

I don't know for sure, but the package aren't that complex, so I don't
think merging would be very difficult.

If I had to merge them, where should I put the common code?

> [snip]
> > +define GLIBC_CONFIGURE_CMDS
> > +	mkdir -p $(@D)/build
> > +	# Do the configuration
> > +	(cd $(@D)/build; \
> > +		$(TARGET_CONFIGURE_OPTS) \
> > +		CFLAGS="-O2 $(GLIBC_EXTRA_CFLAGS)" CPPFLAGS="" \
> 
>   The -O2 was required for eglibc. Why do we have it here as well?

I believe yes. At least, Crosstool-NG does it, AFAIK. The glibc and
eglibc code base are very very similar, so it wouldn't surprise me that
the same 'constraint' applies on both.

> [snip]
> > +ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
> > +GLIBC_LIBS_LIB += libthread_db.so
> > +endif
> 
>   Shouldn't this lib be installed as well for a gdb without gdbserver? 
> I.e., shouldn't the condition be ifeq ($(BR2_PACKAGE_GDB),y)?

That's a good question, I don't know. At the moment, the ct-ng backend,
the external backend and the eglibc .mk file all copy libthread_db.so
when gdbserver is enabled.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
