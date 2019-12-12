From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Dec 2019 18:31:56 +0100
Subject: [Buildroot] [PATCH v4 01/13] new recipe : host-systemd
In-Reply-To: <20191212111920.297bdca6@windsurf>
References: <20191212075400.1499536-1-jeremy.rosen@smile.fr>
 <20191212075400.1499536-2-jeremy.rosen@smile.fr>
 <20191212111920.297bdca6@windsurf>
Message-ID: <20191212173156.GE30031@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, Thomas,All,

On 2019-12-12 11:19 +0100, Thomas Petazzoni spake thusly:
> On Thu, 12 Dec 2019 08:53:48 +0100
> J?r?my Rosen <jeremy.rosen@smile.fr> wrote:
[--SNIP--]
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index a292a7512b..ad16b58ceb 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -204,6 +204,11 @@ endif
> >  
> >  ifeq ($(BR2_PACKAGE_SYSTEMD_HWDB),y)
> >  SYSTEMD_CONF_OPTS += -Dhwdb=true
> > +define SYSTEMD_BUILD_HWDB
> > +	$(HOST_DIR)/bin/udevadm hwdb --update --root $(TARGET_DIR)
> > +endef
> 
> I think this change could be a separate patch, no? Or is the udevadm
> binary installed by host-systemd conflicting with the one installed by
> host-eudev ?
> 
> Should be explained in the commit log.

I think this change should go in current patch 2, where systemd is made
dependent on host-systemd, which indeed installs its own udevadm which
would conflict with the one from host-eudev.

[--SNIP--]
> > +# Host-systemd configuration
> > +#
> > +#Options tweaked for buildroot
> > +HOST_SYSTEMD_CONF_OPTS= \
> > +	-Dsplit-bin=true \
> > +	-Dsplit-usr=false \
> > +	--prefix=/usr \
> 
> This should really be:
> 
> 	--prefix=$(HOST_DIR)
> 
> > +	--libdir=lib \
> > +	--sysconfdir=/etc \
> > +	--localstatedir=/var
> 
> But in fact, all these options are already passed by the
> host-meson-package infrastructure. Why are you overriding them ?
[--SNIP--]
> > +# * thus re-tweak rpath after the installation for all binaries that need it
> I must admit I don't really understand what's going on here. Can't you
> simply do something like this:
> 
> HOST_SYSTEMD_CONF_ENV = \
> 	LDFLAGS="$(HOST_LDFLAGS) -Wl,-rpath,$(HOST_DIR)/lib/systemd"
> 
> and that's it ?

For the records, here are the explanations I provided on IRC.

The first question is: why do we use --prefix=/usr ?

systemd will store its --prefix in all the executables it generates. As
such, systemctl will have a hardcoded 'prefix', where it will manipulate
and create files/symlinks in. When called natively, this is nice and
shinny.

However, for cross-setup, that does not work obviously.

So, systemd has its tools know about the 'root' directory where this
prefix should be related to. We can call systemctl --root=$(TARGET_DIR)
and systemctl wil do the links and such in there.

However, it does so by appending its known prefix to it.

So, if we were to configure host-systemd as we usually do, with
--prefix=$(HOST_DIR), then when we would call host systemctl --root=$(TARGET_DIR)
it would look for files in $(TARGET_DIR)/$(HOST_DIR), which is wrong.

Calling the host systemctl without --root is also wrong, as it would look for
files in $(HOST_DIR)

So, there is no satisfying official support for this case.

The trick then, is to configure systemd with the prefix it would expect
at runtime (on the target!), that is with /usr, but install out-of-tree.

That was it for the first part of the question: why do we use --prefix.

Now, the second question is: why do we need to muck up with the rpath
after installation?
Well, this boils down to meson (and not systemd itself). When it
installs executables, meson will handily insert whatever rpath the
package meson.build would tell it to use. systemd installs libs in
$(prefix)/lib/systemd and as a NEEDED to those libs, so it uses an RPATH
to find those libs, and meson does introduce that RPATH.
However, we Buildroot also want to insert our own RPATH, because systemd
uses util-linux' libs and libcap, so it needs our RPATH.
However, meson can not extend the RPATH from the LDFLAGS in the
environment; meson can only set the RPATH from what it knows about from
the package's meson.build.

That, in addition to the --prefix=/usr issue above, means that the
executables installed by host-systemd have an RPATH set to
/usr/lib/systemd. when we would want it to be set to
$(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd

That;s what is done in the post-install hook: set the RPATH to the
appropriate values.

[--SNIP--]
> > +HOST_SYSTEMD_POST_INSTALL_HOOKS +=  HOST_SYSTEMD_FIX_RPATH
> > +HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
> With the correct --prefix=$(HOST_DIR) passed by the default
> host-meson-package infrastructure, this DESTDIR=$(HOST_DIR) should no
> longer be necessary.

Alas, this is not possible... :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
