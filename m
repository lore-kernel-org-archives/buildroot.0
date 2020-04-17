From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 17 Apr 2020 07:33:46 -0500
Subject: [Buildroot] [PATCH v3] package/swupdate: add basic systemd
 service
In-Reply-To: <20200417085648.68898eb5@windsurf.home>
References: <20200416190209.40757-1-matthew.weber@rockwellcollins.com>
 <20200417085648.68898eb5@windsurf.home>
Message-ID: <CANQCQpY50FLwcx40f2o=aqSK5tjNbHge1QyuJ7-aofbpO3P75A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


On Fri, Apr 17, 2020 at 2:00 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Thu, 16 Apr 2020 14:02:09 -0500
> Matt Weber <matthew.weber@rockwellcollins.com> wrote:
>
> > +ifeq ($(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE),y)
> > +define SWUPDATE_INSTALL_INIT_SYSTEMD
> > +     $(INSTALL) -D -m 644 package/swupdate/swupdate.service \
> > +             $(TARGET_DIR)/usr/lib/systemd/system/swupdate.service
> > +     mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>
> Is creating this directory still necessary? I believe not. Other
> packages that install a systemd .service do not create such a directory.

True that doesn't need to be created any more.

>
> >  $(eval $(kconfig-package))
> > diff --git a/package/swupdate/swupdate.service b/package/swupdate/swupdate.service
> > new file mode 100644
> > index 0000000000..232bd9956e
> > --- /dev/null
> > +++ b/package/swupdate/swupdate.service
> > @@ -0,0 +1,18 @@
> > +[Unit]
> > +Description=SWUpdate daemon
> > +Documentation=https://github.com/sbabic/swupdate
> > +Documentation=https://sbabic.github.io/swupdate
> > +
> > +[Service]
> > +# Default environment variables in case /etc/default/swupdate isn't providing them
> > +Environment=SWU_POST_UPDATE_CMD="touch /tmp/.swu_complete"
> > +Environment=SWU_WEBSERVER_ARGS="-p 8080 -r /var/www/swupdate/"
> > +
> > +# Always take what is in the environment files when exists
> > +EnvironmentFile=/etc/default/swupdate
> > +
> > +ExecStart=/usr/bin/swupdate ${SWU_KEY_ARGS} -p ${SWU_POST_UPDATE_CMD} -v -L -w "${SWU_WEBSERVER_ARGS}"
>
> It this really the right way of doing this, i.e to force the options to
> be -p ... -v -L -w .. ?
>
> Shouldn't this be replaced entirely by:
>
> [Service]
> Environment=SWUPDATE_ARGS="your default set of options"
> EnvironmentFile=/etc/default/swupdate
> ExecStart=/usr/bin/swupdate ${SWUPDATE_ARGS}
>
> so that the arguments can be fully customized from
> /etc/default/swupdate ?
>

Yeah the problematic part is that the web server args require a
specific quoting so that that sub option can pick those up.  I'll take
a look at the yocto approach as they went to a shell script launch
instead to add swupdate.d/ as an option as well.   [1][2]  Maybe we
just adopt exactly what they're doing as it doesn't look to bad
(config file is in a different location)



Regards,
Matt

[1] https://github.com/sbabic/meta-swupdate/blob/master/recipes-support/swupdate/swupdate/swupdate.service#L7
[2] https://github.com/sbabic/meta-swupdate/blob/master/recipes-support/swupdate/swupdate/swupdate.sh
