From: Geoff Levand <geoff@infradead.org>
Date: Wed, 25 May 2016 09:41:54 -0700
Subject: [Buildroot] [PATCH v2.1 1/6] package/go: Build host tools with
 host CC
In-Reply-To: <20160525160529.2c19eea9@free-electrons.com>
References: <cover.1463696454.git.geoff@infradead.org>
 <aa4ea0467b1c08f0afb3d5ba2cf7af201f6ceeef.1463696454.git.geoff@infradead.org>
 <1464125645.5014.52.camel@infradead.org>
 <20160525160529.2c19eea9@free-electrons.com>
Message-ID: <1464194514.30545.5.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2016-05-25 at 16:05 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 24 May 2016 14:34:05 -0700, Geoff Levand wrote:
> 
> > +ifneq ($(ARCH),$(HOSTARCH))
> >  define HOST_GO_BUILD_CMDS
> > -> > 	> > cd $(@D)/src && $(HOST_GO_MAKE_ENV) ./make.bash
> > +> > 	> > cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) ./make.bash
> > +> > 	> > mkdir -p $(HOST_GO_TMP)
> > +> > 	> > mv $(@D)/pkg/tool $(HOST_GO_TMP)/
> > +> > 	> > mv $(@D)/bin/ $(HOST_GO_TMP)/
> >  endef
> > +else
> > +define HOST_GO_BUILD_CMDS
> > +> > 	> > cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_HOST_CC) ./make.bash
> > +> > 	> > mkdir -p $(HOST_GO_TMP)
> > +> > 	> > mv $(@D)/pkg/tool $(HOST_GO_TMP)/
> > +> > 	> > mv $(@D)/bin/ $(HOST_GO_TMP)/
> > +> > 	> > cd $(@D)/src && $(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) ./make.bash
> 
> Just to make sure I understand correctly: you build everything with
> HOST_GO_HOST_CC first, and put the files generated in pkg/tool and bin/
> on the side in HOST_GO_TMP, and then rebuild everything again with
> HOST_GO_TARGET_CC. Then later on, the installation step will pick up
> bin/ and pkg/tool from HOST_GO_TMP, and the rest from $(@D) directly ?

Yes, that is correct.

bin and tool with HOST_GO_HOST_CC, because those are host binaries.
The rest with HOST_GO_TARGET_CC because those are target binaries.

If you can think of a better way to do this two step build I can try it.

-Geoff
