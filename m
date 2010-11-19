From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Nov 2010 10:56:10 +0100
Subject: [Buildroot] [PATCH] autotools: add with/without and
 enable/disable helpers
In-Reply-To: <201011190320.21230.vapier@gentoo.org>
References: <1290141237-30539-1-git-send-email-vapier@gentoo.org>
	<20101119085518.655d8c0d@surf>
	<201011190320.21230.vapier@gentoo.org>
Message-ID: <20101119105610.2c393dc1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mike,

All your patches are well appreciated. However, I feel some
aggressiveness in your replies, which I don't really understand. Again,
I really do appreciate all those improvements, so can we keep the
discussion nice and friendly ?

On Fri, 19 Nov 2010 03:20:18 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> not really.  this is the whole point of make's lazy evaluation.  so
> unless somewhere the code is wrongly using ":=", these shouldnt be
> executed unless the configure script in question is actually run.  a
> simple test on my side says that it is working as i expect -- lazily.

Right. The case I was mentionning was the UPPERCASE macro which was use
directly in the $(eval $(call AUTOTARGETS,...)) of each package. So,
this macro was actually evaluated when make was parsing all
packages .mk files. But that's different from the current case, you're
right.

> > It'd be nicer if we could use a pure Makefile implementation. What
> > about a simpler :
> > 
> > USE_WITH = $(if $(BR2_$(1)),--with-$(2),--without-$(2))
> > USE_ENABLE = $(if $(BR2_$(1),--enable-$(2),--disable-$(2)))
> 
> this isnt functionally equivalent ... there is no support for the
> optional [=val] with the flag

Ah, correct, I missed that. So, what about:

USE_WITH = $(if $(BR2_$(1)),       \
              $(if $(3),           \
                 --with-$(2)=$(3), \
                 --with-$(2)       \
              ),                   \
              --without-$(2))

USE_ENABLE = $(if $(BR2_$(1)),        \
                $(if $(3),            \
                  --enable-$(2)=$(3), \
                  --enable-$(2)       \
                ),                    \
                --disable-$(2))

It's not that I'm against using the shell, but for this particular
macro, the make language seems to be quite appropriate.

And it'd be nice to add some words in the documentation about this as
well (but I can do that later on if you wish).

> this is due to poor design on the behalf of buildroot.  it really
> needs to adopt more Kconfig style and do stuff like:
> foo-y =
> foo-$(BR2_xxx) += libpng

I'm for sure open to improvements/changes in the package
infrastructure. For which variables should we use this ? I'm thinking
of all "cumulative" variables. So in the generic infrastructure:

 <pkg>_DEPENDENCIES
 <pkg>_POST_PATCH_HOOKS
 <pkg>_PRE_CONFIGURE_HOOKS
 <pkg>_POST_CONFIGURE_HOOKS
 <pkg>_POST_BUILD_HOOKS
 <pkg>_POST_INSTALL_HOOKS
 <pkg>_POST_INSTALL_STAGING_HOOKS
 <pkg>_POST_INSTALL_TARGET_HOOKS

and for the autotools packages, also:

 <pkg>_CONF_ENV
 <pkg>_CONF_OPT
 <pkg>_MAKE_ENV
 <pkg>_MAKE_OPT
 <pkg>_AUTORECONF_OPT
 <pkg>_INSTALL_STAGING_OPT
 <pkg>_INSTALL_TARGET_OPT
 <pkg>_CLEAN_OPT
 <pkg>_UNINSTALL_STAGING_OPT
 <pkg>_UNINSTALL_TARGET_OPT

For all those variable, we would take into account:

 <pkg>_<varname> (for compatibility reasons)

and

 <pkg>_<varname>-y

Does that sounds like what you're suggesting ?

> and again, please retain cc in replies

Sorry, done this time. But I may well forget again in the future, I'm
not used to retain cc in replies. Will try my best to not forget it.

Thanks again!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101119/17a8b208/attachment.pgp>
