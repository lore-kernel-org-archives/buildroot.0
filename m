From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Feb 2015 10:12:05 +0100
Subject: [Buildroot] [PATCH 03/10 v7] package/mesa3d-headers: new package
In-Reply-To: <20150214100923.0e47af4f@free-electrons.com>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
 <f37c4782a8b2fb8e9e41b92bf1f321a9a154c843.1423597914.git.yann.morin.1998@free.fr>
 <20150214100923.0e47af4f@free-electrons.com>
Message-ID: <20150214091205.GA3886@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-02-14 10:09 +0100, Thomas Petazzoni spake thusly:
> On Tue, 10 Feb 2015 21:01:10 +0100, Yann E. MORIN wrote:
[--SNIP--]
> > The Khronos group provides such headers, and they are the reference
> > headers, but we can not realy use them:
> 
> really

OK.

[--SNIP--]
> > Modifying the existing mesa3d package would not be easy; we'd have to
> > differentiate whther we need only the headers or the full package. The
> 
> whether

OK.

[--SNIP--]
> > It should not be possible to select both mesa3d *and* mesa3d-headers at
> > the same time, but it is difficult to foresee the multiple combinations
> > we may have, due to poor understanding on how binary drivers may behave
> > and what they may require, as well as my own poor understanding of the
> > GL stack(s).
> > 
> > So I decided to just print a warning in that case, and just depend on
> > mesa3d, which would ultimately provide the headers we are interested in
> > anyway. This can be turned into an error if preferred.
> 
> Yes, I believe this should rather be an error. The expected users of
> mesa3d-headers are proprietary OpenGL implementations, which have
> normally no reason to co-exist with Mesa3D on a given system. So I'd
> prefer this to be considered an error, and to not have mesa3d-headers
> depend on mesa3d when both are enabled.

OK.

> > +# Only installs header files
> > +MESA3D_HEADERS_INSTALL_STAGING = YES
> > +MESA3D_HEADERS_INSTALL_TARGET = NO
> > +
> > +MESA3D_HEADERS_DIRS = KHR
> > +
> > +ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
> > +MESA3D_HEADERS_DIRS += GL
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
> > +MESA3D_HEADERS_DIRS += EGL
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
> > +MESA3D_HEADERS_DIRS += GLES GLES2
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
> > +MESA3D_HEADERS_DIRS += VG
> > +endif
> > +
> > +define MESA3D_HEADERS_INSTALL_STAGING_CMDS
> > +	$(foreach d,$(MESA3D_HEADERS_DIRS),\
> > +		for h in $(@D)/include/$(d)/*.h; do \
> > +			$(INSTALL) -D -m 0644 $${h} $(STAGING_DIR)/usr/include/$(d)/$$(basename $${h}) || exit 1; \
> 
> Instead of doing a for for each header, what about using a plain cp
> -dpfr like we do in many other packages?

OK.

> Let me know if you agree with the proposed changes, I can quickly make
> them while applying if you don't want to respin the entire patch series.

I'll do that while you apply other patches! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
