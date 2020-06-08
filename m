From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 8 Jun 2020 12:38:13 +0200
Subject: [Buildroot] [PATCH 02/10] package/systemd: add libnss-systemd
 to name resolution
In-Reply-To: <CAFvCimXRUpM8V3yJG=MM8Mq70rRVr2FMt3D5qxRYL0qoUj-07w@mail.gmail.com>
References: <20200206093633.251413-1-nolange79@gmail.com>
 <20200206093633.251413-3-nolange79@gmail.com>
 <20200607114042.GP13972@scaer>
 <CADYdroO0cjnrr_dfUaB=W-Mdn=oqYxsGBdabYs+dVZkAdKXSeg@mail.gmail.com>
 <CAFvCimXRUpM8V3yJG=MM8Mq70rRVr2FMt3D5qxRYL0qoUj-07w@mail.gmail.com>
Message-ID: <CADYdroP19EccKZs=nYzdZJvVPYsfQU45UFNyLcTaBpaE8V+tPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mo., 8. Juni 2020 um 12:09 Uhr schrieb J?r?my ROSEN <jeremy.rosen@smile.fr>:
>
>
>
> Le dim. 7 juin 2020 ? 21:35, Norbert Lange <nolange79@gmail.com> a ?crit :
>>
>> Am So., 7. Juni 2020 um 13:40 Uhr schrieb Yann E. MORIN
>> <yann.morin.1998@free.fr>:
>> >
>> > Nrobert, All,
>> >
>> > On 2020-02-06 10:36 +0100, Norbert Lange spake thusly:
>> > > The feature DynamicUser creates users/groups without
>> > > touching the /etc/{passwd,group} files on disk.
>> > > Adding the dynamic resolver to /etc/nsswitch.conf
>> > > ensures the Names are resolved consistently.
>> > >
>> > > Signed-off-by: Norbert Lange <nolange79@gmail.com>
>> > > ---
>> > >  package/systemd/systemd.mk | 8 ++++++++
>> > >  1 file changed, 8 insertions(+)
>> > >
>> > > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
>> > > index 05b07cfd1b..a390cdd1a9 100644
>> > > --- a/package/systemd/systemd.mk
>> > > +++ b/package/systemd/systemd.mk
>> > > @@ -409,7 +409,15 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
>> > >       touch $(TARGET_DIR)/etc/machine-id
>> > >  endef
>> > >
>> > > +define SYSTEMD_ADD_NSSCONFIG_HOOK
>> > > +     grep >/dev/null '^passwd:.*systemd' $(TARGET_DIR)/etc/nsswitch.conf || \
>> >
>> > While this is valid sytx, we customarily put the redirection at the end
>> > of the command.
>> >
>> > However, in this case, you would want to use 'grep -q', as that does not
>> > output anything.
>>
>> I will do if thats preferred, but I usually redirect because
>>
>> "Portable shell scripts should avoid both -q and -s and should
>> redirect standard and error output to /dev/null instead."
>> (https://www.gnu.org/software/grep/manual/html_node/General-Output-Control.html)
>>
>> >
>> > > +             sed '/^passwd:/ s/$$/ systemd/' $(TARGET_DIR)/etc/nsswitch.conf
>> >
>> > How can that even work? By default, sed will out put to stdout, not
>> > replace in-place.
>>
>> Excellent point.
>>
>> >
>> > This clearly has not been tested (or git-commit --amend was forgotten).
>>
>> It's tested in a way, that I have the resulting file in the rootfs overlay ;)
>>
>> >
>> > In this case, you want to use $(SED) that includes the -i option to do
>> > in-place modifications.
>> >
>> > > +     grep >/dev/null '^group:.*systemd' $(TARGET_DIR)/etc/nsswitch.conf || \
>> >
>> > Ditto grep -q.
>> >
>> > > +             sed '/^group:/ s/$$/ systemd/' $(TARGET_DIR)/etc/nsswitch.conf
>> >
>> > Ditto $(SED).
>> >
>> > Regards,
>> > Yann E. MORIN.
>> >
>> > > +endef
>> > > +
>> > >  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
>> > > +     SYSTEMD_ADD_NSSCONFIG_HOOK \
>> > >       SYSTEMD_INSTALL_INIT_HOOK \
>> > >       SYSTEMD_INSTALL_MACHINEID_HOOK \
>> > >       SYSTEMD_INSTALL_RESOLVCONF_HOOK
>> > > --
>> > > 2.24.1
>> > >
>> >
>> > --
>> > .-----------------.--------------------.------------------.--------------------.
>> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
>> > '------------------------------^-------^------------------^--------------------'
>>
>> Come to think of it, systemd comes with 4 or so nss plugins, maybe
>> it's a better approach
>> to have a fully featured nsswitch.conf in the skeleton and then cut
>> out the plugins that are NOT built?
>> Or use the one from systemd (source: factory/etc/nsswitch.conf), after
>> a sed 's,compat,files,g'
>>
>>
>>
>> Norbert
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
> For the record : systemd's upstream nsswitch.conf
>
> # This file is part of systemd.
>
> passwd:         compat mymachines systemd
> group:          compat mymachines systemd
> shadow:         compat
>
> hosts:          files mymachines resolve [!UNAVAIL=return] dns myhostname
> networks:       files
>
> protocols:      db files
> services:       db files
> ethers:         db files
> rpc:            db files
>
> netgroup:       nis
>
>
> * mymachines add resolution for local (machinectl compatible) containers.
>    It also resolves UID/GID assigned to said-containers
> * systemd adds UID/GID resolution for DynamicUser
>   DynamicUser allows a service to run with a dynamically determined UID,
>   thus simplifying configuration (no need for a line in /etc/passwd)
>
> so independently of "how" I think it makes sense to always enable nss-systemd
> and enable mymachines when systemd-nspawn is compiled in.

Actually I would consider the rootfs broken if no nss-systemd is used,
some services that ship with systemd use this feature and might behave odd.

I havent re-rolled the entire series, but I changed the code to enable systemd,
myhostname and resolve. mymachines is a bit tricky with the placement
in the middle.
(thats why I would prefer using a "full-featured" and just removing
the non-existent ones, doesn't need a check to prevent adding multiple
times either)


>
> --
>
>
> 20 rue des Jardins
> 92600 Asni?res-sur-Seine
>
> J?r?my ROSEN
> Architecte technique
>
>  jeremy.rosen at smile.fr
>   +33 6 88 25 87 42
>  http://www.smile.eu
>
>
>
