From: Christian Stewart <christian@paral.in>
Date: Tue, 7 Jun 2016 13:18:11 -0700
Subject: [Buildroot] [PATCH v6 3/3] docker-engine: new package
In-Reply-To: <20160607215439.76ad85ee@free-electrons.com>
References: <1464475578-22239-1-git-send-email-christian@paral.in>
 <1464475578-22239-4-git-send-email-christian@paral.in>
 <f27fd228ed034bc499fe1c69ac9a3980@WEBMAIL.arcx.com>
 <20160607215439.76ad85ee@free-electrons.com>
Message-ID: <CA+h8R2oZypDvm65RVp3fNX1MYCxSWqX95MxLW-q-K25d4tNccg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Andrew,

On Tue, Jun 7, 2016 at 12:54 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:
>
> > Does it makes sense to also add selects for BR2_PACKAGE_IPTABLES and
> > BR2_PACKAGE_CA_CERTIFICATES here?  They are not build dependencies,
> > but run-time dependencies.  It may be possible to do some things
> > without the certificates, but I think iptables is always required.
>

Not sure if these are actually required. The iptables calls are direct, not
through calling a cli.

Certs are a different story but that might be out of the scope of the
Docker package. It can run stuff locally without hitting the internet at
all.

> On a similar topic, docker expects a bunch of cgroup mounts to exist
> > somewhere on the system.  Is this something that should be left up to
> > the rootfs author (in which case maybe the help could be extended to
> > explain this), or should the docker-engine recipe attempt to modify
> > fstab somehow?  I'm not sure if there is a way to actually do that
> > though.
>

This is unnecessary. On all of the systems I'm running, with NO fstab
modifications or really anything but enabling the Docker package, it works
fine. Docker might be doing the mounting automatically.

> > +define DOCKER_ENGINE_INSTALL_INIT_SYSV
> > > +   $(INSTALL) -D -m 755
> > > $(@D)/contrib/init/sysvinit-redhat/docker \
> > > +           $(TARGET_DIR)/etc/init.d/S61docker
> >
> > This init file didn't work for me.  I'm not sure if it can work on a
> > buildroot filesystem, are you using systemd instead? I removed most
> > of the checks to get it working (actually, I think I started editing
> > the Ubuntu version).  Maybe a custom init script is required?  I can
> > show you my hack if you like.
>

I didn't expect this to work, and was hoping someone who's not using
systemd would contribute a better init script for it.

I'd appreciate seeing your script if you manage to get one that works well
for you under Buildroot's shell based init sequence.

So a custom init script is probably in order here, especially if you
> report that the one provided by upstream doesn't quite work.
>

+1

For reference, here's my system setup:  http://github.com/paralin/SkiffOS

It's actually a very extensible configuration generation platform, I'm
hoping to expand its scope soon, if anyone would like to
have a look and give me any comments, they would be greatly appreciated :)

Thanks!
Christian Stewart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160607/e99897ea/attachment.html>
