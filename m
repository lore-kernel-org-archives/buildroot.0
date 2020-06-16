From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Tue, 16 Jun 2020 08:17:17 +0200
Subject: [Buildroot] [PATCH v2 01/14] package/systemd: configure nss
 plugins in nsswitch.conf
In-Reply-To: <20200615165410.GB2346@scaer>
References: <20200615072055.2083-1-nolange79@gmail.com>
 <20200615072055.2083-2-nolange79@gmail.com>
 <20200615114825.GZ2346@scaer>
 <CADYdroNsfJ1dvjzRyoG6vEamVdNbDqhBtv9qrGXUm-jqSysakw@mail.gmail.com>
 <20200615165410.GB2346@scaer>
Message-ID: <CAFvCimWheKSOE-nYZTpj+vQN+fSV=8jj9J4Be=BapopxfSEP9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>
>
> > At any rate, the file in /usr/share/factory/etc/nsswitch.conf should
> > prolly be kept in sync or removed.
>
> Not sure I understand that one...
>
>
the directories /usr/share/factory/etc and /usr/share/factory/var  will
be automatically copied to /etv and /var very early at boot if those
directories are empty or do not exist.

the point is to be able to boot a totally empty rootfs except for /usr.
Apparently this is a common practice in datacenters, allowing to
have '/' be a tmpfs, /usr being read-only and having a completely
stateless boot.

That's actually pretty cool, and I had the idea of enabling this in
buildroot at some point.
For me there are two cases that buildroot should handle

* either empty entirely /usr/share/factory at the end of the boot
  and disable the feature entirely to save staff
* or automatically copy /etc and /var to the factory at the end
  of the boot to make this feature work reliably.

Anyway, a proper handling of that feature is probably a
completely different patchset...


> > >  2. we already have other packages that may tweak that file, like:
> > >     package/nss-mdns/nss-mdns.mk
> > >     package/nss-myhostname/nss-myhostname.mk
> > >
> > >  3. which brings us to the point that this file should be tweaked as a
> > >     target-finalize hook
> >
> > kinda like this ?:
> >
> https://github.com/nolange/buildroot/commit/237eebe9c29c3b8ab68d3abead52e1b7b08e1649
>
> I still think it should be made to be target-finalize hooks, one for
> each option.
>
> Also, I don;t get why you want to use the one in factory, rather than
> tweak the existing /etc/nsswitch.conf that has already been installed,
> like the other nss plugins do.
>
> And then, at the end. copy the one from /etc/nsswitch.conf over to the
> one in factory. That last one is a bit more tricky to come up with
> correctly, as this must be done after all nss plugins have had a chance
> to tweak nsswitch.conf. So I guess we should extend
> SYSTEMD_ROOTFS_PRE_CMD_HOOKS
> with a new hook that copies /etc/nsswitch.conf over to the factory.
>
> Regards,
> Yann E. MORIN.
>
> > Note that I am missing the line for mymachines, my sed-foo is too weak
> > to add that at the correct position.
> >
> > Norbert
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200616/6f6bd8ed/attachment.html>
