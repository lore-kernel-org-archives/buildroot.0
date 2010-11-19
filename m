From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 19 Nov 2010 03:20:18 -0500
Subject: [Buildroot] [PATCH] autotools: add with/without and
	enable/disable helpers
In-Reply-To: <20101119085518.655d8c0d@surf>
References: <1290141237-30539-1-git-send-email-vapier@gentoo.org>
	<20101119085518.655d8c0d@surf>
Message-ID: <201011190320.21230.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, November 19, 2010 02:55:18 Thomas Petazzoni wrote:
> On Thu, 18 Nov 2010 23:33:57 -0500 Mike Frysinger wrote:
> > +# $(call _USE_CONF,enable,disable,LIB_FFMPEG,video,blah) ->
> > --enable-video=blah if LIB_FFMPEG +# $(call
> > _USE_CONF,with,without,LIB_FFMPEG,video)        -> --with-video if
> > LIB_FFMPEG +_USE_CONF = $(shell \
> > +	opt="$(5)"; test "$${opt:+set}" = "set" && opt="=$${opt}"; \
> > +	test "$(BR2_$(3))" = "y" \
> > +		&& echo "--$(1)-$(4)$${opt}" \
> > +		|| echo "--$(2)-$(4)")
> 
> However, I'm worried that this will start a shell process when
> evaluating *each* USE_ENABLE/USE_WITH call, and this will slow down the
> start up of Buildroot.

not really.  this is the whole point of make's lazy evaluation.  so unless 
somewhere the code is wrongly using ":=", these shouldnt be executed unless 
the configure script in question is actually run.  a simple test on my side 
says that it is working as i expect -- lazily.

> It'd be nicer if we could use a pure Makefile implementation. What
> about a simpler :
> 
> USE_WITH = $(if $(BR2_$(1)),--with-$(2),--without-$(2))
> USE_ENABLE = $(if $(BR2_$(1),--enable-$(2),--disable-$(2)))

this isnt functionally equivalent ... there is no support for the optional 
[=val] with the flag

> However, their usage might be a little limited: often when the option
> is enabled, we need to add a dependency to the package as well.

this is due to poor design on the behalf of buildroot.  it really needs to 
adopt more Kconfig style and do stuff like:
foo-y =
foo-$(BR2_xxx) += libpng

and again, please retain cc in replies
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101119/6ac90925/attachment.pgp>
