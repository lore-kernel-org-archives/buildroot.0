From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 24 Jan 2020 08:19:48 +0100
Subject: [Buildroot] BR2_EXTERNAL and linux-ext-*.mk
In-Reply-To: <20200123214412.GZ32369@scaer>
References: <CAEyMn7a2qBj2efokN1Au3qek8yNsg_hdjBzntkiC8nCFZ5M=rg@mail.gmail.com>
 <20200123214412.GZ32369@scaer>
Message-ID: <CAEyMn7arGF8nDmnS4boDoHNZHCbU05DZR=ZEuNYLid66RONzhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Am Do., 23. Jan. 2020 um 22:44 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> On 2020-01-23 22:08 +0100, Heiko Thiery spake thusly:
> > Hi All,
> >
> > I recently recognized that there is the support to have linux patches
> > located in the BR2_EXTERNAL/linux directory with
> > c26eafa96cabd597a5cce534133ee0ff996b800c.
> >
> > While using this feature I noticed that in there seems to go something
> > wrong. Once a file that matchs linux/linux-ext-*.mk is detected the
> > LINUX_PKGDIR is set to the BR2_EXTERNAL/linux path and for example the
> > "0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional" patch
> > fails because the path is no longer valid. Also the hash check for the
> > linux sources fails due to the same reason.
> >
> > Following 2 "make-linux-patch" tries, the first ends without error and
> > the second show the error:
> >
> >
> >
> > ---------- without BR2_EXTERNAL/linux/linux-ext-xxx.mk:
> [--SNIP--]
> > # make printvars VARS=LINUX_PKGDIR
> > LINUX_PKGDIR=linux/
> > --------------------
> >
> > ----------  with BR2_EXTERNAL/linux/linux-ext-xxx.mk:
> [--SNIP--]
> > # make printvars VARS=LINUX_PKGDIR
> > LINUX_PKGDIR=/home/hthiery/sources/test-linux/buildroot-external-linux-test/linux/
> > ----------
> >
> > Do I miss something here or is this a bug?
>
> This is a bug, but not a simple one.
>
> FOO_PKGDIR is set based on the last component of the $(MAKEFILES)
> variable. That variables contains the list of Makefiles that have been
> included, in the order they've been included, with the top-level
> Makefile first (left-most), and the last one last (right-most).
>
> As long as we did support only in-tree linux extensions, all was OK,
> because we would only include Makefiles from the same directory as the
> main linux.mk one, so LINUX_PKGDIR was set to the directory of the last
> linux extension included, which was OK.
>
> But now, we can include extensions from a br2-external tree, and that
> last assumption breaks down.
>
> When we added that support, we only thought about the name of the
> package, which is set based on the latest component of the directory, so
> it had to be 'linux'. But we completely forgot about the _PKGDIR
> variable. The existing comment only spoke about the directory name, not
> the full path, because FOO_PKGCDIR was only introduced after linux
> extensions were.
>
> It turns out that we may have a way out: we do not really care about the
> order the extensions are included, since all they do is register post
> hooks. So, if we were to include the extensions from the br2-external
> trees, then the in-tree ones, we'd be back to the original situation.
>
> This is still a bit flaky, because we may end up breaking this again in
> the future, but I don;t have a better solution (well, we could also have
> a dummy empty makefile fragment that we explicitly include just right
> before callign the pkg-generic infra, but that's still fragile).

Thank you for the detailed explanation. That make a lot of things more
clear to me.

> Care to test and properly send: http://code.bulix.org/4fcw7l-1104853?raw

I just tested the changes and indeed this solves the problem. How to
handle the change?

Should I open a bug in bugzilla for tracking?

> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

BR
--
Heiko
