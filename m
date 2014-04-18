From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Sat, 19 Apr 2014 00:14:08 +0200
Subject: [Buildroot] [PATCH 1/1] dcron: new package
In-Reply-To: <20140418234217.6914f6a6@skate>
References: <1394613893-26144-1-git-send-email-alvaro.gamez@hazent.com>
 <20140418234217.6914f6a6@skate>
Message-ID: <CAM+bi4v_vnuS-qhX2u5LTsu_fmhN2RaUv_brDmQbA0-WMnRmBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Thomas


2014-04-18 23:42 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Have you checked that dcron really has no dependencies on toolchain
> features? Could you test building it with the following toolchain
> configurations:
>
>
> http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-basic.config
>
> http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-full-nothread.config
>
> http://autobuild.buildroot.org/toolchains/configs/free-electrons/bfin-uclinux.config
>

Will test this next week, I hope and make changes as needed. I will try not
to forget to do this whenever I submit a new package.


>  > +DCRON_LICENSE = GPLv2
>
> How do you know it's GPLv2 ? Unfortunately the source code isn't very
> specific about the version of the GPL license being used. The only
> information I've found is:
>
> May be distributed under the GNU General Public License
>

You're right. I think it was just an asumption on my part. It may be as
well GPLv1 licensed, since original releases were coded in 1994 or maybe
before. Truth is, the abscense of version number could be due to the fact
that it was written before there was any version to reference.


> > +
> > +DCRON_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" AR="$(TARGET_AR)"
>
> You should instead use $(TARGET_CONFIGURE_OPTS), which already has all
> these definitions.
>

Will do, so I can omit simply this line.


>  > +
> > +define DCRON_PERMISSIONS
> > +/usr/sbin/crond                       f 4755 0 0 - - - - -
>
> Is it really needed to install this daemon suid-root? I don't think we
> install other daemons suid-root.
>

Nope, you're right. I don't recall why I set this. I think I extracted it
from upstream Makefile, but it's not really needed.



> > +endef
> > +
> > +define DCRON_BUILD_CMDS
> > +     $(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D)
> $(DCRON_MAKE_OPT)
>
> Is DESTDIR= really needed during the build step?
>

I think it is, but I'll check it too.


> Also, use TARGET_CONFIGURE_OPTS instead of DCRON_MAKE_OPT.
>
> > +endef
> > +
> > +define DCRON_INSTALL_TARGET_CMDS
> > +     $(INSTALL) -m0700 $(@D)/crond $(TARGET_DIR)/usr/sbin/crond
>
> Use -D
>
> > +     $(INSTALL) -m4755 $(@D)/crontab $(TARGET_DIR)/usr/bin/crontab
>
> Ditto. And why 4755 instead of 755 ?
>

Ok, this is tricky. The typical use here is really not 4755 but 2755, and
crontab should be owned by 'crontab' group, so only users belonging to this
group are able to create crontab files. We can either do this, checking all
permissions and ownerships support this, or we could just ignore this
option and let all users of the system create and edit crontab files.



> > +     $(INSTALL) -D -m0644 $(@D)/extra/root.crontab
> $(TARGET_DIR)/etc/cron.d/system
> > +     $(INSTALL) -d -m0755 $(TARGET_DIR)/var/spool/cron/crontabs \
> > +             $(TARGET_DIR)/etc/cron.daily $(TARGET_DIR)/etc/cron.hourly
> \
> > +             $(TARGET_DIR)/etc/cron.monthly
> $(TARGET_DIR)/etc/cron.weekly
> > +endef
> > +
> > +define DCRON_CLEAN_CMDS
> > +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean
> > +endef
>
> <pkg>_CLEAN_CMDS no longer exist, so this part should be removed.
>
> Could you take these comments into account and submit an updated
> version?
>

I'll finish testing all these next week I hope and resubmit the patch. I'm
sorry this patch arrived in such poor state. I think I even wrote it before
CLEAN_CMDS was deprecated, so that could explain some mistakes, as well as
the fact that I forgot about this and I mistakenly sent it twice because I
kept forgetting about it... definitely not my best!


> Thanks a lot!
>

Thank you for your comments and guiding!


>  Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140419/667af7b9/attachment.html>
