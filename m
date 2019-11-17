From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Sun, 17 Nov 2019 15:19:09 +0100
Subject: [Buildroot] [PATCH 1/2] package/systemd: set machine id file
 instalation as optional choice
In-Reply-To: <0b8bd9be-3109-f998-5a44-cca063d1e207@mind.be>
References: <20191117113345.159653-1-b.bilas@grinn-global.com>
 <0b8bd9be-3109-f998-5a44-cca063d1e207@mind.be>
Message-ID: <CAFvCimUuDJUWzKPA-rX0rqcFNGgNARvD5gdLYqDjR+XVdbgUVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hmmm, I'm kinda torn on that one..

The only difference I see betweed no machine-id and an empty machine-id is
systemd-firstboot and ConditionFirstBoot

if the file is empty or missing and systemd can write to it, systemd will
set it up (not sure what happens for Arnout's symlink, that's worth testing)
however, if the file exists but is empty we will skip systemd-firstboot

for context, systemd-firstboot does the following:
* set (unconditionnaly) a machine-id
* sets the locale (LANG= LC_MESSGES)
* sets the hostname
* sets the timezone
* sets the root password

systemd-firstboot can use values from its command line, but when launched
on the target, the point is usually to prompt the user for answers.
(as a side note, we can call it with --root=$DESTDIR once we have
host-systemd)

So I would tend to consider systemd-firstboot as "an uncommon case" because
prompting user on first boot is not something we see often in the embedded
space

The good news is: we already know when systemd-firstboot is used because
it's a config option of the systemd package.

ConditionFirstBoot is a bit more useful for us.. it allows to easily run a
service only at first boot (or skip it on first boot)

we also have a big clue if the system is meant to be read-only via the
"remount RW" option

So, putting it all together
* if we use systemd-firstboot, we don't want a machine-id
* if we have a read-only rootfs, we want an empty machine-id
* in other cases, we can deal with both, but it's better to have no
machine-id
* I don't think that the concept of first boot makes any sense with a
read-only rootfs...

Could something like that be enough ? can we trust "remount RW" ?
maybe "remount RW" should be renamed "create a RW filesystem" and enable
various tweaks related to RO vs RW

my two cents...


Le dim. 17 nov. 2019 ? 14:39, Arnout Vandecappelle <arnout@mind.be> a
?crit :

>  Hi Bartosz,
>
> On 17/11/2019 12:33, Bartosz Bilas wrote:
> > In case of e.g writable systems there is no neccesity to have
>                  writeable                    necessity
>
> > pre-installed empty machine-id file on target because systemd
> > generates that automatically during system boot.
> > Also in case of having empty machine-id file we are not able
> > to use a service with ConditionFirstBoot because systemd recognizes
> > machine-id file in system therefore we can't detect new system instance
> boots up.
> > Set this option as enable by default to keep compatibility with old
> builds.
>
>  Nice that you take a look at this! I'm immediately going to follow it up
> with
> more feature requests though :-)
>
> - If there is a writeable persistent partition, but /etc is not writeable,
> can
> we create a symlink and will systemd still create it correctly at first
> boot?
>
> - Maybe if BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is set, we should default
> it or
> even force it to no.
>
>
>  Regards,
>  Arnout
>
> >
> > Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> > ---
> >  package/systemd/Config.in  | 13 +++++++++++++
> >  package/systemd/systemd.mk |  2 ++
> >  2 files changed, 15 insertions(+)
> >
> > diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> > index aef39abe27..fadc1a32c8 100644
> > --- a/package/systemd/Config.in
> > +++ b/package/systemd/Config.in
> > @@ -112,6 +112,19 @@ config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
> >       default "x64"   if BR2_x86_64
> >       depends on BR2_PACKAGE_SYSTEMD_BOOT
> >
> > +config BR2_PACKAGE_SYSTEMD_MACHINEID_FILE
> > +     bool "Install empty machine id file"
> > +     default y
> > +     help
> > +       The /etc/machine-id file contains the unique machine ID
> > +       of the local system that is set during installation or
> > +       boot. The machine ID is a single newline-terminated,
> > +       hexadecimal, 32-character, lowercase ID. When decoded from
> > +       hexadecimal, this corresponds to a 16-byte/128-bit value.
> > +       This ID may not be all zeros.
> > +
> > +       https://www.freedesktop.org/software/systemd/man/machine-id.html
> > +
> >  config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
> >       bool "HTTP server for journal events"
> >       select BR2_PACKAGE_LIBMICROHTTPD
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index 92490eb86b..fc348fe120 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -461,9 +461,11 @@ define SYSTEMD_INSTALL_INIT_HOOK
> >
>  $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/remote-fs.target
> >  endef
> >
> > +ifeq ($(BR2_PACKAGE_SYSTEMD_MACHINEID_FILE),y)
> >  define SYSTEMD_INSTALL_MACHINEID_HOOK
> >       touch $(TARGET_DIR)/etc/machine-id
> >  endef
> > +endif
> >
> >  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
> >       SYSTEMD_INSTALL_TARGET_CRYPTSETUP \
> >
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191117/45cea66a/attachment.html>
