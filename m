From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Nov 2014 22:05:19 +0100
Subject: [Buildroot] github helper is broken
In-Reply-To: <CAAXf6LVZO90SpiTm-PpOxBQ3GHLHtd=WvYp96wVee59tKYd9qQ@mail.gmail.com>
References: <20141113182328.GC3641@free.fr>
 <CAAXf6LVZO90SpiTm-PpOxBQ3GHLHtd=WvYp96wVee59tKYd9qQ@mail.gmail.com>
Message-ID: <20141113210519.GE3641@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-13 20:54 +0100, Thomas De Schampheleire spake thusly:
> On Thu, Nov 13, 2014 at 7:23 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > The github helper is now broken, because GitHub changed their download
> > scheme, again.

The isue has been resolved on the GitHub side: the current scheme we use
works again.

Still, we should strive at finding a long-term solution that is not
subject to such massive breakage.

[--SNIP--]
> Shouldn't we (in addition to actions as discussed below) discuss the
> issue with Github? They may understand our concerns, which surely are
> present for other build systems as well.

Yes, Samuel has volunteered into contacting them, and Maxime named a
name. ;-)

> Of course, we cannot fight every repo hosting site. Google code also
> provides tarballs with scheme version.tar.gz, unfortunately.

Eventually, I'd like we have support for that, too, because it is a pain
to deal with otherwise.

> > The problems with that solution are two fold:
> >   - downloads might take more time than a tarball download, since a
> >     complete repository would probably be bigger than a single tarball;
> >   - we must use the http:// scheme for the URL (because, proxies), so
> >     all packages must now specify FOO_SITE_METHOD = git
> >
> > Although the download time is not much of an issue, the way we are using
> > the github helper for now does not allow for setting more than one
> > variable.
> 
> How do you conclude that the download time is not an issue?

Not an issue in the face of a quick solution for the release. We're in
feature freeze, now.

> Some repos may be significantly larger than the size of one revision,
> we cannot know this in advance. Moreover, the complete repo is
> complete overhead in the Buildroot case.

Yes, but if we're using a tag, we are doing a shallow clone, which is
not significantly larger than the conrresponding tarball.

Only for SHA1s do we need the full clone.

But better a download that works even if it takes some time, rather than
a download that properly does not work. Hence "not much of an issue".

[--SNIP--]
> >   - define the github helper so that it emits the necessary variables:
> >         $(eval $(call github,user,repo))
> >     would expand to:
> >         FOO_SITE = https://github.com/user/repo
> >         FOO_SITE_METHOD = git
> >
> >     That would allow us to introduce new types of forges, like gitorious
> >     of bitbucket.
> >
> >     But that's not so nice, because so far we always relied on only
> >     setting variables, not generating Makefile code.
> >
> >     Also, it implies changing all packages as well.
> 
> A similar strategy (for SITE/SOURCE) was discussed earlier in the
> context of gitorious, following a patch from Alexandre Belloni that
> was proposed earlier.
> See http://lists.busybox.net/pipermail/buildroot/2014-January/086309.html
> and ThomasP's reply:
> http://lists.busybox.net/pipermail/buildroot/2014-January/086495.html

Yes, that has already popped up durring the IRC discussion (and the
reason why I hint at gitorious, too).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
