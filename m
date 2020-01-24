From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Jan 2020 18:38:09 +0100
Subject: [Buildroot] BR2_EXTERNAL and linux-ext-*.mk
In-Reply-To: <5f9b9342-a3bc-a24e-932e-f11460f28886@mind.be>
References: <CAEyMn7a2qBj2efokN1Au3qek8yNsg_hdjBzntkiC8nCFZ5M=rg@mail.gmail.com>
 <20200123214412.GZ32369@scaer>
 <5f9b9342-a3bc-a24e-932e-f11460f28886@mind.be>
Message-ID: <20200124173809.GA32369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2020-01-23 23:07 +0100, Arnout Vandecappelle spake thusly:
>  I had composed a longish mail with essentially the same contents, but Yann beat
> me to it :-)

Hehe! ;-)

> On 23/01/2020 22:44, Yann E. MORIN wrote:
> > On 2020-01-23 22:08 +0100, Heiko Thiery spake thusly:
> >> I recently recognized that there is the support to have linux patches
> >> located in the BR2_EXTERNAL/linux directory with
> >> c26eafa96cabd597a5cce534133ee0ff996b800c.
> >> ----------  with BR2_EXTERNAL/linux/linux-ext-xxx.mk:
> > [--SNIP--]
> >> # make printvars VARS=LINUX_PKGDIR
> >> LINUX_PKGDIR=/home/hthiery/sources/test-linux/buildroot-external-linux-test/linux/
> >> ----------
> >>
> >> Do I miss something here or is this a bug?
> > 
> > This is a bug, but not a simple one.
> > 
> > FOO_PKGDIR is set based on the last component of the $(MAKEFILES)
> > variable. That variables contains the list of Makefiles that have been
> > included, in the order they've been included, with the top-level
> > Makefile first (left-most), and the last one last (right-most).
> 
> From the info page:
> 
> 'MAKEFILE_LIST'

Yeah, that is MAKEFILE_LIST, not MAKEFILES (I'll admit I did not look it
up before replying)...

> > It turns out that we may have a way out: we do not really care about the
> > order the extensions are included, since all they do is register post
> > hooks. So, if we were to include the extensions from the br2-external
> > trees, then the in-tree ones, we'd be back to the original situation.
>  I had thought of another workaround: replace $(LINUX_PKGDIR) with linux - we
> know that that is the name of the directory. _PKGDIR is used for only two
> things: to find the package patches (and linux has none), and to find the hash
> file. So we'll still loose the hash file.

linux has one conditional patch, which is exactly how Heiko noticed the
issue to beginn with.

> > This is still a bit flaky, because we may end up breaking this again in
> > the future, but I don;t have a better solution (well, we could also have
> > a dummy empty makefile fragment that we explicitly include just right
> > before callign the pkg-generic infra, but that's still fragile).
>  I do have a better solution: my big delayed evaluation change. If most of the
> inner-generic-package evaluation is delayed until the end of makefile processing
> and we just set a few key variables (including _PKGDIR), then we can move the
> call to generic-package much earlier (i.e. before the linux-ext-* include).
> 
>  We can't do that now because linux-ext-* may add dependencies, and those have
> to be set before "$$($(2)_TARGET_CONFIGURE):	| $$($(2)_FINAL_DEPENDENCIES)" is
> evaluated.

Except that rule wil ponly be extended much later, once eveything is
actually parsed.

Do you already have some code for that big overhaul, except for the
little snippet I provided and we discussed on a few months ago?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
