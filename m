From: Geoff Levand <geoff@infradead.org>
Date: Thu, 12 May 2016 10:12:52 -0700
Subject: [Buildroot] [PATCH 8/9] package/go: Build special host binaries
In-Reply-To: <20160512163418.6382e3d2@free-electrons.com>
References: <cover.1463010771.git.geoff@infradead.org>
 <5bc0cf8e34e53eee49c11c7b4fc9b523530ad393.1463010772.git.geoff@infradead.org>
 <20160512163418.6382e3d2@free-electrons.com>
Message-ID: <1463073172.23824.19.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, 2016-05-12 at 16:34 +0200, Thomas Petazzoni wrote:
> On Thu, 12 May 2016 00:08:48 +0000, Geoff Levand wrote:
> > To work around cross compile limitations of go's build scripts, when the
> > host and target arches are the same build the host go binaries with
> > CC_FOR_TARGET set to the host compiler.
> 
> What happens when the host and target architectures are different? It
> all works fine?

Yes, it works fine.

> Is the problem just that Go doesn't "cross compile" properly when the
> host and target architectures are the same ?

Yes, the build system doesn't have the notion of cross compiling, but
just the notion of architecture.  When the host and target
architectures are different it expects to be given a compiler for the
target.  When the architectures are the same it assumes it will use
the same compiler for both host and target.

> > +# To work around cross compile limitations of go's build scripts, when the
> 
> Please give more details about those "limitations".

OK.

> > +# host and target arches are the same build the host go binaries with
> > +# CC_FOR_TARGET set to the host compiler.
> > +ifeq ($(ARCH),$(HOSTARCH))
> > +> > 	> > HOST_GO_BUILD_SPECIAL = y
> 
> Don't indent this line.
> 
> > +endif
> > +
> > +HOST_GO_ENV_COMMON = \
> >  > > 	> > GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_ROOT) \
> >  > > 	> > GOROOT_FINAL=$(HOST_GO_ROOT) \
> > -> > 	> > GOROOT="$(@D)" \
> >  > > 	> > GOBIN="$(@D)/bin" \
> >  > > 	> > GOARCH=$(GO_GOARCH) \
> >  > > 	> > $(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
> >  > > 	> > GOOS=linux \
> >  > > 	> > CGO_ENABLED=1 \
> > +> > 	> > CC=$(HOSTCC_NOCCACHE)
> 
> This addition seems unrelated to the patch. And why are you using
> HOSTCC_NOCCACHE and not just HOSTCC ?

As mentioned in my reply to Patch 3/9, it is generally known that
the go build system is not compatible with the use of ccache.  See

  https://github.com/golang/go/issues/11685

> > +
> > +HOST_GO_MAKE_ENV = \
> > +> > 	> > $(HOST_GO_ENV_COMMON) \
> > +> > 	> > GOROOT="$(@D)" \
> >  > > 	> > CC_FOR_TARGET=$(TARGET_CC) \
> >  > > 	> > CXX_FOR_TARGET=$(TARGET_CXX)
> >  
> > +HOST_GO_MAKE_ENV_SPECIAL = \
> > +> > 	> > $(HOST_GO_ENV_COMMON) \
> > +> > 	> > GOROOT="$(@D).host" \
> > +> > 	> > CC_FOR_TARGET=$(HOSTCC_NOCCACHE) \
> > +> > 	> > CXX_FOR_TARGET=$(HOSTCC_NOCCACHE) \
> 
> Please no final backslash on the last line.

Sure, missed that.

> > +define HOST_GO_CONFIGURE_CMDS
> > +> > 	> > if [ "$(HOST_GO_BUILD_SPECIAL)" ]; then \
> > +> > 	> > 	> > cp -a $(@D) $(@D).host; \
> > +> > 	> > fi
> > +endef
> 
> Please use make conditionals, i.e:
> 
> ifeq ($(HOST_GO_BUILD_SPECIAL),y)
> define HOST_GO_CONFIGURE_CMDS
> 	> cp -a $(@D) $(@D).host
> endef
> endif

OK.

> 
> > +
> >  define HOST_GO_BUILD_CMDS
> >  > > 	> > cd $(@D)/src && $(HOST_GO_MAKE_ENV) ./make.bash
> 
> You really need a different set of environment variables for here?
> 
> > +> > 	> > if [ "$(HOST_GO_BUILD_SPECIAL)" ]; then \
> > +> > 	> > 	> > rm -f $(@D)/bin/go $(@D)/bin/gofmt; \
> > +> > 	> > 	> > cd $(@D).host/src && $(HOST_GO_MAKE_ENV_SPECIAL) ./make.bash; \
> 
> And here ?

Yes, to make the build scripts build the target bits with a
cross compiler of the same architecture as the host.  Another
option, which I have not seriously looked into, is to possibly
patch the go build scripts.

> Also, same here: use make conditionals, i.e:
> 
> ifeq ($(HOST_GO_BUILD_SPECIAL),y)
> define HOST_GO_BUILD_SPECIAL_CMDS
> 	> ...
> endef
> endif
> 
> define HOST_GO_BUILD_CMDS
> 	> .... build go normally ...
> 	> $(HOST_GO_BUILD_SPECIAL_CMDS)
> endef
> 
> > +> > 	> > fi
> >  endef
> >  
> >  define HOST_GO_INSTALL_CMDS
> > @@ -66,7 +93,8 @@ define HOST_GO_INSTALL_CMDS
> >  > > 	> > cp -a $(@D)/lib $(HOST_GO_ROOT)/
> >  
> >  > > 	> > mkdir -p $(HOST_GO_ROOT)/pkg
> > -> > 	> > cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(HOST_GO_ROOT)/pkg/
> > +> > 	> > cp -a $(@D)/pkg/include $(HOST_GO_ROOT)/pkg/
> > +> > 	> > cp -a $(@D)/pkg/linux_* $(HOST_GO_ROOT)/pkg/
> 
> This change seems useless and unrelated.

Sure, I'll remove it.

-Geoff
