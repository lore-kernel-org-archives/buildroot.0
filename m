From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Oct 2015 22:01:41 +0100
Subject: [Buildroot] [PATCH v5 14/36] package/efl/libefl: add X11 support
In-Reply-To: <56328668.3090000@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-15-git-send-email-romain.naour@openwide.fr>
 <20151025150116.GL11692@free.fr> <56328668.3090000@openwide.fr>
Message-ID: <20151029210141.GD3600@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-29 21:49 +0100, Romain Naour spake thusly:
> Le 25/10/2015 16:01, Yann E. MORIN a ?crit :
> > On 2015-10-24 23:00 +0200, Romain Naour spake thusly:
> >> Add an option to enable X11 support in libecore without graphic
> >> acceleration. libecore can use xlib or xcb support but the latter
> >> in not recommended by efl developpers.
> >>
> >> Also, set x-includes and x-libraries configure option for cross-compiling.
> >> Previous efl versions had cross-compilation issue (poisoned paths)
> >> if these options are not passed to configure script.
> >>
> >> In order to remove the dependency on libXp wich is no longer bundled in
> >> recent X11 release [1], backport an upstream patch [2] to remove xprint
> >> usage.
> >>
> >> [1] http://www.x.org/wiki/Releases/ModuleVersions
> >> [2] https://git.enlightenment.org/core/efl.git/commit/?h=efl-1.15&id=434572355c7e929b84210b2f795634d38f13c913
> >>
> >> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
[--SNIP--]
> >> +ifeq ($(BR2_PACKAGE_LIBEFL_X_XCB),y)
> >> +LIBEFL_DEPENDENCIES += libxcb \
> >> +	xcb-util-image \
> >> +	xcb-util-keysyms \
> >> +	xcb-util-renderutil \
> >> +	xcb-util-wm
> >> +# You have chosen to use XCB instead of Xlib. It is a myth that XCB
> >> +# is amazingly faster than Xlib (when used sensibly). It can be
> >> +# faster in a few corner cases on startup of an app, but it comes
> >> +# with many downsides. One of those is more complex code inside
> >> +# ecore_x, which is far less tested in XCB mode than Xlib. Also
> >> +# the big catch is that OpenGL support basically requires Xlib anyway
> >> +# so if you want OpenGL in X11, you need Xlib regardless and so you
> >> +# gain nothing really in terms of speed and no savings in memory
> >> +# because Xlib is still linked, loaded and used, BUT instead you
> >> +# have OpenGL drivers working with an hybrid XCB/Xlib (mostly XCB)
> >> +# toolkit and this is basically never tested by anyone working on
> >> +# the OpenGL drivers, so you will have bugs. Do not enable XCB
> >> +# and use OpenGL. XCB is only useful if you wish to shave a few Kb
> >> +# off the memory footprint of a whole system and live with less
> >> +# tested code, and possibly unimplemented features in ecore_x. To
> >> +# remove the XCB setup, remove the --with-x11=xcb option to
> >> +# configure.
> > 
> > Why this big comment? At best, it belongs to the help text of
> > BR2_PACKAGE_LIBEFL_X_XCB in the Config.in.
> > 
> > Also, I guess you're only quoting the EFL developers here, so you should
> > state so and add a pointer to that message upstream:
> > 
> >     https://git.enlightenment.org/core/efl.git/tree/configure.ac#n5002
> > 
> > But if it were purely on me, I would just drop it.
> 
> Well, I'm wondering if I should keep XCB support in this package since it's not
> a "recommended" configuration. I kept it only because it was already there with
> efl 1.7.10 package.
> 
> Thoughts ?

If you're not at ease with it, just ditch it. Just keep Xlib-based X11
support. Jus tsay so in the commit log, with something along the lines
of:

    Drop XCB support, since it is not very well supported by upstream.

If anyone is interested in XCB support, he would add it back.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
