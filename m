From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Mon, 20 Jul 2020 10:42:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: pre-create directories
 for services
In-Reply-To: <20200718211625.GR18825@scaer>
References: <20200717234235.17829-1-nolange79@gmail.com>
 <20200718211625.GR18825@scaer>
Message-ID: <CAFvCimXHxkL-nNO9EMuLZNJUKuLqbr7bW3r=NxCEOgRT=iAgfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am kinda philosophically torn on this one...


According to man:file-hierarchy, /var MUST be writable (it MAY be a tmpfs
if the system has no persistent, writable storage)

This means that daemons can assume that /var will be writable, and we might
be starting a wild goose hunt to get them
working in all cases.
The clean way to have a file go in /var (at least with systemd) is to put
it in /usr/share/factory/var/ and systemd will copy it to
/var on first boot (or every boot if it's a tmpfs)

this has the added advantage that /var can be empty at install time, can be
easily reset by reformatting/emptying
without breaking the system.

I have no idea how factory is handled in sysV.

If buildroot wants to support read-only /var, it's supporting a "buggy
setup" according to various standards including FHS.
And yeah... it's a buggy setup, but it's also a common setup :(

So, I guess it's important to point that out but I don't really know what
the correct answer is for buildroot..

Jeremy


Le sam. 18 juil. 2020 ? 23:16, Yann E. MORIN <yann.morin.1998@free.fr> a
?crit :

> Norbert, All,
>
> On 2020-07-18 01:42 +0200, Norbert Lange spake thusly:
> > this adds a new hook and a corresponding variable to add
> > addirectories and files after installation.
> >
> > various services need directories in /var when they are started,
> > and create them if necessary. Creating those before, allows
> > those services to start even if /var is read-only.
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > ---
> >  package/systemd/systemd.mk | 24 +++++++++++++++++++-----
> >  1 file changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index c202f5be02..b57365872e 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -317,6 +317,7 @@ endif
> >
> >  ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
> >  SYSTEMD_CONF_OPTS += -Dlogind=true
> > +SYSTEMD_POST_INSTALL_ENTRIES += var/lib/systemd/linger/
>
> The naming is not nice. Also, paths should be absolute:
>
>     SYSTEMD_CREATE_DIRS += /var/lib/systemd/linger/
>
> However, I am not fond of mixing the directories creation with two
> infras: post-isntall hooks and _PERMISSIONS tables.
>
> So, in fact:
>
>     SYSTEMD_LOGIND_PERMISIONS = /var/lib/systemd/linger d 755 0 0 - - - - -
>
> Ditto for the others conditional directories. And of course, we should
> also treat the non-conditional ones similarly.
>
> [--SNIP--]
> > @@ -436,6 +440,7 @@ endif
> >  ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
> >  SYSTEMD_CONF_OPTS += -Dtimesyncd=true
> >  SYSTEMD_TIMESYNCD_USER = systemd-timesync -1 systemd-timesync -1 * - -
> - systemd Time Synchronization
> > +SYSTEMD_POST_INSTALL_ENTRIES += var/lib/systemd/timesync/
>
>     SYSTEMD_TIMESYNCD_PERMISIONS = /var/lib/systemd/timesync d 755
> systemd-timesync systemd-timesync - - - - -
>
> [--SNIP--]
> > @@ -485,18 +490,23 @@ ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
> >  SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
> >  endif
> >
> > +define SYSTEMD_INSTALL_ENTRY_HOOK
> > +     mkdir -p -m700 $(TARGET_DIR)/var/lib/private
> $(TARGET_DIR)/var/log/private \
> > +             $(TARGET_DIR)/var/cache/private
> > +     mkdir -p -m1777 $(TARGET_DIR)/var/tmp
> > +     $(if $(BR2_PACKAGE_SYSTEMD_MACHINED),mkdir -p -m700
> $(TARGET_DIR)/var/lib/machines)
> > +     mkdir -p $(addprefix $(TARGET_DIR)/,var/lib $(filter
> %/,$(SYSTEMD_POST_INSTALL_ENTRIES)))
> > +     touch $(addprefix $(TARGET_DIR)/,etc/machine-id $(filter-out
> %/,$(SYSTEMD_POST_INSTALL_ENTRIES)))
> > +endef
>
> This would thus no longer be needed.
>
> >  define SYSTEMD_INSTALL_INIT_HOOK
> >       ln -fs multi-user.target \
> >               $(TARGET_DIR)/usr/lib/systemd/system/default.target
> >  endef
> >
> > -define SYSTEMD_INSTALL_MACHINEID_HOOK
> > -     touch $(TARGET_DIR)/etc/machine-id
> > -endef
>
> This could also probably be replaced with a non-conditional entry in the
> permissions table, see below...
>
> >  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
> > +     SYSTEMD_INSTALL_ENTRY_HOOK \
> >       SYSTEMD_INSTALL_INIT_HOOK \
> > -     SYSTEMD_INSTALL_MACHINEID_HOOK \
> >       SYSTEMD_INSTALL_RESOLVCONF_HOOK
> >
> >  define SYSTEMD_INSTALL_IMAGES_CMDS
> > @@ -532,6 +542,10 @@ endef
> >
> >  SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_INSTALL_NSSCONFIG_HOOK
> >
> > +define SYSTEMD_PERMISSIONS
> > +     $(if $(SYSTEMD_TIMESYNCD_USER),/var/lib/systemd/timesync d 755
> systemd-timesync systemd-timesync - - - - -)
> > +endef
>
> We usually do not use conditional in the permissions tables, but define
> conditional variables that we then re-use (see above):
>
>     define SYSTEMD_PERMISSIONS
>         /etc/machine-id f 644 0 0 - - - - -
>         $(SYSTEMD_LOGIND_PERMISIONS)
>         $(SYSTEMD_TIMESYNCD_PERMISIONS)
>         ...
>     endef
>
> Regards,
> Yann E. MORIN.
>
> > +
> >  ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
> >  # systemd provides multiple units to autospawn getty as neede
> >  # * getty at .service to start a getty on normal TTY
> > --
> > 2.27.0
> >
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>


-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200720/bfed6b85/attachment.html>
