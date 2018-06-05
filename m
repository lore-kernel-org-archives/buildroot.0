From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 10:45:14 +0200
Subject: [Buildroot] [BALENA PATCH] balena : New Package
In-Reply-To: <13335b5c-0ab9-c990-ce0a-9a09661335ec@savronik.com.tr>
References: <3551d854-8b04-370c-27ca-53394858a921@savronik.com.tr>
 <20180604165507.4df4e009@windsurf>
 <13335b5c-0ab9-c990-ce0a-9a09661335ec@savronik.com.tr>
Message-ID: <20180605104514.480c6b37@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 5 Jun 2018 11:20:57 +0300, Refik Tuzakl? wrote:

> I tried to send this patch via git send-email but I have problem with my 
> ssl certificate as below;
> 
> STARTTLS failed! SSL connect attempt failed with unknown error 
> error:14090086:SSL routines:SSL3_GET_SERVER_CERTIFICATE:certificate 
> verify failed at /usr/lib/git-core/git-send-email line 1241.
> 
> When I solve problem, I will use this tool instead of sending via direct 
> e-mail.

You can probably tell git to not verify too much the SSL certificate,
but obviously that's a bit disabling the whole point of SSL in the
first place :-)


> >> +BALENA_CONFIGURE_ENV = GOPATH=${BALENA_GOPATH} \
> >> +??? $(TARGET_MAKE_ENV) \
> >> +??? $(HOST_GO_TARGET_ENV) \
> >> +??? DOCKER_GITCOMMIT=${BALENA_COMMIT} \
> >> +??? DOCKER_BUILDTAGS='exclude_graphdriver_btrfs exclude_graphdirver_zfs
> >> exclude_graphdriver_devicemapper'  
> > None of that should be needed with the golang-package infrastructure.
> > Look at the docker-engine package for an example.  
> I thought so but when I remove one of them, it crashes while 
> configuring. Even it is balena package, it needs some docker parameters.

You can still pass build tags, see how the docker-engine package is
doing this:

ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS),y)
DOCKER_ENGINE_DEPENDENCIES += gvfs
else
DOCKER_ENGINE_TAGS += exclude_graphdriver_vfs
endif

> >> +define BALENA_CONFIGURE_CMDS
> >> +??? mkdir -p $(BALENA_GOPATH)/src/github.com/docker
> >> +??? ln -fs $(@D) $(BALENA_GOPATH)/src/github.com/docker/docker  
> > Not needed with the golang-package infrastructure.  
> golang-package does ;
> 
> mkdir -p $(@D)/_gopath/src/github.com/resin-os/
> ln -sf $(@D) $(@D)/_gopath/src/github.com/resin-os/balena
> 
> but balena needs ;
> mkdir -p $(@D)/.gopath/src/github.com/docker
> ln -fs $(@D) $(@D)/.gopath/src/github.com/docker/docker
> 
> I think this caused by package itself. I am not a developer of balena, I 
> can ask this issue to balena developers

Then, set:

BALENA_SRC_SUBDIR = github.com/docker/docker

> >> +define BALENA_BUILD_CMDS
> >> +??? $(foreach target,$(BALENA_BUILD_TARGETS), \
> >> +??? ??? cd $(BALENA_GOPATH)/src/github.com/docker/docker/cmd/mobynit; \
> >> +??? ??? $(BALENA_MAKE_ENV) \
> >> +??? ??? $(HOST_DIR)/bin/go build -v\
> >> +??? ??? ??? -ldflags "$(BALENA_GLDFLAGS)"
> >> +??? )
> >> +endef  
> > Not needed, it should be done by the golang-package infrastructure.  
> build directory is
> 
> $(BALENA_GOPATH)/src/github.com/docker/docker/cmd/mobynit
> 
> I guess buildroot looks $(BALENA_GOPATH)/src/github.com/resin-io/balena/cmd/balena
> Am I right?

Depends on BALENA_SRC_SUBDIR, see above.

> >> +define BALENA_INSTALL_TARGET_CMDS
> >> +??? $(foreach target,$(BALENA_BUILD_TARGETS), \
> >> +??? ??? $(INSTALL) -D -m 0755
> >> $(@D)/bundles/17.06.0-dev/dynbinary-balena/$(target) $(BALENA_INSTALL_BINS)
> >> +??? ??? ln -sf balena $(TARGET_DIR)/usr/bin/balenad
> >> +??? ??? ln -sf balena $(TARGET_DIR)/usr/bin/balena-containerd
> >> +??? ??? ln -sf balena $(TARGET_DIR)/usr/bin/balena-containerd-shim
> >> +??? ??? ln -sf balena $(TARGET_DIR)/usr/bin/balena-containerd-ctr
> >> +??? ??? ln -sf balena $(TARGET_DIR)/usr/bin/balena-runc
> >> +??? ??? ln -sf balena $(TARGET_DIR)/usr/bin/balena-proxy
> >> +??? )  
> > Same.  
> build step creates
> 
> $(BALENA_GOPATH)/src/github.com/docker/docker/cmd/mobynit/mobynit
> 
> but we need
> 
> $(@D)/bundles/17.06.0-dev/dynbinary-balena/balena

Meh, this installation location looks weird. Angelo, do you have any idea here ?

Refik, in the mean time, you can make a new submission keeping the
INSTALL_TARGET_CMDS you had. I'll try to have a look once you make this
new submission.

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
