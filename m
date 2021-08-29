Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9427FC432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 01:54:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2203060C51
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 01:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2203060C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA8EE400D8;
	Sun, 29 Aug 2021 01:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oezyZriPgbl4; Sun, 29 Aug 2021 01:54:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33BA4400FF;
	Sun, 29 Aug 2021 01:54:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E7501BF2F1
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 01:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 898B7400D8
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 01:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NPHzjQDlfEjD for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 01:54:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 246FB400FF
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 01:54:34 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id 6so15140720oiy.8
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 18:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cKO4Y75Hsp8kBkHTlZAIsxhLTRXIKjN/rbG6InF21Mg=;
 b=Dn30mXcIbYhg5MWFFnNSj7frAviOg4lOGlwFXEpUFwMzGpNpwF6/weB39LylkT47TO
 CRM2CjGKDq2JbaZeypIj9pEA4HsiGlav+XpTtyIEgFry1ap2z6wpG3ShfumakhhS2K1d
 WWA0pw9TBq25qLg8vrkTqi0X0kuMAdHhW4IsGIzIAQkNPcP/FZwtU9W0mkvg+FY8WogC
 z6pfOCnnjvckndr85kVDT4pJpcxzAIiwGk4h+q3FQKR4hZvIk1g+FrKehA95xURnavKt
 fRxacQjBFatVM79v6CMRcCX8bCqQsi5hCWQCCwRk/fwKe0OBCyzhz/JiHnzrnqT9cbot
 H4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cKO4Y75Hsp8kBkHTlZAIsxhLTRXIKjN/rbG6InF21Mg=;
 b=HFPDzGoEAoYMYTdLWmzHrz+KF3cpDgPPgDSuRNt+nErM0JckiQ6pDg7kiHUZBhy5q0
 ++vtuu4ID198OHUZYDDZJP4zLJqoDb4CgFcPGIpLlcjrcK2h45DBx6jfOeem+6fpCNM4
 T98ton5OgG4gBr7x4kkcqji1y3P63UcHiEpoLRNiVFchvIe4rhtYowb3+FYD5lcuemfd
 5Vl48duuGqeYqFD0sG1jZzG2344j8docxbz3vamOWPtaADLSDY/8gNc/qAVbiObhJaZ8
 k/ZDmcLmxU3ogaS9ngqOaExN5PH1NIs5okofYuooyG2znhC/mAztRQuK7xkHgK150+FO
 bkZA==
X-Gm-Message-State: AOAM530h1cyvaSQWeRoM9zss1+dUCpFqqQ4bDmNKor4ISRwmqaravaRz
 PpMbxYYov44TH+SdohdMSPkEF09VuznUW70mCk09k7IBjTE=
X-Google-Smtp-Source: ABdhPJwIr/SMHQoZ9YjGbTaeqY7Ue4A+y2LInJUjUhdIFfxe9Kt79xRKlPeA9aN8f1hc0RH+s36ldZDypbTVjgu7WNM=
X-Received: by 2002:a05:6808:1787:: with SMTP id
 bg7mr19707048oib.39.1630202072861; 
 Sat, 28 Aug 2021 18:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210828044626.3170348-1-james.hilliard1@gmail.com>
 <48045f87-380b-6f11-95a4-7fc6e7520936@mind.be>
In-Reply-To: <48045f87-380b-6f11-95a4-7fc6e7520936@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 28 Aug 2021 19:54:21 -0600
Message-ID: <CADvTj4pGvfaCRUoOSGms=ZuNv39Fo_MDVzKSDv31tC0FoFg_ew@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/swupdate: update service/init
 configs
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sat, Aug 28, 2021 at 6:44 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi James,
>
>  "update" in the subject is not really helpful.

I had assumed these configs were mostly just re-syncing with meta-swupdate.

I'll split this patch up.

>
> On 28/08/2021 06:46, James Hilliard wrote:
> > Set SKIP_STRIP=y so that the swupdate binary isn't stripped.
>
>  We can see that from the patch - instead you should explain why we want to skip
> strip.
>
>  Also, this has nothing to do with systemd configs, so should be a separate patch.
>
>  In this case for sure, because I think it might be something for master.

Ok, will send separately.

