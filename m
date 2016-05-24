From: Geoff Levand <geoff@infradead.org>
Date: Tue, 24 May 2016 14:31:47 -0700
Subject: [Buildroot] [PATCH v2 1/6] package/go: Build host tools with
 host CC
In-Reply-To: <20160524211145.4b3080d7@free-electrons.com>
References: <cover.1463696454.git.geoff@infradead.org>
 <aa4ea0467b1c08f0afb3d5ba2cf7af201f6ceeef.1463696454.git.geoff@infradead.org>
 <20160524211145.4b3080d7@free-electrons.com>
Message-ID: <1464125507.5014.50.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 2016-05-24 at 21:11 +0200, Thomas Petazzoni wrote:
> On Thu, 19 May 2016 22:25:02 +0000, Geoff Levand wrote:
> 
> > +HOST_GO_TMP = $(@D)/host-go-tmp
> > +
> > +ifneq ($(ARCH),$(HOSTARCH))
> >  define HOST_GO_BUILD_CMDS
> > -> > 	> > cd $(@D)/src && $(HOST_GO_MAKE_ENV) ./make.bash
> > +> > 	> > cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) ./make.bash
> > +> > 	> > mkdir -p $(HOST_GO_TMP)
> > +> > 	> > mv $(@D)/pkg/tool $(HOST_GO_TMP)/
> > +> > 	> > mv $(@D)/bin/ $(HOST_GO_TMP)/
> 
> So here you are moving what was built to HOST_GO_TMP.
> 
> >  endef
> > +else
> > +define HOST_GO_BUILD_CMDS
> > +> > 	> > cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_HOST_CC) ./make.bash
> > +> > 	> > mkdir -p $(HOST_GO_TMP)
> > +> > 	> > cp -a $(@D)/pkg/tool $(HOST_GO_TMP)/
> > +> > 	> > cp -a $(@D)/bin/ $(HOST_GO_TMP)/
> > +> > 	> > cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) ./make.bash
> > +> > 	> > cp -a $(@D)/pkg/tool $(HOST_GO_TMP)/
> 
> And here you're using a copy. Why?

We can use mv here also.

> Also, in this last case, you are copying pkg/tool/ twice, once after
> the build with HOST_GO_HOST_CC, and once after the build with
> HOST_GO_TARGET_CC. It seems like the first copy is useless.

This got messed up, this last cp line should not be there.  We
want the binaries and tools build with the host compiler to be
installed.  Everything else installed should be build with the
target compiler.

I'll post a follow up patch.

-Geoff
