From: Christian Stewart <christian@paral.in>
Date: Sun, 24 Jul 2016 12:13:30 -0700
Subject: [Buildroot] [PATCH v9 2/2] docker-engine: new package
In-Reply-To: <20160724152921.0601232e@free-electrons.com>
References: <1469220779-31430-1-git-send-email-christian@paral.in>
 <1469220779-31430-2-git-send-email-christian@paral.in>
 <20160724152921.0601232e@free-electrons.com>
Message-ID: <CA+h8R2rcOfaox359QdSX64wqzE8-6DK6=37p8z4K+oT=_S3FzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Init scripts were written by Andrew so I will let him take those revisions.

On Sun, Jul 24, 2016, 6:29 AM Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> The comment should just be "# runtime dependency"

Okay, acknowledged.

> None of these lines are needed. All those packages are already selected
> by docker-containerd.

Removed, but I thought we had to propagate the "select" back up to the
top level dependency. Maybe this is just for "depends."

> If you use CGO, then docker needs to also depend on
> BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS, see docker-containerd.

Added, thanks.

> What is this CPATH ? Indeed there is usually nothing in
> TARGET_DIR/usr/include.

It's where the btrfs.h headers go, when btrfs is selected, fixes the
cgo compilation errors when btrfs is enabled.

> Use:
>
>         $(foreach target,$(DOCKER_ENGINE_BUILD_TARGETS), \
>                 cd $(@D); $(DOCKER_ENGINE_MAKE_ENV) \
>                         $(HOST_DIR)/usr/bin/go build -v \
>                                 -o $(@D)/bin/$(target) \
>                                 -tags "$(DOCKER_ENGINE_BUILD_TAGS)" \
>                                 -ldflags "$(DOCKER_ENGINE_GLDFLAGS)" \
>                                 ./cmd/$(target)
>         )
>
> > +endef
> > +
> > +define DOCKER_ENGINE_INSTALL_TARGET_CMDS
> > +     $(DOCKER_ENGINE_INSTALL_TARGET_CLIENT_CMDS)
> > +     $(DOCKER_ENGINE_INSTALL_TARGET_DAEMON_CMDS)
>
> Use:
>
>         $(foreach target,$(DOCKER_ENGINE_BUILD_TARGETS), \
>                 $(INSTALL) -D -m 0755 $(@D)/bin/$(target) $(TARGET_DIR)/usr/bin/$(target)
>         )
>

Changed, thanks.

> > +++ b/package/docker-engine/docker.init
>
> Should be named S61docker

Changed, thanks.

>
> > @@ -0,0 +1,89 @@
> > +#!/bin/sh
> > +
> > +BASE=docker
> > +
> > +# modify these in /etc/default/$BASE (/etc/default/docker)
> > +DOCKERD=/usr/bin/dockerd
> > +# This is the pid file managed by docker itself
> > +DOCKER_PIDFILE=/var/run/$BASE.pid
> > +# This is the pid file created/managed by start-stop-daemon
> > +DOCKER_SSD_PIDFILE=/var/run/$BASE-ssd.pid
>
> Do we really need two pidfiles ? I don't think so. If docker creates
> its own pidfile, then start-stop-daemon can use it.

This is more Andrew's speed, I'll let him respond.

Andrew, Thomas, the latest revision of this patch can be found here:

https://github.com/paralin/buildroot/commits/master

Best,
Christian
