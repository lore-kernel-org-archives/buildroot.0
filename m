From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Apr 2018 20:47:56 +0200
Subject: [Buildroot] [PATCH v2 2/6] zstd: add host libzstd support
In-Reply-To: <20180412203002.3a11b1a6@gmx.net>
References: <20180409200429.22650-1-ps.report@gmx.net>
 <20180409200429.22650-2-ps.report@gmx.net>
 <20180411211907.GE2328@scaer> <20180412203002.3a11b1a6@gmx.net>
Message-ID: <20180412184756.GG4221@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-04-12 20:30 +0200, Peter Seiderer spake thusly:
> On Wed, 11 Apr 2018 23:19:07 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2018-04-09 22:04 +0200, Peter Seiderer spake thusly:
> > > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > > ---
> > > Changes v1 -> v2:
> > >   - split off host libzstd support (suggested by Yann E. MORIN)
> > >   - no ZSTD_OPTS for host libarary build
> > > ---
> > >  package/zstd/zstd.mk | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > > 
> > > diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> > > index c0fa88026c..1b76b0164c 100644
> > > --- a/package/zstd/zstd.mk
> > > +++ b/package/zstd/zstd.mk
> > > @@ -46,4 +46,16 @@ define ZSTD_INSTALL_TARGET_CMDS
> > >  		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
> > >  endef
> > >  
> > > +# note: no 'HAVE_...' options for host library build only 
> > > +define HOST_ZSTD_BUILD_CMDS
> > > +	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
> > > +		-C $(@D) lib
> > > +endef
> > > +
> > > +define HOST_ZSTD_INSTALL_CMDS
> > > +	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
> > > +		DESTDIR=$(HOST_DIR) PREFIX=/usr -C $(@D)/lib install
> > > +endef
> > > +
> > >  $(eval $(generic-package))
> > > +$(eval $(host-generic-package))  
> > 
> > The target variant has optional dependencies on zlib, xz, and lz4, which
> > all have host variants.
> 
> The zlibx/xz/lz4 support options apply only to the cmdline tools, not
> to the libzst libary (the only build target for the host variant),
> see the (short) comment about the 'HAVE_...' options...

OK, that was not clear to me. Say so in the commit log, then.

Regards,
Yann E. MORIN.

> > So, if you don;t specify the dependency in the host-zstd, you get a
> > host-zstd that may or may not have support for zlib, xz, or lz4,
> > depending on hether another package a dependency on them.
> > 
> > We don't have spport for optional host dependencies (because there are
> > not config options for those host packages), so I don't see a solution
> > but to always depend on all three. So:
> > 
> >     HOST_ZSTD_DEPENDENCIES = host-lz4 host-xz host-zlib
> 
> So no need for the host library build to depend on (unused) lz4/xz/zlib
> host-builds....
> 
> Regards,
> Peter
> 
> > 
> > Regards,
> > Yann E. MORIN.
> > 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
