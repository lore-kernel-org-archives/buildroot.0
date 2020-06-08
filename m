From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 8 Jun 2020 10:19:51 -0700
Subject: [Buildroot] [PATCH 1/1] package/earlyoom: new package
In-Reply-To: <CANQCQpbK-smTZ8Yv12XJxn06V8J1jOqwq4dbGMjTDzS0j3uECg@mail.gmail.com>
References: <20200529015402.2646343-1-joseph.kogut@gmail.com>
 <CANQCQpbK-smTZ8Yv12XJxn06V8J1jOqwq4dbGMjTDzS0j3uECg@mail.gmail.com>
Message-ID: <CAMWSM7gcO3byz1r9qq2FUG16y+6HJ-YEz1QAd0-qBQy3Ut-W_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 29, 2020 at 5:10 AM Matthew Weber <matthew.weber@collins.com> wrote:
>
> Joseph,
>
> On Thu, May 28, 2020 at 8:58 PM Joseph Kogut <joseph.kogut@gmail.com> wrote:
> >
> > EarlyOOM daemon for triggering Linux OOM killer before running out of
> > memory, avoiding situations where the machine becomes unresponsive from
> > out of control swapping.
> >
>
> Could add a few references to where other distros are adding this in
> by default.  I see Fedora has a pretty good scenario captured
> https://fedoraproject.org/wiki/Changes/EnableEarlyoom
>
> Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>
> > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> > ---
> >  DEVELOPERS                     |  1 +
> >  package/Config.in              |  1 +
> >  package/earlyoom/Config.in     |  9 +++++++++
> >  package/earlyoom/earlyoom.hash |  4 ++++
> >  package/earlyoom/earlyoom.mk   | 37 ++++++++++++++++++++++++++++++++++
> >  5 files changed, 52 insertions(+)
> >  create mode 100644 package/earlyoom/Config.in
> >  create mode 100644 package/earlyoom/earlyoom.hash
> >  create mode 100644 package/earlyoom/earlyoom.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 0f1574c930..3e749e764b 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -1388,6 +1388,7 @@ N:        Joseph Kogut <joseph.kogut@gmail.com>
> >  F:     package/at-spi2-atk/
> >  F:     package/at-spi2-core/
> >  F:     package/clang/
> > +F:     package/earlyoom/
> >  F:     package/gconf/
> >  F:     package/libnss/
> >  F:     package/lld/
> > diff --git a/package/Config.in b/package/Config.in
> > index c245abbc42..0f1da74e0f 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -2338,6 +2338,7 @@ menu "System tools"
> >         source "package/docker-containerd/Config.in"
> >         source "package/docker-engine/Config.in"
> >         source "package/docker-proxy/Config.in"
> > +       source "package/earlyoom/Config.in"
> >         source "package/efibootmgr/Config.in"
> >         source "package/efivar/Config.in"
> >         source "package/emlog/Config.in"
> > diff --git a/package/earlyoom/Config.in b/package/earlyoom/Config.in
> > new file mode 100644
> > index 0000000000..abb720437c
> > --- /dev/null
> > +++ b/package/earlyoom/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_EARLYOOM
> > +       bool "earlyoom"
> > +       help
> > +         Early OOM daemon for Linux.
> > +
> > +         User space daemon for triggering Linux OOM killer
> > +         before running out of memory, avoiding situations
> > +         where the machine becomes unresponsive from out of
> > +         control swapping.
>
> Add the github url
>
> > diff --git a/package/earlyoom/earlyoom.hash b/package/earlyoom/earlyoom.hash
> > new file mode 100644
> > index 0000000000..4cafe50bc3
> > --- /dev/null
> > +++ b/package/earlyoom/earlyoom.hash
> > @@ -0,0 +1,4 @@
> > +# locally calculated
> > +sha256 b81804fc4470f996014d52252a87a1cf3b43d3d8754140035b10dcee349302b8  earlyoom-1.6.tar.gz
> > +# License files, locally calculated
> > +sha256 e730b3ec729de46d987ae73f30ed337e4cbe832f09205330acfa71848c6e0087  LICENSE
> > diff --git a/package/earlyoom/earlyoom.mk b/package/earlyoom/earlyoom.mk
> > new file mode 100644
> > index 0000000000..bea59bd416
> > --- /dev/null
> > +++ b/package/earlyoom/earlyoom.mk
> > @@ -0,0 +1,37 @@
> > +################################################################################
> > +#
> > +# earlyoom
> > +#
> > +################################################################################
> > +
> > +EARLYOOM_VERSION = 1.6
> > +EARLYOOM_SITE = $(call github,rfjakob,earlyoom,v$(EARLYOOM_VERSION))
> > +EARLYOOM_LICENSE = MIT
> > +EARLYOOM_LICENSE_FILES = LICENSE
> > +
> > +EARLYOOM_MAKE_OPTS = \
> > +       CC=$(TARGET_CC) \
> > +       DESTDIR=$(TARGET_DIR) \
> > +       VERSION=$(EARLYOOM_VERSION) \
> > +       PREFIX=/usr \
> > +       SYSTEMDUNITDIR=/usr/lib/systemd/system
> > +
> > +define EARLYOOM_CONFIGURE_CMDS
> > +       $(SED) "/systemctl/d" $(EARLYOOM_DIR)/Makefile
> > +       $(SED) "/chcon/d" $(EARLYOOM_DIR)/Makefile
> > +       $(SED) "/update-rc.d/d" $(EARLYOOM_DIR)/Makefile
> > +endef
> > +
> > +define EARLYOOM_BUILD_CMDS
> > +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) earlyoom $(EARLYOOM_MAKE_OPTS)
> > +endef
> > +
> > +define EARLYOOM_INSTALL_INIT_SYSV
> > +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install-initscript $(EARLYOOM_MAKE_OPTS)
>
> Do we need to do anything to adjust the name of the installed script
> (currently installs as /etc/init.d/earlyoom)?  Maybe a S01 or S02?
>

I can make this change.

> > +endef
> > +
> > +define EARLYOOM_INSTALL_INIT_SYSTEMD
> > +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install $(EARLYOOM_MAKE_OPTS)
>
> I noticed the earlyoom.default was setting EARLYOOM_ARGS="-r 3600".
> Do we need to 'make install-default' in both INSTALL_INIT steps?
>

Reading the project's Makefile again, it looks like both install
targets depend on the 'install-default' target, so unless I'm missing
something, this shouldn't be necessary.

> Regards,
> Matt
