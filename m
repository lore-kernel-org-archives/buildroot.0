From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Wed, 4 Dec 2019 09:53:53 +0100
Subject: [Buildroot] [PATCH] package/php: select SYSTEMD_TMPFILES for
 PHP_SAPI_FPM
In-Reply-To: <CAFvCimXVERj+Gd1y-NyVvcSKYsP0iDWrSG9UORE8j56ZK5Arog@mail.gmail.com>
References: <20191122093930.7933-1-p.debruijn@unilogic.nl>
 <20191125221009.4c31d0d6@windsurf>
 <CAFvCimXVERj+Gd1y-NyVvcSKYsP0iDWrSG9UORE8j56ZK5Arog@mail.gmail.com>
Message-ID: <CAFvCimX4eYVpcRqAFinCcU65qn3F8a-vE0O+1D1uzw0nPQMNMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, for the special case of PHP, this has been fixed upstream with

https://github.com/systemd/systemd/pull/14207

The official word from upstream is "yes tmpfiles is optional but it should
always be here except for really tiny embedded systems"

So we are good (tmpfile's default is activated)

Ideally, we should backport that PR until upstream adds it to
systemd-stable.

BR
J?r?my


Le mar. 26 nov. 2019 ? 18:45, J?r?my ROSEN <jeremy.rosen@smile.fr> a ?crit :

> systemd-tmpfiles is a small utility provided by systemd to do "file system
> tweaks" early during the boot
>
> The primary use-case is to populate /run early so everything is ready when
> the "real stuff" starts but it can do all sort of things
> * create files
> * remove files
> * write to files
> * adjust file permissions/ACL..
> * create nodes in /dev
>
> systemd-tmpfiles avoids launching dozen of small processes/subshells for
> small adjustment as it is don intraditionnal sysV startup files
>
> systemd-tmpfiles configuration is drop-in based so any package can add
> file in the proper directory to be sure things are created/adjusted at boot
> time.
>
> moreover systemd-tmpfiles is needed to be able to dynamically load modules
> :
> * at boot time, systemd will scan modules in /lib/modules (using modinfo)
> to know all /dev nodes that unloaded modules can handle
> * systemd-tmpfiles will create the corresponding nodes in /dev
> * when a process opens the node, the kernel will block the process and
> call udev
> * udev will find the module to load (using modules.alias)
> * once the module is loaded, the kernel will honor the open request and
> unblock the process.
>
> systemd-tmpfiles is not an optional part of systemd. Buildroot configures
> it that way, but packages are supposed to safely assume it's there on any
> systemd-based system
>
> So I would consider it a bug to have systemd-tmpfiles be optional. I'd
> rather see a patch removing that aspect entirely.
>
> Now... if we want to keep that option (which, again, I don't recommend)
> yes. This patch looks good to me.
>
>
>
> Le lun. 25 nov. 2019 ? 22:10, Thomas Petazzoni <
> thomas.petazzoni at bootlin.com> a ?crit :
>
>> Hello J?r?my,
>>
>> Do you have some feedback about this patch ?
>>
>> Thanks,
>>
>> Thomas
>>
>> On Fri, 22 Nov 2019 10:39:30 +0100
>> Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:
>>
>> > PrivateTmp=true requires SYSTEMD_TMPFILES otherwise the service will
>> > fail to start on boot.
>> >
>> > Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
>> > ---
>> >  package/php/Config.in | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/package/php/Config.in b/package/php/Config.in
>> > index 2469573..b65438a 100644
>> > --- a/package/php/Config.in
>> > +++ b/package/php/Config.in
>> > @@ -39,6 +39,7 @@ config BR2_PACKAGE_PHP_SAPI_CLI
>> >
>> >  config BR2_PACKAGE_PHP_SAPI_FPM
>> >       bool "FPM interface"
>> > +     select BR2_PACKAGE_SYSTEMD_TMPFILES if BR2_PACKAGE_SYSTEMD
>> >       depends on BR2_USE_MMU
>> >       # "Sparc v8 and predecessors are not and will not be supported"
>> >       depends on !BR2_sparc
>>
>>
>>
>> --
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>
>
> --
> [image: SMILE]  <http://www.smile.eu/>
>
> 20 rue des Jardins
> 92600 Asni?res-sur-Seine
> *J?r?my ROSEN*
> Architecte technique
>
> [image: email] jeremy.rosen at smile.fr
> [image: phone]  +33 6 88 25 87 42
> [image: url] http://www.smile.eu
>
> [image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
> <https://www.facebook.com/smileopensource> [image: LinkedIn]
> <https://www.linkedin.com/company/smile> [image: Github]
> <https://github.com/Smile-SA>
>
> [image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
> <https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191204/df5ab6a5/attachment-0001.html>