>
>
> > Introduce BR2_PACKAGE_SWUPDATE_WEBSERVER so that we can control
> > the required webserver config installation when enabled.
>
>  This also should be a separate patch (though less important in this case).
>
>
> > Ensure swupdate systemd support is always set based on buildroot
> > using systemd as this is required for the systemd services.
> >
> > Use swupdate's make install so that we install swupdate tools needed
> > for services.
> >
> > Adapted from:
> > https://github.com/sbabic/meta-swupdate/tree/abc520d97482232302046459715845a025aca7d6/recipes-support/swupdate/swupdate
> > https://github.com/sbabic/meta-swupdate/blob/abc520d97482232302046459715845a025aca7d6/recipes-support/swupdate/swupdate.inc
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/swupdate/10-mongoose-args          |  1 +
> >  package/swupdate/90-start-progress         |  1 +
> >  package/swupdate/Config.in                 |  7 ++++
> >  package/swupdate/swupdate-progress.service |  9 +++++
> >  package/swupdate/swupdate-usb.rules        |  2 +
> >  package/swupdate/swupdate-usb@.service     |  8 ++++
> >  package/swupdate/swupdate.mk               | 43 +++++++++++++++++++---
> >  package/swupdate/swupdate.socket           | 11 ++++++
> >  package/swupdate/tmpfiles-swupdate.conf    |  2 +
> >  9 files changed, 79 insertions(+), 5 deletions(-)
> >  create mode 100644 package/swupdate/10-mongoose-args
> >  create mode 100644 package/swupdate/90-start-progress
> >  create mode 100644 package/swupdate/swupdate-progress.service
> >  create mode 100644 package/swupdate/swupdate-usb.rules
> >  create mode 100644 package/swupdate/swupdate-usb@.service
> >  create mode 100644 package/swupdate/swupdate.socket
> >  create mode 100644 package/swupdate/tmpfiles-swupdate.conf
> >
> > diff --git a/package/swupdate/10-mongoose-args b/package/swupdate/10-mongoose-args
> > new file mode 100644
> > index 0000000000..896e66ba86
> > --- /dev/null
> > +++ b/package/swupdate/10-mongoose-args
> > @@ -0,0 +1 @@
> > +SWUPDATE_WEBSERVER_ARGS="-r /www ${SWUPDATE_MONGOOSE_EXTRA_ARGS:--p 8080}"
>
>  Is this correct? The webserver is installed in /var/www, not /www...
>
> > diff --git a/package/swupdate/90-start-progress b/package/swupdate/90-start-progress
> > new file mode 100644
> > index 0000000000..3b0eb5e7d7
> > --- /dev/null
> > +++ b/package/swupdate/90-start-progress
> > @@ -0,0 +1 @@
> > +exec /usr/bin/swupdate-progress -w -r &
> > diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
> > index f601e45fcd..6b832cfcbf 100644
> > --- a/package/swupdate/Config.in
> > +++ b/package/swupdate/Config.in
> > @@ -60,9 +60,16 @@ config BR2_PACKAGE_SWUPDATE_CONFIG
> >         I you wish to use your own modified swupdate configuration
> >         file specify the config file location with this option.
> >
> > +config BR2_PACKAGE_SWUPDATE_WEBSERVER
> > +     bool "swupdate webserver"
> > +     default y
> > +     help
> > +       Enable update from remote using a web server on the target.
> > +
> >  config BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
> >       bool "install default website"
> >       default y
> > +     depends on BR2_PACKAGE_SWUPDATE_WEBSERVER
>
>  I could be mistaken, but isn't the website perfectly usable with an external
> webserver as well? You just have to provide the upload endpoint IIRC.

The webserver is also the upload endpoint and is thus required, sure you can
proxy to it via nginx even but it's not optional for the update
website to function.

>
> >       help
> >         Install the provided website to /var/www/swupdate.
> >
> > diff --git a/package/swupdate/swupdate-progress.service b/package/swupdate/swupdate-progress.service
> > new file mode 100644
> > index 0000000000..0d464bb420
> > --- /dev/null
> > +++ b/package/swupdate/swupdate-progress.service
> > @@ -0,0 +1,9 @@
> > +[Unit]
> > +Description=swupdate progress service
> > +After=swupdate.service
> > +
> > +[Service]
> > +ExecStart=/usr/bin/swupdate-progress -r -w
> > +
> > +[Install]
> > +WantedBy=swupdate.service
>
>  I suspect this is copied verbatim from meta-swupdate... It's good form to then
> add a comment in the beginning of the file that specifies the upstream copyright
> and license (in SPDX) and an upstream link.
>
>  Same for all other files you copied, of course.

Hmm, I'm thinking the best option would just be to add a comment to the makefile
indicating the source of them, they are MIT licensed which is already a license
listed for the swupdate package.

