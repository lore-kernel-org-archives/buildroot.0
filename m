From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Mon, 18 Nov 2019 17:54:56 +0100
Subject: [Buildroot] [Bug 12301] New: systemd-journal-gatewayd: config
 options broken
In-Reply-To: <1ac26a55-139e-294d-e5b4-7f3aeda3ac0f@mind.be>
References: <bug-12301-163@https.bugs.busybox.net/>
 <1ac26a55-139e-294d-e5b4-7f3aeda3ac0f@mind.be>
Message-ID: <CAFvCimXCU9XaQ6=hWhjeeJ2aXWNWqM8RP9fXB8iGAVnSUGkN1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I don't think it's a fallout of v243, i think it's a bug when adding that
option.

the -Dremote option enables all three binaries (-upload, -gatwayd, -remote)
and I don't see any way to enable them separately.
* -upload allows the target to push log files to an http server
* -gatewayd provides an http server on the target to provide the logs
* -remote is used on the host to pull logs from the target or accept pushes
from the target

the description of the option is pretty clear : 'support for "journal over
the network"'

It does make sense to enable those three separately, but upstream does not
support this. So we can
1) drop the commit and stay with upstream granularity
2) add our own patch to separate the three options

I would recommend 1) for the next stable release, but i'm not sure how to
deal with the long term

The best approach is probably to push upstream to provide more granularity
for the build system, but that is going to be quite a bit of work...


Le mer. 30 oct. 2019 ? 22:07, Arnout Vandecappelle <arnout@mind.be> a
?crit :

>
>
> On 30/10/2019 14:02, bugzilla at busybox.net wrote:
> > https://bugs.busybox.net/show_bug.cgi?id=12301
> [snip]
> > Commit 2dbce34b3a2c8fc1a854395f6c33df658371eae4 added a config option
> > BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE to enable the systemd-journal-remote
> > service.
> >
> > If it is selected the -Dremote=true flag gets explicitly set. If not it
> is
> > explicitly set to false.
> >
> > But as defined in the systemd config (see [0]) -Dremote=true is used to
> enable
> > systemd-journal-remote as well as systemd-journal-gatewayd. There is no
> switch
> > to only build one of them.
>
>  This is probably fallout from the bump to 243. James, could you have a
> look?
>
>  Regards,
>  Arnout
>
> >
> > Further the default value of the -Dremote flag is true (see [1]).
> >
> > So previous to this commit both binaries are already built and installed
> when
> > BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY is set. I verfied this in my built
> > 2019.05.1 image. Both binaries are there.
> >
> >
> > As with this commit, when BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY=Y and
> > BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE=N is set -Dremote=false is explicitly
> set
> > and systemd builds neither of the binaries.
> >
> >
> >
> > So I would suggest to revert this commit as it breaks configs and adds no
> > functionality.
> > Also I would suggest to extend the description of
> > BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY to include a mention of
> > "systemd-journal-remote".
> >
> >
> > Regards,
> > Michael
> >
> > [0] https://github.com/systemd/systemd/blob/master/meson.build#L2207
> > [1] https://github.com/systemd/systemd/blob/master/meson.build#L1253
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191118/367feb80/attachment.html>
