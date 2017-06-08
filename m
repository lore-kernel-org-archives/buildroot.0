From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 8 Jun 2017 20:49:27 +0200
Subject: [Buildroot] [PATCH WIP] package/systemd: fix paths to runtime
	utilities
In-Reply-To: <CAFSsvmqKd7zVrMTDAGRjv8z0-RmzHfmsLNVP1TQDJZpKVeivZg@mail.gmail.com>
References: <20170607220837.2969-1-yann.morin.1998@free.fr>
 <CAFSsvmqKd7zVrMTDAGRjv8z0-RmzHfmsLNVP1TQDJZpKVeivZg@mail.gmail.com>
Message-ID: <20170608184927.GA3058@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2017-06-08 10:34 -0400, Adam Duskett spake thusly:
[--SNIP--]
> > -# Override path to kmod, used in kmod-static-nodes.service
> > +# Override paths to a few utilities needed at runtime, to
> > +# avoid finding those we would install in $(HOST_DIR).
> >  SYSTEMD_CONF_ENV = \
> >         CFLAGS="$(SYSTEMD_CFLAGS)" \
> > -       ac_cv_path_KMOD=/usr/bin/kmod
> > +       ac_cv_path_KILL=/usr/bin/kill \
> > +       ac_cv_path_KMOD=/usr/bin/kmod \
> > +       ac_cv_path_KEXEC=/usr/sbin/kexec \
> > +       ac_cv_path_SULOGIN=/usr/sbin/sulogin \
> These work fine.
> 
> > +       ac_cv_path_MOUNT=/usr/sbin/mount \
> > +       ac_cv_path_UMOUNT=/usr/sbin/umount
> This should be :
> ac_cv_path_MOUNT_PATH=/usr/bin/mount \
> ac_cv_path_UMOUNT_PATH=/usr/bin/umount
> 
> Why they decided that MOUNT and UMOUNT need to have _PATH
> in the variable name is beyond me.

Damn, indeed, I did not see it when looking at configure.ac...

> Also /bin/ instead of /sbin.

Yup, right.

> >  define SYSTEMD_RUN_INTLTOOLIZE
> >         cd $(@D) && $(HOST_DIR)/usr/bin/intltoolize --force --automake
> > @@ -182,8 +188,14 @@ endif
> >
> >  ifeq ($(BR2_PACKAGE_SYSTEMD_QUOTACHECK),y)
> >  SYSTEMD_CONF_OPTS += --enable-quotacheck
> > +SYSTEMD_CONF_ENV += \
> > +       ac_cv_path_QUOTAON=/usr/sbin/quotaon \
> > +       ac_cv_path_QUOTACHECK=/usr/sbin/quotacheck
> >  else
> >  SYSTEMD_CONF_OPTS += --disable-quotacheck
> > +SYSTEMD_CONF_ENV += \
> > +       ac_cv_path_QUOTAON=/.missing \
> > +       ac_cv_path_QUOTACHECK=/.missing
> >  endif
> >
> >  ifeq ($(BR2_PACKAGE_SYSTEMD_TMPFILES),y)
> > --
> > 2.11.0
> >
> 
> After I made the small changes above, the system booted just fine again!
> Thanks a ton for your help!

Thanks for testting! :-)

I'll re-spin a v2 with those changes.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
