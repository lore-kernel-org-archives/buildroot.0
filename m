From: Jeff Zignego <jzignego@hedcontrols.com>
Date: Wed, 04 Nov 2020 12:56:02 -0600
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5base: add -syslog option
In-Reply-To: <20201104113331.03437e4a@gmx.net>
References: <20201103221817.213528-1-jzignego@hedcontrols.com>
 <20201104113331.03437e4a@gmx.net>
Message-ID: <7e3fdcb58ea4136c56f3cbc6892ae876b22a01f7.camel@hedcontrols.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2020-11-04 at 11:33 +0100, Peter Seiderer wrote:
> External email: CAUTION, be careful with links or attachments!
> 
> 
> Hello Jeff,
> 
> On Tue,  3 Nov 2020 16:18:17 -0600, jzignego--- via buildroot <
> buildroot at busybox.net> wrote:
> 
> > From: Jeff Zignego <jzignego@hedcontrols.com>
> > 
> > When using sysvinit (or the busybox implementation) qt5 can output
> > log
> > messages to the traditional syslog with the -syslog compile time
> > option. This is very similar to the -journald compile time option
> > already being leveraged in qt5base.mk
> > 
> > Signed-off-by: Jeff Zignego <jzignego@hedcontrols.com>
> > ---
> >  package/qt5/qt5base/qt5base.mk | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/package/qt5/qt5base/qt5base.mk
> > b/package/qt5/qt5base/qt5base.mk
> > index ed308c1fa2..d9b8ff279b 100644
> > --- a/package/qt5/qt5base/qt5base.mk
> > +++ b/package/qt5/qt5base/qt5base.mk
> > @@ -254,6 +254,20 @@ else
> >  QT5BASE_CONFIGURE_OPTS += -no-journald
> >  endif
> > 
> > +ifeq ($(BR2_PACKAGE_SYSVINIT),y)
> > +QT5BASE_CONIGURE_OPTS += -syslog
> > +QT5BASE_DEPENDENCIES += sysvinit
> > +else
> > +QT5BASE_CONFIGURE_OPTS += -no-syslog
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_INIT_BUSYBOX),y)
> > +QT5BASE_CONIGURE_OPTS += -syslog
> > +QT5BASE_DEPENDENCIES += busybox
> > +else
> > +QT5BASE_CONFIGURE_OPTS += -no-syslog
> > +endif
> > +
> 
> This would result in busybox overwriting the sysvinit case, e.g. with
> BR2_PACKAGE_SYSVINIT set and BR2_PACKAGE_INIT_BUSYBOX unset:
> 
>         QT5BASE_CONFIGURE_OPTS = ... -syslog -no-syslog ...
> 
> 
> Not an init/syslog expert, but I believe the syslog feature is
> independent
> of the init system used (as long as a some daemon is listening on the
> /dev/log
> socket, something which even works with systemd) and the used
> syslog.h
> header file is provided by the C library already (no need for another
> compile time dependency)...
> 
> For the Qt syslog feature I would suggest an extra config option
> (as some other packages do already, see e.g.
> BR2_PACKAGE_COLLECTD_SYSLOG,
> BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG), because enabling this
> changes the default Qt logging from stderr to syslog (see
> qt5base-5.15.1/src/corelib/global/qlogging.cpp), something
> not every user is expecting (yes I know this is not symmetrical
> for the systemd buildroot handling)...
> 
> Regards,
> Peter
> 
> 
> 
> >  ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
> >  # use vivante backend
> >  QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_viv

Ya I don't know what I was thinking, that first patch was bad. Sent a v2. 

-- 
Thanks,
Jeff Zignego
