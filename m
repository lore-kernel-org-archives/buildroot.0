From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 21:54:39 +0200
Subject: [Buildroot] [PATCH v6 3/3] docker-engine: new package
In-Reply-To: <f27fd228ed034bc499fe1c69ac9a3980@WEBMAIL.arcx.com>
References: <1464475578-22239-1-git-send-email-christian@paral.in>
 <1464475578-22239-4-git-send-email-christian@paral.in>
 <f27fd228ed034bc499fe1c69ac9a3980@WEBMAIL.arcx.com>
Message-ID: <20160607215439.76ad85ee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your feedback. However, it'd be nice if you could configure
your e-mail client to wrap lines at a reasonable length.

On Tue, 7 Jun 2016 19:43:53 +0000, Andrew Webster wrote:

> Does it makes sense to also add selects for BR2_PACKAGE_IPTABLES and
> BR2_PACKAGE_CA_CERTIFICATES here?  They are not build dependencies,
> but run-time dependencies.  It may be possible to do some things
> without the certificates, but I think iptables is always required.

It is indeed a good idea to select the relevant runtime dependencies.

> On a similar topic, docker expects a bunch of cgroup mounts to exist
> somewhere on the system.  Is this something that should be left up to
> the rootfs author (in which case maybe the help could be extended to
> explain this), or should the docker-engine recipe attempt to modify
> fstab somehow?  I'm not sure if there is a way to actually do that
> though.

The Buildroot philosophy is in general that things should work at least
in a minimal way "out of the box". So if cgroup mounts are needed for
Docker, they should be done in Docker's init script.

> > +define DOCKER_ENGINE_INSTALL_INIT_SYSV
> > +	$(INSTALL) -D -m 755
> > $(@D)/contrib/init/sysvinit-redhat/docker \
> > +		$(TARGET_DIR)/etc/init.d/S61docker  
> 
> This init file didn't work for me.  I'm not sure if it can work on a
> buildroot filesystem, are you using systemd instead? I removed most
> of the checks to get it working (actually, I think I started editing
> the Ubuntu version).  Maybe a custom init script is required?  I can
> show you my hack if you like.

Very often, init scripts provided by upstream for desktop/server
distributions don't work really well with Buildroot generated systems.
Because we don't have bash by default, because we don't necessarily
have all the tools they need in our default image, and for various
other reasons. That's why we generally have our own Buildroot-specific
init script in the package directory.

So a custom init script is probably in order here, especially if you
report that the one provided by upstream doesn't quite work.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
