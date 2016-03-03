From: Geoff Levand <geoff@infradead.org>
Date: Wed, 02 Mar 2016 17:11:07 -0800
Subject: [Buildroot] [PATCH 1/4] Add package go-bootstrap
In-Reply-To: <20160302234349.7448884e@free-electrons.com>
References: <cover.1456946494.git.geoff@infradead.org>
 <a316e4d5ff70594e8f4cccbb819ebf6d9a32e958.1456946494.git.geoff@infradead.org>
 <20160302234349.7448884e@free-electrons.com>
Message-ID: <1456967467.13916.108.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2016-03-02 at 23:43 +0100, Thomas Petazzoni wrote:
> The commit title should be:
> 
> 	> go-bootstrap: new host package

OK.

> --- a/package/Config.in.host
> > +++ b/package/Config.in.host
> > @@ -13,6 +13,7 @@ menu "Host utilities"
> >  > > 	> > source "package/genext2fs/Config.in.host"
> >  > > 	> > source "package/genimage/Config.in.host"
> >  > > 	> > source "package/genpart/Config.in.host"
> > +> > 	> > source "package/go-bootstrap/Config.in.host"
> 
> There is no need for a Config.in.host file for this package, it is
> just a build dependency for the go compiler, it doesn't need to be
> exposed in menuconfig.

OK.

> > new file mode 100644
> > index 0000000..464f95e
> > --- /dev/null
> > +++ b/package/go-bootstrap/go-bootstrap.mk
> > @@ -0,0 +1,36 @@
> > +################################################################################
> > +#
> > +# go-bootstrap
> > +#
> > +################################################################################
> > +
> > +GO_BOOTSTRAP_VERSION = 1.4.2
> > +GO_BOOTSTRAP_SITE = https://storage.googleapis.com/golang
> > +GO_BOOTSTRAP_SOURCE = go$(GO_BOOTSTRAP_VERSION).src.tar.gz
> 
> Will Go 1.4.x always be capable of building newer Go compilers ?

Yes, at least that is the current situation.  FYI, the go bootstrap
plan is documented here:

  https://docs.google.com/document/d/1OaatvGhEAq7VseQ9kkavxKNAfepWy2yhPUBs96FGV28

> > > > +define HOST_GO_BOOTSTRAP_INSTALL_CMDS
> > +> > 	> > $(INSTALL) -D -m 0755 $(@D)/bin/go $(GO_BOOTSTRAP_FINAL)/bin/go
> > +> > 	> > $(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(GO_BOOTSTRAP_FINAL)/bin/gofmt
> > +
> > +> > 	> > cp -a $(@D)/lib $(GO_BOOTSTRAP_FINAL)/
> > +> > 	> > cp -a $(@D)/src $(GO_BOOTSTRAP_FINAL)/
> 
> Is it normal to copy source code to HOST_DIR ?

There is a known issue which requires the source tree to be installed:

  https://golang.org/issue/2775

I'll add a comment to the .mk file.

> > +> > 	> > cp -a $(@D)/pkg $(GO_BOOTSTRAP_FINAL)/
> > +> > 	> > chmod -R +x $(GO_BOOTSTRAP_FINAL)/pkg/tool
> 
> Why aren't those tools already installed +x by the build process ?

This is not needed I'll remove the line here and in go.mk.

-Geoff
