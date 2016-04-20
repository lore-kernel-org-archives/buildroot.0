From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 20 Apr 2016 22:37:35 +0300
Subject: [Buildroot] [PATCH 1/3] c-icap: avoid host library search path
In-Reply-To: <20160420212000.4ce134db@free-electrons.com>
References: <f4a2d607557dd8a5b7fdc322f0ae8ef083890076.1461089746.git.baruch@tkos.co.il>
 <20160419211457.11d9bf2a@free-electrons.com>
 <20160420180433.GK2476@tarshish>
 <20160420212000.4ce134db@free-electrons.com>
Message-ID: <20160420193735.GL2476@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Apr 20, 2016 at 09:20:00PM +0200, Thomas Petazzoni wrote:
> On Wed, 20 Apr 2016 21:04:33 +0300, Baruch Siach wrote:
> > On Tue, Apr 19, 2016 at 09:14:57PM +0200, Thomas Petazzoni wrote:
> > > On Tue, 19 Apr 2016 21:15:44 +0300, Baruch Siach wrote:
> > > > +C_ICAP_MAKE_OPTS = exec_prefix=$(STAGING_DIR)/usr
> > > 
> > > This is not correct. Setting exec_prefix to $(STAGING_DIR)/usr is
> > > wrong. Instead, can you try to remove:
> > > 
> > >    -rpath @libdir@
> > > 
> > > from the various Makefile.am ?
> > 
> > It turns out that forcing AUTORECONF is enough to fix the problem. I'm not 
> > sure why. I have only noticed that after AUTORECONF, -lz appears explicitly in 
> > the link command line, whereas before libz was linked in implicitly via 
> > libicapapi.so NEEDED tag. Manually running the failed link command with -lz 
> > added, fixes the link as well. I guess that -lz makes the linker search in 
> > sysroot before rpath, but I could not find an explanation to this behaviour in 
> > the ld documentation.
> 
> Are you talking about linking of programs against libicapapi.so, or the
> linking of libicapapi.so itself?

I meant the former. The failure is when linking the c-icap executable.

> If you're talking about linking the programs against libicapapi.so,
> then adding -lz should not be needed, unless the programs use zlib
> function calls directly. But if only libicapapi.so is the zlib user,
> then there should normally be no need to link the programs with -lz
> (except in static linking scenarios, of course).

But that's exactly what happens after AUTORECONF.

> Did you verify that the paranoid path checking was not complaining?

BR2_COMPILER_PARANOID_UNSAFE_PATH is enabled but there was no complain. That's 
apparently because libtool breaks '-rpath /usr/lib' into '-Wl,-rpath 
-Wl,/usr/lib'.

> > Any suggestion for the comment text to explain the AUTORECONF?
> 
> Just explains that it fixes stuff and which stuff :)

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