>
> > diff --git a/package/swupdate/swupdate-usb.rules b/package/swupdate/swupdate-usb.rules
> > new file mode 100644
> > index 0000000000..b4efd0b733
> > --- /dev/null
> > +++ b/package/swupdate/swupdate-usb.rules
> > @@ -0,0 +1,2 @@
> > +ACTION=="add", KERNEL=="sd*", SUBSYSTEM=="block", ENV{ID_BUS}=="usb", ENV{ID_FS_USAGE}=="filesystem", TAG+="systemd", ENV{SYSTEMD_WANTS}+="swupdate-usb@%k.service"
>
>  Hm, I wonder if it's a good idea to install this unconditionally... It feels to
> me that this is a possible attack vector that the user should be aware of - and
> the best way to do that is to make the whole thing optional.

Maybe, although swu files should typically be signed.

>
>  But really, I kind of wonder if this is something that Buildroot should
> provide. Ideally, this should be part of the swupdate documentation, and if you
> actually want automatic updates when a USB storage device is plugged in, you can
> put that stuff in an overlay.

Well it's included by default in the meta-swupdate layer, but yeah I
should probably
add a config option for it.

>
>
> > diff --git a/package/swupdate/swupdate-usb@.service b/package/swupdate/swupdate-usb@.service
> > new file mode 100644
> > index 0000000000..eda9d1539c
> > --- /dev/null
> > +++ b/package/swupdate/swupdate-usb@.service
> > @@ -0,0 +1,8 @@
> > +[Unit]
> > +Description=usb media swupdate service
> > +Requires=swupdate-progress.service
> > +
> > +[Service]
> > +ExecStartPre=/bin/mount /dev/%I /mnt
> > +ExecStart=/bin/sh -c "swupdate-client -v /mnt/*.swu"
> > +ExecStopPost=/bin/umount /mnt
> > diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> > index 402aa0a91f..3368b6ef6a 100644
> > --- a/package/swupdate/swupdate.mk
> > +++ b/package/swupdate/swupdate.mk
> > @@ -22,7 +22,7 @@ SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
> >  # swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not
> >  # available in all external toolchains, and use CC for linking. Ensure
> >  # TARGET_CC is used for both.
> > -SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)"
> > +SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)" SKIP_STRIP=y
> >
> >  # swupdate bundles its own version of mongoose (version 6.16)
> >
> > @@ -139,6 +139,13 @@ endif
> >
> >  ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> >  SWUPDATE_DEPENDENCIES += systemd
> > +define SWUPDATE_SET_SYSTEMD
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_SYSTEMD)
> > +endef
> > +else
> > +define SWUPDATE_SET_SYSTEMD
> > +     $(call KCONFIG_DISABLE_OPT,CONFIG_SYSTEMD)
> > +endef
> >  endif
> >
> >  ifeq ($(BR2_PACKAGE_LIBUBOOTENV),y)
> > @@ -180,6 +187,16 @@ ifeq ($(BR2_PACKAGE_LIBRSYNC),y)
> >  SWUPDATE_DEPENDENCIES += librsync
> >  endif
> >
> > +ifeq ($(BR2_PACKAGE_SWUPDATE_WEBSERVER),y)
> > +define SWUPDATE_SET_WEBSERVER
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_WEBSERVER)
> > +endef
> > +else
> > +define SWUPDATE_SET_WEBSERVER
> > +     $(call KCONFIG_DISABLE_OPT,CONFIG_WEBSERVER)
> > +endef
> > +endif
> > +
> >  SWUPDATE_BUILD_CONFIG = $(@D)/.config
> >
> >  SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
> > @@ -192,14 +209,17 @@ SWUPDATE_MAKE_OPTS = \
> >
> >  define SWUPDATE_KCONFIG_FIXUP_CMDS
> >       $(SWUPDATE_SET_LUA_VERSION)
> > +     $(SWUPDATE_SET_SYSTEMD)
> > +     $(SWUPDATE_SET_WEBSERVER)
> >  endef
> >
> >  define SWUPDATE_BUILD_CMDS
> > -     $(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) $(SWUPDATE_MAKE_OPTS) -C $(@D)
> > +     $(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D) $(SWUPDATE_MAKE_OPTS)
> >  endef
> >
> >  define SWUPDATE_INSTALL_TARGET_CMDS
> > -     $(INSTALL) -D -m 0755 $(@D)/swupdate $(TARGET_DIR)/usr/bin/swupdate
> > +     $(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D) \
> > +             $(SWUPDATE_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
> >       $(if $(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE), \
> >               mkdir -p $(TARGET_DIR)/var/www/swupdate; \
> >               cp -dpfr $(@D)/examples/www/v2/* $(TARGET_DIR)/var/www/swupdate)
> > @@ -213,23 +233,36 @@ $(error No Swupdate configuration file specified, check your BR2_PACKAGE_SWUPDAT
> >  endif
> >  endif
> >
> > -ifeq ($(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE),y)
> >  define SWUPDATE_INSTALL_COMMON
> >       mkdir -p $(TARGET_DIR)/etc/swupdate/conf.d \
> >               $(TARGET_DIR)/usr/lib/swupdate/conf.d
> >       $(INSTALL) -D -m 755 package/swupdate/swupdate.sh \
> >               $(TARGET_DIR)/usr/lib/swupdate/swupdate.sh
> > +     $(if $(BR2_PACKAGE_SWUPDATE_WEBSERVER), \
>
>  Not saying that adding the Buildroot config option is bad, but another option
> would be to simply check the setting of the webserver option in the swupdate config:
>
>         if grep -q '^CONFIG_WEBSERVER=y' $(SWUPDATE_BUILD_CONFIG); then \
> > +             $(INSTALL) -D -m 644 package/swupdate/10-mongoose-args \
> > +                     $(TARGET_DIR)/usr/lib/swupdate/conf.d/10-mongoose-args)
> >  endef
> >  define SWUPDATE_INSTALL_INIT_SYSTEMD
> >       $(SWUPDATE_INSTALL_COMMON)
> >       $(INSTALL) -D -m 644 package/swupdate/swupdate.service \
> >               $(TARGET_DIR)/usr/lib/systemd/system/swupdate.service
> > +     $(INSTALL) -D -m 644 package/swupdate/swupdate.socket \
> > +             $(TARGET_DIR)/usr/lib/systemd/system/swupdate.socket
> > +     $(INSTALL) -D -m 644 package/swupdate/swupdate-usb@.service \
> > +             $(TARGET_DIR)/usr/lib/systemd/system/swupdate-usb@.service
> > +     $(INSTALL) -D -m 644 package/swupdate/swupdate-progress.service \
> > +             $(TARGET_DIR)/usr/lib/systemd/system/swupdate-progress.service
> > +     $(INSTALL) -D -m 644 package/swupdate/tmpfiles-swupdate.conf \
> > +             $(TARGET_DIR)/usr/lib/tmpfiles.d/tmpfiles-swupdate.conf
> > +     $(INSTALL) -D -m 644 package/swupdate/swupdate-usb.rules \
> > +             $(TARGET_DIR)/lib/udev/rules.d/swupdate-usb.rules
> >  endef
> >  define SWUPDATE_INSTALL_INIT_SYSV
> >       $(SWUPDATE_INSTALL_COMMON)
> >       $(INSTALL) -D -m 755 package/swupdate/S80swupdate \
> >               $(TARGET_DIR)/etc/init.d/S80swupdate
> > +     $(INSTALL) -D -m 644 package/swupdate/90-start-progress \
> > +             $(TARGET_DIR)/usr/lib/swupdate/conf.d/90-start-progress
> >  endef
> > -endif
> >
> >  $(eval $(kconfig-package))
> > diff --git a/package/swupdate/swupdate.socket b/package/swupdate/swupdate.socket
> > new file mode 100644
> > index 0000000000..2b756714c5
> > --- /dev/null
> > +++ b/package/swupdate/swupdate.socket
> > @@ -0,0 +1,11 @@
> > +[Unit]
> > +Description=SWUpdate socket listener
> > +Documentation=https://github.com/sbabic/swupdate
> > +Documentation=https://sbabic.github.io/swupdate
> > +
> > +[Socket]
> > +ListenStream=/tmp/sockinstctrl
> > +ListenStream=/tmp/swupdateprog
> > +
> > +[Install]
> > +WantedBy=sockets.target
> > diff --git a/package/swupdate/tmpfiles-swupdate.conf b/package/swupdate/tmpfiles-swupdate.conf
> > new file mode 100644
> > index 0000000000..4743672fcc
> > --- /dev/null
> > +++ b/package/swupdate/tmpfiles-swupdate.conf
> > @@ -0,0 +1,2 @@
> > +X /tmp/datadst
> > +X /tmp/scripts
>
>  Why are these needed? Are they only needed for systemd? If not, the S80swupdate
> init script should also be updated to create those directories.

These directives prevent systemd from deleting those folders, they are
not needed
for non-systemd setups.

See:
https://www.freedesktop.org/software/systemd/man/tmpfiles.d.html

Specifically:
X
Ignore a path during cleaning. Use this type to exclude paths from clean-up as
controlled with the Age parameter. Unlike x, this parameter will not exclude the
content if path is a directory, but only directory itself. Note that
lines of this type do
not influence the effect of r or R lines. Lines of this type accept
shell-style globs in
place of normal path names.


>
>  Regards,
>  Arnout
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
