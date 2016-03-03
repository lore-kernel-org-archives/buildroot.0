From: Geoff Levand <geoff@infradead.org>
Date: Wed, 02 Mar 2016 17:11:18 -0800
Subject: [Buildroot] [PATCH 2/4] Add go host support
In-Reply-To: <20160302235012.419a6ec2@free-electrons.com>
References: <cover.1456946494.git.geoff@infradead.org>
 <518d5cfb3bd5897ea408888e6c105388fccff5c2.1456946494.git.geoff@infradead.org>
 <20160302235012.419a6ec2@free-electrons.com>
Message-ID: <1456967478.13916.109.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2016-03-02 at 23:50 +0100, Thomas Petazzoni wrote:
> --- /dev/null
> > +++ b/package/go/Config.in.host
> > @@ -0,0 +1,14 @@
> > +config BR2_PACKAGE_GO_ARCH_SUPPORTS
> > +> > 	> > bool
> > +> > 	> > default y
> > +> > 	> > depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_powerpc
> > +> > 	> > depends on !BR2_ARM_CPU_ARMV4
> > +
> > +config BR2_PACKAGE_HOST_GO
> > +> > 	> > bool "host go"
> > +> > 	> > depends on BR2_PACKAGE_GO_ARCH_SUPPORTS
> > +> > 	> > select BR2_PACKAGE_HOST_GO_BOOTSTRAP
> 
> Due to the removal of Config.in.host for the go-bootstrap package, this
> line has become useless.

OK.

> 
> > +> > 	> > help
> > +> > 	> >   The Go Programming Language.
> > +
> > +> > 	> >   https://golang.org
> 
> We normally don't have Config.in for host packages, as they are just
> build dependencies. In this case, we could also decide to not have any
> package/go/Config.in.host, and simply have the flannel package use
> "host-go" in its _DEPENDENCIES variable.
> 
> However, we may consider that some users may want to build the host Go
> compiler even if they don't have a package that uses it, so maybe it's
> acceptable.

Either way seems fine, but having the option seems more flexible for
users.

> I'm still a bit bothered by the fact that a Config.in option describing
> a *host* package depends on BR2_PACKAGE_GO_ARCH_SUPPORTS. But I guess
> it's fine since the Go compiler is really going to be a cross-compiler.

Yes, my thinking was that if you try to build go for a target arch that
is not supported the build will blow up.  For the package maintainer
they can use BR2_PACKAGE_GO_ARCH_SUPPORTS to only build for targets
that the compiler supports.  

> > +GO_VERSION = 1.5.3
> > +GO_SITE = https://storage.googleapis.com/golang
> > +GO_SOURCE = go$(GO_VERSION).src.tar.gz
> > +
> > +GO_LICENSE = BSD-3c
> > +GO_LICENSE_FILES = LICENSE
> > +
> > +GO_BOOTSTRAP = $(HOST_DIR)/usr/lib/go-1.4.2
> 
> Why don't you use $(GO_BOOTSTRAP_FINAL) instead ?

Yes, should work better.

> 
> > +
> > +ifeq ($(BR2_arm),y)
> > +> > 	> > GO_GOARCH = arm
> 
> Please don't indent such variable definitions.

OK.

> 
> > +else ifeq ($(BR2_aarch64),y)
> > +> > 	> > GO_GOARCH = arm64
> > +else ifeq ($(BR2_i386),y)
> > +> > 	> > GO_GOARCH = 386
> > +else ifeq ($(BR2_x86_64),y)
> > +> > 	> > GO_GOARCH = amd64
> > +else ifeq ($(BR2_powerpc),y)
> > +> > 	> > GO_GOARCH = ppc64
> > +else
> > +> > 	> > GO_GOARCH = unknown
> > +endif
> > +
> > +ifeq ($(BR2_arm)$(BR2_ARM_CPU_HAS_VFPV3),yy)
> > +> > 	> > GO_GOARM = 7
> > +else ifeq ($(BR2_arm)$(BR2_ARM_CPU_HAS_VFPV2),yy)
> > +> > 	> > GO_GOARM = 6
> > +else ifeq ($(BR2_arm),y)
> > +> > 	> > GO_GOARM = 5
> > +endif
> 
> You should use BR2_ARM_CPU_ARMV5, BR2_ARM_CPU_ARMV6 and
> BR2_ARM_CPU_ARMV7 here.

OK.  I re-did the logic here a little. 

> 
> > GO_HOST_DEPENDENCIES = host-go-bootstrap
> 
> Wrong variable name, it should be HOST_GO_DEPENDENCIES.
> 
> > GO_HOST_FINAL = $(HOST_DIR)/usr/lib/go
> 
> Ditto: HOST_GO_<...>
> 
> > GO_HOST_MAKE_ENV = \
> 
> Same.

I think I got them all...

> 
> > +define HOST_GO_INSTALL_CMDS
> > +> > 	> > $(INSTALL) -D -m 0755 $(@D)/bin/go $(GO_HOST_FINAL)/bin/go
> > +> > 	> > $(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(GO_HOST_FINAL)/bin/gofmt
> > +
> > +> > 	> > ln -sf ../lib/go/bin/go $(HOST_DIR)/usr/bin/
> > +> > 	> > ln -sf ../lib/go/bin/gofmt $(HOST_DIR)/usr/bin/
> > +
> > +> > 	> > cp -a $(@D)/lib $(GO_HOST_FINAL)/
> > +> > 	> > cp -a $(@D)/src $(GO_HOST_FINAL)/
> 
> Same question: why do we install source code ?

As before, to work-around a know issue.  I'll add the comment here.

> > +
> > +> > 	> > mkdir -p $(GO_HOST_FINAL)/pkg
> > +> > 	> > cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(GO_HOST_FINAL)/pkg/
> > +> > 	> > cp -a $(@D)/pkg/tool $(GO_HOST_FINAL)/pkg/
> > +> > 	> > chmod -R +x $(GO_HOST_FINAL)/pkg/tool
> 
> Same question :-)

Removed it.

-Geoff
